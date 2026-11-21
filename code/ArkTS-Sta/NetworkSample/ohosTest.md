# NetworkSample 测试用例

本文参考 CameraSample 的 ohosTest.md 结构，按 2026-11-21 当前源码整理。
当前自动化使用测试侧 SharedDriver 构造任务、配置、锁、轮询、日志和组合流程。
自动化结果引用同日已有 DevEco 全量归档；人工用例沿用原表结果。本次仅更新说明，未构建、安装或运行测试。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 静态测试环境，主应用与测试 HAP 已安装。
测试不发起真实下载或操作应用页面；下表自动化 Pass 来自已有归档全量报告，功能摘要不重复计数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 任务模型与进度 | 使用测试侧 DownloadTask | 创建任务，启动，更新进度，完成、失败及重置 | 字段、状态转换、0-100 进度范围和标签符合测试侧契约 | 是，辅助逻辑 | Pass（归档全量） |
| 多任务依赖与锁 | 使用测试侧 TaskGraph / DependencyLock | 启动 A/B，按不同次序完成并轮询 C | A/B 共享持有，二者完成后 C 可独占启动，事件顺序正确 | 是，辅助逻辑 | Pass（归档全量） |
| 下载配置与 URL | 使用测试侧 DownloadConfig 和 URL 工具 | A/B/C 固定 URL、空值、协议、路径及配置字段组合 | 配置字段、字符串解析及校验错误符合辅助逻辑 | 是，辅助逻辑 | Pass（归档全量） |
| 生命周期与恢复 | 使用测试侧任务图和重试策略 | 重复启动、中断、创建失败、超时、重试与重置 | 状态、尝试次数、延迟和恢复后的记录符合断言 | 是，辅助逻辑 | Pass（归档全量） |
| 轮询与批次场景 | 使用测试侧 PollClock 和任务图 | 多轮 tick、运行、清理及不同任务完成顺序 | 模拟时间、轮询次数、锁释放和进度汇总正确 | 是，辅助逻辑 | Pass（归档全量） |
| 日志、快照与标签 | 使用测试侧日志、快照及标签函数 | 不同日志级别、容量、URL 凭据、快照与进度文本 | 记录顺序、容量、脱敏、复制隔离和文本顺序符合契约 | 是，辅助逻辑 | Pass（归档全量） |
| 多任务依赖执行 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap | 点击启动所有任务按钮 | 任务A、B开始执行，A、B执行完成后任务C开始执行 | 否    | Pass |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **74 个套件、2,685 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 75 个 `.test.ets` 文件，其中 List 只负责注册；Shared 辅助文件不计为套件。
下表使用真实 `describe` 名称，可用于 `-s class`。数量按源码 `it` 定义统计。
各表按目录组织；套件名不扩大其实际执行范围。

### 入口相关数据场景：1 个套件，5 条

AbilityTest 使用测试侧任务图、URL 和依赖规则，没有启动真实 Ability。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AbilityTest` | 测试侧任务图的 A/B/C 顺序、URL 与依赖关系；未启动 EntryAbility | 5 |

### 测试侧任务图与调度规则：18 个套件，732 条

本组行为定义在 SharedDriver.ets 中，检查 DownloadTask、TaskGraph、DependencyLock 和 PollClock。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CoreConcurrency` | 测试侧共享锁、独占锁、A/B 完成次序与 C 的启动条件 | 34 |
| `CoreConsistency` | 相同脚本下任务状态、事件、配置、聚合值和锁状态的一致性 | 31 |
| `CoreEndToEnd` | 测试侧三任务从初始、启动、完成到轮询放行的完整数据流程 | 33 |
| `CoreErrorRecovery` | 测试侧启动错误分类、失败状态、重试次数与延迟规则 | 36 |
| `CoreGateMatrix` | A/B 完成组合、C 准入、拓扑完成顺序与重置 | 47 |
| `CoreGraph` | 测试侧任务图的三任务结构、查找、依赖、汇总与快照 | 46 |
| `CoreLifecycle` | 测试侧任务创建、启动、进度、完成、失败和重置 | 35 |
| `CoreModelDeep` | 测试侧锁持有者、获取计数、独占等待与任务图组合 | 53 |
| `CoreOperationCatalog` | 测试侧启动、进度、完成、轮询操作及对应事件记录 | 52 |
| `CoreOperationFlow` | 测试侧不同任务完成顺序、门控与事件先后关系 | 41 |
| `CoreOperationWorkflow` | 测试侧启动、配置、A/B 完成、C 放行和重置组合 | 40 |
| `CoreOperations` | 测试侧任务查找、进度更新、完成、失败与运行计数 | 47 |
| `CoreProgressLedger` | 测试侧单任务进度、总进度、平均值、边界与重置 | 40 |
| `CoreRunConfiguration` | 测试侧下载配置的字段、校验、复制、相等性与文件名提取 | 55 |
| `CoreScheduling` | 测试侧 200 ms 轮询时钟、累计时间、C 启动和停止 | 40 |
| `CoreStateManagement` | 测试侧运行标志、任务状态、事件与快照读取 | 35 |
| `CoreStress` | 测试侧重复运行、重置、轮询和快照批次的计数与状态 | 29 |
| `CoreTaskModel` | 测试侧 DownloadTask 字段、状态转换、进度约束与文本投影 | 38 |

