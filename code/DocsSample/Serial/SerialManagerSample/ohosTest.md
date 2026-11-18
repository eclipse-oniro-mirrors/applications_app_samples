# SerialManagerSample 测试用例归档

本文根据当前 `entry/src/ohosTest` 的实际测试代码、用例索引和已保存的回归结果更新，归档日期为 **2026-11-18**。被测应用包名为 `com.samples.serialmanagersample`，测试模块为 `entry_test`。

## 测试范围与统计

原文中的“拉起应用、主页展示、主页按钮点击”属于已删除的 UI 测试，本版改为归档串口业务控制器的自动化测试。当前测试直接调用业务接口，核对返回值、状态、字节内容、底层调用轨迹和异常；不依赖点击页面或观察日志判定通过。

| 测试范围 | 套件数 | 用例数 | 默认注册 | 本次归档结果 |
| --- | ---: | ---: | --- | --- |
| 模拟串口业务回归 | 75 | 1,800 | 是 | 默认参数及 coverage=true 均全部通过 |
| 真实串口硬件集成 | 1 | 3 | 否，需 serialHardware=true | 未执行 |
| 合计 | 76 | 1,803 | 默认执行 1,800 个 | 硬件用例不计入已通过数量 |

默认套件使用真实的 [SerialController](entry/src/main/ets/model/SerialController.ets)，通过 [SharedDriver](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets) 注入 FakeSerialProvider 和 FakeSerialPort。模拟端口用于记录配置、数据、超时参数和调用顺序，产生数据及断开事件，并注入一次操作异常。它验证应用业务行为；真实设备的串口驱动、外设通信及物理信号质量需另行验证。

默认注册入口为 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets)。当前不存在 UI 测试注册；Interaction 目录中的用例测试数据、回调和信号交互。TestAbility 与测试页面是设备测试启动设施，保留它们用于运行 Hypium。

## 测试组织与判定方式

- 使用 ArkTS/ETS 与 @ohos/hypium 的 describe、it、expect，套件包含 beforeAll、beforeEach、afterEach、afterAll。
- 每个业务用例创建独立 SerialFixture，通过 async/await 等待接口及清理完成；并发场景等待所有提交请求结束。断言使用 assertEqual、assertTrue、assertFalse、assertDeepEquals 等方法。
- 数据断言核对长度及完整有序数组；异常辅助方法同时核对预期异常名称和指定错误码。预期异常被正确捕获、断言满足时，用例应通过；它们属于正常的异常路径测试。
- 每个用例结束后释放会话和订阅，并断言释放结果。模拟夹具在释放后等待 20 ms，让设备事件循环处理系统事件；TestAbility 在前台生命周期回调返回后启动测试，避免长时间阻塞生命周期处理。
- SerialConfigValues 保留 SDK 类型并提供业务配置常量，避免模拟测试因原生 serial 导出不可用而在读取枚举时失败。此处理不表示设备具备真实串口能力。
- 用例标记为 TestType.FUNCTION、Size.MEDIUMTEST、Level.LEVEL2，保留 @tc.name、@tc.number、@tc.desc 等元数据。日志使用 @ohos.hilog，日志内容为英文；通过与否由断言决定。

## 业务用例表

