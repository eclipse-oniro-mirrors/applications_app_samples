# SendableDataStore 测试用例归档

## 验证范围

本工程使用 Stage 模型. ArkTS. Hypium 1.0.6 和 OpenHarmony API version 26 SDK。测试覆盖应用启动. 首页导航. 共享首选项. 共享关系型数据库. Sendable Array/Map/Queue/Record. 数据迁移. 数据备份. 数据加密. 分布式数据管理以及配置和工具模块。

当前源码静态统计口径如下：

- **测试文件数**：34 个 `.test.ets` 文件，包含 `List.test.ets` 套件入口。
- **实际测试套件数**：33 个，`List.test.ets` 本身不注册用例。
- **测试用例数**：1599 条，按各文件中的 `it('caseName', ...)` 声明统计。
- **用例名称唯一性**：1599 条用例名称无重复。
- **自动化方式**：全部通过 Hypium 注册，UI 场景使用 `@kit.TestKit` Driver 操作。

用户已确认真机全量测试结果为 **1599/1599 通过**。本次工作仅整理文档和核对源码统计，未重新构建或执行测试。下文 `Pass*` 均引用该用户确认结果，不表示本次新增了测试执行日志。测试结果集中记录在“构建验证与执行说明”章节的结果记录表中。该结果产生于结果文案资源化改造之前，执行环境要求见“运行语言环境约束”。

分布式同步. 数据加密. 备份恢复和迁移回滚等用例验证的是当前 Sample 暴露的接口行为及页面状态，不等同于多设备互联. 安全强度或第三方兼容性认证。

## 测试工程结构

```
entry/src/ohosTest/
|---module.json5                              // entry_test 测试模块配置
|---ets
|   |---test
|   |   |---List.test.ets                     // 33 个测试套件的导入和挂载入口
|   |   |---AbilityTest.test.ets              // 应用启动与首页入口测试
|   |   |---IndexAndNavigationTest.test.ets   // 首页导航和返回测试
|   |   |---PreferencesRdbUITest.test.ets     // 首选项和关系型数据库页面 UI 测试
|   |   |---CollectionPagesUITest.test.ets    // Sendable 集合页面 UI 测试
|   |   |---AdvancedPagesUITest.test.ets      // 高级功能页面 UI 测试
|   |   |---Sendable*Test.test.ets            // Sendable 数据类型接口测试
|   |   |---Data*Test.test.ets                // 功能模块. 配置和模型测试
|   |   |---*DeepTest.test.ets                // 接口深度和状态组合测试
|   |   |---*BoundaryTest.test.ets            // 端到端和边界场景测试
|   |   |---其他套件文件                       // 完整清单见下文章节
|   |---testkit
|   |   |---SharedDriver.ets                  // UI Driver. 断言. 导航和日志公共封装
|   |---testability
|   |   |---TestAbility.ets                   // 设置测试 Context 并启动 Hypium
|   |   |---pages
|   |       |---Index.ets                     // 测试 Ability 页面
|   |---testrunner
|       |---OpenHarmonyTestRunner.ts          // 添加 Ability 监控并拉起 TestAbility
|---resources/base
    |---element                               // 测试模块字符串和颜色资源
    |---profile                               // 测试模块页面配置
```

各测试文件的准确职责和用例数见“测试套件总览”。测试模块名为 `entry_test`，应用包名为 `com.samples.sendabledatastore`，测试入口为 `TestAbility`。

## 测试套件总览

### 分类统计

| 分类 | 套件数 | 用例数 | 占比 |
|---|---:|---:|---:|
| 基础设施测试 | 1 | 3 | 0.2% |
| UI 测试 | 4 | 67 | 4.2% |
| Sendable 数据类型测试 | 6 | 221 | 13.8% |
| 功能模块测试 | 4 | 99 | 6.2% |
| 配置和工具测试 | 6 | 193 | 12.1% |
| 深度测试 | 7 | 838 | 52.4% |
| 边界和补充测试 | 5 | 178 | 11.1% |
| **总计** | **33** | **1599** | **100%** |

### 套件清单

下表按 `List.test.ets` 的挂载顺序归档。`caseCount` 由源码中的 `it(...)` 声明逐文件统计，不使用估算值。

