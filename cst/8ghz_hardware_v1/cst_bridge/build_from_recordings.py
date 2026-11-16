"""Regenerate ideal-load macros from the user's recorded CST 2023 templates.
Does not execute CST or set a solver. Rewrites this tool's generated_2023 files.
"""
from pathlib import Path
import json,re
from expand_loads import template_read,build
BR=Path(__file__).resolve().parent
P=BR.parent
REC=BR/'recorded_2023';GEN=BR/'generated_2023'
GEN.mkdir(exist_ok=True)
rt=template_read(REC/'R_recorded.vba.in','R');ct=template_read(REC/'C_recorded.vba.in','C')
checks=[]
for model,expected in [('unit',2),('array_4x4',32),('array_8x8',128)]:
 text,summary=build(model,rt,ct,'uniform')
 assert len(summary)==expected and text.count('With LumpedElement')==expected
 assert text.count('    .Create')==expected and '{{' not in text
 (GEN/f'AttachLoads_{model}_uniform.bas').write_text(text)
 geom=(P/'models'/model/'BuildGeometry.bas').read_text()
 geom=re.sub(r'^Sub Main\(\)\s*\n','',geom,flags=re.M)
 geom=re.sub(r'^End Sub\s*$','',geom,flags=re.M)
 geom='\n'.join(x for x in geom.splitlines() if not x.strip().startswith('MsgBox'))
 geom=geom.replace("' RF GEOMETRY ONLY. NO LOADS, EXCITATION, SOLVER RUN OR PERFORMANCE CLAIM.","' Geometry section follows; ideal loads are appended below.")
 loads=re.sub(r'^Sub Main\(\)\s*\n','',text,flags=re.M)
 loads=re.sub(r'^End Sub\s*$','',loads,flags=re.M)
 combined="' NEW EMPTY PROJECT ONLY: creates geometry and recorded-API ideal loads.\n' Not run in cloud CST; excitation, boundary and mesh remain to be configured.\nSub Main()\n"+geom+'\n'+loads+'\nEnd Sub\n'
 assert combined.count('Sub Main()')==1 and len(re.findall(r'^End Sub$',combined,re.M))==1
 (GEN/f'BuildGeometryAndLoads_{model}_CST2023.bas').write_text(combined)
 checks.append({'model':model,'load_count':expected,'recorded_API_source':'user CST 2023 History','generated_here':True,'executed_in_cloud_CST':False,'contact_current_verified':False})
(GEN/'generation_checks.json').write_text(json.dumps(checks,indent=2))
print('Generated ideal-load macros for 1/16/64 cells. No CST execution performed.')