下表按实际场景归并同类参数向量，每一行的数量来自当前源码中的 it 用例。表中的 Pass 指本次归档所依据的两轮设备回归结果；每次修改或更换设备后应重新执行。各场景合计 **1,800 个用例**，文件和编号对应关系见后面的文件索引及 完整用例索引（本地记录 `test-adaptation/case-catalog.json`，未随提交发布）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 用例数 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | ---: | --- | --- |
| 设备枚举与端口信息 | 注入一个或多个带可选元数据的模拟端口 | 调用 getSerialPortList、portInfo | 返回正确数量的端口，选中首端口；portName、vendorId、productId、manufacturer 与模拟输入一致 | 78 | 是 | Pass |
| 空列表与选择清理 | 已枚举并选中端口，尚未打开会话 | 将提供器端口列表置空，重新枚举，再恢复列表 | 清空所选端口；portInfo、open 抛出 SerialStateError；恢复列表后可以重新打开 | 20 | 是 | Pass |
| 枚举异常与重试 | 提供器注入一次枚举异常 | 调用 getSerialPortList 并在失败后重试 | 核对 BusinessError 名称及注入错误码；重试成功且操作队列可继续使用 | 39 | 是 | Pass |
| 打开配置透传 | 已选择模拟端口 | 使用不同 baudRate、dataBits、stopBits、parity 调用 open | 配置字段准确传到端口，成功后 opened 为 true | 96 | 是 | Pass |
| 配置对象所有权 | 已选择模拟端口 | 提交 open 后、排队执行前修改原始配置对象 | 端口收到提交时的配置快照，后续修改不污染已提交请求 | 25 | 是 | Pass |
| 打开失败与恢复 | 已选择端口，注入一次 open 异常 | 调用 open，核对异常，再次 open | 错误名称和代码一致；失败后保留选择且未打开，重试成功 | 36 | 是 | Pass |
| 写入长度与内容边界 | 模拟端口已打开 | 写入不同长度和种子生成的字节数据，或省略载荷 | 核对完整有序字节内容、返回长度、调用次数和累计发送字节；默认载荷为 Hello 对应字节 | 75 | 是 | Pass |
| 写入缓冲区所有权 | 模拟端口已打开 | 提交 write 后修改调用方缓冲区 | 端口实际收到提交时的独立副本，发送统计正确 | 37 | 是 | Pass |
| 写入超时参数透传 | 模拟端口已打开 | 向 write 传入用例指定的 timeout 和数据 | 端口收到相同 timeout；写入内容、返回长度和发送计数正确；不据此判定真实超时行为 | 31 | 是 | Pass |
| 部分写入计数 | 模拟端口已打开，设置端口接受字节数 | 提交完整载荷，模拟返回零字节、部分字节或全部字节 | write 返回模拟接受长度，transmittedBytes 按实际返回值累计 | 66 | 是 | Pass |
| 数据读取与分包统计 | 已打开端口并注册 onDataRead | 模拟触发一个或多个数据分块回调 | receivedBytes 累加全部分块长度，lastData 保存最近一块完整有序字节 | 134 | 是 | Pass |
| 回调注册幂等性 | 模拟端口已打开 | 重复注册数据读取或断开回调并触发事件 | 底层订阅不重复，订阅状态正确，数据回调按有效注册处理 | 71 | 是 | Pass |
| 读取回调移除与旧回调失效 | 已打开端口并注册数据回调 | offDataRead 后调用保留的旧回调，再重新注册 | 取消订阅后旧回调不再改变数据和计数，重新注册的回调有效 | 54 | 是 | Pass |
| 断开回调取消 | 已打开端口并注册断开回调 | offDisconnect 后触发已移除的回调 | 旧断开回调失效，当前会话和已有发送统计保持正确 | 32 | 是 | Pass |
| 断开事件清理 | 已打开端口并订阅数据、断开事件 | 接收数据后模拟断开，再调用旧数据回调 | 清空端口选择、打开状态和订阅状态；旧数据回调不再更新统计 | 36 | 是 | Pass |
| 断开后的新会话恢复 | 旧端口已触发断开 | 枚举替代端口、重新打开、触发旧断开回调并写入 | 新端口会话保持有效；写入仅到新端口，旧回调不能破坏新会话 | 31 | 是 | Pass |
| 控制信号切换与读回 | 模拟端口已打开 | 按用例序列设置 RTS、DTR，并读取 CTS、DSR | 设置值、读回结果及调用记录与输入一致，各信号互不污染 | 142 | 是 | Pass |
| 串口操作排队顺序 | 模拟端口已打开 | 依次提交 write、flush、drain、sendBrk 等组合 | 底层调用轨迹与提交顺序一致，字节内容和会话状态正确 | 129 | 是 | Pass |
| 缓冲操作组合 | 模拟端口已打开 | 组合执行 write、flush、drain、sendBrk | 底层调用顺序和次数正确，写入数据及发送统计保持一致 | 31 | 是 | Pass |
| 并发写入串行化 | 模拟端口已打开 | 同时提交多个不同缓冲区的 write 请求并等待完成 | 每次写入按队列提交顺序执行，数据不串扰，累计发送字节正确 | 48 | 是 | Pass |
| 操作异常传播与恢复 | 已打开端口并注册回调 | 对指定操作注入一次 BusinessError，随后正常写入 | 核对异常名称与代码、会话和统计；后续写入成功，队列继续执行 | 147 | 是 | Pass |
| 队列失败隔离 | 模拟端口已打开，对首次 write 注入异常 | 提交失败写入并立即排队下一次正常写入 | 首个请求按注入错误失败，后续请求成功，仅成功写入计入发送统计 | 36 | 是 | Pass |
| 关闭失败与重试 | 会话已打开且两个回调已注册 | 注入一次 close 失败，再次 close | 失败时保留会话、订阅和统计；重试成功后释放端口与回调 | 41 | 是 | Pass |
| 未选端口及关闭后保护 | 端口未选中或会话关闭后已释放选择 | 调用用例指定的端口操作，再重新选择并打开 | 抛出 SerialStateError，未额外调用底层端口；重新选择后可继续使用 | 44 | 是 | Pass |
| 重复打开关闭 | 模拟提供器可枚举端口 | 重复枚举、打开、写入、关闭多个会话 | 每轮状态转换、调用次数和累计数据统计符合用例断言，关闭后资源释放 | 34 | 是 | Pass |
| 资源释放与幂等性 | 已选择端口，或已打开并注册回调 | 调用 dispose，并在释放后再次调用 | 打开会话关闭或未打开会话回调移除；状态清空，重复释放不产生残留订阅 | 36 | 是 | Pass |
| 状态快照副本 | 已接收数据并取得 snapshot | 修改返回快照的 lastData，再次读取快照 | 控制器内部数据不受外部快照修改影响，返回数组相互独立 | 78 | 是 | Pass |
| 多控制器与端口隔离 | 创建两个独立控制器和模拟端口 | 分别写入并触发各自的数据事件 | 写入记录、接收数据和计数分别归属各自会话，互不污染 | 25 | 是 | Pass |
| 完整业务会话回归 | 注入模拟端口和提供器 | 枚举、打开、写入、订阅读取、缓冲操作、信号操作、关闭 | 逐步核对端口信息、完整字节、收发计数、调用轨迹与最终释放状态 | 148 | 是 | Pass |

