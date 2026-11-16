# inverse1：8 GHz 幅相可编程超表面研究

本仓库保存候选单元建模文件、扫参计划、结果分析脚本和研究方案。文件保存在 Git 仓库内，可通过 GitHub 下载；无需依赖 Codex 工作区的 artifact 下载功能。

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
