# StaticSubscriber 测试说明

> 本说明面向 `StaticSubscriber`（OpenHarmony 静态订阅示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。

## 1. 文档目标

本文档用于说明 `StaticSubscriber` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架，入口为 `List.test.ets`，运行器为 `testrunner/OpenHarmonyTestRunner`，测试承载页为 `TestAbility`。测试按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/StaticSubscriberDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面拉起与稳定等待（`launchSubscriberApp`、`waitForPageStable`、`triggerSubscriberPage`）、按钮点击（`clickEnableButton`、`clickDisableButton`）、组件查询（`componentExistsById`、`countComponents`）、文本检查（`checkTextContent`、`hasNonEmptyText`）、焦点检查（`getCurrentFocusIndex`、`checkFocusExists`）、遥控按键与触摸模拟（`pressAndWait`、`simulateTouch`），以及事件、通知、状态机、会话、配置、指标、日志、键码、安全、资源、性能和边界等可复用领域模型。
- 领域层：围绕静态订阅状态机（`SubscriberStateMachine`）、事件校验（`SubscriberEventValidator`）、通知构建与发布（`NotificationRequestBuilder`、`NotificationPublisherModel`）、配置管理（`SubscriberConfigManager`）、会话管理（`SubscriberSession`、`SubscriberSessionManager`）、操作目录与指标（`OperationCatalog`、`OperationMetricsCollector`）、日志缓冲（`LoggerBuffer`）、键码模型（`KeyCodeModel`）、输入清洗（`InputSanitizer`）、资源预算（`ResourceBudgetModel`）、安全策略（`SecurityPolicyModel`）、性能采样（`PerformanceProfiler`）、边界检查（`BoundaryChecker`）和工作流（`SubscriberWorkflowModel`）展开确定性测试，系统依赖通过纯函数或桩对象隔离。
- 场景层：模拟应用启动、开启/关闭静态订阅按钮、遥控器焦点导航、Toast 提示、通知发布、事件接收、页面交互等真实静态订阅使用场景。
- 质量层：补充集成、生命周期、异常恢复、并发、长稳、性能、兼容性、安全、无障碍、本地化和边界校验等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。
### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件入口：`List.test.ets` 统一导入并执行 79 个测试套件（含 `Ability` 基础套件），覆盖 `Subscriber`、`SubscriberValidation`、`Integration`、`Interaction`、`Lifecycle`、`Performance`、`Security`、`Validation` 八个测试域，便于统一维护和扩展。
- 统一驱动能力：所有 UI 套件复用 `StaticSubscriberDriver` 的页面拉起、稳定等待、按钮点击、组件查询、文本检查与焦点检查，避免各套件重复实现 UI 驱动细节。
- 串行化 UI 队列：TV 设备 UI 线程渲染要求 UiTest 调用串行执行，所有 UI 操作进入 `runSerializedUiOperation` 队列，消除并发用例之间的焦点竞争与事件丢失。
- 主线程节流：`serializedDelay` 使用 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀。
- 稳定的页面回归：`waitForPageStable` 以 `btnEnable` 或 `btnDisable` 真实出现作为页面就绪条件，超时后重新拉起 `EntryAbility`，避免固定延时导致的偶发失败。
- 退出策略修正：测试套件 `afterAll` 不再发送 `KEY_BACK`，避免误关闭 TestAbility 导致 `App died`。
- 操作目录断言修正：将固定断言 `getOperationCount() == 5` 调整为“至少包含 4 个核心操作，且 `getOperations().length` 与 `getOperationCount()` 一致”，避免不同 SDK 版本下目录数量差异导致批量失败。
- 双语资源兼容：文本检查优先使用 `hasNonEmptyText` 判断文本是否渲染，避免中英文资源差异导致断言失效。