## 测试目录与文件索引

下表中的“业务交互”指控制器接口、回调及数据交互，不包含 UI 自动化。Integration 目录的默认统计不含硬件套件。

| 目录 | 覆盖重点 | 默认套件数 | 默认用例数 |
| --- | --- | ---: | ---: |
| Integration | 完整会话、元数据、配置兼容、提供器恢复 | 8 | 112 |
| Interaction | 订阅、数据分块、断开、信号及对象所有权 | 12 | 294 |
| LifecycleState | 重复会话、错误恢复、释放、状态及实例隔离 | 10 | 210 |
| PerformanceStability | 并发写入、操作排队、重复会话、缓冲操作及载荷变化 | 7 | 134 |
| SerialPort | 串口接口的状态、配置、收发、信号及端到端组合 | 16 | 374 |
| SerialValidation | 配置、枚举、订阅、授权错误、中断恢复及前置条件 | 8 | 220 |
| Security | 缓冲区所有权、控制器隔离、旧回调失效 | 3 | 49 |
| Validation | 顺序、边界、配置快照、超时透传、部分写入及异常恢复 | 11 | 407 |
| 合计 | 默认业务回归 | 75 | 1,800 |

PerformanceStability 当前用例断言功能和顺序，不包含吞吐量、时延指标或长时间耐久阈值；Security 当前覆盖数据及会话隔离，不据此宣称完成系统权限或渗透测试。

