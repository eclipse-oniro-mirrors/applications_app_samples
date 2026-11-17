# AbilityStage 测试说明

> 本说明面向 `AbilityStage`（OpenHarmony DocsSample 中 Stage 模型 Module 级入口示例，包名 `com.samples.abilitystage`）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `AbilityStage` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 `entry_test` 模块 / `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、启动与重启（`launchEntryAbility`、`restartEntryAbility`、`terminateTopAbility`）、页面基线回归（`ensureIndexPageInitial`、`waitForIndexPageStable`、`isIndexPageRendered`、`isIndexPageVisible`）、前后台切换（`doAbilityForeground`、`doAbilityBackground`、`pressBackAndWait`、`pressHomeAndWait`、`waitForAppWindowGone`）、文本与组件查询（`readTextById`、`checkTextContent`、`waitForTextVisible`、`findComponentsByType`、`findComponentsByText`、`pageComponentCount`、`collectAllTexts`、`checkComponentExists`、`checkComponentExistsByKey`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、按键与触摸模拟（`triggerSerializedKey`、`pressAndWait`、`simulateTouch`、`tapComponentByText`）、耗时统计（`measureElapsed`、`isWithinBudget`、`averageOf`、`maxOf`、`minOf`），以及集中管理的超时常量（`TIMEOUT_PAGE_RENDER` / `TIMEOUT_TEXT_APPEAR` / `TIMEOUT_ABILITY_LAUNCH` / `TIMEOUT_FOCUS_CHANGE` / `TIMEOUT_BACKGROUND_SWITCH`）、延时常量（`DELAY_KEY_NAVIGATION` / `DELAY_TOUCH_EVENT` / `DELAY_AFTER_LAUNCH` / `DELAY_AFTER_BACKGROUND`）、容差常量（`TOLERANCE_COMPONENT_COUNT` / `TOLERANCE_FOCUS_CHANGE`）与压力轮次常量（`STRESS_ROUNDS_NAVIGATION` / `STRESS_ROUNDS_LIFECYCLE` / `STRESS_ROUNDS_LAUNCH`）
- 领域层：多数套件内嵌纯逻辑领域模型，对系统依赖通过桩对象或纯函数隔离后做确定性单元测试，例如 `AbilityStageModelTest` 的 `ModuleType` / `ExtensionType` / `SkillDescriptor` / `ModuleInfo` / `AbilityInfo` / `ExtensionMetadata` 与 `FieldViolation` 违规位、`AbilityStageModelDeepTest` 的 `AcceptWantMatrix`（specified / multiton / undefined）、`EnvironmentCallbackModelTest` 的环境事件模型、`InputInteractionTest` 的 `KeySequenceParser` 按键序列解析、`BoundaryErrorTestingTest` 的 `BoundaryCatalog` 边界目录、`EventHandlingTest` 的 `PriorityResolver`、`ErrorRecoveryTest` 的 `FailureClassifier`、`ExceptionHandlingTest` 的 `WantGuard`、`ResourceManagementTest` 的 `ResourceLeakDetector`、`StateRecoveryTest` 的 `SnapshotMigrator`、`AppVersionTest` 的版本校验器等
- 场景层：模拟应用启动、首页渲染、文本点击切换、前后台切换、配置变更（`environment` 回调）、specified 模式实例名、备份扩展生命周期等真实 Stage 模型场景
- 质量层：补充性能时延、内存泄漏、并发控制、压力与长稳、安全、无障碍、设备兼容、本地化、离线韧性等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件入口：`List.test.ets` 统一 import 并以 `testsuite()` 顺序调用 79 个套件，覆盖度可静态审计
- 统一驱动能力：所有 UI 套件复用 `SharedDriver` 的页面回归、文本轮询、焦点检查与按键模拟，避免各套件重复实现 UI 驱动细节
- 重启回归而非脏态继续：`ensureIndexPageInitial` 检测到首页残留 `Welcome` 点击态时，经 `restartEntryAbility`（后台 → `terminateSelf` → 重新拉起 → 等待渲染稳定）恢复 `Hello World` 初始态，避免用例间脏状态造成假通过
- 串行化 UI 队列：单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 非阻塞延时：`serializedDelay` / `sleepMs` 使用 `driver.delayMs` 与 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时主线程看门狗导致的 AppFreeze 与测试进程被杀
- 组件计数避坑：`queryAllInAppWindow` 按 `RelativeContainer/Text/Button/Image/Column/Row/Stack/Flex/Grid` 具名类型统计，优先 `inWindow(bundleName)` 应用窗口作用域、空结果时受控回退全屏查询，避免 TV 版本不支持 `'*'` 通配查询导致的空结果与全量无障碍树转储开销
- 常量集中：包名、Module/Stage/Ability 名称、首页文本键与文案（`HelloWorld` / `Hello World` / `Welcome`）、按键码（`KEY_LEFT`~`KEY_MENU`）、超时/延时/容差/压力轮次全部集中在 `SharedDriver`，各套件不再散落魔法值
- 日志与断言统一：统一 `@ohos.hilog`（标签 `[AbilityStage_Test]`，内容英文），布尔断言 `assertTrue/assertFalse`、非布尔 `assertEqual(actual, expected)`、异常路径断言 `e.name` 精确值、强制失败 `expect().assertFail()`

通过复用驱动工具、页面基线回归与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 目录/能力矩阵：根目录 + 9 个能力目录，共 81 个文件、79 个套件、2,239 条用例（见第 6 节）
- Stage 生命周期矩阵（`AbilityCore`）：`MyAbilityStage` 的 `onCreate` / `onAcceptWant` / `onDestroy` × `EntryAbility` 的 `onWindowStageCreate` / `onForeground` / `onBackground` / `onDestroy` 回调目录、流转顺序与组合工作流（`LifecycleCallbackCatalog`、`LifecycleFlow`、`LifecycleWorkflow`、`LifecycleOperations`）
- 环境事件矩阵（`AbilityValidation/EnvironmentEventValidation`、`AbilityCore/EnvironmentCallbackModel`）：`onConfigurationUpdated` 五字段（`language` / `colorMode` / `direction` / `fontSizeScale` / `fontWeightScale`）× `onMemoryLevel` 等级 × 订阅/取消订阅
- AcceptWant 模式矩阵（`AbilityStageModelDeep` 的 `AcceptWantMatrix`）：specified / multiton / undefined 三档下实例名返回与 Module 复用行为
- 备份扩展矩阵（`LifecycleState/ExtensionLifecycle`）：`onBackup` / `onRestore(bundleVersion)` × 版本信息正确性 × 幂等重入
- 边界矩阵（`Validation/BoundaryErrorTesting` 的 `BoundaryCatalog`）：字符串长度 0 / 1 / 1024 / 1025、`MAX_SAFE_INTEGER` 与 ±1、2^53、最小正规浮点数 5e-324、数组长度边界、事件键长度（`environment` 键长 11）
- 按键输入矩阵（`AbilityCore/InputInteraction` 的 `KeySequenceParser`、`Validation/KeyCodeUtilValidation`）：`LEFT` / `RIGHT` / `UP` / `DOWN` / `ENTER` / `BACK` / `HOME` / `TAB` / `SPACE` / `ESCAPE` / `MENU` 的合法/非法组合与序列解析（如 `LEFT>RIGHT>CONFIRM`、`BACK>HOME`）
- 设备与兼容矩阵（`Integration/DeviceCompatibility`、`Integration/AbilityLaunchCompatibility`）：`default` / `tablet` 设备类型 × 启动方式 × 特性门禁
- 本地化矩阵（`Integration/LocalizationTesting`）：base / zh_CN / en_US 资源下的文案与断言一致性
- 压力与长稳矩阵（`PerformanceStability`、`AbilityCore/AbilityStress`）：导航 20 轮 / 生命周期 10 轮 / 拉起 5 轮（`STRESS_ROUNDS_*` 常量）× 混合动作回放

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- Stage 级入口（`myabilitystage/MyAbilityStage.ets`，Module `srcEntry`）：`onCreate` 中通过 `applicationContext.on('environment', envCallback)` 注册 `EnvironmentCallback`（`onConfigurationUpdated` 读取 `language` / `colorMode` / `direction` / `fontSizeScale` / `fontWeightScale` 五字段，`onMemoryLevel` 读取内存等级）；`onAcceptWant` 仅在 specified 模式下触发并返回 `'MyAbilityStage'`；`onDestroy` 监听 Module 销毁
- 主 Ability（`entryability/EntryAbility.ets`，`mainElement`）：`onCreate` 设置 `ColorMode.COLOR_MODE_NOT_SET`（跟随系统深浅色）；`onWindowStageCreate` 加载 `pages/Index`；`onForeground` / `onBackground` / `onWindowStageDestroy` / `onDestroy` 完整生命周期
- 备份扩展（`entrybackupability/EntryBackupAbility.ets`，`extensionAbilities` 中 `type: backup`、`exported: false`、`metadata: ohos.extension.backup → $profile:backup_config`）：`onBackup` / `onRestore(bundleVersion)` 备份扩展生命周期
- 被测首页（`pages/Index.ets`）：`RelativeContainer` + `Text`（`id = 'HelloWorld'`，`@State message` 初始 `Hello World`、加粗、`app.float.page_text_font_size`，水平垂直居中），`onClick` 后变为 `Welcome`
- 模块契约（`module.json5`）：`entry` 类型、`deviceTypes: default + tablet`、`deliveryWithInstall: true`、`installationFree: false`、`EntryAbility` exported 且技能为 `entity.system.home` + `ohos.want.action.home`
- 测试承载（`ohosTest/module.json5`、`testrunner/OpenHarmonyTestRunner.ets`、`testability/TestAbility.ets` 及其 `pages/Index.ets`）：`entry_test` feature 模块，`aa test` 拉起测试 Ability 后执行 Hypium 套件

### 3.2 关键风险点

围绕 Stage 模型 Module 级入口场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致 `HelloWorld` 节点缺失、首页探针失败
- 设备锁屏导致 `aa test` 直接报 `00508013 App launch timed out`，即使勉强启动所有 UI 断言也会因 `HelloWorld node absent` 失败
- 首页文案处于 `Welcome` 点击态（脏状态）导致后续用例基线漂移、假通过
- 并发 UI 操作引起焦点竞争、按键丢失或状态错乱
- `environment` 配置变更回调未收到或五字段任一缺失，环境感知能力失效
- specified 模式下 `onAcceptWant` 实例名返回错误或 Module 复用行为异常
- 备份扩展 `onBackup` / `onRestore` 未正确传递 `bundleVersion` 或不可幂等重入
- `findComponents` 以 1024 字符长字符串查询导致 `libuitest` 原生 `SIGABRT`（见附录 E 已知 SDK 缺陷）
- 长链路执行中同步阻塞主线程触发 `THREAD_BLOCK_6S` 看门狗、AppFreeze 与测试进程被杀
- 本地化资源缺失或未绑定字段渲染为 `undefined` / `null`

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互：`EntryAbility` 拉起、`pages/Index` 渲染、`HelloWorld` 文本组件存在且组件数 > 0
- 启动方式正确性：`AbilityDelegator` 可达、`buildEntryWant` 正确填充 `bundleName` / `abilityName`、重复 `startAbility` 保持应用可达
- 首页交互闭环：`Hello World` 点击后变为 `Welcome`，焦点/按键/触摸三条输入路径均可驱动
- AbilityStage 环境回调：`onConfigurationUpdated` 五字段完整可读、`onMemoryLevel` 可触发、订阅与取消订阅成对
- specified 模式实例名：`onAcceptWant` 返回 `MyAbilityStage`，multiton / undefined 模式下行为符合契约
- 备份扩展生命周期：`onBackup` 成功、`onRestore` 正确接收 `bundleVersion`、可幂等重入
- 前后台切换、返回键、HOME 键后的窗口与页面状态一致
- 配置变更（语言/深浅色/方向/字体缩放）后页面与断言一致
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法 Want（`null` / 缺字段 / 非法 bundleName）注入，`WantGuard` 分类拒绝
- 非法按键码、越界坐标、超屏坐标注入（`Validation/InputValidation`、`BoundaryErrorTesting` UI 探针）
- 超长字符串（1025）、越界整数（`MAX_SAFE_INTEGER + 1`、2^53、负下界）、空事件键等负向边界输入
- 渲染失败、窗口缺失、top ability 为 `null` 时的降级与重启恢复（`resolveTopAbility` 缓存回退）
- 快速连续按键、交替按键、重复点击后的状态一致性（`InputInteraction` 序列解析 + `EventPropagation`）
- 前后台切换、进程被杀后的状态恢复与快照迁移（`StateRecovery` 的 `SnapshotMigrator`）
- 资源分配后未释放的泄漏检测（`ResourceLeakDetector`）
- 网络不可用下的离线韧性（`AbilityValidation/OfflineResilience`）

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（首页文本组件）
- 页面是否回到稳定基线（`HelloWorld` 节点存在、初始/点击文案之一可见）
- 组件数量与索引是否一致，避免重复实例
- 备份扩展是否可重入，版本信息是否更新
- 离线队列是否按序重放

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

用户可能连续执行点击、切换前后台、反复拉起等动作，因此需要覆盖：

- 高频按键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`、`InputInteraction`）
- 连续路由/入口反复进出、前后台快速切换（`PageLifecycle`、`AdvancedScenarios`）
- 并发拉起、并发前后台切换的实例一致性（`AbilityConcurrency`、`ConcurrencyControl`）
- 长链路混合动作回放（`LongTermStability`、`AdvancedScenarios`、`ComprehensiveRegression`）
- 压力轮次：导航 20 轮、生命周期 10 轮、拉起 5 轮（`STRESS_ROUNDS_*` 常量），配合串行化 UI 队列消除竞争
- 长链路执行期间的主线程让出（`serializedDelay`、`sleepMs` 均基于事件循环）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录冷/热启动（`LaunchPerformance`）、Ability 级耗时（`AbilityPerformance`）、动画（`AnimationPerformance`）等多类时延，预算常量集中在 `SharedDriver`（页面渲染 1s、Ability 拉起 2s、焦点切换 500ms、前后台 1.5s）
- 采用限时上界断言（`isWithinBudget`），上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值（`averageOf` / `maxOf` / `minOf`），避免单次抖动被平均值掩盖
- 内存水位与泄漏斜率（`MemoryLeakDetection`、`ResourceManagement`）
- 在 `default` / `tablet` 设备类型、深浅色模式、中英文资源、字体缩放下重复执行（`DeviceCompatibility`、`AbilityLaunchCompatibility`、`LocalizationTesting`）
- 压力与卡顿（`PerformanceStress`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 暴露面（`AbilityStageSecurity`）：`exported` 声明、`extensionAbilities` 非导出（`EntryBackupAbility exported: false`）、技能与 action 契约
- 输入校验（`Validation/InputValidation`、`AbilityValidation/WantParameterValidation`）：Want 参数、按键码、坐标、文本的合法域
- 配置契约（`AbilityValidation/ModuleConfigValidation`、`Validation/ConfigurationManagerValidation`）：`module.json5` 字段完整性与类型、`COLOR_MODE_NOT_SET` 设置
- 版本与会话（`AbilityValidation/AppVersion`、`AbilityValidation/LaunchSessionValidation`）：`bundleVersion` 格式、拉起会话唯一性
- 日志与隐私（`Validation/LoggerValidation`）：hilog 统一标签、无敏感信息外泄
- 资源加载契约（`Validation/ResourceLoaderValidation`）：资源名/类型/回退

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对单组件首页的交互特点，测试设计特别覆盖：

