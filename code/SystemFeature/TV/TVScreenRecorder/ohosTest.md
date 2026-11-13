# TVScreenRecorder 测试说明

> 本说明面向 `TVScreenRecorder`（OpenHarmony 智慧屏 / TV 录屏示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVScreenRecorder` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `shared/RecordingDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、单次操作硬超时（`withUiTimeout`）、非阻塞延时（`serializedDelay`）、按键注入（`triggerSerializedKey`、`pressAndWait`）、文本与组件轮询（`checkTextContent`、`checkAnyTextContent`、`componentCount`）、焦点探测（`checkFocusState`、`getCurrentFocusIndex`）、悬浮窗探针（`waitForTimerWindowStable`、`waitForTipWindowStable`）、录屏文件命名校验（`formatTimerLabel`、`buildRecordingFileName`、`isValidRecordingFileName`）以及 `StopCombinationGate`、遥控器键值与时延容差常量
- 夹具层：`srmanager/SRManagerHarness.ets` 模拟录屏启停轮次、媒体库建资产、fd 分配与状态回调；`window/WindowHarness.ets` 模拟窗口创建/显示/隐藏/销毁/移动/缩放/加载与异常注入；`service/ServiceSceneHarness.ets` 提供双击检测与组合键门控；`performance/PerformanceSceneHarness.ets` 记录启动、停止、焦点时延；`contract/ContractSecurityHarness.ets` 提供状态契约与输入清洗；`ui/AccessibilityLayoutHarness.ets` 提供无障碍树、布局与联合状态记录
- 基础层：`foundation/TestTypes.ets`、`MockFactories.ets`、`TestDataBuilder.ets`、`TestAsserts.ets`、`FoundationAdvancedFixtures.ets` 提供确定性数据、桩对象、断言与内存存储，隔离系统依赖
- 领域层：围绕录屏状态机（`Idle/Recording/Stopped/Error`）、文件命名 `REC_yyyyMMdd_HHmmss.mp4`、`fd://` 输出、媒体库 `SCREENSHOT` 子类型、窗口复用与释放、尺寸换算 `sizeCalc`、分辨率上限（3840×2160）、计时格式 `HH:mm:ss`、停止组合键门控等纯逻辑展开确定性测试
- 场景层：模拟服务拉起与停止命令（`startId=1` 启动，其余停止）、计时悬浮窗渲染、结束提示窗 3 秒生命周期、异常 2 秒退出、权限与启动流、最近任务与状态栏投影、分辨率与旋转变化等真实录屏场景
- 质量层：补充性能时延、长稳与压力、混沌与故障恢复、安全与契约、无障碍与布局、中英文资源、设备兼容等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 以显式 import 与统一调用登记 16 个分组、130 个套件，新增或删除套件会在编译期暴露缺失导入，覆盖度可在不跑真机的情况下审计
- 统一驱动能力：所有 UI 套件复用 `RecordingDriver` 的文本轮询、窗口探针与按键模拟，避免各套件重复实现 UiTest 细节
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 硬超时保护：单次 UI 操作以 `UI_OPERATION_TIMEOUT_MS = 3000` 为上限，平台调用卡死时只失败当前动作，不会冻结整轮测试
- 延迟让出主线程：`serializedDelay` 使用异步延时而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze
- 服务不自动拉起：`ENABLE_SERVICE_AUTOSTART` 默认关闭，避免无前台窗口的 ServiceExtension 在部分 TV 上阻塞 delegator；用例以当前屏幕上的窗口文本作为探针
- 稳定文本锚点：`TIMER_TEXT_HINT`、`TIMER_TEXT_ERROR`、`TIP_TEXT_TITLE`、`TIP_TEXT_CONTENT`、`RESOLUTION_TEXT_TITLE`、`RESOLUTION_TEXT_CONTENT` 统一收敛到驱动常量，文案变更只改一处
- 容差与轮次常量：`TOLERANCE_COMPONENT_COUNT`、`STABLE_ROUNDS`、`STRESS_ROUNDS_NAVIGATION = 20`、`STRESS_ROUNDS_LIFECYCLE = 10` 等参数集中管理，便于按设备调优