| 套件名称 | 分类 | 对应文件 | 用例数 | 描述 |
|---|---|---|---:|---|
| DataValidatorTest | 配置和工具 | DataValidatorTest.test.ets | 69 | 数据类型. 空值. 长度. 范围和非法输入校验 |
| SendableArrayTest | Sendable 数据类型 | SendableArrayTest.test.ets | 36 | 数组创建. 元素操作. 排序. 搜索. 切片和统计 |
| SendableMapTest | Sendable 数据类型 | SendableMapTest.test.ets | 26 | Map 增删改查. 遍历. 批量操作和转换 |
| SendableQueueTest | Sendable 数据类型 | SendableQueueTest.test.ets | 26 | 队列入队出队. FIFO/LIFO. 优先级和批量操作 |
| SendableRecordTest | Sendable 数据类型 | SendableRecordTest.test.ets | 26 | Record 创建. 字段管理. 嵌套记录和转换 |
| DataMigrationTest | 功能模块 | DataMigrationTest.test.ets | 22 | Schema 版本. 迁移步骤. 迁移状态和回滚 |
| DataBackupTest | 功能模块 | DataBackupTest.test.ets | 22 | 备份创建. 查询. 恢复. 删除和自动备份 |
| DataEncryptionTest | 功能模块 | DataEncryptionTest.test.ets | 27 | 加解密. 密钥管理. 哈希和异常输入 |
| DistributedDataTest | 功能模块 | DistributedDataTest.test.ets | 28 | 分布式 CRUD. 设备管理. 同步和冲突处理 |
| AbilityTest | 基础设施 | AbilityTest.test.ets | 3 | 应用启动. 首页功能入口和页面加载 |
| IndexAndNavigationTest | UI | IndexAndNavigationTest.test.ets | 10 | 十个功能入口的跳转. 标题断言和返回首页 |
| SendablePreferencesTest | Sendable 数据类型 | SendablePreferencesTest.test.ets | 68 | 首选项初始化. 读写. 持久化. 事件和缓存管理 |
| SendableRdbTest | Sendable 数据类型 | SendableRdbTest.test.ets | 39 | RDB 建库建表. CRUD. 事务. 查询和 SQL |
| ErrorHandlingTest | 配置和工具 | ErrorHandlingTest.test.ets | 35 | 错误对象. 错误码. 异常处理和恢复 |
| PerformanceMonitorTest | 配置和工具 | PerformanceMonitorTest.test.ets | 26 | 性能计时. 统计. 阈值和状态管理 |
| DataStoreConfigTest | 配置和工具 | DataStoreConfigTest.test.ets | 20 | 默认配置. 配置更新. 校验和重置 |
| LoggerTest | 配置和工具 | LoggerTest.test.ets | 4 | 日志级别和日志接口调用 |
| DataModelsEnumAndConstantsTest | 配置和工具 | DataModelsEnumAndConstantsTest.test.ets | 39 | 数据模型. 枚举值和常量定义 |
| PreferencesRdbUITest | UI | PreferencesRdbUITest.test.ets | 17 | 首选项和 RDB 页面按钮. 结果区域及滚动操作 |
| CollectionPagesUITest | UI | CollectionPagesUITest.test.ets | 20 | Array/Map/Queue/Record 页面交互 |
| AdvancedPagesUITest | UI | AdvancedPagesUITest.test.ets | 20 | 迁移. 备份. 加密和分布式页面交互 |
| E2EWorkflowAndBoundaryTest | 边界和补充 | E2EWorkflowAndBoundaryTest.test.ets | 24 | 跨模块工作流. 状态连续性和边界组合 |
| ErrorHandlingOverflowTest | 边界和补充 | ErrorHandlingOverflowTest.test.ets | 17 | 长文本. 高频错误和溢出边界 |
| BatchCapacityGuardTest | 边界和补充 | BatchCapacityGuardTest.test.ets | 25 | 批量操作规模. 容量保护和重复操作 |
| ManagerMethodGapTest | 边界和补充 | ManagerMethodGapTest.test.ets | 40 | Manager 方法补充. 调用组合和状态检查 |
| SupplementaryCoverageTest | 边界和补充 | SupplementaryCoverageTest.test.ets | 72 | 核心 Manager 未覆盖分支和补充场景 |
| PreferencesDeepTest | 深度 | PreferencesDeepTest.test.ets | 120 | 首选项接口深度. 同步异步组合和状态检查 |
| RdbDeepTest | 深度 | RdbDeepTest.test.ets | 120 | RDB 接口深度. 数据转换和事务组合 |
| EncryptionDeepTest | 深度 | EncryptionDeepTest.test.ets | 118 | 加解密和密钥接口深度及异常组合 |
| DistributedDeepTest | 深度 | DistributedDeepTest.test.ets | 120 | 分布式接口深度. 同步状态和冲突组合 |
| BackupMigrationDeepTest | 深度 | BackupMigrationDeepTest.test.ets | 120 | 备份与迁移接口深度及生命周期组合 |
| QueueRecordDeepTest | 深度 | QueueRecordDeepTest.test.ets | 120 | Queue 和 Record 深度操作及边界组合 |
| ConfigPerfErrorDeepTest | 深度 | ConfigPerfErrorDeepTest.test.ets | 120 | 配置. 性能和错误处理深度组合 |
| **小计** | | | **1599** | |

