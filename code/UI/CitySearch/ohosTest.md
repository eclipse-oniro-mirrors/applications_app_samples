# 城市选择案例

## 用例表

| 测试功能                                                         | 预置条件                              | 输入                                     | 预期输出                                                                                                                                        | 是否自动 |测试结果|
|--------------------------------------------------------------|-----------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|------|--------------------------------|
| 在搜索框中可以根据城市首字母模糊搜索出相近的城市，例如输入"a",会出现"阿尔山"，"阿勒泰地区"，"安庆"，"安阳"。 | 	启动城市选择sample                             | 	点击页面上方搜索框，搜索a，会模糊匹配a开头的相关城市。 	        | 点击页面上方搜索框，搜索a，会模糊匹配a开头的相关城市。                                                                                                                | 否    |Pass|
| 下方城市列表通过AlphabetIndexer组件实现拼音索引条，通过滑动选择城市首拼，快速定位相关首拼城市。      | 	启动城市选择sample | 	1.下方城市列表滑动左边城市<br/>2.下方城市列表滑动右边的城市首拼。 | 1.右边的城市首拼跟着左边滑动的城市联动（例如滑动左边的"阿尔山"，"阿勒泰地区"，"安庆"，"安阳"区域时，右边的城市首拼为A，滑动到"北京"，"亳州"等城市，右边的城市首拼为B）。<br/> 2.例如滑动城市首拼时，滑到城市首拼B，左边城市列表快速定位到B开头的城市：北京。 | 否    |Pass|

## 逻辑用例（数据驱动）

以下 2447 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new AlphabetListItemType（构造） | 无 | 117 组输入（CitySearch_AlphabetListItemTypeCtor_0001~0117） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommonConstants（常量契约） | 无 | 12 组输入（CitySearch_CommonConstantsValues_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| searchCities（函数） | 无 | 150 组输入（CitySearch_SearchCities_0001~0150） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| matchedLetterIndexOf（函数） | 无 | 150 组输入（CitySearch_MatchedLetterIndexOf_0001~0150） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| resultCountOf（函数） | 无 | 100 组输入（CitySearch_ResultCountOf_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| submitValueOf（函数） | 无 | 252 组输入（CitySearch_SubmitValueOf_0001~0252） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| showsNoResultToast（函数） | 无 | 50 组输入（CitySearch_ShowsNoResultToast_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| searchStateOf（函数） | 无 | 50 组输入（CitySearch_SearchStateOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| alphabetIndexer（函数） | 无 | 1 组输入（CitySearch_AlphabetIndexer_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| letterAtIndex（函数） | 无 | 240 组输入（CitySearch_LetterAtIndex_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| groupIndexOfLetter（函数） | 无 | 125 组输入（CitySearch_GroupIndexOfLetter_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| groupSizeOf（函数） | 无 | 75 组输入（CitySearch_GroupSizeOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| hotCityAt（函数） | 无 | 240 组输入（CitySearch_HotCityAt_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isHotCity（函数） | 无 | 30 组输入（CitySearch_IsHotCity_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| letterOfCity（函数） | 无 | 30 组输入（CitySearch_LetterOfCity_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| defaultTexts（函数） | 无 | 1 组输入（CitySearch_DefaultTexts_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new CitySearchState（构造） | 无 | 1 组输入（CitySearch_CitySearchStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchState.submit（实例方法） | 无 | 180 组输入（CitySearch_CitySearchStateSubmit_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchState.change（实例方法） | 无 | 180 组输入（CitySearch_CitySearchStateChange_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchState.pick（实例方法） | 无 | 180 组输入（CitySearch_CitySearchStatePick_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchState.pickResult（实例方法） | 无 | 30 组输入（CitySearch_CitySearchStatePickResult_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchState flow（调用序列） | 无 | 252 组输入（CitySearch_CitySearchStateFlow_0001~0252） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CitySearchTestBridge（常量契约） | 无 | 1 组输入（CitySearch_CitySearchTestBridgeConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
