# Native Notification 测试用例归档

## 用例表

| 测试功能            | 预置条件          | 输入             | 预期输出                                                               | 是否自动 | 测试结果 |
|---------|---------------|-------------|-------------|------|------|
| 拉起应用           | 	设备正常运行       | 		              |  成功拉起应用  | 是    | Pass |
| 查询当前应用通知使能状态           | 	设备正常运行，拉起位于首页       | 		点击查询按钮              |  查询成功，显示查询结果  | 是    | Pass |

## 逻辑用例（数据驱动）

以下 2635 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| px2vpAt（函数） | 无 | 299 组输入（NdkNotification_Px2vpAt_0001~0299） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| vp2pxAt（函数） | 无 | 299 组输入（NdkNotification_Vp2pxAt_0001~0299） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| titleAreaHeightAt（函数） | 无 | 120 组输入（NdkNotification_TitleAreaHeightAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dialogTitleHeightAt（函数） | 无 | 120 组输入（NdkNotification_DialogTitleHeightAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dialogTextMarginAt（函数） | 无 | 120 组输入（NdkNotification_DialogTextMarginAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dialogTextRoomAt（函数） | 无 | 299 组输入（NdkNotification_DialogTextRoomAt_0001~0299） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dialogTextWidthOf（函数） | 无 | 120 组输入（NdkNotification_DialogTextWidthOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| checkButtonWidthOf（函数） | 无 | 120 组输入（NdkNotification_CheckButtonWidthOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| titleTextWidthOf（函数） | 无 | 120 组输入（NdkNotification_TitleTextWidthOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| freeSpaceOf（函数） | 无 | 299 组输入（NdkNotification_FreeSpaceOf_0001~0299） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| resultLabelOf（函数） | 无 | 2 组输入（NdkNotification_ResultLabelOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dialogResultTextOf（函数） | 无 | 2 组输入（NdkNotification_DialogResultTextOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| parseDialogResult（函数） | 无 | 30 组输入（NdkNotification_ParseDialogResult_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| napiBooleanOf（函数） | 无 | 2 组输入（NdkNotification_NapiBooleanOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isExportedNapi（函数） | 无 | 30 组输入（NdkNotification_IsExportedNapi_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isBoldWeight（函数） | 无 | 30 组输入（NdkNotification_IsBoldWeight_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| scaledFontOf（函数） | 无 | 299 组输入（NdkNotification_ScaledFontOf_0001~0299） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new NotificationPageState（构造） | 无 | 1 组输入（NdkNotification_NotificationPageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState.check（实例方法） | 无 | 2 组输入（NdkNotification_NotificationPageStateCheck_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState.confirm（实例方法） | 无 | 1 组输入（NdkNotification_NotificationPageStateConfirm_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState.detachController（实例方法） | 无 | 1 组输入（NdkNotification_NotificationPageStateDetachController_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState.dialogText（实例方法） | 无 | 1 组输入（NdkNotification_NotificationPageStateDialogText_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState.tapOutside（实例方法） | 无 | 1 组输入（NdkNotification_NotificationPageStateTapOutside_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPageState flow（调用序列） | 无 | 298 组输入（NdkNotification_NotificationPageStateFlow_0001~0298） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NdkNotificationLogic（常量契约） | 无 | 19 组输入（NdkNotification_NdkNotificationLogicConstants_0001~0019） | 返回值与状态逐条符合预期 | 是 | 待执行 |
