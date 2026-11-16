from pathlib import Path
import csv,json
P=Path(__file__).parent
params={
'p':('12','period mm'),'h1':('1.5','lower dielectric mm'),'h2':('0.8','interlayer dielectric mm'),
 'tcu':('0.035','copper thickness mm'),'Lphase':('9.0','top phase resonator length mm'),
 'Lamp':('10.5','lower dissipative resonator length mm'),'wphase':('1.2','top strip width mm'),
 'wamp':('1.2','lower strip width mm'),'gap':('0.4','loading gap mm'),
 'dy':('2.5','lower resonator transverse offset mm'),'epsr':('3.55','generic substrate relative permittivity'),
 'tand':('0.0027','generic substrate loss tangent'),'Rload':('50','PIN equivalent R ohm'),
 'Cload':('0.4','varactor equivalent C pF'),'Lpin':('0.4','PIN package L nH'),
 'Lvar':('0.4','varactor package L nH'),'Rvar':('1.5','varactor series R ohm'),
 'fmin':('6','frequency GHz'),'fmax':('10','frequency GHz')}
lines=['\' DRAFT GEOMETRY ONLY. Not solved or CST-validated. Units mm/GHz.']
for k,(v,d) in params.items(): lines.append(f'StoreParameter "{k}", "{v}"')
lines+=['With Units',' .Geometry "mm"',' .Frequency "GHz"',' .Time "ns"','End With',
'With Material',' .Reset',' .Name "Generic_Dielectric_NOT_VENDOR_VALIDATED"',' .Type "Normal"',' .Epsilon "epsr"',' .Mue "1"',' .TanD "tand"',' .TanDGiven "True"',' .Create','End With',
'With Material',' .Reset',' .Name "Copper_v0"',' .Type "Normal"',' .Epsilon "1"',' .Mue "1"',' .Kappa "5.8e7"',' .Create','End With']
def brick(name,mat,x1,x2,y1,y2,z1,z2):
 lines.extend(['With Brick',' .Reset',f' .Name "{name}"',' .Component "cell"',f' .Material "{mat}"',f' .Xrange "{x1}", "{x2}"',f' .Yrange "{y1}", "{y2}"',f' .Zrange "{z1}", "{z2}"',' .Create','End With'])
brick('ground','Copper_v0','-p/2','p/2','-p/2','p/2','-tcu','0')
brick('dielectric_lower','Generic_Dielectric_NOT_VENDOR_VALIDATED','-p/2','p/2','-p/2','p/2','0','h1')
brick('dielectric_upper','Generic_Dielectric_NOT_VENDOR_VALIDATED','-p/2','p/2','-p/2','p/2','h1+tcu','h1+tcu+h2')
for name,x1,x2 in [('amp_left','-Lamp/2','-gap/2'),('amp_right','gap/2','Lamp/2')]:
 brick(name,'Copper_v0',x1,x2,'dy-wamp/2','dy+wamp/2','h1','h1+tcu')
for name,x1,x2 in [('phase_left','-Lphase/2','-gap/2'),('phase_right','gap/2','Lphase/2')]:
 brick(name,'Copper_v0',x1,x2,'-wphase/2','wphase/2','h1+tcu+h2','h1+2*tcu+h2')
# A machining access opening, not a finalized bias/manufacturing layout.
brick('access_cutout','Vacuum','-1','1','dy-1','dy+1','h1+tcu','h1+tcu+h2')
lines+=['Solid.Subtract "cell:dielectric_upper", "cell:access_cutout"','With Solver',' .FrequencyRange "fmin", "fmax"','End With']
body='\n'.join(lines)+'\n'
(P/'geometry_history.vba').write_text(body,encoding='utf-8')
(P/'BuildGeometry.bas').write_text('Sub Main()\n'+body+'\nMsgBox "Draft geometry created. Add RLC loads and Floquet setup per README before solving."\nEnd Sub\n',encoding='utf-8')
(P/'parameters.json').write_text(json.dumps({k:{'value':v,'description':d} for k,(v,d) in params.items()},indent=2),encoding='utf-8')
with (P/'electrical_sweep_81.csv').open('w',newline='') as f:
 w=csv.writer(f); w.writerow(['state_id','Rload_ohm','Cload_pF'])
 for i,(r,c) in enumerate((r,c) for r in [1,3,10,20,50,100,150,220,300] for c in [.12,.18,.24,.32,.4,.5,.62,.75,.9]): w.writerow([i,r,c])
with (P/'geometry_screen_27.csv').open('w',newline='') as f:
 w=csv.writer(f); w.writerow(['geometry_id','Lphase_mm','Lamp_mm','h2_mm','Rload_ohm','Cload_pF'])
 for i,(lp,la,hh) in enumerate((lp,la,hh) for lp in [8,9,10] for la in [9.5,10.5,11] for hh in [.5,.8,1.2]): w.writerow([i,lp,la,hh,50,.4])
with (P/'results_template.csv').open('w',newline='') as f:
 csv.writer(f).writerow(['frequency_GHz','Rload_ohm','Cload_pF','s11_real','s11_imag'])
print('Geometry and sweep files generated.')
