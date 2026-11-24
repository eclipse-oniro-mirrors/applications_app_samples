# 页面加载效果实现案例测试用例

## 用例表

| 测试功能         | 预置条件                      | 输入            | 预期输出                                                | 是否自动 | 测试结果 |
|--------------|---------------------------|---------------|-----------------------------------------------------|------|------|
| 访问【页面加载效果实现案例】  | 	启动【页面加载效果实现案例】 | 	访问【页面加载效果实现案例】	 | 进入会出现【页面加载效果实现案例】页面，先出现lottie记载动画，加载完成后消失，页面数据成功加载。 | 是    | Pass |
| 列表加载正常       | 	启动【页面加载效果实现案例】                 | 	向上滑动         | 页面正常加载，无卡顿                                          | 是    | Pass |

## 逻辑用例（数据驱动）

以下 2272 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| CommodityDataSource.totalCount（实例方法） | 无 | 1 组输入（PageLoading_CommodityDataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommodityDataSource.getData（实例方法） | 无 | 30 组输入（PageLoading_CommodityDataSourceGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommodityDataSource flow（调用序列） | 无 | 346 组输入（PageLoading_CommodityDataSourceFlow_0001~0346） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new LottieOptions（构造） | 无 | 1 组输入（PageLoading_LottieOptionsCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| lottieOptions（函数） | 无 | 1 组输入（PageLoading_LottieOptions_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| progressAt（函数） | 无 | 120 组输入（PageLoading_ProgressAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isLoadingAt（函数） | 无 | 50 组输入（PageLoading_IsLoadingAt_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| visibleViewAt（函数） | 无 | 50 组输入（PageLoading_VisibleViewAt_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| progressText（函数） | 无 | 120 组输入（PageLoading_ProgressText_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| clampedProgress（函数） | 无 | 120 组输入（PageLoading_ClampedProgress_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| progressRatio（函数） | 无 | 120 组输入（PageLoading_ProgressRatio_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ticksToFull（函数） | 无 | 75 组输入（PageLoading_TicksToFull_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| productSuffix（函数） | 无 | 120 组输入（PageLoading_ProductSuffix_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| productResourceNames（函数） | 无 | 120 组输入（PageLoading_ProductResourceNames_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| commodityText（函数） | 无 | 346 组输入（PageLoading_CommodityText_0001~0346） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| commodityKey（函数） | 无 | 120 组输入（PageLoading_CommodityKey_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isMockProduct（函数） | 无 | 50 组输入（PageLoading_IsMockProduct_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.advance（实例方法） | 无 | 120 组输入（PageLoading_LoadingTimelineAdvance_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.isLoading（实例方法） | 无 | 1 组输入（PageLoading_LoadingTimelineIsLoading_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.nowProgress（实例方法） | 无 | 1 组输入（PageLoading_LoadingTimelineNowProgress_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.text（实例方法） | 无 | 1 组输入（PageLoading_LoadingTimelineText_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.view（实例方法） | 无 | 1 组输入（PageLoading_LoadingTimelineView_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline.history（实例方法） | 无 | 1 组输入（PageLoading_LoadingTimelineHistory_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LoadingTimeline flow（调用序列） | 无 | 346 组输入（PageLoading_LoadingTimelineFlow_0001~0346） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageLoadingBridge（常量契约） | 无 | 1 组输入（PageLoading_PageLoadingBridgeConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageLoadingLogic（常量契约） | 无 | 10 组输入（PageLoading_PageLoadingLogicConstants_0001~0010） | 返回值与状态逐条符合预期 | 是 | 待执行 |