以下文件路径均相对于 entry/src/ohosTest/ets/test。每个文件中的用例名称、编号、描述和行号可在完整用例索引中查询。

| 测试文件 | 用例数 | 主要覆盖点 | 执行方式 |
| --- | ---: | --- | --- |
| [Integration/SerialAdvancedScenarios.test.ets](entry/src/ohosTest/ets/test/Integration/SerialAdvancedScenarios.test.ets) | 6 | 完整业务会话回归 | 默认自动回归 |
| [Integration/SerialRegression.test.ets](entry/src/ohosTest/ets/test/Integration/SerialRegression.test.ets) | 14 | 完整业务会话回归 | 默认自动回归 |
| [Integration/SerialHardware.ets](entry/src/ohosTest/ets/test/Integration/SerialHardware.ets) | 3 | 真实端口枚举、打开关闭、回调注册移除 | 手动启用，未执行 |
| [Integration/SerialIntegration.test.ets](entry/src/ohosTest/ets/test/Integration/SerialIntegration.test.ets) | 12 | 串口操作排队顺序 | 默认自动回归 |
| [Integration/SerialPortMetadata.test.ets](entry/src/ohosTest/ets/test/Integration/SerialPortMetadata.test.ets) | 24 | 设备枚举与端口信息 | 默认自动回归 |
| [Integration/SerialProviderRecovery.test.ets](entry/src/ohosTest/ets/test/Integration/SerialProviderRecovery.test.ets) | 3 | 枚举异常与重试 | 默认自动回归 |
| [Integration/SerialConfigurationCompatibility.test.ets](entry/src/ohosTest/ets/test/Integration/SerialConfigurationCompatibility.test.ets) | 20 | 打开配置透传 | 默认自动回归 |
| [Integration/SerialSystemIntegration.test.ets](entry/src/ohosTest/ets/test/Integration/SerialSystemIntegration.test.ets) | 11 | 完整业务会话回归 | 默认自动回归 |
| [Integration/SerialUserScenarios.test.ets](entry/src/ohosTest/ets/test/Integration/SerialUserScenarios.test.ets) | 22 | 完整业务会话回归 | 默认自动回归 |
| [Interaction/SerialCallbackRegistration.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialCallbackRegistration.test.ets) | 35 | 回调注册幂等性 | 默认自动回归 |
| [Interaction/SerialWriteBufferBoundaries.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialWriteBufferBoundaries.test.ets) | 12 | 写入长度与内容边界 | 默认自动回归 |
| [Interaction/SerialSnapshotIsolation.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialSnapshotIsolation.test.ets) | 15 | 状态快照副本 | 默认自动回归 |
| [Interaction/SerialWriteBufferOwnership.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialWriteBufferOwnership.test.ets) | 11 | 写入缓冲区所有权 | 默认自动回归 |
| [Interaction/SerialDataReadEvents.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialDataReadEvents.test.ets) | 33 | 数据读取与分包统计 | 默认自动回归 |
| [Interaction/SerialCallbackRemoval.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialCallbackRemoval.test.ets) | 30 | 读取回调移除与旧回调失效 | 默认自动回归 |
| [Interaction/SerialSignalTransitions.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialSignalTransitions.test.ets) | 39 | 控制信号切换与读回 | 默认自动回归 |
| [Interaction/SerialStatusReadback.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialStatusReadback.test.ets) | 22 | 控制信号切换与读回 | 默认自动回归 |
| [Interaction/SerialDataChunking.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialDataChunking.test.ets) | 32 | 数据读取与分包统计 | 默认自动回归 |
| [Interaction/SerialConfigOwnership.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialConfigOwnership.test.ets) | 8 | 配置对象所有权 | 默认自动回归 |
| [Interaction/SerialDisconnectEvents.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialDisconnectEvents.test.ets) | 36 | 断开事件清理 | 默认自动回归 |
| [Interaction/SerialSignalIsolation.test.ets](entry/src/ohosTest/ets/test/Interaction/SerialSignalIsolation.test.ets) | 21 | 控制信号切换与读回 | 默认自动回归 |
| [LifecycleState/SerialReconfiguration.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialReconfiguration.test.ets) | 13 | 打开配置透传 | 默认自动回归 |
| [LifecycleState/SerialOpenClose.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialOpenClose.test.ets) | 9 | 重复打开关闭 | 默认自动回归 |
| [LifecycleState/SerialSessionState.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialSessionState.test.ets) | 30 | 完整业务会话回归 | 默认自动回归 |
| [LifecycleState/SerialErrorRecovery.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialErrorRecovery.test.ets) | 42 | 操作异常传播与恢复 | 默认自动回归 |
| [LifecycleState/SerialFailurePropagation.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialFailurePropagation.test.ets) | 41 | 操作异常传播与恢复 | 默认自动回归 |
| [LifecycleState/SerialDisposal.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialDisposal.test.ets) | 29 | 资源释放与幂等性 | 默认自动回归 |
| [LifecycleState/SerialCallbackResources.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialCallbackResources.test.ets) | 13 | 读取回调移除与旧回调失效 | 默认自动回归 |
| [LifecycleState/SerialSessionIsolation.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialSessionIsolation.test.ets) | 13 | 多控制器与端口隔离 | 默认自动回归 |
| [LifecycleState/SerialTransferAccounting.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialTransferAccounting.test.ets) | 11 | 部分写入计数 | 默认自动回归 |
| [LifecycleState/SerialDisconnectRecovery.test.ets](entry/src/ohosTest/ets/test/LifecycleState/SerialDisconnectRecovery.test.ets) | 9 | 断开后的新会话恢复 | 默认自动回归 |
| [PerformanceStability/SerialQueuedOperations.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialQueuedOperations.test.ets) | 31 | 串口操作排队顺序 | 默认自动回归 |
| [PerformanceStability/SerialConcurrentWrites.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialConcurrentWrites.test.ets) | 5 | 并发写入串行化 | 默认自动回归 |
| [PerformanceStability/SerialRepeatedSessions.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialRepeatedSessions.test.ets) | 6 | 重复打开关闭 | 默认自动回归 |
| [PerformanceStability/SerialResourceRelease.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialResourceRelease.test.ets) | 7 | 资源释放与幂等性 | 默认自动回归 |
| [PerformanceStability/SerialWriteBurst.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialWriteBurst.test.ets) | 21 | 并发写入串行化 | 默认自动回归 |
| [PerformanceStability/SerialBufferControl.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialBufferControl.test.ets) | 31 | 缓冲操作组合 | 默认自动回归 |
| [PerformanceStability/SerialTransferLoad.test.ets](entry/src/ohosTest/ets/test/PerformanceStability/SerialTransferLoad.test.ets) | 33 | 写入长度与内容边界 | 默认自动回归 |
| [SerialPort/SerialPortConcurrency.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortConcurrency.test.ets) | 18 | 并发写入串行化 | 默认自动回归 |
| [SerialPort/SerialPortConsistency.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortConsistency.test.ets) | 19 | 状态快照副本 | 默认自动回归 |
| [SerialPort/SerialPortEndToEnd.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortEndToEnd.test.ets) | 14 | 完整业务会话回归 | 默认自动回归 |
| [SerialPort/SerialPortErrorRecovery.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortErrorRecovery.test.ets) | 22 | 操作异常传播与恢复 | 默认自动回归 |
| [SerialPort/SerialPortLifecycle.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortLifecycle.test.ets) | 19 | 重复打开关闭 | 默认自动回归 |
| [SerialPort/SerialPortState.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortState.test.ets) | 18 | 回调注册幂等性 | 默认自动回归 |
| [SerialPort/SerialPortBurst.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortBurst.test.ets) | 4 | 并发写入串行化 | 默认自动回归 |
| [SerialPort/SerialPortGuards.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortGuards.test.ets) | 20 | 未选端口及关闭后保护 | 默认自动回归 |
| [SerialPort/SerialPortReceive.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortReceive.test.ets) | 23 | 数据读取与分包统计 | 默认自动回归 |
| [SerialPort/SerialPortInfo.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortInfo.test.ets) | 33 | 设备枚举与端口信息 | 默认自动回归 |
| [SerialPort/SerialPortConfiguration.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortConfiguration.test.ets) | 32 | 打开配置透传 | 默认自动回归 |
| [SerialPort/SerialPortDeepWorkflow.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortDeepWorkflow.test.ets) | 32 | 完整业务会话回归 | 默认自动回归 |
| [SerialPort/SerialPortOperations.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortOperations.test.ets) | 42 | 操作异常传播与恢复 | 默认自动回归 |
| [SerialPort/SerialPortFlow.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortFlow.test.ets) | 37 | 串口操作排队顺序 | 默认自动回归 |
| [SerialPort/SerialPortSignals.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortSignals.test.ets) | 22 | 控制信号切换与读回 | 默认自动回归 |
| [SerialPort/SerialPortWorkflow.test.ets](entry/src/ohosTest/ets/test/SerialPort/SerialPortWorkflow.test.ets) | 19 | 完整业务会话回归 | 默认自动回归 |
| [SerialValidation/SerialOpenConfigurations.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialOpenConfigurations.test.ets) | 31 | 打开配置透传 | 默认自动回归 |
| [SerialValidation/SerialAuthorizationErrors.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialAuthorizationErrors.test.ets) | 36 | 打开失败与恢复 | 默认自动回归 |
| [SerialValidation/SerialEnumeration.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialEnumeration.test.ets) | 21 | 设备枚举与端口信息 | 默认自动回归 |
| [SerialValidation/SerialEventCallbacks.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialEventCallbacks.test.ets) | 18 | 回调注册幂等性 | 默认自动回归 |
| [SerialValidation/SerialInterruptedTransfers.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialInterruptedTransfers.test.ets) | 22 | 断开后的新会话恢复 | 默认自动回归 |
| [SerialValidation/SerialDisconnectUnsubscribe.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialDisconnectUnsubscribe.test.ets) | 32 | 断开回调取消 | 默认自动回归 |
| [SerialValidation/SerialDiscoveryFailures.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialDiscoveryFailures.test.ets) | 36 | 枚举异常与重试 | 默认自动回归 |
| [SerialValidation/SerialUnselectedGuards.test.ets](entry/src/ohosTest/ets/test/SerialValidation/SerialUnselectedGuards.test.ets) | 24 | 未选端口及关闭后保护 | 默认自动回归 |
| [Security/SerialPayloadOwnership.test.ets](entry/src/ohosTest/ets/test/Security/SerialPayloadOwnership.test.ets) | 26 | 写入缓冲区所有权 | 默认自动回归 |
| [Security/SerialControllerIsolation.test.ets](entry/src/ohosTest/ets/test/Security/SerialControllerIsolation.test.ets) | 12 | 多控制器与端口隔离 | 默认自动回归 |
| [Security/SerialStaleCallbacks.test.ets](entry/src/ohosTest/ets/test/Security/SerialStaleCallbacks.test.ets) | 11 | 读取回调移除与旧回调失效 | 默认自动回归 |
| [Validation/SerialOperationOrdering.test.ets](entry/src/ohosTest/ets/test/Validation/SerialOperationOrdering.test.ets) | 49 | 串口操作排队顺序 | 默认自动回归 |
| [Validation/SerialWriteBoundaries.test.ets](entry/src/ohosTest/ets/test/Validation/SerialWriteBoundaries.test.ets) | 30 | 写入长度与内容边界 | 默认自动回归 |
| [Validation/SerialReceiveBoundaries.test.ets](entry/src/ohosTest/ets/test/Validation/SerialReceiveBoundaries.test.ets) | 46 | 数据读取与分包统计 | 默认自动回归 |
| [Validation/SerialConfigurationForwarding.test.ets](entry/src/ohosTest/ets/test/Validation/SerialConfigurationForwarding.test.ets) | 17 | 配置对象所有权 | 默认自动回归 |
| [Validation/SerialCloseFailureRecovery.test.ets](entry/src/ohosTest/ets/test/Validation/SerialCloseFailureRecovery.test.ets) | 41 | 关闭失败与重试 | 默认自动回归 |
| [Validation/SerialSignalSequences.test.ets](entry/src/ohosTest/ets/test/Validation/SerialSignalSequences.test.ets) | 38 | 控制信号切换与读回 | 默认自动回归 |
| [Validation/SerialWriteTimeoutForwarding.test.ets](entry/src/ohosTest/ets/test/Validation/SerialWriteTimeoutForwarding.test.ets) | 31 | 写入超时参数透传 | 默认自动回归 |
| [Validation/SerialPartialWriteAccounting.test.ets](entry/src/ohosTest/ets/test/Validation/SerialPartialWriteAccounting.test.ets) | 55 | 部分写入计数 | 默认自动回归 |
| [Validation/SerialQueueFailureRecovery.test.ets](entry/src/ohosTest/ets/test/Validation/SerialQueueFailureRecovery.test.ets) | 36 | 队列失败隔离 | 默认自动回归 |
| [Validation/SerialSnapshotCopies.test.ets](entry/src/ohosTest/ets/test/Validation/SerialSnapshotCopies.test.ets) | 44 | 状态快照副本 | 默认自动回归 |
| [Validation/SerialEmptyEnumeration.test.ets](entry/src/ohosTest/ets/test/Validation/SerialEmptyEnumeration.test.ets) | 20 | 空列表与选择清理 | 默认自动回归 |

