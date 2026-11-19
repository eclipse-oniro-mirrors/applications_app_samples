# JS注入与执行 测试说明

> 本说明面向 `RunJsInWeb`（OpenHarmony WebView JS 注入与执行示例 / H5 打砖块游戏）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `RunJsInWeb` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、串行延时（`serializedDelay`）、页面探针与拉起（`triggerGamePage`、`waitForGamePageStable`、`isGamePageVisible`、`launchGameApp`）、文本与组件轮询（`checkTextContent`、`findComponentsByType`、`checkComponentExists`、`gameComponentCount`、`summarizePage`）、控件定位（`findButtonByLabel`、`clickButtonByLabel`、`getButtonLabels`、`countButtonsByLabel`、`hasAllControls`、`isHorizontalControlLayout`）、焦点检查（`getCurrentFocusIndex`、`checkFocusState`、`isComponentFocused`）、按键与触摸模拟（`pressAndWait`、`triggerSerializedKey`、`simulateTouch`）、几何与时延度量（`getComponentBounds`、`measureLatency`、`waitUntil`）以及超时/延时/压力轮次常量
- 领域层：围绕注入脚本模型（`GameScript`、`ScriptCatalog`、`InjectionPipeline`、`ScriptPayloadBuilder`）、游戏状态机（`GameSession`）、挡板与小球（`PaddleModel`、`BallModel`）、Web 配置（`WebSettingsProfile`）、三列布局（`LayoutProfile`）、页面加载记录（`PageLoadRecord`）、性能采样（`PerformanceSampler`）、配置快照（`ConfigSnapshot`）、重试策略（`RetryPolicy`）等纯逻辑展开确定性单元测试，系统依赖通过纯函数与本地模型隔离
- 场景层：模拟应用启动、四个控制按钮（Start / L / R / Reset）渲染与点击、长按重复注入、遥控器方向键与 ENTER/BACK 导航、Web 页面加载后注入 `removeDesc`、断网与恢复、前后台切换与配置变化等真实使用路径
- 质量层：补充启动与注入时延、压力与长稳、内存水位、动画帧率与功耗、无障碍、主题与对比度、中英文资源、设备与平台兼容、URL 与脚本安全等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 作为唯一注册入口，按目录分组登记 78 个套件（WebGame 16、Interaction 14、LifecycleState 10、PerformanceStability 7、Integration 9、Security 3、Validation 11、WebValidation 8），一次 测试命令 即可全量执行
- 统一驱动能力：各 UI 套件复用 `SharedDriver` 的页面探针、串行队列与按键/触摸模拟，避免重复实现 UiTest 细节
- 串行化 UI 队列：UiTest 服务端不接受并发请求（`findComponent` / `triggerKey` / `delayMs` 不能重叠），所有操作与延时统一进入 `_uiOperationQueue` 串行执行，消除焦点竞争与丢键
- 页面稳定前置：`triggerGamePage` 在套件 `beforeAll` 中先等待页面沉降，未检测到 `Start/L/R/Reset` 控件时再通过 `launchGameApp` 拉起 `EntryAbility`，`waitForGamePageStable` 在超时后仅重试一次，避免长链路堆叠 ability 实例导致测试进程被杀
- 组件计数避坑：`gameComponentCount` 优先使用 `ON.type('*')` 通配统计，部分 UiTest 版本不展开通配时回退为 `Button/Text/Web/Row/Column` 具名类型求和，避免空结果导致的假失败
- 单节点容错：`checkTextContent`、`getButtonLabels`、`getCurrentFocusIndex` 等遍历型探针在单个节点读取失败时记录日志并继续，避免一个异常节点中断整轮扫描
- 领域模型复用：`GameModel.ets` 中的脚本目录、状态机、布局与配置模型被多个套件共享，同一业务规则只需维护一份期望值
- 公共工具复用：`GameTestKit.ets`（`UrlParts`、`GeometryBox`、`CircularBuffer`、`CommandQueue`、`TokenBucket`）与 `TestHelpers.ets`（`UrlInspector`、`EventBus`、`KeySequenceMatcher`、`ErrorClassifier`、`GestureClassifier`、`SnapshotStore`、`ThemeResolver`、`LayoutMetricsCollector`）为多个套件提供无副作用的分析能力