通过复用驱动工具、页面回归前置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`Subscriber` 16 个套件、`SubscriberValidation` 8 个、`Integration` 9 个、`Interaction` 14 个、`Lifecycle` 10 个、`Performance` 7 个、`Security` 3 个、`Validation` 11 个，加上 `Ability` 基础套件，共 79 个套件。
- 事件矩阵：`EventKind` 覆盖 NORMAL、EMPTY、LONG、UNICODE、SPECIAL；事件数据长度覆盖 0 与 1024 边界；事件名长度覆盖 0 与 256 边界。
- 状态矩阵：`SubscriberState` 覆盖 DISABLED、ENABLING、ENABLED、DISABLING、ERROR；操作覆盖 enable、disable、toggle、reset 与重复 enable/disable。
- 会话矩阵：覆盖 1 至 3 个并发会话的创建、激活、关闭、活跃数量与操作记录。
- 通知矩阵：覆盖通知 ID、标题、正文、附加文本、内容类型，以及有效通知与无效通知的发布结果。
- 配置矩阵：覆盖 bundleName、abilityName、extensionName、notificationId、eventName 的合法值与非法值。
- 操作与指标矩阵：覆盖 4 个核心操作（enable、disable、receive、publish）以及 reset 的计数、错误计数与重置。
- 安全矩阵：覆盖权限授予、拒绝、撤销，bundle 匹配与不匹配，事件来源合法与非法。
- 资源与边界矩阵：覆盖内存、定时器、文件句柄预算，字符串长度、数字范围、ID 合法性和 clamp 边界。
- 性能矩阵：覆盖采样次数、成功/失败计数、平均耗时、最大耗时、最小耗时与预算内判断。
- UI 矩阵：覆盖按钮点击、焦点导航、焦点环、触摸、手势、主题、内容缩放、视觉效果、Toast 定位和组件渲染。

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。
## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 静态订阅扩展（`StaticSubscriber/StaticSubscriber.ts`）：`onReceiveEvent` 接收事件、调用 `setNotificationEnable`、构建 `NotificationRequest` 并发布通知。
- 静态订阅页面（`pages/Index.ets`）：`btnEnable` 开启静态订阅、`btnDisable` 关闭静态订阅、`promptAction.showToast` 提示、`commonEventManager.setStaticSubscriberState` 状态设置。
- 应用承载（`MainAbility/MainAbility.ts`）：`onCreate`、`onDestroy`、`onWindowStageCreate`、`onWindowStageDestroy`、`onForeground`、`onBackground` 生命周期。
- 应用启动阶段（`Application/AbilityStage.ts`）：`onCreate` 初始化。
- 日志能力（`model/Logger.ts`）：基于 `@ohos.hilog` 的 debug、info、warn、error 输出。
- 模块配置（`module.json5`）：`staticSubscriber` 扩展能力、`ohos.permission.NOTIFICATION_CONTROLLER` 权限、`subscribe` 资源配置。
- 资源与配置：`resources/base|en|zh`、`main_pages.json`、`subscribe.json`、测试页 `test_pages.json`。

### 3.2 关键风险点

围绕静态订阅与通知场景，重点识别如下风险：

- 静态订阅扩展未触发或事件丢失，导致通知不发布。
- `setStaticSubscriberState` 调用失败或返回异常，导致页面提示与真实状态不一致。
- 通知权限未授予、`setNotificationEnable` 失败或通知发布失败。
- 页面未渲染、按钮 ID 变化或按钮不可点击，导致 UI 用例误判。
- 遥控器焦点丢失、焦点落点错位或切换后未注入焦点。
- 重复开启/关闭、状态机非法迁移或 reset 后状态不一致。
- 事件数据为空、超长、包含 Unicode 或特殊字符时校验失效。
- 通知 ID、标题、正文、内容类型非法导致发布失败。
- 会话未关闭、资源预算超限或定时器/文件句柄泄漏。
- 配置项与 bundleName、abilityName、eventName 不一致。
- 并发操作、压力操作、长时间运行导致状态漂移或内存增长。
- 权限绕过、bundle 伪造、非法事件来源或敏感日志泄露。
- 中英文资源缺失或按钮文本未渲染。
- API 版本与设备系统能力不匹配，例如静态订阅系统接口在较新 SDK 中移除，或 `rpcid.sc` 包含设备不支持的 SystemCapability。