## 可选真实串口硬件用例

[SerialHardware.ets](entry/src/ohosTest/ets/test/Integration/SerialHardware.ets) 通过 SystemSerialProvider 调用系统串口接口，使用独立文件名避免被默认的 *.test.ets 扫描误选。只有运行参数 serialHardware=true 时才注册该套件。

预置条件：设备具备系统串口能力、连接可枚举的外设，且已获得打开端口所需授权。仅设备类型或 API 版本匹配不能保证具备这些条件。未启用时不注册该套件；启用后若无可用端口，非空列表断言会失败。

| 测试功能 / 用例名称 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 真实端口枚举 / SerialHardwareTest001 | 系统可枚举到真实串口 | getSerialPortList、portInfo | 至少一个端口，首端口名称非空且信息一致，枚举后尚未打开 | 是，手动启用后执行 | 未执行 |
| 真实端口打开关闭 / SerialHardwareTest002 | 已连接且获授权的真实串口 | 枚举、默认配置 open、close | 打开后端口名称和 opened 正确；关闭后 opened=false、端口名称为空 | 是，手动启用后执行 | 未执行 |
| 真实回调注册移除 / SerialHardwareTest003 | 真实端口可打开 | onDataRead、onDisconnect、offDataRead、offDisconnect | 两类订阅状态先为 true，移除后均为 false | 是，手动启用后执行 | 未执行 |

