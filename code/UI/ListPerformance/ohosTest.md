# 长列表性能（ListPerformance）测试用例归档

> 新增边界与状态用例已在 OpenHarmony 7.1.0.22（API 26）设备执行：4/4 通过；其余用例沿用既有验证结果。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| ListPerf_Launch_001 | 首页拉起 | 冷启动 | 首页与 2 个入口可见 | Pass（实测） |
| ListPerf_Breakpoint_001 | 断点/设备信息 | 冷启动 | 断点含 breakpoint=，设备文本含 device= | Pass（实测） |
| ListPerf_OpenPlaceholder_001 | 打开占位列表 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| ListPerf_OpenPrefetch_001 | 打开预取列表 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| ListPerf_PlaceholderPage_001 | 占位列表渲染 | 进入示例 | 初始 loaded=20/200 | Pass（实测） |
| ListPerf_PlaceholderLoad_001 | 加载更多 | 点击加载更多 | loaded=40/200 | Pass（实测） |
| ListPerf_PlaceholderReset_001 | 重置加载 | 加载更多→重置 | loaded=0/200 | Pass（实测） |
| ListPerf_PlaceholderScroll_001 | 列表存在 | 进入示例 | 占位 List 可见 | Pass（实测） |
| ListPerf_PrefetchPage_001 | 预取列表渲染 | 进入示例 | prefetched=0，loaded=20/200 | Pass（实测） |
| ListPerf_PrefetchNext_001 | 预取一条 | 点击 Prefetch next | prefetched=1，loaded=21/200 | Pass（实测） |
| ListPerf_PrefetchClear_001 | 清空统计 | 预取一条→清空 | prefetched=0 | Pass（实测） |
| ListPerf_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| ListPerf_NavigationLoop_001 | 导航稳定性（L2） | 占位/预取列表往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| ListPerf_LogicRegistry_001 | 占位注册单测 | 纯逻辑 | 单条/范围注册、越界、重置正确 | Pass（实测） |
| ListPerf_LogicBatch_001 | 批次/格式单测 | 纯逻辑 | 批次边界与状态格式正确 | Pass（实测） |
| ListPerf_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点/模板/内容边距正确 | Pass（实测） |
| ListPerf_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |
| ListPerf_LogicController_001 | 占位控制器单测 | 纯逻辑 | 加载/重置/状态与数据源状态正确 | Pass（实测） |
| ListPerf_LogicPrefetchUtils_001 | 预取窗口单测 | 纯逻辑 | 窗口索引边界与格式正确 | Pass（实测） |
| ListPerf_LogicPrefetchSource_001 | 预取数据源单测 | 纯逻辑 | 预取去重、计数、清空统计正确 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、占位列表、预取列表 | 4 条入口用例 |
| 占位列表 | 初始加载、加载更多、重置、LazyForEach 列表 | 4 条 |
| 预取列表 | 初始状态、预取一条、清空统计、滚动窗口 | 3 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | PlaceholderController、PlaceholderRegistry、PrefetchUtils、PrefetchDataSource、ListDataUtils、BreakpointUtils、DeviceInfoUtils | 7 条逻辑单测 + 本地单测 7 条 |

覆盖统计：页面 3/3、占位加载 20/40/0 三种状态、预取 0/1 两种状态、批次与越界边界、断点 1/2 栏；共 26 条（另有本地单测 7 条）。

## 补充用例

| 用例编号 | 用例名称 | 测试说明 | 结果 |
|---|---|---|---|
| SUB_LISTPERF_EDGE_0100 | testListPerformanceEdgeBatch0001 | 零/负/超大批次边界 | Pass（实测） |
| SUB_LISTPERF_EDGE_0200 | testListPerformanceEdgeRegistry0002 | 反向/负/重复占位区间 | Pass（实测） |
| SUB_LISTPERF_EDGE_0300 | testListPerformanceEdgePrefetch0003 | 负窗口、空数据源与窗口耗尽 | Pass（实测） |
| SUB_LISTPERF_EDGE_0400 | testListPerformanceEdgeHistory0004 | 占位列表历史与清空空态 | Pass（实测） |
