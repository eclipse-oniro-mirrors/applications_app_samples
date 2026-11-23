# MissionManager 测试说明

> 本说明面向 `MissionManager`（OpenHarmony 系统任务管理示例）工程的 ohosTest 自动化测试，用于说明测试的设计思路、覆盖维度、充分性依据与后续扩展方向。当前套件以静态订阅、通知与事件模型为核心，并配合交互、生命周期、性能、安全与通用校验用例。

## 1. 文档目标

本文档用于说明本工程 `entry/src/ohosTest` 自动化测试的设计思路、覆盖维度与充分性依据。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（聚合入口 `ets/test/List.test.ets`，运行器 `ets/TestRunner/OpenHarmonyTestRunner.ts`，测试承载 `ets/testability/TestAbility.ets`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `ets/test/Shared/StaticSubscriberDriver.ets` 为核心，提供订阅状态常量、事件/通知/配置/会话模型、指标与安全策略、性能采样与边界校验，以及串行化 UI 队列 `runSerializedUiOperation`、非阻塞延时 `serializedDelay`、按键与触摸模拟等可复用资产。
- 领域层：围绕订阅状态机（`SubscriberStateMachine`）、事件校验（`SubscriberEventValidator`）、通知构建与发布（`NotificationRequestBuilder`、`NotificationPublisherModel`）、配置管理（`SubscriberConfigManager`）、会话管理（`SubscriberSession`、`SubscriberSessionManager`）、指标采集（`OperationMetricsCollector`）、安全策略（`SecurityPolicyModel`）、性能采样（`PerformanceProfiler`）与边界检查（`BoundaryChecker`）展开确定性模型测试。
- 场景层：模拟静态订阅使能/去使能、事件接收与数据清洗、通知构建与发布、配置更新、会话生命周期、通知目录与工作流等真实业务链路。
- 质量层：补充并发与长稳、性能时延、内存与资源预算、安全与权限、按键可达性、中英文资源、设备兼容等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一注册 79 个套件（78 个业务套件 + `Ability_Test`），业务套件按目录分为静态订阅、订阅校验、集成、交互、生命周期、性能、安全、通用校验八类，覆盖度可在不跑真机的情况下审计。
- 统一驱动能力：所有套件复用 `StaticSubscriberDriver` 的常量、工厂函数、状态机与模型，避免各套件重复实现业务细节。
- 确定性模型测试：状态机、事件校验、通知、配置、会话、指标、安全策略等均为纯模型逻辑，断言稳定，不依赖设备焦点与页面时序。
- 串行化 UI 队列：需要 UiTest 的场景统一进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键。
- 非阻塞延时：`serializedDelay` 使用定时器让出事件循环，规避长跑时同步阻塞导致的 AppFreeze 与测试进程被杀。
- 统一工厂函数：`createEvent`、`createEmptyEvent`、`createEventByKind`、`createEventMatrix`、`createNotification`、`createNotificationMatrix`、`createDefaultConfig` 保证测试数据构造一致、可参数化。
- 统一错误码与边界常量：`ERROR_CODE_INVALID_STATE`、`ERROR_CODE_INVALID_CONFIG`、`MAX_EVENT_DATA_LENGTH`、`MAX_EVENT_NAME_LENGTH` 等集中在驱动层，便于统一校验。

通过复用驱动工具、工厂函数与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 状态矩阵：`DISABLED/ENABLING/ENABLED/DISABLING/ERROR` × `enable/disable/toggle/reset/fail`，校验状态迁移、重复使能、错误计数与最后操作。
- 事件矩阵：正常、空、超长、Unicode、特殊字符 × 事件名长度、数据长度、错误码、时间戳，校验接受/拒绝、清洗与合法性。
- 通知矩阵：通知 ID、标题、正文、附加文本、内容类型 × 合法/非法组合，校验构建与发布结果。
- 配置矩阵：`bundleName`、`abilityName`、`extensionName`、`notificationId`、`eventName` × 合法/缺失/超长，校验更新与拒绝计数。
- 会话矩阵：创建、激活、停用、关闭 × 重复关闭/已关闭操作，校验快照、操作记录与活跃计数。
- 边界矩阵：长度 0、1、`MAX-1`、`MAX`、`MAX+1`，数值上下界与钳制，校验接受范围与规范化结果。
- 安全矩阵：通知权限、事件源、包名匹配 × 授权/拒绝，校验安全决策与错误码。
- 性能采样矩阵：多次采样 × 计数/成功数/均值/最值/预算，避免单次抖动掩盖问题。

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 静态订阅扩展（`StaticSubscriber/StaticSubscriber.ts`：`onReceiveEvent` 接收 `usual.event.SEND_DATA`、`setNotificationEnable`、`Notification.publish` 与回调处理）。
- 首页交互（`pages/Index.ets`：`btnEnable`/`btnDisable` 两个入口，`CommonEventManager.setStaticSubscriberState(true/false)`，Toast 提示与异常日志）。
- 应用承载（`MainAbility/MainAbility.ts`：生命周期与首页加载；`Application/AbilityStage.ts`：模块创建）。
- 日志能力（`model/Logger.ts`：基于 `@ohos.hilog` 的统一日志封装）。
- 配置与资源（`resources/base/profile/subscribe.json` 的 `usual.event.SEND_DATA`、`module.json5` 的 `staticSubscriber` 扩展与 `ohos.permission.NOTIFICATION_CONTROLLER`、`syscap.json` 的设备能力裁剪）。
- 通知与事件模型（通知构建/发布、事件校验/清洗、订阅会话、配置管理、操作指标与安全策略）。

