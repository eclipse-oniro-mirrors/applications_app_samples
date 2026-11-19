# Tab 组件增删 Tab 标签测试说明

> 本说明面向 `HandletabsSample`（OpenHarmony 示例工程，包名 `com.samples.HandletabsSample`）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `HandletabsSample` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 `entry_test` 模块 / `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets`（706 行，45 个导出函数、63 个导出常量）为核心，提供串行化 UI 操作队列（`runUiTask`）、非阻塞延时（`serializedDelay`）、应用拉起与重置（`launchTargetAbility`、`bringPanelToFront`、`resetPanelToInitial`、`resetDriver`、`resetUiChain`）、页面稳定等待（`waitForPanelStable`、`settlePanel`）、Tab 操作（`clickAddButton`、`clickCloseButton`、`clickTabTitle`、`clickFirstTextComponent`）、文本与组件查询（`collectTexts`、`countTitles`、`containsLabel`、`tabTitleCount`、`tabsCount`、`tabContentCount`、`textCount`、`focusedCount`、`clickableCount`、`panelSnapshot`）、按键与触摸模拟（`triggerSerializedKey`、`pressAndWait`、`safePressKey`）、屏幕度量与旋转（`displayMetrics`、`rotationOf`），以及集中管理的超时常量（`TIMEOUT_PANEL_RENDER` / `TIMEOUT_STATE_SETTLE` / `TIMEOUT_TAB_SWITCH` / `TIMEOUT_FOCUS_CHANGE` / `TIMEOUT_COMPONENT_QUERY` / `RESET_TIMEOUT` / `RESET_SETTLE`）、延时常量（`DELAY_KEY_NAVIGATION` / `DELAY_TOUCH_EVENT` / `DELAY_AFTER_TAB_OPERATION`）、容差常量（`TOLERANCE_TAB_COUNT` / `TOLERANCE_COMPONENT_COUNT` / `STABLE_ROUNDS`）与模型层纯函数（`canAddTab`、`canRemoveTab`、`clampTabIndex`、`buildTabTitle`、`removeTitleAt`、`appendTitle`）。`SharedDriver` 对内嵌 `TabTitleBook` 可变模型与 `PanelSnapshot` 快照对象进行统一封装。
- 领域层：多数套件内嵌纯逻辑领域模型，对系统依赖通过纯函数或模型对象隔离后做确定性单元测试，例如 `TabStripModel` / `TabDescriptor` / `TabsSwitchState` / `TabBarStyleModel` / `TabBarIndicatorModel` / `TabsBarMode`（Tab 条模型基线）、`TabStyleProfile` / `TabLayoutModel` / `TabTheme`（样式与布局模型）、`TabEventBus` / `TabEventEntry` / `TabGestureModel` / `TabEventKind`（事件总线与手势模型）、`FocusNavigator` / `FocusTrail` / `FocusRingModel` / `FocusDirection`（焦点导航与焦点环模型）、`RetryMachine` 系列（`StateRetryMachine` / `AuthRetryMachine` / `SvalRetryMachine` 及对应 `Phase` 枚举，重试状态机）、`ExcValidator` / `ExcVerdict` / `Sval2Validator`（错误分类与安全裁决器）、`DvalRegistry` / `NotiLog` / `LocLog` / `ActrlIntervalSet`（数据源注册、通知日志、本地化日志、动画区间）等。
- 场景层：模拟应用启动、Tab 条渲染、点击 `+` 新增标签、点击 `X` 删除标签、标签切换、前后台切换、Tab 数量上限与下限守卫等真实 Tabs 场景。
- 质量层：补充性能时延、内存泄漏、并发控制、压力与长稳、安全、无障碍、设备兼容、本地化、离线韧性等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件入口：`List.test.ets` 统一 import 并以 `testsuite()` 顺序调用 50 个套件，覆盖度可静态审计
- 统一驱动能力：所有 UI 套件复用 `SharedDriver` 的页面稳定等待、文本采集、Tab 计数与按键模拟，避免各套件重复实现 UI 驱动细节
- 用例级状态重置：`beforeEach` 统一调用 `resetPanelToInitial`，经 `startAbility` 触发 `EntryAbility.onNewWant` 重新 `loadContent`，把 Tab 条恢复到 `页面1` + `页面2` 的初始基线，避免前一用例点过 `+` / `X` 后污染后续用例造成假通过
- 串行化 UI 队列：单 UI 线程渲染，所有 UiTest 调用与延时都进入 `uiChain` 串行执行，消除并发用例之间的焦点竞争与丢键
- 非阻塞延时：`serializedDelay` 使用 `driver.delayMs` 让出事件循环而非同步阻塞，规避长跑时主线程看门狗导致的 AppFreeze 与测试进程被杀
- 常量集中：包名、Ability 名称、Tab 文案前缀（`TAB_PREFIX = '页面'`）、新增按钮文案（`TAB_ADD_LABEL = '+'`）、关闭按钮文案（`TAB_CLOSE_LABEL = 'X'`）、Tab 数量基线（`INITIAL_TAB_COUNT = 2` / `MAX_TAB_COUNT = 4` / `MIN_REMOVABLE_TAB_COUNT = 2`）、预期标题（`FIRST_TAB_TITLE` ~ `FOURTH_TAB_TITLE`）、TabBar 尺寸（`TAB_BAR_WIDTH` / `TAB_BAR_HEIGHT` / `TAB_CONTENT_HEIGHT` / `TAB_ANIMATION_DURATION` / `TAB_DIVIDER_STROKE`）、字体与颜色（`TAB_FONT_SIZE` / `TAB_FONT_WEIGHT_SELECTED` / `TAB_FONT_WEIGHT_NORMAL` / `DEFAULT_FONT_COLOR` / `SELECTED_FONT_COLOR` / `TAB_CONTENT_BACKGROUND`）、边距（`TAB_MARGIN_SIDE` / `TAB_MARGIN_TOP` / `TAB_MARGIN_BOTTOM` / `TAB_CLOSE_MARGIN_LEFT` / `TAB_ADD_MARGIN_TOP`）、按键码（`KEY_ESCAPE` / `KEY_MENU`）、超时/延时/容差全部集中在 `SharedDriver`，各套件不再散落魔法值
- 日志与断言统一：统一 `@ohos.hilog`（内容英文），布尔断言 `assertTrue/assertFalse`、非布尔 `assertEqual(actual, expected)`、异常路径断言 `e.name` 精确值、强制失败 `expect().assertFail()`

