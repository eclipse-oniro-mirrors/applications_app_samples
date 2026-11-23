# IPC_Client 测试用例

当前自动化使用测试侧 SharedDriver 构造连接、代理、死亡通知、消息序列、请求结果和组合流程。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 测试环境，主应用与测试 HAP 已安装。
自动化不需要两端应用实际连接或操作页面；下表自动化结果来自已有归档，功能摘要不重复计数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 连接与会话状态 | 使用测试侧 ConnectionModel / WantModel | 连接、成功/失败回调、重复连接和不同连接 ID | 目标字段、连接状态、ID、事件与提示符合测试侧契约 | 是，辅助逻辑 | Pass（归档汇总） |
| 字符串请求与回复 | 使用测试侧代理、Stub 和消息序列 | 请求码 1，hello world、空白、Unicode 和长文本 | 请求原样传递，默认回复为 hello rpc，结果与记录正确 | 是，辅助逻辑 | Pass（归档汇总） |
| 协议与消息序列 | 使用测试侧消息序列和选项 | 已知/未知请求码、读写、回绕、回收及同步/异步标志 | 请求分类、游标、计数与选项字段符合辅助逻辑 | 是，辅助逻辑 | Pass（归档汇总） |
| 死亡通知、断开与重连 | 使用测试侧代理和死亡通知对象 | 注册、注销、模拟死亡、断开、失败后重连与重置 | 通知计数、代理引用、连接 ID、提示和恢复状态符合断言 | 是，辅助逻辑 | Pass（归档汇总） |
| 日志、快照与批次场景 | 使用测试侧日志、快照和指标逻辑 | 多轮发送、容量边界、敏感文本与给定时间窗口 | 记录数量、快照隔离、辅助脱敏与指标计算正确 | 是，辅助逻辑 | Pass（归档汇总） |
| 拉起应用 | 安装sample | 无 | 成功拉起应用 | 否，需人工验证 | Pass |
| 检测首页UI | 进入首页 | 无 | 首页UI显示正常 | 否，需人工验证 | Pass |
| 连接服务 | connecAbility 按钮显示正常 | 点击 connecAbility 按钮 | 因服务端在后台运行，连接服务成功，弹窗显示“connectAbility success”，符合预期 | 否，需人工验证 | Pass |
| 发送字符串信息 | sendRequest_String 按钮显示正常 | 点击 sendRequest_String 按钮 | 成功发送消息，并接收服务端返回的字符串，弹窗显示“sendRequest success”，符合预期 | 否，需人工验证 | Pass |
| 断开连接 | disconnecAbility 按钮显示正常 | 点击 disconnecAbility 按钮 | 成功断开服务，弹窗显示“disconnectAbility success”，符合预期 | 否，需人工验证 | Pass |
| 死亡回调 | 服务端应用手动kill或进行退出后台 | 手动清理服务端所在后台应用 | 服务端死亡，符合预期 | 否，需人工验证 | Pass |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **49 个套件、2,648 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 50 个 `.test.ets` 文件，其中 List 只负责注册；Shared 辅助文件不计为套件。
下表使用真实 `describe` 名称，可用于 `-s class`。数量按源码 `it` 定义统计。
各表按目录组织；套件名中的 Ability、Integration、Security、Performance 不扩大其实际执行范围。

### 入口相关数据场景：1 个套件，3 条

AbilityTest 使用测试侧会话和协议规则，没有启动真实 Ability。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AbilityTest` | 测试侧目标 Want、已连接会话、请求字符串与请求码规则；未启动 EntryAbility | 3 |

### 测试侧客户端模型与连接流程：8 个套件，379 条

ConnectionModel、RemoteProxyModel、RemoteStubModel 和消息序列均定义在 SharedDriver.ets 中。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ClientConnectionLifecycle` | 测试侧连接请求、连接 ID、回调、重复连接拒绝与重连 | 47 |
| `ClientDeathRecipient` | 测试侧死亡通知注册、注销、回调计数和重置 | 47 |
| `ClientMessageSequence` | 测试侧字符串序列的写入、读取、游标、回绕与回收 | 47 |
| `ClientProxyModel` | 测试侧代理描述符、死亡通知、请求计数、发送失败与存活状态 | 47 |
| `ClientRequestResult` | 测试侧请求结果错误码、回复文本、读取游标与成功判定 | 50 |
| `ClientSendFlow` | 测试侧字符串写入、代理发送、Stub 接收、回复与错误分支 | 47 |
| `ClientSessionBasics` | 测试侧连接、发送、断开和重新连接的会话组合 | 47 |
| `ClientStateMachine` | 测试侧 disconnected/connecting/connected/failed 状态与事件转换 | 47 |

### 测试侧 RPC 协议与消息契约：8 个套件，490 条

