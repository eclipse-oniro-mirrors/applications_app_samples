# Browser 测试说明

> 本说明面向 `Browser`（OpenHarmony Web 浏览器示例工程）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据，并附手工用例归档。

## 1. 文档目标

本文档用于说明 `Browser` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/BrowserTestKit.ets` 为核心，提供 UiTest 串行化调用队列（`runSerialized`）、单次操作超时保护（`settleWithTimeout`，上界 12s）、串行延时（`serializedDelay`，基于 `driver.delayMs`）、应用前置拉起（`startBrowserApp`，复用已可见窗口而非反复重启）、组件查询与轮询（`componentByIdExists`、`countById`、`countByType`、`textById`、`waitFor`、`waitForId`、`waitForCount`、`hasText`）、点击与输入（`clickById`、`inputById`）、按键与手势模拟（`pressKey`、`swipeUp`、`tapAt`），以及业务纯函数镜像（`normalizeUrl`、`isValidAddress`、`isExternalUrl`、`tabCapacityReached`、`resolveTabIndexAfterDelete`、`rebaseTabKeys`、`buildSearchUrl`、`progressVisibleAfter`、`pushHistory` 等）
- 领域层：以 `Shared/BrowserMock.ets` 为确定性镜像模型，覆盖 `MockBrowser`（页签增删选、URL 加载、前进后退刷新、`onPageBegin`/`onPageEnd`、`onProgressChange`、`onWindowNew`、`onBackPress`）、`MockWebController`（历史栈与索引）、`MockNetwork`（在线状态、时延、失败率、请求记录）与 `MockClock`，在不依赖真实 UI 上下文的前提下验证 `model/Browser.ets` 的可观测行为
- 场景层：由 UiTest 驱动真实页面，覆盖应用启动、地址栏输入与跳转、前进/后退/刷新/回主页、页签新增与关闭、页签数量上限提示、横竖屏与手机/平板布局切换、主页站点入口等真实浏览场景
- 质量层：补充交互焦点与按键、生命周期与状态恢复、性能与长稳、安全与契约、本地化与设备兼容等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件注册：`List.test.ets` 按目录分组导入并逐一注册 79 个套件（`app` 冒烟 1 个 + 业务 78 个），失败时可直接回溯到功能域，覆盖度可在不跑真机的情况下审计
- 统一驱动能力：所有 UI 套件复用 `BrowserTestKit` 的串行队列、组件轮询与按键模拟，避免各套件重复实现 UiTest 细节
- 串行化 UI 队列：UiTest 不允许 `findComponents`、`triggerKey`、`delayMs` 等操作并发执行，所有调用进入同一 Promise 链串行执行，消除套件间焦点竞争与丢键
- 超时与重入保护：单次 UiTest 操作设置 12s 上界，超时后队列继续推进，避免单个卡死用例拖死后续 `beforeAll`；`runSerialized` 支持重入，内层调用直接执行，避免队列等待自身造成死锁
- 复用而非重启：`startBrowserApp` 在检测到地址栏已可见时直接复用当前窗口，只有确实不在应用内才重新拉起 `MainAbility`，避免长链路执行时堆叠 ability 实例
- 集中常量管理：组件 id（`inputUrl`、`navigationButton0~3`、`actionButton0~1`、`cancelBtn`）、键值（BACK/HOME/ENTER/方向键）、加载与焦点时延预算、页签上限、主页地址、搜索引擎与容量提示文案统一收敛在 `BrowserTestKit`，业务实现变更时只改一处
- 统一日志门面：`Shared/TestLogger.ets` 以 hilog（domain `0xF811`）替代一切 console 输出，并提供环形日志 sink（容量 1024）、分套件步骤计数（`step`）与失败记录（`getFailures`），便于定位失败步骤
- 确定性替身：`MockNetwork` 使用固定种子生成伪随机失败，`MockClock` 提供可控时间推进，保证网络异常与时序类断言可重复

通过复用驱动工具、集中常量与串行/超时策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`Browser` 16、`BrowserValidation` 8、`Integration` 9、`Interaction` 14、`LifecycleState` 10、`PerformanceStability` 7、`Security` 3、`Validation` 11，共 78 个业务套件（另有 `app.test.ets` 冒烟套件，`List.test.ets` 共注册 79 个套件）
- 页签矩阵（`TabItemModel`、`TabOperations`、`TabOperationCatalog`：1~10 个页签 × 首/中/尾位置 × 新增/删除/切换/重编号 × 非法索引）
- URL 矩阵（`UrlOperationFlow`、`BrowserModelDeep`：裸域名/带 scheme/带路径/空串/超长地址 × 归一化 × 加载成功/失败）
- 按键矩阵（`KeyEventValidation`、`FocusNavigation`、`FocusRingBehavior`：方向键、ENTER、BACK、HOME 与非法键值的合法/非法组合）
- 交互矩阵（`EventHandling`、`EventPropagation`、`GestureRecognition`、`TouchInteraction`：点击/长按/滑动/连击 × 事件冒泡与消费）
- 网络矩阵（`NetworkConnectivity`、`OfflineNetwork`、`InterruptionRecovery`：在线/离线 × 时延 × 失败率 × 恢复后重试）
- 设备与布局矩阵（`DeviceCompatibility`、`BrowserCompatibility`、`ContentScaling`、`LayoutPositioning`：手机/平板 × 横竖屏 × 内容缩放 × 设计宽度适配）
- 资源 × 语言矩阵（`LocalizationTesting`、`ResourceLoaderValidation`：base/zh/en 资源与字符串、图片、图标回退）
- 生命周期矩阵（`AbilityLifecycle`、`PageLifecycle`、`ConfigurationChanges`、`StatePersistence`/`StateRecovery`：前后台切换 × 配置变化 × 进程重建 × 状态恢复）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`MainAbility/MainAbility.ts`、`Application/AbilityStage.ts`：onCreate/onWindowStageCreate/onForeground/onBackground 生命周期与首页加载）
- 首页布局（`pages/Index.ets`：按 `deviceInfo.deviceType` 与横竖屏媒体查询在平板布局与手机布局之间切换，顶部进度条随加载进度显隐）
- 平板标题栏（`common/TitleBar.ets` 的 `TabletTitle`：后退、前进、刷新、主页四个导航按钮，地址输入框 `inputUrl`，提交按钮 `actionButton0` 与新增页签按钮 `actionButton1`）
- 页签条（`BrowserTabs`：以 `webArray` 渲染页签，当前页签高亮，关闭按钮 `cancelBtn` 在页签数大于 1 时可删除并重编号）
- 网页容器（`WebTab`：`Web` 组件加载 `pad.html`/`phone.html`，`onPageBegin` 回填地址、`onPageEnd` 注入 `adapterDevice()` 并注册 JS 代理、`onProgressChange` 驱动进度条、`onWindowNew` 处理新窗口）
- 手机布局（`common/PhoneLayout.ets`：`Navigation` 标题栏输入框与提交按钮、底部工具栏后退/前进/主页/刷新按钮）
- 浏览器模型（`model/Browser.ets`：`addTab` 上限 10、`deleteTab` 索引修复与 key 重编号、`loadUrl` 补全 `https://`、`Back`/`Forward` 前置 `accessBackward`/`accessForward` 判断、`Refresh`）
- 主页与 JS 代理（`rawfile/pad.html`、`rawfile/phone.html`：站点快捷入口；`etsObj.test` 加载地址、`etsObj.searchWord` 跳转 Bing 搜索）
- 返回键语义（`Index.onBackPress`：可后退或加载中时消费返回事件并回退，否则交还系统）
- 资源与配置（`resources/base|en|zh`、media 图标、`main_pages.json`、`module.json5`、`build-profile.json5`）
- 网络与日志（页面请求与加载失败、`MockNetwork` 的在线状态/时延/失败率、hilog `0xF811` 日志与失败步骤记录）

