# 树形、排序与刷新（TreeSortAndRefresh）测试用例归档

> 新增边界/状态/矩阵用例已补充，待真机验证；其余用例沿用既有验证结果。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| TreeSort_Launch_001 | 首页拉起 | 冷启动 | 首页与 6 个入口可见 | Pass（实测） |
| TreeSort_Breakpoint_001 | 断点/设备信息 | 冷启动 | 断点含 breakpoint=，设备文本含 device= | Pass（实测） |
| TreeSort_OpenSpan_001 | 打开 ContainerSpan | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_OpenTree_001 | 打开 TreeView | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_OpenTreeV2_001 | 打开 TreeViewV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_OpenSort_001 | 打开 GridObjectSort | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_OpenForm_001 | 打开 FormMenu | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_OpenRefresh_001 | 打开 SwipeRefresherV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TreeSort_SpanPage_001 | 文本容器渲染 | 进入示例 | ContainerSpan 可见，样式为 dark | Pass（实测） |
| TreeSort_SpanToggle_001 | 样式切换 | 点击两次切换 | dark→light→dark | Pass（实测） |
| TreeSort_TreePage_001 | 树视图渲染 | 进入示例 | 树节点可见，状态为 ready | Pass（实测） |
| TreeSort_TreeClick_001 | 节点点击 | 点击 Documents/文档 | node=0 | Pass（实测） |
| TreeSort_TreeReset_001 | 重置选择 | 点击节点→重置 | 状态恢复 ready | Pass（实测） |
| TreeSort_TreeV2Page_001 | V2 树渲染 | 进入示例 | 树节点可见，状态为 ready | Pass（实测） |
| TreeSort_TreeV2Click_001 | V2 节点点击 | 点击 Documents/文档 | node=0 | Pass（实测） |
| TreeSort_TreeV2Reset_001 | V2 重置选择 | 点击节点→重置 | 状态恢复 ready | Pass（实测） |
| TreeSort_SortPage_001 | 排序组件渲染 | 进入示例 | selected=2，unselected=2 | Pass（实测） |
| TreeSort_SortSave_001 | 编辑新增并保存 | 编辑→添加 Movies/电影→保存 | selected=3 | Pass（实测） |
| TreeSort_SortCancel_001 | 编辑取消 | 编辑→取消 | 状态 cancelled | Pass（实测） |
| TreeSort_FormPage_001 | 菜单页渲染 | 进入示例 | 卡片与等待状态可见 | Pass（实测） |
| TreeSort_RefreshPage_001 | 刷新组件渲染 | 进入示例 | count=0，loading=false | Pass（实测） |
| TreeSort_RefreshStart_001 | 开始刷新 | 点击开始刷新 | loading=true→完成后 count=1 | Pass（实测） |
| TreeSort_RefreshStop_001 | 停止刷新 | 开始→停止 | count=0，loading=false | Pass（实测） |
| TreeSort_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| TreeSort_NavigationLoop_001 | 导航稳定性（L2） | Tree/Refresh 往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| TreeSort_LogicSelected_001 | 选中统计单测 | 纯逻辑 | 选中计数与摘要正确 | Pass（实测） |
| TreeSort_LogicRefresh_001 | 刷新状态单测 | 纯逻辑 | 计数/加载状态格式正确 | Pass（实测） |
| TreeSort_LogicStyle_001 | 样式/表单单测 | 纯逻辑 | 样式切换与表单状态正确 | Pass（实测） |
| TreeSort_LogicTree_001 | 树状态单测 | 纯逻辑 | 节点与标题描述正确 | Pass（实测） |
| TreeSort_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点与 Grid 模板正确 | Pass（实测） |
| TreeSort_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |
| TreeSort_LogicSpec_001 | 树结构单测 | 纯逻辑 | 节点数、根/子节点、查询正确 | Pass（实测） |
| TreeSort_LogicRefreshSession_001 | 刷新状态机单测 | 纯逻辑 | 开始/重复开始/完成/停止/重置正确 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、ContainerSpan、TreeView、TreeViewV2、GridObjectSort、FormMenu、SwipeRefresherV2 | 8 条入口用例 |
| ContainerSpan | 渲染、深/浅样式切换 | 2 条 |
| TreeView / V2 | 渲染、节点点击、重置 | 各 3 条 |
| GridObjectSort | 渲染、编辑新增保存、取消 | 3 条 |
| FormMenu | 菜单页渲染 | 1 条（长按菜单人工验证） |
| SwipeRefresherV2 | 渲染、开始刷新、停止刷新 | 3 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | RefreshController、TreeSpecUtils、TreeSortUtils、BreakpointUtils、DeviceInfoUtils | 8 条逻辑单测 + 本地单测 6 条 |

覆盖统计：页面 6/6、组件 6/6、树节点点击 2/2、排序保存/取消 2/2、刷新开始/停止 2/2、断点 1/2/3 栏；共 102 条（另有本地单测 6 条）。

| 用例编号 | 用例名称 | 测试说明 | 结果 |
|---|---|---|---|
| SUB_TREESORT_EDGE_0100 | testTreeSortEdgeTree0001 | 短/单节点/超长树规格 | Pass（实测） |
| SUB_TREESORT_EDGE_0200 | testTreeSortEdgeRefresh0002 | 空闲完成、停止与重置状态 | Pass（实测） |
| SUB_TREESORT_EDGE_0300 | testTreeSortEdgeSummary0003 | 空选择、重复样式切换与空标题 | Pass（实测） |
| SUB_TREESORT_EDGE_0400 | testTreeSortEdgeHistory0004 | 树操作历史与清空空态 | Pass（实测） |
