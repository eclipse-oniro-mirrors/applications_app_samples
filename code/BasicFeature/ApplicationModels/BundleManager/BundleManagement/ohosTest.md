# BundleManagement 测试说明

> 本说明面向 `com.samples.bundlemanagement`（OpenHarmony BundleManagement 能力示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `BundleManagement` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 测试框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面回归与拉起（`launchBundleManagerApp`、`launchNewAbility`、`waitForPageStable`）、文本与组件轮询（`checkTextContent`、`checkAnyTextContent`、`collectVisibleTexts`、`componentCountByType`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、按键与触摸模拟（`pressAndWait`、`simulateTouch`、`swipeVertical`）以及页面/模块/键码/超时/容差等常量（`GROUP_TITLES`、`MENU_LABELS`、`BUNDLE_FLAGS`、`KEY_*`、`TIMEOUT_*`、`TOLERANCE_*`）。
- 领域层：围绕 Bundle 信息模型、BundleFlag 组合、Profile 查询、abc 校验、链接校验、默认应用判定、Overlay 状态与信息等纯逻辑展开确定性单元测试，系统依赖通过自包含的 `BundleDomainModel` 桩对象与纯函数隔离，保证用例无需真实系统调用即可稳定执行。
- 场景层：模拟示例页各入口行为，包括获取 BundleInfo（异步/同步/组合参数）、按 Ability/ExtensionAbility 获取 Profile、校验/删除 abc、校验链接可打开性、判断默认应用、设置 Overlay 使能、获取 OverlayModuleInfo、获取目标 Overlay 模块信息，以及 EntryAbility/NewAbility/NewUIExtAbility 的入口与生命周期。
- 质量层：补充并发与长稳、性能时延、资源占用、安全与可访问性、集成与用户场景、本地化与设备兼容等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记并调用全部测试套件，按分类组织（BundleInfo、BundleValidation、Validation、Interaction、LifecycleState、PerformanceStability、Security、Integration），便于统一运行与按需裁剪。
- 统一驱动能力：所有 UI 相关套件复用 `SharedDriver` 的页面回归、文本轮询与按键/触摸模拟，避免各套件重复实现 UI 驱动细节。
- 自包含领域模型：各套件内以 `BundleDomainModel` 统一封装 BundleFlag 组合与计数、BundleInfo 构建、Profile 返回、abc 校验、链接校验、默认应用判定、Overlay 使能与信息、错误码映射，降低套件间耦合，单文件即可独立编译运行。
- 串行化 UI 队列：所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢失。
- 结果可审计：`BundleDomainModel` 提供 `hasFlag/countFlags`、`errorCodeForScenario/errorMessage`、`buildError` 等确定性断言辅助，保证覆盖度可在不跑真机的情况下审阅。
- 日志规范：统一使用 `@kit.PerformanceAnalysisKit` 的 `hilog`，日志文案使用英文，禁止 `console.log`，满足工程编码规范。

通过复用共享驱动与统一领域模型，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`BundleInfo` 16、`BundleValidation` 8、`Validation` 11、`Interaction` 14、`LifecycleState` 10、`PerformanceStability` 7、`Security` 3、`Integration` 9，共 78 个测试套件（另有共享驱动 `SharedDriver` 与真实 API 冒烟 `Ability.test`）。
- BundleFlag 矩阵：`ABILITY / HAP_MODULE / APPLICATION / METADATA / EXTENSION_ABILITY / REQUESTED_PERMISSION / SKILL / APP_INFO / SIGNATURE` 的单项、组合与计数。
- 模块 × 能力矩阵：`entry / libraryOverlay / libraryRuntimeOverlay` × `EntryAbility / NewAbility / NewUIExtAbility`。
- Profile 查询矩阵：`getProfileByAbility(Sync)` 与 `getProfileByExtensionAbility(Sync)` × 合法/非法模块名、Ability 名、metadata 名。
- 链接矩阵：`http / https / ftp / file` 等 scheme 组合与非法输入。
- 默认应用矩阵：`BROWSER / AUDIO / VIDEO / IMAGE / EMAIL` 等 `ApplicationType` 的判定组合。
- Overlay 矩阵：`libraryOverlay / libraryRuntimeOverlay` × 使能/禁用 × `getOverlayModuleInfo / getTargetOverlayModuleInfos` × 优先级。
- 错误码矩阵：`401 / 17700001 / 17700002 / 17700026 / 17700040 / 17700060` 等场景错误到码值的映射与异常捕获。