### 测试侧资源与会话校验：9 个套件，351 条

URL 检查处理字符串与配置，不访问远程资源。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `InterruptionRecovery` | 测试侧中断、单个前置任务完成、重试预算与重新运行 | 37 |
| `OfflineResource` | 测试侧空白、相对路径和离线 URL 字符串的配置校验 | 35 |
| `ResourceNotice` | 测试侧通知日志的级别、计数、容量、顺序与清理 | 36 |
| `ResourceOrigin` | 测试侧固定 URL 字面值、主机、路径、文件名与扩展名 | 42 |
| `ResourceSession` | 测试侧会话内配置查找、复制、字段保持与相等性 | 37 |
| `ResourceSource` | 测试侧不同来源字符串的配置校验、解析和顺序 | 37 |
| `SessionValidation` | 测试侧启动标志、重复启动拒绝、任务完成与会话重置 | 37 |
| `TransferToolValidation` | 测试侧进度边界、URL 拆分、数组工具与文本指纹 | 41 |
| `UrlSecurityMatrix` | 测试侧 HTTPS 前缀、空主机、空白和特殊 URL 输入矩阵 | 49 |

### 测试侧传输契约与边界：8 个套件，344 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BoundaryTransfers` | 测试侧任务进度上下界、状态、标签与完成值 | 44 |
| `TransferConfiguration` | 测试侧 A/B/C 配置矩阵、复制、字段变更与相等性 | 39 |
| `TransferContract` | 测试侧下载 action、method、overwrite、saveas 和 URL 契约 | 42 |
| `TransferEvents` | 测试侧事件记录的顺序、分类计数、末项、指纹与清理 | 42 |
| `TransferInput` | 测试侧空白、文件名、扩展名、主机、路径和查询串输入 | 46 |
| `TransferLogging` | 测试侧日志级别、容量淘汰、内容查找、指纹与清理 | 41 |
| `TransferResources` | 测试侧任务编号、URL、页面文案、颜色与错误码常量 | 45 |
| `TransferStateMachine` | 测试侧 idle/running/completed/failed 转换及重复操作 | 45 |

### 测试侧生命周期与状态恢复：9 个套件，374 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ErrorRecovery` | 测试侧错误码、启动中止、失败重试、延迟与恢复流程 | 45 |
| `ExceptionHandling` | 测试侧未知任务、重复回调、乱序完成和无效操作 | 46 |
| `ResourceManagement` | 测试侧轮询时钟、锁释放、日志容量与资源重置 | 42 |
| `RunLifecycle` | 测试侧任务图从初始、启动、依赖完成到重置的生命周期 | 38 |
| `RunRecoveryMatrix` | 测试侧半完成、失败、重置和恢复路径的状态矩阵 | 40 |
| `SessionManagement` | 测试侧重复启动、会话隔离、锁持有和完成次序 | 39 |
| `StateManagement` | 测试侧按钮状态投影、进度、事件、锁和重置 | 45 |
| `StatePersistence` | 测试侧运行快照、复制隔离、最新记录与事件保持 | 40 |
| `StateRecovery` | 测试侧半完成续跑、中途重置、失败和重新完成 | 39 |

### 测试侧组合流程：7 个套件，210 条

