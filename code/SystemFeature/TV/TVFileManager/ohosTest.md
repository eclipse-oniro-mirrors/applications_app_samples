# TVFileManager 测试说明

> 本说明面向 `TVFileManager`（OpenHarmony 智慧屏 / TV 文件管理器）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVFileManager` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/TestDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、遥控按键触发（`pressKey`、`pressKeyTimes`、`triggerSerializedKey`）、页面与列表探针（`isHomePageVisible`、`isFileListVisible`、`waitForText`、`waitForId`、`waitForStableCount`、`nonEmptyTextCount`）、焦点检查（`hasFocusedComponent`、`currentFocusIndex`、`navigateAndCheckFocus`）、对话框探针（`isConfirmDialogVisible`、`isRenameDialogVisible`、`isProgressDialogVisible`）、存储空间读取（`readStorageSummary`）、页面回归（`backToHome`、`launchEntryAbility`）与系统权限面板处理（`grantAppPermissions`）等可复用资产；`Shared/TestData.ets` 提供 `createFileInfo`、`createBean`、`createRootInfo` 与视频/音频/图片名称样本，`Shared/TestAssert.ets` 提供字符串、数组、区间与异常类断言封装
- 领域层：围绕文件模型（`FileBean`、`FileInfo`）、后缀分类（`ConstantsMedia` 中的 `SUFFIX_VIDEO`/`SUFFIX_AUDIO`/`SUFFIX_IMAGE` 与 `checkSuffix`）、文件操作状态机（浏览/多选/复制/移动）、导航栈常量与页面栈语义（`NavPathStackManager`）、存储与压缩（`StorageManager`、`CompressManager`）、权限（`Permission`）、工具函数（`Tools`、`FileUtil`、`DateTools`、`SubtitleHelper`、`lpx`、`PixelUnitConversion`）等纯逻辑展开确定性单元测试，系统依赖通过桩对象或纯函数隔离
- 场景层：模拟应用启动、首页媒体分类入口与"本机/外部储存"Tab 切换、目录进入与返回、文件列表遥控器焦点导航、新建/重命名/删除/复制/移动、覆盖确认与进度对话框、搜索、存储空间展示、文件分享等真实 TV 文件管理场景
- 质量层：补充性能时延、压力与长稳、中断与错误恢复、无障碍与焦点可达性、中英文资源、内容缩放与设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 通过 `testsuiteGroups` 统一登记 99 个套件并按固定顺序执行，使覆盖度可在不跑真机的情况下审计
- 统一驱动能力：所有 UI 套件复用 `TestDriver` 的页面探针、文本轮询、按键模拟与对话框识别，避免各套件重复实现 UI 驱动细节
- 权限面板前置处理：应用启动时会申请媒体与存储权限，系统权限面板为多页结构，`grantAppPermissions` 逐页点击"允许"，避免权限弹窗遮挡导致的假通过或半授权后应用自行退出
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程让出：延时统一走 `serializedDelay`，避免同步阻塞触发长跑看门狗
- 组件计数避坑：计数按 `Text`/`List`/`ListItem` 等具名类型统计（`countByType`、`isFileListVisible`），而非依赖通配查询
- 测试数据工厂：`createBean`/`createFileInfo`/`createRootInfo` 构造字段完整的对象，避免用例依赖 `undefined` 字段；`VIDEO_NAMES`、`AUDIO_NAMES`、`IMAGE_NAMES` 同时包含大小写后缀样本，用于验证忽略大小写的分类逻辑

通过复用驱动工具、页面回归前置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`FileManager` 16、`FileValidation` 8、`Integration` 9、`Interaction` 15、`LifecycleState` 12、`PerformanceStability` 7、`Security` 3，另加根目录公共与单元套件 29，共 99 个套件
- 后缀矩阵（`Exhaustive_Suffix_Test`：视频/音频/图片/文本后缀全覆盖、大小写、`endsWith` 语义与跨分类不重叠）
- 文件列表状态机矩阵（`FileList_StateMachine_Test`：浏览、多选、复制、移动、菜单配置、删除、分享、重命名）
- 导航栈矩阵（`NavPathStack_Deep_Test`：完整状态空间、栈操作、设备切换、状态监听、面包屑、退出判断、返回链路）
- 按键矩阵（`FocusNavigation`、`FocusRingBehavior`：方向键、ENTER、BACK、MENU 的合法/非法与连按组合）
- 设备矩阵（`DeviceCompatibility`、`FileCompatibility`、`FileAccessManager_Deep_Test`：本机/外部存储 × `deviceType` × `mode` × `deviceFlags` 分支）
- 压力矩阵（`Stress_Mock_Test_001`、`Comprehensive_Stress_Test`、`FileStress`：大数据量列表 × 并发操作 × 高频导航 × 长时间运行）
- 参数化矩阵（`Parameterized_DataDrive_Test`：同一逻辑以数据驱动方式展开多组输入输出）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground 生命周期、`AppStorage` 标记）
- 页面导航（`pages/Index.ets`：`TABS` 定义的"本机/外部储存"Tab（`index_0`/`index_1`）、`NavStack` 页面栈与面包屑、返回键语义、权限申请（`Permission.checkAndRequest`）与存储空间刷新事件（`CHECK_EXTERNAL`/`REFRESH_SPACE_SIZE`）；`pages/Home.ets`：视频/图片/文档/音频/设备分类网格与焦点选中态）
- 文件列表（`pages/FileList.ets`：目录进入前的空目录判断、文件列表焦点切换与滚动、操作菜单与多选、图片/音频/视频跳转 Want、不支持格式的 Toast 提示）
- 文件操作对话框（`component/dialog`：`CreateFileDialog`、`RenameDialog`、`RenameFileDialog`、`DeleteDialog`、`OverrideDialog`、`ProgressDialog`，覆盖取消/确认按钮 id 与文案契约）
- 搜索与存储展示（`component/StorageSpaceComponent.ets` 在文件列表顶部展示空间信息；`component/SearchBar.ets` 搜索栏组件契约）
- 文件访问与管理（`FileAccessManager`、`FileIoManager`、`UserFileManager`、`FileTaskPool`、`StorageManager`、`CompressManager`、`AbilityManager`、`NavPathStackManager`）
- 数据模型与常量（`FileBean`、`FileInfo`、`DeviceType`、`MediaType`、`Operation`、`PageType`、`Constants`、`ConstantsMedia`）
- 工具与跳转（`Tools`、`FileUtil`、`DateTools`、`SubtitleHelper`、`lpx`、`PixelUnitConversion`、`InputKeyEventUtils`、`MLog`、`Permission`、`FileJumpTools`）
- 资源与配置（`resources/base|zh_CN|en_US`、media 图标、`main_pages.json`、`module.json5`、`syscap.json`）

### 3.2 关键风险点

围绕 TV 大屏文件管理场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致入口点击或按键无效
- 系统权限面板多页遮挡应用，造成首页探针假通过或半授权后应用退出
- 焦点丢失、焦点落点错位，或进入子目录后焦点未注入导致遥控器不可用
- 外部存储未挂载、挂载中或运行中拔出导致的列表异常与崩溃
- 后缀分类漏判/误判（大小写、双后缀、无后缀、超长文件名）
- 复制/移动同名覆盖未拦截，或覆盖确认被绕过造成数据丢失
- 大文件复制/移动的进度、取消、失败残留与目标目录脏数据
- 重命名非法字符、空名称、超长名称未拦截
- 删除确认被误触、删除后列表与存储统计不一致
- 搜索无结果、空关键词、特殊字符输入下的空白页或崩溃
- 长跑过程中 UI 操作并发、同步阻塞导致主线程卡死
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 分享/跳转 Want 中携带多余 uri 授权，或路径穿越导致的越权访问

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，分类入口与 Tab 成对出现
- "本机/外部储存" Tab 切换后的列表内容与选中态同步
- 分类入口过滤结果与后缀分类规则一致（视频/图片/文档/音频）
- 目录进入、返回上级、面包屑与返回键语义正确
- 新建文件夹/新建文件、重命名、删除的名称回填与结果校验
- 复制/移动的源与目标目录、同名覆盖确认、取消后状态回滚
- 进度对话框出现、进度变化与取消后的残留清理
- 搜索命中、搜索无结果与清空关键词后的列表恢复
- 存储空间组件的总量/可用量文本格式与刷新
- 分享跳转 Want 的 action、type、uri 与授权标志
- 遥控器方向键、ENTER、BACK、MENU 的焦点移动与触发结果
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 空目录、无权限目录、路径不存在、超长路径
- 同名文件/文件夹冲突、只读文件、非法文件名
- 外部存储未挂载、挂载中、运行中移除
- 非法按键码、越界坐标、超屏坐标注入
- 存储空间不足、复制/移动中断、任务取消
- 快速连续按键、交替按键、重复点击后的状态一致性
- 前后台切换、页面重建与状态恢复

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（首页入口或列表首项）
- 页面是否回到稳定基线（首页可交互、子页标记消失）
- 列表数量与索引是否一致，避免重复实例或残留项
- 失败操作的目标目录是否被清理，源文件是否保持可访问

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续执行导航、快速按键、连续操作等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`FocusNavigation`、`Stress_Mock_Test_001`）
- 连续目录进出与入口反复切换（`PageLifecycle`、`AdvancedScenarios`）
- 多任务并发（`FileTaskPool_Test`、`ConcurrencyControl`、`Comprehensive_Stress_Test`）
- 长链路混合动作回放（`LongTermStability`、`Stress_Mock_Test_001` 的长时间运行模拟）
- 长链路执行期间的串行化与主线程让出（`runSerializedUiOperation`、`serializedDelay`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录页面渲染、列表渲染、对话框渲染、焦点切换、搜索响应等多类时延，预算常量集中在 `TestDriver`（页面 600ms、列表 800ms、对话框 500ms、焦点 500ms、搜索 600ms）
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢（如 `FilePerformance` 中的分类与格式化耗时断言）
- 覆盖大批量文件分类、存储查询、缩略图生成等高频路径（`FileStress`、`StoragePerformance`、`AnimationPerformance`）
- 观察内存增长斜率与帧率波动（`MemoryLeakDetection`、`AnimationPerformance`）
- 在内容缩放、分辨率变化、主题变化、中英文资源下重复执行（`ContentScaling`、`ConfigurationChanges`、`LocalizationTesting`）
- 覆盖本机存储与外部存储的设备差异与能力门禁（`DeviceCompatibility`、`FileCompatibility`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 分享与跳转契约（`FileSecurity`：Want 的 action/type/uri 与只读授权范围）
- 权限与授权（`PermissionGrant`、`Permission_Model_Test`：申请、授予、拒绝与撤销后的能力降级）
- 路径与输入约束（`SecurityValidation`、`Boundary_Edge_Test_001`：路径穿越、非法文件名、名称与后缀边界）
- 数据完整性（`FileConsistency`、`DataModels_Test`：模型字段、标志位与字节格式化的一致性）
- 接口与常量契约（`Extended_Managers_Test`、`FileAccessManager_Deep_Test`：方法签名、静态映射分支、空上下文守卫）
- 兼容与安全回归（`Security_Compat_Test`、`SecurityAccessibility`：旧版本行为兼容与无障碍信息不泄露敏感数据）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusRingBehavior`、`FocusNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 数据绑定与界面刷新（`DataBinding`、`UIComponentRendering`、`VisualEffects`）
- 内容缩放、布局测量与滚动边界（`ContentScaling`）
- 对话框位置与层级（`DialogPositioning`、`DialogLifecycle`）
- 主题与对比度（`ThemeVariation`）
- 中英文文案与资源完整性（`LocalizationTesting`）

这部分是判断 TV 大屏文件管理器可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、压力回放、桩对象隔离与数据驱动并存
- 数据校验细化：不仅校验页面是否存在，还校验焦点、组件数量、对话框 id、存储文本与耗时上界
- 测试资产可复用：`TestDriver`、`TestData`、`TestAssert` 与统一页面回归前置便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 99 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 3 | `Shared/TestDriver.ets`：串行 UI 队列、按键与延时、页面/列表/对话框探针、焦点检查、权限面板处理、时延与容差常量；`Shared/TestData.ets`：`FileInfo`/`FileBean`/`RootInfo` 构造与后缀样本；`Shared/TestAssert.ets`：字符串、数组、区间与异常断言封装 |
| 文件管理场景 `FileManager` | 16 | `FileManagerUI`、`FileOperations`、`FileOperationFlow`、`FileOperationWorkflow`、`FileOperationCatalog`、`FileMenuConfiguration`、`FileInputInteraction`、`FileBeanModel`、`FileModelDeep`、`FileStateManagement`、`FilePageLifecycle`、`FileConcurrency`、`FileConsistency`、`FileEndToEnd`、`FileErrorRecovery`、`FileStress`：首页与列表渲染、各类文件操作链路、菜单与对话框契约、模型与状态、并发与一致性、压力路径 |
| 校验与数据 `FileValidation` | 8 | `FileAppVersion`、`FileAuthSession`、`FileDataSourceValidation`、`FileEventToolValidation`、`FileInterruptionRecovery`、`FileNotification`、`FileOfflineNetwork`、`FileSessionValidation`：版本常量、授权会话、数据源行为、事件工具、中断恢复、通知与网络/离线表现 |
| 集成与场景 `Integration` | 9 | `UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`DeviceCompatibility`、`FileCompatibility`、`LocalizationTesting`、`NetworkConnectivity`：真实用户路径、跨模块集成、设备与语言兼容、回归链路 |
| 交互与可达性 `Interaction` | 15 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`DataBinding`、`PermissionGrant`、`AccessibilityNavigation`、`ThemeVariation`、`VisualEffects`、`ContentScaling`、`DialogPositioning`、`UIComponentRendering`：遥控器焦点、触摸与手势、事件分发、权限授予、无障碍、主题与渲染 |
| 生命周期与状态 `LifecycleState` | 12 | `PageLifecycle`、`Index_Lifecycle`、`EntryAbility_Lifecycle_Test`、`DialogLifecycle`、`DialogStateManagement`、`StatePersistence`、`StateRecovery`、`PageStateManagement`、`SessionManagement`、`ResourceManagement`、`ExceptionHandling`、`ConfigurationChanges`：页面与 Ability 生命周期、对话框状态、状态持久化与恢复、资源释放、配置变化 |
| 性能与长稳 `PerformanceStability` | 7 | `FilePerformance`、`StoragePerformance`、`AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`：分类与存储查询耗时、动画与并发、长稳与内存、性能压力 |
| 安全与合规 `Security` | 3 | `FileSecurity`、`SecurityValidation`、`SecurityAccessibility`：分享 Want 契约、输入与路径安全、无障碍信息脱敏 |
| 公共与单元套件（根目录） | 29 | `Ability`、`Adapters_Dialogs_Test_001/002`（`BasicDataSource`、`FileDataSource` 与菜单状态）、`Boundary_Edge_Test_001`（模型与后缀边界、字节转换、标志位）、`Comprehensive_Boundary_Test`、`Comprehensive_Stress_Test`、`Comprehensive_UI_State_Test`、`DataModels_Test`、`Dialog_Component_Test`、`Exhaustive_Suffix_Test`（四类后缀全矩阵与跨分类不重叠）、`Extended_Managers_Test`、`FileAccessManager_Deep_Test`（方法签名、媒体类型分发、静态映射分支、空上下文守卫）、`FileList_StateMachine_Test`（浏览/多选/复制/移动/删除/分享/重命名状态机）、`FileTaskPool_Test`（构造、执行、取消、回调、并发、缩略图）、`FileUtil_Test`（缓存目录、缩略图、图片尺寸）、`Managers_Adv_Test`、`Managers_Core_Test_001/002`、`Mock_Stub_Test`（桩对象与故障注入、端到端 Mock）、`NavPathStack_Deep_Test`（状态空间、栈操作、设备切换、面包屑、退出与返回链）、`Parameterized_DataDrive_Test`、`Permission_Model_Test`、`Security_Compat_Test`、`Share_Workflow_Test`、`Stress_Mock_Test_001`（大规模数据源、并发、高频导航、长时间运行）、`Utils_Test_001/002`（`Tools`、`DateTools`、`SubtitleHelper`） |