通过复用驱动工具、夹具与常量，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 状态矩阵：`Idle/Recording/Stopped/Error` × 启动/停止/查询/回调，校验非法状态下启动与停止均被守卫拦截
- 按键矩阵：菜单键 2018、音量减 17、方向键 2012~2015、ENTER 2049、BACK 2、HOME 3、POWER 26 的按下/抬起、单键长按、双键先后与同时按下组合
- 窗口矩阵：计时窗与提示窗 × 创建/复用/移动/缩放/显示/隐藏/销毁 × 创建失败、加载失败、显示失败注入
- 分辨率与旋转矩阵：1920×1080 基线、3840×2160 上限、非法宽高、0/90/180/270 旋转、内容缩放
- 故障注入矩阵：启动/停止返回非 0、建资产失败、fd 打开失败、状态回调缺失、回调乱序
- 设备与兼容矩阵：rk3568 / TV 大屏 × 输入方式 × 特性门禁 × API 12 运行环境
- 语言与资源矩阵：base / zh_CN / en_US × 资源名/类型/回退 × 缺失资源
- 时长与压力矩阵：20 轮导航压力、10 轮生命周期压力、长跑混合动作回放
- 权限矩阵：屏幕采集、悬浮窗、媒体库读写、麦克风 × 授予/拒绝/撤销

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 服务入口（`ServiceExtAbility/ScreenRecorderAbility.ets`：`onCreate` 初始化 `SRManager`/`WindowManager`、写入 `LocalStorage` 的 `recorderState` 与 `SRAbilityContext`、`onRequest` 按 `startId` 分发启停、`onDestroy` 释放窗口）
- 录屏核心（`common/SRManager.ets`：单例、`REC_yyyyMMdd_HHmmss.mp4` 命名、媒体库 `SCREENSHOT` 建资产、`fd://` 输出、`startRecording`/`stopRecording`/`getRecorderState`/`onStateChange`）
- 原生采集（`cpp/napi_init.cpp`：`OH_AVScreenCapture` 采集主屏，1920×1080、H.264、30fps、2Mbps，AAC-LC 48kHz 双声道，麦克风 + 全部播放声，MP4 容器，3840×2160 分辨率上限）
- 窗口管理（`common/WindowManager.ets`：`TYPE_FLOAT` 悬浮窗、移动/缩放、不可获焦、透明背景、`loadContent`/`setUIContent`、提示窗按屏幕宽度居中、同名窗口复用、`release` 统一销毁）
- 输入消费（`common/InputConsumer.ets`：菜单键与音量减键按下/抬起订阅，双键同时按下且门控开启时触发一次回调，任一键抬起后重新开放）
- 计时悬浮窗（`pages/ScreenRecorderTimer.ets`：`LocalStorageProp` 状态同步、800ms 红点闪烁、`TextTimer` HH:mm:ss、提示与错误文案跑马灯）
- 结束提示页（`pages/ScreenRecorderDialog.ets`：`luping` 图标、`录屏` 标题、`录屏视频已存储到"照片"` 文案）
- 分辨率提示页（`pages/ResolutionNotSupportedDialog.ets`：`暂不支持`、`当前设备分辨率过高，请降低分辨率`）
- 尺寸换算（`utils/SizeCalc.ets`：按设备实际宽度与 1920 设计宽度等比缩放）
- 资源与配置（`resources/base|zh_CN|en_US`、`media/luping`、`main_pages.json`、`module.json5` 权限与 ServiceExtension 声明）
- 应用集成（`Ability.test.ets`：`ohos.samples.screenrecorder` 包元数据、扩展导出、权限声明完整性）

### 3.2 关键风险点

围绕 TV 大屏录屏场景，重点识别如下风险：