通过复用驱动工具、页面基线重置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 目录/能力矩阵：8 个能力目录，共 50 个套件、1,035 条用例（见第 6 节）
- Tab 增删矩阵（`TabOperations` / `TabOperationCatalog` / `TabPanelLifecycle`）：初始 2 标签 → 点击 `+` 一次 → 3 标签（`页面3` 出现）；点击 `+` 两次 → 4 标签（`页面4` 出现，达到 `MAX_TAB_COUNT` 上限后 `+` 按钮消失）；点击 `X` 一次 → 标签数递减（不低于下限）；数量达到 `MIN_REMOVABLE_TAB_COUNT` 时删除被拒绝
- Tab 切换矩阵（`TabOperations` / `TabsSwitchState` 相关套件）：`begin` / `finish` / `reset` 三态流转 × 目标索引等于当前索引的拒绝路径 × 动画期间二次 `begin` 的重入拒绝
- 样式与布局矩阵（`TabBarConfiguration` / `TabPanelUI` / `TabsContentScaling` / `TabsThemeVariation` / `TabsPanelPositioning` / `TabStyleProfile` / `TabLayoutModel`）：默认色 / 选中色 × 字号 × 字重（选中 500 / 普通 400）× 行高 × 边距（上下 / 左右 / 关闭按钮左侧 / 新增按钮上侧）× 分割线线宽 × TabBar 宽高 × 内容区高度 × 内容区背景色
- 事件矩阵（`TabsEventHandling` / `TabsEventPropagation` / `TabsGestureRecognition` / `TabsTouchInteraction` / `TabsButtonInteraction` / `TabInputInteraction`）：`TabEventBus` 订阅/投递 × `TabGestureModel` 手势识别 × `FocusTrail` 焦点轨迹 × 事件传播路径与优先级
- 焦点矩阵（`TabsButtonInteraction` 相关套件、`TabsSystemIntegration` 的 `FocusNavigator`）：`LEFT` / `RIGHT` / `UP` / `DOWN` 方向键 × 焦点环可见性 × 焦点顺序与边界回绕
- 边界矩阵（`TabOperations` 的 `TopsCappedStore`、`clampTabIndex`）：Tab 数量 0 / 1 / 2 / `MAX_TAB_COUNT` / `MAX_TAB_COUNT + 1`、索引 `-1` / `0` / `size - 1` / `size` / 超大值越界钳制、容量溢出淘汰顺序
- 重试状态机矩阵（`TabsPanelStateManagement` / `PanelAuthSession` / `PanelSessionValidation`）：`READY` → `ATTEMPTING` → `SUCCEEDED` / `EXHAUSTED` × 尝试上限 × `remaining()` 下界不为负 × `reset()` 回归
- 设备与兼容矩阵（`TabsDeviceCompatibility`、`TabsSurfaceCompatibility`）：`phone` / `tablet` / `2in1` 设备类型 × 表面尺寸 × 特性门禁
- 本地化矩阵（`TabsLocalizationTesting`）：`页面` / `页面1` 前缀与中文文案在不同资源下的断言一致性
- 压力与长稳矩阵（`TabPanelStress`、`PerformanceStability`）：Tab 操作轮次 × 混合动作回放

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 主 Ability（`entryability/EntryAbility.ets`）：`onCreate` 记录启动日志；`onWindowStageCreate` 加载 `pages/Index`；`onNewWant` 在测试重置时重新 `loadContent` 以恢复页面初始状态；异常路径统一以 `catch (e)` 捕获后经 hilog 记录
- 被测首页（`pages/Index.ets`，`@Entry @Component struct CustomView`）：
  - `@State arr: string[] = ['页面1', '页面2']` 为 Tab 标题列表，初始 2 个标签
  - `@State selectedIndex` / `@State currentIndex` 控制选中态，`@State newPage = 2` 记录新增页序号
  - `@Builder tabBuilder(index, name)` 渲染单个 TabBar：标题 `Text`（选中/未选中分别使用 `SELECTED_FONT_COLOR` / `DEFAULT_FONT_COLOR`，字重 500 / 400，字号 16，行高 22）+ 关闭按钮 `Text('X')`（红色，仅在 `arr.length > 1` 时渲染，点击执行 `arr.splice(index, 1)`）+ `Divider`（`strokeWidth 2`，`#007DFF`，选中时 opacity 1）
  - `@Builder addTab()` 渲染新增按钮 `Text('+')`（字号 30，颜色 `#707070`），点击执行 `newPage++` 并 `arr = [...arr, '页面' + newPage]`
  - `build()` 使用 `Flex`（`SpaceAround` 水平分布）+ `ForEach` 渲染 TabBar 行，`arr.length < 4` 时才渲染新增按钮；下方 `Tabs({ index: selectedIndex })` 以 `ForEach` 渲染 `TabContent`（内容区 `Text(item)`，背景 `#007DFF`），配置 `barWidth 360` / `barHeight 56` / `animationDuration 400` / `width 360` / `height 296` / `backgroundColor '#F1F3F5'`，`onAnimationStart` 回调中同步 `selectedIndex`