本组使用测试侧消息序列、选项和代理，不调用系统 RPC 接口。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ClientCursorBehavior` | 测试侧消息序列游标、读写计数、回绕、回收与请求消费 | 62 |
| `ClientDescriptorContract` | 测试侧 Stub/代理描述符的传递、保持和字符串契约 | 62 |
| `ClientErrorCodes` | 测试侧连接、断开、发送、无效代理和死亡注册错误码 | 61 |
| `ClientMessageOption` | 测试侧同步/异步标志、等待时间、复制与选项描述 | 59 |
| `ClientProtocolCodes` | 测试侧请求码 1、未知码分类、固定请求文本与处理结果 | 63 |
| `ClientProtocolWorkflow` | 测试侧连接、序列写入、分发、回复读取与资源回收组合 | 61 |
| `ClientReplyContract` | 测试侧固定及自定义回复、结果序列、读取次数与文本保持 | 62 |
| `ClientUnknownCodes` | 测试侧未知请求码拒绝、混合发送计数与回复隔离 | 60 |

### 测试侧输入、状态与提示校验：8 个套件，469 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConnectIdValidation` | 测试侧连接 ID 默认哨兵、参数保存、断开准入与重连更新 | 61 |
| `ErrorValidation` | 测试侧错误码常量、非零判定、失败回调与日志 | 56 |
| `LogValidation` | 测试侧日志级别、容量、顺序、计数、查找与实例隔离 | 55 |
| `PayloadValidation` | 测试侧空白、多语言、长文本和默认请求/回复的数据保持 | 59 |
| `SessionValidation` | 测试侧会话工厂、代理、死亡通知、Want 与多会话隔离 | 57 |
| `StateValidation` | 测试侧状态常量、回调转换、连接标志和事件数量 | 57 |
| `ToastContractValidation` | 测试侧连接、发送、断开提示文案及提示顺序 | 59 |
| `WantValidation` | 测试侧包名、Ability 名、空值、空格、匹配与字段保持 | 65 |

### 测试侧生命周期与状态恢复：8 个套件，437 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConfigurationChanges` | 测试侧 Want、包名、时长、消息选项和配置匹配 | 64 |
| `ConnectLifecycle` | 测试侧连接、代理挂接、死亡通知注册、成功提示和重置 | 50 |
| `DeathLifecycle` | 测试侧代理死亡、通知计数、发送失败与注销后行为 | 53 |
| `DisconnectLifecycle` | 测试侧断开请求、代理清理、ID 重置、提示与模拟探测时长 | 50 |
| `ReconnectFlow` | 测试侧断开或失败后的连接 ID、代理替换与再次发送 | 50 |
| `ResourceManagement` | 测试侧序列回收、代理注册解除、事件/日志清理与重置 | 59 |
| `StatePersistence` | 测试侧客户端快照、提示数量、事件和日志保持 | 59 |
| `StateRecovery` | 测试侧发送故障、连接失败、代理丢失后的重试与状态恢复 | 52 |

### 测试侧组合流程：4 个套件，204 条

组合流程在同一进程内使用测试侧客户端、代理和 Stub，没有连接实际 IPC_Stub 应用。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConnectivityIntegration` | 测试侧连接请求、回调、断开、失败和重新连接组合 | 50 |
| `PipelineIntegration` | 测试侧序列构造、写入、代理分发、Stub 处理与回复读取流水线 | 50 |
| `SystemIntegration` | 测试侧连接、注册、发送、断开、提示、快照与指标组合 | 52 |
| `UserScenarios` | 测试侧首次连接、未连接发送、重复请求、失败提示与重连场景 | 52 |

### 测试侧批次与稳定性场景：4 个套件，195 条

检查批次计数、状态、容量及给定时间窗口的计算，不提供真实 IPC 吞吐量、时延或进程内存结论。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConcurrencyControl` | 顺序脚本模拟连接请求突发、多会话发送与事件计数 | 50 |
| `LongTermStability` | 测试侧多轮发送、混合失败、日志、回复和指标一致性 | 46 |
| `MemoryLeakDetection` | 测试侧序列回收、日志容量、代理重置与记录数量 | 51 |
| `ThroughputProfile` | 测试侧给定时间窗口的吞吐量计算、成功率和批次指标 | 48 |

### 测试侧描述符、负载与日志规则：4 个套件，238 条

允许列表、格式检查和脱敏属于测试侧辅助实现，不代表生产页面具有对应安全校验接口。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `DescriptorSecurity` | 测试侧描述符格式、允许列表、代理描述符与死亡通知注销 | 59 |
| `IpcSecurity` | 测试侧目标包名/Ability 允许列表、代理存活和请求准入 | 60 |
| `LogSecurity` | 测试侧日志换行清理、级别、容量与内容检查 | 58 |
| `PayloadSecurity` | 测试侧敏感标记检测、字符串掩码、日志脱敏与指纹 | 61 |

### 测试侧故障注入：1 个套件，57 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `FaultInjection` | 测试侧连接失败、无代理、死亡代理、Stub 拒绝、发送和序列回收故障 | 57 |

### 测试侧负载矩阵：1 个套件，59 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `PayloadMatrix` | 测试侧空字符串、空白、Unicode、长文本和重复负载矩阵 | 59 |

### 测试侧快照回归：1 个套件，57 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `SnapshotRegression` | 测试侧默认、连接、发送、失败、断开和重置快照回归 | 57 |

### 测试侧常量契约：1 个套件，60 条

本组常量来自 SharedDriver.ets，不是生产模块导出的常量。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConstantContract` | 测试侧包名、描述符、请求/回复、提示、时长、状态和错误码常量 | 60 |
