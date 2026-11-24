# 组件随软键盘弹出避让 测试用例归档

## 用例表

| 测试功能                                          | 预置条件                             | 输入                                             | 预期输出                                 | 是否自动 |测试结果|
|-----------------------------------------------|----------------------------------|------------------------------------------------|--------------------------------------|------|--------------------------------|
| 访问组件随软键盘弹出避让，软键盘自动拉起，上抬避让页面组件实现上抬避让           | 1.启动组件随软键盘弹出避让sample             | 访问sample                                       | 页面处于上抬避让页面，键盘处于拉起状态，已实现上抬避让          | 是    |Pass|
| 点击页面空白区域位置，软键盘收起，点击输入框，软键盘拉起                  | 1.启动组件随软键盘弹出避让sample             | 点击非按钮区域实现收起软键盘<br/>点击输入框实现拉起软键盘                | 点击非按钮区域实现收起软键盘，组件正常展示<br/>点击输入框拉起软键盘 | 是    |Pass|
| 点击“缩小避让”按钮，页面切换<br/>点击输入框拉起软键盘，实现组件上抬避让同时实现缩小 | 1.启动组件随软键盘弹出避让sample<br/>2.拉起软键盘 | 点击缩小避让实现页面切换<br/>点击输入框实现拉起软键盘<br/>滑动页面验证组件上抬效果 | 页面切换到缩小避让页面，键盘处于拉起状态，已实现缩小避让         | 是    |Pass|

## 逻辑用例（数据驱动）

以下 2409 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| KeyboardDataSource.getData（实例方法） | 无 | 30 组输入（KeyboardAvoid_KeyboardDataSourceGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardDataSource.totalCount（实例方法） | 无 | 1 组输入（KeyboardAvoid_KeyboardDataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardDataSource flow（调用序列） | 无 | 212 组输入（KeyboardAvoid_KeyboardDataSourceFlow_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| keyboardHeightVpOf（函数） | 无 | 212 组输入（KeyboardAvoid_KeyboardHeightVpOf_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| popUpOpacityOf（函数） | 无 | 50 组输入（KeyboardAvoid_PopUpOpacityOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isKeyboardShown（函数） | 无 | 50 组输入（KeyboardAvoid_IsKeyboardShown_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| bottomPaddingVpOf（函数） | 无 | 212 组输入（KeyboardAvoid_BottomPaddingVpOf_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| resizedHeightOf（函数） | 无 | 212 组输入（KeyboardAvoid_ResizedHeightOf_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| contentHeightOf（函数） | 无 | 212 组输入（KeyboardAvoid_ContentHeightOf_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| liftUpShownAfter（函数） | 无 | 48 组输入（KeyboardAvoid_LiftUpShownAfter_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| scalingShownAfter（函数） | 无 | 48 组输入（KeyboardAvoid_ScalingShownAfter_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| buttonFontColorOf（函数） | 无 | 2 组输入（KeyboardAvoid_ButtonFontColorOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| contentItemAt（函数） | 无 | 120 组输入（KeyboardAvoid_ContentItemAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| gridRowsOf（函数） | 无 | 212 组输入（KeyboardAvoid_GridRowsOf_0001~0212） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| visibleItemsOf（函数） | 无 | 211 组输入（KeyboardAvoid_VisibleItemsOf_0001~0211） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new KeyboardAvoidState（构造） | 无 | 1 组输入（KeyboardAvoid_KeyboardAvoidStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState.onKeyboardHeightChange（实例方法） | 无 | 120 组输入（KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState.pressLiftUp（实例方法） | 无 | 1 组输入（KeyboardAvoid_KeyboardAvoidStatePressLiftUp_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState.pressScaling（实例方法） | 无 | 1 组输入（KeyboardAvoid_KeyboardAvoidStatePressScaling_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState.setAvoidAreaBottom（实例方法） | 无 | 120 组输入（KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState.contentHeight（实例方法） | 无 | 120 组输入（KeyboardAvoid_KeyboardAvoidStateContentHeight_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidState flow（调用序列） | 无 | 211 组输入（KeyboardAvoid_KeyboardAvoidStateFlow_0001~0211） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| KeyboardAvoidLogic（常量契约） | 无 | 3 组输入（KeyboardAvoid_KeyboardAvoidLogicConstants_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