这些风险点直接决定了当前测试设计的重点方向。
## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能打开”，而是拆成可验证的细粒度行为：

- 页面拉起：应用启动后能进入静态订阅页面，`btnEnable` 与 `btnDisable` 存在。
- 开启/关闭订阅：点击按钮后可观察 Toast 提示，状态机迁移到 ENABLED 或 DISABLED。
- 事件接收：有效事件通过 `SubscriberEventValidator` 校验，空事件、超长事件、Unicode 事件和特殊字符事件分别得到正确结果。
- 通知构建：通知 ID、标题、正文、附加文本、内容类型均按预期填充，`NotificationRequestBuilder.isValid()` 返回正确结果。
- 通知发布：有效通知发布成功并计入发布数量，无效通知发布失败并计入失败数量。
- 配置管理：默认配置正确，合法配置可更新，非法配置被拒绝并计入无效次数。
- 会话管理：会话创建、激活、关闭、活跃数量、操作记录和快照字段正确。
- 操作目录与指标：核心操作可被识别，指标计数、错误计数和 reset 行为正确。
- 工作流：开启订阅、接收事件、发布通知、关闭订阅的端到端结果正确。

### 4.2 异常流与恢复

异常测试覆盖：

- 空事件、空事件名、超长事件数据、超长事件名、Unicode 数据、特殊字符数据。
- 重复开启、重复关闭、状态机非法迁移、reset 后再次操作。
- 非法通知 ID、空标题、超长标题、超长正文、错误内容类型。
- 非法配置、空 bundleName、空 abilityName、空 extensionName、非法 eventName。
- 会话关闭后继续操作、重复关闭、查询不存在的会话。
- 权限拒绝、bundle 不匹配、事件来源包含非法路径。
- 资源预算为负、内存/定时器/文件句柄超限。
- 中断恢复、离线事件、错误恢复、异常处理、配置变更后的状态恢复。

恢复类断言不仅校验接口返回值，还校验：

- 当前状态是否回到有效状态。
- 页面是否回退到稳定页面。
- 会话是否可重新创建。
- 指标是否纠正错误计数。
- 通知发布失败后是否可重新发布。

### 4.3 并发与长稳

TV 场景下，用户可能连续执行多次按钮切换、事件触发与页面操作，因此需要关注：

- 串行 UI 队列：所有 UiTest 调用通过 `runSerializedUiOperation` 串行执行，避免焦点竞争。
- 并发会话：多个会话同时创建、激活、关闭时，活跃数量与快照一致。
- 并发操作：开启、关闭、接收、发布交替执行后，指标总数与状态一致。
- 压力测试：`SubscriberStress` 与 `PerformanceStress` 覆盖高频操作。
- 长时间运行：`LongTermStability` 覆盖重复操作后的状态稳定。
- 内存泄漏：`MemoryLeakDetection` 覆盖会话、日志、通知对象的生命周期。
- 主线程节流：`serializedDelay` 避免同步阻塞导致 `THREAD_BLOCK_6S`。
### 4.4 性能与兼容性

性能与兼容性覆盖：

- 页面渲染：`SubscriberUI`、`UIComponentRendering`、`ContentScaling`、`VisualEffects` 校验页面与组件渲染。
- 按钮与 Toast：`ButtonInteraction`、`ToastPositioning`、`ToastAnimationPerformance` 校验点击响应与提示展示。
- 资源消耗：`ResourceConsumption`、`SubscriberPerformance`、`PerformanceStress` 校验操作耗时与资源预算。
- 长时间稳定性：`LongTermStability`、`MemoryLeakDetection`、`ConcurrencyControl` 校验长跑与并发场景。
- 设备兼容：`DeviceCompatibility`、`SubscriberCompatibility` 校验不同设备与 SDK 版本。
- 集成兼容：`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression` 校验模块协同。
- 本地化：`LocalizationTesting` 校验中英文资源与文本渲染。
- API 与系统能力兼容：主工程使用静态订阅系统接口时按设备可用的 SDK 编译，并通过 `syscap.json` 移除设备不支持的 SystemCapability，避免安装或运行阶段出现 `00401004` 类系统能力不匹配错误。

