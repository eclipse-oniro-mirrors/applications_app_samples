# 下拉刷新与上滑加载案例 测试用例归档

## 用例表

| 测试功能                 | 预置条件          | 输入                              | 预期输出             | 是否自动 | 测试结果 |
|----------------------|---------------|---------------------------------|------------------|------|------|
| 验证上滑列表加载下一页功能        | 成功拉起应用，进入案例页面 | 1.上滑列表到底，提示玩命加载后加载下一页数据         | 1.成功加载下一页        | 是    | Pass |
| 验证列表加载完成后继续上滑提示已经到底了 | 成功拉起应用，进入案例页面 | 1.多次上滑到最后一页，继续上滑                | 1.底部提示列表已经到底     | 是    | Pass |
| 验证下拉列表刷新当前数据功能       | 成功拉起应用，进入案例页面 | 1.下拉列表到顶部，继续下拉出现提示释放刷新当前页面数据时释放 | 1.动画过后重新获取当前列表数据 | 否    | Pass |
| 验证下拉列表刷新下个数据功能       | 成功拉起应用，进入案例页面 | 1.下拉列表到最顶部                      | 1.动画过后刷新下一张列表数据  | 是    | Pass |

## 逻辑用例（数据驱动）

以下 2443 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| BasicDataSource.totalCount（实例方法） | 无 | 1 组输入（PullToRefresh_BasicDataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| BasicDataSource flow（调用序列） | 无 | 59 组输入（PullToRefresh_BasicDataSourceFlow_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| stateName（函数） | 无 | 59 组输入（PullToRefresh_StateName_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isHeaderVisible（函数） | 无 | 50 组输入（PullToRefresh_IsHeaderVisible_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isFooterVisible（函数） | 无 | 50 组输入（PullToRefresh_IsFooterVisible_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| acceptsGesture（函数） | 无 | 50 组输入（PullToRefresh_AcceptsGesture_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isListAtTop（函数） | 无 | 50 组输入（PullToRefresh_IsListAtTop_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refreshDampingOf（函数） | 无 | 59 组输入（PullToRefresh_RefreshDampingOf_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| loadDampingOf（函数） | 无 | 59 组输入（PullToRefresh_LoadDampingOf_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| translateYOfRefresh（函数） | 无 | 59 组输入（PullToRefresh_TranslateYOfRefresh_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| translateYOfLoadMore（函数） | 无 | 59 组输入（PullToRefresh_TranslateYOfLoadMore_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pullDownStateOf（函数） | 无 | 50 组输入（PullToRefresh_PullDownStateOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pullUpStateOf（函数） | 无 | 50 组输入（PullToRefresh_PullUpStateOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shouldStartRefresh（函数） | 无 | 50 组输入（PullToRefresh_ShouldStartRefresh_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shouldStartLoad（函数） | 无 | 50 组输入（PullToRefresh_ShouldStartLoad_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refreshTick（函数） | 无 | 59 组输入（PullToRefresh_RefreshTick_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| loadingTick（函数） | 无 | 59 组输入（PullToRefresh_LoadingTick_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refreshValueAfter（函数） | 无 | 59 组输入（PullToRefresh_RefreshValueAfter_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| loadingValueAfter（函数） | 无 | 59 组输入（PullToRefresh_LoadingValueAfter_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| satelliteCoordinate（函数） | 无 | 59 组输入（PullToRefresh_SatelliteCoordinate_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| satelliteRadius（函数） | 无 | 59 组输入（PullToRefresh_SatelliteRadius_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| drawsRefreshRing（函数） | 无 | 50 组输入（PullToRefresh_DrawsRefreshRing_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pullUpArrowAngle（函数） | 无 | 50 组输入（PullToRefresh_PullUpArrowAngle_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pullUpLoadText（函数） | 无 | 59 组输入（PullToRefresh_PullUpLoadText_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| loadingAngle（函数） | 无 | 59 组输入（PullToRefresh_LoadingAngle_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| listBodyHeight（函数） | 无 | 59 组输入（PullToRefresh_ListBodyHeight_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nextNewsPage（函数） | 无 | 59 组输入（PullToRefresh_NextNewsPage_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| mockFileOfPage（函数） | 无 | 59 组输入（PullToRefresh_MockFileOfPage_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refreshResolveText（函数） | 无 | 2 组输入（PullToRefresh_RefreshResolveText_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isChangePageOf（函数） | 无 | 30 组输入（PullToRefresh_IsChangePageOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refreshTipOf（函数） | 无 | 50 组输入（PullToRefresh_RefreshTipOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| newsPullUpAngle（函数） | 无 | 50 组输入（PullToRefresh_NewsPullUpAngle_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| newsPullUpText（函数） | 无 | 50 组输入（PullToRefresh_NewsPullUpText_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| newsLoadingText（函数） | 无 | 30 组输入（PullToRefresh_NewsLoadingText_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| footerIconSize（函数） | 无 | 59 组输入（PullToRefresh_FooterIconSize_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| footerTextMargin（函数） | 无 | 30 组输入（PullToRefresh_FooterTextMargin_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| canLoadMore（函数） | 无 | 50 组输入（PullToRefresh_CanLoadMore_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| newsCountAfterLoads（函数） | 无 | 59 组输入（PullToRefresh_NewsCountAfterLoads_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new NewsItem（构造） | 无 | 59 组输入（PullToRefresh_NewsItemCtor_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsItem.toString（实例方法） | 无 | 1 组输入（PullToRefresh_NewsItemToString_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsSourceModel.totalCount（实例方法） | 无 | 1 组输入（PullToRefresh_NewsSourceModelTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsSourceModel.getData（实例方法） | 无 | 30 组输入（PullToRefresh_NewsSourceModelGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsSourceModel.ids（实例方法） | 无 | 1 组输入（PullToRefresh_NewsSourceModelIds_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsSourceModel.addNotifications（实例方法） | 无 | 1 组输入（PullToRefresh_NewsSourceModelAddNotifications_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsSourceModel flow（调用序列） | 无 | 59 组输入（PullToRefresh_NewsSourceModelFlow_0001~0059） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| mockNews（函数） | 无 | 58 组输入（PullToRefresh_MockNews_0001~0058） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.move（实例方法） | 无 | 50 组输入（PullToRefresh_PullGestureModelMove_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.release（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelRelease_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.finishRefresh（实例方法） | 无 | 50 组输入（PullToRefresh_PullGestureModelFinishRefresh_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.currentState（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelCurrentState_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.top（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelTop_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.bottom（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelBottom_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.footerText（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelFooterText_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel.arrowAngle（实例方法） | 无 | 1 组输入（PullToRefresh_PullGestureModelArrowAngle_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullGestureModel flow（调用序列） | 无 | 58 组输入（PullToRefresh_PullGestureModelFlow_0001~0058） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.onRefresh（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelOnRefresh_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.onLoadMore（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelOnLoadMore_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.newsCount（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelNewsCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.firstId（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelFirstId_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.listIndex（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelListIndex_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.page（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelPage_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.changesPage（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelChangesPage_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.footer（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelFooter_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.iconSize（实例方法） | 无 | 58 组输入（PullToRefresh_NewsPageModelIconSize_0001~0058） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.angles（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelAngles_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel.tip（实例方法） | 无 | 1 组输入（PullToRefresh_NewsPageModelTip_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NewsPageModel flow（调用序列） | 无 | 58 组输入（PullToRefresh_NewsPageModelFlow_0001~0058） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PullRefreshLogic（常量契约） | 无 | 29 组输入（PullToRefresh_PullRefreshLogicConstants_0001~0029） | 返回值与状态逐条符合预期 | 是 | 待执行 |