### 套件组织方式

当前 `List.test.ets` 使用“逐个 import. 逐个函数调用”的方式挂载 33 个套件，**未定义 `SUITE_MANIFEST`**，也未提供 `validateManifest()`. `countByCategory()`. `findSuite()` 或 `getTotalCaseCount()` 等管理函数。本文的套件表是文档归档，不应被当作源码中可调用的 Manifest 接口。

| 管理项 | 当前实现 |
|---|---|
| 套件注册 | `testsuite()` 中直接调用 33 个套件工厂函数 |
| 套件名称唯一性 | 通过源码审计和唯一用例名统计核对 |
| 用例总数 | 逐文件统计 `it(...)`，合计 1599 |
| 分类统计 | 本文按测试意图归类，合计与总数一致 |
| Manifest 管理函数 | 当前未实现，新增时需同步修改源码和本文 |

## 功能覆盖矩阵

同一用例可能同时覆盖页面和 Manager，因此本矩阵用于说明映射关系，不将各行用例数重复累加。

| 功能模块 | 主要接口或特性 | 关联测试套件 | 覆盖状态 |
|---|---|---|---|
| 应用与导航 | EntryAbility. 首页入口. 页面返回 | AbilityTest. IndexAndNavigationTest | 已覆盖 |
| Shared Preferences | 初始化. 异步/同步读写. flush. 事件. 删除和缓存 | SendablePreferencesTest. PreferencesDeepTest. PreferencesRdbUITest | 已覆盖 |
| Shared Relational Store | 建库建表. CRUD. 事务. 查询和 SQL | SendableRdbTest. RdbDeepTest. PreferencesRdbUITest | 已覆盖 |
| Sendable Array | 元素操作. 排序. 搜索. 切片和统计 | SendableArrayTest. CollectionPagesUITest | 已覆盖 |
| Sendable Map | 键值操作. 遍历. 批量操作和转换 | SendableMapTest. CollectionPagesUITest | 已覆盖 |
| Sendable Queue | 入队出队. FIFO/LIFO. 优先级和容量 | SendableQueueTest. QueueRecordDeepTest. CollectionPagesUITest | 已覆盖 |
| Sendable Record | 字段操作. 嵌套记录和转换 | SendableRecordTest. QueueRecordDeepTest. CollectionPagesUITest | 已覆盖 |
| 数据迁移 | Schema 版本. 执行迁移和回滚 | DataMigrationTest. BackupMigrationDeepTest. AdvancedPagesUITest | 已覆盖 |
| 数据备份 | 创建. 恢复. 删除和自动备份 | DataBackupTest. BackupMigrationDeepTest. AdvancedPagesUITest | 已覆盖 |
| 数据加密 | 加解密. 密钥和哈希 | DataEncryptionTest. EncryptionDeepTest. AdvancedPagesUITest | 已覆盖 |
| 分布式数据 | CRUD. 设备. 同步和冲突 | DistributedDataTest. DistributedDeepTest. AdvancedPagesUITest | 已覆盖 |
| 配置和公共能力 | 配置. 模型. 校验. 日志. 性能和错误处理 | DataStoreConfigTest 等 6 个基础套件. ConfigPerfErrorDeepTest | 已覆盖 |
| 异常和边界 | 空值. 非法值. 长文本. 批量. 容量和连续调用 | E2EWorkflowAndBoundaryTest 等 5 个套件 | 已覆盖 |

