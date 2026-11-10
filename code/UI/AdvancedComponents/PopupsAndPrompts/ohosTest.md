# 弹窗与提示（PopupsAndPrompts）测试用例归档

> 新增边界/状态/矩阵用例已补充，待真机验证；其余用例沿用既有验证结果。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| Popups_Launch_001 | 首页拉起 | 冷启动 | 首页与 4 个入口可见 | Pass（实测） |
| Popups_Breakpoint_001 | 断点展示 | 冷启动 | 断点文本包含 breakpoint= | Pass（实测） |
| Popups_OpenPopup_001 | 打开 PopupV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Popups_OpenException_001 | 打开 ExceptionPrompt | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Popups_OpenExceptionV2_001 | 打开 ExceptionPromptV2 | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Popups_OpenSelection_001 | 打开 SelectionMenu | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Popups_PopupPage_001 | PopupV2 渲染 | 进入示例 | 状态为 ready | Pass（实测） |
| Popups_PopupConfirm_001 | 确认按钮 | 点击 Confirm | status=confirm，confirm=1 | Pass（实测） |
| Popups_PopupCancel_001 | 取消按钮 | 点击 Cancel | status=cancel，cancel=1 | Pass（实测） |
| Popups_ExceptionPage_001 | 异常提示渲染 | 进入示例 | 状态为 ready | Pass（实测） |
| Popups_ExceptionAction_001 | 操作文本 | 点击 Settings | status=action，action=1 | Pass（实测） |
| Popups_ExceptionToggle_001 | 隐藏/显示 | 隐藏→再次显示 | status=hidden→shown | Pass（实测） |
| Popups_ExceptionV2Page_001 | V2 异常提示渲染 | 进入示例 | 状态为 ready | Pass（实测） |
| Popups_ExceptionV2Action_001 | V2 操作文本 | 点击 Settings | status=action，action=1 | Pass（实测） |
| Popups_ExceptionV2Toggle_001 | V2 隐藏/显示 | 隐藏→再次显示 | status=hidden→shown | Pass（实测） |
| Popups_SelectionPage_001 | 选择菜单页 | 进入示例 | RichEditor 与设置选区按钮可见 | Pass（实测） |
| Popups_SelectionSet_001 | 设置选区 | 点击“设置选区” | 状态包含 status= 与 start= | Pass（实测） |
| Popups_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| Popups_NavigationLoop_001 | 导航稳定性（L2） | Popup/Selection 往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| Popups_LogicPrompt_001 | 提示工具单测 | 纯逻辑 | 计数/切换/区间描述正确 | Pass（实测） |
| Popups_LogicRange_001 | 区间工具单测 | 纯逻辑 | 区间钳制/交换正确 | Pass（实测） |
| Popups_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点/Grid 模板正确 | Pass（实测） |
| Popups_LogicSelection_001 | 选区/动作摘要单测 | 纯逻辑 | 选区钳制、摘要与动作计数正确 | Pass（实测） |
| Popups_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、PopupV2、ExceptionPrompt、ExceptionPromptV2、SelectionMenu | 6 条入口用例 |
| PopupV2 | 渲染、确认/取消回调与计数 | 3 条 |
| ExceptionPrompt | 渲染、操作文本、隐藏/显示 | 3 条 |
| ExceptionPromptV2 | 渲染、操作文本、隐藏/显示 | 3 条 |
| SelectionMenu | RichEditor、菜单绑定、设置选区回调 | 2 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | PromptUtils、BreakpointUtils、DeviceInfoUtils | 5 条逻辑单测 + 本地单测 2 条 |

覆盖统计：页面 5/5、组件 4/4、显示/隐藏路径 2/2、逻辑工具边界；共 94 条（另有本地单测 2 条）。SelectionMenu 菜单项点击需长按/选中文本触发，当前仅验证绑定与选区，菜单项点击未自动断言。


| 用例编号 | 用例名称 | 测试说明 | 结果 |
|---|---|---|---|
| SUB_POPUPS_EDGE_0100 | testPopupsEdgeRange0001 | 零/负/反向/单项区间边界 | Pass（实测） |
| SUB_POPUPS_EDGE_0200 | testPopupsEdgeSummary0002 | 空标签、负计数与重复切换 | Pass（实测） |
| SUB_POPUPS_EDGE_0300 | testPopupsEdgeBacks0003 | ExceptionPrompt/V2 返回按钮 | Pass（实测） |
