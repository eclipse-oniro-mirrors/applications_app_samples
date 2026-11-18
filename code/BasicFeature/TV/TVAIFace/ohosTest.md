# TVAIFace 测试说明

> 本说明面向 `TVAIFace`（OpenHarmony 智慧屏 / TV 人脸检测应用）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVAIFace` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/AIFaceSharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、串行按键（`triggerSerializedKey`）、驱动单例管理（`getDriver`、`resetDriver`）、应用拉起与首页回归（`launchAIFaceApp`、`waitForHomeStable`、`ensureHome`）、三大入口导航（`navigateToImageSelect`、`navigateToCamera`、`navigateToDeviceAuth`、`openHomeEntry`）、文本与组件轮询（`waitForText`、`waitForAnyText`、`checkTextContent`、`getVisibleTexts`、`getComponentCount`）、焦点检查（`getCurrentFocusIndex`、`checkFocusState`、`getFocusedComponentId`）、遥控按键与触摸模拟（`pressAndWait`、`simulateTouch`、`clickById`、`clickByText`）、系统权限弹窗处理（`acceptPermissionDialogs`）、时延采样（`measureNavigationLatency`、`samplesWithinBudget`）以及人脸框几何工具（`normalizeFaceBox`、`intersectionOverUnion`）与双语文本候选（`localizedVariants`）
- 领域层：围绕人脸检测算法与模型数据（`utils/caffe`：`bbox_pred`、`landmark_pred`、`nms_cpu`、`CRect2f`、`_ratio_enum`、`_scale_enum`）、数据类型（`FaceObject`、`finalboxModel`、`ptsModel`、`ImagePosition`、`WindowSizeInfo`、`AcInfo`、`AnchorCfg`）、分布式设备模型（`RemoteDeviceModel`）、摄像头服务（`CameraService`）、页面状态（`globalThis`）、权限（`userGrantPermission`）、日志与事件工具等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟应用启动、首页三入口焦点切换、摄像头实时预览与多机位切换、图库缩略图与内置示例图选择、图片人脸检测与预览、设备发现/连接/解绑、遥控器与鼠标交互等真实 TV 人脸检测场景
- 质量层：补充性能时延、压力与长稳、异常恢复、无障碍、中英文资源、内容缩放与设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 83 个套件并顺序执行，覆盖核心主流程、设备验证、校验契约、安全、交互、生命周期、性能长稳与集成场景，套件总数与分类可直接审计
- 统一驱动能力：所有 UI 套件复用 `AIFaceSharedDriver` 的页面回归、文本轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 返回优先而非重启：`ensureHome` 在检测到应用已在子页时优先连续 `BACK` 回首页，只有确实不在应用内才重新拉起 `com.ohos.aiface/MainAbility`，避免长链路执行时堆叠 ability 实例导致测试进程被杀
- 权限弹窗前置处理：应用初次启动会依次弹出相机、读媒体、媒体位置、分布式数据同步权限窗口，`acceptPermissionDialogs` 在首页探针之前按"允许 / Allow"关闭弹窗，避免权限窗口遮挡造成的假失败
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程节流：`serializedDelay` 通过驱动延时让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 组件计数避坑：`getComponentCount` 在 `'*'` 通配查询为空时回退到 `Text`/`Image` 具名类型统计，避免 TV 版本不支持通配查询导致的空结果
- 双语文本候选：`localizedVariants` 对首页入口、可信设备、发现设备、无摄像头、模型失败等文案同时返回中英文，保证语言切换后断言仍可命中
- 轮询收敛：`waitForText`、`waitForAnyText`、`checkFocusState` 采用截止时间轮询而非固定等待，兼顾真机波动与执行效率

通过复用驱动工具、页面回归前置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`core` 18、`device-validation` 8、`validation` 14、`security` 3、`interaction` 14、`lifecycle` 10、`performance` 7、`integration` 9，共 83 个套件
- 人脸框矩阵（`CaffeAnchorValidation`、`FaceModelDeep`、`FaceBoxModel`：anchor 比例 × 尺度 × `bbox_pred`/`landmark_pred` 输出、NMS 阈值与 IoU 去重、空输入与单点输入）
- 摄像头矩阵（`CameraMenuConfiguration`、`CameraServiceValidation`、`AIFaceInputInteraction`：无摄像头 × 单摄像头 × 多摄像头切换 × 权限拒绝 × 模型缺失）
- 图像矩阵（`AIFaceOperationCatalog`、`AIFaceOperationFlow`：内置示例图 × 图库缩略图 × 空图库 × 图片加载失败）
- 设备验证矩阵（`DeviceAuthSession`、`DeviceDataSourceValidation`、`DeviceSessionValidation`：可信/非可信 × 发现中/空闲 × 绑定/解绑/重复绑定 × 服务不可用）
- 按键矩阵（`KeyCodeValidation`、`FocusNavigation`、`FocusRingBehavior`：方向键、ENTER、BACK、HOME 与三个入口焦点 id `1/0/-1` 的组合）
- 权限矩阵（`PermissionValidation`、`AIFaceSecurity`：授予/拒绝/撤销 × 相机/媒体/媒体位置/分布式数据同步）
- 设备与兼容矩阵（`DeviceCompatibility`、`CompatibilityTesting`：rk3568/大屏 × 输入方式 × 分辨率与缩放）
- 资源 × 语言矩阵（`LocalizationTesting`、`ResourceLoaderValidation`：base/zh_CN/en_US 与资源名/类型/回退）
- 状态与生命周期矩阵（`PageLifecycle`、`PageStateManagement`、`StateRecovery`：前后台 × 页面进出 × 状态保存与恢复）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/MainAbility.ets`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground/onWindowStageDestroy 生命周期、启动时申请相机与媒体权限）
- 首页导航（`pages/index.ets`：`Navigation` + `NavPathStack`、人脸图像识别/摄像头人脸检测/设备验证三个入口、`focusId` 选中态、方向键左右循环与鼠标悬停/点击）
- 摄像头预览（`pages/cameraPreview.ets`：`XComponent` 预览、`CameraService` 打开与切换摄像头、摄像头列表弹窗、`mindSporeLite` 加载 `mnet_caffemodel_480_720.ms`、`taskpool` 完成 ARGB→BGR 转换、画布绘制人脸框、无摄像头提示）
- 图片选择（`pages/imageSelect.ets`：`photoAccessHelper` 拉取图库缩略图、`rawfile` 内置示例图 `h_1`/`h_2`、六列 `Grid` 与滚动跟随、加载中蒙版、空图库提示）
- 图片预览（`pages/imagePreview.ets`：`Canvas` 绘制图片与人脸框、`AppStorage` 传递 `imageFd` 与 `shouldScan`、`bbox_pred`/`nms_cpu` 推理与坐标归一化、返回焦点恢复）
- 设备验证（`pages/distributedAttestation.ets`：可信设备列表、发现设备、在线设备列表、连接/解绑确认弹窗、`RemoteDeviceModel` 绑定关系与定时刷新）
- 资源与配置（`resources/base|zh_CN|en_US`、media 图片与图标、`rawfile` 模型与示例图、`main_pages.json`、`module.json5`）
- 日志与权限（`utils/log`、`utils/permission`、`utils/utils` 的屏幕尺寸与绘制尺寸换算）