## 用例归档表

下表按套件归档全部 1599 条用例。“用例名称”列出首个用例作为定位示例，括号内为该文件包含的用例总数。每条用例的 `@tc.number`. 详细描述和断言以对应源码为准。

通用预置条件：设备正常运行，已安装被测 HAP 和测试 HAP；UI 用例需成功拉起 `EntryAbility`，接口用例需完成 `TestAbility` Context 注入。`Pass*` 的含义见“验证范围”。

| 编号 | 用例名称 | 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|---|---|
| 01 | testDataValidator0001 等 69 条 | 数据校验 | 测试 Context 可用 | 正常. 空. 非法. 超长和边界输入 | 各输入按校验规则被接受或拒绝，返回结果符合断言 | 是 | Pass* |
| 02 | testSendableArray0001 等 36 条 | Sendable Array | 已创建数组 Manager | 创建. 增删改. 排序. 搜索和切片 | 数组内容. 返回值和统计结果符合预期 | 是 | Pass* |
| 03 | testSendableMap0001 等 26 条 | Sendable Map | 已创建 Map Manager | 键值 CRUD. 遍历和批量输入 | 键值内容. 大小和转换结果符合预期 | 是 | Pass* |
| 04 | testSendableQueue0001 等 26 条 | Sendable Queue | 已创建 Queue Manager | 入队. 出队. 优先级和批量元素 | 队列顺序. 长度和返回元素符合预期 | 是 | Pass* |
| 05 | testSendableRecord0001 等 26 条 | Sendable Record | 已创建 Record Manager | 字段. 嵌套 Record 和转换输入 | 字段读写. 嵌套结构和转换结果符合预期 | 是 | Pass* |
| 06 | testDataMigration0001 等 22 条 | 数据迁移 | Migration Manager 可用 | 版本号. 迁移步骤和回滚操作 | 版本和迁移状态正确，失败场景可处理 | 是 | Pass* |
| 07 | testDataBackup0001 等 22 条 | 数据备份 | Backup Manager 可用 | 创建. 查询. 恢复. 删除备份 | 备份列表. 恢复数据和状态符合预期 | 是 | Pass* |
| 08 | testDataEncryption0001 等 27 条 | 数据加密 | Encryption Manager 可用 | 明文. 密钥. 密文和哈希输入 | 加解密结果. 密钥状态和哈希结果符合预期 | 是 | Pass* |
| 09 | testDistributedData0001 等 28 条 | 分布式数据 | Distributed Manager 可用 | CRUD. 设备. 同步和冲突输入 | 数据状态. 设备状态和冲突处理结果符合预期 | 是 | Pass* |
| 10 | testAbility0001 等 3 条 | 应用启动 | 已安装应用和测试 HAP | 启动 EntryAbility | 首页加载，十个功能入口可检查 | 是 | Pass* |
| 11 | testNavigation0001 等 10 条 | 首页导航 | 位于应用首页 | 依次点击十个功能入口并返回 | 目标页面标题可见，返回后首页入口可见 | 是 | Pass* |
| 12 | testSendablePreferences0001 等 68 条 | 共享首选项 | Preferences Helper 可用 | 初始化. 读写. flush. 订阅和删除 | 存储值. 事件. 计数和生命周期状态符合预期 | 是 | Pass* |
| 13 | testSendableRdb0001 等 39 条 | 共享关系型数据库 | RDB Helper 可用 | 建表. CRUD. 事务和 SQL | 数据行. 查询结果. 事务状态符合预期 | 是 | Pass* |
| 14 | testErrorHandling0001 等 35 条 | 错误处理 | 错误处理工具可用 | 各类错误码. 异常和恢复输入 | 错误信息和恢复行为符合预期 | 是 | Pass* |
| 15 | testPerformanceMonitor0001 等 26 条 | 性能监控 | Performance Monitor 可用 | 开始. 结束. 统计和阈值操作 | 计时记录. 统计值和状态符合预期 | 是 | Pass* |
| 16 | testDataStoreConfig0001 等 20 条 | 数据存储配置 | Config Manager 可用 | 默认. 更新. 非法和重置配置 | 配置值和校验结果符合预期 | 是 | Pass* |
| 17 | testLogger0001 等 4 条 | 日志工具 | Logger 可用 | 不同日志级别调用 | 调用无异常，日志行为符合预期 | 是 | Pass* |
| 18 | testEnum0001 等 39 条 | 模型和常量 | 数据模型可导入 | 枚举. 常量和模型字段 | 枚举值. 常量值和模型结构符合定义 | 是 | Pass* |
| 19 | testPrefRdbUI0001 等 17 条 | Preferences/RDB UI | 应用首页可见 | 点击页面按钮并滚动查找结果 | 页面标题. 结果区域和操作后状态符合断言 | 是 | Pass* |
| 20 | testCollectionUI0001 等 20 条 | 集合页面 UI | 应用首页可见 | 进入四个集合页面并执行操作 | 页面可操作，结果和页面状态符合断言 | 是 | Pass* |
| 21 | testAdvancedUI0001 等 20 条 | 高级功能页面 UI | 应用首页可见 | 进入迁移. 备份. 加密和分布式页面操作 | 页面标题和结果状态符合断言 | 是 | Pass* |
| 22 | testE2EBoundary0001 等 24 条 | 端到端和边界 | 各 Manager 可用 | 跨模块连续操作和边界组合 | 状态连续，结果和异常处理符合预期 | 是 | Pass* |
| 23 | testErrOverflow0001 等 17 条 | 错误溢出边界 | 错误处理工具可用 | 长文本. 高频错误和极值 | 无未处理异常，错误状态符合预期 | 是 | Pass* |
| 24 | testBatchGuard0001 等 25 条 | 批量容量保护 | 相关 Manager 可用 | 批量. 上限附近和重复输入 | 容量保护和返回状态符合预期 | 是 | Pass* |
| 25 | testMgrGap0001 等 40 条 | Manager 方法补充 | 相关 Manager 可用 | 补充方法及调用顺序组合 | 返回值和内部状态符合各用例断言 | 是 | Pass* |
| 26 | testSuppArray0001 等 72 条 | 补充覆盖 | 相关 Manager 可用 | 未覆盖分支和异常组合 | 补充路径结果符合各用例断言 | 是 | Pass* |
| 27 | testDeepPref0001 等 120 条 | 首选项深度 | 每条用例清理持久化数据 | 同步异步. 生命周期和状态组合 | 首选项数据. 计数和状态符合预期 | 是 | Pass* |
| 28 | testDeepRdb0001 等 120 条 | RDB 深度 | 测试数据库可创建 | CRUD. 转换. 查询和事务组合 | 数据和事务状态符合预期 | 是 | Pass* |
| 29 | testDeepEnc0001 等 118 条 | 加密深度 | Encryption Manager 可用 | 密钥. 明文. 密文和异常组合 | 加解密和密钥状态符合预期 | 是 | Pass* |
| 30 | testDeepDist0001 等 120 条 | 分布式深度 | Distributed Manager 可用 | 设备. 同步. 冲突和异常组合 | 分布式状态和结果符合预期 | 是 | Pass* |
| 31 | testDeepBkm0001 等 120 条 | 备份迁移深度 | Backup/Migration Manager 可用 | 备份和迁移生命周期组合 | 备份. 版本和回滚状态符合预期 | 是 | Pass* |
| 32 | testDeepQr0001 等 120 条 | Queue/Record 深度 | Queue/Record Manager 可用 | 元素. 字段. 边界和组合操作 | 队列和记录状态符合预期 | 是 | Pass* |
| 33 | testDeepCpe0001 等 120 条 | 配置性能错误深度 | 相关工具模块可用 | 配置. 计时和错误组合 | 配置. 统计和错误状态符合预期 | 是 | Pass* |