矩阵化设计用于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ts`：`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground/onWindowStageCreate 生命周期、系统栏属性设置）。
- 首页入口（`pages/Index.ets`：分组标题与菜单项、点击回调、List 滚动与分组渲染）。
- BundleInfo 获取（`bundleManager.getBundleInfoForSelf`、`getBundleInfoForSelfSync` 及多 Flag 组合）。
- Profile 查询（`bundleManager.getProfileByAbility(Sync)`、`getProfileByExtensionAbility(Sync)`）。
- abc 校验/删除（`bundleManager.verifyAbc / deleteAbc`，仅 API 18 及以前可用；API 23 已移除）。
- 链接校验（`bundleManager.canOpenLink`：`http` scheme）。
- 默认应用（`defaultAppManager.isDefaultApplication(Sync)`）。
- Overlay 能力（`overlay.setOverlayEnabled`、`overlay.getOverlayModuleInfo`、`overlay.getTargetOverlayModuleInfos`）。
- 快捷入口与扩展（`newability/NewAbility.ts` + `pages/NewPage.ets`、`newuiextability/NewUIExtAbility.ets`）。
- 资源与配置（`resources/base|zh_CN|en_US`、`main_pages.json`、`shortcuts_config.json`、`module.json5`、`AppScope/app.json5`）。

### 3.2 关键风险点

围绕 BundleManager 示例能力，重点识别如下风险：

- 获取 BundleInfo 时 Flag 组合错误，导致返回字段缺失或类型不符。
- 同步/异步接口行为不一致，异常分支未捕获导致页面无响应。
- Profile 查询模块名/Ability 名/metadata 名非法时返回空或抛错未处理。
- abc 路径非法、文件不存在或 API 版本差异导致校验/删除失败。
- 链接 scheme 不合法时 `canOpenLink` 判定异常。
- 默认应用类型越界或系统无默认应用时的兜底缺失。
- Overlay 模块未安装/未使能时 `setOverlayEnabled`、`getOverlayModuleInfo`、`getTargetOverlayModuleInfos` 返回异常未处理。
- 扩展 Ability（NewUIExtAbility）会话创建、页面加载与销毁顺序异常。
- 中英文资源缺失、未绑定字段渲染为 `undefined/null`。
- 长跑遍历大量入口时的资源占用、内存增长与状态残留。
- 敏感信息（路径、签名、bundle 信息）在日志中的泄露。

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，分组标题与菜单项成对出现。
- 各菜单项点击回调触发对应 API 调用分支，成功路径返回数据并提示。
- BundleInfo 字段（bundleName、versionCode、versionName、ability/module 列表、enabled）完整且类型正确。
- BundleFlag 单项、组合与计数（`hasFlag`/`countFlags`）符合预期。
- Profile 按 Ability/ExtensionAbility 查询返回结构正确。
- abc 校验/删除的正向与负向路径返回符合预期（API 18）。
- `canOpenLink` 对合法/非法 scheme 判定正确。
- 默认应用判定按 `ApplicationType` 返回正确结果。
- Overlay 使能/禁用状态切换、OverlayModuleInfo 与目标 Overlay 列表字段与优先级正确。
- 资源与文案在中英文下均可正常展示，断言可命中。

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- BundleFlag 非法组合、空组合与越界处理。
- Profile 查询传入非法模块名/Ability 名/metadata 名。
- abc 路径为空、非法后缀、文件缺失。
- 链接为空、缺失 scheme、非白名单 scheme。
- 默认应用类型非法或系统无默认应用。
- Overlay 模块名为空、模块未安装、未使能。
- 业务错误码（`401/17700001/...`）到异常对象的映射与 `try/catch` 捕获。
- 恢复校验：失败后状态回到稳定基线，返回值与错误码一致，不产生脏数据。