### 3.2 关键风险点

围绕静态订阅与通知场景，重点识别如下风险：

- 订阅状态非法迁移或重复使能/去使能，导致状态机进入错误分支。
- 空事件、超长事件、Unicode 或特殊字符事件未正确校验/清洗。
- 通知 ID、标题或内容类型非法，导致发布失败或脏数据。
- 配置项缺失或漂移（bundle、extension、eventName），导致订阅未生效。
- 会话重复关闭、未释放或活跃计数不准确，导致资源残留。
- 权限缺失（`NOTIFICATION_CONTROLLER`）或 ACL 未配置，导致安装/发布失败。
- 事件数据过长或含控制字符，导致日志异常或通知展示异常。
- 高频事件或长链路执行下的指标漂移、内存增长与稳定性下降。
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`。
- 按键/焦点/提示等交互元素缺失或时序不稳，导致场景断言误判。

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“模型能创建”，而是拆成可验证的细粒度行为：

- 状态机初始为 `DISABLED`，使能/去使能成功并更新状态、迁移计数与最后操作。
- 重复使能/去使能返回 `ERROR_CODE_INVALID_STATE` 并累加错误计数。
- 事件校验覆盖合法事件、空事件、超长数据、Unicode 与清洗后的数据。
- 通知构建字段完整、`isValid` 判定正确，发布成功计数与清空行为正确。
- 配置默认值正确，合法更新成功、非法配置被拒绝并计数。
- 会话创建、激活、停用、关闭、快照与活跃计数正确。
- 操作目录固定为 5 类操作，指标采集按操作类型分类统计并可重置。
- 工作流可完成“使能 + 发布通知”与“接收事件 + 发布通知”。
- 日志缓冲按级别/标签过滤、按内容检索并限制最大条数。
- 键码模型正确识别导航键、确认键与系统键。
- 工具函数（重复文本、事件矩阵、通知矩阵、求和/均值）结果正确。

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 重复使能/去使能、已关闭会话再次关闭、非法配置、空/超长事件。
- 非法通知字段（空标题、非法内容类型、非法 ID）。
- 权限拒绝、事件源非法、包名不匹配。
- 数值越界与长度越界（0、`MAX-1`、`MAX`、`MAX+1`）。
- 输入中的控制字符、引号、反斜杠与空白清洗。
- 会话关闭后的操作、指标重置后的累计值。
- 长事件与特殊字符在通知标题/正文中的传递。

恢复类测试不仅校验返回值，还校验：

- 状态机是否回到 `DISABLED` 或 `ERROR` 的稳定状态。
- 错误计数、拒绝计数与失败计数是否准确累加。
- 会话关闭后是否不再记录有效操作。
- 指标重置后总量是否归零。
- 配置被拒绝后是否保持原配置不变。

这保证了异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

静态订阅可能面对连续事件与高频操作，因此需要覆盖：

- 串行化队列 `runSerializedUiOperation` 的顺序执行与链式返回。
- 并发使能/去使能、并发事件接收与通知发布。
- 长链路混合动作（使能、事件、通知、配置、会话）反复执行。
- 压力场景下的指标累计、状态一致性与内存增长。
- 长链路执行期间的主线程让出（`serializedDelay`）。

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录多次采样的耗时、迭代次数与成功标记，断言计数、成功数、均值、最大值与预算。
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢。
- 校验资源预算的分配、释放、上限与负值拒绝。
- 校验长期运行下的指标总量与状态稳定性。
- 在内容缩放、主题变化、中英文资源下重复执行交互用例。
- 覆盖不同按键与触摸输入方式，避免只在默认输入下通过。

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 权限策略（`SecurityPolicyModel`：`ohos.permission.NOTIFICATION_CONTROLLER` 的授予/拒绝/撤销）。
- 事件源校验（空源、路径穿越、分隔符）。
- 包名匹配（`BUNDLE_NAME` 一致才允许）。
- 输入清洗（控制字符、引号、反斜杠、空白与截断）。
- 边界与契约（事件名/数据长度、通知标题/正文长度、配置项合法性）。
- 日志脱敏与可检索（`LoggerBuffer` 的级别/标签过滤）。
- 错误码契约（`ERROR_CODE_INVALID_STATE`、`ERROR_CODE_INVALID_CONFIG`、`ERROR_CODE_PERMISSION_DENIED` 等）。

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对应用操作特点，测试设计特别覆盖：

- 无障碍导航与焦点顺序（`AccessibilityNavigation`）。
- 焦点高亮、焦点环样式与可见性（`FocusNavigation`、`FocusRingBehavior`）。
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）。
- 内容缩放、数据绑定与组件渲染（`ContentScaling`、`DataBinding`、`UIComponentRendering`）。
- 主题与视觉效果（`ThemeVariation`、`VisualEffects`）。
- 提示定位（`ToastPositioning`）与中英文资源（`LocalizationTesting`）。

这部分是判断应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景回归层与质量层都有对应测试。
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入。
- 覆盖方式多样：单点验证、矩阵组合、压力回放、多采样统计与纯模型隔离并存。
- 数据校验细化：不仅校验对象是否存在，还校验状态、计数、索引、长度、错误码与预算上界。
- 资产可审计：`List.test.ets` 对 79 个套件的导入与注册关系清晰，套件按目录分类，覆盖度可在不跑真机的情况下审计。
- 测试资产可复用：`StaticSubscriberDriver`、统一工厂函数与串行/节流策略便于继续扩展而不破坏既有结构。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/StaticSubscriberDriver.ets`：常量、工厂函数、状态机、事件/通知/配置/会话模型、指标、安全策略、性能采样、串行 UI 队列与延时 |
| 静态订阅核心 | 16 | `SubscriberModelDeep`、`NotificationCatalog`、`NotificationFlow`、`NotificationWorkflow`、`NotificationOperations`、`SubscribeConfiguration`、`EventDataModel`、`EventTriggerInteraction`、`SubscriberConcurrency`、`SubscriberConsistency`、`SubscriberEndToEnd`、`SubscriberErrorRecovery`、`SubscriberLifecycle`、`SubscriberStateManagement`、`SubscriberStress`、`SubscriberUI` |
| 订阅校验 | 8 | `SubscriberAppVersion`、`SubscriberNotification`、`SubscriberPermissionSession`、`SubscriberOfflineEvent`、`SubscriberInterruptionRecovery`、`SubscriberSessionValidation`、`SubscriberDataSourceValidation`、`SubscriberEventToolValidation` |
| 集成与场景 | 9 | `UserScenarios`、`AdvancedScenarios`、`ComprehensiveRegression`、`IntegrationTesting`、`SystemIntegration`、`DeviceCompatibility`、`LocalizationTesting`、`EventDeliveryConnectivity`、`SubscriberCompatibility` |
| 交互与可达性 | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`ToastPositioning`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects` |
| 生命周期与状态 | 10 | `ConfigurationChanges`、`ExtensionLifecycleBasics`、`StaticSubscriberExtensionLifecycle`、`SubscriberStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery` |
| 性能与长稳 | 7 | `ToastAnimationPerformance`、`SubscriberPerformance`、`PerformanceStress`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`ResourceConsumption` |
| 安全与合规 | 3 | `SubscriberSecurity`、`SecurityAccessibility`、`SecurityValidation` |
| 通用校验 | 11 | `EventCodeValidation`、`ConfigurationManagerValidation`、`CommonEventUtilValidation`、`BoundaryErrorTesting`、`FocusManagerValidation`、`InputValidation`、`SubscriberStateManagerValidation`、`LoggerValidation`、`ToastControllerValidation`、`ToastPointerUtilValidation`、`ResourceLoaderValidation` |
| 根入口 | 1 | `Ability.test.ets`（`Ability_Test`）：应用启动与基础冒烟 |

### 6.1 运行方式

测试运行使用 OpenHarmony 官方提供的 **Ability Assistant** 能力助手命令行工具，具体子命令与参数以 OpenHarmony 官方测试运行说明为准。本工程的构建与安装命令如下：

```text
# 构建测试 HAP
hvigorw --mode module -p product=default -p module=entry@ohosTest assembleHap --no-daemon