通过复用驱动工具、统一页面前置与串行策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`WebGame` 16 个套件 / 865 条用例、`Interaction` 14/751、`LifecycleState` 10/438、`PerformanceStability` 7/277、`Integration` 9/269、`Security` 3/95、`Validation` 11/848、`WebValidation` 8/462，合计 78 个套件、4005 条用例
- 控制矩阵（`ButtonInteraction`、`GameControlFlow`、`WebGameInputInteraction`：Start/L/R/Reset × 点击/长按/重复长按 × 状态合法/非法）
- 状态矩阵（`GameOperations`、`GameModelDeep`、`WebGameStateManagement`：START/RUNNING/GAMEOVER × start/reset × 忽略计数与历史顺序）
- 按键矩阵（`KeyCodeValidation`、`FocusNavigation`：方向键、ENTER、TAB、BACK、HOME 与非法键码组合）
- 注入脚本矩阵（`GameScriptCatalog`、`WebGameConfiguration`：5 段脚本 × trace 前缀 / 入口引用 / 括号配平 / 安全字符）
- 布局矩阵（`WebViewPositioning`、`LayoutMeasurement` 相关能力、`ContentScaling`：左 10% / 中 80% / 右 10% × 分辨率与缩放 × 按钮 50×100）
- 网络与恢复矩阵（`NetworkConnectivity`、`WebOfflineNetwork`、`WebInterruptionRecovery`：离线/超时/5xx/响应异常 × 重试次数 × 预算判定）
- 安全矩阵（`WebSecurity`、`SecurityValidation`、`SecurityUsability`：HTTPS 域名白名单 × `javascript:` 前缀校验 × 控制字符与转义注入）
- 资源 × 语言矩阵（`LocalizationTesting`、`ResourceLoaderValidation`：base/zh_CN/en_US × 资源名/类型/缺失回退）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ts`：`windowStage.loadContent('pages/Index')`、onCreate/onWindowStageCreate/onForeground/onBackground/onWindowStageDestroy 生命周期日志）
- 页面骨架（`pages/Index.ets`：三列 `Row` 布局，左列 `Start` 与 `L`、中列 `Web`、右列 `Reset` 与 `R`）
- JS 注入（`@State gameStart/gameLeft/gameRight/gameReset/removeDesc` 五段脚本，经 `controller.loadUrl("javascript:" + script)` 执行，`try/catch` 失败时经 `Logger` 输出）
- 手势控制（`L`/`R` 使用 `LongPressGesture({ repeat: true, duration: 20 })`，仅在 `event.repeat` 为真时连续注入左右移动脚本）
- Web 配置（`domStorageAccess(true)`、`onlineImageAccess(true)`、`imageAccess(true)`、`zoomAccess(false)`、`javaScriptAccess(true)`、`backgroundColor(Color.Orange)`）
- 首屏清理（`onPageEnd` 注入 `removeDesc` 脚本，移除页面第一个 `div` 元素的描述层）
- 资源与配置（`resources/base|zh_CN|en_US`、`media` 图标、`main_pages.json`、`module.json5`、`syscap.json`；bundle `com.samples.runjsinweb`、module `entry`、deviceTypes `default/tablet`、orientation `landscape`、权限 `ohos.permission.INTERNET`、API 9）
- 远端页面（`https://yangyunhe369.github.io/h5-game-blockBreaker/`：加载耗时、加载失败、控制台输出、游戏状态常量）

### 3.2 关键风险点

围绕 WebView + JS 注入场景，重点识别如下风险：

