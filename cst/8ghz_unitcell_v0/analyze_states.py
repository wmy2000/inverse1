"""Analyze actual exported co-polar Floquet reflection data, not proxy-model data."""
import argparse,json
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def coverage(z):
 a=np.sort(np.mod(np.angle(z),2*np.pi))
 if len(a)<2:return 0.
 return float(np.rad2deg(2*np.pi-np.max(np.diff(np.r_[a,a[0]+2*np.pi]))))

def main():
 p=argparse.ArgumentParser(); p.add_argument('csv'); p.add_argument('--frequency',type=float,default=8); p.add_argument('--tolerance',type=float,default=.001); p.add_argument('--out',default='analysis_real_CST'); a=p.parse_args()
 d=np.genfromtxt(a.csv,delimiter=',',names=True,encoding='utf-8-sig'); d=np.atleast_1d(d)
 names=['frequency_GHz','Rload_ohm','Cload_pF','s11_real','s11_imag']
 if not d.dtype.names or not set(names).issubset(d.dtype.names): raise SystemExit('Expected columns: '+','.join(names))
 if any(not np.all(np.isfinite(d[n])) for n in names): raise SystemExit('Nonfinite input values')
 if a.tolerance<=0: raise SystemExit('Tolerance must be positive')
 fs=np.unique(d['frequency_GHz']); f=fs[np.argmin(abs(fs-a.frequency))]
 if abs(f-a.frequency)>a.tolerance:raise SystemExit(f'No frequency within tolerance. Nearest is {f} GHz')
 s=d[d['frequency_GHz']==f]; rs=np.unique(s['Rload_ohm']); cs=np.unique(s['Cload_pF'])
 if len(rs)<3 or len(cs)<3:raise SystemExit('At least 3 distinct R and C values are needed for derivative analysis')
 if np.any(rs<=0) or np.any(cs<=0):raise SystemExit('R and C must be positive')
 if len(s)!=len(rs)*len(cs):raise SystemExit('Require one complete rectangular R,C grid at the selected frequency')
 z=np.empty((len(rs),len(cs)),complex)
 for i,r in enumerate(rs):
  for j,c in enumerate(cs):
   b=s[(s['Rload_ohm']==r)&(s['Cload_pF']==c)]
   if len(b)!=1:raise SystemExit(f'Duplicate/missing state R={r}, C={c}')
   z[i,j]=b['s11_real'][0]+1j*b['s11_imag'][0]
 amp=abs(z)
 if np.max(amp)>1.02:raise SystemExit('Magnitude exceeds 1.02. Check power normalization, port selection, units and convergence before analysis.')
 # Dimensionless R,C coordinates; this is NOT a voltage/current Jacobian.
 rn=(rs-rs.min())/np.ptp(rs); cn=(cs-cs.min())/np.ptp(cs)
 dzr,dzc=np.gradient(z,rn,cn,edge_order=2)
 safe=np.maximum(amp,1e-12)
 ar=np.real(np.conj(z)*dzr)/safe; ac=np.real(np.conj(z)*dzc)/safe
 pr=np.imag(np.conj(z)*dzr)/(safe**2*2*np.pi); pc=np.imag(np.conj(z)*dzc)/(safe**2*2*np.pi)
 J=np.stack([np.stack([ar,ac],-1),np.stack([pr,pc],-1)],-2)
 sv=np.linalg.svd(J,compute_uv=False)
 cond=np.divide(sv[...,0],sv[...,1],out=np.full_like(amp,np.nan),where=sv[...,1]>1e-9)
 cond[amp<.1]=np.nan
 out=Path(a.out);out.mkdir(parents=True,exist_ok=True)
 fig,ax=plt.subplots(figsize=(6,6)); q=ax.scatter(z.real,z.imag,c=np.repeat(rs,len(cs)),cmap='viridis');t=np.linspace(0,2*np.pi,300);ax.plot(np.cos(t),np.sin(t),'k--',lw=.7);ax.set(xlabel='Re co-polar S11',ylabel='Im co-polar S11',title=f'Actual imported CST data at {f:g} GHz',aspect='equal');fig.colorbar(q,ax=ax,label='R (ohm)');fig.tight_layout();fig.savefig(out/'state_cloud.png',dpi=180);plt.close(fig)
 fig,axs=plt.subplots(1,2,figsize=(11,4))
 for i,r in enumerate(rs):
  axs[0].plot(cs,20*np.log10(np.maximum(amp[i],1e-12)),'.-',label=f'{r:g} ohm')
  axs[1].plot(cs,np.rad2deg(np.unwrap(np.angle(z[i]))),'.-')
 axs[0].set(xlabel='C (pF)',ylabel='Co-polar reflection (dB)');axs[1].set(xlabel='C (pF)',ylabel='Unwrapped phase (deg)');axs[0].legend(fontsize=7,ncol=2);fig.suptitle(f'Imported CST data: {f:g} GHz');fig.tight_layout();fig.savefig(out/'amplitude_phase.png',dpi=180);plt.close(fig)
 phase_valid=amp>=.1
 summary={'source_file':str(Path(a.csv).resolve()),'frequency_GHz':float(f),'num_states':int(z.size),'amplitude_min':float(amp.min()),'amplitude_max':float(amp.max()),'sampled_circular_phase_coverage_deg_A_ge_0.1':coverage(z[phase_valid]),'coverage_note':'Smallest circular arc containing valid samples; sparse sampling underestimates continuous coverage and does not prove all amplitude-phase combinations reachable.','jacobian_note':'Outputs A and phase/(2pi), controls normalized R and C; not electrical bias Jacobian. Low amplitude or singular states excluded from condition numbers.','median_jacobian_condition':float(np.nanmedian(cond)) if np.any(np.isfinite(cond)) else None,'claim':'Imported-data characterization only; no automatic amplitude-phase decoupling, manufacturing or system-level success claim.'}
 (out/'summary.json').write_text(json.dumps(summary,indent=2),encoding='utf-8')
 import csv
 with (out/'jacobian.csv').open('w',newline='') as fobj:
  w=csv.writer(fobj);w.writerow(['R_ohm','C_pF','A','phase_deg','J_A_Rnorm','J_A_Cnorm','J_phasecycles_Rnorm','J_phasecycles_Cnorm','condition'])
  for i,r in enumerate(rs):
   for j,c in enumerate(cs):w.writerow([r,c,amp[i,j],np.rad2deg(np.angle(z[i,j])),ar[i,j],ac[i,j],pr[i,j],pc[i,j],cond[i,j]])
 print(json.dumps(summary,indent=2))
if __name__=='__main__':main()