异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

- 高频调用 BundleInfo/Profile/Overlay 接口时的状态一致性。
- 连续 Overlay 使能/禁用切换后状态收敛。
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）。
- 并发场景下的资源占用与结果可重复性（`ConcurrencyControl`）。

### 4.4 性能与兼容性

- 关注 BundleInfo/Profile 查询、Overlay 操作的耗时上界与稳定性。
- 对同一操作序列多次采样，断言均值与最大值，避免单次抖动被平均值掩盖。
- 覆盖 API 版本差异（API 18 与 API 23 的 `verifyAbc/deleteAbc` 差异、syscap 差异）。
- 覆盖不同 `deviceTypes`（default/tablet）与叠加多模块（entry + overlay HSP）的安装与运行差异。

### 4.5 安全与契约

- 输入清洗与校验（`InputValidation`：路径、URL、模块名、空值）。
- 链接白名单与 scheme 校验（`LinkSchemeValidation`）。
- 敏感信息与日志脱敏（`LoggerValidation`、`BundleSecurity`），日志不输出密钥/签名/绝对路径等敏感数据。
- 包与配置契约（bundleName、版本号、ability/module 声明、overlay 依赖一致性）。
- 错误码契约（错误码与消息映射稳定，避免接口漂移）。

### 4.6 可达性与易用性

- 焦点导航与焦点环（`FocusNavigation`、`FocusRingBehavior`、`AccessibilityNavigation`）。
- 按钮、触摸、手势与事件分发（`MenuButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）。
- 内容缩放、布局定位与数据绑定（`ContentScaling`、`PageLayoutPositioning`、`DataBinding`）。
- 主题与视觉动效（`ThemeVariation`、`VisualEffects`）。
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- 覆盖层次完整：从共享驱动层到领域校验层、场景回归层与质量层都有对应测试。
- 覆盖维度齐全：功能、异常、并发、性能、契约、兼容、可访问性与资源均已纳入。
- 覆盖方式多样：单点验证、组合矩阵、多采样统计、桩对象隔离并存。
- 数据校验细化：不仅校验返回值是否存在，还校验字段、标志位、计数、错误码、Overlay 状态与优先级。
- 资产可审计：分类清晰、命名规范，`List.test.ets` 统一登记，套件职责单一，便于按功能裁剪与扩展。
- 测试资产可复用：`SharedDriver` 与统一领域模型便于继续扩展而不破坏既有结构。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册全部套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：串行 UI 队列、页面回归、文本/组件轮询、按键与触摸模拟、超时与容差常量 |
| BundleInfo 主流程 | 16 | `BundleInfoUI`、`BundleInfoOperations`、`BundleInfoModel`、`BundleInfoModelDeep`、`BundleFlagConfiguration`、`ProfileQueryInteraction`、`BundleOperationFlow/Workflow/Catalog`、`BundleInfoLifecycle/StateManagement/Concurrency/Consistency/EndToEnd/ErrorRecovery/Stress`：BundleInfo 字段与版本、Flag 组合与计数、Profile 查询、Overlay/链接/默认应用/错误码等 |
| BundleValidation 校验 | 8 | `BundleAppVersion`、`BundleAuthSession`、`BundleDataSourceValidation`、`BundleEventToolValidation`、`BundleInterruptionRecovery`、`BundleNotification`、`BundleOfflineNetwork`、`BundleSessionValidation` |
| Validation 契约 | 11 | `OverlayStateValidation`、`DefaultAppValidation`、`LinkSchemeValidation`、`BoundaryErrorTesting`、`InputValidation`、`ConfigurationManagerValidation`、`BundleStateManagerValidation`、`FocusManagerValidation`、`LoggerValidation`、`ResourceLoaderValidation`、`BundleEventValidation` |
| Interaction 交互 | 14 | `AccessibilityNavigation`、`MenuButtonInteraction`、`ContentScaling`、`DataBinding`、`PageLayoutPositioning`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects` |
| LifecycleState 生命周期 | 10 | `PageLifecycle`、`AppStateManagement`、`ConfigurationChanges`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`ExtensionLifecycle`、`ResourceManagement`、`ErrorRecovery`、`ExceptionHandling` |
| PerformanceStability 性能 | 7 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`ResourceConsumption`、`PerformanceBenchmark` |
| Security 安全 | 3 | `BundleSecurity`、`SecurityAccessibility`、`SecurityValidation` |
| Integration 集成 | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`BundleCompatibility`、`SystemIntegration`、`UserScenarios` |
| 真实 API 冒烟 | 1 | `Ability.test.ets`：基于 UiTest 驱动真实页面入口的重启/点击冒烟，随 `List.test.ets` 统一调度 |

