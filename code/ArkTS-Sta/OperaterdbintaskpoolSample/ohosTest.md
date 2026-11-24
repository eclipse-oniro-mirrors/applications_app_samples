# OperaterdbintaskpoolSample 测试用例

本文参考 CameraSample 的 ohosTest.md 结构，按 2026-11-21 当前源码整理。
当前自动化直接使用生产 Contact / RouterParams / ContactManager 和常量，并在测试侧辅助逻辑中构造存储、队列、路由、校验和组合流程。
人工用例沿用原表结果；新增自动化摘要本次未复验。本次仅更新说明，未构建、安装或运行测试。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 静态测试环境，主应用与测试 HAP 已安装。
自动化不访问真实数据库或操作应用页面；下表功能摘要不重复计数，原表人工用例本次未复验。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 联系人模型与路由参数 | 可导入生产 Contact / RouterParams | 默认及不同参数构造，字段赋值和引用传递 | 六字段默认值、赋值结果及 text/data 参数保持正确 | 是 | 本次未复验 |
| 联系人管理器 | 可导入生产 ContactManager | 设置、读取、追加、同名更新、删除及重置 | 单例保持，列表复制、初次匹配更新和同名删除符合实现 | 是 | 本次未复验 |
| 联系人输入与分类 | 使用测试侧校验、搜索和分类逻辑 | 空值、长度边界、电话、邮箱、重名、关键词与分类 | 错误码、提交资格、搜索结果和分组顺序符合测试侧契约 | 是，辅助逻辑 | 本次未复验 |
| 数据库常量与字段映射 | 可导入生产 SQL / 数据库常量，使用测试侧解析和映射 | 建表语句、六字段 Bucket、游标位置及重复记录 | 结构解析、映射往返、跳过首行和去重符合辅助逻辑断言 | 是，辅助逻辑 | 本次未复验 |
| 存储与任务编排 | 使用测试侧 StoreDouble / TaskPoolQueue | 初始化、分批写入、增删改查、提交完成及故障输入 | 数据、操作计数、完成顺序和错误回退符合测试侧契约 | 是，辅助逻辑 | 本次未复验 |
| 生命周期与组合流程 | 使用生产管理器及测试侧页面、草稿、存储和快照逻辑 | 页面出现、编辑提交/取消、重载、多轮变更与重置 | 模型字段、存储副本、快照与列表状态符合组合断言 | 是，辅助逻辑 | 本次未复验 |
| 新增联系人 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3.进入【在TaskPool线程中操作关系型数据库实现案例】| 1、点击右下角蓝色加号按钮 <br/> 2、输入姓名：艾森宝，电话：18855558888，邮箱：aisengbao@example.com,地址：安徽省合肥市，点击“√”保存 | 1、跳转至新增联系人页 <br/> 2、好友添加成功并返回通讯录列表页刷新列表数据 | 否    | Pass |
| 编辑联系人 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3.进入【在TaskPool线程中操作关系型数据库实现案例】| 1、点击通讯录好友【艾伦】<br/> 2、选中编辑项 <br/> 3、修改电话、邮箱、地址后，点击“√”保存按钮 | 1、进入【艾伦】联系人详情页 <br/> 2、跳转至编辑联系人页面 <br/> 3、好友信息修改成功并返回联系人详情页且刷新数据 | 否    | Pass |
| 删除联系人 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3.进入【在TaskPool线程中操作关系型数据库实现案例】| 1、点击通讯录好友【艾伦】 <br/> 2、点击删除按钮 | 1、进入【艾伦】联系人详情页 <br/> 2、好友信息删除成功并返回通讯录列表页刷新列表数据 | 否    | Pass |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **80 个套件、2,871 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 81 个 `.test.ets` 文件，其中 List 只负责注册；Shared 辅助文件不计为套件。
下表使用真实 `describe` 名称，可用于 `-s class`。数量按源码 `it` 定义统计。
各表按目录组织；套件名不扩大其实际执行范围。