- 模块契约（`entry/src/main/module.json5`）：`entry` 类型、`deviceTypes: phone + tablet + 2in1`、`deliveryWithInstall: true`、`installationFree: false`、`EntryAbility` exported 且技能为 `entity.system.home` + `action.system.home`
- 测试承载（`ohosTest/module.json5`、`testrunner/OpenHarmonyTestRunner.ets`、`testability/TestAbility.ets` 及其 `pages/Index.ets`）：`entry_test` feature 模块，`TestAbility` exported（icon 使用 `$media:icon` 的 SVG 资源），通过 OpenHarmony Ability assistant 的 `test` 子命令拉起测试 Ability 后执行 Hypium 套件
- 测试启动时序（`TestAbility.ets`）：`onCreate` 延迟 1 秒后 `startAbility(EntryAbility)`，随后轮询 `getCurrentTopAbility()` 直到 `EntryAbility` 真正到达前台（上限 10 秒），再调用 `Hypium.hypiumTest(...)`，确保被测应用完成首帧渲染后才开始用例

### 3.2 关键风险点

围绕 Tabs 增删标签场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致 `Tabs` 节点缺失、`页面1` / `页面2` 标题采不到
- 应用启动过早导致 `EntryAbility` 前台化与 Hypium 初始化抢主线程，触发 `LIFECYCLE_TIMEOUT` 或 `THREAD_BLOCK_6S` 看门狗杀进程
- 设备锁屏导致 Ability assistant 的 `test` 子命令直接报 `00508013 App launch timed out`，即使勉强启动所有 UI 断言也会失败
- 用例间状态污染：前一用例点过 `+` 后 Tab 数变为 3 或 4，后续断言"初始两页可见"必然失败
- 并发 UI 操作引起焦点竞争、点击丢失或状态错乱
- Tab 数量达到 `MAX_TAB_COUNT` 后新增按钮未消失，或达到下限后仍可删除
- Tab 切换动画期间的二次 `begin` 未被拒绝，产生重入
- 长链路执行中同步阻塞主线程触发 `THREAD_BLOCK_6S` 看门狗、AppFreeze 与测试进程被杀
- 本地化资源缺失或未绑定字段渲染为 `undefined` / `null`

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互：`EntryAbility` 拉起、`pages/Index` 渲染、`Tabs` 组件存在且 `tabsCount >= 1`
- 初始标签渲染：`页面1` 与 `页面2` 两个标题同时可见，`TabContent` 数量与标签数匹配
- 新增标签闭环：点击 `+` 一次后 `页面3` 出现，且带标题的标签数增长或持平
- 新增上限：连续点击 `+` 两次后达到 `MAX_TAB_COUNT = 4`，`+` 按钮从界面消失
- 删除标签闭环：点击 `X` 一次后带标题的标签数不增长（递减或持平）
- 删除下限：数量达到 `MIN_REMOVABLE_TAB_COUNT` 时 `canRemoveTab` 返回 `false`，`TabTitleBook.removeTitle` 拒绝删除且数量不变
- 标签切换：`TabsSwitchState` 的 `begin` → `finish` 后索引等于目标；目标等于当前索引时拒绝；动画期间二次 `begin` 被拒绝
- 标题命名规则：渲染出的每个标签标签都以 `页面` 前缀开头，新增标签依次为 `页面3` / `页面4`
- 前后台切换、按返回键、按 HOME 键后的窗口与页面状态一致
- 中英文资源与本地面板文案切换后断言一致

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法索引注入：`removeTitle(-1)`、`removeTitle(size)`、`removeTitle(超大值)` 均返回 `false` 且数量不变；`clampTabIndex` 对越界索引钳制到有效槽位
- 数量守卫：`canAddTab` 在 `MAX_TAB_COUNT` 与 `MAX_TAB_COUNT + 1` 时返回 `false`；`canRemoveTab` 在低于下限时返回 `false`
- 容量溢出：`TopsCappedStore` 超过容量时按序淘汰最早写入项（`evictedCount()` / `evictedTitles()` 校验）
- 重试状态机耗尽：`RetryMachine` 达到尝试上限后进入 `EXHAUSTED`，`remaining()` 不为负，后续 `attempt()` 返回 `false`
- 渲染失败、窗口缺失、top ability 为 `null` 时的降级与重启恢复（`resetPanelToInitial` 检测到非初始 Tab 数即重新拉起）
- 快速连续点击、交替点击后的状态一致性（`TabEventBus` 投递顺序 + `TouchQueue` / `BtnQueue` 队列模型）
- 非法事件与非法 Want 的拒绝路径（`ExcValidator` / `Sval2Validator` 分类裁决）
- 离线状态下的韧性（`TabsOfflineResilience`）

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前 Tab 条是否回到初始基线（`页面1` + `页面2`，数量等于 `INITIAL_TAB_COUNT`）
- 组件数量与索引是否一致，避免重复实例
- 重试状态机是否可 `reset()` 回归 `READY`
- 事件队列是否按序重放、无丢失

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

