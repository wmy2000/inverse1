"""Reproducible RF geometry, not electromagnetic simulation or production PCB.
Requires cadquery, ezdxf, numpy, matplotlib.
"""
from pathlib import Path
import csv,json,math,hashlib,os
import cadquery as cq
import ezdxf
ROOT=Path(__file__).resolve().parent
CFG=dict(period_mm=12.,h_base_mm=1.5,h_spacer_mm=.8,copper_mm=.035,
 length_phase_mm=9.,length_amplitude_mm=10.5,width_phase_mm=1.2,width_amplitude_mm=1.2,
 gap_mm=.4,offset_y_mm=2.5,cavity_x_mm=2.4,cavity_y_mm=2.8,board_margin_mm=3.,
 epsilon_r=3.55,tan_delta=.0027,target_GHz=8.,fmin_GHz=6.,fmax_GHz=10.)
COLORS={'copper':cq.Color(.8,.38,.12),'substrate':cq.Color(.25,.55,.65,.45),'fill':cq.Color(.7,.7,.3,.45)}

def box(a,b,c,d,e,f):return cq.Solid.makeBox(b-a,d-c,f-e,cq.Vector(a,c,e))
def write_csv(path,rows):
 with path.open('w',newline='',encoding='utf-8') as stream:
  w=csv.DictWriter(stream,fieldnames=list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)

