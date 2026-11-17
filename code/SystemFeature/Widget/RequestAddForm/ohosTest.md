# RequestAddForm 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用拉起|应用已安装|点击桌面图标|应用正常启动并显示主页|Pass|
|应用拉起与权限（Ability，2 条用例）|应用已启动|执行 Ability 测试套|2 条用例全部通过|Pass|
|表单绑定数据模型（FormBindingDataModelCore，50 条用例）|位于测试应用|构造不同表单绑定数据|50 条用例全部通过|Pass|
|卡片尺寸映射（FormDimensionMappingCore，25 条用例）|位于测试应用|传入不同卡片尺寸|25 条用例全部通过|Pass|
|Want 参数模型（WantParamsModelCore，40 条用例）|位于测试应用|构造不同 Want 参数|40 条用例全部通过|Pass|
|主页 UI 状态（IndexPageUiState，12 条用例）|位于测试应用|切换主页状态|12 条用例全部通过|Pass|
|日志工具（LoggerUtilityCore，20 条用例）|位于测试应用|调用日志工具接口|20 条用例全部通过|Pass|

合计 149 条用例，全部通过。

## 逻辑用例（数据驱动）

以下 2343 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| FormDimensionValue（常量契约） | 无 | 4 组输入（RequestAddForm_FormDimensionValueValues_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| publishWantOf（函数） | 无 | 2 组输入（RequestAddForm_PublishWantOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| wantJsonOf（函数） | 无 | 259 组输入（RequestAddForm_WantJsonOf_0001~0259） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| proxyCountOf（函数） | 无 | 2 组输入（RequestAddForm_ProxyCountOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| proxyJsonOf（函数） | 无 | 180 组输入（RequestAddForm_ProxyJsonOf_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| publishLogOf（函数） | 无 | 96 组输入（RequestAddForm_PublishLogOf_0001~0096） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dimensionTextOf（函数） | 无 | 125 组输入（RequestAddForm_DimensionTextOf_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| dimensionOfText（函数） | 无 | 125 组输入（RequestAddForm_DimensionOfText_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isSupportedDimension（函数） | 无 | 50 组输入（RequestAddForm_IsSupportedDimension_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| cellCountOf（函数） | 无 | 125 组输入（RequestAddForm_CellCountOf_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| updateIntervalMinutesOf（函数） | 无 | 240 组输入（RequestAddForm_UpdateIntervalMinutesOf_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| minutesUntilScheduled（函数） | 无 | 259 组输入（RequestAddForm_MinutesUntilScheduled_0001~0259） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| designScaleOf（函数） | 无 | 240 组输入（RequestAddForm_DesignScaleOf_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new FormRequestState（构造） | 无 | 1 组输入（RequestAddForm_FormRequestStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormRequestState.request（实例方法） | 无 | 2 组输入（RequestAddForm_FormRequestStateRequest_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormRequestState.succeed（实例方法） | 无 | 180 组输入（RequestAddForm_FormRequestStateSucceed_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormRequestState.fail（实例方法） | 无 | 180 组输入（RequestAddForm_FormRequestStateFail_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormRequestState flow（调用序列） | 无 | 259 组输入（RequestAddForm_FormRequestStateFlow_0001~0259） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RequestAddFormLogic（常量契约） | 无 | 14 组输入（RequestAddForm_RequestAddFormLogicConstants_0001~0014） | 返回值与状态逐条符合预期 | 是 | 待执行 |