- 服务无前台页面，delegator 拉起 ServiceExtension 在部分 TV 上阻塞，导致用例挂死
- 服务被系统回收或 2s/3s 定时器未走完，造成悬浮窗残留、提示窗未隐藏或文件未收敛
- 原生状态回调丢失、乱序或重复，导致 `Idle/Recording/Stopped/Error` 抖动
- 媒体库建资产或 `openSync` 失败，产生空文件、无 fd 或错误状态
- 计时窗重复创建、未释放、抢占焦点或背景不透明遮挡前台内容
- 停止组合键误触发、连击重复触发，或单键按住导致重复停止
- `sizeCalc` 依赖默认屏幕，旋转或分辨率变化后窗口位置与尺寸错位
- 非法分辨率参数未被拦截，或超过 3840×2160 导致初始化失败
- 屏幕采集、悬浮窗、媒体库、麦克风权限缺失导致启动失败
- 来电、其他录屏、麦克风被占用等中断未进入 Error 并给出提示
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S` 或 AppFreeze
- 日志或产物泄露文件路径、设备信息等敏感内容

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"窗口能看到"，而是拆成可验证的细粒度行为：

- 模块安装正常，bundleName 为 `ohos.samples.screenrecorder`，versionCode/versionName 有效
- `ScreenRecorderAbility` 已声明并导出，权限声明覆盖采集、悬浮窗、媒体库与麦克风
- `onCreate` 只初始化一次，`recorderState` 与 `SRAbilityContext` 正确写入存储
- `onRequest` 在 `startId=1` 时启动录屏，其余取值执行停止；非 `Idle`/非 `Recording` 时请求被守卫拦截
- 录制文件按 `REC_yyyyMMdd_HHmmss.mp4` 生成，输出 URL 为 `fd://<fd>`，容器为 MP4
- 计时悬浮窗位置 96,48、尺寸 624×56（按 1920 设计宽度缩放），不可获焦、透明背景
- 计时文本按 `HH:mm:ss` 从 00:00:00 递增，红点以 800ms 周期闪烁，停止或异常后恢复常显
- 彩蛋提示文案「同时按下菜单键与音量减键，即可结束录屏」正常展示且超长时跑马灯
- 停止流程为隐藏计时窗 → `stopRecording` → 提示窗停留 3000ms → 服务退出
- 提示窗展示「录屏」「录屏视频已存储到"照片"」，按屏幕宽度水平居中
- 异常流程显示「未知错误,录制停止」，2000ms 后服务自动退出
- 同名窗口复用，不重复创建；`onDestroy` 后窗口与 Map 清空
- 分辨率上限 3840×2160，非法宽高（≤0、超限）不生效
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 原生 `startRecording`/`stopRecording` 返回非 0
- 媒体库 `createAsset` 失败、`getAssets` 失败、`openSync` 返回无效 fd
- `onStateChange` 注册失败、状态回调缺失、重复回调与乱序回调
- 窗口创建失败、内容加载失败、显示/隐藏失败、移动/缩放失败
- 非法按键码、越界坐标、超屏坐标注入
- 快速连续按键、交替按键、重复点击后的状态一致性
- 录制中断（来电、其他录屏、麦克风不可用）后的状态收敛
- 服务销毁后再次拉起、冷启动旧状态污染与持久化隔离

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前状态是否回到有效基线（`Idle` 或 `Error` 可终止）
- 悬浮窗是否已隐藏或销毁，是否残留同名窗口
- 计时是否暂停、红点是否停止闪烁
- 媒体库是否只新增有效文件，失败时是否产生空资产
- 提示窗是否在约定时长后隐藏并触发服务退出回调
- 再次拉起时是否复用初始化路径而不携带旧状态

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续触发录屏、反复按键、快速开关窗口，因此需要覆盖：

