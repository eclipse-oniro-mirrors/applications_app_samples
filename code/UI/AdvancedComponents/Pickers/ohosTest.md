# 选择器（Pickers）测试用例归档

> 新增边界与状态用例已在 OpenHarmony 7.1.0.22（API 26）设备执行：5/5 通过；其余用例沿用既有验证结果。

## 用例表

| 用例编号 | 测试功能 | 步骤 | 预期输出 | 结果 |
|---|---|---|---|---|
| Pickers_Launch_001 | 首页拉起 | 冷启动 | 首页与 3 个入口可见 | Pass（实测） |
| Pickers_Breakpoint_001 | 断点/设备信息展示 | 冷启动 | 断点文本包含 breakpoint=，设备文本包含 device= | Pass（实测） |
| Pickers_OpenCalendar_001 | 打开 CalendarPicker | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Pickers_OpenDatePicker_001 | 打开 DatePickerComponent | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Pickers_OpenUIPicker_001 | 打开 UIPickerComponent | 点击入口→返回 | 页面打开并正常返回 | Pass（实测） |
| Pickers_CalendarPage_001 | 日历选择器渲染 | 进入示例 | 已选文本与事件状态正确 | Pass（实测） |
| Pickers_CalendarToday_001 | 今天按钮 | 点击“今天” | 事件为 today，已选年份为当前年 | Pass（实测） |
| Pickers_CalendarBack_001 | 日历页返回 | 点击返回 | 返回首页 | Pass（实测） |
| Pickers_CalendarDialog_001 | 日历弹窗打开/关闭 | 点击日历→返回 | 弹窗打开并关闭，页面正常 | Pass（实测） |
| Pickers_DatePage_001 | 日期模式 | 进入示例 | 日期选择器与 date= 文本可见 | Pass（实测） |
| Pickers_DateModeTime_001 | 时间模式 | 切换“时间” | 时间选择器与 time= 文本可见 | Pass（实测） |
| Pickers_DateModeDateTime_001 | 日期时间模式 | 切换“日期+时间” | 日期时间选择器与 datetime= 文本可见 | Pass（实测） |
| Pickers_DateModeBack_001 | 模式切回 | 时间→日期 | 日期选择器重新出现 | Pass（实测） |
| Pickers_DateAdvanced_001 | 高级参数 | 切换 Lunar/Loop/24h/Seconds | 配置文本四项全部更新，选择器仍可见 | Pass（实测） |
| Pickers_UiPage_001 | 滚轮选择渲染 | 进入示例 | 滚轮存在，默认选中 Todo | Pass（实测） |
| Pickers_UiNext_001 | 下一个 | 点击两次“下一个” | 选中 In progress→Done | Pass（实测） |
| Pickers_UiPrevious_001 | 上一个 | 下一个→上一个 | 回到 Todo | Pass（实测） |
| Pickers_UiBounds_001 | 边界钳制 | 起始上一个；连续 6 次下一个 | 不越界，最终 Review | Pass（实测） |
| Pickers_UiSwipe_001 | 滑动回调 | 关闭循环后滑动滚轮 | onScrollStop 文本更新 | Pass（实测） |
| Pickers_LaunchTime_001 | 启动耗时（L2） | 拉起并等待首页 | 耗时 < 15s | Pass（实测） |
| Pickers_NavigationLoop_001 | 导航稳定性（L2） | Calendar/UIPicker 往返 2 次 | 无崩溃，页面正确返回 | Pass（实测） |
| Pickers_LogicDate_001 | 日期工具单测 | 纯逻辑 | 日期/时间格式化正确 | Pass（实测） |
| Pickers_LogicClamp_001 | 索引工具单测 | 纯逻辑 | 索引钳制与描述正确 | Pass（实测） |
| Pickers_LogicBreakpoint_001 | 断点工具单测 | 纯逻辑 | 断点/Grid 模板/栏数正确 | Pass（实测） |
| Pickers_LogicRange_001 | 区间工具单测 | 纯逻辑 | 区间格式化、判断、日期钳制正确 | Pass（实测） |
| Pickers_LogicConfig_001 | 配置摘要单测 | 纯逻辑 | 四项配置摘要输出正确 | Pass（实测） |
| Pickers_LogicDevice_001 | 设备信息单测 | 纯逻辑 | 设备类型与屏幕信息非空 | Pass（实测） |

## 覆盖矩阵

| 维度 | 覆盖项 | 用例 |
|---|---|---|
| 页面 | 首页、CalendarPicker、DatePickerComponent、UIPickerComponent | 5 条入口用例 |
| CalendarPicker | 渲染、selected/start/end、markToday、弹窗打开关闭、返回 | 4 条 |
| DatePickerComponent | DATE/TIME/DATE_TIME 三模式、高级参数、模式切换 | 5 条 |
| UIPickerComponent | 渲染、selectedIndex、上下切换、边界钳制、canLoop、滑动回调 | 5 条 |
| 非功能 | 启动耗时、导航循环 | 2 条 |
| 工具类 | PickerUtils、BreakpointUtils、DeviceInfoUtils | 6 条逻辑单测 + 本地单测 3 条 |

覆盖统计：页面 4/4、组件 3/3、DatePicker 三模式 3/3、UIPicker 边界、断点 1/2/3 栏、设备信息与日期区间；共 36 条（另有本地单测 3 条）。

## 补充用例

| 用例编号 | 用例名称 | 测试说明 | 结果 |
|---|---|---|---|
| SUB_PICKERS_EDGE_0100 | testPickersEdgeDefaults0001 | 可选日期/时间默认值、纪元与闰日格式 | Pass（实测） |
| SUB_PICKERS_EDGE_0200 | testPickersEdgeWrap0002 | 大幅正负步进、负长度与单元素循环 | Pass（实测） |
| SUB_PICKERS_EDGE_0300 | testPickersEdgeRange0003 | 单点区间、区间内日期钳制与闰日 | Pass（实测） |
| SUB_PICKERS_EDGE_0400 | testPickersEdgeDateBack0004 | DatePicker 返回首页 | Pass（实测） |
| SUB_PICKERS_EDGE_0500 | testPickersEdgeHistory0005 | 日历事件历史与清空空态 | Pass（实测） |