用户可能连续点击 `+` / `X`、反复切换标签、快速切换前后台，因此需要覆盖：

- 高频点击与焦点快速变化（`TabsButtonInteraction`、`TabInputInteraction`）
- 连续 Tab 增删与切换的混合动作（`TabPanelStress`、`TabsAdvancedScenarios`）
- 并发操作下的 Tab 条一致性（`TabPanelConsistency` 与 `TabsConcurrencyControl`）
- 长链路混合动作回放（`TabsLongTermStability`、`TabsComprehensiveRegression`）
- 压力轮次配合串行化 UI 队列消除竞争
- 长链路执行期间的主线程让出（`serializedDelay` 基于 `driver.delayMs`、`setTimeout` 事件循环）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录动画性能（`TabsAnimationPerformance`）、电源与功耗（`TabsPowerPerformance`）等时延与资源指标
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 内存水位与泄漏斜率（`TabsMemoryLeakDetection`）
- 在 `phone` / `tablet` / `2in1` 设备类型、深浅色模式、中英文资源、字体缩放下重复执行（`TabsDeviceCompatibility`、`TabsSurfaceCompatibility`、`TabsLocalizationTesting`、`TabsContentScaling`、`TabsThemeVariation`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 暴露面（`SecurityValidation`）：`exported` 声明、技能与 action 契约、关闭按钮仅在多标签时出现的可见性约束
- 输入校验（`TabOperations` 边界用例）：索引、数量、标题前缀的合法域
- 配置契约（`TabBarConfiguration`）：`barWidth` / `barHeight` / `animationDuration` / 分割线线宽 / 字号字重 / 边距与源码常量一致
- 版本与会话（`PanelSessionValidation` / `PanelAuthSession`）：会话唯一性与重试阶段流转
- 日志与隐私（`PanelNotification` 的 `NotiLog`）：hilog 统一标签、无敏感信息外泄
- 资源加载契约（`ResourceLoaderValidation`）：资源名/类型/回退

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 Tabs 组件的交互特点，测试设计特别覆盖：

