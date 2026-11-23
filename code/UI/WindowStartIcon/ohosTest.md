# 启动页实现案例案例 测试用例归档

## 用例表

| 测试功能   | 预置条件               | 输入                       | 预期输出                 | 是否自动 | 测试结果 |
|--------|--------------------|--------------------------|----------------------|------|------|
| 验证广告   | 成功拉起应用，进入广告页面      | 广告页正常显示，右上角跳过按钮以及倒计时正常显示 | 是                    | 是    | Pass |
| 验证跳过按钮 | 成功拉起应用，进入广告页面      | 点击跳过按钮                   | 广告直接跳过，显示hello world | 是    | Pass |
| 验证图标大小 | 成功安装，成功拉起应用 | 图标正常显示，应用启动显示图标正常显示      | 根据屏幕的大小相应图标也会改变      | 是    | Pass |

## 逻辑用例（数据驱动）

以下 2202 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| remainingAfter（函数） | 无 | 759 组输入（WindowStartIcon_RemainingAfter_0001~0759） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| navigatesAtTick（函数） | 无 | 50 组输入（WindowStartIcon_NavigatesAtTick_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| elapsedMsOf（函数） | 无 | 240 组输入（WindowStartIcon_ElapsedMsOf_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| countdownTextOf（函数） | 无 | 240 组输入（WindowStartIcon_CountdownTextOf_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| fullScreenFor（函数） | 无 | 50 组输入（WindowStartIcon_FullScreenFor_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| firstPageOf（函数） | 无 | 1 组输入（WindowStartIcon_FirstPageOf_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isRegisteredPage（函数） | 无 | 30 组输入（WindowStartIcon_IsRegisteredPage_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isHexColor（函数） | 无 | 30 组输入（WindowStartIcon_IsHexColor_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| colorChannelOf（函数） | 无 | 30 组输入（WindowStartIcon_ColorChannelOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new AdvertisingState（构造） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState.show（实例方法） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateShow_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState.tick（实例方法） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateTick_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState.skip（实例方法） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateSkip_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState.leave（实例方法） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateLeave_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState.text（实例方法） | 无 | 1 组输入（WindowStartIcon_AdvertisingStateText_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingState flow（调用序列） | 无 | 759 组输入（WindowStartIcon_AdvertisingStateFlow_0001~0759） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AdvertisingLogic（常量契约） | 无 | 7 组输入（WindowStartIcon_AdvertisingLogicConstants_0001~0007） | 返回值与状态逐条符合预期 | 是 | 待执行 |