# 安装
hdc install entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap
```

安装完成后，使用 Ability Assistant 的测试子命令并按本工程配置传入 `-b ohos.samples.missionmanager -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s timeout 15000` 即可运行测试。

## 7. 结论

`MissionManager` 当前 ohosTest 已形成“共享驱动 + 领域模型校验 + 真实场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为静态订阅与通知能力后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行 | 启动应用 | 成功拉起应用并显示首页 | 是 | Pass |
| 下拉刷新任务列表位于首页 | 位于首页 | 首页界面中下拉 | 显示任务列表 | 否 | Pass |
| 锁定和解锁 | 位于首页 | 1、左滑任务<br/>2、点击**锁定**/**解锁** | 1、弹出锁定、移动、删除菜单<br/>2、成功锁定/解锁 | 否 | Pass |
| 删除任务 | 位于首页 | 1、左滑任务<br/>2、点击**删除** | 1、弹出锁定、移动、删除菜单<br/>2、任务从任务列表中删除 | 否 | Pass |
| 移动应用到前台 | 位于首页 | 1、左滑任务<br/>2、点击**移动** | 1、弹出锁定、移动、删除菜单<br/>2、任务移动到前台运行 | 否 | Pass |
| 开启静态订阅 | 位于首页 | 点击**开启静态订阅** | 调用 `setStaticSubscriberState(true)` 成功并提示 | 是 | Pass |
| 关闭静态订阅 | 位于首页 | 点击**关闭静态订阅** | 调用 `setStaticSubscriberState(false)` 成功并提示 | 是 | Pass |

