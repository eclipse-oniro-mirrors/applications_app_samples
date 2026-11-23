# CustomShare 测试说明

> 本说明面向 `CustomShare`（OpenHarmony 应用样例：自定义分享 / 分享模板）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `CustomShare` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦「为什么这样设计测试」和「当前测试为何具备较强覆盖能力」，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `ets/testrunner/OpenHarmonyTestRunner`，测试承载 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/CustomShareDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞让出（`serializedDelay`、`yieldTick`）、按键模拟（`triggerSerializedKey`、`pressAndWait`）、分享弹窗探针（`shareDialogComponentCount`、`isShareDialogVisible`、`waitForShareDialogStable`、`shareTemplateExists`）、文本与组件轮询（`checkTextContent`、`findComponentsByType`、`checkComponentExists`）、焦点检查（`getCurrentFocusIndex`）、触摸模拟（`simulateTouch`）以及 `launchShareApp`、`triggerShareDialog`、超时与容差常量（`TIMEOUT_DIALOG_RENDER`、`TIMEOUT_SHARE_OPERATION`、`DELAY_KEY_NAVIGATION`、遥控键码 `KEY_*`）等可复用资产
- 领域层：围绕分享数据模型与规则（`DialogDataModel`、`RequestRes`/`RequestResContent`、`ShareConst` 常量、`dialogData` 分享模板项 `id 0~5`）、分享常量与请求契约、文本分享/文本编辑/文本接收能力、状态编解码、包元数据等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟应用启动、首页三入口（文本+链接分享 / 应用内文件分享 / 第三方应用分享）、分享弹窗模板选择、Chat 三方拉起、生成海报与截图分享、文本分享与文本编辑跳转、视频文件分享等真实分享场景
- 质量层：补充性能时延、压力与长稳、错误恢复、无障碍、中英文资源、内容缩放与设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 78 个套件（8 大分类，合计 1600 条用例），以统一 `describe/it` 组织，便于覆盖度在不上真机的情况下审计
- 统一驱动能力：所有需要 UI 探针的套件复用 `CustomShareDriver` 的页面回归、组件/文本轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 串行化 UI 队列：单 UI 线程渲染场景下，UiTest 调用与延时进入 `_queue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程让出：`serializedDelay`/`yieldTick` 使用 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 组件计数兜底：`shareDialogComponentCount` 对空结果做兜底，避免部分设备不支持通配查询导致的空结果与全量无障碍树转储开销
- 轻量确定性断言：领域层用例以纯逻辑构造 `Registry/Metrics/Validator/StateMachine` 等桩对象，单条用例毫秒级、结果稳定，便于大规模回归

通过复用驱动工具、页面回归前置与串行/让出策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`ShareComponent` 16、`ShareValidation` 8、`Integration` 9、`Interaction` 14、`LifecycleState` 10、`PerformanceStability` 7、`Security` 3、`Validation` 11，共 78 个套件、1600 条用例
- 分享类型矩阵：`kindId` 文本+链接（`ShareConst.KIND_ID_NUMBER`=1）、应用内文件/图片（`ShareConst.KIND_ID`=2）、第三方应用分享；对应首页三入口
- 分享模板矩阵：`dialogData` 的 `id 0~5`（Chat、视频分享、复制链接、生成海报、文本分享、文本编辑）与选中态、回调分支
- 键位矩阵：方向键、`KEY_ENTER`、`KEY_BACK` 与非法键码的合法/非法组合（`KeyCodeValidation` 等）
- 状态矩阵：弹窗 `IDLE/READY/RUNNING/DONE/FAILED` 迁移、并发打开/关闭、打开失败与恢复
- 设备与兼容矩阵：当前分辨率/语言/缩放 × 输入方式 × 特性门禁（`DeviceCompatibility`、`ShareCompatibility`）
- 资源 × 语言矩阵：`base/zh_CN/en_US` 与资源名/类型/回退（`LocalizationTesting`、`ResourceLoaderValidation`）
- 错误与恢复矩阵：断网/超时/异常响应 × 重试 × 恢复（`ShareOfflineNetwork`、`ShareInterruptionRecovery`、`ErrorRecovery`）

矩阵化设计的意义在于降低「单点通过、组合失败」的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entry/.../MainAbility/MainAbility.ts`、`Application/MyAbilityStage.ts`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground 生命周期、`eventHub` 的 `getAbilityData` 回传 context 与 want、运行时申请 `INTERNET`/`MEDIA_LOCATION` 权限）
- 首页导航（`entry/.../pages/Index.ets`：三个入口按钮 `shareLinkResource`/`shareFileResource`/`shareOtherResource`，`homeBtn` 以 `DialogAlignment.Bottom` 打开 `ButtonDialogBuilder`）
- 分享弹窗（`ShareComponent/.../pages/Dialog.ets`：`ButtonDialogBuilder`、`ShareDialogBuilder`、`DialogLayoutComponent`，模板列表、`toShare`/`cancellation` 区域、`id 0~5` 分支）
- 分享能力（`ShareUtils`：`startAbility` 拉起 `com.samples.chat`、`savePicture` 打包落盘、`shareImageStartAbility` 以 FD 分享、`getScreen` 截图、`startApp` 分享视频、`queryMedia`/`getFileData` 取视频 FD；`MediaUtils.getFileAssetsFromType` 基于 `photoAccessHelper`）
- 分享数据与契约（`mock/ShareData.dialogData` 六个模板项、`model/ShareModel.DialogDataModel`、`model/HttpModel.RequestRes/RequestResContent`、`net/HttpRequest` 与 `util/ShareConst` 的 `REQUEST`、`TIMEOUT_NUMBER`、`KIND_ID*`）
- 文本分享（`textShare`：`TextReceiveAbility`、`ShareExtAbility`（`ShareExtensionAbility.onSessionCreate` + `session.loadContent('pages/ShareExtenIndex')`）、`pages/Index`）
- 文本编辑（`textEdit`：`EditTextAbility`、`ShareExtAbility`、`pages/Index`/`ShareExtenIndex`）
- 资源与配置（`resources/base|zh_CN|en_US`、`main_pages.json`、`module.json5`、`syscap.json`）
- 网络与日志（分享详情 `GET` 请求、`Logger`（hilog）在 `entry`/`ShareComponent`/`textShare`/`textEdit` 的日志输出）

