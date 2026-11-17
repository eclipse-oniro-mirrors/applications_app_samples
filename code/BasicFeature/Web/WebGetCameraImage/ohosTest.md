# WebGetCameraImage 测试说明

> 本说明面向 `WebGetCameraImage`（OpenHarmony Web 获取相机拍照图片示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档说明 `WebGetCameraImage` 自动化测试的设计原则、覆盖维度、目录职责与充分性依据。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计与后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面拉起与触发（`triggerCameraPage`、`launchCameraPageApp`）、页面就绪判定（`isCameraPageVisible`、`waitForCameraPageStable`、`waitForWebRender`）、页面文本采集（`getTextContents`、`checkTextContent`、`containsAnyText`、`describePageState`）、组件统计（`webCameraComponentCount`、`findComponentsByType`、`countImages`、`isWebComponentVisible`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、按键与触摸模拟（`pressAndWait`、`triggerSerializedKey`、`simulateTouch`）以及超时、容差、压力轮次常量
- 领域层：围绕 `camera.html` 页面契约、`onShowFileSelector` 文件选择回调、`cameraPicker.pick` 拍照、`copyFileToSandBox` 沙箱拷贝、`javaScriptProxy` 分享对象、时间戳文件名与 UTD 类型映射等纯逻辑展开确定性测试；系统依赖通过等价最小模型隔离
- 场景层：模拟 Web 页面加载、选择文件拉起原生相机、拍照结果回填、图片预览、分享面板、返回键与前后台切换等真实拍照链路
- 质量层：补充性能时延、压力长稳、并发控制、异常恢复、无障碍、中英文资源、内容缩放、设备兼容与安全校验等非功能维度

分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

- 集中式套件清单：`List.test.ets` 统一注册 9 个分组、80 个测试相关文件、共 1823 个用例，分组明细见第 6 节，便于在不跑真机的情况下审计覆盖度
- 统一驱动能力：所有 UI 套件复用 `SharedDriver` 的页面回归、文本轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 页面回归优先：页面探针优先复用当前 Web 实例，确需时才通过 `EntryAbility` 重新拉起，减少 ability 实例堆叠
- 串行化 UI 队列：单 UI 线程渲染，所有 UiTest 调用与延时进入 `_uiOperationQueue` 串行执行，消除焦点竞争与丢键
- 主线程让出：`serializedDelay` 使用异步延时而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 页面判定适配 Web：页面由 `Web` 组件承载 `camera.html`，HTML 文本不进入 ArkUI 文本树，`isCameraPageVisible` 优先以 `Web` 组件挂载作为就绪信号，再回退文本匹配，避免误判页面未显示
- 连接容错：`getDriver` 对 UiTest/AAMS 连接占用做有限次重试；`pressAndWait`、`serializedDelay`、`triggerSerializedKey`、`simulateTouch` 对未初始化驱动做空操作保护，避免 `afterAll` 二次崩溃
- 屏幕常亮：`TestAbility.onWindowStageCreate` 调用 `setWindowKeepScreenOn(true)`，避免长时全量运行中途息屏导致拉起超时（00508013）

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分组矩阵：`WebCamera` 17、`Interaction` 14、`Validation` 11、`LifecycleState` 10、`Integration` 9、`CameraValidation` 8、`PerformanceStability` 7、`Security` 3、`Shared` 1
- 拍照链路矩阵：文件选择 → 相机拉起 → 拍照返回 → 沙箱拷贝 → 页面预览 → 分享
- 输入矩阵：方向键、ENTER、BACK、HOME 的合法/非法组合与触摸坐标
- 生命周期矩阵：前台/后台、配置变更、异常与恢复、状态持久化
- 性能矩阵：页面渲染、焦点切换、拍照、沙箱拷贝、分享等时延与压力轮次
- 兼容矩阵：分辨率、内容缩放、主题、中英文资源
- 安全矩阵：输入清洗、权限与访问控制、隐私信息与日志脱敏、无障碍

矩阵化设计降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground 生命周期）
- 页面装配（`entry/pages/Index.ets` → `webgetcameraimage` HAR 的 `WebGetCameraImageView`）
- Web 页面（`rawfile/camera.html`：`input[type=file][capture]`、`showPic()`、`sharePic()`、`img#image`、`p#image_preview`）
- 文件选择回调（`onShowFileSelector` → `FileResult` → `FileSelectorResult.handleFileList`）
- 相机拍照（`invokeCamera` → `cameraPicker.pick(PHOTO/VIDEO)` → `PickerResult.resultUri`）
- 沙箱拷贝（`copyFileToSandBox`：按时间戳生成 `filesDir/<ts>.jpg`，open/copy/close 并释放句柄）
- 分享能力（`javaScriptProxy` 暴露 `shareObject.share`，`systemShare.SharedData` 与 `ShareController.show`）
- 资源与配置（`resources/base|zh_CN|en_US`、`rawfile`、`main_pages.json`、`module.json5`）

