# ScreenShot 测试说明

> 本说明面向 `TVScreenshot`（OpenHarmony 智慧屏 / TV 截屏示例工程）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVScreenshot` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、驱动单例（`getDriver`/`resetDriver`）、服务拉起（`launchCaptureService`/`triggerCapture`）、组件与文本轮询（`findComponentsBySelector`、`checkComponentExists`、`checkTextContent`、`previewComponentCount`、`waitForPreviewStable`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、遥控按键与触摸模拟（`pressAndWait`、`triggerSerializedKey`、`simulateTouch`）以及 `waitForComponentCountStable`
- 测试工具层：以 `Shared/ScreenshotTestKit.ets` 为核心，提供截屏状态机 `CaptureHarness`（`idle→captured→previewed→saved→dismissed→terminated` 严格转换表）、采样统计 `Metrics`（avg/max/min/percentile）、`delayMs`、`measure`、`expectNoThrow`、`resetCaptureSessionStorage`/`resetViewModelState`/`resetExtensionState` 状态重置、`captureFileName` 与 `previewRect` 命名与几何计算、`isValidCaptureName` 文件名校验
- 领域层：围绕截屏模型（`ScreenShotModel`：`shotScreen`/`saveImage`/`showWindow`/`dismiss`/`openAbility`）、窗口视图模型（`ViewModel.popupSaveTip`/`CloseShotScreen`）、尺寸换算（`sizeCalc`）、存储键（`captureImage`/`imageFilename`/`imageUri`/`saveTipStr`/`context`）、常量与提示文案等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟系统截屏入口拉起、悬浮预览窗创建与定位、1600ms 后自动关闭、保存提示窗展示、写媒体库并退出扩展等真实 TV 截屏场景
- 质量层：补充性能时延、压力与长稳、异常与中断恢复、无障碍、多语言与资源、内容缩放与设备兼容、安全与权限契约等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 作为唯一入口统一注册 97 个套件（79 个结构化套件 + 18 个 legacy 扁平套件），先结构化后 legacy 的执行顺序固定，保证覆盖度可在不跑真机的情况下审计
- 统一驱动能力：所有 UI 套件复用 `SharedDriver` 的服务拉起、组件轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 按需拉起而非重复拉起：`triggerCapture` 先判断预览是否已可见，仅在未可见时才 `startAbility` 拉起 `com.ohos.screenshot.ServiceExtAbility`，避免长链路执行时堆叠 ability 实例导致测试进程被杀
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 Promise 链串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程节流：`delayMs`/`serializedDelay` 使用 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 组件计数避坑：`previewComponentCount` 在 `ON.type('*')` 查询失败时回退 `Image`/`Text` 具名类型统计，避免部分 TV 版本不支持通配查询导致的空结果与全量无障碍树转储开销
- 状态机校验：`CaptureHarness` 用显式转换表替代散落的布尔断言，非法跳转会被记录为 `rejected`，使状态类用例的期望值可读、可审计
- 统一前置与清理：每个套件通过 `resetCaptureSessionStorage`/`resetViewModelState`/`resetExtensionState` 恢复 `AppStorage` 基线，避免用例间状态串扰

通过复用驱动工具、状态机与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`core` 1、`integration` 9、`interaction` 14、`lifecycle` 10、`performance` 7、`screenshot` 16、`screenshot-validation` 8、`security` 3、`validation` 11，另加 legacy 扁平 18，共 97 个套件
- 存储键矩阵（`Capture*` 系列：`captureImage`、`imageFilename`、`imageUri`、`saveTipStr` 的写入、覆盖、清空与缺失读取）
- 文件名矩阵（`captureFileName`/`isValidCaptureName`：`Screenshot_` 前缀 × 数字时间戳 × `.jpg`/`.jpeg` 后缀 × 非法后缀与前缀）
- 窗口几何矩阵（`previewRect`/`PreviewPositioning`：设计宽 1920 基准 × 实际屏宽比例 × 预览矩形 `96/570/750/421`；提示窗矩形 `46/686/100`）
- 按键矩阵（`KeyCodeValidation`、`CaptureInputInteraction`：方向上/下/左/右、ENTER、BACK、HOME、POWER 的合法/非法组合）
- 状态转换矩阵（`CaptureHarness`：8 条合法转换 × 非法跨阶段跳转 × 重置后回 `idle`）
- 权限矩阵（`SecurityValidation`/`ScreenshotSecurity`：`CAPTURE_SCREEN`、`CUSTOM_SCREEN_CAPTURE`、`WRITE_IMAGEVIDEO`、`SYSTEM_FLOAT_WINDOW` 的声明、授予/拒绝路径）
- 设备与兼容矩阵（`DeviceCompatibility`、`ScreenshotCompatibility`、`CompatibilityMatrixCatalogA/B/C`：rk3568/大屏 × 分辨率 × 输入方式 × 特性门禁）
- 资源 × 语言矩阵（`LocalizationTesting`、`ResourceLoaderValidation`、`I18nDeep`：base/zh_CN/en_US 与资源名/类型/缓存回退）
- 离线与中断矩阵（`CaptureOfflineNetwork`、`CaptureInterruptionRecovery`：离线状态 × 重试次数 × 中断点 × 恢复后状态一致性）
- 性能与功耗矩阵（`CapturePerformance`、`AnimationPerformance`、`PowerConsumption`：截图轮次 × 采样分位数 × CPU/内存水位 × 功耗状态）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 系统截屏入口（`product/TV/src/main/module.json5`：`extensionAbility` 声明 action `com.ohos.systemui.action.TOGGLE`、权限 `ohos.permission.CAPTURE_SCREEN`、metadata `pluginType:1` 与 `clickAction` 路由）
- 扩展能力承载（`serviceExtAbility/ServiceExtAbility.ets`：`onCreate` 写 `AppStorage('context')`、`window.createWindow(TYPE_FLOAT)`、`moveWindowTo(sizeCalc(96), sizeCalc(570))`、`resize(sizeCalc(750), sizeCalc(421))`、`setWindowFocusable(false)`、`setUIContent('pages/Index')`、触发 `shotScreen()`；`onRequest` 对 `startId > 1` 提示"当前操作频繁，请稍后再试"）
- 截屏模型（`features/screenshot_tv/.../ScreenShotModel.ets`：`screenshot.capture()` → 写 `captureImage` → `showWindow()` → 保存提示；`image.createImagePacker().packing()` → `photoAccessHelper.createAsset()` → `fileIo.open/write/fsync/close` 写媒体库；`openAbility` 路由外部应用）
- 预览页（`pages/Index.ets`：`@StorageLink('captureImage')` 渲染缩略图、`borderRadius(sizeCalc(32))`、`aboutToAppear` 中 `setTimeout(CloseShotScreen, Constants.interval=1600)`）
- 保存提示窗（`vm/ViewModel.ets`：`popupSaveTip` 建 TYPE_FLOAT 窗、`moveWindowTo((display.width - rectW)/2, rectY)`、`resize`、`setWindowFocusable(false)`、`setUIContent('pages/TipPage')`、`setTimeout(2000)` 内调用 `saveImage()`、等 200ms `destroyWindow`、400ms 后回调 `terminateSelf`）
- 提示页（`pages/TipPage.ets`：`@StorageProp('saveTipStr')` 渲染提示文案、`app.media.jietu` 图标、"截屏"标题与分隔线）
- 尺寸换算（`common/SizeCalc.ets`：`dftDisplay.width / 1920 * n`）
- 常量与配置（`Constants.WIN_NAME='ScreenShotWindow'`、`interval=1600`、`FULL_CONTAINER_WIDTH/HEIGHT`、`main_pages.json`、`module.json5` 权限清单）
- 媒体与存储（照片访问助手、JPEG quality 100 打包、URI 写入与 `fsync`、`fs.close` 释放）

### 3.2 关键风险点

围绕 TV 大屏截屏场景，重点识别如下风险：

- 系统入口未注册或 `clickAction` 路由错误，导致截屏动作无响应
- `TYPE_FLOAT` 悬浮窗创建失败、定位/尺寸未按 1920 设计宽等比缩放，导致预览错位或超出屏幕
- 悬浮窗抢占焦点，影响用户原有操作与遥控焦点链路
- `screenshot.capture()` 异常未兜底，界面无反馈或直接崩溃
- 截图数据写入 `AppStorage` 与预览页订阅时序不一致，导致预览空白
- 预览自动关闭时长（1600ms）与保存提示时长（2000ms）被误改，出现闪烁、提前消失或无法退出
- 保存失败（无 context、无权限、媒体库写入失败、`packing` 失败）时提示不准确或资源未释放
- 文件句柄未在 `finally` 中关闭，长跑下句柄泄漏
- 重复触发截屏（`startId > 1`）未拦截，产生多窗口叠加或重复保存
- 文件名时间戳重复、后缀非法，导致媒体库资源覆盖或不可识别
- 扩展 `terminateSelf` 未执行，悬浮窗与扩展进程残留
- 权限（`CAPTURE_SCREEN`、`CUSTOM_SCREEN_CAPTURE`、`SYSTEM_FLOAT_WINDOW`、`WRITE_IMAGEVIDEO`）缺失或被拒后的降级行为不明确
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 截屏链路端到端：入口拉起 → 悬浮预览窗出现 → 缩略图渲染 → 自动关闭 → 保存提示 → 退出扩展
- `shotScreen()` 正确产出 `PixelMap` 并写入 `AppStorage('captureImage')`，重复调用幂等
- `showWindow()`/`dismiss()` 通过 `window.findWindow('ScreenShotWindow')` 正确显隐
- `saveImage()` 生成 `Screenshot_<timestamp>.jpg`、JPEG 打包质量、媒体库资源创建与 URI 写入
- 预览页 `@StorageLink` 数据绑定生效，缩略图数量与圆角尺寸正确
- 提示页 `@StorageProp('saveTipStr')` 文案完整展示，图标、标题、分隔线成对出现
- 窗口几何按 1920 设计宽等比换算（预览 `96/570/750/421`、提示 `46/686/100`）
- `openAbility` 按 Want（`bundleName`/`abilityName`）正确路由
- 频繁触发（`startId > 1`）走"当前操作频繁，请稍后再试"分支
- 返回栈语义、前后台切换、窗口显示与销毁
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- `screenshot.capture()` 抛错、返回空数据、返回异常尺寸
- `AppStorage` 缺失 `context`、缺失 `captureImage`、写入被覆盖或清空
- 媒体库无权限、`createAsset` 失败、`fileIo.write`/`fsync` 失败
- `window.findWindow` 未找到窗口、`createWindow` 失败、`resize` 越界
- 非法路由 Want（空 `bundleName`、不存在的 `abilityName`）
- 非法按键码、越界坐标、超屏坐标注入
- 快速连续触发、交替截屏与关闭后的状态一致性
- 会话中断（预览未关闭即重复拉起）后的恢复
- 前后台切换、状态恢复与 `AppStorage` 基线恢复

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（悬浮窗不抢焦点、原应用焦点不丢失）
- 窗口是否回到稳定基线（`findWindow` 返回预期结果，无残留窗口）
- 状态机是否回到 `idle`，`CaptureHarness` 的 `rejected` 是否为空
- 文件句柄是否已关闭、媒体库是否无半写入资源
- 扩展是否已 `terminateSelf`，无残留进程

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续触发截屏、反复开关预览、快速按键，因此需要覆盖：

- 高频截屏触发与预览反复显隐（`CaptureConcurrency`、`CaptureStress`）
- 连续会话创建与销毁（`SessionManagement`、`PreviewLifecycle`）
- 保存与关闭并发、提示窗与预览窗并存（`ConcurrencyControl`）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）
- 长链路执行期间的主线程让出（`delayMs`、`serializedDelay`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录截屏耗时、预览渲染、保存写入、焦点切换等多类时延，预算常量集中在测试侧（预览渲染 1000ms、截屏周期 2000ms、会话创建 1000ms、焦点切换 500ms、稳定容差 3 次轮询）
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值（`Metrics.percentile`），避免单次抖动被平均值掩盖
- 校验 `SizeCalcValidation` 中等比例换算在 1000 次循环内的耗时上界
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖 rk3568 与 TV 大屏的设备差异与特性门禁

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入清洗与校验（`InputValidation`：文件名、时间戳、Want 参数、提示文案）
- 敏感信息与隐私（`ScreenshotSecurity`、`SecurityAccessibility`：截屏数据不落日志、提示文案不含路径）
- 权限与门禁（`SecurityValidation`：`CAPTURE_SCREEN`、`CUSTOM_SCREEN_CAPTURE`、`WRITE_IMAGEVIDEO`、`SYSTEM_FLOAT_WINDOW` 声明与授予矩阵）
- 包与配置契约（`CaptureConfiguration`、`DisplayConfigurationValidation`、`module.json5` 的 `mainElement`、extension action、metadata）
- 存储契约（`CaptureDataSourceValidation`：`AppStorage` 键名、类型、生命周期一致性）
- 资源契约（`ResourceLoaderValidation`：`app.media.jietu`、提示资源、`main_pages.json` 页面登记）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`、`AccessibilityDeep`）
- 焦点高亮与非抢焦点行为（`FocusRingBehavior`、`FocusNavigation`、`FocusManagerValidation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 遥控按键与输入交互（`KeyCodeValidation`、`CaptureInputInteraction`）
- 内容缩放、布局测量与预览定位（`ContentScaling`、`PreviewPositioning`、`UIComponentRendering`）
- 主题与对比度（`ThemeVariation`、`VisualEffects`、`WindowAnimationValidation`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`、`I18nDeep`）