## SharedDriver 封装说明

公共实现位于 [SharedDriver.ets](entry/src/ohosTest/ets/testkit/SharedDriver.ets)。统一日志域为 `0xF811`，日志标签为 `[Sample_SendableDataStore]`。

| 常量 | 当前值 | 用途 |
|---|---:|---|
| COMPONENT_WAIT_TIMEOUT | 10000 ms | ID 和文本组件默认等待时间 |
| TEXT_WAIT_TIMEOUT | 12000 ms | 文本内容轮询等待时间 |
| UI_IDLE_TIME | 300 ms | UI 空闲判定时间 |
| UI_IDLE_TIMEOUT | 3000 ms | UI 空闲等待超时 |

| 方法 | 用途 |
|---|---|
| `setTestContext(context)` / `getTestContext()` | 保存和获取 UIAbility 测试 Context |
| `getDriver()` | 延迟创建并复用 UI Driver |
| `startAbility(bundleName, abilityName)` | 通过 AbilityDelegator 拉起应用 |
| `startApp(bundleName, abilityName)` | 拉起应用并等待 UI 空闲 |
| `waitId(id, timeout)` / `waitText(text, timeout)` | 等待组件并返回 Component |
| `clickId(id)` / `clickText(text)` | 点击指定组件并等待 UI 空闲 |
| `textOfId(id)` / `textOfText(text)` | 获取指定组件文本 |
| `existsId(id)` / `existsText(text)` | 检查组件是否存在，失败返回 false |
| `assertTextExists(testName, expected)` | 滚动查找并断言文本存在 |
| `assertIdText(testName, id, expected)` | 断言指定 ID 的完整文本 |
| `assertTextContains(id, expected, testName)` | 断言指定 ID 的文本包含目标内容 |
| `waitIdContains(id, expected, timeout)` | 在超时时间内轮询文本包含关系 |
| `pressBack()` | 返回上一页并等待 UI 空闲 |
| `scrollToId(id)` / `scrollToText(text)` | 在 Scroll 容器中搜索目标组件 |
| `swipeUp()` | 使用固定坐标向上滑动，用于多 Scroll 页面查找操作入口 |
| `runCase(name, action, done)` | 统一记录用例首尾日志. 异常和 done 回调 |
| `addLog(format, ...args)` | 使用统一 DOMAIN 和 TAG 输出日志 |
| `navigateToXxxHome()` | 十个功能页面的点击和标题等待封装 |
| `resetToIndex()` | 最多返回十次并等待首页入口，隔离 UI 用例状态 |