- 无障碍导航与焦点（`SecurityAccessibility`、`TabsSystemIntegration` 的 `FocusNavigator`）
- 焦点环样式与可见性（`FocusRingModel` 分类）
- 按钮、触摸、手势与事件分发（`TabsButtonInteraction`、`TabsTouchInteraction`、`TabsGestureRecognition`、`TabsEventHandling`、`TabsEventPropagation`）
- 内容缩放、主题与视觉效果（`TabsContentScaling`、`TabsThemeVariation`、`TabsPanelPositioning`）
- 中英文文案与资源完整性（`TabsLocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断示例应用可用性与演示效果的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景回归层与质量层都有对应测试，Tab 增删、切换、样式配置三大核心能力均有专门套件
- 覆盖维度齐全：功能、异常、并发、性能、契约、安全、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、边界目录、压力回放、多采样统计、纯模型隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验标题文案、标签数量、TabContent 数量、焦点位置、队列顺序、淘汰顺序与时延上界
- 测试资产可复用：`SharedDriver` 的页面基线重置、串行化 UI 队列与集中常量便于继续扩展而不破坏既有结构
- 用例规范统一：全部用例带 `@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level` 元数据，统一 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2`，便于追溯与审计

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 50 个套件。当前静态统计：共 **52 个文件**（50 个 `.test.ets` 用例文件 + `List.test.ets` 统一入口 + `Shared/SharedDriver.ets` 共享驱动），**28,341 行**用例代码，**1,035 条用例**。按测试意图分组如下：