### 入口相关数据场景：1 个套件，5 条

AbilityTest 检查生产模型和单例，没有启动真实 Ability。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AbilityTest` | 生产 Contact、RouterParams 和 ContactManager 的默认值、参数与单例；未启动 EntryAbility | 5 |

### 生产联系人模型与测试侧投影：17 个套件，686 条

Contact、RouterParams 和 ContactManager 来自生产代码；搜索、分类、路由意图、映射、快照和存储副本来自测试侧辅助实现。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ContactAggregateDeep` | 生产 Contact 字段、测试侧种子数据、快照、集合指标与映射组合 | 36 |
| `ContactCatalog` | 测试侧 15 条预置联系人的字段、排列、分类与名称唯一性 | 39 |
| `ContactCategoryModel` | 测试侧分类投影的初次出现顺序、数量与数据变更 | 40 |
| `ContactDefaults` | 生产 Contact 的默认字段、赋值、实例隔离与管理器空列表 | 41 |
| `ContactDeleteFlow` | 生产 ContactManager 按姓名删除、同名全删、未命中与顺序保持 | 37 |
| `ContactDirectoryModel` | 生产联系人集合的测试侧名称、搜索、分类、快照与指标投影 | 40 |
| `ContactEditDraft` | 测试侧草稿复制、修改隔离及生产 ContactManager 更新 | 37 |
| `ContactFieldSemantics` | 测试侧 ContactMapper 的六字段映射、键顺序与往返 | 39 |
| `ContactLedger` | 生产 ContactManager 与测试侧 StoreDouble 的增删改查记录一致性 | 41 |
| `ContactManagerBasics` | 生产管理器单例、列表读写、浅复制、追加与重置 | 39 |
| `ContactManagerDuplicates` | 生产管理器同名追加、初次匹配更新和同名全部删除 | 40 |
| `ContactManagerMutation` | 生产管理器追加、更新、删除组合及列表顺序 | 36 |
| `ContactManagerQueries` | 生产管理器列表读取及测试侧搜索、分类和指标查询 | 43 |
| `ContactModelBasics` | 生产 Contact 构造参数、字段赋值、对象身份与 RouterParams | 45 |
| `ContactProfileView` | 生产 Contact 字段的测试侧详情投影、选择与路由数据 | 40 |
| `ContactRouteNegotiation` | 测试侧新增、编辑、删除动作到路由字符串和参数的映射 | 46 |
| `RouterParamsCore` | 生产 RouterParams 的 text/data 字段、空值与 Contact 引用保持 | 47 |

### 测试侧联系人校验：8 个套件，368 条

格式、必填、重名和长度规则由测试侧 ContactValidation 等辅助逻辑执行。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AddressLengthValidation` | 测试侧地址为空、长度边界、Unicode 与错误码顺序 | 48 |
| `CategoryIndexValidation` | 测试侧 A-F 分类常量、分组顺序、计数与搜索组合 | 43 |
| `ContactEditValidation` | 测试侧表单必填、格式、长度、重名和错误列表 | 45 |
| `ContactFieldLimits` | 生产长度常量及测试侧姓名、电话、邮箱、地址的长度边界 | 45 |
| `DuplicateNameValidation` | 测试侧精确姓名重复检查及表单提交资格 | 44 |
| `EmailAddressValidation` | 测试侧邮箱 @/点号位置、长度、空值与错误码 | 50 |
| `PhoneFormatValidation` | 测试侧电话号码纯数字、长度、空值与错误码 | 46 |
| `SearchFilterValidation` | 测试侧姓名子串搜索、空关键词、结果复制、顺序与分类 | 47 |

### 生产 SQL 常量与测试侧数据库逻辑：9 个套件，346 条

建表 SQL 和数据库常量来自生产代码；StoreDouble、CursorResultSet 和映射函数属于测试侧，不访问真实关系型数据库。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BatchInsertValidation` | 测试侧批量插入的数量、顺序、分批追加与空批次 | 35 |
| `ConnectionLifecycleValidation` | 测试侧存储初始化、上下文、调用计数和复用 | 39 |
| `CursorMatrix` | 测试侧游标初始位置、跳过首行、去重、字段读取和关闭矩阵 | 42 |
| `MutationOrchestrationValidation` | 测试侧存储单条插入、更新、删除、影响行数和顺序 | 35 |
| `PersistenceConsistencyValidation` | 测试侧存储与生产管理器之间的字段、快照和列表一致性 | 35 |
| `QueryOrchestrationValidation` | 测试侧存储查询、无效上下文、空结果、字段与顺序 | 37 |
| `RdbSchemaValidation` | 生产建表 SQL 经测试侧解析后的表名、七列、主键与约束 | 43 |
| `ResultSetMappingValidation` | 测试侧游标移动、字段映射、跳过首行、去重与关闭 | 37 |
| `SqlStatementValidation` | 生产建表 SQL 与测试侧查询、更新、删除语句和绑定参数 | 43 |

