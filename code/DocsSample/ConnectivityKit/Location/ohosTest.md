# 位置服务开发指导

## 用例表

| 测试功能          | 预置条件     | 输入              | 预期输出                  | 是否自动  | 测试结果 |
| ----------------- | ------------ | ----------------- | ------------------------|--------- | -------- |
| 应用正常启动     | 设备支持位置服务   | 启动应用           | 进入应用界面，弹出申请定位权限的弹窗 |否 | Pass      |
| 获取单次定位    | 设备支持位置服务，定位权限申请成功，位置服务已打开   | 点击应用界面的定位图标        | 成功获取用户当前定位信息 |否 | Pass      |
| 地理编码功能   | 设备支持位置服务，定位权限申请成功，位置服务已打开   | 点击应用界面的定位图标    | 成功获取用户当前地理信息，改变当前城市   |否 | Pass    |
| 持续定位功能      | 设备支持位置服务，定位权限申请成功，位置服务已打开   | 点击应用界面的持续定位    | 成功获取用户当前定位信息 |否 |Pass      |

## 逻辑用例（数据驱动）

以下 2423 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| alphabetLetters（函数） | 无 | 1 组输入（Location_AlphabetLetters_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| indexOfLetter（函数） | 无 | 75 组输入（Location_IndexOfLetter_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| letterOfIndex（函数） | 无 | 120 组输入（Location_LetterOfIndex_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| groupNamesOf（函数） | 无 | 75 组输入（Location_GroupNamesOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| groupHasProvinces（函数） | 无 | 30 组输入（Location_GroupHasProvinces_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| subCitiesOf（函数） | 无 | 30 组输入（Location_SubCitiesOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| heatCityAt（函数） | 无 | 120 组输入（Location_HeatCityAt_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isHeatCity（函数） | 无 | 30 组输入（Location_IsHeatCity_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| toggleExpanded（函数） | 无 | 331 组输入（Location_ToggleExpanded_0001~0331） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| showsSubCities（函数） | 无 | 50 组输入（Location_ShowsSubCities_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| localityOf（函数） | 无 | 192 组输入（Location_LocalityOf_0001~0192） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| locationTextOf（函数） | 无 | 331 组输入（Location_LocationTextOf_0001~0331） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| totalSelectableCount（函数） | 无 | 1 组输入（Location_TotalSelectableCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new CityPickerState（构造） | 无 | 1 组输入（Location_CityPickerStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.selectHeat（实例方法） | 无 | 120 组输入（Location_CityPickerStateSelectHeat_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.selectGroupItem（实例方法） | 无 | 90 组输入（Location_CityPickerStateSelectGroupItem_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.selectSubCity（实例方法） | 无 | 30 组输入（Location_CityPickerStateSelectSubCity_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.scrollTo（实例方法） | 无 | 120 组输入（Location_CityPickerStateScrollTo_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.setLastLocation（实例方法） | 无 | 331 组输入（Location_CityPickerStateSetLastLocation_0001~0331） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState.locate（实例方法） | 无 | 8 组输入（Location_CityPickerStateLocate_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerState flow（调用序列） | 无 | 331 组输入（Location_CityPickerStateFlow_0001~0331） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LocationMock（常量契约） | 无 | 2 组输入（Location_LocationMockConstants_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CityPickerLogic（常量契约） | 无 | 4 组输入（Location_CityPickerLogicConstants_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