| 分组 | 文件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| TabPanel（Tab 面板核心） | 10 | 205 | `TabPanelUI`：初始渲染、标题可见性、新增/关闭按钮存在性；`TabOperations`：增删闭环、上限下限、`TopsCappedStore` 容量淘汰；`TabOperationCatalog`：操作目录与 `TcatDescriptor` 排序；`TabBarConfiguration`：TabBar 尺寸/分割线/字号字重/边距契约；`TabPanelLifecycle`、`TabPanelStateManagement`、`TabPanelConsistency`、`TabPanelEndToEnd`、`TabPanelStress`、`TabInputInteraction`：生命周期、状态、一致性、端到端、压力与输入交互 |
| Interaction（交互与可达性） | 9 | 203 | `TabsButtonInteraction`、`TabsTouchInteraction`、`TabsGestureRecognition`：按钮/触摸/手势与 `BtnQueue`/`TouchQueue` 队列模型；`TabsEventHandling`、`TabsEventPropagation`：事件总线与传播路径；`TabsDataBinding`、`TabsContentScaling`、`TabsThemeVariation`、`TabsPanelPositioning`：数据绑定/缩放/主题/定位 |
| LifecycleState（生命周期与状态） | 9 | 198 | `TabsStateRecovery`、`TabsStatePersistence`：状态恢复与持久化；`TabsPanelLifecycle`、`TabsAbilityLifecycle`：面板与 Ability 生命周期；`TabsExceptionHandling`：`ExcValidator` 异常分类与不可变 Tab 链；`TabsSessionManagement`、`TabsResourceManagement`、`TabsConfigurationChanges`、`TabsPanelStateManagement`：会话/资源/配置变更/状态机 |
| Integration（集成与场景） | 8 | 115 | `TabsComprehensiveRegression`、`TabsAdvancedScenarios`、`TabsIntegrationTesting`、`TabsSystemIntegration`、`TabsUserScenarios`：端到端与综合回归；`TabsDeviceCompatibility`、`TabsSurfaceCompatibility`：设备与表面兼容；`TabsLocalizationTesting`：本地化；`TabsOfflineResilience`（文件 `NetworkConnectivity.test.ets`）：离线韧性 |
| PanelValidation（面板校验） | 5 | 138 | `PanelAuthSession`：`AuthRetryMachine` 会话重试状态机；`PanelNotification`：`NotiLog` 通知日志与不可变 Tab；`PanelSessionValidation`：`SvalRetryMachine` 会话校验；`PanelDataSourceValidation`：`DvalRegistry` 数据源注册；`PanelEventToolValidation`：事件工具校验 |
| PerformanceStability（性能与长稳） | 5 | 83 | `TabsAnimationPerformance`：动画时延与 `ActrlIntervalSet`；`TabsPowerPerformance`：电源与焦点性能；`TabsMemoryLeakDetection`：内存泄漏斜率；`TabsLongTermStability`：长稳混合回放；`TabsConcurrencyControl`：并发控制 |
| Security（安全） | 2 | 23 | `SecurityValidation`：`Sval2Validator` 安全裁决与暴露面契约；`SecurityAccessibility`：无障碍安全与焦点环 |
| Validation（校验与工具） | 2 | 70 | `AnimationControllerValidation`：动画控制器完整校验（49 条）；`ResourceLoaderValidation`：资源加载契约与回退 |

各目录文件数与用例数明细：

| 目录 | 文件数 | 行数 | 用例数 |
| --- | --- | --- | --- |
| `TabPanel/` | 10 | 6,145 | 205 |
| `Interaction/` | 9 | 5,853 | 203 |
| `LifecycleState/` | 9 | 4,936 | 198 |
| `PanelValidation/` | 5 | 3,446 | 138 |
| `Integration/` | 8 | 3,094 | 115 |
| `PerformanceStability/` | 5 | 2,281 | 83 |
| `Validation/` | 2 | 1,851 | 70 |
| `Security/` | 2 | 735 | 23 |
| `Shared/`（共享驱动） | 1 | 706 | 0 |
| `List.test.ets`（统一入口） | 1 | — | 0 |
| **合计** | **52** | **28,341**（不含驱动与入口） | **1,035** |

