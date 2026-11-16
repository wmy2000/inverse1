# 用本机CST录制命令建立R/C负载桥接

目的：把实际CST版本产生的集总元件命令重复到单元、4×4和8×8。此工具只展开文本，不执行CST，不意味着已经建立或验证集总元件。请先在本机完成一个单元。

## 已接收的CST 2023记录

用户已经提供R_amp/C_phase的创建History。规范化记录与模板见 `recorded_2023/`；`04e-13`已确认等于0.4 pF。根据这些模板生成的宏在 `generated_2023/`：

- `AttachLoads_*_uniform.bas`：只给相应干净几何副本添加理想负载。
- `BuildGeometryAndLoads_*_CST2023.bas`：仅用于新的空白项目，创建几何并添加负载；激励/边界/网格仍需设置。

当前已有R_amp/C_phase的用户工程不能再附加相同位置的元件。生成宏已做文本计数与坐标检查，未在云端CST执行；用户截图中的对象存在也不代表接触电流和求解已验证。

## 本机需要录制的两个命令片段

1. 在空白几何项目中使用GUI新建一个理想电阻支路（不是离散激励端口），端点分别选下层左右铜片。记录对应History命令。
2. 新建一个理想电容支路，端点选上层左右铜片。记录History命令。
3. 仅复制各器件的History命令主体；不要复制Sub Main/End Sub，不需要更改命令名称或方法拼写。
4. 将器件名称替换为`{{NAME}}`，两端坐标分别替换为`{{X1}} {{Y1}} {{Z1}} {{X2}} {{Y2}} {{Z2}}`。保留本机命令原有引号及单位约定。
5. 电阻数值替换为`{{R_OHM}}`。电容数值按录制单位替换为`{{C_F}}`（法拉）或`{{C_PF}}`（皮法），二者只选与本机API一致的一种。例如GUI中0.4 pF若History记录为4e-13，就使用C_F；不能凭外观猜单位。
6. 分别保存为`R_recorded.vba.in`与`C_recorded.vba.in`。不要创建只有注释的“成功模板”。

模板中至少要含名称、六个端点坐标和该器件数值。若本机History通过Pick拾取实体而不是显式坐标，要先改用该版本支持的坐标输入并重新录制；不能把不同单元仍然连到第一组拾取面。

## 运行工具

本工具本身只需Python标准库；不要求云端有CST。

```text
python expand_loads.py --model unit --r-template R_recorded.vba.in --c-template C_recorded.vba.in --output AttachUnitLoads.bas
python expand_loads.py --model array_4x4 --r-template R_recorded.vba.in --c-template C_recorded.vba.in --output Attach4x4Loads.bas
```

输出分别为2和32个负载（8×8则128个）。在相应**干净几何项目的副本**中运行一次，检查负载数量、端点、值与电流。没有自动删除/覆盖既有负载；换pattern时请使用新的干净几何副本，避免叠加支路。

`--pattern`可取uniform、R_checker、C_ramp_NOT_phase_ramp、random_seed20261116；它们是测试R/C，不是已知相位码。首次只能用uniform排错。几何宏和STEP是两条替代几何入口，不要同时导入造成重叠。

## 寄生模板

后续可由GUI录制串联RLC版本，额外使用`{{L_H}}`/`{{L_NH}}`与`{{RS_OHM}}`。提供的0.4 nH和1.5 Ω只作敏感性示例，不能作为任何特定二极管的已验证模型。PIN支路的R与电容支路的串联R不要混淆。

本工具不设置Floquet端口、有限阵列平面波、边界和网格，也不检查本机VBA接口是否有效。周期单元和有限阵列必须使用各自正确的激励与功率归一化。真实求解与收敛后才能判断幅相性能。