这些硬件用例尚未覆盖外设实际收发、真实断开事件、物理 RTS/CTS/DTR/DSR 信号和持续通信可靠性；回调注册成功也不能代替真实事件到达验证。

## 运行方式

本次提交排除全部配置文件和本地执行报告；用例直接依赖的 `entry/src/main/ets/model` 业务实现及页面接入代码一并提交。首次检出代码后，需在本地完成测试模块的 TestAbility 声明、页面资源配置、设备类型、API 版本及签名配置，才能执行设备测试；这些本地配置不属于本次推送内容。

先在 DevEco Studio 中完成主应用与 ohosTest 的签名、编译及安装。主应用和测试模块的 deviceTypes 均需与目标设备类型匹配，同时满足应用 API 版本要求。当前测试模块配置支持 default、2in1；已有回归设备为 default、API 26。

默认设备回归命令如下；多设备连接时，在 hdc 后补充 -t 和目标设备编号。

~~~shell
hdc shell aa test -b com.samples.serialmanagersample -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
~~~

请求覆盖率的独立回归：

~~~shell
hdc shell aa test -b com.samples.serialmanagersample -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000 -s coverage true
~~~

满足真实串口硬件条件后，使用以下命令额外注册 3 个硬件用例；该命令同时保留默认的 1,800 个业务用例，预期总数为 1,803：