- 无障碍导航与焦点（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点环样式与可见性（`FocusRingBehavior` 的 `RingDescriptor` 分类）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 焦点顺序与布局测量（`FocusNavigation`、`PageLayoutPositioning`、`DataBinding`）
- 内容缩放、主题与视觉效果（`ContentScaling`、`ThemeVariation`、`VisualEffects`、`UIComponentRendering`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断示例应用可用性与演示效果的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景回归层与质量层都有对应测试，Stage 生命周期、环境事件、备份扩展三大核心能力均有专门套件
- 覆盖维度齐全：功能、异常、并发、性能、契约、安全、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、边界目录、压力回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验文案、组件数量、焦点位置、实例名、版本信息、回调字段完整性与时延上界
- 测试资产可复用：`SharedDriver` 的页面基线回归、串行化 UI 队列与集中常量便于继续扩展而不破坏既有结构
- 用例规范统一：全部用例带 `@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level` 元数据，统一 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2`，便于追溯与审计

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个套件。当前静态统计：共 **81 个文件**（79 个 `.test.ets` 用例文件 + `List.test.ets` 统一入口 + `Shared/SharedDriver.ets` 共享驱动），**86,144 行**（不含共享驱动为 85,281 行），**2,239 条用例**。按测试意图分组如下：

| 分组 | 文件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 根目录（冒烟） | 2 | 8 | `ActsAbilityTest`（`Ability.test.ets`）：启动冒烟、AbilityDelegator 可达、Want 构造、首页渲染与文本/组件校验、重复拉起、包名一致性；`List.test.ets` 统一入口 |
| 共享驱动 | 1 | 0 | `Shared/SharedDriver.ets`：串行 UI 队列、页面基线回归、启动/重启、前后台、文本/组件/焦点查询、按键与触摸模拟、耗时统计、集中常量 |
| Stage 核心 `AbilityCore` | 16 | 499 | `AbilityStageModel`、`AbilityStageModelDeep`、`EnvironmentCallbackModel`：Stage 领域模型、AcceptWant 模式矩阵、环境事件模型；`AbilityLifecycle`、`AbilityStateManagement`、`AbilityConcurrency`、`AbilityConsistency`、`AbilityEndToEnd`、`AbilityErrorRecovery`、`AbilityStress`、`AbilityUI`：生命周期/状态/并发/一致性/端到端；`LifecycleCallbackCatalog`、`LifecycleFlow`、`LifecycleWorkflow`、`LifecycleOperations`：回调目录、流转、工作流；`InputInteraction`：按键序列解析 |
| 能力校验 `AbilityValidation` | 8 | 319 | `EnvironmentEventValidation`、`AbilityCallbackNotification`：环境事件与回调通知；`WantParameterValidation`、`ModuleConfigValidation`：Want 与模块配置契约；`LaunchSessionValidation`、`AppVersion`：拉起会话与版本；`AbilityInterruptionRecovery`、`OfflineResilience`：中断恢复与离线韧性 |
| 集成与场景 `Integration` | 9 | 125 | `IntegrationTesting`、`SystemIntegration`、`UserScenarios`、`AdvancedScenarios`、`ComprehensiveRegression`：端到端与综合回归；`DeviceCompatibility`、`AbilityLaunchCompatibility`：设备与启动兼容；`LocalizationTesting`：本地化；`NetworkConnectivity`：网络连通 |
| 交互与可达性 `Interaction` | 14 | 370 | `FocusNavigation`、`FocusRingBehavior`：焦点导航与焦点环；`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`：按键/触摸/手势/事件；`AccessibilityNavigation`：无障碍；`DataBinding`、`PageLayoutPositioning`、`UIComponentRendering`、`VisualEffects`、`ContentScaling`、`ThemeVariation`：数据绑定/布局/渲染/视觉/缩放/主题 |
| 生命周期与状态 `LifecycleState` | 10 | 241 | `ConfigurationChanges`、`PageLifecycle`、`AbilityStageStateManagement`：配置变更与页面/Stage 状态；`ErrorRecovery`、`ExceptionHandling`：异常与恢复；`ExtensionLifecycle`：备份扩展生命周期；`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`：资源/会话/状态持久化与恢复 |
| 性能与长稳 `PerformanceStability` | 7 | 154 | `LaunchPerformance`、`AbilityPerformance`、`AnimationPerformance`：启动/Ability/动画时延；`MemoryLeakDetection`、`ConcurrencyControl`：内存与并发；`LongTermStability`、`PerformanceStress`：长稳与压力 |
| 安全 `Security` | 3 | 93 | `AbilityStageSecurity`、`SecurityValidation`：暴露面与配置安全；`SecurityAccessibility`：无障碍安全 |
| 校验与工具 `Validation` | 11 | 430 | `BoundaryErrorTesting`：边界目录与长字符串探针；`RenderPipelineValidation`、`ResourceLoaderValidation`：渲染管线与资源加载；`ConfigurationManagerValidation`、`EnvironmentEventUtilValidation`、`AbilityStageStateManagerValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeUtilValidation`、`LoggerValidation`、`PointerUtilValidation`：配置/事件/状态/焦点/输入/键码/日志/指针工具校验 |

各目录文件数与用例数明细：

| 目录 | 文件数 | 行数 | 用例数 |
| --- | --- | --- | --- |
| 根目录（`Ability.test.ets`、`List.test.ets`） | 2 | 403 | 8 |
| `AbilityCore/` | 16 | 20,172 | 499 |
| `AbilityValidation/` | 8 | 10,402 | 319 |
| `Integration/` | 9 | 6,074 | 125 |
| `Interaction/` | 14 | 14,457 | 370 |
| `LifecycleState/` | 10 | 9,747 | 241 |
| `PerformanceStability/` | 7 | 5,812 | 154 |
| `Security/` | 3 | 3,513 | 93 |
| `Validation/` | 11 | 14,701 | 430 |
| `Shared/` | 1 | 863 | 0 |
| **合计** | **81** | **86,144** | **2,239** |

## 7. 结论

`AbilityStage` 当前测试设计已经形成"共享驱动 + Stage 领域模型 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构围绕 Stage 级入口的三大核心能力（环境回调、specified 实例名、备份扩展）与主 Ability 生命周期展开，具备良好的扩展性、可维护性和风险发现能力，可以作为示例工程后续持续集成、版本回归和测试审计的核心基础。

## 附录 A：测试框架与模式

- 框架：`@ohos/hypium@1.0.24`，`describe` / `it` / `expect`，用例统一使用 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2`
- 用例元数据：每条用例带 JSDoc `@tc.number`（`SUB_ABILITYSTAGE_*` 编号）/ `@tc.name` / `@tc.desc`（英文）/ `@tc.size` / `@tc.type` / `@tc.level`
- UI 驱动：`@ohos.UiTest` 的 `Driver` / `ON` / `Component`，全部 UI 操作经 `SharedDriver.runSerializedUiOperation` 串行化，避免焦点与状态竞争
- 异步：每个 `it` 为 `async (done: () => void) => { try { ... } finally { done(); } }`，保证 `done()` 恰好调用一次
- 生命周期钩子：`beforeAll` 拉起 `EntryAbility` 并等待首页稳定、`beforeEach` / `afterEach` 固定短延时，避免用例间干扰
- 日志：统一 `@ohos.hilog`（禁止 `console.*`），标签 `[AbilityStage_Test]`，内容为英文
- 断言：布尔用 `assertTrue/assertFalse`，非布尔用 `assertEqual(actual, expected)`；异常路径断言 `e.name` 精确值；强制失败用 `expect().assertFail()`

