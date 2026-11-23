# 验证码布局 测试用例归档

## 用例表

| 测试功能     | 预置条件          | 输入                        | 预期输出        | 是否自动 | 测试结果 |
|----------|---------------|---------------------------|-------------|------|------|
| 验证键盘拉起功能 | 成功拉起应用，进入案例页面 | 1.点击验证码输入框                | 1.成功拉起键盘    | 否    | Pass |
| 验证键盘输入功能 | 成功拉起应用，进入案例页面 | 1.从前向后输入数字<br/>2.从后往前删除数字 | 1.成功输入删除验证码 | 否    | Pass |
| 验证收起键盘功能 | 成功拉起应用，进入案例页面 | 1.侧滑返回收起键盘                | 1.成功收起键盘    | 否    | Pass |

## 逻辑用例（数据驱动）

以下 2454 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| VerifyCodeConstants（常量契约） | 无 | 1 组输入（VerifyCode_VerifyCodeConstantsValues_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rejectsInsert（函数） | 无 | 50 组输入（VerifyCode_RejectsInsert_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| insertInto（函数） | 无 | 606 组输入（VerifyCode_InsertInto_0001~0606） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| deleteLeftOf（函数） | 无 | 180 组输入（VerifyCode_DeleteLeftOf_0001~0180） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isComplete（函数） | 无 | 50 组输入（VerifyCode_IsComplete_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| cellTextOf（函数） | 无 | 500 组输入（VerifyCode_CellTextOf_0001~0500） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| filledCellsOf（函数） | 无 | 175 组输入（VerifyCode_FilledCellsOf_0001~0175） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| cellKeyOf（函数） | 无 | 240 组输入（VerifyCode_CellKeyOf_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| typeSequence（函数） | 无 | 8 组输入（VerifyCode_TypeSequence_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| backActionOf（函数） | 无 | 2 组输入（VerifyCode_BackActionOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new VerifyCodeState（构造） | 无 | 1 组输入（VerifyCode_VerifyCodeStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeState.attach（实例方法） | 无 | 1 组输入（VerifyCode_VerifyCodeStateAttach_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeState.insert（实例方法） | 无 | 30 组输入（VerifyCode_VerifyCodeStateInsert_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeState.deleteLeft（实例方法） | 无 | 1 组输入（VerifyCode_VerifyCodeStateDeleteLeft_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeState.backPress（实例方法） | 无 | 1 组输入（VerifyCode_VerifyCodeStateBackPress_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeState flow（调用序列） | 无 | 606 组输入（VerifyCode_VerifyCodeStateFlow_0001~0606） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VerifyCodeLogic（常量契约） | 无 | 2 组输入（VerifyCode_VerifyCodeLogicConstants_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
