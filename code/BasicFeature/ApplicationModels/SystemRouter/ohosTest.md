# SystemRouter 测试说明

> 本说明面向 `SystemRouter`（OpenHarmony 系统路由示例工程）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档说明 `SystemRouter` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 Ability `TestAbility`，应用包名 `com.samples.systemrouter`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、`Driver` 单例（`getDriver`/`resetDriver`）、页面与文本轮询（`waitForText`/`waitForRouteStable`/`checkTextContent`）、按类型查找组件（`findComponentsByType`/`checkComponentExists`）、导航与回首页（`navigateTo`/`backToHome`）、遥控按键与触摸模拟（`pressAndWait`/`simulateTouch`）、焦点检查（`checkFocusState`/`getCurrentFocusIndex`），以及 `RouteVisitTracker`、`NavigationMetricsCalculator` 等可复用资产；同时集中定义应用标识与路由常量（`BUNDLE_NAME`、`HOME_TITLE`、各入口按钮文案与目标页标题）。
- 领域层：围绕系统路由模型（`NavPathStack` 栈语义、`pushPathByName`、`clear`、路由深度）与各页面组件模型、统计器、校验器展开确定性单元测试，系统依赖通过纯函数与内存态对象隔离。
- 场景层：模拟应用启动、首页到 entry/Har/Hsp 各页面的往返导航、HAR/HSP 跨模块路由、返回栈语义等真实系统路由场景。
- 质量层：补充性能时延、压力与长稳、异常恢复、无障碍、中英文资源、内容缩放与设备兼容、安全与契约等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

- 集中式套件清单：`List.test.ets` 统一注册 79 个测试套件，涵盖 `ActsAbilityTest` 及 Integration / Interaction / LifecycleState / Navigation / PerformanceStability / RouterValidation / Security / Validation 八类分组，使覆盖度可在不跑真机的情况下审计。
- 统一驱动能力：所有 UI 套件复用 `SharedDriver` 的页面回归、文本轮询与按键模拟，避免重复实现 UI 驱动细节。
- 返回优先而非重启：`backToHome` 优先点击 `toIndex` 回到首页，其次用 BACK 键逐级返回，避免长链路执行时堆叠 ability 实例导致测试进程被回收。
- 串行化 UI 队列：`NavPathStack` 对操作顺序敏感，所有 UiTest 调用与延时进入 `_uiOperationQueue` 串行执行，消除并发用例间的路由竞争与丢键。
- 单例 Driver：`getDriver` 全流程复用同一 `Driver` 实例，规避重复建连导致的 AAMS 连接异常（`RET_ERR_CONNECTION_EXIST` / `REGISTER_LISTENER_FAILED`）。
- 主线程让出：`serializedDelay` 以 `setTimeout` 让出事件循环而非同步阻塞，规避长跑看门狗导致的 AppFreeze 与测试进程被杀。
- 页面/标题双通道断言：既校验目标页标题文本（路由是否真正完成），也校验关键按钮存在性，降低“路由已入栈但界面未渲染”的假通过。

通过复用驱动工具、页面回归前置与串行/延时策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

- 分类矩阵：`Integration` 9、`Interaction` 14、`LifecycleState` 10、`Navigation` 16、`PerformanceStability` 7、`RouterValidation` 8、`Security` 3、`Validation` 11，另加 `ActsAbilityTest` 冒烟，共 79 个套件。
- 路由入口矩阵：entry（pageOne/pageTwo）、HAR（HarAPageOne/Two、HarBPageOne/Two）、HSP（HspAPageOne/Two、HspBPageOne/Two）× 进入/返回 × 不同起点页面。
- 按键矩阵（`InputValidation`、`KeyCodeValidation`：方向键、ENTER、BACK、HOME 与非法键码的合法/非法组合）。
- 路由操作矩阵（`RouterOperationCatalog`、`RouterOperationFlow`、`RouterOperations`、`RouterOperationWorkflow`：push/clear、深度、顺序与重复调用）。
- 生命周期矩阵（`PageLifecycle`、`PageStateManagement`、`StatePersistence`、`StateRecovery`：前后台切换 × 页面入栈出栈 × 状态保存恢复）。
- 设备与兼容矩阵（`DeviceCompatibility`、`RouterCompatibility`：手机/平板 × 输入方式 × 特性门禁）。
- 资源 × 语言矩阵（`LocalizationTesting`、`ResourceLoaderValidation`：base/zh_CN/en_US 与资源名/类型/缓存回退）。
- 离线与网络矩阵（`NetworkConnectivity`、`RouterOfflineNetwork`：离线 × 重试 × 缓存回退）。
- 性能与压力矩阵（`RouterPerformance`、`RouterConsumption`、`PerformanceStress`：负载 × 采样 × 时延上界）。

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