组合流程使用测试侧配置、任务图、锁、日志和指标，没有执行真实下载或页面操作。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdvancedScenarios` | 测试侧不同完成次序、门控、锁释放与重复启动组合 | 30 |
| `Compatibility` | 测试侧进度值、标签、URL 工具和三任务行为的一致性 | 30 |
| `ComprehensiveRegression` | 测试侧多任务图隔离、配置、指标、事件和快照回归 | 30 |
| `Connectivity` | 测试侧 URL 配置、错误分类与网络失败状态；未建立网络连接 | 30 |
| `PipelineTesting` | 测试侧配置、启动、进度、依赖、轮询和汇总的分阶段流程 | 30 |
| `SystemIntegration` | 测试侧任务图、锁、按钮状态投影、指标与事件组合 | 30 |
| `UserScenarios` | 测试侧首次启动、重复启动、任务完成和失败后重置场景 | 30 |

### 测试侧交错、重启与超时场景：3 个套件，82 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdvancedInterleaving` | 测试侧 A/B 分步或交错完成、进度更新与事件顺序 | 26 |
| `RestartAndRetry` | 测试侧完整运行后的重启、重试策略与状态清理 | 29 |
| `TimeoutRecovery` | 测试侧超时错误、重试延迟、轮询预算与恢复 | 27 |

### 测试侧锁与完成顺序：2 个套件，57 条

交错由顺序脚本模拟，未调用生产 AsyncLock。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `LockAcquisitionMatrix` | 测试侧共享/独占锁获取、释放、等待和计数矩阵 | 30 |
| `SimultaneousCompletion` | 测试侧同轮 A/B 完成、门控打开、C 单次启动与事件顺序 | 27 |

### 测试侧故障注入：2 个套件，51 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CallbackLoss` | 测试侧完成回调缺失、进度到达 100、门控等待与恢复 | 25 |
| `CreateFailure` | 测试侧创建失败码、无效配置、启动失败和错误分类 | 26 |

### 测试侧数据矩阵：2 个套件，55 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ProgressPercentageMatrix` | 测试侧进度百分比、标签文本、比例与边界矩阵 | 26 |
| `UrlStructureMatrix` | 测试侧 URL 协议、主机、路径、文件名、扩展名与查询串矩阵 | 29 |

### 测试侧批次与稳定性场景：5 个套件，192 条

检查循环计数、模型状态、容量和模拟时钟，不提供实际网络吞吐量、耗时或进程内存结论。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConcurrencyControl` | 测试侧交错完成、共享/独占锁和轮询放行后的状态 | 39 |
| `LongTermStability` | 测试侧多轮任务完成、进度守恒、锁释放与重置 | 32 |
| `MemoryLeakDetection` | 测试侧有界日志、快照清理、锁和任务图重置后的保留数据 | 41 |
| `PollingPerformance` | 测试侧轮询周期、累计时间、停止和任务图轮询次数 | 40 |
| `QueueThroughputMatrix` | 测试侧多批任务完成、事件数量、进度总量与时钟累计 | 40 |

### 测试侧配置与脱敏规则：3 个套件，90 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AccessibilitySecurity` | 测试侧任务标签可区分性、百分号、按钮状态和文案字符串 | 30 |
| `SecurityValidation` | 测试侧 URL、action、method、overwrite 和保存路径校验 | 30 |
| `TransferSecurity` | 测试侧 URL 查询串与凭据脱敏及日志字符串保持 | 30 |

### 测试侧标签与语义顺序：1 个套件，27 条

检查标签字符串与顺序，没有驱动屏幕阅读器或读取真实 UI 无障碍树。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `SemanticOrderModel` | 测试侧任务标签中编号、文字、百分比的顺序和内容 | 27 |

### 测试侧常量契约：1 个套件，27 条

本组常量来自 SharedDriver.ets，不是生产模块导出的常量。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConstantContract` | 测试侧任务编号、URL、进度、状态、配置和页面文案常量 | 27 |

### 测试侧快照与组合回归：3 个套件，88 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CrossModuleRegression` | 测试侧配置、任务图、指标与日志在完整流程中的一致性 | 25 |
| `FingerprintRegression` | 测试侧任务文本、事件、快照、配置与文本指纹回归 | 40 |
| `SnapshotConsistency` | 测试侧快照顺序、最新记录、复制隔离、文本与清理 | 23 |
