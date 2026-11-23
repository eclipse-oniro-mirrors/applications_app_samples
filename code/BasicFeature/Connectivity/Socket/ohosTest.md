# Socket 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用拉起与权限（Ability，2 条用例）|应用已安装|点击桌面图标并授予网络权限|应用正常启动，2 条用例通过|Pass|
|IP 地址解析（ResolveIpCore，45 条用例）|位于测试应用|传入不同 IP 与端口参数|45 条用例全部通过|Pass|
|协议解析（ProtocolParserCore，35 条用例）|位于测试应用|传入不同报文数据|35 条用例全部通过|Pass|
|聊天数据模型（ChatBoxCore，30 条用例）|位于测试应用|构造不同聊天消息|30 条用例全部通过|Pass|
|聊天数据源（ChatSourceCore，30 条用例）|位于测试应用|构造不同数据源数据|30 条用例全部通过|Pass|
|数据源监听（DataSourceListenerExtended，30 条用例）|位于测试应用|注册不同监听回调|30 条用例全部通过|Pass|
|登录 UI 状态（LoginUiState，12 条用例）|位于测试应用|切换登录页状态|12 条用例全部通过|Pass|
|日志工具（LoggerCore，8 条用例）|位于测试应用|调用日志接口|8 条用例全部通过|Pass|

合计 192 条用例，全部通过。

## 逻辑用例（数据驱动）

以下 1785 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new ChatBox（构造） | 无 | 156 组输入（Socket_ChatBoxCtor_0001~0156） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ChatSource（构造） | 无 | 1 组输入（Socket_ChatSourceCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ChatSource.totalCount（实例方法） | 无 | 1 组输入（Socket_ChatSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ChatSource.getData（实例方法） | 无 | 30 组输入（Socket_ChatSourceGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ChatSource.addData（实例方法） | 无 | 100 组输入（Socket_ChatSourceAddData_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ChatSource.pushData（实例方法） | 无 | 4 组输入（Socket_ChatSourcePushData_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ChatSource flow（调用序列） | 无 | 1235 组输入（Socket_ChatSourceFlow_0001~1235） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| resolveIP（函数） | 无 | 128 组输入（Socket_ResolveIP_0001~0128） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SocketCommandKind（常量契约） | 无 | 5 组输入（Socket_SocketCommandKindValues_0001~0005） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| classifyCommand（函数） | 无 | 125 组输入（Socket_ClassifyCommand_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