- 应用承载（`entry/entryability/EntryAbility.ets`：`windowStage.loadContent('pages/Index')`，onCreate/onForeground/onBackground/onWindowStageDestroy 生命周期）。
- 首页导航（`entry/pages/Index.ets`：`Navigation` + `NavPathStack`，入口按钮 `toEntryPageOne`/`toEntryPageTwo`/`toHarAPageOne`/`toHarAPageTwo`/`toHspAPageOne`/`toHspAPageTwo`，标题 `NavIndex`）。
- entry 页面（`EntryPageOne`、`EntryPageTwo`：`pushPathByName` 跳转、`pageInfos.clear()` 清栈、`.onReady` 注入 `context.pathStack` 与 `getConfigInRouteMap()`）。
- HAR 页面（`harA`、`harB` 模块：`HarAPageOne/Two`、`HarBPageOne/Two`，可跨模块路由到 entry/HAR/HSP 页面）。
- HSP 页面（`hspA`、`hspB` 共享模块：`HspAPageOne/Two`、`HspBPageOne/Two`，以及共享工具 `Calc.add`）。
- 路由配置（各模块 `resources/base/profile/router_map.json`、`main_pages.json`、`module.json5`、`syscap.json`）。
- 资源与公共能力（`resources/base|zh_CN|en_US`、media 图标、日志组件 `common/utils/Logger.ets`）。

### 3.2 关键风险点

- 冷启动慢或首帧未渲染即被操作，导致入口点击无效。
- `pushPathByName` 路由名拼写错误或目标模块缺失，导致跳转失败或空白页。
- 跨 HAR/HSP 模块路由失效（模块未安装或 `router_map` 未合并）。
- `NavPathStack` 清栈/返回语义错误，导致返回栈残留或重复入栈。
- 首页入口焦点丢失、聚焦落点错位，或进入子页后焦点未注入。
- 快速连续点击/按键导致路由竞争、重复入栈或丢键。
- 长跑过程中 UI 操作并发、同步阻塞触发看门狗导致进程被杀。
- 前后台切换、窗口销毁重建后页面状态未恢复。
- 中英文资源缺失，未绑定字段渲染为 `undefined`/`null`/`NaN`。
- 设备 SysCap 与应用要求不一致导致安装/拉起失败。
- 敏感信息在日志或界面泄露。

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 应用启动至首页可交互，标题 `NavIndex` 与六个入口按钮成对出现。
- 首页入口到 entry/Har/Hsp 各页面的往返导航可达，目标页标题与路由一致。
- `NavPathStack` 入栈/清栈/返回语义正确，栈深度符合预期。
- HAR/HSP 跨模块路由可达（`harA`/`harB`/`hspA`/`hspB`）。
- 各页面 `.onReady` 回调正确注入 `pathStack` 与路由配置。
- 遥控方向键/ENTER 与触摸点击双向可达，聚焦态与内容区同步。
- 中英文切换后文案与断言一致。
- 共享工具 `Calc.add` 等纯逻辑结果正确。

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

- 非法/不存在的路由名、非法路由参数。
- 重复 `push`、越界返回、清栈后再返回。
- 非法按键码、越界坐标、超屏坐标注入。
- 断网、超时、响应体结构异常与空数据。
- 快速连续按键、交替按键、重复点击后的状态一致性。
- 前后台切换、页面销毁重建后的状态恢复与草稿缓存恢复。

恢复类测试不仅校验接口返回值，还要求校验：焦点是否回归有效位置；页面是否回到稳定基线（首页标题存在、子页标记消失）；路由栈数量与索引是否一致，避免重复实例；离线队列是否按序重放、过期项是否被丢弃。

### 4.3 并发与长稳

