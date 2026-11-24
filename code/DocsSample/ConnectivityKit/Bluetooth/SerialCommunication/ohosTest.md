# 串行通信开发指导

## 用例表

| 测试功能          | 预置条件     | 输入              | 预期输出                  | 是否自动  | 测试结果 |
| ----------------- | ------------ | ----------------- | ------------------------|--------- | -------- |
| 应用正常启动     | 设备支持蓝牙   | 启动应用           | 进入应用界面，弹出申请蓝牙权限的弹窗 |否 | Pass      |
| 创建服务器监听    | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开   | 点击listenSocket        | 弹出对应弹窗 |否 | Pass      |
| socket等待客户端连接   | 设备支持蓝牙，蓝牙权限申请成功   | 点击ServerConnect    | 弹出对应弹窗   |否 | Pass    |
| 连接对端设备       | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开   | 点击connectDevice    | 弹出对应弹窗 |否 |Pass      |
| 向客户端写入数据   | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开   | 点击writeData   | 弹出对应弹窗 |否 | Pass      |
| 订阅读请求事件      | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开   | 点击subscribeEvent | 弹出对应弹窗 |否 | Pass     |
| 取消订阅读请求事件      | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开   | 点击unsubscribeEvent   | 弹出对应弹窗 |否 | Pass     |
| 关闭服务     | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开，已扫描到设备   | 点击closeServer   | 弹出对应弹窗 |否 | Pass     |
| 关闭客户端     | 设备支持蓝牙，蓝牙权限申请成功，蓝牙已打开，已连接到设备   | 单击closeClient  | 弹出对应弹窗 |否 | Pass     |

## 逻辑用例（数据驱动）

以下 2377 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| sppOptionOf（函数） | 无 | 90 组输入（SerialCommunication_SppOptionOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isUuidFormat（函数） | 无 | 30 组输入（SerialCommunication_IsUuidFormat_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| utf8BytesOf（函数） | 无 | 90 组输入（SerialCommunication_Utf8BytesOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| writeBytesOf（函数） | 无 | 90 组输入（SerialCommunication_WriteBytesOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| writtenByteCountOf（函数） | 无 | 90 组输入（SerialCommunication_WrittenByteCountOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| droppedBytesOf（函数） | 无 | 90 组输入（SerialCommunication_DroppedBytesOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| uint8JsonOf（函数） | 无 | 8 组输入（SerialCommunication_Uint8JsonOf_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| readMessageOf（函数） | 无 | 16 组输入（SerialCommunication_ReadMessageOf_0001~0016） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| callbackErrorOf（函数） | 无 | 233 组输入（SerialCommunication_CallbackErrorOf_0001~0233） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| exceptionMessageOf（函数） | 无 | 233 组输入（SerialCommunication_ExceptionMessageOf_0001~0233） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| successMessageOf（函数） | 无 | 233 组输入（SerialCommunication_SuccessMessageOf_0001~0233） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new SppPageState（构造） | 无 | 1 组输入（SerialCommunication_SppPageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.input（实例方法） | 无 | 233 组输入（SerialCommunication_SppPageStateInput_0001~0233） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.listen（实例方法） | 无 | 233 组输入（SerialCommunication_SppPageStateListen_0001~0233） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.accept（实例方法） | 无 | 232 组输入（SerialCommunication_SppPageStateAccept_0001~0232） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.connect（实例方法） | 无 | 232 组输入（SerialCommunication_SppPageStateConnect_0001~0232） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.write（实例方法） | 无 | 1 组输入（SerialCommunication_SppPageStateWrite_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState.close（实例方法） | 无 | 2 组输入（SerialCommunication_SppPageStateClose_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppPageState flow（调用序列） | 无 | 232 组输入（SerialCommunication_SppPageStateFlow_0001~0232） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SppSerialLogic（常量契约） | 无 | 8 组输入（SerialCommunication_SppSerialLogicConstants_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
