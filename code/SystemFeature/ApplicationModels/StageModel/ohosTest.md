# StageModel 测试说明

> 本说明面向 `ApplicationModels/StageModel`（OpenHarmony 应用模型综合样例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档说明 `StageModel` 自动化测试的设计原则、覆盖维度、充分性依据与后续扩展方向，聚焦“为什么这样设计测试”以及“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `testrunner/OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、主线程让出式延时（`serializedDelay`）、按键与触摸模拟（`triggerSerializedKey`、`pressAndWait`、`simulateTouch`）、组件与文本轮询（`componentCount`、`checkComponentExists`、`checkTextContent`、`checkTextContains`、`waitForComponentByType`、`waitForText`）、焦点检查（`getCurrentFocusIndex`、`checkFocusState`）、页面就绪与拉起（`launchMainAbility`、`launchNamedAbility`、`ensureAppReady`、`scrollToBottom`），以及 `buildDataShareUri`、`normalizeDataShareUri`、`isSampleDataShareUri` 等纯函数与 `BUNDLE_NAME`、`ABILITY_MAIN/JUMP/SERVICE/FORM/DATA_SHARE`、`DATA_SHARE_URI`、`ACCOUNT_ID`、`RESULT_CODE`、`CONNECTION_NUMBER` 等常量
- 领域层：围绕 AbilityContext/ServiceExtContext 操作模型、Bundle 查询参数、AccessCtrl 授权状态机、BookModel 与结果集、Window/Form 状态、事件传播/焦点/手势模型、恢复与回归统计等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟 Ability 启动/带账户操作/服务启停/连接断开、DataShare 图书增删改查与通知、Bundle 信息查询、权限校验、窗口方向与唤醒、Form 扩展拉起、页面导航与交互
- 质量层：补充并发、长稳、内存泄漏、资源消耗、动画性能、设备兼容、本地化、安全与无障碍等非功能维度

每个测试文件为自包含的 `.test.ets`，领域模型与断言内联，避免跨套件状态污染；仅少量场景用例通过 `SharedDriver` 访问 UiTest，并统一使用 `try/catch` 保护，保证在无业务数据时也能稳定执行。

### 2.2 高复用设计

- 集中式套件清单：`List.test.ets` 统一登记 81 个套件；旧 `Ability.test.ets` 不再注册，避免其依赖的未迁移页面链路影响整体执行
- 统一驱动能力：所有场景用例复用 `SharedDriver` 的串行队列、文本/组件轮询、按键与触摸模拟、页面就绪检测
- 串行化 UI 队列：设备 UI 线程单线程特性要求所有 UiTest 调用与延时进入同一 `_uiOperationQueue`，消除并发用例之间的焦点竞争与丢键
- 主线程让出：延时通过 `driver.delayMs` 让出事件循环，规避长跑时看门狗导致的 AppFreeze
- 常量集中：Bundle 名、Ability 名、DataShare URI、账户 ID、结果码、连接号等集中在 `SharedDriver`，保证断言口径一致
- 自包含模型：每个套件内定义模型/枚举/接口，测试不依赖真实业务数据与网络环境

### 2.3 矩阵化设计

关键场景采用组合矩阵扩展覆盖：

- 能力矩阵（AbilityContext/ServiceExtContext）：启动、带账户启动、服务启停、连接/断开、终止、权限申请、任务标签 × 正常/异常/重复调用
- 数据矩阵（BookModel/DataShare）：id/name/introduction × 插入、更新、删除、查询、通知、URI 规范化
- 权限矩阵（AccessCtrlStateManager）：GRANTED/DENIED/REVOKED/UNKNOWN × 接受/拒绝 × 历史与计数
- 查询矩阵（Bundle）：flags 组合、边界值、配置校验、资源加载与输入校验
- 交互矩阵（Window）：焦点导航、按键、触摸、手势、事件传播 × 主题/缩放/视效
- 生命周期矩阵：create/foreground/background/destroy/terminate × 配置变更、状态持久化、状态恢复
- 性能矩阵：并发、长稳、内存泄漏、资源消耗、动画 × 多轮采样与上界断言
- 兼容与安全矩阵：设备/分辨率/语言/离线 × 数据共享安全、无障碍安全、输入校验

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载与导航：`MainAbility`、`MyAbilityStage`、`pages/Index.ets`（首页各入口：DataShareExtAbility、AbilityContext、ServiceExtContext、Bundle、AbilityAccessCtrl、DataShareHelper、Window、FormExtContext）
- 应用模型能力页：`AbilityContextPage`、`ServiceExtContextPage`、`BundlePage`、`AbilityAccessCtrlPage`、`DataShareExtAbilityPage`、`DataShareHelperPage`、`WindowPage`、`FormExtContextPage`
- 控制器：`AbilityContextController`、`ServiceExtContextController`、`BundleController`、`AbilityAccessCtrlController`、`WindowController`、`FormExtContextController`、`DataShareHelper`
- 数据模型与结果集：`BookModel`、`DataShareResultSet`
- 扩展与配置：`DataShareExtAbility`、`ServiceExtAbility`、`FormAbility`、`module.json5`、`resources`

### 3.2 关键风险点

围绕应用模型样例场景，重点识别如下风险：

- SDK 演进导致 API 移除或重命名（`ServiceExtensionAbility`、`DataShareExtensionAbility`、`createDataShareHelper`、`getApplicationInfo`、`startServiceExtensionAbility*` 等）
- 设备时钟与签名 profile 有效期不匹配，导致 `install parse profile prop check error`
- 普通应用申请受限权限未通过 profile ACL 放行，导致 `grant request permissions failed`
- 特权扩展（`appService`/`dataShare`）缺少系统应用证书，导致安装被拒
- Hypium 在 `onWindowStageCreate` 中同步启动，阻塞前台生命周期触发 `LIFECYCLE_TIMEOUT`
- UI 单线程下并发操作导致焦点竞争、丢键与状态错乱
- DataShare 与关系型数据库调用签名不一致（表参数、回调参数个数）
- 状态/历史/计数类模型在边界值（0、负数、越界、重复操作）下偏差
- 权限、连接、生命周期状态迁移不闭合，导致非法状态未被拒绝
- 多语言、主题、缩放、离线与设备差异下的渲染与断言不一致

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面可见”，而是拆成可验证的细粒度行为：

- AbilityContext：启动、带结果启动、带账户启动、服务启停、连接/断开、终止、权限申请、任务标签、终止状态查询
- ServiceExtContext：服务启动/停止、带账户启停、连接/断开、`startAbilityByCall`
- DataShare：图书新增、更新、删除、全量查询、变更通知、URI 规范化/反规范化、离线缓存与中断恢复
- Bundle：应用信息、进程、代码路径、版本、Ability 信息、边界值、配置一致性、资源加载、输入校验
- AbilityAccessCtrl：授权状态机、令牌校验、接受/拒绝/撤销、历史与计数
- Window/Form：唤醒屏幕、获取顶层窗口、显示方向、Form 扩展拉起与生命周期
- 页面与交互：入口导航、按钮/触摸/手势、事件处理与传播、焦点导航/焦点环、主题与视效、内容缩放、数据绑定、UI 渲染

### 4.2 异常流与恢复

异常流设计覆盖：

- 必填/非法参数、越界索引、非法键码、非法 URI、空值与空集合
- 重复启动、重复连接、重复授权、重复提交后的状态一致性
- 服务连接失败、权限拒绝、网络离线、请求超时与数据源异常
- 生命周期异常（后台/前台切换、终止中调用、状态回退）
- 故障恢复（重试策略、熔断状态、状态恢复、持久化恢复）

恢复类测试同时校验：状态是否回到稳定基线、计数与历史是否一致、错误是否被正确记录与展示。

### 4.3 并发与长稳

- 高频操作与焦点快速变化（`AbilityContextConcurrency`、`WindowEventPropagation`、`WindowFocusNavigation`）
- 连续路由与页面进出（`AbilityContextEndToEnd`、`UserScenarios`、`AdvancedScenarios`）
- 并发执行与串行化一致性（`ConcurrencyControl`、`WindowEventHandling`）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`、`AbilityContextStress`）
- 主线程让出与超时保护（`serializedDelay`、`TIMEOUT_*` 常量）