### 4.5 安全与约束

安全与约束覆盖：

- 通知权限：校验 `ohos.permission.NOTIFICATION_CONTROLLER` 的授予、拒绝与撤销。
- bundle 校验：仅允许目标 bundleName，其他 bundle 返回拒绝。
- 事件来源校验：空来源、包含 `..` 或 `/` 的来源被拒绝。
- 输入清洗：`InputSanitizer` 覆盖 trim、长度校验、控制字符移除和引号转义。
- 安全策略：`SubscriberSecurity`、`SecurityValidation`、`SecurityAccessibility` 覆盖权限、来源、bundle 与无障碍安全。
- 审计与日志：日志仅使用 `@ohos.hilog`，不使用 `console.log`；日志内容使用英文，避免敏感信息与中文编码问题。
- 发布约束：通知标题、正文、内容类型和 ID 必须满足约束后才能发布。

### 4.6 可达性与易用性

面向 TV 与无障碍场景，测试重点覆盖：

- 无障碍导航：`AccessibilityNavigation`、`SecurityAccessibility` 校验焦点顺序与可访问性。
- 焦点导航：`FocusNavigation`、`FocusRingBehavior` 校验方向键导航与焦点环。
- 按钮交互：`ButtonInteraction` 校验点击、重复点击与状态反馈。
- 触摸与手势：`TouchInteraction`、`GestureRecognition` 校验触摸与手势识别。
- 事件处理与传播：`EventHandling`、`EventPropagation` 校验事件分发。
- 主题与视觉：`ThemeVariation`、`VisualEffects` 校验不同主题与视觉效果。
- 内容缩放与数据绑定：`ContentScaling`、`DataBinding` 校验缩放与状态绑定。
- 提示定位：`ToastPositioning` 校验 Toast 在页面中的位置。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试从以下方面保证充分性：

- 覆盖面完整：从共享驱动、领域模型、UI 场景、集成流程到质量属性均有对应套件。
- 覆盖维度丰富：功能、异常、并发、性能、兼容、安全、无障碍、本地化和边界均有覆盖。
- 覆盖方式多样：包含正常路径、异常路径、边界值、组合矩阵、重复操作、压力与长稳。
- 断言粒度细：不仅校验接口返回值，还校验状态、计数、通知字段、会话快照、组件存在性和文本渲染。
- 资产复用强：`StaticSubscriberDriver` 统一页面回归、串行 UI 队列、文本/焦点检查和领域模型，避免重复实现。
- 结果可验证：当前在设备上执行 4240 个自动化用例，全部通过。
- 构建可复现：HAP 构建、签名、安装、Hypium 测试执行链路已打通，并修复了测试运行器路径、`afterAll` 返回键、操作目录数量和系统能力声明等问题。
## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个测试套件。目录与职责如下：

