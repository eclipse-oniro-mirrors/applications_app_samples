# MyApplicationDemo 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|设备正常运行|		|成功拉起应用|是|Pass|
|设置窗口缩放比例|进入首页|点击确定|窗口以设置的比例缩放，并在页面显示窗口高度和窗口宽度|是|Pass|

## 逻辑用例（数据驱动）

以下 2422 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ratioOfIndex（函数） | 无 | 75 组输入（WindowRatio_RatioOfIndex_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ratioLabelOfIndex（函数） | 无 | 75 组输入（WindowRatio_RatioLabelOfIndex_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| sizeTextOf（函数） | 无 | 120 组输入（WindowRatio_SizeTextOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| heightForWidth（函数） | 无 | 314 组输入（WindowRatio_HeightForWidth_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| widthForHeight（函数） | 无 | 314 组输入（WindowRatio_WidthForHeight_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| roundedHeightForWidth（函数） | 无 | 314 组输入（WindowRatio_RoundedHeightForWidth_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| sizeSummaryOf（函数） | 无 | 314 组输入（WindowRatio_SizeSummaryOf_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| matchesRatio（函数） | 无 | 50 组输入（WindowRatio_MatchesRatio_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| indexOfLabel（函数） | 无 | 90 组输入（WindowRatio_IndexOfLabel_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new RatioPageState（构造） | 无 | 1 组输入（WindowRatio_RatioPageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RatioPageState.select（实例方法） | 无 | 120 组输入（WindowRatio_RatioPageStateSelect_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RatioPageState.onSizeChange（实例方法） | 无 | 314 组输入（WindowRatio_RatioPageStateOnSizeChange_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RatioPageState.apply（实例方法） | 无 | 1 组输入（WindowRatio_RatioPageStateApply_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RatioPageState flow（调用序列） | 无 | 314 组输入（WindowRatio_RatioPageStateFlow_0001~0314） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| WindowRatioLogic（常量契约） | 无 | 6 组输入（WindowRatio_WindowRatioLogicConstants_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
