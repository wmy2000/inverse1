"""Draw a functional bias architecture, not a PCB/netlist or EM result."""
from pathlib import Path
import os
os.environ.setdefault('MPLCONFIGDIR','/tmp/mpl-cst-bias')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from matplotlib.font_manager import FontProperties
p=Path(__file__).resolve().parent;font=FontProperties(fname='/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc')
fig,ax=plt.subplots(figsize=(13,5));ax.set_xlim(0,13);ax.set_ylim(0,5);ax.axis('off')
ax.text(6.5,4.7,'四节点、双控制偏置架构（功能图，非已完成PCB）',ha='center',fontproperties=font,fontsize=16)
for y,left,device,n1,n2,col in [(3.4,'反偏电压驱动 V_C','变容管','P_L','P_R','#2866ad'),(1.65,'正向电流驱动 I_R','PIN管','A_L','A_R','#ad6428')]:
 for x,w,text in [(.3,2.0,left),(2.8,1.6,'RF隔离网络'),(5.8,1.3,device),(8.5,1.6,'RF隔离网络'),(10.8,1.9,'DC回流')]:
  ax.add_patch(Rectangle((x,y-.35),w,.7,fill=False,edgecolor=col,lw=1.3));ax.text(x+w/2,y,text,ha='center',va='center',fontproperties=font,fontsize=10)
 for x1,x2 in [(2.3,2.8),(4.4,5.8),(7.1,8.5),(10.1,10.8)]:ax.plot([x1,x2],[y,y],color=col,lw=1.5)
 ax.plot([5.1,7.8],[y,y],'o',color=col,ms=5)
 ax.text(5.1,y+.23,n1,ha='center',fontsize=11);ax.text(7.8,y+.23,n2,ha='center',fontsize=11)
 ax.plot([11.7,11.7,1.2],[y-.35,y-.75,y-.75],color=col,lw=1)
 ax.annotate('',xy=(1.2,y-.35),xytext=(1.2,y-.75),arrowprops={'arrowstyle':'->','color':col,'lw':1})
ax.text(6.5,.2,'四个RF节点保持明确边界；隔离、过孔与回流必须进入电磁模型；极性按器件封装核验。',ha='center',fontproperties=font,fontsize=11)
fig.tight_layout();fig.savefig(p/'bias_architecture.png',dpi=160);plt.close(fig)