`scrollToId()` 和 `scrollToText()` 使用 `ON.type('Scroll')`。当页面存在多个 Scroll 时，调用方应结合 `existsText()` 和 `swipeUp()` 确认目标区域，避免定位到结果区而非主内容区。`swipeUp()` 使用固定坐标，适配不同屏幕尺寸时需结合设备布局复核。

## 构建验证与执行说明

### 环境准备

1. 使用支持 OpenHarmony API version 26 的 DevEco Studio 和构建工具链。
2. 连接标准系统真机，确认 `hdc list targets` 或 `devecocli device list` 能看到设备。
3. 在工程中完成 `entry` 和 `entry@ohosTest` 的构建。已配置 DevEco CLI 时可执行：

```bash
devecocli build
```

HAP 通常输出到 `entry/build/default/outputs/default/`，实际文件名以构建结果为准。安装前需确认主 HAP 和测试 HAP 使用兼容签名。

### 运行语言环境约束

`Manager` 与页面返回的结果文案已改为通过 `$r('app.string.xxx')` 和 `getStringSync()` 解析（实现见 `entry/src/main/ets/utils/ResultText.ets`），展示语言随设备系统语言变化，不再固定为英文。由此产生两条执行约束：

1. **断言依赖英文文案**：`entry/src/ohosTest/ets/test` 下 19 个测试文件中共有 524 处英文子串断言（如 `completed`、`failed`、`creates=`、`Statistics`、`Latest`、`no backups`），UI 套件另有对页面文案的完整文本断言。这些断言只在英文（默认）语言环境下成立。
2. **存在用例顺序耦合**：`TestAbility.onCreate` 未调用 `ResultText.init()`；`List.test.ets` 前 9 个套件执行时没有可用 Context，`ResultText` 回退到调用方传入的英文模板。从第 10 个套件 `AbilityTest` 开始，`startApp()` 拉起 `EntryAbility`，其 `onCreate` 执行 `ResultText.init(this.context)`，同进程静态 Context 生效，此后 `Manager` 返回串改为按系统语言解析。

因此执行全量用例前必须把设备语言设为英文。可先确认当前区域设置：

```bash
hdc shell param get persist.sys.locale
```