### 3.2 关键风险点

围绕 Web 拉起相机拍照场景，重点识别如下风险：

- Web 组件未就绪即操作，导致选择文件入口点击无效
- 相机拉起失败、用户取消拍照或返回空 `resultUri`
- 文件选择结果未回填，页面预览为空或显示“未选择图片”
- 沙箱拷贝失败、目标路径非法或文件句柄未释放
- 未选择文件即分享、UTD 类型或 URI 构建异常
- 系统权限弹窗遮挡页面，造成探针假通过或长链路失败
- 焦点丢失、返回键与前后台切换后的状态残留
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 敏感路径、URI 或日志信息泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 应用启动至 Web 页面可交互，`Web` 组件与页面元素渲染完成
- 选择文件入口可拉起原生相机，拍照成功后返回有效 URI
- URI 通过 `handleFileList` 回填，`img#image` 显示图片、`image_preview` 提示更新
- 拍照文件写入沙箱（时间戳 `.jpg`），目标路径可读
- 分享按钮在无文件时给出提示，有文件时构建 `SharedData` 并拉起分享面板
- 返回键、前后台切换、页面重入后的状态一致性
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 取消拍照、空 URI、非法路径、越界坐标、非法按键码
- 相机不可用、权限被拒、分享取消
- 快速连续点击、重复选择文件、连续分享
- 页面重建、配置变更、进程恢复后的状态恢复
- 数据异常时的参数校验与错误分支

恢复类测试要求不仅校验返回值，还要求校验：

- 当前焦点是否回归有效位置
- 页面是否回到稳定基线（`Web` 组件存在、页面文本可读）
- 组件数量是否稳定，避免重复实例
- 预览区与分享入口状态是否与文件状态一致

这保证异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

Web 拍照场景下用户可能连续执行选择、返回、分享等动作，因此覆盖：