### 4.4 性能与兼容性

- 记录页面渲染、按键响应、焦点切换、操作执行、批量循环等多类时延，阈值集中在 `SharedDriver`（页面渲染 1s、Ability 操作 2s、Toast 2s、焦点切换 500ms）
- 采用宽松上界断言，仅用于拦截异常变慢，避免真机波动造成误判
- 对同一操作序列多轮采样，同时关注均值与峰值，避免单次抖动被平均掩盖
- 覆盖动画帧规划、并发队列、资源预算、内存泄漏与长期稳定性
- 在内容缩放、分辨率、深色/浅色主题、中英文资源、离线网络与不同设备形态下重复执行

### 4.5 安全与契约

- 数据共享安全：URI 校验、表名提取、根路径约束、非法 URI 拒绝
- 无障碍安全：角色与交互语义检查、触控目标尺寸与对比度
- 输入安全：控制字符、空白、超长输入、非法枚举、越界数值
- 契约一致性：Bundle 配置、资源名与类型、能力名与 URI 常量、模块与包信息
- 权限审计：授权/拒绝/撤销记录、越权访问拒绝、审计时间序

### 4.6 可达性与易用性

- 焦点顺序、焦点环、焦点可见性与方向键/ENTER/BACK 导航
- 按钮、触摸、手势、事件分发与传播顺序
- 内容缩放、滚动边界、主题与视觉反馈
- 中英文文案与资源完整性
- 错误提示与 Toast 文案的可读性

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- 覆盖层次完整：共享驱动层、领域算法层、场景回归层与质量层均有对应测试
- 覆盖维度齐全：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、多轮采样、桩对象隔离并存
- 数据校验细化：不仅校验返回值，还校验索引、计数、历史、状态迁移、文本与时延上界
- 资产可审计：`List.test.ets` 集中登记 81 个套件，套件与文件一一对应
- 结果可复现：`SharedDriver` 串行化与常量集中，降低跨套件与跨设备波动

