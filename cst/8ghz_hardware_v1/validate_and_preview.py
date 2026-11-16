"""Validate CAD geometry and preview it. This is not an electromagnetic solver."""
from pathlib import Path
import json,csv,math,os
os.environ.setdefault('MPLCONFIGDIR','/tmp/mpl-cst-hardware')
os.environ.setdefault('XDG_CACHE_HOME','/tmp/cache-cst-hardware')
import cadquery as cq
import ezdxf
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
ROOT=Path(__file__).resolve().parent
C=json.loads((ROOT/'parameters.json').read_text())
checks=[]
for name,n in [('unit',1),('array_4x4',4),('array_8x8',8)]:
 p=ROOT/'models'/name;meta=json.loads((p/'manifest.json').read_text())
 model=cq.importers.importStep(str(p/(name+'.step'))).val();solids=model.Solids()
 assert len(solids)==4+4*n*n,(name,len(solids))
 assert all(s.isValid() for s in solids)
 b=model.BoundingBox();side=meta['board_side_mm'];t=C['copper_mm'];h=C['h_base_mm'];hs=C['h_spacer_mm'];N=n*n
 assert abs(b.xlen-side)<1e-6 and abs(b.ylen-side)<1e-6
 assert abs(b.zlen-(h+hs+3*t))<1e-6
 lower_area=(C['length_amplitude_mm']-C['gap_mm'])*C['width_amplitude_mm']
 top_area=(C['length_phase_mm']-C['gap_mm'])*C['width_phase_mm']
 window_area=C['cavity_x_mm']*C['cavity_y_mm']
 copper_window_overlap=(C['cavity_x_mm']-C['gap_mm'])*C['width_amplitude_mm']
 analytic_volume=side**2*t+side**2*h+(side**2-N*(lower_area+window_area-copper_window_overlap))*t+(side**2-N*window_area)*hs+N*(lower_area+top_area)*t
 actual=sum(s.Volume() for s in solids)
 assert abs(actual-analytic_volume)<max(1e-5,analytic_volume*1e-8),(name,actual,analytic_volume)
 # Strict positive-volume intersection checks after AABB pruning.
 bb=[s.BoundingBox() for s in solids];candidates=0
 for i in range(len(solids)):
  for j in range(i):
   a,b=bb[i],bb[j]
   if min(a.xmax,b.xmax)-max(a.xmin,b.xmin)<=1e-7:continue
   if min(a.ymax,b.ymax)-max(a.ymin,b.ymin)<=1e-7:continue
   if min(a.zmax,b.zmax)-max(a.zmin,b.zmin)<=1e-7:continue
   candidates+=1;intersection=solids[i].intersect(solids[j]).Volume()
   assert intersection<1e-7,(name,'overlap',i,j,intersection)
 with (p/'load_endpoints_SI.csv').open() as f:loads=list(csv.DictReader(f))
 assert len(loads)==2*N and len({r['load'] for r in loads})==2*N
 parts={a['name']:a for a in meta['parts']}
 for row in loads:
  kind='amplitude' if row['kind']=='R_series' else 'phase'
  left=parts[row['cell']+'_'+kind+'_left']['bbox_mm'];right=parts[row['cell']+'_'+kind+'_right']['bbox_mm']
  x1,y1,z1=[float(row[k]) for k in ['P1x_mm','P1y_mm','P1z_mm']];x2,y2,z2=[float(row[k]) for k in ['P2x_mm','P2y_mm','P2z_mm']]
  assert abs(x1-left[1])<1e-8 and abs(x2-right[0])<1e-8
  assert left[2]<y1<left[3] and left[4]<z1<left[5]
  assert right[2]<y2<right[3] and right[4]<z2<right[5]
  assert abs(x2-x1-C['gap_mm'])<1e-8
 with (p/'load_patterns.csv').open() as f:patterns=list(csv.DictReader(f))
 assert len(patterns)==4*N
 audit=ezdxf.readfile(p/(name+'_layers.dxf')).audit();assert not audit.has_errors
 checks.append(dict(model=name,solids=len(solids),loads=len(loads),STEP_round_trip_valid=True,all_solids_valid=True,
  no_positive_volume_overlap=True,intersection_candidates_checked=candidates,volume_matches_independent_formula=True,
  load_endpoints_on_distinct_copper_faces=True,DXF_audit_errors=0,EM_validation=False))
 print(name,'CAD validation PASS',flush=True)
(ROOT/'geometry_validation.json').write_text(json.dumps(checks,indent=2))

fig=plt.figure(figsize=(13,5.4))
ax=fig.add_subplot(121,projection='3d')
p=ROOT/'models/unit';meta=json.loads((p/'manifest.json').read_text());unit=cq.importers.importStep(str(p/'unit.step')).val()
# Geometric tessellation of the STEP surfaces. No field or power values are shown.
for solid in unit.Solids():
 bb=solid.BoundingBox();verts,tri=solid.tessellate(.08,.15)
 xyz=np.array([[v.x,v.y,v.z] for v in verts]);tri=np.array(tri)
 thin=bb.zlen<.04
 metal=thin and (bb.zmin<0 or bb.xlen<C['period_mm']/2)
 col='#c16d28' if metal and abs(bb.zmin-C['h_base_mm'])<.01 else ('#2468b4' if metal and bb.zmin>2 else ('#967047' if bb.zmin<0 else '#a1c9c9'))
 alpha=1 if metal else .12
 poly=Poly3DCollection(xyz[tri],facecolor=col,edgecolor='none',alpha=alpha);ax.add_collection3d(poly)
ax.set(xlim=(-6,6),ylim=(-6,6),zlim=(-.1,2.5),xlabel='x (mm)',ylabel='y (mm)',zlabel='z (mm)',title='Unit: actual STEP geometry')
ax.view_init(elev=28,azim=-65);ax.set_box_aspect((1,1,.3))
a=fig.add_subplot(122);p=ROOT/'models/array_4x4';meta=json.loads((p/'manifest.json').read_text());half=meta['board_side_mm']/2
for part in meta['parts']:
 if part['name']=='ground':continue
 b=part['bbox_mm']
 if '_phase_' in part['name'] or '_amplitude_' in part['name']:
  col='#2468b4' if '_phase_' in part['name'] else '#c16d28'
  a.add_patch(Rectangle((b[0],b[2]),b[1]-b[0],b[3]-b[2],facecolor=col,alpha=.8))
a.add_patch(Rectangle((-half,-half),2*half,2*half,fill=False,color='gray'))
a.set(xlim=(-half-2,half+2),ylim=(-half-2,half+2),aspect='equal',xlabel='x (mm)',ylabel='y (mm)',title='4x4 finite array: copper layers overlaid')
fig.suptitle('RF GEOMETRY PROTOTYPES - NOT CST RESULTS / NOT ROUTED PCBs',fontweight='bold')
fig.tight_layout();fig.savefig(ROOT/'structure_overview.png',dpi=170);plt.close(fig)