## 7. 结论

`TVFileManager` 当前测试设计已经形成"共享驱动 + 领域校验 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 文件管理器后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 首页媒体分类入口展示 | 应用正常运行 | 进入首页 | 显示视频、图片、文档、音频、设备五个分类入口 | 否 | Pass |
| 本机存储 Tab 切换 | 应用正常运行 | 点击"本机"Tab | 显示本机存储文件列表 | 否 | Pass |
| 外部存储 Tab 切换 | 应用正常运行且外部存储已挂载 | 点击"外部储存"Tab | 显示外部存储文件列表 | 否 | Pass |
| 外部存储未挂载时切换 Tab | 应用正常运行且无外部存储 | 点击"外部储存"Tab | 提示无外部存储设备或列表为空 | 否 | Pass |
| 视频分类浏览 | 应用正常运行且本机存在视频文件 | 点击视频分类入口 | 展示本机所有视频文件 | 否 | Pass |
| 图片分类浏览 | 应用正常运行且本机存在图片文件 | 点击图片分类入口 | 展示本机所有图片文件 | 否 | Pass |
| 文档分类浏览 | 应用正常运行且本机存在文档文件 | 点击文档分类入口 | 展示本机所有文档文件 | 否 | Pass |
| 音频分类浏览 | 应用正常运行且本机存在音频文件 | 点击音频分类入口 | 展示本机所有音频文件 | 否 | Pass |
| 文件列表进入子目录 | 应用正常运行 | 点击文件列表中的文件夹 | 进入该文件夹，展示子目录内容 | 否 | Pass |
| 文件列表返回上级目录 | 应用正常运行且已进入子目录 | 点击返回 | 返回上级目录，展示上级目录内容 | 否 | Pass |
| 创建文件夹 | 应用正常运行 | 点击新建文件夹，输入名称并确认 | 在当前目录下创建指定名称的文件夹 | 否 | Pass |
| 创建文件 | 应用正常运行 | 点击新建文件，输入名称并确认 | 在当前目录下创建指定名称的文件 | 否 | Pass |
| 重命名文件 | 应用正常运行 | 选中文件，点击重命名，输入新名称并确认 | 文件名称更新为新名称 | 否 | Pass |
| 重命名文件夹 | 应用正常运行 | 选中文件夹，点击重命名，输入新名称并确认 | 文件夹名称更新为新名称 | 否 | Pass |
| 删除文件 | 应用正常运行 | 选中文件，点击删除并确认 | 文件被移入回收站，列表中不再显示 | 否 | Pass |
| 删除文件夹 | 应用正常运行 | 选中文件夹，点击删除并确认 | 文件夹及其内容被移入回收站 | 否 | Pass |
| 复制文件 | 应用正常运行 | 选中文件，点击复制，选择目标目录并确认 | 文件被复制到目标目录 | 否 | Pass |
| 移动文件 | 应用正常运行 | 选中文件，点击移动，选择目标目录并确认 | 文件被移动到目标目录，原目录不再显示 | 否 | Pass |
| 复制文件覆盖确认 | 目标目录已存在同名文件 | 复制文件到目标目录 | 弹出覆盖确认对话框 | 否 | Pass |
| 移动文件覆盖确认 | 目标目录已存在同名文件 | 移动文件到目标目录 | 弹出覆盖确认对话框 | 否 | Pass |
| 文件操作进度展示 | 执行大文件复制或移动 | 点击复制/移动 | 弹出进度对话框，展示操作进度 | 否 | Pass |
| 搜索文件 | 应用正常运行 | 在 SearchBar 输入关键词 | 展示匹配的文件列表 | 否 | Pass |
| 搜索无结果 | 应用正常运行 | 输入不存在的文件名 | 显示无搜索结果提示 | 否 | Pass |
| 存储空间展示 | 应用正常运行 | 查看 StorageSpaceComponent | 正确显示本机/外部存储的可用空间和总空间 | 否 | Pass |
| 文件分享 | 应用正常运行且已授权 | 选中文件，点击分享 | 文件分享功能正常执行 | 否 | Pass |
| TV 遥控器焦点切换 | 应用正常运行 | 使用遥控器方向键 | 焦点在组件间正确切换 | 否 | Pass |
| 文件访问权限未授予 | 应用初次启动且未授予权限 | 进入应用 | 弹出权限申请提示 | 否 | Pass |
| 文件访问权限被拒绝 | 用户拒绝文件读写权限 | 尝试浏览文件 | 提示权限不足，无法访问 | 否 | Pass |
| 外部存储设备突然移除 | 正在浏览外部存储文件 | 拔出外部存储设备 | 提示存储设备已移除，返回本机存储 | 否 | Pass |
| 空目录展示 | 进入无文件的目录 | 浏览空目录 | 显示空目录提示 | 否 | Pass |