### 测试侧生命周期与状态恢复：8 个套件，302 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConfigurationLifecycle` | 生产数据库、表名、长度常量及测试侧配置快照和结构解析 | 43 |
| `DatabaseInitLifecycle` | 测试侧初次初始化、缺少上下文、建表计数和缓存清理 | 38 |
| `EditSessionLifecycle` | 测试侧编辑副本、提交、取消与生产管理器/存储副本同步 | 32 |
| `ErrorRecoveryLifecycle` | 测试侧错误回退、重试、上下文恢复与操作记录 | 37 |
| `PageAppearLifecycle` | 测试侧页面出现时的种子装载、单次导入和动作处理 | 37 |
| `SessionPersistenceLifecycle` | 测试侧快照归档、存储重载、生产管理器恢复与复制隔离 | 36 |
| `StateResetLifecycle` | 生产管理器重置与测试侧存储、队列、快照和状态重建 | 42 |
| `StoreReuseLifecycle` | 测试侧存储复用、初始化次数、增删改查与调用计数 | 37 |

### 测试侧组合流程：9 个套件，364 条

组合流程使用生产联系人模型和管理器，以及测试侧路由、存储、队列、游标和校验逻辑，不是页面或真实数据库的端到端执行。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AddContactEndToEnd` | 测试侧新增路由、草稿、校验、存储写入与生产管理器组合 | 41 |
| `BatchImportIntegration` | 测试侧预置数据批量导入、查询、游标映射与生产管理器组合 | 43 |
| `CategoryIntegration` | 生产联系人集合的测试侧分类、搜索与增删改后的分组 | 43 |
| `CrossLayerRegression` | 生产管理器与测试侧存储、快照、指标和投影的组合回归 | 36 |
| `DatabaseInitIntegration` | 测试侧存储初次初始化、重复初始化、建表和批量装载 | 44 |
| `DeleteContactEndToEnd` | 测试侧删除路由、存储删除和生产管理器刷新组合 | 41 |
| `EditContactEndToEnd` | 测试侧编辑路由、草稿复制、校验、存储与生产管理器更新 | 36 |
| `FullDirectoryJourney` | 测试侧通讯录装载、队列、增删改查与生产管理器完整组合 | 36 |
| `MutationJourneyMatrix` | 测试侧新增、编辑、删除、查询、分类和游标映射的流程矩阵 | 44 |

### 联系人变更与测试侧增量场景：4 个套件，89 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AddEditDeleteInterleaving` | 生产管理器增删改交错执行后的字段、数量与顺序 | 20 |
| `BatchImportIncremental` | 测试侧存储增量分批导入、返回数量与已有数据保持 | 22 |
| `DeleteThenRecreate` | 生产管理器删除后重新追加的字段、尾部位置与数量 | 22 |
| `DuplicateNameConflict` | 测试侧重名提交规则与生产管理器同名记录行为 | 25 |

