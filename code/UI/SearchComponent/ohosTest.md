# 搜索功能实现案例 测试用例归档

## 用例表

| 测试功能   |预置条件| 输入                                                            | 预期输出               | 是否自动 |测试结果|
|--------|--------------------------------|---------------------------------------------------------------|--------------------|------|--------------------------------|
| 搜索案例功能 | 成功拉起应用 | 1、点击主页搜索框 </br> 2、输入案例名称，点击搜索 </br> 3、点击搜索结果 </br> 4、返回       | 能搜索到案例，且能点击跳转      | 是    |Pass|
| 分类查询功能 | 成功拉起应用 | 1、点击主页搜索框</br>2、点击分类区域</br>3、输入案例名称，点击搜索</br>4、点击搜索结果</br>5、返回 | 分类搜索到案例，且跳转正常      | 是    |Pass|
| 搜索历史功能 | 成功拉起应用 | 1、点击主页搜索框</br>2、点击搜索历史的一项</br>3、返回</br>4、点击删除历史搜索图标</br>5、返回  | 搜索历史支持跳转，且能删除历史搜索  | 是    |Pass|
| 搜索结果列表 | 成功拉起应用 | 1、点击主页搜索框</br>2、输入‘案例’</br>3、滑动搜索结果列表</br>4、点击结果列表项跳转</br>5、返回   | 搜索结果列表支持滑动，且点击跳转正常 | 是    |Pass|

## 逻辑用例（数据驱动）

以下 2446 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new SceneModuleInfo（构造） | 无 | 112 组输入（SearchComponent_SceneModuleInfoCtor_0001~0112） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| inCategory（函数） | 无 | 50 组输入（SearchComponent_InCategory_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| searchScenes（函数） | 无 | 125 组输入（SearchComponent_SearchScenes_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| searchNames（函数） | 无 | 125 组输入（SearchComponent_SearchNames_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| showsNoResultToast（函数） | 无 | 50 组输入（SearchComponent_ShowsNoResultToast_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nextClassifyIndex（函数） | 无 | 349 组输入（SearchComponent_NextClassifyIndex_0001~0349） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| categoryAfterTap（函数） | 无 | 150 组输入（SearchComponent_CategoryAfterTap_0001~0150） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| addToHistory（函数） | 无 | 192 组输入（SearchComponent_AddToHistory_0001~0192） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| moveHistoryToFront（函数） | 无 | 240 组输入（SearchComponent_MoveHistoryToFront_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| historyVisible（函数） | 无 | 50 组输入（SearchComponent_HistoryVisible_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| searchInputWidthOf（函数） | 无 | 349 组输入（SearchComponent_SearchInputWidthOf_0001~0349） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| appUriOf（函数） | 无 | 30 组输入（SearchComponent_AppUriOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| categoryCountOf（函数） | 无 | 30 组输入（SearchComponent_CategoryCountOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new SearchPageState（构造） | 无 | 1 组输入（SearchComponent_SearchPageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchPageState.open（实例方法） | 无 | 1 组输入（SearchComponent_SearchPageStateOpen_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchPageState.input（实例方法） | 无 | 90 组输入（SearchComponent_SearchPageStateInput_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchPageState.tapCategory（实例方法） | 无 | 120 组输入（SearchComponent_SearchPageStateTapCategory_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchPageState.pick（实例方法） | 无 | 30 组输入（SearchComponent_SearchPageStatePick_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchPageState flow（调用序列） | 无 | 349 组输入（SearchComponent_SearchPageStateFlow_0001~0349） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchComponentBridge（常量契约） | 无 | 1 组输入（SearchComponent_SearchComponentBridgeConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SearchComponentLogic（常量契约） | 无 | 2 组输入（SearchComponent_SearchComponentLogicConstants_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