### 3.2 关键风险点

围绕 Web 浏览器示例场景，重点识别如下风险：

- 冷启动慢或首页未渲染即被操作，导致地址栏、按钮点击无效
- 设备类型识别异常导致手机/平板布局选择错误
- 地址输入未补全 `https://`、空串或非法地址被直接加载
- 前进/后退按钮在无历史栈时误操作或抛异常
- 页签数量超过 10 仍可新增，或删除页签后索引越界、key 重编号错乱
- 删除到只剩一个页签时误删，造成空白页
- 进度到 100% 后进度条未隐藏、进度未复位
- `onWindowNew` 对 `about:blank` 或空地址处理不当导致页面被覆盖
- 返回键在可后退与加载中场景未被消费，或不可后退时误消费
- 长链路执行中 UiTest 并发调用相互干扰、同步阻塞导致卡顿或进程被杀
- 断网、弱网、请求失败下的白屏、崩溃与状态残留
- 中英文资源缺失、未绑定字段渲染异常
- 敏感信息（地址、设备标识、UserAgent）在日志中泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，地址栏与导航按钮成对出现
- 地址栏输入裸域名后点击提交，地址归一化为 `https://` 前缀并触发加载
- 后退/前进按钮在存在历史栈时切换页面，无栈时保持原页
- 刷新按钮触发当前页重新加载，主页按钮回到 `pad.html`/`phone.html`
- 新增页签后页签数量增加且切换到新页签，关闭页签后数量减少、索引与 key 同步修复
- 页签数量达到上限时提示"页签数量已满"且不再新增
- 加载过程中顶部进度条可见，加载完成后隐藏并复位
- 页面加载完成后注入 `adapterDevice()` 并注册 `etsObj` 代理，主页搜索可跳转 Bing
- 手机布局与平板布局的标题栏、工具栏按钮与入口完整
- 横竖屏切换后布局与控件数量符合预期
- 中英文资源切换后占位文案与断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 空地址、纯空白、超长地址、缺少主机名的地址输入
- 非法页签索引、删除不存在的页签、只剩一个页签时删除
- 非法按键码、越界坐标、超屏坐标注入
- 断网、超时、请求失败与空响应
- 快速连续点击、交替按键、重复提交后的状态一致性
- 前后台切换、进程重建后的状态恢复与页签一致性
- 配置变化（横竖屏、语言、字号）后的页面重建与状态保持

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前地址栏内容与页面实际地址一致
- 页签数量、当前页签索引与页签 key 保持一致，避免重复或错位
- 进度条在恢复后回到隐藏状态，不残留半截进度
- 返回键语义在恢复后仍正确（可后退则回退，不可后退则交还系统）

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