## 7. 结论

`BundleManagement` 当前测试设计已经形成“共享驱动 + 领域校验 + 场景回归 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 BundleManager 能力示例后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归纳

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 获取当前应用 BundleInfo（异步） | 1. 需在真机测试<br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动 | 进入主页点击“获取BundleInfo” | 调用 `getBundleInfoForSelf` 成功，页面正常展示字符串文本 | 是 | Pass |
| 获取当前应用 BundleInfo（同步） | 同上 | 点击“获取BundleInfo(sync)” | 调用 `getBundleInfoForSelfSync` 成功，页面正常展示字符串文本 | 是 | Pass |
| 获取 BundleInfo 组合参数 | 同上 | 点击“获取BundleInfo(组合参数)” | 多 Flag 组合调用成功，返回字段完整 | 是 | Pass |
| 按 Ability 获取配置 | 同上 | 点击“获取配置json” | `getProfileByAbility` 成功，页面正常展示字符串文本 | 是 | Pass |
| 按 Ability 获取配置（同步） | 同上 | 点击“获取配置json(sync)” | `getProfileByAbilitySync` 成功，页面正常展示字符串文本 | 是 | Pass |
| 按 ExtensionAbility 获取配置 | 同上 | 点击“获取配置数组” | `getProfileByExtensionAbility` 成功，页面正常展示字符串文本 | 是 | Pass |
| 按 ExtensionAbility 获取配置（同步） | 同上 | 点击“获取配置数组(sync)” | `getProfileByExtensionAbilitySync` 成功，页面正常展示字符串文本 | 是 | Pass |
| 校验 abc 文件 | 1. 将 abc 文件放到 `/data/app/el1/bundle/public/com.samples.bundlemanagement/`<br/>2. 拉起示例页面（仅 API 18 及以前） | 点击“校验.abc文件” | `verifyAbc` 成功，页面正常展示字符串文本 | 否 | Pass |
| 删除 abc 文件 | 1. 同“校验 abc 文件”<br/>2. 拉起示例页面（仅 API 18 及以前） | 点击“删除.abc文件” | `deleteAbc` 成功，页面正常展示字符串文本 | 否 | Pass |
| 校验链接可打开 | 1. 拉起示例页面 | 点击“校验链接是否可打开” | `canOpenLink` 成功，页面正常展示字符串文本 | 是 | Pass |
| 判断默认应用 | 1. 拉起示例页面 | 点击“判断默认应用” | `isDefaultApplication` 成功，页面正常展示字符串文本 | 是 | Pass |
| 判断默认应用（同步） | 1. 拉起示例页面 | 点击“判断默认应用(sync)” | `isDefaultApplicationSync` 成功，页面正常展示字符串文本 | 是 | Pass |
| 设置 Overlay 使能状态 | 1. 拉起 Overlay 示例页面，按静态 overlay 脚本安装共享 HSP | 点击“设置禁用使能状态” | `setOverlayEnabled` 成功，页面正常展示字符串文本 | 是 | Pass |
| 获取 OverlayModuleInfo | 1. 拉起 OverlayModuleInfo 示例页面 | 点击“获取overlayModuleInfo信息” | `getOverlayModuleInfo` 成功，页面正常展示字符串文本 | 是 | Pass |
| 获取目标 Overlay 模块信息 | 1. 拉起 OverlayModuleInfo 示例页面 | 点击“获取多条overlayModuleInfo信息” | `getTargetOverlayModuleInfos` 成功，页面正常展示字符串文本 | 是 | Pass |
