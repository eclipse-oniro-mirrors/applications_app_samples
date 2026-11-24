# IPC_Stub 测试用例
当前自动化使用测试侧 SharedDriver 构造 Stub、进程内客户端、消息序列、服务生命周期和组合流程。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 测试环境，主应用与测试 HAP 已安装。
自动化不需要两端应用实际连接或操作页面；下表自动化结果来自已有归档，功能摘要不重复计数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| Stub 描述符与请求处理 | 使用测试侧 StubRemoteObjectModel | IPCStubTest 描述符，请求码 1 和未知请求码 | 已知码读取请求并回复 hello rpc，未知码拒绝，记录正确 | 是，辅助逻辑 | Pass（归档全量） |
| 消息序列与选项 | 使用测试侧消息序列和选项 | 空白、Unicode、长字符串，读写、回绕、回收与选项组合 | 负载保持，游标、读写计数和选项描述符合辅助逻辑 | 是，辅助逻辑 | Pass（归档全量） |
| 服务生命周期 | 使用测试侧 ServiceLifecycleModel | 创建、请求、连接、断开、销毁、重新连接和重置 | 状态、回调计数、Stub 实例和事件顺序符合测试侧契约 | 是，辅助逻辑 | Pass（归档全量） |
| 客户端与协议组合 | 使用测试侧 InProcessClient 和 Stub | 单次、批量、交替及混合请求码发送 | 客户端结果、Stub 记录、回复数量和指标一致 | 是，辅助逻辑 | Pass（归档全量） |
| 故障与资源管理 | 使用测试侧 Stub、序列和日志 | 模拟未存活、拒绝码、已回收序列、日志容量与重置 | 拒绝结果、序列访问、资源状态和保留数量符合断言 | 是，辅助逻辑 | Pass（归档全量） |
| 日志、描述符与负载规则 | 使用测试侧校验、清理和脱敏逻辑 | 描述符允许列表、篡改指纹、敏感负载和日志控制字符 | 准入、指纹核对、文本清理和脱敏符合辅助逻辑 | 是，辅助逻辑 | Pass（归档全量） |
| 拉起应用 | 安装sample | 无 | 成功拉起应用 | 否，需人工验证 | Pass |
| 检测首页UI | 进入首页 | 无 | 首页UI显示正常 | 否，需人工验证 | Pass |
| 收到服务端信息 | 客户端成功连接服务，并发送请求 | 无 | 日志中打印“IPCStub: stub receive str : hello world”符合预期 | 否，需人工验证 | Pass |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **49 个套件、2,713 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 50 个 `.test.ets` 文件，其中 List 只负责注册；Shared 辅助文件不计为套件。
下表使用真实 `describe` 名称，可用于 `-s class`。数量按源码 `it` 定义统计。
各表按目录组织；套件名中的 Ability、Integration、Security、Performance 不扩大其实际执行范围。

### 入口相关数据场景：1 个套件，3 条

AbilityTest 使用测试侧 Stub 和进程内客户端，没有启动真实 ServiceExtensionAbility。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AbilityTest` | 测试侧 Stub 描述符、请求/回复字符串和请求码规则；未启动真实服务 | 3 |

### 测试侧 Stub 模型与请求处理：8 个套件，470 条

StubRemoteObjectModel、InProcessClient、ServiceLifecycleModel 和消息序列均定义在 SharedDriver.ets 中。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `StubClientDouble` | 测试侧 InProcessClient 的发送、回复、结果记录、批次与重置 | 58 |
| `StubDescriptor` | 测试侧默认及自定义描述符的字段保持、字符串关系与连接传递 | 60 |
| `StubLifecycle` | 测试侧服务创建、请求、连接、断开、销毁、计数与事件 | 60 |
| `StubMessageSequence` | 测试侧消息序列创建、读写、游标、回绕、回收和字段保持 | 59 |
| `StubProtocolCore` | 测试侧描述符、请求码、请求/回复、选项、指标与指纹组合 | 63 |
| `StubRequestHandling` | 测试侧请求码 1 读取字符串、写入回复，未知码和拒绝分支 | 61 |
| `StubRequestLedger` | 测试侧请求记录的代码、负载、回复、处理结果和选项顺序 | 56 |
| `StubStress` | 测试侧批量请求、混合代码、拒绝次数和多轮记录一致性 | 53 |

### 测试侧 RPC 协议与消息契约：8 个套件，466 条

本组使用测试侧消息序列、选项和请求记录，不调用系统 RPC 接口。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CursorContractTest` | 测试侧消息游标、读写次数、未知码不消费、回绕与回收 | 60 |
| `ErrorCodeContractTest` | 测试侧成功、拒绝、未存活、已回收错误码和结果统计 | 59 |
| `OptionContractTest` | 测试侧同步/异步标志、等待时间、同步覆盖与描述字符串 | 58 |
| `ProtocolCatalogTest` | 测试侧请求码、回复、描述符、生命周期事件与协议常量 | 60 |
| `ProtocolWorkflowTest` | 测试侧连接返回 Stub、请求分发、回复、断开与未知码组合 | 58 |
| `ReplyContractTest` | 测试侧默认/自定义回复、单次读取、未知码无回复及客户端隔离 | 57 |
| `RequestCodeMatrixTest` | 测试侧请求码边界、已知码、拒绝列表与请求记录矩阵 | 57 |
| `UnknownCodeMatrixTest` | 测试侧零、负值、大值和混合未知码的拒绝与空回复 | 57 |