- 高频菜单键与音量减键组合（`InputShortcutDeep`、`RecorderInputInteraction`）
- 连续启动/停止请求与服务重复拉起（`SRManagerConcurrency`、`ScreenRecorderDialogConcurrency`）
- 计时窗与提示窗并发创建/隐藏（`WindowPopupConcurrencyStress`）
- 状态回调与服务生命周期并发（`AbilityLifecycleConcurrencyDeep`、`RecordingOrchestrationDeepFlow`）
- 长链路混合动作回放（`LongRunMixedStress`、`LongTermStability`）
- 长链路执行期间的主线程让出（`serializedDelay`、`withUiTimeout`）
- 内存泄漏与资源释放（`MemoryLeakDetection`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录启动、停止、焦点切换等多类时延（`StartupPerformanceHarness`），并以平均值与上界双维度断言
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，避免单次抖动被平均值掩盖
- 校验计时动画帧率、窗口渲染耗时与长跑内存水位、泄漏斜率
- 覆盖功耗与温控降级场景（`RecorderPowerConsumption`）
- 在分辨率变化、旋转、内容缩放、深浅色主题、中英文资源下重复执行
- 覆盖 rk3568 与 TV 大屏的设备差异与特性门禁

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 状态契约（`ContractStateConsistency`、`DataContractDriftMatrix`）：状态编码、键名、取值范围与快照一致性
- 持久化隔离（`PersistenceIsolationRegression`、`ColdStartPollutionIsolation`）：冷启动旧状态不得污染当前会话
- 灰度与版本（`GrayReleaseContractCanary`、`RecorderAppVersion`）：版本元数据与契约兼容门禁
- 输入清洗与边界（`InputValidation`、`BoundaryErrorTesting`）：控制字符、非法键值、越界参数
- 权限与审计（`RecorderSecurity`、`SecurityValidation`、`RecorderAuthSession`）：授权矩阵、会话状态与敏感访问
- 安全边界（`SecurityBoundaryDefense`、`SecurityAccessibility`）：越权调用、路径穿越、日志脱敏
- 通知与离线（`RecorderNotification`、`RecorderOfflineNetwork`、`NetworkConnectivity`）：通知展示、离线与网络异常

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`AccessibilityTreeIntegrity`、`SecurityAccessibility`）
- 文本可读性与跑马灯（`AccessibilityTextReadability`）
- 焦点高亮与焦点环（`FocusRingBehavior`、`FocusNavigationAndRenderMatrix`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 提示窗定位与布局边界（`DialogPositioning`、`DesktopLayoutBoundaryRegression`）
- 内容缩放与主题对比度（`ContentScaling`、`ThemeVariation`、`VisualEffects`）
- 最近任务与状态栏联动（`UIRecentTaskComposite`、`RecentStatusBarJointRegression`、`WindowStatusBarLinkage`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断 TV 大屏录屏应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到夹具层、基础层、领域层、场景层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、安全、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、故障注入、混沌回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验窗口是否存在，还校验状态码、fd、文件名、回调次数、窗口事件序列、焦点索引、组件数量、文本可读性与时延上界
- 资产可审计：`List.test.ets` 按 16 个分组登记 130 个套件，套件缺失或重复会在编译期与运行期暴露
- 测试资产可复用：`RecordingDriver`、`SRManagerHarness`、`WindowHarness`、`ServiceSceneHarness` 等夹具便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 130 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `shared/RecordingDriver.ets`：串行 UI 队列、硬超时、文本/组件轮询、窗口探针、遥控与触摸模拟、键值与时延容差、文件名与计时格式工具 |
| 冒烟与服务能力 `ability` | 7 | `AbilityTest`、`AbilityLifecycle`、`AbilityLifecycleConcurrencyDeep`、`AbilityRecentStatusProjection`、`AbilityRecoveryRecentStress`、`RecordingOrchestration`、`RecordingOrchestrationDeepFlow`：包与权限冒烟、服务生命周期、并发拉起、Recent 投影、恢复压力、录屏编排 |
| 录屏核心 `srmanager` | 8 | `SRManagerDomain`、`SRManagerStateMatrixDeep`、`SRManagerConcurrency`、`SRManagerDataConsistency`、`SRManagerFaultAndRecovery`、`SRManagerPersistenceLifecycle`、`SRManagerChaos`、`SRManagerCompatibilityStress`：状态矩阵、并发启停、数据一致性、故障恢复、持久化、混沌与兼容压测 |
| 契约与持久化 `contract` | 6 | `ContractStateConsistency`、`DataContractDriftMatrix`、`GrayReleaseContractCanary`、`PersistenceIsolationRegression`、`ColdStartPollutionIsolation`、`SecurityBoundaryDefense`：状态契约、数据漂移、灰度门禁、持久化隔离、冷启动污染、安全边界 |
| 基础夹具与 Mock `foundation` | 8 | `TestTypes`/`TestAsserts`/`TestDataBuilder`/`MockFactories` 及其深度用例、`FoundationAdvancedFixtures`、`FoundationRegressionMatrix`、`FoundationStressCanary`：类型、断言、数据构造、桩工厂、夹具回归与压力金丝雀 |
| 集成与场景 `integration` | 9 | `UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`RecorderCompatibility`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity`：用户场景、系统集成、综合回归、兼容、本地化与网络 |
| 录屏对话框领域 `recorderdialog` | 16 | `ScreenRecorderDialogUI`、`ScreenRecorderDialogLifecycle`、`ScreenRecorderDialogStateManagement`、`ScreenRecorderDialogConcurrency`、`ScreenRecorderDialogConsistency`、`ScreenRecorderDialogErrorRecovery`、`ScreenRecorderDialogStress`、`ScreenRecorderEndToEnd`、`RecordingOperations`、`RecordingOperationFlow`、`RecordingOperationWorkflow`、`RecordingOperationCatalog`、`RecordingModelDeep`、`RecorderInputInteraction`、`RecorderItemInfoModel`、`RecorderMenuConfiguration`：窗口 UI、生命周期、状态、并发、一致性、错误恢复、端到端与操作流 |
| 录屏校验域 `recordervalidation` | 8 | `RecordingSessionValidation`、`RecordingDataSourceValidation`、`SRManagerEventToolValidation`、`RecorderInterruptionRecovery`、`RecorderAuthSession`、`RecorderNotification`、`RecorderOfflineNetwork`、`RecorderAppVersion`：会话、数据源、事件工具、中断恢复、授权会话、通知、离线与版本 |
| 交互与可达性 `interaction` | 14 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`DataBinding`、`DialogPositioning`、`AccessibilityNavigation`、`ThemeVariation`、`VisualEffects`、`ContentScaling`、`UIComponentRendering` |
| 生命周期与状态 `lifecyclestate` | 10 | `ExtensionLifecycle`、`DialogLifecycle`、`DialogStateManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`、`ErrorRecovery`、`ExceptionHandling`、`ResourceManagement`、`ConfigurationChanges` |
| 窗口与悬浮窗 `window` | 5 | `FloatWindowScene`、`WindowManagerDomain`、`WindowCompatibilityMatrixDeep`、`WindowPopupConcurrencyStress`、`WindowStatusBarLinkage`：浮窗场景、窗口领域、兼容矩阵、并发压测、状态栏联动 |
| 服务命令与快捷键 `service` | 2 | `AbilityCommandFlow`、`InputShortcutDeep`：`startId` 启停命令流、菜单键+音量减组合门控与重复触发 |
| 性能基线 `performance` | 5 | `StartupLatencyMatrix`、`PerformanceCanaryAndExtremeSweep`、`ResolutionRotationExtreme`、`LongRunMixedStress`、`ExceptionRecoveryJointRegression`：启动时延矩阵、极端参数扫描、分辨率旋转、长跑混合、异常恢复联合回归 |
| 性能与长稳 `performancestability` | 7 | `RecorderPerformance`、`RecorderPerformanceStress`、`TimerAnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`RecorderPowerConsumption`：录屏性能、计时动画、并发控制、长稳、内存泄漏、功耗 |
| 安全 `security` | 3 | `RecorderSecurity`、`SecurityValidation`、`SecurityAccessibility`：录屏安全、校验与安全可达性 |
| UI 与无障碍 `ui` | 11 | `UITimerProjectionDeep`、`UIHomeInteractionMatrix`、`UIPermissionAndLaunchFlow`、`UIDialogPresentationMatrix`、`UIEditShortcutRegression`、`UIRecentTaskComposite`、`FocusNavigationAndRenderMatrix`、`DesktopLayoutBoundaryRegression`、`AccessibilityTreeIntegrity`、`AccessibilityTextReadability`、`RecentStatusBarJointRegression` |
| 通用校验 `validation` | 11 | `KeyCodeValidation`、`InputValidation`、`BoundaryErrorTesting`、`FocusManagerValidation`、`DialogStateManagerValidation`、`AnimationControllerValidation`、`ConfigurationManagerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`、`CommonEventUtilValidation`、`LoggerValidation` |

## 7. 结论

`TVScreenRecorder` 当前测试设计已经形成"共享驱动 + 夹具隔离 + 领域校验 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 录屏应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起录屏服务 | 1. 需在真机测试 <br/> 2. 构建并安装测试 HAP <br/> 3. 设备已正常启动且权限已配置 | 通过 `startAbility` 以 `startId=1` 拉起 `ScreenRecorderAbility` | 服务启动成功，屏幕左上角出现计时悬浮窗 | 否 | Pass |
| 录制视频 | 1. 需在真机测试 <br/> 2. 录屏服务已拉起 <br/> 3. 权限授权完成 | 开始录屏后在桌面与应用间切换操作 | 悬浮窗显示 `HH:mm:ss` 递增与红点闪烁，媒体库生成 `REC_*.mp4` | 否 | Pass |
| 快捷键结束录制 | 1. 需在真机测试 <br/> 2. 正在录制 | 同时按下菜单键与音量减键 | 计时悬浮窗消失，结束提示窗出现，3 秒后服务退出 | 否 | Pass |
| 结束录制与文件校验 | 1. 需在真机测试 <br/> 2. 正在录制 | 触发停止录屏 | 提示「录屏视频已存储到"照片"」，媒体库视频数量增加一个且可播放 | 否 | Pass |
| 异常提示 | 1. 需在真机测试 <br/> 2. 正在录制 | 模拟来电、其他录屏或麦克风占用中断 | 悬浮窗显示「未知错误,录制停止」，2 秒后服务自动退出 | 否 | Pass |
| 分辨率提示 | 1. 需在真机测试 <br/> 2. 设备分辨率超出支持范围 | 触发录屏 | 展示「暂不支持」「当前设备分辨率过高，请降低分辨率」 | 否 | Pass |
