# inverse1：8 GHz 幅相可编程超表面研究

本仓库保存候选单元建模文件、扫参计划、结果分析脚本和研究方案。文件保存在 Git 仓库内，可通过 GitHub 下载；无需依赖 Codex 工作区的 artifact 下载功能。

## 单元与有限阵列实体几何 v1

本轮优先落地单元、4×4与8×8阵列结构。已生成 STEP 三维实体、DXF 分层图、CST 几何宏、器件端点与测试状态表；修正了旧版未明确填充的铜高层间隙。

- [结构与CST导入说明](cst/8ghz_hardware_v1/README_zh.md)
- [CST 2023：第一研究点实施基线与四节点偏置架构](cst/8ghz_hardware_v1/stage1_design_zh.md)
- [本机R/C负载History桥接工具](cst/8ghz_hardware_v1/cst_bridge/README_zh.md)
- [完整实体几何包 ZIP](downloads/CST_8GHz_geometry_v1.zip)
- [单元 STEP](cst/8ghz_hardware_v1/models/unit/unit.step)
- [4×4 阵列 STEP](cst/8ghz_hardware_v1/models/array_4x4/array_4x4.step)
- [8×8 阵列 STEP](cst/8ghz_hardware_v1/models/array_8x8/array_8x8.step)
- [几何检查记录](cst/8ghz_hardware_v1/geometry_validation.json)

**当前为 RF 几何样机：实体/间隙/器件坐标检查已完成，尚无完整偏置PCB、CST加载/求解或电磁性能结论，不能直接加工。**

## 无人机移动场景参考材料审查

[查看所上传FMCW代码与方向图数据的适用性审查](docs/uav_motion/reference_code_assessment_zh.md)。原论文做过移动无人机实验；所上传压缩包仅含合成回波MATLAB脚本和方向性CSV，没有无人机原始IQ。原附件未上传到本仓库。

## 博士论文开题报告

题目：**幅相可编程超表面辅助连续定位与抗干扰通信关键理论与方法研究**。

四个研究点：真实幅相可达域与任务驱动单元设计；连续定位可辨识性与受限测量编码；抗干扰可控边界与鲁棒编码；信息驱动的低开销动态通感联合决策。

- [在线阅读开题报告](docs/phd_proposal/proposal_zh.md)
- [下载 Word](docs/phd_proposal/PhD_Proposal_Amplitude_Phase_ISAC_zh.docx)
- [在线查看 / 下载 PDF](docs/phd_proposal/PhD_Proposal_Amplitude_Phase_ISAC_zh.pdf)
- [查看研究路线图](docs/phd_proposal/research_roadmap.png)

开题报告为讨论稿，尚未套用学校模板或完成系统查新。所列创新与性能目标均为拟验证内容；不存在已完成的 CST 或硬件实验结果。

## 下载文件

- **[完整 CST 候选单元建模包 ZIP](downloads/CST_8GHz_v01.zip)**：在 GitHub 文件页面右上角选择 **Download raw file / 下载原始文件**。
- **[浏览全部建模源文件](cst/8ghz_unitcell_v0)**：宏、参数、扫描表、分析脚本与中文说明均已解压保存，可逐个查看。
- **[建模操作说明](cst/8ghz_unitcell_v0/README_zh.md)**：可直接在线阅读，无需 Word。
- **[理论与实验研究方案 Word](docs/ISAC_research_plan_zh.docx)**。

也可以在当前分支首页选择 **Code → Download ZIP**，下载整个仓库。若仓库是私有的，需要登录有权限的 GitHub 账号。

## 当前状态

这是以 **8 GHz** 为初始目标的双层电容/电阻加载谐振器候选结构，首轮扫描范围为 **6–10 GHz**。

- 已提供参数化几何宏、81 组电学状态、27 组几何筛选及真实 S 参数分析工具。
- **尚未在 CST 中执行建模宏或求解，没有已验证的 `.cst` 工程或全波仿真结果。**
- Floquet 端口、集总元件、周期边界与网格需按操作说明在本机 CST 中设置和确认。
- 尚未证明幅相解耦能力；不具备直接加工条件。
- 分析脚本的功能自检使用独立数学测试数据，不是电磁仿真验证。

## 建议的第一步

1. 在本机 CST 新建项目，运行 [BuildGeometry.bas](cst/8ghz_unitcell_v0/BuildGeometry.bas)。
2. 按[中文说明](cst/8ghz_unitcell_v0/README_zh.md)设置两个集总元件、Floquet 端口、边界和求解器。
3. 先求解 **R=50 Ω、C=0.4 pF** 的单状态，检查器件连接、参考平面和网格收敛。
4. 再开展电学扫描，将真实复数反射数据交给 [analyze_states.py](cst/8ghz_unitcell_v0/analyze_states.py) 分析。

## 目录

```text
cst/8ghz_unitcell_v0/       候选结构源文件、说明和分析工具
downloads/CST_8GHz_v01.zip 原始完整建模包（13 个文件）
downloads/SHA256SUMS.txt   压缩包校验值
docs/                     理论与实验研究方案
```

源文件与压缩包已核对一致。参考文献原始附件未上传到仓库。