### 测试侧输入、状态与会话校验：8 个套件，409 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `DescriptorValidation` | 测试侧默认、自定义和空描述符的保持、匹配与请求行为 | 53 |
| `InputValidation` | 测试侧请求码分类、边界数值、字符串输入与长度 | 50 |
| `LifecycleValidation` | 测试侧生命周期回调次数、状态、事件明细与流量指标 | 49 |
| `LogValidation` | 测试侧日志级别、容量、顺序、查找、计数与清理 | 50 |
| `PayloadValidation` | 测试侧默认、空白、多语言和长负载的记录与回复 | 51 |
| `SessionValidation` | 测试侧消息会话读写、游标、回收和选项字段 | 49 |
| `StateValidation` | 测试侧服务状态转换、回调计数、日志和事件一致性 | 51 |
| `WantValidation` | 测试侧服务/客户端 Want 的包名、Ability、设备字段和匹配 | 56 |

### 测试侧服务生命周期与状态：8 个套件，438 条

onCreate、onRequest、onConnect、onDisconnect 和 onDestroy 均调用测试侧服务模型的方法。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `OnConnectLifecycle` | 测试侧连接返回新 Stub、描述符、连接计数与快照隔离 | 55 |
| `OnCreateLifecycle` | 测试侧初始/创建状态、日志、事件、重复创建和快照 | 60 |
| `OnDestroyLifecycle` | 测试侧销毁状态、计数、历史记录与生命周期回调组合 | 54 |
| `OnDisconnectLifecycle` | 测试侧断开状态、计数、Stub 保持、事件与重置 | 55 |
| `OnRequestLifecycle` | 测试侧请求次数、startId、状态保持、日志与事件明细 | 58 |
| `ReconnectLifecycle` | 测试侧多次连接/断开、新 Stub 替换、独立记录与累计计数 | 53 |
| `ResourceManagement` | 测试侧消息回收、Stub 存活、记录清理和状态重置 | 52 |
| `StatePersistence` | 测试侧服务快照的状态、计数、相等性、复制隔离与重建 | 51 |

### 测试侧组合流程：4 个套件，220 条

组合流程在同一进程内使用测试侧服务、Stub 和客户端，没有与实际 IPC_Client 应用通信。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `IntegrationConnectivity` | 测试侧服务连接、断开、重连、Stub 丢失与计数组合 | 55 |
| `IntegrationPipeline` | 测试侧编码、分发、处理、回复和解码阶段及阶段记录 | 57 |
| `IntegrationSystem` | 测试侧服务回调、独立 Stub、消息往返、事件与指标组合 | 53 |
| `IntegrationUserScenarios` | 测试侧初始连接、同连接多次发送、断开与完整用户流程 | 55 |

### 测试侧批次与稳定性场景：4 个套件，211 条

检查请求数量、处理率、记录容量和多轮状态，不提供真实 IPC 吞吐量、时延或进程内存结论。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `PerformanceStabilityConcurrencyControl` | 顺序脚本模拟多客户端交替请求，检查共享记录与各自回复隔离 | 51 |
| `PerformanceStabilityLongTerm` | 测试侧千次请求、混合负载、生命周期计数和日志一致性 | 51 |
| `PerformanceStabilityMemoryLeak` | 测试侧日志容量、序列回收、反复重置和记录数量 | 56 |
| `PerformanceStabilityThroughput` | 测试侧请求批次的处理率、拒绝分布、记录与指标累计 | 53 |

### 测试侧描述符、负载与日志规则：4 个套件，242 条

允许列表、指纹校验和脱敏属于测试侧辅助实现，不代表生产服务具有对应安全校验接口。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `DescriptorSecurityTest` | 测试侧描述符格式、注册表、指纹校验、篡改检测与长度边界 | 58 |
| `LogSecurityTest` | 测试侧日志换行、控制字符、格式标记清理与处理计数 | 62 |
| `PayloadSecurityTest` | 测试侧敏感标记识别、负载脱敏、长文本缩略与摘要 | 66 |
| `StubSecurityTest` | 测试侧描述符允许列表、请求准入、已知/未知码与拒绝行为 | 56 |

### 测试侧故障注入：1 个套件，54 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `FaultInjectionTest` | 测试侧 Stub 未存活、拒绝码、空序列、回收序列与错误结果 | 54 |

### 测试侧负载矩阵：1 个套件，62 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `PayloadMatrixTest` | 测试侧空白、Unicode、长字符串和混合负载的消息矩阵 | 62 |

### 测试侧快照回归：1 个套件，64 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `SnapshotRegressionTest` | 测试侧连接、请求、断开、销毁和重连场景的固定快照与事件 | 64 |

### 测试侧常量契约：1 个套件，74 条

本组常量来自 SharedDriver.ets，不是生产模块导出的常量。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConstantContractTest` | 测试侧描述符、包名、请求/回复、事件、错误码和选项常量 | 74 |