- 高频方向键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`）。
- 连续路由跳转与入口反复进出（`PageLifecycle`、`NavigationConcurrency`、`AdvancedScenarios`）。
- 同一路由并发 push 与返回并发（`ConcurrencyControl`、`NavigationConsistency`）。
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）。
- 长链路执行期间的主线程让出（`serializedDelay`）。

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

- 记录冷/热启动、页面渲染、路由切换、焦点切换等多类时延，预算常量集中在 `SharedDriver`（页面渲染 1s、路由切换 2s、焦点切换 500ms）。
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢。
- 对同一操作序列多次采样，同时断言均值与最大值，避免单次抖动被平均值掩盖。
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行。
- 覆盖手机/平板的设备差异与特性门禁，并校验设备 SysCap 与应用要求一致。

### 4.5 安全与契约

- 输入清洗与校验（`InputValidation`、`SecurityValidation`：路由名、描述文本、文件/URL 参数、空白与截断）。
- 敏感信息与隐私（`RouterSecurity`：token、设备标识、路径穿越、URL 白名单与日志脱敏）。
- 会话与鉴权（`RouterAuthSession`、`RouterSessionValidation`、`RouterEventToolValidation`：会话建立/过期、权限矩阵、审计时间序）。
- 路由与数据契约（`RouterDataSourceValidation`、`RouterAppVersion`、`ConfigurationManagerValidation`、`BoundaryErrorTesting`：数据源封装、版本门禁、默认值与限流、边界错误）。
- 通知与离线（`RouterNotification`、`RouterOfflineNetwork`、`RouterInterruptionRecovery`：通知触达、离线回退、中断恢复）。

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）。
- 焦点高亮、焦点环样式与可见性（`FocusRingBehavior`、`FocusNavigation`）。
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）。
- 内容缩放、布局测量与滚动边界（`ContentScaling`、`PagePositioning`）。
- 主题与对比度（`ThemeVariation`、`VisualEffects`）。
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）。

## 5. 充分性说明

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试。
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入。
- 覆盖方式多样：单点验证、矩阵组合、混沌回放、多采样统计、桩对象隔离并存。
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、状态标签、文本可读性与时延上界。
- 资产可审计：`List.test.ets` 集中登记 79 个套件，套件名唯一、分组完整，可在不跑真机的情况下审计覆盖度。
- 测试资产可复用：`SharedDriver`、统一回首页前置与串行/延时策略便于继续扩展而不破坏既有结构。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 冒烟 | 1 | `ActsAbilityTest`（`Ability.test.ets`）：拉起应用、首页三入口往返导航 |
| 导航 `Navigation` | 16 | `NavigationUI`、`NavigationLifecycle`、`NavigationConcurrency`、`NavigationConsistency`、`NavigationEndToEnd`、`NavigationErrorRecovery`、`NavigationStateManagement`、`NavigationStress`、`RouterOperations`、`RouterOperationFlow`、`RouterOperationCatalog`、`RouterOperationWorkflow`、`RouterMenuConfiguration`、`RouterItemInfoModel`、`RouterModelDeep`、`RouterInputInteraction` |
| 校验 `Validation` | 11 | `InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`FocusManagerValidation`、`ConfigurationManagerValidation`、`BoundaryErrorTesting`、`PointerUtilValidation`、`CommonEventUtilValidation`、`AnimationControllerValidation`、`PageStateManagerValidation`、`ResourceLoaderValidation` |
| 集成 `Integration` | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`RouterCompatibility`、`SystemIntegration`、`UserScenarios` |
| 交互 `Interaction` | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`PagePositioning`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects` |
| 生命周期 `LifecycleState` | 10 | `ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycle`、`PageLifecycle`、`PageStateManagement`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`、`ConfigurationChanges` |
| 路由校验 `RouterValidation` | 8 | `RouterAppVersion`、`RouterAuthSession`、`RouterDataSourceValidation`、`RouterEventToolValidation`、`RouterInterruptionRecovery`、`RouterNotification`、`RouterOfflineNetwork`、`RouterSessionValidation` |
| 性能与长稳 `PerformanceStability` | 7 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`RouterConsumption`、`RouterPerformance` |
| 安全 `Security` | 3 | `RouterSecurity`、`SecurityAccessibility`、`SecurityValidation` |
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：串行 UI 队列、Driver 单例、导航/回首页、文本与组件轮询、按键与触摸、焦点检查、路由统计等可复用资产 |

## 7. 结论

`SystemRouter` 当前测试设计形成了“共享驱动 + 领域校验 + 真实路由场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可作为系统路由能力后续持续集成、版本回归和测试审计的核心基础。

> 运行说明：全量用例较多，系统测试命令（Ability Assistant）的启动过滤能力有限。建议使用最新构建产物（`entry/build/default/outputs/...`）并确保设备解锁、屏幕常亮（`TestAbility` 已 `setWindowKeepScreenOn(true)`）；使用类过滤参数（`-s class`）时，需保证测试 HAP 与类清单同源（同一构建）。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 1. 需在真机测试 <br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动 | 无 | 成功拉起应用并显示首页 `NavIndex` | 是 | Pass |
| 首页跳转 entry-pageOne | 进入首页 | 点击 `toEntryPageOne` | 显示 `entry-pageOne` 页面 | 是 | Pass |
| entry-pageOne 返回首页 | 进入 entry-pageOne | 点击 `toIndex` | 回到首页 `NavIndex` | 是 | Pass |
| 首页跳转 entry-pageTwo | 进入首页 | 点击 `toEntryPageTwo` | 显示 `entry-pageTwo` 页面 | 是 | Pass |
| 首页跳转 harA-pageOne | 进入首页 | 点击 `toHarAPageOne` | 显示 `harA-pageOne` 页面 | 是 | Pass |
| 首页跳转 hspA-pageOne | 进入首页 | 点击 `toHspAPageOne` | 显示 `hspA-pageOne` 页面 | 是 | Pass |
| 子页返回首页 | 进入任一子页 | 点击 `toIndex` 或按 BACK | 回到首页 `NavIndex` | 是 | Pass |