## 附录 B：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起 EntryAbility | 是 | Pass |
| 首页渲染 | 应用已拉起 | 无 | 存在 `HelloWorld` 文本组件 | 是 | Pass |
| 文本点击切换 | 首页可见 | 点击文本 | 文案由 `Hello World` 变为 `Welcome` | 是 | Pass |
| AbilityStage 环境的回调 | 应用已拉起 | 配置变更 | `onConfigurationUpdated` 收到 5 类字段 | 是 | Pass |
| specified 实例名 | 应用已拉起 | `onAcceptWant` | 返回 `MyAbilityStage` | 是 | Pass |
| 前后台切换 | 首页可见 | 切后台再回前台 | 页面与状态保持 | 是 | Pass |
| 备份扩展生命周期 | 备份任务触发 | `onBackup` / `onRestore` | 版本信息正确且可幂等重入 | 是 | Pass |

## 附录 C：运行方式

> **前置条件（必做）**：设备屏幕必须处于**已解锁**状态。锁屏状态下 `aa test` 会直接报
> `00508013 App launch timed out. Make sure the screen is unlocked.`；即使测试勉强启动，所有 UI 断言
> 也会因 `HelloWorld node absent` 失败。仅执行 `power-shell wakeup` 不够，还需上滑解锁：
>
> ```bash
> hdc shell power-shell wakeup
> hdc shell "uitest uiInput swipe 360 1200 360 400 300"
> hdc shell power-shell timeout -o 3600000   # 延长息屏超时，避免长时间跑测中途灭屏
> ```