def make_model(n):
 p=CFG['period_mm'];h=CFG['h_base_mm'];t=CFG['copper_mm'];hs=CFG['h_spacer_mm'];gap=CFG['gap_mm'];dy=CFG['offset_y_mm']
 active=n*p; margin=0 if n==1 else CFG['board_margin_mm'];side=active+2*margin;lo=-side/2;hi=side/2
 name='unit' if n==1 else f'array_{n}x{n}'
 dest=ROOT/'models'/name;dest.mkdir(parents=True,exist_ok=True)
 metals=[];cuts=[];cells=[];loads=[];zphase=h+t+hs
 for row in range(n):
  for col in range(n):
   x=(col-(n-1)/2)*p;y=(row-(n-1)/2)*p;cell=f'r{row:02d}_c{col:02d}'
   cells.append(dict(cell=cell,row=row,col=col,center_x_mm=x,center_y_mm=y,R_ohm=50,C_pF=.4))
   for tag,L,w,cy,z in [('amplitude',CFG['length_amplitude_mm'],CFG['width_amplitude_mm'],y+dy,h),('phase',CFG['length_phase_mm'],CFG['width_phase_mm'],y,zphase)]:
    for suffix,a,b in [('left',x-L/2,x-gap/2),('right',x+gap/2,x+L/2)]:
     metals.append((f'{cell}_{tag}_{suffix}',box(a,b,cy-w/2,cy+w/2,z,z+t),'copper'))
    loads.append(dict(cell=cell,row=row,col=col,load=f'{cell}_{tag}',kind='R_series' if tag=='amplitude' else 'C_series',
      P1x_mm=x-gap/2,P1y_mm=cy,P1z_mm=z+t/2,P2x_mm=x+gap/2,P2y_mm=cy,P2z_mm=z+t/2,
      ideal_value_SI=50. if tag=='amplitude' else .4e-12,ideal_unit='ohm' if tag=='amplitude' else 'F',
      package_L_H_example=.4e-9,package_R_ohm_example=0 if tag=='amplitude' else 1.5,
      configuration='NOT_ATTACHED_TO_CST'))
   cuts.append(box(x-CFG['cavity_x_mm']/2,x+CFG['cavity_x_mm']/2,y+dy-CFG['cavity_y_mm']/2,y+dy+CFG['cavity_y_mm']/2,h,zphase))
 cut_comp=cq.Compound.makeCompound(cuts)
 ground=box(lo,hi,lo,hi,-t,0)
 base=box(lo,hi,lo,hi,0,h)
 # Explicit material fills the copper-height plane outside the lower copper.
 # It is NOT an invented vendor adhesive: its dielectric model must be measured/selected.
 lower_metals=[s for label,s,mat in metals if '_amplitude_' in label]
 fill=box(lo,hi,lo,hi,h,h+t).cut(cq.Compound.makeCompound(lower_metals)).cut(cut_comp)
 spacer=box(lo,hi,lo,hi,h+t,zphase).cut(cut_comp)
 parts=[('ground',ground,'copper'),('substrate_base',base,'substrate'),('interlayer_fill',fill,'fill'),('substrate_spacer_with_windows',spacer,'substrate')]+metals
 asm=cq.Assembly(name=name)
 for label,shape,mat in parts:
  if not shape.isValid() or shape.Volume()<=0:raise RuntimeError(f'Invalid solid: {name}/{label}')
  asm.add(shape,name=label,color=COLORS[mat])
 asm.save(str(dest/(name+'.step')))
 # DXF is a mechanical/RF layer view, not a routed PCB/Gerber.
 dxf=ezdxf.new('R2010');dxf.units=4;msp=dxf.modelspace()
 for layer,color in [('BOARD',7),('ACTIVE',8),('COPPER_PHASE',5),('COPPER_AMPLITUDE',30),('GROUND',3),('CAVITY',1),('IDEAL_LOAD',6)]:dxf.layers.new(layer,dxfattribs={'color':color})
 def rect(a,b,c,d,layer):msp.add_lwpolyline([(a,c),(b,c),(b,d),(a,d)],close=True,dxfattribs={'layer':layer})
 rect(lo,hi,lo,hi,'BOARD');rect(-active/2,active/2,-active/2,active/2,'ACTIVE');rect(lo,hi,lo,hi,'GROUND')
 for label,shape,mat in metals:
  b=shape.BoundingBox();rect(b.xmin,b.xmax,b.ymin,b.ymax,'COPPER_PHASE' if '_phase_' in label else 'COPPER_AMPLITUDE')
 for shape in cuts:
  b=shape.BoundingBox();rect(b.xmin,b.xmax,b.ymin,b.ymax,'CAVITY')
 for l in loads:msp.add_line((l['P1x_mm'],l['P1y_mm']),(l['P2x_mm'],l['P2y_mm']),dxfattribs={'layer':'IDEAL_LOAD'})
 if dxf.audit().has_errors:raise RuntimeError('DXF audit failed')
 dxf.saveas(dest/(name+'_layers.dxf'))
 write_csv(dest/'cells.csv',cells);write_csv(dest/'load_endpoints_SI.csv',loads)
 # Uniform, checker, capacitance-ramp and reproducible pseudo-random tests.
 import random
 rng=random.Random(20261116);codebook=[]
 Rs=[1,3,10,20,50,100,150,220,300];Cs=[.12,.18,.24,.32,.4,.5,.62,.75,.9]
 for pattern in ['uniform','R_checker','C_ramp_NOT_phase_ramp','random_seed20261116']:
  for c in cells:
   r=50;cap=.4
   if pattern=='R_checker':r=20 if (c['row']+c['col'])%2==0 else 150
   elif pattern=='C_ramp_NOT_phase_ramp':cap=Cs[round(c['col']*8/max(n-1,1))]
   elif pattern=='random_seed20261116':r=rng.choice(Rs);cap=rng.choice(Cs)
   codebook.append(dict(pattern=pattern,cell=c['cell'],row=c['row'],col=c['col'],R_ohm=r,C_pF=cap))
 write_csv(dest/'load_patterns.csv',codebook)
 # CST geometry history uses only the established command family; no guessed RLC API.
 v=["' RF GEOMETRY ONLY. NO LOADS, EXCITATION, SOLVER RUN OR PERFORMANCE CLAIM.","' Start in a NEW empty CST 3D project; units mm/GHz."]
 for k,val in CFG.items():v.append(f'StoreParameter "{k}", "{val}"')
 v+=['With Units',' .Geometry "mm"',' .Frequency "GHz"','End With']
 for mat in ['substrate','fill']:
  v+=['With Material',' .Reset',f' .Name "Generic_{mat}_NOT_VENDOR_VALIDATED"',' .Type "Normal"',' .Epsilon "epsilon_r"',' .Mue "1"',' .TanD "tan_delta"',' .TanDGiven "True"',' .Create','End With']
 v+=['With Material',' .Reset',' .Name "Copper_v1"',' .Type "Normal"',' .Kappa "5.8e7"',' .Create','End With']
 def vbbrick(label,mat,b):
  v.extend(['With Brick',' .Reset',f' .Name "{label}"',' .Component "RF_geometry"',f' .Material "{mat}"',f' .Xrange "{b.xmin:.9g}", "{b.xmax:.9g}"',f' .Yrange "{b.ymin:.9g}", "{b.ymax:.9g}"',f' .Zrange "{b.zmin:.9g}", "{b.zmax:.9g}"',' .Create','End With'])
 # Construct fill and spacer from panels, then subtract copied cutters without deleting conductors.
 vbbrick('ground','Copper_v1',ground.BoundingBox());vbbrick('substrate_base','Generic_substrate_NOT_VENDOR_VALIDATED',base.BoundingBox())
 vbbrick('interlayer_fill','Generic_fill_NOT_VENDOR_VALIDATED',box(lo,hi,lo,hi,h,h+t).BoundingBox())
 vbbrick('substrate_spacer_with_windows','Generic_substrate_NOT_VENDOR_VALIDATED',box(lo,hi,lo,hi,h+t,zphase).BoundingBox())
 for label,shape,mat in metals:vbbrick(label,'Copper_v1',shape.BoundingBox())
 # Separate sacrificial copper-shaped and cavity tools prevent deleting real resonators.
 for idx,shape in enumerate(lower_metals):
  tool=f'tmp_fill_metal_{idx}';vbbrick(tool,'Vacuum',shape.BoundingBox());v.append(f'Solid.Subtract "RF_geometry:interlayer_fill", "RF_geometry:{tool}"')
 for idx,shape in enumerate(cuts):
  for target in ['interlayer_fill','substrate_spacer_with_windows']:
   tool=f'tmp_window_{target}_{idx}';vbbrick(tool,'Vacuum',shape.BoundingBox());v.append(f'Solid.Subtract "RF_geometry:{target}", "RF_geometry:{tool}"')
 v+=['With Solver',' .FrequencyRange "fmin_GHz", "fmax_GHz"','End With']
 (dest/'BuildGeometry.bas').write_text('Sub Main()\n'+'\n'.join(v)+'\nMsgBox "Geometry created. Loads and excitation remain to be configured."\nEnd Sub\n',encoding='utf-8')
 bounds=[]
 for label,shape,mat in parts:
  b=shape.BoundingBox();bounds.append(dict(name=label,material=mat,volume_mm3=shape.Volume(),bbox_mm=[b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax]))
 summary=dict(name=name,array_n=n,cells=n*n,independent_ideal_loads=len(loads),active_aperture_mm=active,board_side_mm=side,
  thickness_mm=h+hs+3*t,rf_bias_circuit_included=False,material_vendor_validated=False,packages_modeled=False,
  CST_macro_executed=False,CST_loads_attached=False,EM_solved=False,manufacturing_ready=False,parts=bounds)
 (dest/'manifest.json').write_text(json.dumps(summary,indent=2))
 return summary,parts,loads,dest

if __name__=='__main__':
 (ROOT/'parameters.json').write_text(json.dumps(CFG,indent=2))
 for n in [1,4,8]:
  info,parts,loads,dest=make_model(n)
  print(info['name'],'cells=',info['cells'],'solids=',len(parts),'loads=',len(loads),'board=',info['board_side_mm'])
