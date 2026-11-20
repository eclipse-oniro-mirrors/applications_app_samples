# 折叠屏适配案例测试用例

## 用例表

| 测试功能        | 预置条件                | 输入                  | 预期输出                       | 是否自动 | 测试结果 |
|-------------|---------------------|---------------------|----------------------------|------|------|
| 访问【折叠屏适配案例】 | 	启动【折叠屏适配案例】        | 	访问【折叠屏适配案例】	       | 进入会出现【折叠屏适配案例】页面，页面数据成功加载。 | 是    | Pass |
| 列表加载正常      | 	启动【折叠屏适配案例】        | 	上下滑动列表或者左右滑动Swiper | 页面正常加载，无卡顿                 | 是    | Pass |
| 详情页加载正常     | 	启动【折叠屏适配案例】        | 	点击列表或者Swiper       | 进入详情页，页面正常加载，无卡顿           | 是    | Pass |
| 折叠屏适配正常     | 	启动【折叠屏适配案例】或者进入详情页 | 	折叠或者展开折叠屏          | 页面跟随折叠屏状态变化                | 否    | Pass |       
| 折叠屏展开状态     | 	启动【折叠屏适配案例】        | 	点击Swiper           | 进入详情页，详情页全屏展示              | 否    | Pass |       
| 折叠屏展开状态     | 	启动【折叠屏适配案例】        | 	点击列表Item           | 打开详情页，折叠屏左半边显示首页，右半边显示详情页  | 否    | Pass |

## 逻辑用例（数据驱动）

以下 1910 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| BreakpointConstants（常量契约） | 无 | 6 组输入（FoldableAdaptation_BreakpointConstantsValues_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NavMode（常量契约） | 无 | 4 组输入（FoldableAdaptation_NavModeValues_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| breakpointOf（函数） | 无 | 75 组输入（FoldableAdaptation_BreakpointOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| gridColumnsOf（函数） | 无 | 75 组输入（FoldableAdaptation_GridColumnsOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| navModeOfBreakpoint（函数） | 无 | 50 组输入（FoldableAdaptation_NavModeOfBreakpoint_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isFullScreenRoute（函数） | 无 | 30 组输入（FoldableAdaptation_IsFullScreenRoute_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| navigationModeOf（函数） | 无 | 75 组输入（FoldableAdaptation_NavigationModeOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| swiperDisplayCountOf（函数） | 无 | 75 组输入（FoldableAdaptation_SwiperDisplayCountOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| maxItemCountOf（函数） | 无 | 120 组输入（FoldableAdaptation_MaxItemCountOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| tabColumnsOf（函数） | 无 | 105 组输入（FoldableAdaptation_TabColumnsOf_0001~0105） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| columnCountOf（函数） | 无 | 100 组输入（FoldableAdaptation_ColumnCountOf_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| popBranchOf（函数） | 无 | 50 组输入（FoldableAdaptation_PopBranchOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| disablesPopAnimation（函数） | 无 | 50 组输入（FoldableAdaptation_DisablesPopAnimation_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new FoldLayoutState（构造） | 无 | 1 组输入（FoldableAdaptation_FoldLayoutStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutState.resize（实例方法） | 无 | 75 组输入（FoldableAdaptation_FoldLayoutStateResize_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutState.push（实例方法） | 无 | 180 组输入（FoldableAdaptation_FoldLayoutStatePush_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutState.pop（实例方法） | 无 | 1 组输入（FoldableAdaptation_FoldLayoutStatePop_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutState.applyMode（实例方法） | 无 | 1 组输入（FoldableAdaptation_FoldLayoutStateApplyMode_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutState flow（调用序列） | 无 | 833 组输入（FoldableAdaptation_FoldLayoutStateFlow_0001~0833） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldLayoutLogic（常量契约） | 无 | 4 组输入（FoldableAdaptation_FoldLayoutLogicConstants_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