- 高频方向键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`）
- 连续页面进出与入口反复切换（`WebCameraLifecycle`、`WebCameraStateManagement`）
- 拍照与预览、分享与返回的并发（`WebCameraConcurrency`、`ConcurrencyControl`）
- 混合动作长链路回放（`LongTermStability`、`PerformanceStress`）
- 长链路执行期间的主线程让出（`serializedDelay`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计通过以下方式提升充分性：

- 记录页面渲染、焦点切换、拍照、沙箱拷贝、分享等多类时延，预算常量集中在 `SharedDriver`
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值，避免单次抖动被平均值掩盖
- 校验内存水位与泄漏斜率、长时间运行稳定性
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖不同设备形态与特性门禁（`CameraCompatibility`、`DeviceCompatibility`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入与参数校验（`InputValidation`、`BoundaryErrorTesting`）
- 权限与访问控制（`CameraSecurity`、`SecurityValidation`）
- 敏感信息与日志脱敏（`LoggerValidation`、`SecurityAccessibility`）
- 无障碍可读性（`AccessibilityNavigation`、`SecurityAccessibility`）
- 页面契约（`WebCameraCoreFeature`：`type=file`、`capture`、`accept=image/*`、`showPic`、`sharePic`、`shareObject.share`、`URL.createObjectURL`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 Web 拍照示例的操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusRingBehavior`、`FocusNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 内容缩放、布局测量与滚动边界（`ContentScaling`、`WebViewPositioning`）
- 主题与对比度（`ThemeVariation`、`VisualEffects`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断 Web 拍照示例可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域逻辑层、场景回归层与质量层都有对应测试
- 覆盖维度齐全：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、组合矩阵、压力回放、多采样统计、等价模型隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验组件数量、焦点索引、页面文本、状态一致性与时延上界
- 核心链路可验证：`WebCameraCoreFeature` 对本示例的 `onShowFileSelector`、`cameraPicker`、`copyFileToSandBox`、`shareObject.share` 与 `camera.html` 契约逐项断言
- 测试资产可复用：`SharedDriver` 的页面回归、串行队列与容错策略便于继续扩展而不破坏既有结构
- 环境鲁棒性：驱动连接重试、空驱动保护与屏幕常亮降低真机长跑失败率

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 9 个分组、80 个测试相关文件、共 1823 个用例：

| 分组 | 文件数 | 用例数 | 代表套件与职责 |
|---|---:|---:|---|
| 共享驱动 `Shared` | 1 | — | `SharedDriver`：串行 UI 队列、页面拉起与就绪判定、文本/组件采集、焦点检查、按键与触摸模拟、超时与容差常量、连接重试 |
| Web 相机 `WebCamera` | 17 | 434 | `WebCameraUI`、`WebCameraLifecycle`、`WebCameraStateManagement`、`WebCameraConcurrency`、`WebCameraConsistency`、`WebCameraEndToEnd`、`WebCameraErrorRecovery`、`WebCameraStress`、`WebCameraCoreFeature`、`CameraModelDeep`、`CameraOperations`、`CameraItemInfoModel`、`CameraMenuConfiguration`、`CameraOperationCatalog`、`CameraOperationFlow`、`CameraOperationWorkflow`、`CameraInputInteraction`：页面渲染、生命周期、并发、端到端、核心拍照/拷贝/分享链路 |
| 校验与契约 `Validation` | 11 | 354 | `KeyCodeValidation`、`LoggerValidation`、`PointerUtilValidation`、`FocusManagerValidation`、`ResourceLoaderValidation`、`CommonEventUtilValidation`、`AnimationControllerValidation`、`WebViewStateManagerValidation`、`ConfigurationManagerValidation`、`InputValidation`、`BoundaryErrorTesting`：输入校验、配置与资源、日志、边界异常 |
| 相机校验 `CameraValidation` | 8 | 282 | `CameraAppVersion`、`CameraAuthSession`、`CameraNotification`、`CameraOfflineNetwork`、`CameraSessionValidation`、`CameraEventToolValidation`、`CameraDataSourceValidation`、`CameraInterruptionRecovery`：版本、会话、通知、离线、数据源与中断恢复 |
| 交互与可达性 `Interaction` | 14 | 272 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`AccessibilityNavigation`、`ThemeVariation`、`VisualEffects`、`ContentScaling`、`WebViewPositioning`、`UIComponentRendering`、`DataBinding`：焦点、触摸、手势、事件、无障碍与视觉 |
| 生命周期与状态 `LifecycleState` | 10 | 184 | `ErrorRecovery`、`ExceptionHandling`、`StateRecovery`、`StatePersistence`、`SessionManagement`、`ExtensionLifecycle`、`ResourceManagement`、`ConfigurationChanges`、`WebViewLifecycle`、`WebViewStateManagement`：生命周期顺序、状态持久化与异常恢复 |
| 性能与长稳 `PerformanceStability` | 7 | 132 | `CameraPerformance`、`CameraConsumption`、`AnimationPerformance`、`PerformanceStress`、`LongTermStability`、`ConcurrencyControl`、`MemoryLeakDetection`：性能时延、功耗、压力、长稳、并发与内存泄漏 |
| 集成与场景 `Integration` | 9 | 110 | `UserScenarios`、`AdvancedScenarios`、`SystemIntegration`、`IntegrationTesting`、`CameraCompatibility`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity`、`ComprehensiveRegression`：用户场景、系统集成、兼容性、本地化与综合回归 |
| 安全与无障碍 `Security` | 3 | 55 | `CameraSecurity`、`SecurityValidation`、`SecurityAccessibility`：权限与安全校验、无障碍可读性 |

> 说明：`root/Ability.test.ets` 保留模板自带用例 1 个，当前未在 `List.test.ets` 注册；如需纳入，注册后总数变为 1824。

## 7. 结论

`WebGetCameraImage` 当前测试设计已形成“共享驱动 + 领域校验 + 真实拍照场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可作为 Web 拉起相机拍照能力后续持续集成、版本回归与测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 验证相机拉起功能 | 成功拉起应用，进入案例页面 | 1.点击选择文件按钮 | 1.成功拉起相机 | 否 | Pass |
| 验证相机拍照功能 | 成功拉起应用，进入案例页面 | 1.点击屏幕底部拍照按钮 | 1.成功拍照 | 否 | Pass |
| 验证Web展示照片功能 | 成功拉起应用，进入案例页面 | 1.成功后点击右侧确定按钮返回Web页面 | 1.成功在Web组件展示照片 | 否 | Pass |
| 验证图片分享功能 | 成功拍照，返回Web页面 | 1.拍照成功后在Web页面点击分享图片按钮 | 1.成功拉起分享面板<br/>2.显示图片缩略图及图片名称和描述 | 否 | Pass |
| 验证图片分享功能 | 成功拉起分享面板 | 1.选择一个应用点击 | 1.成功拉起二级分享面板<br/>2.显示图片缩略图 | 否 | Pass |
| 验证图片分享功能 | 成功拉起二级分享面板 | 1.点击分享图片 | 1.分享成功，弹出提示框<br/>2.返回Web页面 | 否 | Pass |