- 远端页面加载慢或首帧未渲染即被操作，导致控件探针假失败或注入无效
- 页面依赖网络，断网/弱网下白屏但仍显示按钮，造成"控件可见即通过"的假通过
- `loadUrl('javascript:...')` 在页面未就绪时被丢弃，或连续长按造成注入积压与焦点丢失
- 脚本内容漂移（trace 文案、`_main` 入口、`state_*` 常量）导致注入静默失效
- 非法键码、越界坐标、超屏坐标注入导致 UiTest 请求异常
- 串行队列外的并发 UiTest 调用被服务端拒绝，产生随机失败
- 组件通配查询不被支持时统计为 0，产生误判
- 长跑过程中同步阻塞触发 `THREAD_BLOCK_6S`，测试进程被杀
- 内存与 Web 渲染资源未释放，长稳后出现泄漏斜率
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 非 HTTPS 或非法 scheme、`javascript:` 重复前缀、控制字符造成的注入风险

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至页面可交互，`Start`/`L`/`R`/`Reset` 四个控件成对出现且各出现一次
- 页面必须包含 `Web` 组件，组件总数处于合理上界内，左右控件呈水平三列分布
- `Start` 注入后会话从 `START` 进入 `RUNNING` 并发射小球；`GAMEOVER` 下重复 `Start` 被忽略
- `Reset` 仅在 `GAMEOVER` 下生效并回到 `START`，其余状态被忽略并计入忽略次数
- `L`/`R` 按固定步长移动挡板并在左右边界处钳制，移动次数与位置一致
- `ScriptCatalog` 五段脚本齐备，均带 `webgame <action>` trace 前导与 `_main.`/`document.` 入口引用
- `InjectionPipeline` 构建的 `javascript:` 地址可完整还原，括号配平、空载荷与不安全载荷被拒绝
- `onPageEnd` 注入 `removeDesc` 的行为与页面第一个 `div` 移除语义一致
- Web 配置默认为 `domStorage/onlineImage/image/javaScript` 开启、`zoom` 关闭
- 布局为 10%/80%/10%，控件按钮 50×100，方向为横屏
- 页面加载记录的状态流转、耗时与预算判定一致
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法/空注入脚本、括号不配平、包含 `javascript:` 重复前缀与控制字符的载荷
- 非法按键码、越界坐标、超屏坐标注入
- 断网、超时、5xx、响应体结构异常与白屏
- 快速连续点击、长按重复注入、交替按键后的状态一致性
- 页面加载失败、注入失败、页面被销毁后的重试与复位
- 前后台切换、窗口销毁重建、配置变化（语言/方向/缩放）后的状态恢复
- 快照丢失、快照越界、快照覆盖写入后的隔离

恢复类测试要求不仅校验接口返回值，还要求校验：

- 页面是否回到稳定基线（四个控件仍可见、`Web` 组件仍存在）
- 会话状态是否与操作历史一致，忽略计数是否可解释
- 挡板是否被钳制在有效区间，小球是否处于正确发射态
- 重试策略是否按指数退避上限（2000ms）终止
- 加载记录是否被正确标记为 `ERROR` 且不污染后续预算统计

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

WebView 形态下，用户可能连续长按左右键、反复点击 Start/Reset，因此需要覆盖：

