# TVDemonstration 测试说明

> 本说明面向 `TVDemonstration`（OpenHarmony 智慧屏 TV 演示应用）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVDemonstration` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `TestScenarioUtils.ets` 为核心，提供应用启动重试（`startAppWithRetry`）、组件轮询等待（`waitForComponentById`、`waitForRootTabBar`）、遥控按键场景构建（`buildRemoteScenarios`、`buildCheckpointPaths`、`buildCheckpointIndexPaths`）、混沌路径构建（`buildChaosScenarios`）与可见文本敏感信息扫描（`scanVisibleText`）；`MainThreadYield.ets` 提供主线程让出能力，`DetailIndexPolicy.ts` 提供详情索引策略
- 领域层：围绕屏幕对角线计算（`calculateScreenDiagonalInches`）、详情索引与非法索引回退、领域数据装配（Domain* 套件）、动画工具、包信息与备份配置等核心逻辑展开确定性单元测试；显示相关用例通过手写 `display.Display` 桩对象隔离系统依赖
- 场景层：模拟应用启动、底部 Tab 切换、产品规格浏览、功能特性列表/详情、智慧生活列表/视频详情、服务支持轮播、全局屏保触发与退出、返回栈回退等真实 TV 使用场景
- 质量层：补充性能时延、压力与长稳、混沌恢复、无障碍、资源完整性、旋转/分辨率兼容、包身份与备份等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- `TestScenarioUtils.ets`：74 个测试套件复用，统一封装应用启动、根 Tab 等待、场景路径生成与敏感文本扫描，避免各套件重复实现 UI 驱动细节
- 统一的 `restoreRoot` 前置：每个场景套件在 `beforeEach` 中循环 `router.back()` 回到首页并断言 `tab0` 存在，保证用例之间互不污染
- 真实生产单例注入：屏保用例不伪造定时器，而是调用 `globalIdle.init(context, idleTime)` 注入短超时（如 400 ms），在保留真实定时、路由跳转与 `router.back` 链路的前提下缩短等待；用例结束后恢复生产阈值 5 分钟并停止检测
- 启动重试安全策略：`startAppWithRetry` 对自有 bundle 不做 ability 强停（force-stop）（会连带杀死 ohosTest 进程），仅对外部 bundle 强停后重试，并采用退避重试
- 主线程节流：纯逻辑矩阵套件不产生原生异步等待，`keepMainThreadResponsive` 每 500 ms 让出一次主线程，规避 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 文本扫描双重计数：`scanVisibleText` 同时返回 `textCount` 与 `matchCount`，避免 UI 树为空时"零命中"被误判为安全

通过复用驱动工具、恢复前置和启动/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 显示对角线 × DPI 矩阵（`DisplayDiagonalMatrixContract.test.ets`、`DisplayDiagonalStubContract.test.ets`、`ProductSpecDiagonalExpandedMatrix.test.ets`、`DisplayPropertyExpandedMatrix.test.ets`）
- 旋转角度 × 分辨率矩阵（`ResolutionRotationMatrixContract.test.ets`、`RotationLayoutContract.test.ets`、`RotationContentStabilityContract.test.ets`）
- 产品规格取值矩阵与几何布局矩阵（`ProductSpecValueMatrixContract.test.ets`、`ProductSpecDeepGeometryContract.test.ets`）
- 详情索引策略矩阵（`DetailIndexPolicyMatrixContract.test.ets`、`DetailIndexPolicyExpandedMatrix.test.ets`：合法索引、越界索引、非法索引回退）
- 遥控路径矩阵（`buildCheckpointPaths` 四方向、`buildCheckpointIndexPaths` 0~3 Tab、`buildRemoteScenarios` 方向/确认/混合序列）
- 混沌路由序列（`buildChaosScenarios`、`ExpandedChaosRecovery.test.ets`、`ChaosRecoveryLifecycleContract.test.ets`、`CrossDomainDeepChainContract.test.ets`）
- 资源 × 语言矩阵（`ResourceExhaustiveMatrixContract.test.ets`、`ResourceStringExpandedMatrix.test.ets`、`ResourceLocaleParityExpandedMatrix.test.ets`、`ResourceLocaleConsistencyMatrixContract.test.ets`：base/dark/zh_CN/en_US）
- 包元数据与身份矩阵（`BundleMetadataMatrixContract.test.ets`、`BundleIdentityExpandedMatrix.test.ets`）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground/onNewWant 生命周期、`AppStorage` 标记）
- 底部导航（`pages/Index.ets`：四个 Tab、`@State currentTab` 条件渲染、`focusControl.requestFocus('tab0'~'tab3')`、前后台恢复焦点）
- 产品规格（`pages/ProductSpecPage.ets`：按 `deviceInfo` 型号切换 6780/6320 参数组；`calculateScreenDiagonalInches` 基于屏幕宽高、`densityDPI`、`densityPixels` 计算对角线）
- 功能特性（`pages/FeaturePage.ets` 七大特性卡片；`Component/FeatureComponent.ets` 的 Swiper 详情、路由参数 `index` 定位、约 100 ms 焦点交接定时器、左右箭头翻页）
- 智慧生活（`pages/SmartLifePage.ets` 三大场景卡片；`Component/SmartLifeComponent.ets` 视频自动播放、`currentIndex` 按需加载、切页暂停）
- 影音与视频（`pages/MediaExperiencePage.ets`、`Video/VideoPage.ets`：播放/停止切换与进度节点显隐）
- 服务支持（`pages/SupportPage.ets`：Swiper 轮播、`SwiperController.showNext/showPrevious`、左右箭头与方向键切换）
- 全局屏保（`utils/GlobalScreenSaver.ets` 单例 `GlobalIdleDetector`：生产阈值 5 分钟、可注入、记录触发来源页、停止/重置/跳转暂停；`pages/ScreenSaver.ets` 三图 5 秒轮播、任意按键/触摸/悬停退出并按来源页返回）
- 资源与配置（`resources/base|dark|en_US|zh_CN`、media 图片、rawfile 视频、`main_pages.json`、`module.json5`、`syscap.json`）
- 备份扩展（`entrybackupability/EntryBackupAbility.ets` 与 `backup_config.json`）

### 3.2 关键风险点

围绕 TV 智慧屏演示场景，重点识别如下风险：

- 启动失败、首帧渲染慢或前后台切换后状态未恢复
- Tab 焦点丢失、焦点落点错位或返回 Tab 后焦点未恢复
- 详情路由参数非法导致空白页、索引越界或焦点停留在占位节点
- 视频播放状态残留、切页未暂停、进度节点未按预期显隐
- 屏保误触发、无法退出、退出后返回错误页面或闲置检测未停止
- 轮播到达边界后箭头失效或内容与索引不一致
- 旋转、分辨率变化下布局越界、文本截断或根 Tab 丢失
- 资源缺失、语言不一致、未绑定字段渲染为 `undefined`/`null`/`NaN`
- UI 树节点完全匿名导致读屏无可播报信息
- 纯逻辑矩阵长时间占用主线程触发 `THREAD_BLOCK_6S`，导致测试进程被系统终止
- 测试启动阶段残留会话导致 `startAbility failed`，或强停自有 bundle 杀死测试进程

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，四个 Tab 与标题成对出现
- 产品规格参数按设备型号分支正确，屏幕对角线计算结果与矩阵期望一致
- Tab 点击/方向键切换，内容区与选中态同步更新
- 功能特性卡片数量、详情索引、左右翻页与焦点交接
- 智慧生活场景卡片、详情视频自动播放与切页暂停
- 服务支持轮播、左右箭头与方向键切换
- 遥控器方向导航、ENTER/DPAD_CENTER 确认、焦点高亮与焦点归属
- 鼠标悬停/点击与按键交错输入
- 屏保超时触发、来源页记录、任意输入退出与精准返回
- 返回栈语义、后台/前台切换、最近任务与窗口显示
- 备份扩展与备份配置文件有效性

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法/越界路由索引注入（详情初始页回退到第一个占位节点）
- 非法显示参数（宽高或 DPI 非正时对角线计算返回 0）
- 非法按键码、越界坐标、超屏坐标注入
- 资源缺失、空文本与占位符（`undefined`/`null`/`NaN`）扫描
- 快速连续按键、交替按键、重复点击后的状态一致性
- 混沌路由序列与跨域深链后的页面恢复
- 前后台切换、`AppStorage` 状态持久化与返回栈恢复

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（如 `tab0` 或第一个卡片）
- 页面是否回到稳定基线（`router.getState()` 与 `tab0` 存在性）
- 详情/列表组件数量与索引是否一致，避免重复实例
- 屏保检测器是否已停止或恢复，来源页记录是否清空
- 资源文本是否可读，是否出现空白节点或未绑定占位符

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续执行导航、切换 Tab、快速按键等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`PerformanceTimingContract.test.ets` 中快速按键不放大后续时延的用例）
- 快速 Tab 切换与连续路由跳转（`PressureResilienceContract.test.ets`）
- 跨域深链与长链路回放（`CrossDomainDeepChainContract.test.ets`、`ExpandedChaosRecovery.test.ets`）
- 混沌后的生命周期恢复（`ChaosRecoveryLifecycleContract.test.ets`、`ExpandedRecovery.test.ets`）
- 长链路执行期间的主线程让出（`MainThreadYield.ets`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录冷/热启动、路由跳转、焦点转移、Tab 切换、ENTER 确认、约 100 ms 焦点交接、媒体进度节点等多类时延
- 采用限时上界断言（启动 10 s、路由 3 s、焦点/Tab 2 s、ENTER 3 s、焦点交接 300 ms、媒体进度 1.5 s），上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列采样三次，同时断言均值与最大值，避免单次抖动被平均值掩盖
- 在 0/90/180/270 度旋转、多种分辨率、深色模式、中英文资源下重复执行
- 校验显示属性（宽高交换、DPI、密度）与窗口状态在旋转后的一致性

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 可见文本敏感信息扫描（`A11yTreeIntegrityContract.test.ets` 复用 `scanVisibleText`，覆盖 password/token/secret/apikey/authorization/cookie/sessionid/privatekey）
- UI 树完整性契约（节点的 id/text/type 至少一项可播报，避免完全匿名节点）
- 包身份与元数据契约（`BundleContract.test.ets`、`BundleMetadataMatrixContract.test.ets`、`BundleIdentityExpandedMatrix.test.ets`：bundleName、abilityName、设备类型）
- 文件备份契约（`FileBackupContract.test.ets` 与 `backup_config.json` 一致性）
- 领域装配契约（`DomainWiringContract.test.ets`：功能、智慧生活、产品规格、服务支持数据源与页面联动）
- 按键与手势参数契约（`KeyEventFullDomainContract.test.ets`、`GestureSwipeParameterContract.test.ets`、`PointerDeepContract.test.ets`）
- 资源键与语言包契约（`ResourceContract.test.ets`、`ResourceLocaleConsistencyMatrixContract.test.ets`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍树完整性与可播报字段（`A11yTreeIntegrityContract.test.ets`、`ExpandedAccessibility.test.ets`）
- 全局文本可读性扫描（`GlobalReadabilitySweepContract.test.ets`：可读、空白、占位符三类统计）
- 焦点高亮、卡片放大与焦点归属（`CardFocusScaleContract.test.ets`、`FocusOwnershipContract.test.ets`、`TabBarFocusRestoreMatrixContract.test.ets`）
- 详情页可读性与焦点占位（`DetailReadabilityMatrixContract.test.ets`、`DetailFocusPlaceholderMatrixContract.test.ets`）
- 布局在多种分辨率、旋转与内容缩放下是否越界（`LayoutRenderContract.test.ets`、`ProductSpecDeepGeometryContract.test.ets`）

这部分是判断 TV 大屏可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混沌回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、路由状态、文本可读性与时延上界
- 测试资产可复用：`TestScenarioUtils`、统一 `restoreRoot` 前置与主线程节流策略便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，采用平铺结构，由 `List.test.ets` 统一注册 74 个套件，按测试意图分组如下（同一套件可能跨组）：

| 分组 | 代表套件与职责 |
|---|---|
| 共享驱动 | `TestScenarioUtils.ets`、`MainThreadYield.ets`、`DetailIndexPolicy.ts`：启动重试、组件轮询、路径矩阵构建、文本扫描、主线程节流、索引策略 |
| 启动与生命周期 | `BootstrapContract`、`LifecycleLaunchContract`、`AbilityLifecycleContract`、`AbilityForegroundContract`、`IndexHomeBehaviorContract`、`MissionRecentContract`：启动、前后台、最近任务与首页可交互 |
| 导航与焦点 | `IndexRouterContract`、`CrossDomainDeepChainContract`、`BackStackSemanticsContract`、`AppStoragePersistenceContract`、`TabBarFocusRestoreMatrixContract`、`FocusOwnershipContract`、`CardFocusScaleContract`、`ExpandedFocus`、`ExpandedNavigation`：路由、返回栈、Tab 焦点恢复与焦点归属 |
| 产品规格 | `DomainProduct`、`DisplayDiagonalMatrixContract`、`DisplayDiagonalStubContract`、`ProductSpecDiagonalExpandedMatrix`、`DisplayPropertyExpandedMatrix`、`ProductSpecValueMatrixContract`、`ProductSpecDeepGeometryContract`：型号分支、对角线计算、规格取值与几何布局 |
| 功能特性 | `DomainFeature`、`CatalogPagesContract`、`DetailContract`、`DetailIndexPolicyMatrixContract`、`DetailIndexPolicyExpandedMatrix`、`DetailSwipeTraversalContract`、`DetailReadabilityMatrixContract`、`DetailFocusPlaceholderMatrixContract`、`ExpandedFeatureCatalog`、`ExpandedFeatureDetail`：七大特性列表、详情索引、滑动遍历与可读性 |
| 智慧生活与媒体 | `DomainSmart`、`SmartLifeContract`、`ExpandedSmartCatalog`、`ExpandedSmartDetail`、`MediaVideoContract`、`MediaIntegrityContract`、`MediaPayloadExpandedMatrix`、`ExpandedMedia`：三场景卡片、视频播放状态与媒体资源完整性 |
| 服务支持 | `DomainSupport`、`SupportPageContract`、`ExpandedSupportCarousel`：轮播内容、箭头切换与边界行为 |
| 屏保 | `ScreenSaverContract`：超时触发、来源页记录、任意输入退出与检测器恢复 |
| 资源与无障碍 | `ResourceContract`、`ResourceExhaustiveMatrixContract`、`ResourceStringExpandedMatrix`、`ResourceLocaleParityExpandedMatrix`、`ResourceLocaleConsistencyMatrixContract`、`ExpandedResourceText`、`A11yTreeIntegrityContract`、`ExpandedAccessibility`、`GlobalReadabilitySweepContract`：资源键、多语言一致性、无障碍与文本可读性 |
| 兼容与窗口 | `ResolutionRotationMatrixContract`、`RotationLayoutContract`、`RotationContentStabilityContract`、`WindowDisplayContract`、`SystemStatusBarContract`：旋转、分辨率、窗口与状态栏 |
| 质量与契约 | `PerformanceTimingContract`、`PressureResilienceContract`、`ExpandedChaosRecovery`、`ChaosRecoveryLifecycleContract`、`ExpandedRecovery`、`BundleContract`、`BundleMetadataMatrixContract`、`BundleIdentityExpandedMatrix`、`DomainWiringContract`、`FileBackupContract`、`AnimationUtilsContract`、`KeyEventFullDomainContract`、`GestureSwipeParameterContract`、`PointerDeepContract`、`IndexHoverKeyInterleaveContract`：性能、压力、混沌恢复、包身份、备份与输入契约 |

## 7. 结论

`TVDemonstration` 当前测试设计已经形成"共享驱动 + 领域算法 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为智慧屏演示应用后续持续集成、版本回归和测试审计的核心基础。
