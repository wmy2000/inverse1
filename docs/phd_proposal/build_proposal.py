"""Build the proposal Word document and roadmap from the accompanying Markdown.
Requirements: python-docx, matplotlib; no experimental data is generated.
"""
from pathlib import Path
import os,re,json
os.environ.setdefault('MPLCONFIGDIR','/tmp/mpl-phd-proposal')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch
from matplotlib.font_manager import FontProperties
from docx import Document
from docx.shared import Cm,Pt,RGBColor
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
P=Path(__file__).resolve().parent
source=(P/'proposal_zh.md').read_text(encoding='utf-8')
font=Path('/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc')
fp=FontProperties(fname=str(font)) if font.exists() else FontProperties()
fig,ax=plt.subplots(figsize=(11,7.2));ax.set_xlim(0,11);ax.set_ylim(0,7.2);ax.axis('off')
items=[('研究点一：物理可达域与单元设计','能控制什么？  模态—复响应—效率与误差','#e6effa'),('研究点二：连续定位信息与编码','能知道什么？  可辨识性—信息界—连续估计','#e7f3ea'),('研究点三：可控边界与鲁棒抗干扰','能抑制什么？  直达/反射—不确定性—实际SINR','#fff1dc'),('研究点四：动态低开销通感决策','何时测量与更新？  信念状态—资源分配—长期净收益','#eee8f7')]
for i,(t,s,c) in enumerate(items):
 y=5.55-i*1.45
 ax.add_patch(FancyBboxPatch((.65,y),9.7,1.02,boxstyle='round,pad=0.06',facecolor=c,edgecolor='#567',linewidth=1.1))
 ax.text(5.5,y+.69,t,ha='center',va='center',fontproperties=fp,fontsize=14)
 ax.text(5.5,y+.26,s,ha='center',va='center',fontproperties=fp,fontsize=11)
 if i<3:ax.annotate('',xy=(5.5,y-.33),xytext=(5.5,y-.06),arrowprops={'arrowstyle':'->','lw':1.5,'color':'#456'})
ax.text(5.5,7,'博士论文研究主线与证据接口',ha='center',va='center',fontproperties=fp,fontsize=17)
ax.text(5.5,.18,'验证链：CST单元 → 有限阵列/标定 → 静态双源 → 动态闭环（均为拟开展）',ha='center',fontproperties=fp,fontsize=10)
fig.savefig(P/'research_roadmap.png',dpi=180,bbox_inches='tight');plt.close(fig)
D=Document();sec=D.sections[0];sec.page_width=Cm(21);sec.page_height=Cm(29.7);sec.top_margin=Cm(2.3);sec.bottom_margin=Cm(2.1);sec.left_margin=Cm(2.6);sec.right_margin=Cm(2.3)
for name in ['Normal','Title','Subtitle','Heading 1','Heading 2','Heading 3','List Number','List Bullet']:
 s=D.styles[name];s.font.name='Calibri';s._element.get_or_add_rPr().rFonts.set(qn('w:eastAsia'),'Noto Serif CJK SC')
 if name=='Normal':
  s.font.size=Pt(11);s.paragraph_format.line_spacing=1.25;s.paragraph_format.space_after=Pt(6)
for name in ['Heading 1','Heading 2','Heading 3']:
 s=D.styles[name];s.font.color.rgb=RGBColor.from_string('203B55');s.paragraph_format.keep_with_next=True
footer=sec.footer.paragraphs[0];footer.alignment=2
footer.add_run('博士开题报告·讨论稿  |  ')
fld=OxmlElement('w:fldSimple');fld.set(qn('w:instr'),'PAGE');footer._p.append(fld)
header=sec.header.paragraphs[0];header.add_run('幅相可编程超表面辅助连续定位与抗干扰通信').font.size=Pt(9)

def inline(par,text):
 for i,x in enumerate(re.split(r'(\*\*.*?\*\*|`[^`]+`)',text)):
  if x.startswith('**') and x.endswith('**'):par.add_run(x[2:-2]).bold=True
  elif x.startswith('`') and x.endswith('`'):par.add_run(x[1:-1]).font.name='Consolas'
  else:par.add_run(x)

def paragraph(text):
 if not text.strip():return
 if text.startswith('【式'):
  a=D.add_paragraph();a.paragraph_format.left_indent=Cm(.4);a.paragraph_format.space_before=Pt(5)
  inline(a,text)
 else:
  par=D.add_paragraph();inline(par,text)

def table(rows):
 split=lambda s:[x.strip() for x in s.strip().strip('|').split('|')]
 header=split(rows[0]);body=[split(r) for r in rows[2:]]
 t=D.add_table(rows=1,cols=len(header));t.style='Light Shading Accent 1'
 for cell,text in zip(t.rows[0].cells,header):inline(cell.paragraphs[0],text)
 # Repeat table headers on multipage tables.
 trpr=t.rows[0]._tr.get_or_add_trPr();repeat=OxmlElement('w:tblHeader');trpr.append(repeat)
 for vals in body:
  for cell,text in zip(t.add_row().cells,vals):
   inline(cell.paragraphs[0],text)
   for r in cell.paragraphs[0].runs:r.font.size=Pt(9)
lines=source.splitlines();i=0;buf=[];toc=False;roadmap=False
while i<len(lines):
 raw=lines[i];line=raw.rstrip()
 if line.startswith('|'):
  paragraph(' '.join(buf));buf=[];rows=[]
  while i<len(lines) and lines[i].startswith('|'):rows.append(lines[i]);i+=1
  table(rows);continue
 if line.startswith('#'):
  paragraph(' '.join(buf));buf=[]
  level=len(line)-len(line.lstrip('#'));text=line[level:].strip()
  if level==1:D.add_heading(text,0)
  elif text.startswith('博士学位'):D.add_paragraph(text,'Subtitle')
  else:
   if text=='摘要' and not toc:
    D.add_page_break();D.add_heading('目录',1)
    mapping_file=P/'toc_pages.json'
    page_map=json.loads(mapping_file.read_text()) if mapping_file.exists() else {}
    toc_titles=[x[3:].strip() for x in source.splitlines() if x.startswith('## ') and not x.startswith('## 博士学位')]
    for item in toc_titles:
     q=D.add_paragraph();q.paragraph_format.space_after=Pt(3);q.paragraph_format.line_spacing=1
     q.paragraph_format.tab_stops.add_tab_stop(Cm(15),2)
     run=q.add_run(item+'\t'+str(page_map.get(item,'')));run.font.size=Pt(10)
    D.add_paragraph('目录页码对应随附PDF。修改正文后应重新检查页码。公式采用可编辑文本；正式提交按学校模板排版。')
    D.add_page_break();toc=True
   D.add_heading(text,min(level-1,3))
   if text.startswith('九、') and not roadmap:
    D.add_picture(str(P/'research_roadmap.png'),width=Cm(15.9));roadmap=True
 elif not line:
  paragraph(' '.join(buf));buf=[]
 elif re.match(r'^\d+\. ',line):
  paragraph(' '.join(buf));buf=[];inline(D.add_paragraph(style='List Number'),re.sub(r'^\d+\. ','',line))
 elif raw.endswith('  '):
  paragraph(' '.join(buf));buf=[];paragraph(line.strip())
 else:buf.append(line.strip())
 i+=1
paragraph(' '.join(buf))
settings=D.settings.element;update=OxmlElement('w:updateFields');update.set(qn('w:val'),'true');settings.append(update)
D.save(P/'PhD_Proposal_Amplitude_Phase_ISAC_zh.docx')
print('Generated Word and roadmap from Markdown:',len(source),'characters')