- 高频按键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`、`KeyCodeValidation`）
- 连续注入与入口反复进出（`WebGameConcurrency`、`WebGameStress`、`WebGameLifecycle`）
- 注入与触摸/点击并发（`ConcurrencyControl`、`TouchInteraction`、`EventDispatchQueue` 相关能力）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）
- 长链路执行期间的串行化排队与主线程让出（`runSerializedUiOperation`、`serializedDelay`）

驱动中预置压力轮次常量（导航 20、生命周期 10、注入 30）与稳定判定容差（组件数 ±5、焦点 ±2、稳定轮次 2），长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录页面渲染、远端加载、脚本注入、焦点切换、控件点击等多类时延，预算集中在 `SharedDriver`（Web 渲染 5000ms、页面加载 8000ms、脚本注入 1000ms、焦点切换 500ms、弹窗渲染 1000ms）与 `GameModel`（`PAGE_LOAD_BUDGET_MS = 8000`）
- 采用限时上界断言，上界设置宽松以适配真机与网络波动，仅用于拦截异常变慢
- 通过 `PerformanceSampler` 对同一序列多次采样，同时断言最小值、均值、最大值与百分位，避免单次抖动被平均值掩盖
- 校验页面加载预算、帧率与动画时长、内存水位与泄漏斜率、功耗相关指标
- 在内容缩放、分辨率变化、深浅色主题、中英文资源下重复执行
- 覆盖 `default` 与 `tablet` 设备类型、横屏方向与 API 9 平台差异（`PlatformCompatibility`、`DeviceCompatibility`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 注入安全（`WebSecurity`、`InjectionPipeline.isSafe`：空载荷、换行、`\0`、`javascript:` 重复前缀均被拒绝）
- URL 契约（`UrlParts`/`UrlInspector`：scheme、host、path 解析，HTTPS 与 `.github.io` 白名单校验）
- 敏感信息与隐私（`SecurityValidation`、`SecurityUsability`：日志脱敏、控件文本不泄露路径与调试信息）
- 输入与边界校验（`InputValidation`、`BoundaryErrorTesting`、`KeyCodeValidation`：坐标、键码、载荷长度边界）
- 配置与包元数据契约（`ConfigurationManagerValidation`、`WebAppVersion`：bundle/module/ability、API 版本、权限、deviceTypes、orientation、metadata）
- 会话与鉴权契约（`WebAuthSession`、`WebSessionValidation`：会话建立、过期、并发续期）
- 数据一致性（`WebDataSourceValidation`、`WebGameConsistency`：响应封装、缓存回退与期望值一致）
- 通知与离线（`WebNotification`、`WebOfflineNetwork`：通知行为、离线队列与过期丢弃）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV/大屏与遥控器操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`UsabilityNavigation`、`SecurityUsability`）
- 焦点高亮与焦点环可见性（`FocusRingBehavior`、`FocusNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 长按重复触发与按键序列匹配（`GestureClassifier`、`KeySequenceMatcher`）
- 内容缩放、布局测量与控件定位（`ContentScaling`、`WebViewPositioning`、`UIComponentRendering`）
- 主题与视觉对比度（`ThemeVariation`、`VisualEffects`、`ThemeResolver`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断该示例在真实设备上可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：UI 真机探针、编号场景矩阵、压力回放、多采样统计、纯模型隔离并存
- 数据校验细化：不仅校验控件是否存在，还校验控件标签与数量、三列几何关系、焦点归属、会话计数与历史顺序、注入地址可还原性、时延上界
- 用例规模可观：78 个套件、4005 条用例由 `List.test.ets` 统一注册，可一次执行
- 测试资产可复用：`SharedDriver`、`GameModel`、`GameTestKit`、`TestHelpers` 让新增套件只需关注断言本身

### 5.2 当前边界与后续可扩展点

