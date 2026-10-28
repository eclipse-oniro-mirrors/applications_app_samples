# LavalBetaClub 测试说明

> 本说明面向 `TVLavalBetaClub`（OpenHarmony 智慧屏 / TV 问题提单应用）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVLavalBetaClub` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/BetaClubDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面回归（`ensureHomePage`、`backToHome`）、三大入口导航（`openCreateIssuePage`、`openIssueListPage`、`openIntroductionPage`）、文本与组件轮询（`waitForText`、`waitForAnyText`、`checkTextContains`、`componentCount`）、焦点检查（`checkFocusState`）、遥控按键与触摸模拟（`pressAndWait`、`simulateTouch`、`simulateSwipe`）、系统权限弹窗处理（`dismissPermissionDialog`）以及 `RetryPolicy`、`NavigationPathTracker`、`FocusLatencyAnalyzer`、`ComponentTypeCounter`、`HomeMenuFocusTracker`、`IssueTextValidator`、`withTimeout` 等可复用资产
- 领域层：围绕问题单模型（`IssueDetailInfo`：问题概率、问题类型、附件、处理状态）、表单校验规则、存储键与接口常量、日志采集与压缩、状态编解码、权限策略、包元数据等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟应用启动、首页三入口切换、遥控器焦点导航、新建问题单填写与提交、问题单列表分页浏览、问题详情与操作历史、使用说明、附件选择与预览等真实 TV 提单场景
- 质量层：补充性能时延、压力与长稳、混沌/断网恢复、无障碍、中英文资源、内容缩放与设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 通过 `SUITE_MANIFEST` 统一登记 112 个套件（名称、分类、能力描述、工厂函数），并提供 `validateManifest`、`countByCategory`、`findSuite` 自检用例，使覆盖度可在不跑真机的情况下审计
- 统一驱动能力：所有 UI 套件复用 `BetaClubDriver` 的页面回归、文本轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 返回优先而非重启：`ensureHomePage` 在检测到应用已在子页时优先连续 `router.back()` 回首页，只有确实不在应用内才重新拉起 `EntryAbility`，避免长链路执行时堆叠 ability 实例导致测试进程被杀
- 权限弹窗前置处理：应用首次访问相册会弹出系统权限窗口，`dismissPermissionDialog` 在任何首页探针之前关闭该窗口，避免"弹窗标题与应用页头同名"造成的假通过
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程节流：`serializedDelay` 使用 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 组件计数避坑：`componentCount` 按 `Text/Image/List` 具名类型统计，避免 TV 版本不支持 `'*'` 通配查询导致的空结果与全量无障碍树转储开销
- 双语文本候选：`TEXT_CREATE_ISSUE_CANDIDATES` 等候选数组同时兼容中英文资源，保证语言切换后断言仍可命中

通过复用驱动工具、页面回归前置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`core` 4、`lifecycle` 16、`validation` 24、`interaction` 20、`integration` 14、`performance` 14、`security` 15、`issue-validation` 5，共 112 个套件
- 表单取值矩阵（`IssueFormValidation`：问题概率 0~3、问题类型枚举、故障时间 14 位数字、描述 0/1024 边界、附件 0/4 数量与 100MB 上限）
- 按键矩阵（`KeyCodeMatrixValidation`、`HomeMenuFocusNavigation`：方向键、ENTER、TAB、BACK 与数字键的合法/非法组合）
- 权限矩阵（`PermissionValidation`：权限授予/拒绝/撤销 × 功能开关 × 审计记录）
- 安全矩阵（`ThreatModelValidation`、`ComplianceMatrix`、`SecurityHeaderValidation`：威胁项 × 缓解措施 × 发布门禁）
- 设备与兼容矩阵（`DeviceCompatibility`、`CompatibilityRegression`：rk3568/大屏 × 输入方式 × 特性门禁）
- 资源 × 语言矩阵（`LocalizationIntegration`、`ResourceLoaderValidation`：base/zh_CN/en_US 与资源名/类型/缓存回退）
- 离线恢复矩阵（`OfflineNetwork`、`OfflineRecovery`：离线队列 × 重试次数 × 缓存回退 × 过期丢弃）
- 功耗与热矩阵（`PowerPerformance`、`ThermalPerformance`、`PowerBudgetValidation`：功耗状态 × CPU 负载 × 温控降级）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground/onNewWant 生命周期、`AppStorage` 标记）
- 首页导航（`pages/Index.ets`：应用标题、新建问题单/问题单列表/使用说明三个入口、`@State` 选中态、方向键与鼠标悬停焦点切换）
- 新建问题单（`pages/IssueReporter/IssueReporterAdd.ets`：问题概率四档、故障日期与故障时间选择、问题类型列表、问题描述 TextArea、附件选择与缩略图、日志采集与压缩上传、必填校验与提交门禁）
- 问题单列表（`pages/IssueReporter/views/IssueReporterList.ets`：分页加载、new 标记、失败/待重提状态、KV 与 preferences 离线缓存、焦点滚动）
- 问题单详情（`pages/IssueReporter/IssueReporterDetail.ets`：问题单号、概率、类型、创建时间、问题描述、操作历史）
- 失败重提（失败问题单回填原表单并重新提交）
- 附件能力（`IssueAttachment`：相册选择、图片放大预览、视频播放、删除与数量限制）
- 使用说明（`pages/IssueReporter/UseIntroduction.ets`：预设条件与操作步骤）
- 资源与配置（`resources/base|zh_CN|en_US`、media 图片与图标、`main_pages.json`、`module.json5`、`syscap.json`）
- 网络与日志（列表查询、详情查询、问题单提交、附件上传、hilog/faultlog 采集与 zip 压缩）

### 3.2 关键风险点

围绕 TV 大屏问题提单场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致入口点击无效
- 系统权限弹窗遮挡应用，造成首页探针假通过或长链路失败
- 首页入口焦点丢失、焦点落点错位或进入子页后焦点未注入
- 必填项校验漏拦（概率/类型/故障时间/描述），产生脏数据或空提交
- 附件数量或大小超限未拦截，上传阶段失败或占用过大内存
- 日志采集路径缺失、重复故障日志未去重、压缩失败导致上传中断
- 列表分页越界、缓存与远端数据不一致、new 状态未及时清除
- 详情路由参数非法导致空白页或操作历史错序
- 断网、弱网、请求超时下的崩溃、重复提交与状态残留
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 敏感信息（token、设备标识、手机号、路径）在日志或界面泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，标题与三个入口成对出现
- 首页入口鼠标点击与遥控器方向键/ENTER 双向可达，选中态与内容区同步
- 新建问题单各字段可正常填写，概率四档与类型列表回填正确
- 故障日期与时间选择结果按约定格式回填，非法格式被拒绝
- 问题描述长度边界（空、正常、1024、超限）与超限提示
- 附件选择 0~4 个、总量 100MB 边界、缩略图展示与删除
- 日志采集覆盖 hilog/faultlog 复制、按时间戳保留最新、去重与 zip 压缩
- 提交成功返回列表并提示，提交失败标记状态且可重提
- 列表分页加载、滚动、new 标记与状态标签展示
- 问题详情字段完整性与操作历史顺序
- 使用说明内容展示与返回键退出
- 返回栈语义、前后台切换、最近任务与窗口显示
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 必填项缺失、字段非法值、超长描述、超限附件等负向输入
- 非法路由参数与列表越界索引注入
- 非法按键码、越界坐标、超屏坐标注入
- 断网、超时、5xx、响应体结构异常与空列表
- 快速连续按键、交替按键、重复点击后的状态一致性
- 采集中断、上传中断后的断点与重试
- 前后台切换、状态恢复与草稿缓存恢复
- 数据损坏、校验和不匹配后的修复与隔离

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（首页入口或列表首项）
- 页面是否回到稳定基线（首页标题存在、子页标记消失）
- 列表数量与索引是否一致，避免重复实例
- 失败问题单是否可回填并重提，状态标签是否更新
- 离线队列是否按序重放，过期项是否被丢弃

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续执行导航、切换入口、快速按键等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`HomeMenuFocusNavigation`、`FocusRingBehavior`）
- 连续路由跳转与入口反复进出（`IssuePageLifecycle`、`AdvancedScenarios`）
- 提交与列表刷新并发、上传与页面返回并发（`ConcurrencyControl`）
- 长链路混合动作回放（`LongTermStability`、`EnduranceTesting`）
- 长链路执行期间的主线程让出（`serializedDelay`、`withTimeout`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录冷/热启动、页面渲染、列表加载、焦点切换、提交上传等多类时延，预算常量集中在 `BetaClubDriver`（页面渲染 2s、冷启动 6s、列表加载 3s、上传 5s、焦点切换 500ms）
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值，避免单次抖动被平均值掩盖
- 校验启动 TTID/TTFD 预算、帧率与卡顿率、内存水位与泄漏斜率
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖 rk3568 与 TV 大屏的设备差异与特性门禁

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入清洗（`InputSanitizerValidation`：控制字符、HTML、空白、截断与脱敏）
- 输入校验（`InputValidation`：问题描述、手机号、文件名、URL 参数）
- 敏感信息与隐私（`PrivacyCompliance`、`BetaClubSecurity`：token、设备标识、路径穿越、URL 白名单与日志脱敏）
- 加密与存储（`CryptoValidation`、`EncryptionValidation`、`SecureStorageValidation`：校验和、Base64、密钥长度、存储配额）
- 权限与审计（`PermissionValidation`、`AuditLogValidation`：授权矩阵、敏感访问审计与时间序）
- 包与配置契约（`KeyConstantValidation`、`ConfigurationConsistency`、`SchemaValidation`、`DataIntegrityValidation`）
- 威胁与合规门禁（`ThreatModelValidation`、`ComplianceMatrix`、`SecurityHeaderValidation`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`AccessibilityFocusTesting`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusRingBehavior`、`HomeMenuFocusNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`GestureSequence`、`EventHandling`、`EventPropagation`、`EventDispatchQueue`）
- 文本输入与遥控键盘（`InputMethodTesting`）
- 内容缩放、布局测量与滚动边界（`ContentScaling`、`LayoutMeasurement`、`ScrollBehavior`）
- 主题与对比度（`ThemeVariation`、`VisualEffects`）
- 中英文文案与资源完整性（`LocalizationIntegration`、`ResourceLoaderValidation`）

这部分是判断 TV 大屏提单应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混沌回放、多采样统计、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、状态标签、文本可读性与时延上界
- 资产可审计：`SUITE_MANIFEST` 对 112 个套件的名称唯一性、分类完整性与描述有效性做自检
- 测试资产可复用：`BetaClubDriver`、统一 `ensureHomePage` 前置与串行/节流策略便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 112 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/BetaClubDriver.ets`：串行 UI 队列、页面回归、文本/组件轮询、遥控与触摸模拟、权限弹窗处理、时延与容差常量、重试与路径记录 |
| 核心主流程 `core` | 4 | `AbilityTest`、`IssueReporterUI`、`IssueFormValidation`、`IssueModelDeep`：启动冒烟、首页三入口渲染与导航、表单规则与提交门禁、问题单模型与状态 |
| 校验与契约 `validation` | 24 | `KeyConstantValidation`、`FocusManagerValidation`、`ConfigurationManagerValidation`、`PayloadSizeValidation`、`ReportConsistency`、`EndToEndValidation`、`SchemaValidation`、`ResourceBudgetValidation`、`InputSanitizerValidation`、`NumberUtilValidation`、`BoundaryErrorTesting`、`DialogStateManagerValidation`、`LogManagerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`、`AnimationControllerValidation`、`ConfigurationConsistency`、`DataIntegrityValidation`、`FileUtilValidation`、`KeyCodeMatrixValidation`、`LoadUtilValidation`、`LoggerValidation`、`StringUtilValidation`、`DateUtilValidation` |
| 生命周期与状态 `lifecycle` | 16 | `AppLifecycle`、`AppStatePersistence`、`IssuePageLifecycle`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`WindowLifecycle`、`DialogLifecycle`、`ExtensionLifecycle`、`LifecycleOrder`、`ProcessLifecycle`、`ResourceManagement`、`ResourceRelease`、`ErrorRecovery`、`ExceptionHandling`、`ConfigurationChanges` |
| 交互与可达性 `interaction` | 20 | `HomeMenuFocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`GestureSequence`、`EventHandling`、`EventPropagation`、`EventDispatchQueue`、`InputMethodTesting`、`AccessibilityNavigation`、`AccessibilityFocusTesting`、`ThemeVariation`、`VisualEffects`、`ContentScaling`、`LayoutMeasurement`、`ScrollBehavior`、`UIComponentRendering`、`DialogPositioning`、`AnimationSequencing` |
| 集成与场景 `integration` | 14 | `NetworkIntegration`、`NetworkConnectivity`、`OfflineNetwork`、`OfflineRecovery`、`UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`CompatibilityRegression`、`DeviceCompatibility`、`LocalizationIntegration`、`DataMigration`、`EnduranceTesting` |
| 性能与长稳 `performance` | 14 | `StartupPerformance`、`IssueSubmitPerformance`、`FpsStability`、`AnimationPerformance`、`MemoryPressure`、`MemoryLeakDetection`、`ConcurrencyControl`、`LongTermStability`、`PowerConsumption`、`PowerPerformance`、`PowerBudgetValidation`、`BatteryDrainModel`、`CpuLoadProfile`、`ThermalPerformance` |
| 安全与合规 `security` | 15 | `BetaClubSecurity`、`SecurityValidation`、`SecurityAccessibility`、`InputValidation`、`PrivacyCompliance`、`PermissionValidation`、`CommonEventUtilValidation`、`DeviceSecurity`、`CryptoValidation`、`EncryptionValidation`、`SecureStorageValidation`、`SecurityHeaderValidation`、`ThreatModelValidation`、`ComplianceMatrix`、`AuditLogValidation` |
| 问题单专项 `issue-validation` | 5 | `IssueSessionValidation`、`IssueOperationRecord`、`IssueDataSourceValidation`、`IssueInterruptionRecovery`、`IssueConfigurationValidation`：会话与草稿、操作历史、响应封装与缓存回退、中断恢复、配置默认值与限流 |

## 7. 结论

`TVLavalBetaClub` 当前测试设计已经形成"共享驱动 + 领域校验 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 问题提单应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 新建问题单填写功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 设备已正常启动 | 从问题概率依次填写到附件上传 | 各个选项都能正常填写内容 | 否 | Pass |
| 新建问题单提交功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 设备已正常启动 | 1、带*选项全部填写点击提交<br>2、遗留*号选项不填写直接提交 | 1、问题单能提交成功并返回首页<br>2、弹出提示对应选项未填写 | 否 | Pass |
| 问题单上传功能 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 问题单填写完毕提交 | 填写问题单选项提交 | 返回至首页，弹出提示框上传问题单是否成功 | 否 | Pass |
| 问题单列表展示 | 1. 需在真机测试 <br/> 2. 构建并安装测试hap <br/> 3. 已提交问题单 | 首页进入问题单列表选项 | 显示已提交的问题单 | 否 | Pass |