返回 `en-US` 或英语优先时可执行；若返回 `zh-Hans-CN` 等中文区域（或该命令无返回值，需在“设置 - 语言和输入法”中确认），预期会出现文案类断言失败，这类失败属于运行语言不匹配，不是功能缺陷。若必须在中文环境下执行，需要把英文子串断言改为与语言无关的断言，或让测试进程固定使用英文模板，该改造不在本次文档整理范围内。

### 安装和启动

以下命令使用常见构建产物名称，若本地输出名称不同，应替换为实际文件：

```bash
hdc install entry/build/default/outputs/default/entry-default-signed.hap
hdc install entry/build/default/outputs/default/entry_test-default-signed.hap
hdc shell aa start -a EntryAbility -b com.samples.sendabledatastore
```

### 执行全量测试

本工程已验证过的测试入口参数为：

```bash
hdc shell aa test -b com.samples.sendabledatastore -m entry_test -p entry_test
```

其中 `-b` 为应用包名，`-m` 为测试模块名，`-p` 为测试包路径。缺少 `-m entry_test` 时，测试框架可能提示未指定模块名。

### 日志收集

PowerShell 环境可过滤 Sample 和 Hypium 汇总日志：

```powershell
hdc shell hilog | Select-String "Sample_SendableDataStore|OHOS_REPORT"
```

也可使用 DevEco CLI 获取应用日志：

```bash
devecocli log --bundle-name com.samples.sendabledatastore --tail 200
```

### 结果记录

| 总用例数 | 通过 | 失败 | 错误 | 忽略 | 通过率 | 结果来源 |
|---:|---:|---:|---:|---:|---:|---|
| 1599 | 1599 | 0 | 0 | 0 | 100% | 用户确认的全量真机测试结果 |

本次文档整理未重新执行测试。后续代码变更后应重新构建. 安装并执行全量套件，再更新上表及本文档中的套件统计。

上表结果产生于结果文案资源化改造之前，改造后 `Manager` 返回串随系统语言变化，需在英文（默认）语言的设备上重新执行才能继续引用该结论；执行环境要求见“运行语言环境约束”。

## 用例设计说明

### 命名和元数据

- 现有用例采用 `testXxx0001` 形式，1599 条用例名称全局唯一。
- 1472 条用例包含 `@tc.number` 等元数据。
- 其余 127 条分布在 `BatchCapacityGuardTest`. `DataStoreConfigTest`. `ErrorHandlingOverflowTest`. `ErrorHandlingTest`. `LoggerTest` 和 `PerformanceMonitorTest` 中，当前未包含 `@tc.number`。后续整改时应补齐元数据，新增用例建议按 `SendableDataStore_测试功能_序号` 规范命名。
- 每条用例应保留功能注释. 开始和结束日志，并在关键断言前记录实际参数和预期参数。

### 异步和状态隔离

- 异步用例通过 `runCase()` 等待业务动作并调用 `done()`，异常统一记录后抛出。
- UI 操作后使用 `waitForIdle()` 或条件等待，不以固定长延迟替代结果断言。
- Preferences 深度用例在执行前清理持久化数据，避免键值和计数污染后续用例。
- UI 套件通过 `pressBack()` 或 `resetToIndex()` 恢复首页状态。

### 覆盖原则

- 优先直接 import 正式 Manager 和工具类进行行为断言，不在测试中复制业务实现。
- 正常. 空值. 非法. 边界. 极值和连续调用分别设置明确断言。
- UI 用例检查真实页面标题. 组件存在性. 文本和返回状态。
- 本文件中的“已覆盖”表示存在对应功能用例，不表示已统计语句覆盖率或分支覆盖率。

## 测试覆盖总结

| 维度 | 覆盖情况 |
|---|---|
| 应用生命周期 | EntryAbility 启动. 首页加载和功能入口检查 |
| 页面导航 | 十个功能入口的进入和返回 |
| 数据存储 | 共享首选项和共享关系型数据库的同步异步接口 |
| Sendable 集合 | Array. Map. Queue. Record 的主要操作 |
| 高级功能 | 迁移. 备份. 加密和分布式 Manager 及页面 |
| 公共能力 | 配置. 模型. 校验. 日志. 性能和错误处理 |
| 深度场景 | 838 条接口组合和状态检查用例 |
| 边界异常 | 空值. 非法输入. 长文本. 批量. 容量和连续操作 |
| 执行结果 | 用户确认 1599/1599 通过，本次未新增执行记录 |