### 3.2 关键风险点

围绕 TV 大屏人脸检测场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致入口按键无效
- 系统权限弹窗遮挡应用，造成首页探针假通过或长链路失败
- 首页入口焦点丢失、焦点落点错位或进入子页后焦点未注入
- 摄像头被占用、无可用摄像头或机位切换失败导致黑屏
- 人脸检测模型缺失或加载失败时的崩溃、无提示或残留上一帧人脸框
- 人脸框坐标未按画布比例缩放，导致框选偏移或尺寸失真
- 图库缩略图异步加载期间空列表、重复渲染或内存增长
- 图片解码失败、非法 `imageFd` 导致空白页
- 分布式服务不可用、发现失败或绑定失败时的崩溃与状态残留
- 重复绑定已可信设备、解绑中再次操作导致列表与真实状态不一致
- 页面离开后设备发现与定时刷新未停止，长跑产生资源泄漏
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 初始化过程中屏幕尺寸、DPI 或窗口宽高读取异常导致布局错位

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，三个入口成对出现且图标与文案一致
- 首页入口鼠标点击与遥控器方向键/ENTER 双向可达，选中态与图标高亮同步
- 子页返回后首页焦点恢复到离开时的入口
- 摄像头预览 `XComponent` 创建成功，进入即聚焦"多机位切换"
- 摄像头列表弹窗展示本地与分布式机位，切换后预览画面更新
- 无可用摄像头时展示"请接入摄像头/Please connect the camera"提示且不进入空白页
- 实时预览中检测到人脸后按画布比例绘制人脸框，无脸时不残留旧框
- 模型加载成功后可完成一次推理；模型失败时展示"AI模型加载失败，请重试！"
- 图片选择页先展示内置示例图，再异步补齐图库缩略图，加载中显示蒙版
- 六列网格方向键上下左右移动、焦点描边、滚动跟随与边界不越出
- 图库为空时展示空图库提示，返回键可回首页
- 图片预览页自动检测并标注人脸，返回后焦点停留在原图片索引
- 设备验证页可信设备列表、空设备占位图与默认焦点正确
- 发现设备后按钮文案切换为"正在发现设备"，标题切换为"在线设备"
- 连接/解绑确认弹窗文案、确认与取消行为、Toast 提示符合预期
- 对已可信设备再次操作提示"设备已验证"，不重复发起绑定
- 返回栈语义、前后台切换、窗口显示与 1080 设计宽度适配
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 权限拒绝、相机被占用、无摄像头、模型缺失等环境负向输入
- 非法设备 ID、重复绑定、解绑不存在设备等非法参数
- 非法按键码、越界坐标、超屏坐标注入
- 图库为空、缩略图加载失败、图片解码失败与非法文件描述符
- 分布式服务不可用、发现无结果、绑定中断与超时
- 快速连续按键、交替按键、重复点击后的状态一致性
- 前后台切换、页面销毁重建与状态恢复
- 检测结果为空、单脸、多脸与置信度接近阈值时的稳定输出

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（首页入口、列表首项或"发现设备"按钮）
- 页面是否回到稳定基线（首页标题存在、子页标记消失）
- 设备列表数量与索引是否一致，避免重复实例
- 模型失败、无摄像头等提示消失后功能是否可重试
- 页面离开后设备发现、定时刷新与相机预览是否已停止

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续执行导航、切换入口、快速按键等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`、`STRESS_ROUNDS_NAVIGATION = 20`）
- 连续路由跳转与入口反复进出（`PageLifecycle`、`AdvancedScenarios`、`STRESS_ROUNDS_LIFECYCLE = 10`）
- 预览推理与页面返回并发、图库加载与滚动并发（`AIFaceConcurrency`、`ConcurrencyControl`）
- 设备发现与列表刷新并发、绑定/解绑操作并发（`DeviceInterruptionRecovery`、`DeviceEventValidation`）
- 长链路混合动作回放（`LongTermStability`、`AIFaceStress`、`PerformanceStress`）
- 长链路执行期间的主线程让出（`serializedDelay`、`runSerializedUiOperation`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录冷/热启动、页面渲染、焦点切换、文本出现、图片加载与推理等多类时延，预算常量集中在 `AIFaceSharedDriver`（页面渲染 2s、焦点切换 800ms、文本出现 1.5s、按键间隔 80ms、页面跳转 600ms）
- 采用限时上界断言（`samplesWithinBudget`），上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值（`average`、`maxValue`），避免单次抖动被平均值掩盖
- 校验渲染耗时、组件数量容差（`TOLERANCE_COMPONENT_COUNT = 5`）、内存水位与泄漏斜率（`RenderPerformance`、`MemoryLeakDetection`）
- 统计相机预览与推理的 CPU/内存占用（`CameraConsumption`、`CameraPerformance`）
- 在内容缩放、分辨率变化、主题变化、中英文资源下重复执行（`ContentScaling`、`ConfigurationChanges`、`LocalizationTesting`）
- 覆盖 rk3568 与 TV 大屏的设备差异与特性门禁（`DeviceCompatibility`、`CompatibilityTesting`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 权限调用契约（`PermissionValidation`、`AIFaceSecurity`：`userGrantPermission` 入参校验、非法上下文与缺失 bundle 信息的安全拒绝）
- 安全校验（`SecurityValidation`：敏感字段、非法输入、越权访问与日志脱敏）
- 无障碍安全（`SecurityAccessibility`：可访问性节点不泄露内部路径与设备标识）
- 输入校验（`InputValidation`：文件名、图片路径、设备 ID 与 URL 参数）
- 数据源与设备事件契约（`DeviceDataSourceValidation`、`DeviceEventValidation`：响应结构、事件字段与状态机合法迁移）
- 常量与工具契约（`UtilsValidation`、`LoggerValidation`、`EventUtilValidation`、`KeyCodeValidation`、`ResourceLoaderValidation`）
- 包与配置一致性（`DeviceAppVersion`、`SystemIntegration`：bundle 信息、版本号与模块配置）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusNavigation`、`FocusRingBehavior`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 数据绑定与弹窗定位（`DataBinding`、`DialogPositioning`）
- 内容缩放、布局测量与滚动边界（`ContentScaling`、`PageStateManagerValidation`）
- 主题与对比度（`ThemeVariation`、`VisualEffects`）
- 组件渲染一致性（`UIComponentRendering`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断 TV 大屏人脸检测应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混合回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、人脸框几何关系、文本可读性与时延上界
- 算法可验证：`bbox_pred`/`landmark_pred`/`nms_cpu` 与 `normalizeFaceBox`、`intersectionOverUnion` 使检测输出与框选坐标具备可复算的断言依据
- 驱动可复用：`AIFaceSharedDriver`、统一 `ensureHome` 前置与串行/节流策略便于继续扩展而不破坏既有结构
- 结果可审计：83 个套件按八类分组登记，分类缺失或重复注册可直接在 `List.test.ets` 中审查

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 83 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/AIFaceSharedDriver.ets`：串行 UI 队列、页面回归、文本/组件轮询、遥控与触摸模拟、权限弹窗处理、人脸框几何工具、时延与容差常量、双语文本候选 |
| 核心主流程 `core` | 18 | `Ability`、`Index`、`AIFaceUI`、`AIFaceOperations`、`AIFaceOperationCatalog`、`AIFaceOperationFlow`、`AIFaceOperationWorkflow`、`FaceBoxModel`、`FaceModelDeep`、`CameraMenuConfiguration`、`AIFaceConcurrency`、`AIFaceConsistency`、`AIFaceEndToEnd`、`AIFaceErrorRecovery`、`AIFaceLifecycle`、`AIFaceStateManagement`、`AIFaceStress`、`AIFaceInputInteraction`：启动冒烟、首页三入口、摄像头/图片/设备三条主链路、人脸模型与框选、并发一致性与端到端回归 |
| 设备验证专项 `device-validation` | 8 | `DeviceAppVersion`、`DeviceAuthSession`、`DeviceDataSourceValidation`、`DeviceEventValidation`、`DeviceInterruptionRecovery`、`DeviceNotification`、`DeviceOfflineNetwork`、`DeviceSessionValidation`：版本信息、验证会话、设备数据源与事件封装、中断恢复、离线网络与状态机 |
| 校验与契约 `validation` | 14 | `CaffeAnchorValidation`、`BoundaryErrorTesting`、`EventUtilValidation`、`PermissionValidation`、`PageStateManagerValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`、`UtilsValidation`、`CameraServiceValidation`、`RemoteDeviceModelValidation`：算法锚点与 NMS、边界与异常、权限与焦点契约、相机服务与设备模型、工具与资源加载 |
| 生命周期与状态 `lifecycle` | 10 | `AbilityLifecycle`、`PageLifecycle`、`PageStateManagement`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`ResourceManagement`、`ConfigurationChanges`、`ErrorRecovery`、`ExceptionHandling`：应用与页面生命周期、状态保存恢复、资源释放与配置变化 |
| 交互与可达性 `interaction` | 14 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`AccessibilityNavigation`、`DataBinding`、`DialogPositioning`、`ContentScaling`、`ThemeVariation`、`VisualEffects`、`UIComponentRendering`：遥控焦点、触摸手势、事件分发、无障碍与视觉表现 |
| 性能与长稳 `performance` | 7 | `RenderPerformance`、`CameraPerformance`、`CameraConsumption`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`：渲染与推理时延、相机资源占用、并发控制、长稳与内存泄漏 |
| 集成与场景 `integration` | 9 | `UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`CompatibilityTesting`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity`：真实使用路径、系统集成、全量回归、设备兼容、多语言与网络连通性 |
| 安全与契约 `security` | 3 | `AIFaceSecurity`、`SecurityValidation`、`SecurityAccessibility`：权限入参安全、敏感信息与非法输入、可访问性安全约束 |

## 7. 结论

`TVAIFace` 当前测试设计已经形成"共享驱动 + 领域算法校验 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 人脸检测应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 应用启动与首页入口 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 设备已正常启动 | 启动应用，使用方向键左右切换三个入口 | 首页展示人脸图像识别、摄像头人脸检测、设备验证三个入口，焦点与图标高亮同步 | 否 | Pass |
| 权限申请 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 初次安装未授权 | 初次启动后依次处理相机、媒体、媒体位置、分布式数据同步权限弹窗 | 允许后各功能可用；拒绝后相关功能给出提示且应用不崩溃 | 否 | Pass |
| 图片人脸检测 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 设备中保存有人脸的照片 | 点击人脸图像识别，选择照片 | 识别出人脸的位置 | 否 | Pass |
| 摄像头人脸检测 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. TV设备连接摄像头 | 点击摄像头人脸检测，显示当前选择的摄像头画面 | 识别出人脸的位置 | 否 | Pass |
| 设备连接验证 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 同一网络下存在相同设备 | 1、点击设备验证 <br/> 2、搜索设备 <br/> 3、连接设备 | 能够看到连接设备的画面，识别出人脸位置 | 否 | Pass |