### 3.2 关键风险点

围绕分享场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致入口点击无效
- 系统权限弹窗（`MEDIA_LOCATION` 等 user_grant）遮挡应用，造成首页探针假通过或长链路失败
- 分享模板项与 `id 0~5`/`index` 分支错位，点击落到错误回调
- Chat 伴生应用未安装导致 `startAbility` 失败且提示不准确
- 截图/海报因权限或能力缺失导致 `getScreen`/`savePicture` 失败、成功提示缺失
- 详情 HTTP 请求失败/超时导致 `title`/`price`/`srcImage` 为空、弹窗内容空白
- 视频文件 FD 获取失败或文件不存在导致分享中断
- 文本分享/文本编辑跳转参数缺失、`LocalStorage` session 未正确加载
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 敏感信息（token、设备标识、路径）在日志或界面泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证「页面能看到」，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，标题与三个入口（文本+链接分享 / 应用内文件分享 / 第三方应用分享）成对出现
- 首页三个入口点击后均可打开分享弹窗（`ButtonDialogBuilder`）
- 分享弹窗模板项 `id 0~5` 正确渲染，点击分别落入 Chat、视频分享、复制链接、生成海报、文本分享、文本编辑分支
- 拉起 Chat 的 want 参数（`kindId`、`text`、`srcImg`）正确组装
- 生成海报与截图分享可完成打包落盘并给出「截图成功」提示
- 应用内文件/图片分享与视频 FD 分享流程可走通
- 文本分享（`TextReceiveAbility`）与文本编辑（`EditTextAbility`）跳转、`LocalStorage` session 加载与文案回填
- 详情 HTTP 请求成功后回填 `title`/`price`/`srcImage`
- 返回栈语义、前后台切换与窗口显示