这部分是判断 TV 大屏截屏应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层、测试工具层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混沌回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验窗口几何、状态机阶段、组件数量、提示文案、文件名合法性与时延上界
- 状态可审计：`CaptureHarness` 的转换表与 `rejected` 记录使状态类用例的期望值可读、可审计
- 测试资产可复用：`SharedDriver`、`ScreenshotTestKit` 与统一重置前置便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `product/TV/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 97 个套件（79 个结构化 + 18 个 legacy 扁平），按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 2 | `Shared/SharedDriver.ets`：串行 UI 队列、驱动单例、服务拉起、组件/文本/焦点轮询、遥控与触摸模拟；`Shared/ScreenshotTestKit.ets`：截屏状态机、采样统计、状态重置、文件名与窗口几何工具 |
| 核心主流程 `core` | 1 | `Ability.test`：入口拉起、扩展能力与截屏主链路冒烟 |
| 集成与场景 `integration` | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`ScreenshotCompatibility`、`SystemIntegration`、`UserScenarios` |
| 交互与可达性 `interaction` | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`PreviewPositioning`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects` |
| 生命周期与状态 `lifecycle` | 10 | `ConfigurationChanges`、`PreviewLifecycle`、`PreviewStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycle`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery` |
| 性能与长稳 `performance` | 7 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`PowerConsumption`、`CapturePerformance` |
| 截屏专项 `screenshot` | 16 | `CaptureConcurrency`、`CaptureConsistency`、`CaptureEndToEnd`、`CaptureErrorRecovery`、`CaptureLifecycle`、`CaptureStateManagement`、`CaptureStress`、`CaptureUI`、`CaptureInputInteraction`、`CaptureItemInfoModel`、`CaptureConfiguration`、`CaptureModelDeep`、`CaptureOperationCatalog`、`CaptureOperationFlow`、`CaptureOperations`、`CaptureWorkflow`：截屏链路端到端、状态一致性、操作目录与流程编排 |
| 截屏校验 `screenshot-validation` | 8 | `CaptureAppVersion`、`CaptureAuthSession`、`CaptureDataSourceValidation`、`CaptureEventToolValidation`、`CaptureInterruptionRecovery`、`CaptureNotification`、`CaptureOfflineNetwork`、`CaptureSessionValidation`：版本与鉴权会话、数据源契约、事件工具、中断恢复、通知与离线场景 |
| 安全与合规 `security` | 3 | `ScreenshotSecurity`、`SecurityAccessibility`、`SecurityValidation`：截屏数据隐私、无障碍安全、权限与门禁 |
| 校验与契约 `validation` | 11 | `WindowAnimationValidation`、`BoundaryErrorTesting`、`SystemEventValidation`、`DisplayConfigurationValidation`、`PreviewStateValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`SizeCalcValidation`、`ResourceLoaderValidation` |
| 兼容回归 `legacy` | 18 | `AccessibilityDeep`、`Advanced`、`Chaos`、`CompatibilityMatrix`、`CompatibilityMatrixCatalogA/B/C`、`Concurrency`、`DataIntegrity`、`I18nDeep`、`IntegrationScene`、`MainPage`、`PerformanceDeep`、`Regression`、`ScreenShotModel`、`Security`、`ServiceExtAbility`、`ViewModel`：早期扁平套件，按对象（模型、视图模型、扩展、主页、权限）与质量属性（混沌、并发、性能、兼容）保留 |

## 7. 结论

`TVScreenshot` 当前测试设计已经形成"共享驱动 + 领域校验 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 截屏示例工程后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行 | - | 成功拉起应用 | 是 | Pass |
| 打开菜单 | 进入首页 | 点击右上角菜单图标 | 截屏菜单栏弹出 | 否 | Pass |
| 截屏 | 菜单栏正常弹出 | 点击"截屏"选项 | 屏幕中出现截屏后的缩略图弹窗 | 是 | Pass |
| 局部截图 | 菜单正常弹出 | 点击"局部截图"选项 | 弹出选择窗口并且右下角出现完成按钮，点击完成后界面上出现缩略图弹窗 | 否 | Pass |
| 隐私窗口模式 | 隐私窗口组件显示正常 | 打开隐私窗口开关 | 开关打开 | 否 | Pass |
| 隐私窗口下的截屏提示 | 进入隐私窗口模式 | 分别进行截屏、局部截屏 | 底部文本栏展示"隐私窗口不能截屏" | 否 | Pass |