### 5.2 当前执行结果

在 OpenHarmony 设备上通过测试运行器执行全量套件，结果为：`Tests run: 3116, Failure: 0, Error: 0, Pass: 3116`。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 81 个套件（另有 1 个共享驱动文件），共 3116 条用例：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：串行 UI 队列、延时让出、文本/组件轮询、按键与触摸模拟、焦点检查、页面就绪、URI 与常量工具 |
| 应用模型核心 `core` | 18 | `AbilityRequestModel`、`AbilityRequestConfiguration`、`AbilityContextModelDeep`、`AbilityOperationCatalog`、`AbilityOperationFlow`、`AbilityOperations`、`AbilityOperationWorkflow`、`AbilityContextUI`、`AbilityContextInteraction`、`AbilityContextConcurrency`、`AbilityContextConsistency`、`AbilityContextEndToEnd`、`AbilityContextErrorRecovery`、`AbilityContextLifecycle`、`AbilityContextStateManagement`、`AbilityContextStress`、`ServiceExtContextOperations`、`ServiceExtContextLifecycle` |
| 数据共享 `dataShare` | 8 | `BookModelVersion`、`DataShareSessionAuth`、`DataSourceValidation`、`DataShareEventValidation`、`DataShareInterruptionRecovery`、`DataChangeNotification`、`DataShareOfflineNetwork`、`DataShareSessionValidation` |
| 包与权限 `bundle-auth` | 6 | `BundleBoundaryErrorTesting`、`BundleConfigurationValidation`、`BundleInputValidation`、`BundleResourceLoaderValidation`、`AccessCtrlStateManager`、`AbilityAccessCtrlVerification` |
| 校验 `validation` | 5 | `WindowAnimationValidation`、`CommonEventValidation`、`KeyCodeValidation`、`LoggerValidation`、`DataSharePointerUtilValidation` |
| 交互与表单 `interaction` | 15 | `WindowInteraction`、`WindowButtonInteraction`、`WindowContentScaling`、`WindowDataBinding`、`WindowEventHandling`、`WindowEventPropagation`、`WindowFocusNavigation`、`WindowVisualEffects`、`WindowThemeVariation`、`WindowFocusRingBehavior`、`WindowGestureRecognition`、`WindowTouchInteraction`、`WindowUIComponentRendering`、`FormExtContextInteraction`、`FormExtContextLifecycle` |
| 生命周期 `lifecycle` | 10 | `ConfigurationChanges`、`ExtensionLifecycle`、`AbilityContextLifecycleDeep`、`StateManagementDeep`、`ErrorRecoveryDeep`、`ExceptionHandling`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery` |
| 性能与稳定 `performance` | 7 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`ResourceConsumption`、`AbilityPerformance` |
| 集成与场景 `integration` | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`DataShareCompatibility`、`SystemIntegration`、`UserScenarios` |
| 安全 `security` | 3 | `DataShareSecurity`、`SecurityAssistive`、`SecurityValidation` |

## 7. 结论

`StageModel` 当前测试设计已形成“共享驱动 + 领域校验 + 场景回归 + 非功能质量”的组合式覆盖结构，覆盖应用模型核心能力、数据共享、包与权限、交互、生命周期、性能、集成与安全。该结构具备良好的扩展性、可维护性与风险发现能力，可作为本工程持续集成、版本回归与测试审计的基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 否 | Pass |
| 首页菜单点击 | 位于首页 | 点击首页 **DataShareExtAbility** | 进入 DataShareExtAbility 页面 | 否 | Pass |
| DataShareExtAbility | 位于 DataShareExtAbility 页面 | 1、点击 **+** 按钮<br/>2、点击更新数据<br/>3、点击 **删除** 按钮 | 1、成功添加数据<br/>2、成功更新数据<br/>3、成功删除数据 | 否 | Pass |
| AbilityContext | 位于首页 | 1、点击 AbilityContext<br/>2、点击页面中第一屏按钮 | 1、进入 AbilityContext 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| AbilityContext | 位于 AbilityContext 页面 | 点击页面中第二屏按钮 | 功能正常执行，提示正常 | 否 | Pass |
| AbilityContext | 位于 AbilityContext 页面 | 点击页面中第三屏按钮 | 功能正常执行，提示正常 | 否 | Pass |
| AbilityContext | 位于 AbilityContext 页面 | 点击页面中第四屏按钮 | 功能正常执行，提示正常 | 否 | Pass |
| ServiceExtContext | 位于首页 | 1、点击 ServiceExtContext<br/>2、点击页面中各个按钮 | 1、进入 ServiceExtContext 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| Bundle | 位于首页 | 1、点击 Bundle<br/>2、点击页面中各个按钮 | 1、进入 Bundle 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| AbilityAccessCtrl | 位于首页 | 1、点击 AbilityAccessCtrl<br/>2、点击页面中各个按钮 | 1、进入 AbilityAccessCtrl 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| DataShareHelper | 位于首页 | 1、点击 DataShareHelper<br/>2、点击页面中各个按钮 | 1、进入 DataShareHelper 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| Window | 位于首页 | 1、点击 Window<br/>2、点击页面中各个按钮 | 1、进入 Window 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |
| FormExtContext | 位于首页 | 1、点击 FormExtContext<br/>2、点击页面中按钮 | 1、进入 FormExtContext 页面<br/>2、功能正常执行，提示正常 | 否 | Pass |