## 7. 结论

`HandletabsSample` 当前测试设计已经形成"共享驱动 + Tab 领域模型 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构围绕 Tabs 增删标签的三大核心能力（数量上下限守卫、标题命名规则、切换状态机）与 TabBar 样式契约展开，具备良好的扩展性、可维护性和风险发现能力，可以作为示例工程后续持续集成、版本回归和测试审计的核心基础。

## 附录 A：测试框架与模式

- 框架：`@ohos/hypium@1.0.30`（本地 `hypium_static`，ArkTS 1.2 静态版本），`describe` / `it` / `expect`，用例统一使用 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2`
- 用例元数据：每条用例带 JSDoc `@tc.number`（`SUB_SAMPLE_HANDLETABS_*` 编号）/ `@tc.name` / `@tc.desc`（英文）/ `@tc.size` / `@tc.type` / `@tc.level`
- UI 驱动：`@ohos.UiTest` 的 `Driver` / `ON` / `Component`，全部 UI 操作经 `SharedDriver.runUiTask` 串行化，避免焦点与状态竞争
- 异步与超时：用例为 `async (): Promise<void> => { ... }`；`-s timeout` 控制单用例超时（本次建议 15000 或 60000）
- 生命周期钩子：`beforeAll` 调用 `bringPanelToFront` 拉起并等待首页稳定、`beforeEach` 调用 `resetPanelToInitial` 恢复初始两标签、`afterEach` 调用 `settlePanel` 固定短延时、`afterAll` 收尾延时
- 日志：统一 `@ohos.hilog`，内容为英文
- 断言：布尔用 `assertTrue/assertFalse`，非布尔用 `assertEqual(actual, expected)`；异常路径断言 `e.name` 精确值；强制失败用 `expect().assertFail()`

## 附录 B：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行且已解锁 | 无 | 成功拉起 `EntryAbility`，首页 `Tabs` 渲染 | 是 | Pass |
| 初始标签渲染 | 应用已拉起 | 无 | `页面1`、`页面2` 两个标签标题可见 | 是 | Pass |
| 新增 tab 页签 | 首页可见，标签数 < 4 | 点击 `+` 按钮 | 新增一个标签，标题为 `页面3` | 是 | Pass |
| 新增至上限 | 首页可见 | 连续点击 `+` 两次 | 标签数达 4，`+` 按钮消失 | 是 | Pass |
| 删除 tab 页签 | 首页可见，标签数 > 2 | 点击 `X` 按钮 | 被点击页签消失，标签数递减 | 是 | Pass |
| 删除下限守卫 | 标签数等于 `MIN_REMOVABLE_TAB_COUNT` | 尝试删除 | 删除被拒绝，数量不变 | 是 | Pass |
| Tab 切换 | 首页可见 | 点击目标标签 | `selectedIndex` 更新为目标索引，内容区同步 | 是 | Pass |
| 前后台切换 | 首页可见 | 切后台再回前台 | 页面与标签状态保持 | 是 | Pass |

## 附录 C：运行方式

> **前置条件（必做）**：设备屏幕必须处于**已解锁**状态。锁屏状态下执行 Ability assistant 的 `test` 子命令会直接报
> `00508013 App launch timed out. Make sure the screen is unlocked.`；即使测试勉强启动，所有 UI 断言也会失败。
> 仅执行 `power-shell wakeup` 不够，还需上滑解锁：
>
> ```bash
> hdc shell power-shell wakeup
> hdc shell "uinput -T -m 360 1000 360 200 400"
> hdc shell power-shell timeout -o 86400000   # 延长息屏超时，避免长时间跑测中途灭屏
> ```

```bash
# 1. 构建 ohosTest HAP
hvigorw --mode module -p module=entry@ohosTest -p isOhosTest=true \
  -p product=default -p buildMode=test assembleHap \
  --analyze=normal --parallel --incremental --no-daemon