```bash
# 构建 ohosTest HAP
hvigorw --mode module -p module=entry@ohosTest -p product=default \
  assembleHap --analyze=normal --parallel --incremental --no-daemon

# 安装后执行测试（设备需已解锁，见上方前置条件）
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.abilitystage -m entry_test -s unittest /ets/test/List.test.ets
```

## 附录 D：实测结果（最近一次全量记录）

| 项目 | 数值 |
| --- | --- |
| 套件数 | 79（含根套件 `ActsAbilityTest`） |
| 用例总数 | 2,229 |
| Pass | 2,229 |
| Failure | 0 |
| Error | 0 |

> 说明：上表为最近一次真机全量运行的记录值。此后用例集已扩充至当前静态统计的 2,239 条（见第 6 节），如需最新实测数据请在已解锁设备上重新执行全量套件。

## 附录 E：已知 SDK 缺陷（保留记录）

| 缺陷 | 复现方式 | 现象 |
| --- | --- | --- |
| `libuitest` 文本查询长字符串崩溃 | `driver.findComponents(ON.text(s))`，`s` 长度 1024 | 测试进程原生 `SIGABRT(SI_TKILL)`，faultlog 栈指向 `libuitest.z.so` → `abort`，无任何用例级报错输出 |

`BoundaryErrorTestingTest.testUiMaxLengthStringDoesNotMatchPage` 已把 UI 探针长度上限收敛到 32 字符以规避该崩溃，模型层仍按 1024 字符做边界断言，缺陷本身未被弱化。