~~~shell
hdc shell aa test -b com.samples.serialmanagersample -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000 -s serialHardware true
~~~

在 DevEco Studio 中运行时，重新扫描当前 ohosTest，并清除旧配置中 AbilityTest、SerialButtonInteractionTest、SerialUIRenderingTest 的选择。默认运行也不要保留 SerialHardwareTest 的类过滤条件；不再使用 serialUi 参数。

## 已归档验证结果

以下是 2026-11-18 本地主机已保存的执行结果；原始报告保留在本地，不随本次提交发布。编号规范化后的检查结果在提交交付报告中另行记录。设备系统为 OpenHarmony-7.0.0.47、API 26。设备日志中的时钟日期与主机日期不一致，归档日期以本地主机为准。

| 验证项 | 套件 / 用例 | 结果 | 证据 |
| --- | --- | --- | --- |
| 默认参数设备回归 | 75 / 1,800 | 1,800 通过，0 失败，0 停止，运行器正常结束 | 默认回归结果（本地记录 `test-adaptation/device-test-without-coverage-results.json`，未随提交发布） |
| coverage=true 设备回归 | 75 / 1,800 | 1,800 通过，0 失败，0 停止，运行器正常结束 | 覆盖率参数回归结果（本地记录 `test-adaptation/device-test-results.json`，未随提交发布） |
| 主机业务回归 | 75 / 1,800 | 全部通过，39,974 次断言，原生 serial 不可用场景已模拟 | 主机回归结果（本地记录 `test-adaptation/host-test-results.json`，未随提交发布） |
| 主应用编译 | 主应用 HAP | 成功 | 主应用编译结果（本地记录 `test-adaptation/compile-main-results.json`，未随提交发布） |
| ohosTest 编译 | 测试 HAP | 成功，0 ArkTS 编译错误 | 测试编译结果（本地记录 `test-adaptation/compile-results.json`，未随提交发布） |
| 真实串口硬件套件 | 1 / 3 | 未执行 | [硬件用例源码](entry/src/ohosTest/ets/test/Integration/SerialHardware.ets) |