### 测试侧操作与完成顺序：4 个套件，96 条

交错由顺序脚本及 TaskPoolQueue 模拟，没有调用系统 taskpool 执行并发任务。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConcurrentMutationOrder` | 顺序脚本模拟不同变更次序，核对生产管理器和测试侧存储结果 | 22 |
| `InitFirstQueryRace` | 测试侧初次查询、初始化先后关系、空结果与计数 | 26 |
| `SubmitCompleteDecoupling` | 测试侧任务队列提交、运行、完成、失败和完成顺序 | 25 |
| `TaskCompletionFanout` | 测试侧批量完成后的存储、指标、队列和名称投影 | 23 |

### 测试侧数据库故障注入：4 个套件，107 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `MissingContextFaults` | 测试侧缺失上下文时的查询、批量插入、初始化和回退 | 27 |
| `PartialBatchFailure` | 测试侧分批写入部分失败、已有行保留和返回数量 | 25 |
| `SqlExecutionFault` | 测试侧 SQL 错误回退、部分结果、绑定参数与元字符 | 28 |
| `StoreInitFailure` | 测试侧初始化失败、插入拒绝、状态保持与后续恢复 | 27 |

### 联系人字段与测试侧数据矩阵：4 个套件，114 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CategoryIndexMatrix` | 测试侧 A-F 分类、计数、顺序及空分类矩阵 | 27 |
| `FieldValueMatrix` | 生产 Contact 字段默认值与测试侧 Bucket 映射、校验矩阵 | 27 |
| `InjectionCharacterMatrix` | 测试侧 SQL 元字符、控制字符、数据库名和原文存储矩阵 | 30 |
| `UnicodeEmojiMatrix` | 生产 Contact 多语言/Emoji 字段及测试侧长度、校验和脱敏 | 30 |

### 测试侧批次与稳定性场景：4 个套件，149 条

检查批次数量、操作计数、数据一致性和保留容量，不提供真实数据库吞吐量、执行时延或进程内存结论。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BatchInsertPerformance` | 测试侧不同批次规模的写入数量、顺序、调用计数和记录 | 39 |
| `ConcurrentMutationStability` | 顺序脚本模拟多种变更，核对生产管理器与测试侧存储一致性 | 35 |
| `LongRunStability` | 测试侧多轮增删改查、存储复用、生产管理器与快照一致性 | 38 |
| `MemoryFootprintStability` | 测试侧反复重建、队列排空、有界日志与存储/缓存数量 | 37 |

### 测试侧日志与敏感字段处理：2 个套件，78 条

脱敏和日志检查由测试侧辅助实现执行，不代表生产页面自动对联系人数据脱敏。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `PathAndLogSafety` | 测试侧日志文案、数字片段、标识符、路径和占位符检查 | 39 |
| `SensitiveFieldHandling` | 测试侧电话、邮箱、地址的脱敏投影及原始数据保持 | 39 |

### 测试侧表单与列表语义：2 个套件，58 条

检查数据投影、动作和文本顺序，没有驱动屏幕阅读器或读取真实 UI 无障碍树。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `FormControlSemantics` | 测试侧表单动作、路由、必填错误与字段顺序 | 31 |
| `ListSemanticOrder` | 生产管理器数据的测试侧朗读文本、列表顺序与变更后位置 | 27 |

### 生产常量与测试侧结构契约：2 个套件，60 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConstantContract` | 生产表名、数据库名、长度常量及测试侧操作与 SQL 常量 | 30 |
| `SchemaContract` | 生产建表 SQL 的测试侧结构解析、字段、游标和映射契约 | 30 |

### 联系人快照与长序列回归：2 个套件，49 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `LongSequenceStability` | 生产管理器长序列追加、删除、更新和测试侧快照统计 | 22 |
| `SnapshotRegression` | 测试侧联系人快照字段、相等性、顺序与后续修改隔离 | 27 |
