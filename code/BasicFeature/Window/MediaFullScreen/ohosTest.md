# 视频全屏切换案例（MediaFullScreen）测试说明

> 本说明面向 `MediaFullScreen`（OpenHarmony 媒体全屏切换示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、目录职责与充分性依据。

## 1. 文档目标

本文档用于说明 `MediaFullScreen` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享模型层：以 `Shared/MediaModels.ets` 为核心，复刻被测业务的关键领域模型，包括 AVPlayer 状态机 `VideoPlayerModel`（idle/initialized/prepared/playing/paused/completed/stopped/released/error 迁移、seek 边界、倍速、tick 播放推进）、`FullscreenModel`（遮罩、选中视频、横屏切换、返回退出）、`WindowConfigModel`（沉浸式布局与系统栏可见性）、`FlowDataSource`/`FlowItemModel`（瀑布流数据源与通知）、`PlaybackSpeedController`、`SeekController`、`AspectRatioUtil`、`VideoSessionManager`、`BufferStateModel`、`PlayerErrorModel` 与 `TimeFormatter`；`Shared/TestUtils.ets` 提供异步延时、mock 数据工厂与浮点容差工具
- 领域层：围绕播放器状态迁移、全屏/横竖屏切换、窗口沉浸式配置、瀑布流数据增删与通知、倍速与进度换算、时长格式化、缓冲与错误处理等纯逻辑展开确定性单元测试，系统依赖通过等价模型隔离
- 场景层：模拟点击瀑布流视频卡片、拉起 XComponent 播放、进入全屏横屏、倍速切换、拖动进度条、点击收起退出全屏、返回键退出播放等真实媒体全屏链路
- 质量层：补充并发与一致性、压力与长稳、异常与错误恢复、性能时延、无障碍、中英文资源、内容缩放与设备兼容、安全校验等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 8 个业务分组 + 1 个共享模型目录，共 **79 个套件、2541 个用例**，分组明细见第 6 节，便于在不跑真机的情况下审计覆盖度
- 统一领域模型：所有套件复用 `Shared/MediaModels.ets` 的状态机与控制器，避免各套件重复实现播放器/全屏/窗口逻辑
- 用例合并降载：将同一文件内相邻用例合并为块级作用域用例（`{ }` 隔离变量），在保持断言完整的前提下把用例规模控制在设备可稳定运行的范围内（2541 条），避免全量 class 过滤运行导致测试进程被杀
- 状态驱动断言：以状态机迁移与快照（`PlayerSnapshot`）为核心断言对象，覆盖“合法迁移成功、非法迁移被拒绝、边界值被钳制”三类规则
- 屏幕常亮：`TestAbility.onWindowStageCreate` 调用 `setWindowKeepScreenOn(true)`，避免长时全量运行中途息屏导致拉起超时（00508013）
- 共享工具：`TestUtils` 的 `delayMs`、`createFlowItem(s)`、`nearlyEqual` 统一处理异步等待、数据构造与浮点比较，降低各套件重复代码

通过复用模型与工具、控制用例规模与真机稳定性策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分组矩阵：`MediaFullScreen` 16、`Validation` 11、`Interaction` 14、`LifecycleState` 10、`Integration` 9、`PlayerValidation` 8、`PerformanceStability` 7、`Security` 3，共 78 个用例文件、2540 条用例（另有 `ActsAbilityTest` 1 条），合计 79 套件、2541 条
- 播放状态矩阵：`VideoPlayerModel` 的 9 个状态 × play/pause/stop/release/prepare/seek/倍速 的合法与非法迁移
- 进度与倍速矩阵：进度百分比 0~100、超界与负值钳制；倍速 `0.75x/1.0x/1.25x/1.75x/2.0x` 的选择、切换与越界拒绝
- 全屏与方向矩阵：`FullscreenModel` 的选中/未选中 × 准备完成 × 横屏/竖屏 × 返回退出
- 窗口配置矩阵：`WindowConfigModel` 的沉浸式开/关 × 系统栏（status/navigation/both/none）
- 数据源矩阵：`FlowDataSource` 的追加/插入/删除/越界索引 × 通知计数
- 播放器内部矩阵：会话创建/释放、缓冲进度 0~100、错误码 × 错误描述
- 兼容与资源矩阵：分辨率、内容缩放、主题、中英文资源、设备形态