# 2. 构建主应用 HAP
hvigorw --mode module -p module=entry@default -p product=default \
  assembleHap --analyze=normal --parallel --incremental --no-daemon

# 3. 安装两个 HAP
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 4. 执行 Ability assistant 的 test 子命令拉起测试套件（设备需已解锁，见上方前置条件）
# 其中 <ability-assistant> 为设备 shell 中 Ability assistant 命令行工具的命令名，执行时替换为对应命令
hdc shell <ability-assistant> test -b com.samples.HandletabsSample -m entry_test \
  -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

> **注意**：同一 bundle 上不能同时运行两个 Ability assistant 的 `test` 子命令会话（DevEco 与命令行同时跑会互相 uninstall / 杀进程）。
> 另外 `hvigorw` 增量构建有时会把 `PackageHap` 判为 `UP-TO-DATE`，改完测试代码后建议先 `clean` 或确认 HAP 时间戳。

> **构建陷阱**：若日志出现 `[TID xxx] E/pandafile: Failed to open panda file ... No such file or directory`
> 但 `CompileStaticArkTS` 显示 `Finished`、`BUILD SUCCESSFUL`，说明静态编译实际失败但错误被吞、HAP 中无字节码。
> 此时检查 `entry/build/default/cache/default/default@CompileStaticArkTS/debug/*.abc` 数量是否为 0，
> 并直接调用 SDK 的 build-system driver 获取真实错误（详见附录 E）。

## 附录 D：实测结果（最近一次记录）

| 项目 | 数值 |
| --- | --- |
| 注册套件数 | 50 |
| 用例总数 | 1,035 |
| 测试启动耗时（`OnPrepare` → 首条 `OHOS_REPORT`） | 约 8.4 - 8.6 秒 |
| DevEco 启动窗口上限 | 10 秒 |
| 结果 | 全部启动成功，无 `00508013` / `THREAD_BLOCK_6S` |

## 附录 E：已知问题与陷阱（保留记录）

| 问题 | 表现 | 处置 |
| --- | --- | --- |
| 静态编译错误被吞 | `CompileStaticArkTS` 显示 `Finished`、`BUILD SUCCESSFUL`，但 `.abc` 为 0 个，后续 `ark_link` 报 `pandafile: Can't open file`，HAP 内无 `ets/modules_static.abc` | 直接运行 SDK build-system driver 获取真实语义错误；常见为 ArkTS 1.2 红线：`catch (e: Error)` 需改 `catch (e)`、`build()` / `@Builder` / 导出函数需标 `: void`、数字类型 `as` 转换需改 `Double.toLong()` 等显式转换 |
| Hypium 套件注册/过滤耗时过长 | 套件规模过大时 `OnPrepare` → 首条输出耗时显著增长，超过 DevEco 10 秒启动窗口后报 `00508013`；设备侧可能触发 `THREAD_BLOCK_6S` | 控制 `List.test.ets` 注册规模，并对 `ClassFilter` / `NestFilter` 做索引优化（className 预解析为 Set、单层套件走快速路径），当前约 8.5 秒完成启动 |
| 用例间状态污染 | 前一用例点过 `+` 后 Tab 数变为 3/4，后续断言"初始两页可见"失败 | `beforeEach` 统一调用 `resetPanelToInitial`（经 `onNewWant` 重新 `loadContent`）；`EntryAbility` 已增加 `onNewWant` 实现 |
| 测试应用与 EntryAbility 抢主线程 | 应用启动前台化超时（`LIFECYCLE_TIMEOUT`）或测试进程被杀 | `TestAbility.onCreate` 在 `startAbility` 后轮询 `getCurrentTopAbility()` 直到 `EntryAbility` 到达前台，再启动 Hypium |
| 设备锁屏 | Ability assistant 的 `test` 子命令直接报 `00508013 App launch timed out. Make sure the screen is unlocked.` | 执行附录 C 的解锁三步；`deviceLocked: true` 不影响，关键是 `screenLocked: false` |