这样可以定位失败点，而不是只得到「主流程失败」的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 必填项/参数缺失、非法路由参数、非法键码与越界坐标注入
- 断网、超时、5xx、响应体结构异常与空列表下的弹窗空态
- Chat 伴生应用未安装或 `startAbility` 失败时的提示与回退
- 截图权限/系统能力缺失时 `getScreen`/`savePicture` 的降级与提示
- 快速连点、重复打开/关闭弹窗后的状态一致性
- 前后台切换、状态恢复与草稿缓存恢复

恢复类测试不仅校验接口返回值，还要求校验：当前焦点是否回归有效位置、页面是否回到稳定基线、列表数量与索引是否一致、失败后是否可重试、离线队列是否按序重放且过期项被丢弃。

这保证了异常测试不仅关注「报错」，也关注「报错之后系统是否恢复正确」。

### 4.3 并发与长稳

单 UI 线程形态下，用户可能连续执行导航、切换入口、快速按键等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`）
- 连续打开/关闭分享弹窗、入口反复进出（`ShareDialogConcurrency`、`AdvancedScenarios`）
- 提交与列表刷新并发、上传与页面返回并发（`ConcurrencyControl`）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）
- 长链路执行期间的主线程让出（`yieldTick`、`serializedDelay`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录冷/热启动、页面渲染、列表加载、弹窗打开、焦点切换等多类时延，预算常量集中在 `CustomShareDriver`（弹窗渲染、分享操作、按键导航等）
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值，避免单次抖动被平均值掩盖
- 校验启动预算、帧率与卡顿率、内存水位与泄漏趋势（`AnimationPerformance`、`MemoryLeakDetection`、`SharePerformance`）
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖不同设备/输入方式的差异与特性门禁（`DeviceCompatibility`、`ShareCompatibility`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入校验（`InputValidation`：分享文本、URL 参数、文件名）
- 敏感信息与隐私（`ShareSecurity`：token、设备标识、路径穿越、URL 白名单与日志脱敏）
- 权限与审计（`SecurityValidation`、`SecurityAccessibility`：授权矩阵、敏感访问审计与时间序）
- 包与配置契约（`ConfigurationManagerValidation`、`BoundaryErrorTesting`、`LoggerValidation`：常量、配置默认值、错误码与日志字段）
- 契约一致性（`CommonEventUtilValidation`、`DialogStateManagerValidation`、`FocusManagerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对触屏与遥控等操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusNavigation`、`FocusRingBehavior`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`DataBinding`）
- 弹窗定位与内容缩放、布局与滚动边界（`DialogPositioning`、`ContentScaling`、`UIComponentRendering`）
- 主题与对比度（`ThemeVariation`、`VisualEffects`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断分享类应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混沌回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、状态标签、文本可读性与时延上界
- 资产可审计：`List.test.ets` 统一登记 78 个套件，分类完整、名称唯一，便于覆盖度审计
- 测试资产可复用：`CustomShareDriver`、统一页面回归前置与串行/让出策略便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 78 个套件（合计 1600 条用例），按测试意图分组如下：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 共享驱动 | 1（非套件） | — | `Shared/CustomShareDriver.ets`：串行 UI 队列、页面回归、文本/组件轮询、遥控与触摸模拟、弹窗探针、时延与容差常量、重试与路径记录 |
| 分享组件 `ShareComponent` | 16 | 320 | `ShareDialogUI`、`ShareDialogLifecycle`、`ShareDialogStateManagement`、`ShareDialogConcurrency`、`ShareDialogConsistency`、`ShareDialogEndToEnd`、`ShareDialogErrorRecovery`、`ShareDialogStress`、`ShareInputInteraction`、`ShareTemplateModel`、`ShareMenuConfiguration`、`ShareModelDeep`、`ShareOperationCatalog`、`ShareOperationFlow`、`ShareOperations`、`ShareOperationWorkflow`：弹窗 UI/生命周期/状态/并发/一致性/端到端/异常恢复/压力、输入交互、模板与菜单模型、操作目录与流程 |
| 分享校验 `ShareValidation` | 8 | 160 | `ShareAppVersion`、`ShareAuthSession`、`ShareDataSourceValidation`、`ShareEventUtilValidation`、`ShareInterruptionRecovery`、`ShareNotification`、`ShareOfflineNetwork`、`ShareSessionValidation`：版本与鉴权会话、数据源与事件工具、中断恢复、通知、离线网络、会话校验 |
| 集成与场景 `Integration` | 9 | 189 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`ShareCompatibility`、`SystemIntegration`、`UserScenarios`：高级/用户场景、综合回归、设备与分享兼容、本地化、网络连通、系统集成 |

| 交互与可达性 `Interaction` | 14 | 294 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`DialogPositioning`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects`：无障碍与焦点、按钮/触摸/手势、事件分发、弹窗定位、内容缩放、主题与视觉 |
| 生命周期与状态 `LifecycleState` | 10 | 210 | `ConfigurationChanges`、`DialogLifecycle`、`DialogStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycle`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`：配置变更、弹窗生命周期/状态、错误与异常恢复、扩展与资源、会话与状态持久化/恢复 |
| 性能与长稳 `PerformanceStability` | 7 | 147 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`SharePerformance`、`SharePowerConsumption`：动画/分享性能、并发控制、长稳、内存泄漏、压力、功耗 |
| 安全与合规 `Security` | 3 | 60 | `ShareSecurity`、`SecurityAccessibility`、`SecurityValidation`：隐私与泄露、无障碍安全、权限与审计 |
| 校验能力 `Validation` | 11 | 220 | `AnimationControllerValidation`、`BoundaryErrorTesting`、`CommonEventUtilValidation`、`ConfigurationManagerValidation`、`DialogStateManagerValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`：控制器/边界/事件/配置/弹窗状态/焦点/输入/键码/日志/指针/资源加载等契约校验 |
| 合计 | 78 | 1600 | — |

## 7. 结论

`CustomShare` 当前测试设计已经形成「共享驱动 + 领域校验 + 真实场景 + 非功能质量」的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为分享类应用后续持续集成、版本回归和测试审计的核心基础。

在当前设备（OpenHarmony）实测：`Tests run: 1600, Failure: 0, Error: 0, Pass: 1600`，`TestFinished-ResultCode: 0`。

## 附录：手工用例归档

> 以下为需在真机上配合伴生 Chat 应用与系统能力验证的手工用例（自动化用例见正文）；因依赖外部应用/系统权限，未纳入自动化聚合清单。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 1. 需在真机测试 <br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动 | 启动应用 | 成功拉起应用并显示主页 | 否 | Pass |
| 获取权限 | 位于系统权限弹窗 | 点击允许 | 进入主页 | 否 | Pass |
| 文本+链接分享（打开弹窗） | 位于主页 | 点击文本+链接分享按钮 | 打开分享弹窗（含 `toShare` 区域） | 否 | Pass |
| 文本+链接分享（拉起 Chat） | 位于分享弹窗 | 点击 Chat | 拉起 Chat 应用 | 否 | Pass |
| 文本+链接分享（发给好友） | 位于 Chat 主页 | 点击朋友0 | 好友聊天页出现分享内容 | 否 | Pass |
| 文本+链接分享（生成海报/截图） | 位于分享弹窗 | 点击生成海报 -> 点击截图并分享 | 出现「截图成功! 分享加载中...」提示 | 否 | Pass |
| 应用内文件分享 | 位于主页/分享弹窗 | 点击应用内文件分享并按 Chat 流程操作 | 文件分享成功并返回主页 | 否 | Pass |
| 第三方应用分享 | 位于主页/分享弹窗 | 点击第三方应用分享并按 Chat 流程操作 | 分享成功并返回主页 | 否 | Pass |
| 分享模板（返回） | 位于分享弹窗 | 点击返回 | 回到分享主页 | 否 | Pass |
| 分享模板（文本分享-返回） | 位于分享弹窗 | 点击文本分享，点击返回 | 回到分享主页 | 否 | Pass |
| 分享模板（留在文本分享） | 位于分享弹窗 | 点击文本分享，点击留在文本分享 | 进入文本页面 | 否 | Pass |
| 分享模板（文本编辑） | 位于分享弹窗 | 点击文本编辑 | 进入文本编辑应用 | 否 | Pass |