coverage=true 表示运行时请求覆盖率，不代表本文件已经给出真实 SDK、原生实现或应用全部源码的覆盖率百分比。主机回归用于验证业务逻辑，ArkTS 编译和设备结果分别由对应证据支持。

已通过的两轮设备回归末尾均包含：

~~~text
Tests run: 1800, Failure: 0, Error: 0, Pass: 1800, Ignore: 0
OHOS_REPORT_CODE: 0
TestFinished-ResultCode: 0
~~~

## 关联资料

- 完整用例索引（本地记录 `test-adaptation/case-catalog.json`，未随提交发布）：全部 1,803 个用例的文件、名称、编号、描述、分类和行号。
- 完整测试代码（本地记录 `test-adaptation/COMPLETE_TEST_CODE.md`，未随提交发布）：当前完整源码归档。
- 测试改造报告（本地记录 `test-adaptation/ADAPTATION_REPORT.md`，未随提交发布）：参考工程映射、逐文件改造说明及验证范围。
- UI 删除与运行修复说明（本地记录 `test-adaptation/UI_REMOVAL_FIX.md`，未随提交发布）：已删除的 UI 用例及枚举依赖、主线程阻塞修复。
- 已删除文件清单（本地记录 `test-adaptation/deleted-files.json`，未随提交发布）：包括旧 UI 文件及硬件套件旧文件名；覆盖源码时需清理清单中的旧文件。

用例编号已按提交技能统一：`@tc.name` 与 `it()` 名称保持一致，文件内序号从 001 连续递增；`@tc.number` 使用完整前缀和四位编号，按 0100、0200 递增。历史设备报告中的旧名称通过同文件、同用例顺序对应，测试输入、操作和断言保持不变。
