# 进度与指示器（ProgressAndIndicator）测试用例归档

> 已在 OpenHarmony 7.0.0.47（API 26）设备执行：29/29 通过（IDE 15s 超时配置）。ArcSlider 在手机形态下以限定区域展示，拖拽手势未纳入自动断言，按钮驱动的进度变化已覆盖。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| Progress_Launch_001 | 首页拉起 | 冷启动 | 首页与 4 个入口可见 | Pass（实测） |
| Progress_Breakpoint_001 | 断点/设备信息 | 冷启动 | 断点含 breakpoint=，设备文本含 device= | Pass（实测） |
| Progress_OpenArc_001 | 打开 ArcSlider | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Progress_OpenPB_001 | 打开 ProgressButton | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Progress_OpenPBV2_001 | 打开 ProgressButtonV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Progress_OpenIndicator_001 | 打开 Indicator | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Progress_ArcPage_001 | ArcSlider 渲染 | 进入示例 | progress=40、enlarged=false、event=ready | Pass（实测） |
| Progress_ArcStep_001 | 按钮调整进度 | 减少→增加→设为 80 | 30→40→80，event=set=80 | Pass（实测） |
| Progress_ArcReset_001 | 重置进度 | 增加→重置 | 回到 40，event=set=40 | Pass（实测） |
| Progress_PbPage_001 | 下载按钮渲染 | 进入示例 | 0%、state=idle、enabled=true | Pass（实测） |
| Progress_PbStart_001 | 开始下载 | 点击开始并等待完成 | 100%、state=completed、event=completed | Pass（实测） |
| Progress_PbReset_001 | 下载中重置 | 开始→running→重置 | 0%、state=idle、event=reset | Pass（实测） |
| Progress_PbToggle_001 | 启用/禁用 | 点击两次切换 | enabled=false→true | Pass（实测） |
| Progress_Pbv2Page_001 | V2 按钮渲染 | 进入示例 | 0%、state=idle、enabled=true | Pass（实测） |
| Progress_Pbv2Start_001 | V2 开始下载 | 点击开始并等待完成 | 100%、state=completed | Pass（实测） |
| Progress_Pbv2Reset_001 | V2 下载中重置 | 开始→running→重置 | 0%、state=idle | Pass（实测） |
| Progress_Pbv2Toggle_001 | V2 启用/禁用 | 点击两次切换 | enabled=false→true | Pass（实测） |
| Progress_IndicatorPage_001 | 指示器渲染 | 进入示例 | Page 1、index=0/3、style=dot | Pass（实测） |
| Progress_IndicatorNextPrev_001 | 上一页/下一页 | 下一个×2→上一个 | 索引 1→2→1，标题同步 | Pass（实测） |
| Progress_IndicatorJump_001 | 跳转末页 | 点击跳转末页 | index=2/3，Page 3 | Pass（实测） |
| Progress_IndicatorStyle_001 | 样式切换 | 数字→圆点 | style=digit→dot | Pass（实测） |
| Progress_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| Progress_NavigationLoop_001 | 导航稳定性（L2） | ArcSlider/ProgressButtonV2 往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| Progress_LogicClamp_001 | 进度工具单测 | 纯逻辑 | 钳制、步进、取整、区间反转正确 | Pass（实测） |
| Progress_LogicState_001 | 状态工具单测 | 纯逻辑 | idle/running/completed 与格式化正确 | Pass（实测） |
| Progress_LogicIndicator_001 | 指示器工具单测 | 纯逻辑 | 索引钳制/空集合/描述正确 | Pass（实测） |
| Progress_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点与 Grid 模板正确 | Pass（实测） |
| Progress_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |
| Progress_LogicDownload_001 | 下载会话单测 | 纯逻辑 | 开始/推进/完成/复位状态正确 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、ArcSlider、ProgressButton、ProgressButtonV2、Indicator | 6 条入口用例 |
| ArcSlider | 渲染、初始值、外部增减/重置/设定、事件文本 | 3 条 |
| ProgressButton | 渲染、下载到完成、下载中重置、启用/禁用 | 4 条 |
| ProgressButtonV2 | 渲染、下载到完成、下载中重置、启用/禁用 | 4 条 |
| Indicator | 渲染、上/下页、跳转、圆点/数字样式 | 4 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | ProgressUtils、DownloadSession、BreakpointUtils、DeviceInfoUtils | 6 条逻辑单测 + 本地单测 4 条 |

覆盖统计：页面 5/5、组件 4/4、下载状态 idle/running/completed 3/3、指示器样式 2/2、断点 1/2/3 栏；共 29 条（另有本地单测 4 条）。