| 目录 | 套件数 | 套件与职责 |
|---|---:|---|
| `Shared` | 1 | `StaticSubscriberDriver.ets`：串行 UI 操作、页面拉起与回归、按钮点击、组件/文本/焦点检查、遥控按键与触摸模拟，以及状态机、事件、通知、会话、配置、指标、日志、键码、安全、资源、性能、边界和工作流模型 |
| 根目录 | 2 | `Ability.test.ets`：应用启动、页面就绪、按钮存在性、状态机、事件、通知、目录指标、工作流与工具函数；`List.test.ets`：统一导入并执行全部套件 |
| `Subscriber` | 16 | `SubscriberUI`、`SubscriberStateManagement`、`SubscriberLifecycle`、`SubscriberErrorRecovery`、`SubscriberEndToEnd`、`SubscriberModelDeep`、`SubscriberConcurrency`、`SubscriberConsistency`、`SubscriberStress`、`EventDataModel`、`EventTriggerInteraction`、`SubscribeConfiguration`、`NotificationCatalog`、`NotificationFlow`、`NotificationOperations`、`NotificationWorkflow` |
| `SubscriberValidation` | 8 | `SubscriberAppVersion`、`SubscriberDataSourceValidation`、`SubscriberEventToolValidation`、`SubscriberInterruptionRecovery`、`SubscriberNotification`、`SubscriberOfflineEvent`、`SubscriberPermissionSession`、`SubscriberSessionValidation` |
| `Integration` | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`EventDeliveryConnectivity`、`IntegrationTesting`、`LocalizationTesting`、`SubscriberCompatibility`、`SystemIntegration`、`UserScenarios` |
| `Interaction` | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`ToastPositioning`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects` |
| `Lifecycle` | 10 | `ConfigurationChanges`、`ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycleBasics`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`、`StaticSubscriberExtensionLifecycle`、`SubscriberStateManagement` |
| `Performance` | 7 | `ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`ResourceConsumption`、`SubscriberPerformance`、`ToastAnimationPerformance` |
| `Security` | 3 | `SecurityAccessibility`、`SecurityValidation`、`SubscriberSecurity` |
| `Validation` | 11 | `BoundaryErrorTesting`、`CommonEventUtilValidation`、`ConfigurationManagerValidation`、`EventCodeValidation`、`FocusManagerValidation`、`InputValidation`、`LoggerValidation`、`ResourceLoaderValidation`、`SubscriberStateManagerValidation`、`ToastControllerValidation`、`ToastPointerUtilValidation` |

## 7. 结论

`StaticSubscriber` 当前测试已经形成“共享驱动 + 领域模型 + 场景交互 + 质量属性”的组合式设计。该结构具备良好的扩展性、可维护性和风险覆盖能力，可以作为静态订阅示例持续集成、版本回归和测试审计的基础。

## 附录：手工用例归档
| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 静态页面拉起 | 位于桌面 | 点击静态页面应用 | 进入静态页面应用 | 否 | Pass |
| 静态页面拉起 | 位于静态页面应用 | 点击开启静态订阅 | 返回到桌面 | 否 | Pass |
| 静态页面拉起 | 位于静态页面应用 | 点击返回 | 返回到桌面 | 否 | Pass |
| 发布功能 | 位于桌面 | 点击发布应用 | 进入发布应用 | 否 | Pass |
| 发布功能 | 位于发布应用 | 点击发布按钮 | 发布成功 | 否 | Pass |
| 发布功能 | 位于发布应用 | 下拉菜单栏 | 收到静态订阅的通知 | 否 | Pass |
| 静态页面拉起 | 位于桌面 | 点击静态页面应用 | 进入静态页面应用 | 是 | Pass |
| 静态页面拉起 | 位于静态页面应用 | 点击开启静态订阅 | 开启静态订阅成功 | 是 | Pass |
| 静态页面拉起 | 位于静态页面应用 | 点击关闭静态订阅 | 关闭静态订阅成功 | 是 | Pass |
| 发布功能 | 位于桌面 | 点击发布应用 | 进入发布应用 | 是 | Pass |
| 发布功能 | 位于发布应用 | 点击发布 | 发布消息成功 | 是 | Pass |
| 通知展示 | 位于静态页面应用 | 触发静态订阅事件 | 收到通知且标题为事件数据 | 是 | Pass |
| 状态一致性 | 位于静态页面应用 | 连续开启/关闭订阅 | 状态、Toast 与指标保持一致 | 是 | Pass |
| 异常恢复 | 位于静态页面应用 | 非法事件/非法通知 | 操作被拒绝并可恢复 | 是 | Pass |