- 大部分用例为"定向用例 + 编号场景（`scenario_XXXX`）"组合，编号场景侧重模型不变式，真机交互仍以定向用例为主，可继续补充真机双设备组合
- 远端游戏页面依赖网络与第三方托管，网络不可用时 UI 断言以控件可见性为准，可增加本地镜像页面用于完全离线回归
- `Ability.test.ets` 目前未在 `List.test.ets` 中注册（不参与 `testsuite()` 执行），如需纳入启动冒烟需显式登记
- 注入能力目前只覆盖 `loadUrl('javascript:')`，后续可扩展到 `runJavaScript`/`createWebMessagePorts` 的契约测试

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 78 个套件，按测试意图分组如下：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 共享资产 | — | — | `Shared/SharedDriver.ets`：串行 UI 队列、页面探针与拉起、文本/组件轮询、控件定位、焦点检查、按键与触摸模拟、时延与容差常量；`Shared/GameModel.ets`：脚本目录、注入管道、游戏状态机、挡板/小球、Web 配置、布局、加载记录、性能采样、配置快照、重试策略；`Shared/GameTestKit.ets`、`Shared/TestHelpers.ets`：URL/几何/队列/令牌桶与错误分类、手势分类、快照、主题解析 |
| 游戏主流程 `WebGame` | 16 | 865 | `WebGameUI`、`GameOperations`、`GameControlFlow`、`GameOperationWorkflow`、`GameModelDeep`、`GameScriptCatalog`、`WebGameConfiguration`、`WebGameItemInfoModel`、`WebGameStateManagement`、`WebGameConcurrency`、`WebGameStress`、`WebGameConsistency`、`WebGameLifecycle`、`WebGameErrorRecovery`、`WebGameEndToEnd`、`WebGameInputInteraction`：控件渲染、Start/L/R/Reset 注入、状态流转、脚本目录与载荷、配置契约、并发与端到端链路 |
| 交互与可达性 `Interaction` | 14 | 751 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`UsabilityNavigation`、`ContentScaling`、`ThemeVariation`、`VisualEffects`、`UIComponentRendering`、`WebViewPositioning`、`DataBinding`：焦点顺序与焦点环、按键与触摸、手势分类、事件分发、无障碍、缩放与布局、主题与视觉、Web 定位与数据绑定 |
| 生命周期与状态 `LifecycleState` | 10 | 438 | `WebViewLifecycle`、`WebViewStateManagement`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`ConfigurationChanges`、`ExtensionLifecycle`、`ResourceManagement`、`ErrorRecovery`、`ExceptionHandling`：Web 生命周期、状态保存与恢复、会话、配置变化、资源释放、异常与错误恢复 |
| 性能与稳定 `PerformanceStability` | 7 | 277 | `WebPerformance`、`AnimationPerformance`、`RenderingPowerConsumption`、`PerformanceStress`、`LongTermStability`、`MemoryLeakDetection`、`ConcurrencyControl`：加载与注入时延、动画与渲染、功耗、压力与长稳、内存泄漏、并发控制 |
| 集成与场景 `Integration` | 9 | 269 | `UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`NetworkConnectivity`、`PlatformCompatibility`、`DeviceCompatibility`、`LocalizationTesting`：用户路径、系统集成、综合回归、网络连通、平台与设备兼容、本地化 |
| 安全与隐私 `Security` | 3 | 95 | `WebSecurity`、`SecurityValidation`、`SecurityUsability`：注入安全与 URL 白名单、敏感信息与输入校验、安全相关的无障碍暴露面 |
| 校验与契约 `Validation` | 11 | 848 | `KeyCodeValidation`、`FocusManagerValidation`、`WebStateManagerValidation`、`WebEventUtilValidation`、`AnimationControllerValidation`、`PointerUtilValidation`、`LoggerValidation`、`InputValidation`、`BoundaryErrorTesting`、`ConfigurationManagerValidation`、`ResourceLoaderValidation`：键码、焦点、状态、事件、动画、指针、日志、输入与边界、配置与资源加载契约 |
| Web 业务校验 `WebValidation` | 8 | 462 | `WebAppVersion`、`WebAuthSession`、`WebSessionValidation`、`WebDataSourceValidation`、`WebEventToolValidation`、`WebInterruptionRecovery`、`WebNotification`、`WebOfflineNetwork`：版本、鉴权与会话、数据源、事件工具、中断恢复、通知、离线网络 |
| 合计 | 78 | 4005 | 由 `List.test.ets` 单入口注册 |

## 7. 结论

`RunJsInWeb` 当前测试设计已经形成"共享驱动 + 领域模型 + 真机场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 WebView JS 注入与执行示例后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行，连接网络 | — | 成功拉起应用 | 否 | Pass |
| 检查 UI 显示 | 位于首页 | — | UI 界面显示正常 | 否 | Pass |
| 开始游戏 | 连接网络 | 1、点击 **Start** 开始游戏<br>2、点击 **R、L** 按钮 | 1、可以开始游戏<br/>2、可以控制游戏 | 否 | Pass |