浏览器场景下，用户可能连续执行导航、切换页签、快速按键等动作，因此需要覆盖：

- 高频方向键与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`）
- 页签快速新增/关闭/切换（`BrowserConcurrency`、`TabOperations`、`ConcurrencyControl`）
- 加载过程中执行前进/后退/刷新（`BrowserStress`、`BrowserErrorRecovery`）
- 长链路混合动作回放（`LongTermStability`、`ComprehensiveRegression`）
- 长链路执行期间的串行队列推进与超时释放（`runSerialized`、`settleWithTimeout`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录启动、页面加载、页签切换、焦点变化等多类时延，预算常量集中在 `BrowserTestKit`（启动 3s、页面加载 5s、页签切换 1.5s、组件查找 2s、焦点变化 800ms）
- 采用限时上界断言，上界设置宽松以适配真机与 Web 引擎波动，仅用于拦截异常变慢
- 对同一操作序列多次采样并断言统计量（`WebRenderPerformance` 的帧耗时均值与帧率、`LongTermStability` 的堆内存峰值/最小值与泄漏斜率），避免单次抖动被平均值掩盖
- 覆盖 Web 渲染耗时、动画帧率、内存水位与泄漏趋势、WebView 资源消耗（`WebRenderPerformance`、`AnimationPerformance`、`MemoryLeakDetection`、`WebViewConsumption`）
- 在内容缩放、分辨率变化、横竖屏与中英文资源下重复执行
- 覆盖手机与平板两类设备的布局差异（`DeviceCompatibility`、`BrowserCompatibility`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 地址与输入清洗（`InputValidation`、`BoundaryErrorTesting`：空串、空白、超长、控制字符、越界值）
- URL scheme 约束与外部地址判定（`isExternalUrl`、`normalizeUrl`，仅 `http/https` 视为外部地址）
- JS 代理最小暴露（`BrowserSecurity`：`etsObj` 仅注册 `test` 与 `searchWord`）
- 权限与能力声明（`SecurityValidation`、`module.json5` 的 INTERNET 等权限）
- 日志脱敏与敏感信息检查（`LoggerValidation`、`SecurityAccessibility`）
- 配置与常量契约（`ConfigurationManagerValidation`、`IndexStateManagerValidation`、`ResourceLoaderValidation`、`AppVersionValidation`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对浏览器操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮与焦点环样式（`FocusRingBehavior`、`FocusNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 数据绑定与状态回填（`DataBinding`、`BrowserStateManagement`）
- 内容缩放、布局测量与滚动边界（`ContentScaling`、`LayoutPositioning`）
- 主题与视觉效果（`ThemeVariation`、`VisualEffects`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断浏览器示例可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、真实场景层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、混合动作回放、桩对象隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验页签数量与索引、地址归一化结果、进度条显隐、焦点落点与时延上界
- 可复现性：Web 与网络依赖通过 `MockBrowser`、`MockWebController`、`MockNetwork`、`MockClock` 隔离，失败可稳定复现
- 覆盖度可审计：`List.test.ets` 集中注册 79 个套件并按目录分组，套件清单与本文章节 6 的分组表一一对应
- 测试资产可复用：`BrowserTestKit` 的串行队列、超时保护与统一常量便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 3 | `Shared/BrowserTestKit.ets`、`Shared/BrowserMock.ets`、`Shared/TestLogger.ets`：串行 UI 队列、超时保护、组件轮询与按键模拟、确定性模型与网络/时钟替身、hilog 日志与步骤计数 |
| 冒烟 `appTest` | 1 | `app.test.ets`：拉起应用、输入网址跳转、前进/后退、主页返回与新增页签 |
| 浏览器主流程 `Browser` | 16 | `BrowserUI`、`BrowserEndToEnd`、`BrowserOperationWorkflow`、`BrowserConsistency`、`BrowserConcurrency`、`BrowserStress`、`BrowserErrorRecovery`、`BrowserLifecycle`、`BrowserStateManagement`、`BrowserInputInteraction`、`BrowserMenuConfiguration`、`BrowserModelDeep`、`TabItemModel`、`TabOperations`、`TabOperationCatalog`、`UrlOperationFlow`：主流程回归、页签模型与操作、URL 流、菜单与输入、并发与异常恢复 |
| 浏览器专项校验 `BrowserValidation` | 8 | `AppVersionValidation`、`AuthSessionValidation`、`DataSourceValidation`、`EventToolValidation`、`InterruptionRecovery`、`NotificationValidation`、`OfflineNetwork`、`SessionValidation`：版本信息、鉴权会话、数据源与缓存、事件工具、中断恢复、通知、离线与会话 |
| 集成与场景 `Integration` | 9 | `SystemIntegration`、`DeviceCompatibility`、`BrowserCompatibility`、`NetworkConnectivity`、`LocalizationTesting`、`UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`ComprehensiveRegression`：系统集成、设备与版本兼容、网络连通、本地化、用户场景与综合回归 |
| 交互与可达性 `Interaction` | 14 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`AccessibilityNavigation`、`DataBinding`、`ContentScaling`、`LayoutPositioning`、`ThemeVariation`、`VisualEffects`、`UIComponentRendering`：焦点、按键、触摸、手势、事件传播、无障碍、数据绑定、布局与视觉 |
| 生命周期与状态 `LifecycleState` | 10 | `AbilityLifecycle`、`PageLifecycle`、`ConfigurationChanges`、`BrowserStateFlow`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`ResourceManagement`、`ErrorRecovery`、`ExceptionHandling`：Ability/页面生命周期、配置变化、状态流与持久化恢复、资源与异常处理 |
| 性能与长稳 `PerformanceStability` | 7 | `WebRenderPerformance`、`AnimationPerformance`、`MemoryLeakDetection`、`WebViewConsumption`、`ConcurrencyControl`、`LongTermStability`、`PerformanceStress`：Web 渲染与动画、内存泄漏、WebView 消耗、并发控制、长稳与压力 |
| 安全 `Security` | 3 | `BrowserSecurity`、`SecurityValidation`、`SecurityAccessibility`：JS 代理与 scheme 约束、安全校验、安全相关无障碍 |
| 校验与契约 `Validation` | 11 | `InputValidation`、`KeyEventValidation`、`BoundaryErrorTesting`、`AnimationControllerValidation`、`CommonEventUtilValidation`、`ConfigurationManagerValidation`、`FocusManagerValidation`、`IndexStateManagerValidation`、`LoggerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`：输入、按键、边界、动画、事件、配置、焦点、首页状态、日志、触点与资源校验 |

说明：`Ability.test.ets` 另外提供 Ability 级冒烟检查（bundle/ability 参数、启动结果、地址栏与主页按钮挂载、地址规则与常量契约）。

## 7. 结论

`Browser` 当前测试设计已经形成"共享驱动 + 领域模型 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为浏览器示例后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 1. 需在真机测试 <br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动并联网 | 启动应用 | 成功拉起应用，进入浏览器首页 | 是 | Pass |
| 主页图标点击 | 位于主页 | 点击主页默认站点图标 | 跳转到对应网页 | 否 | Pass |
| 网址输入跳转 | 位于主页 | 在地址栏输入 `www.baidu.com` 并点击右侧提交按钮 | 自动补全 `https://` 并跳转到对应页面 | 是 | Pass |
| 前进后退 | 已访问多个网页 | 依次点击后退、前进按钮 | 页面后退到上一页、再前进到下一页 | 是 | Pass |
| 返回主页 | 位于子页面 | 点击主页按钮 | 回到主页 | 是 | Pass |
| 刷新页面 | 网页加载完成 | 点击刷新按钮 | 当前页面重新加载 | 否 | Pass |
| 新增页签 | 平板/PC 布局 | 点击加号按钮 | 新建页签并自动切换到新页签 | 是 | Pass |
| 关闭页签 | 存在多个页签 | 点击页签关闭按钮 | 页签关闭，当前页签与索引正确切换 | 否 | Pass |
| 页签数量上限 | 已存在 10 个页签 | 点击加号按钮 | 提示"页签数量已满"，不再新增页签 | 否 | Pass |
| 加载进度条 | 触发网页加载 | 观察顶部进度条 | 加载中显示，进度到 100% 后隐藏并复位 | 否 | Pass |
| 手机/平板布局切换 | 支持横竖屏的设备 | 旋转屏幕或切换设备形态 | 在手机布局与平板布局之间正确切换，控件完整 | 否 | Pass |
| 主页搜索 | 位于主页 | 在主页搜索框输入关键词并搜索 | 跳转到 Bing 搜索结果页 | 否 | Pass |
| 后台恢复 | 应用停留在子页面 | 切到后台后重新回到应用 | 页面与页签状态保持，操作正常 | 否 | Pass |
