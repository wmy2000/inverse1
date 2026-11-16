"""Expand user-recorded CST History snippets; does not execute CST.
No proprietary API syntax is invented here. Templates must come from the local GUI.
"""
from pathlib import Path
import argparse,csv,re,json
TOKEN=re.compile(r'\{\{([A-Z0-9_]+)\}\}')
GEOMROOT=Path(__file__).resolve().parents[1]

def template_read(path,kind):
 text=Path(path).read_text(encoding='utf-8-sig')
 tokens=set(TOKEN.findall(text))
 required={'NAME','X1','Y1','Z1','X2','Y2','Z2'}
 if not required.issubset(tokens):raise ValueError(f'{kind}: template needs tokens {sorted(required)}')
 if kind=='R' and 'R_OHM' not in tokens:raise ValueError('R template requires {{R_OHM}}')
 if kind=='C' and not tokens.intersection({'C_F','C_PF'}):raise ValueError('C template requires {{C_F}} or {{C_PF}} matching recorded units')
 if re.search(r'^\s*(Sub\s+Main|End\s+Sub)\b',text,re.I|re.M):raise ValueError('Use only the History command body, without Sub Main/End Sub')
 if not any(line.strip() and not line.lstrip().startswith("'") for line in text.splitlines()):raise ValueError('Template contains comments only')
 return text

def build(model,rt,ct,pattern):
 folder=GEOMROOT/'models'/model
 with (folder/'load_endpoints_SI.csv').open() as f:loads=list(csv.DictReader(f))
 with (folder/'load_patterns.csv').open() as f:states={r['cell']:r for r in csv.DictReader(f) if r['pattern']==pattern}
 if not states:raise ValueError('Pattern not found')
 output=["' GENERATED FROM LOCAL CST RECORDINGS: NOT EXECUTED OR VALIDATED HERE.","' Run ONCE in a clean copy of the matching geometry; do not duplicate existing loads.", 'Sub Main()']
 summary=[]
 for row in loads:
  state=states[row['cell']];r=float(state['R_ohm']);c=float(state['C_pF']);kind='R' if row['kind']=='R_series' else 'C'
  vals={'NAME':row['load'],'R_OHM':f'{r:.16g}','C_PF':f'{c:.16g}','C_F':f'{c*1e-12:.16g}',
        'L_H':row['package_L_H_example'],'L_NH':f"{float(row['package_L_H_example'])*1e9:.16g}",
        'RS_OHM':row['package_R_ohm_example']}
  for end in [1,2]:
   for coord in ['x','y','z']:vals[f'{coord.upper()}{end}']=row[f'P{end}{coord}_mm']
  src=rt if kind=='R' else ct
  unknown=set(TOKEN.findall(src))-set(vals)
  if unknown:raise ValueError(f'Unsupported template tokens: {sorted(unknown)}')
  filled=TOKEN.sub(lambda m:vals[m.group(1)],src)
  if TOKEN.search(filled):raise ValueError('Unresolved token')
  output.extend([f"' Cell {row['cell']} / {kind} / pattern {pattern}",filled])
  summary.append(dict(name=row['load'],cell=row['cell'],kind=kind,R_ohm=r,C_pF=c))
 output.extend(['End Sub',''])
 return '\n'.join(output),summary

def main():
 a=argparse.ArgumentParser(description=__doc__)
 a.add_argument('--model',choices=['unit','array_4x4','array_8x8'],required=True)
 a.add_argument('--r-template',required=True);a.add_argument('--c-template',required=True)
 a.add_argument('--pattern',default='uniform');a.add_argument('--output',required=True)
 v=a.parse_args();out=Path(v.output)
 if out.exists() or out.with_suffix(out.suffix+'.json').exists():raise SystemExit('Refusing to overwrite an existing output or metadata file')
 if not out.parent.is_dir():raise SystemExit('Create the output directory first')
 try:
  rt=template_read(v.r_template,'R');ct=template_read(v.c_template,'C');text,summary=build(v.model,rt,ct,v.pattern)
 except (ValueError,KeyError) as e:raise SystemExit(str(e))
 out.write_text(text,encoding='utf-8')
 out.with_suffix(out.suffix+'.json').write_text(json.dumps({'model':v.model,'pattern':v.pattern,'load_count':len(summary),'CST_executed':False,'units_must_be_verified_in_local_GUI':True,'loads':summary},indent=2))
 print(f'Generated {len(summary)} load snippets in {out}; CST has NOT been executed.')
if __name__=='__main__':main()