矩阵化设计降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`：`windowStage.loadContent('pages/MediaFullScreen')`、onCreate/onForeground/onBackground 生命周期）
- 瀑布流首页（`pages/MediaFullScreen.ets`：`WaterFlow` + `LazyForEach` 懒加载、`@Reusable` 复用卡片、遮罩层 `maskShow`、`onBackPress` 返回语义、`aboutToAppear` 读取 rawfile mock 数据）
- 视频播放组件（`pages/XComponentVideo.ets`：`XComponent` 与 AVPlayer 通过 surfaceId 绑定、状态机回调、`timeUpdate`/`durationUpdate`/`bufferingUpdate`/`error` 等事件、倍速弹框 `speedPopup`、Slider seek、沉浸式与横竖屏切换 `changeOrientation`）
- 数据模型（`model/BasicDataSource.ets`：`BasicDataSource<T>` 监听注册与通知、`FlowItemContentsData` 增删、`UserItem`/`FlowItemContent`/`JsonObject` 解析 rawfile）
- 工具函数（`util/TimeTools.ts`：`fillNum` 补零、`getTimeString` 时长格式化与负值/未定义归一）
- 资源与配置（`resources/base|zh_CN|en_US`、`rawfile/media_full_screen_mockData.json`、`rawfile/*.mp4`、`main_pages.json`、`module.json5`、`syscap.json`）
- 窗口能力（`@ohos.window`：`getLastWindow`、`setWindowSystemBarEnable`、`setPreferredOrientation`、`setWindowLayoutFullScreen`、`getWindowAvoidArea`）

### 3.2 关键风险点

围绕媒体全屏切换场景，重点识别如下风险：

- 视频卡片点击后遮罩或选中态未同步，导致重复点击或无法进入播放
- XComponent 未就绪即播放，surfaceID 绑定失败或黑屏
- AVPlayer 状态迁移异常（未 prepared 即 play、completed 后重播、seek 越界）
- 全屏与横竖屏切换不一致，收起后遮罩/选中态残留
- 倍速越界或非法索引导致播放速度异常
- 进度拖动为负或超过时长，时长格式化出现负值/NaN
- 瀑布流数据增删越界、通知计数异常
- 缓冲/错误状态下 UI 与播放器状态不一致
- 返回键未按“先退出全屏、再退出页面”的语义处理
- 中英文资源缺失、时长/文案渲染异常
- 长跑过程中频繁切换导致状态残留或资源句柄未释放
- 敏感路径、rawfile 访问或日志信息泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 应用启动至瀑布流首页可交互，列表数据从 rawfile 正确加载
- 点击视频卡片：遮罩显示、选中视频名传递、视频位置信息回填
- 视频 prepared 后自动播放并进入全屏横屏
- 播放/暂停/停止/释放的状态与 UI 图标一致
- 拖动进度条按百分比换算为时长并 seek，边界被钳制
- 倍速选择 `0.75x~2.0x` 后生效，非法索引被拒绝
- 点击收起按钮退出全屏，遮罩与选中态清理
- 返回键语义：播放中返回仅退出全屏，非播放中返回退出页面
- 时长格式化在 0、不足 1 分钟、跨小时、负值/非法输入下均正确
- 瀑布流数据追加/插入/删除后总数与项内容正确

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 未选中视频即准备/全屏、重复选中、选中后再切换到另一个视频
- 未 prepared 即 play、completed 后再次 play、已 released 后操作
- seek 为负、超过时长、播放器未就绪
- 倍速索引越界、非法索引
- 全屏切换中重复点击收起、返回键连续触发
- 数据源越界插入/删除、空数据源操作
- 缓冲进度异常、错误码与错误信息设置
- 窗口配置在进入/退出沉浸式过程中的重复调用

恢复类测试要求不仅校验返回值，还要求校验：

- 播放器状态是否回到稳定基线（idle/released 或 prepared）
- 全屏/遮罩/选中态是否被正确清理
- 数据源总数与索引是否一致，避免重复实例
- 会话创建/释放计数是否平衡，避免句柄泄漏

这保证异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

媒体全屏场景下用户可能连续点击、切换、拖动、返回，因此覆盖：

- 高频选中/取消与全屏切换（`MediaFullScreenConcurrency_Test`、`MediaFullScreenConsistency_Test`）
- 连续播放操作与状态回放（`MediaFullScreenStateManagement_Test`、`PlayerOperationFlow_Test`）
- 倍速切换、seek 与暂停/播放交织（`PlayerOperations_Test`、`PlayerModelDeep_Test`）
- 混合动作长链路回放（`MediaFullScreenStress_Test`、`LongTermStability_Test`、`PerformanceStress_Test`）
- 会话创建/释放与缓冲更新并发（`ConcurrencyControl_Test`、`VideoSessionManager`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计通过以下方式提升充分性：

- 覆盖动画/全屏切换、播放推进、倍速、缓冲等关键路径的时延与负载约束
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多轮执行，校验状态稳定与内存/会话计数不增长（`MemoryLeakDetection_Test`、`PlayerConsumption_Test`、`PlayerPerformance_Test`）
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖不同设备形态与特性门禁（`PlayerCompatibility_Test`、`DeviceCompatibility_Test`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入与参数校验（`InputValidation_Test`、`BoundaryErrorTesting_Test`、`KeyCodeValidation_Test`）
- 窗口与播放器契约（`MediaFullScreenUI_Test`、`PlayerMenuConfiguration_Test`：系统栏、沉浸式、方向、倍速菜单）
- 状态管理器契约（`PlayerStateManagerValidation_Test`：状态迁移合法性）
- 敏感信息与日志（`LoggerValidation_Test`、`PlayerSecurity_Test`、`SecurityValidation_Test`）
- 无障碍可读性（`AccessibilityNavigation_Test`、`SecurityAccessibility_Test`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对媒体全屏示例的操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation_Test`、`SecurityAccessibility_Test`）
- 焦点高亮与焦点环样式（`FocusRingBehavior_Test`、`FocusNavigation_Test`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction_Test`、`TouchInteraction_Test`、`GestureRecognition_Test`、`EventHandling_Test`、`EventPropagation_Test`）
- 内容缩放与卡片定位（`ContentScaling_Test`、`PlayerPositioning_Test`）
- 主题与对比度（`ThemeVariation_Test`、`VisualEffects_Test`）
- 中英文文案与资源完整性（`LocalizationTesting_Test`、`ResourceLoaderValidation_Test`）

这部分是判断媒体全屏示例可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享模型层到领域逻辑层、场景回归层与质量层都有对应测试
- 覆盖维度齐全：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、组合矩阵、状态机迁移、压力回放、等价模型隔离并存
- 数据校验细化：不仅校验状态值，还校验进度/时长换算、倍速、数据源索引、缓冲与错误描述、会话计数
- 核心链路可验证：`VideoPlayerModel` 与 `FullscreenModel` 对播放/全屏/方向/遮罩逐项断言，`MediaFullScreenUI_Test` 校验窗口与 UI 契约
- 测试资产可复用：`MediaModels` 与 `TestUtils` 便于继续扩展而不破坏既有结构
- 环境鲁棒性：屏幕常亮与用例规模控制降低真机长跑失败率

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 **79 个套件、2541 个用例**（78 个业务用例文件 + `ActsAbilityTest` 冒烟 1 条），按测试意图分为 8 个业务分组 + 1 个共享模型目录：

| 分组 | 文件数 | 用例数 | 代表套件与职责 |
|---|---:|---:|---|
| 全屏播放 `MediaFullScreen` | 16 | 523 | `MediaFullScreenUI_Test`、`MediaFullScreenLifecycle_Test`、`MediaFullScreenStateManagement_Test`、`MediaFullScreenConcurrency_Test`、`MediaFullScreenConsistency_Test`、`MediaFullScreenEndToEnd_Test`、`MediaFullScreenErrorRecovery_Test`、`MediaFullScreenStress_Test`、`PlayerModelDeep_Test`、`PlayerOperations_Test`、`PlayerOperationFlow_Test`、`PlayerOperationCatalog_Test`、`PlayerOperationWorkflow_Test`、`PlayerItemInfoModel_Test`、`PlayerMenuConfiguration_Test`、`PlayerInputInteraction_Test`：全屏渲染、生命周期、状态机、并发一致性、端到端播放与错误恢复 |
| 校验与契约 `Validation` | 11 | 536 | `KeyCodeValidation_Test`、`LoggerValidation_Test`、`PointerUtilValidation_Test`、`FocusManagerValidation_Test`、`ResourceLoaderValidation_Test`、`CommonEventUtilValidation_Test`、`AnimationControllerValidation_Test`、`PlayerStateManagerValidation_Test`、`ConfigurationManagerValidation_Test`、`InputValidation_Test`、`BoundaryErrorTesting_Test`：输入校验、状态机迁移、配置与资源、日志、边界异常 |
| 交互与可达性 `Interaction` | 14 | 501 | `FocusNavigation_Test`、`FocusRingBehavior_Test`、`ButtonInteraction_Test`、`TouchInteraction_Test`、`GestureRecognition_Test`、`EventHandling_Test`、`EventPropagation_Test`、`AccessibilityNavigation_Test`、`ThemeVariation_Test`、`VisualEffects_Test`、`ContentScaling_Test`、`PlayerPositioning_Test`、`UIComponentRendering_Test`、`DataBinding_Test`：焦点、触摸、手势、事件、无障碍与视觉 |
| 播放器校验 `PlayerValidation` | 8 | 283 | `PlayerAppVersion_Test`、`PlayerAuthSession_Test`、`PlayerNotification_Test`、`PlayerOfflineNetwork_Test`、`PlayerSessionValidation_Test`、`PlayerEventToolValidation_Test`、`PlayerDataSourceValidation_Test`、`PlayerInterruptionRecovery_Test`：版本、会话、通知、离线、数据源与中断恢复 |
| 生命周期与状态 `LifecycleState` | 10 | 281 | `ErrorRecovery_Test`、`ExceptionHandling_Test`、`StateRecovery_Test`、`StatePersistence_Test`、`SessionManagement_Test`、`ExtensionLifecycle_Test`、`ResourceManagement_Test`、`ConfigurationChanges_Test`、`PlayerLifecycle_Test`、`PlayerStateManagement_Test`：生命周期顺序、状态持久化与异常恢复 |
| 性能与长稳 `PerformanceStability` | 7 | 182 | `PlayerPerformance_Test`、`PlayerConsumption_Test`、`AnimationPerformance_Test`、`PerformanceStress_Test`、`LongTermStability_Test`、`ConcurrencyControl_Test`、`MemoryLeakDetection_Test`：性能时延、功耗、压力、长稳、并发与内存泄漏 |
| 集成与场景 `Integration` | 9 | 171 | `UserScenarios_Test`、`AdvancedScenarios_Test`、`SystemIntegration_Test`、`IntegrationTesting_Test`、`PlayerCompatibility_Test`、`DeviceCompatibility_Test`、`LocalizationTesting_Test`、`NetworkConnectivity_Test`、`ComprehensiveRegression_Test`：用户场景、系统集成、兼容性、本地化与综合回归 |
| 安全与无障碍 `Security` | 3 | 63 | `PlayerSecurity_Test`、`SecurityValidation_Test`、`SecurityAccessibility_Test`：权限与安全校验、无障碍可读性 |
| 共享模型 `Shared` | 2 | — | `MediaModels`：播放器/全屏/窗口/数据源/倍速/进度/会话/缓冲/错误/时长模型；`TestUtils`：异步延时、mock 数据工厂、浮点容差 |

> 说明：`root/abilityTest`（`ActsAbilityTest`）冒烟用例 1 条已由 `List.test.ets` 注册，计入 79 套件、2541 用例；上表分组用例数合计 2540，加上该冒烟用例即为总数。测试目录 `.ets` 代码总计约 5.57 万行。

## 7. 结论

`MediaFullScreen` 当前测试设计已形成“共享模型 + 领域校验 + 真实全屏播放场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可作为媒体全屏切换能力后续持续集成、版本回归与测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 视频播放并自动切换横屏 | 进入案例 | 点击瀑布流内任意一个播放按钮并查看 | 视频正常播放，视频全屏并自动切换横屏状态 | 否 | 通过 |
| 点击按钮退出全屏 | 视频进入全屏状态 | 在横屏状态点击下方进度条右侧的收起按钮 | 横屏视频退出全屏回到瀑布流 | 否 | 通过 |



