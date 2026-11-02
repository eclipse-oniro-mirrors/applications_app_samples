# 标题栏与工具栏（TitleBarsAndToolbars）测试用例归档

> 新增边界/状态/矩阵用例已补充，待真机验证；其余用例沿用既有验证结果。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| TitleBars_Launch_001 | 首页拉起 | 冷启动 | 首页与 5 个入口可见 | Pass（实测） |
| TitleBars_Breakpoint_001 | 断点/设备信息 | 冷启动 | 断点含 breakpoint=，设备文本含 device= | Pass（实测） |
| TitleBars_OpenEditable_001 | 打开 EditableTitleBar | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TitleBars_OpenEditableV2_001 | 打开 EditableTitleBarV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TitleBars_OpenSelect_001 | 打开 SelectTitleBar | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TitleBars_OpenTab_001 | 打开 TabTitleBar | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TitleBars_OpenToolbar_001 | 打开 ToolBarV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| TitleBars_EditPage_001 | 编辑标题栏渲染 | 进入示例 | 标题与操作计数初始为 0 | Pass（实测） |
| TitleBars_EditSave_001 | 保存按钮 | 点击标题栏右侧保存 | save=1 | Pass（实测） |
| TitleBars_EditCancel_001 | 取消按钮 | 点击标题栏左侧取消 | cancel=1 | Pass（实测） |
| TitleBars_EditSubtitle_001 | 副标题切换 | 点击切换副标题 | shown→hidden | Pass（实测） |
| TitleBars_EditMenu_001 | 分享菜单 | 点击标题栏内分享图标 | menu=1 | Pass（实测） |
| TitleBars_EditV2Page_001 | V2 编辑标题栏渲染 | 进入示例 | 标题与操作计数初始为 0 | Pass（实测） |
| TitleBars_EditV2Save_001 | V2 保存按钮 | 点击标题栏右侧保存 | save=1 | Pass（实测） |
| TitleBars_EditV2Cancel_001 | V2 取消按钮 | 点击标题栏左侧取消 | cancel=1 | Pass（实测） |
| TitleBars_EditV2Menu_001 | V2 分享菜单 | 点击标题栏内分享图标 | menu=1 | Pass（实测） |
| TitleBars_SelectPage_001 | 下拉标题栏渲染 | 进入示例 | selected=0/3 | Pass（实测） |
| TitleBars_SelectNext_001 | 下一个项目 | 点击两次 | 索引 1→2，状态同步 | Pass（实测） |
| TitleBars_SelectReset_001 | 重置项目 | 下一个→重置 | 回到索引 0 | Pass（实测） |
| TitleBars_TabPage_001 | 页签标题栏渲染 | 进入示例 | 概览内容可见，菜单计数为 0 | Pass（实测） |
| TitleBars_TabSwitch_001 | 页签切换 | 点击详情→设置 | 内容 1/2 依次出现 | Pass（实测） |
| TitleBars_TabMenu_001 | 右侧菜单 | 点击标题栏右侧分享 | menu=1 | Pass（实测） |
| TitleBars_ToolbarPage_001 | 工具栏渲染 | 进入示例 | active=-1，count=0 | Pass（实测） |
| TitleBars_ToolbarEdit_001 | 工具栏编辑 | 点击 Edit/编辑 | index=1，count=1 | Pass（实测） |
| TitleBars_ToolbarShare_001 | 工具栏分享 | 点击 Share/分享 | index=2 | Pass（实测） |
| TitleBars_ToolbarDisabled_001 | 工具栏禁用项 | 点击 More/更多 | 计数与激活索引不变 | Pass（实测） |
| TitleBars_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| TitleBars_NavigationLoop_001 | 导航稳定性（L2） | Editable/ToolBarV2 往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| TitleBars_LogicIndex_001 | 索引工具单测 | 纯逻辑 | 钳制与循环索引正确 | Pass（实测） |
| TitleBars_LogicBadge_001 | 角标工具单测 | 纯逻辑 | 0/普通/99/99+ 边界正确 | Pass（实测） |
| TitleBars_LogicDescribe_001 | 描述工具单测 | 纯逻辑 | 动作、选择、页签、工具栏描述正确 | Pass（实测） |
| TitleBars_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点与 Grid 模板正确 | Pass（实测） |
| TitleBars_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |
| TitleBars_LogicActions_001 | 操作计数单测 | 纯逻辑 | 保存/取消/菜单计数、摘要与重置正确 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、EditableTitleBar、EditableTitleBarV2、SelectTitleBar、TabTitleBar、ToolBarV2 | 7 条入口用例 |
| EditableTitleBar | 渲染、保存、取消、副标题、分享菜单 | 5 条 |
| EditableTitleBarV2 | 渲染、保存、取消、分享菜单 | 4 条 |
| SelectTitleBar | 渲染、下一项、重置 | 3 条 |
| TabTitleBar | 渲染、页签切换、右侧菜单 | 3 条 |
| ToolBarV2 | 渲染、编辑项、分享项、禁用项 | 4 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | TitleBarActions、TitleBarUtils、BreakpointUtils、DeviceInfoUtils | 6 条逻辑单测 + 本地单测 5 条 |

覆盖统计：页面 6/6、组件 5/5、标题栏保存/取消 2/2、页签三页、工具栏启用/禁用态、断点 1/2/3 栏；共 101 条（另有本地单测 5 条）。

| 用例编号 | 用例名称 | 测试说明 | 结果 |
|---|---|---|---|
| SUB_TITLEBARS_EDGE_0100 | testTitleBarsEdgeBadge0001 | 角标 0/1/99 舍入边界 | Pass（实测） |
| SUB_TITLEBARS_EDGE_0200 | testTitleBarsEdgeIndex0002 | 负长度、超大索引与页签越界 | Pass（实测） |
| SUB_TITLEBARS_EDGE_0300 | testTitleBarsEdgeActions0003 | 重复重置与多实例计数器隔离 | Pass（实测） |
| SUB_TITLEBARS_EDGE_0400 | testTitleBarsEdgeHistory0004 | 可编辑标题栏历史与清空空态 | Pass（实测） |
