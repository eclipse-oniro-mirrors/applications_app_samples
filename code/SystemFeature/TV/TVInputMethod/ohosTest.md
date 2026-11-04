# KikaInput 输入法测试说明

> 本说明面向 `TVInputMethod`（OpenHarmony TV 端输入法应用，包名 `com.samples.kikainput_tv`）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据，并归档手工用例。

## 1. 文档目标

本文档用于说明 KikaInput TV 输入法 ohosTest 自动化测试的设计思路、覆盖层次、用例组织与充分性依据。文档聚焦“为什么这样设计测试”“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计、版本回归与后续扩展。

测试代码位于 `entry/src/ohosTest/ets/test`，入口为 `List.test.ets`（统一登记 79 个套件），运行器为 `OpenHarmonyTestRunner`，测试承载页为 `TestAbility`。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架，按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、串行化按键（`triggerSerializedKey`）、Driver 单例（`getDriver`/`resetDriver`）、键盘可见性判定（`isKeyboardVisible`：以 `ABC`/`中文`/`符号` 文本为渲染信号）、键盘拉起（`launchKeyboardApp`、`triggerKeyboard`）、等待渲染稳定（`waitForDialogStable`，超时后重新拉起输入法）、组件与文本轮询（`findComponentsByType`、`checkTextContent`、`checkComponentExists`）、焦点校验与索引获取（`checkFocusState`、`getCurrentFocusIndex`）、触摸模拟（`simulateTouch`）、连续按键（`pressAndWait`），以及遥控器键码、超时、延迟、容差、压力轮次等常量
- 场景冒烟层：`Ability.test.ets` 以真实设备操作串起“拉起测试应用 → 切换输入法 → 弹出键盘 → 输入内容 → 进入菜单/编辑态 → 光标移动与选中 → 隐藏键盘 → 预上屏”主链路
- 键盘领域层：`Keyboard/` 围绕键位模型、按键操作目录与操作流程、键盘状态机、菜单配置、UI 渲染与输入交互展开确定性测试
- 会话与校验层：`KeyboardValidation/`、`Validation/` 覆盖输入会话建立/终止、授权与会话令牌、候选数据源、按键事件工具、配置与资源加载、日志、边界与指针计算等纯逻辑校验
- 生命周期层：`LifecycleState/` 覆盖 ExtensionAbility 与面板对话框生命周期、前后台与配置变化、状态持久化与恢复、异常与资源释放
- 质量层：`PerformanceStability/`、`Security/`、`Integration/` 覆盖性能时延、并发与长稳、内存泄漏、功耗、安全审计、设备与语言兼容、离线恢复

该分层结构使测试既能验证主链路可用性，也能覆盖领域逻辑与质量属性。

### 2.2 高复用设计

测试中集中复用以下设计资产：

- 统一入口清单：`List.test.ets` 集中登记 79 个套件（8 个分组目录 + 1 个主流程套件），新增套件只需补充 import 与调用，便于审计覆盖规模
- 统一驱动能力：UI 相关套件复用 `SharedDriver` 的串行队列、页面/键盘探针与按键模拟，避免各套件重复实现 UI 驱动细节
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UiTest 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 环境自适应跳过：`isInputMethodEnabled` 检测当前输入法，`skipIfKeyboardUnavailable` 在“未启用输入法”“键盘面板未弹出”时跳过用例，避免把设备/产品配置差异误判为用例失败
- 事件驱动等待：`waitForDialogStable` 以“键盘选项文本出现”为完成条件，超时后重新拉起输入法再等待，替代固定 sleep
- 焦点判定兜底：部分 TV 设备 `ON.focused(true)` 返回不稳定，`checkFocusState`/`getCurrentFocusIndex` 改为遍历组件并逐个 `isFocused()` 校验
- 参数与容差集中化：键码（方向键 2012~2015、ENTER 2049、BACK、HOME、IME）、超时（对话框 1000ms、输入法操作 2000ms、会话 1000ms、焦点 500ms）、延迟（按键 50ms、触摸 100ms、输入法操作后 500ms）、容差（组件数 3、焦点 2）、压力轮次（导航 20、生命周期 10）统一在驱动层维护，便于统一调整

### 2.3 矩阵化设计

关键场景不只测单点，而是用组合矩阵扩展覆盖：

- 分组矩阵：Keyboard 16、Validation 11、KeyboardValidation 8、Interaction 14、LifecycleState 10、PerformanceStability 7、Integration 9、Security 3、主流程 1，共 79 个套件、1813 条用例
- 按键矩阵：字符键/数字键/符号键 × 方向键/ENTER/BACK/HOME/IME × 长按与连续触发 × 合法与非法键码（`KeyCodeValidation`、`KeyOperations`、`KeyOperationCatalog`）
- 键盘形态矩阵：字母键盘/九宫格/符号键盘/数字键盘 × 编辑态/菜单态 × 中文/英文输入（`KeyboardMenuConfiguration`、`KeyboardModelDeep`）
- 会话矩阵：会话创建/激活/就绪/终止 × 授权成功/失败/超时/撤销 × 账户隔离与验证码频控（`InputSessionValidation`、`ImeAuthSession`）
- 配置矩阵：横竖屏 × 主题 × 分辨率 × 字体缩放 × 语言 × 分屏/折叠 × 外接硬件键盘（`ImeCompatibility`、`ConfigurationChanges`）
- 网络矩阵：在线/弱网/离线/飞行模式 × 重试次数 × 重试退避 × 队列顺序与去重（`ImeOfflineNetwork`、`NetworkConnectivity`）
- 资源与语言矩阵：base/zh_CN/en_US × 资源名/类型 × 缓存与回退（`LocalizationTesting`、`ResourceLoaderValidation`）
- 压力矩阵：高频方向键 × 连续输入 × 快速开关键盘 × 长链路混合动作（`KeyboardStress`、`PerformanceStress`、`LongTermStability`）

## 3. 测试对象拆解

### 3.1 主流程

- 输入法服务承载（`ServiceExtAbility/ServiceExtAbility.ets`、`model/KeyboardController.ets`：`inputMethod` 类型 ExtensionAbility、面板创建/销毁、窗口尺寸与横竖屏适配、硬按键监听与分发、文本客户端插入/删除/光标与选中信息回填）
- 键盘主界面（`pages/index.ets`：`menuType` 菜单切换、`pinyin` 候选、`isChinese`/`isNineKey`/`isKeySet`/`isLandscape`/`is4k` 状态联动、窗口尺寸与安全区处理）
- 键盘组件（`components/`：字母键 `KeyItem`、九宫格键 `KeyNineItem`、符号菜单 `SymbolMenu`、数字菜单 `NumberMenu`、中文候选 `ChineseKeyMenu`/`PinYinView`、编辑态按键 `SelectText`/`ShiftItem`/`SpaceItem`/`ReturnItem`/`DeleteItem`/`DownMenu` 等）
- 拼音引擎（`cpp/` 静态库 `libime_pinyin` 与 `model/PinYinService.ets`、`model/PinyinMessage.ets`、`worker/Worker.ets`：字典加载、候选计算、Worker 线程消息与 `AppStorage` 回填）
- 数据源（`model/BasicDataSource.ets`、`model/ChineseDataSource.ets`、`model/keyboardKeyData.ets`、`model/HardKeyUtils.ets`、`model/focusInfo.ets`）
- 辅助 Ability 与页面（`entryability/EntryAbility.ets`、`pages/PrivatePreview.ets`：预上屏演示与输入法切换入口）
- 资源与配置（`resources/base|zh_CN|en_US`、`media` 键盘图片与图标、`main_pages.json`、`module.json5`、`syscap.json`）

### 3.2 关键风险点

围绕 TV 大屏输入法场景，重点识别如下风险：

- 设备未启用输入法或键盘面板未弹出，导致 UI 用例全部失败或假通过
- 冷启动/热启动后键盘面板未渲染即被操作，按键丢事件
- 遥控器焦点丢失、焦点落点错位、焦点环不可见
- 按键码非法或硬按键与软键盘行为不一致，导致输入丢失或重复
- 菜单切换（字母/数字/符号/编辑）后状态残留，键盘显示错乱
- 中文候选、预上屏与光标/选中同步错误，出现重复上屏或选区错位
- 会话创建/终止异常、授权超时后仍可输入
- 横竖屏切换、4K/1080P 分辨率切换、字体缩放后布局越界或按键不可点
- 长跑中 UI 操作并发、同步阻塞触发主线程看门狗
- 断网/弱网下队列乱序、重复同步或重试无上限
- 日志与敏感信息（输入内容、设备标识、路径）泄露
- 中英文与第三方语言资源缺失，文案与断言不一致

## 4. 覆盖维度设计

### 4.1 功能正确性

- 使用 Ability Assistant（命令行工具）的 start 子命令拉起测试承载页并校验栈顶 Ability 为 `TestAbility`
- 通过系统输入法选择列表切换到 `kikainput` 并回到编辑框
- 点击自绘编辑框拉起键盘，校验键盘面板（`keyboardMenu`）出现
- 依次点击字符键，校验编辑框文本按输入顺序拼接（如 `acd`）
- 进入菜单页并点击编辑按钮，校验编辑态按键（`btn_selection`）出现
- 编辑态左右移动光标，校验文本长度随光标位置变化
- 编辑态选中文本后左右移动，校验选区由 1 个字符变为取消选中
- 点击键盘右上角收起按钮，校验键盘组件消失
- 输入 `hel` 触发预上屏 `hello world` 并回车上屏；输入 `abhel` 触发 `abhello world`
- 键盘形态与菜单配置、九宫格/符号/数字键盘切换后的按键布局与回填
- 候选词生成、中文输入与候选回填、拼音串清空

### 4.2 异常流与恢复

- 非法按键码、越界索引、空数据源、空会话下的安全返回
- 会话创建失败/激活失败/终止重复调用（幂等）与状态机非法迁移拦截
- 授权超时、令牌过期、验证码频控与账户不存在等负向分支
- 输入法服务中断、面板被系统关闭、前后台切换后的键盘恢复
- 断网/弱网/飞行模式下的本地可用性、操作记录、队列顺序与恢复后不丢操作
- 非法配置值（字号 0、负安全区、重复设置同值）不崩溃且状态稳定
- 异常抛出后的错误码、日志与资源释放

恢复类用例除校验返回值外，还要求校验：键盘是否重新可见、焦点是否回到有效位置、状态机是否回到稳定基线、队列与计数是否一致。

### 4.3 并发与长稳

- 高频方向键与连续字符键输入（`KeyboardConcurrency`、`KeyboardStress`）
- 快速连续开关键盘、菜单反复切换（`KeyboardLifecycle`、`DialogLifecycle`）
- 输入、候选刷新与面板销毁并发（`ConcurrencyControl`）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）
- 全程通过 `runSerializedUiOperation`/`serializedDelay` 让出事件循环，降低主线程阻塞风险

### 4.4 性能与兼容性

- 采集键盘拉起、面板渲染、按键响应、菜单切换、候选刷新、会话创建等时延
- 通过 `PerformanceMonitor` 统计均值/最大值等指标，使用宽松上界断言，仅拦截异常变慢
- 覆盖动画帧率与卡顿（`AnimationPerformance`）、操作功耗与输入法资源消耗（`ImeConsumption`）、内存水位与泄漏斜率（`MemoryLeakDetection`）
- 覆盖 1080P/4K、横竖屏、深色主题、字体缩放、语言切换、分屏与折叠形态、外接硬件键盘（`ImeCompatibility`、`DeviceCompatibility`）
- 覆盖键盘在 TV 大屏与 rk3568 设备上的表现差异

### 4.5 安全与契约

- 输入内容与敏感信息校验（`InputValidation`、`SecurityValidation`、`ImeSecurity`：长度、字符集、脱敏、日志不落明文）
- 会话授权与令牌（`ImeAuthSession`：授权有效期、令牌过期判定、账户隔离）
- 权限与无障碍安全（`SecurityAccessibility`：焦点可见性、可读性、敏感操作提示）
- 配置与资源契约（`ConfigurationManagerValidation`、`ResourceLoaderValidation`、`CommonEventUtilValidation`、`LoggerValidation`）
- 键码与指针契约（`KeyCodeValidation`、`KeyEventToolValidation`、`PointerUtilValidation`）
- 版本与包元数据（`ImeAppVersion`）

### 4.6 可达性与易用性

- 遥控器焦点顺序、焦点环高亮与可见性（`FocusNavigation`、`FocusRingBehavior`）
- 无障碍节点与导航（`AccessibilityNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 内容缩放、布局测量与弹窗定位（`ContentScaling`、`DialogPositioning`、`UIComponentRendering`）
- 主题与视觉效果（`ThemeVariation`、`VisualEffects`）
- 数据绑定与状态联动（`DataBinding`）

## 5. 充分性说明

- 覆盖层次完整：共享驱动层、场景冒烟层、键盘领域层、会话校验层、生命周期层、质量层均有对应套件
- 覆盖维度齐全：功能、异常、并发、性能、安全、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：真机 UI 场景、纯逻辑状态机、矩阵组合、压力回放、多采样统计并存
- 数据校验细化：不仅校验组件存在，还校验文本内容、选区长度、焦点索引、状态迁移、队列顺序与时延上界
- 具备规模与可审计性：79 个套件、1813 条用例集中在 `List.test.ets` 注册，分组目录职责清晰
- 具备环境鲁棒性：输入法不可用的设备自动跳过 UI 用例，避免环境差异污染结果
- 资产可复用：`SharedDriver` 的串行化、等待与探针能力可继续扩展到更深矩阵与更长链路

## 6. 测试环境与执行方式

| 项目 | 说明 |
| --- | --- |
| 操作系统 | OpenHarmony 标准系统（TV / RK3568 设备） |
| SDK | OpenHarmony SDK API 18 及以上 |
| 开发工具 | DevEco Studio |
| 测试框架 | Hypium + UiTest（`entry/src/ohosTest`） |
| 测试模块 | `entry_test` |
| 测试入口 | `OpenHarmonyTestRunner`（`entry/src/ohosTest/ets/testrunner`） |
| 被测应用 | `com.samples.kikainput_tv`（`entry` 模块） |

1. 在 DevEco Studio 中打开工程并完成 SDK、签名配置。
2. 在 `entry/src/ohosTest` 目录上右键选择 `Run 'Tests in entry'` 执行全部自动化用例。
3. 也可通过 `hdc shell` 调用系统 Ability Assistant 命令行工具执行测试，参数为 `-b com.samples.kikainput_tv -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 60000`。

## 7. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，按测试意图分组如下：

| 分组 | 套件数/用例数 | 代表套件与职责 |
|---|---|---|
| 主流程 | 1 / 11 | `Ability.test.ets`：拉起测试应用、切换输入法、弹出键盘、字符输入、进入菜单与编辑态、光标左右移动、文本选中、隐藏键盘、预上屏 |
| 键盘领域 `Keyboard` | 16 / 414 | `KeyInfoModel`、`KeyOperations`、`KeyOperationCatalog`、`KeyOperationFlow`、`KeyOperationWorkflow`、`KeyboardModelDeep`、`KeyboardStateManagement`、`KeyboardMenuConfiguration`、`KeyboardUI`、`KeyboardInputInteraction`、`KeyboardLifecycle`、`KeyboardErrorRecovery`、`KeyboardConsistency`、`KeyboardConcurrency`、`KeyboardStress`、`KeyboardEndToEnd`：键位模型、按键操作目录与流程编排、键盘状态机、菜单配置、渲染与输入交互、生命周期、错误恢复、一致性、并发、压力与端到端 |
| 校验与契约 `Validation` | 11 / 353 | `KeyCodeValidation`、`PointerUtilValidation`、`FocusManagerValidation`、`DialogStateManagerValidation`、`ConfigurationManagerValidation`、`AnimationControllerValidation`、`ResourceLoaderValidation`、`LoggerValidation`、`CommonEventUtilValidation`、`InputValidation`、`BoundaryErrorTesting`：键码与指针计算、焦点与弹窗状态、配置与资源、动画控制、日志、公共事件、输入清洗与边界错误 |
| 键盘会话校验 `KeyboardValidation` | 8 / 282 | `InputSessionValidation`、`ImeAuthSession`、`ImeDataSourceValidation`、`KeyEventToolValidation`、`ImeInterruptionRecovery`、`ImeNotification`、`ImeOfflineNetwork`、`ImeAppVersion`：输入会话建立/就绪/终止、授权与验证码、候选数据源、按键事件工具、输入中断恢复、通知、离线与弱网队列、版本元数据 |
| 生命周期与状态 `LifecycleState` | 10 / 184 | `ExtensionLifecycle`、`DialogLifecycle`、`DialogStateManagement`、`ConfigurationChanges`、`StatePersistence`、`StateRecovery`、`SessionManagement`、`ResourceManagement`、`ErrorRecovery`、`ExceptionHandling`：ExtensionAbility 与面板生命周期、弹窗状态、配置变化、状态持久化与恢复、会话与资源管理、异常处理 |
| 交互与可达性 `Interaction` | 14 / 272 | `FocusNavigation`、`FocusRingBehavior`、`AccessibilityNavigation`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`DataBinding`、`ContentScaling`、`DialogPositioning`、`UIComponentRendering`、`ThemeVariation`、`VisualEffects`：焦点导航与焦点环、无障碍、按键/触摸/手势与事件分发、数据绑定、缩放与布局、弹窗定位、渲染、主题与视效 |
| 性能与长稳 `PerformanceStability` | 7 / 132 | `ImePerformance`、`ImeConsumption`、`AnimationPerformance`、`MemoryLeakDetection`、`ConcurrencyControl`、`LongTermStability`、`PerformanceStress`：键盘时延、资源与功耗、动画性能、内存泄漏、并发控制、长稳与压力 |
| 集成与场景 `Integration` | 9 / 110 | `UserScenarios`、`AdvancedScenarios`、`IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`ImeCompatibility`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity`：真实输入场景、系统集成、全量回归、输入法与设备兼容、多语言、网络可用性 |
| 安全与合规 `Security` | 3 / 55 | `ImeSecurity`、`SecurityValidation`、`SecurityAccessibility`：输入安全、敏感信息与审计、安全可达性 |

## 8. 结论

`TVInputMethod` 当前测试设计已形成“共享驱动 + 键盘领域校验 + 会话与契约校验 + 真机场景冒烟 + 非功能质量”的组合式覆盖结构（79 个套件、1813 条用例），并具备输入法缺失环境自动跳过、UI 操作串行化、焦点判定兜底等稳定性设计，可作为 TV 输入法后续持续集成、版本回归与测试审计的基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 输入法切换到 kikaInput | 1、拉起测试应用主界面，自绘编辑框显示 | 1、成功拉起应用 | 是 | Pass |
| 切换输入法 | kikaInput 输入法已安装 | 1、拉起切换输入法弹窗<br/>2、切换输入法到当前应用 | 1、成功切换输入法 | 是 | Pass |
| 拉起输入法按键盘 | 应用已启动 | 1、点击自绘编辑框 | 1、拉起输入法键盘 | 是 | Pass |
| 输入内容 | 键盘已弹起 | 1、点击输入法键盘，输入内容 | 1、自绘编辑框成功输入内容 | 是 | Pass |
| 进入菜单 | 输入法键盘弹起 | 1、点击左上角键盘按钮 | 1、进入菜单页，有编辑按钮 | 是 | Pass |
| 进入编辑状态 | 位于菜单页 | 1、点击编辑按钮 | 1、进入编辑状态 | 是 | Pass |
| 左移光标 | 编辑状态 | 1、点击向左方向键 | 1、光标成功左移 | 是 | Pass |
| 右移光标 | 编辑状态 | 1、点击向右方向键 | 1、光标成功右移 | 是 | Pass |
| 文本选中 | 编辑状态 | 1、点击选择按钮<br/>2、点击左方向键<br/>3、点击向右方向键 | 1、变为选择状态<br/>2、向左选中一个字符<br/>3、第 2 步选中的字符取消选中 | 是 | Pass |
| 隐藏键盘 | 输入法键盘弹起 | 1、点击输入法键盘右上角 down 按钮 | 1、输入法键盘隐藏 | 是 | Pass |
| 键盘切换 | 键盘已弹起 | 1、点击主子键盘和符号键盘切换按钮 | 1、成功切换键盘，键盘显示正常 | 否 | Pass |
| 拉起预上屏 Ability | 应用已启动 | 1、拉起 EntryAbility | 1、弹出的输入法选择弹框中选择 kikainput | 是 | Pass |
| 文本头文本触发预上屏 | 输入法切换到 kikaInput | 1、文本框中输入 `hel` | 1、输入法触发预上屏 `hello world` | 是 | Pass |
| 中间文本触发预上屏 | 输入法切换到 kikaInput | 1、文本框中输入 `abhel` | 1、输入法触发预上屏 `hello world` | 是 | Pass |

> 说明：
> 1. “是否自动”为“是”的用例由 `entry/src/ohosTest` 中的自动化用例覆盖，“否”的用例为手工验证。
> 2. 新增、删除或修改用例后，需同步更新本文件的套件统计与手工用例表。
> 3. 用例执行失败时，先在设备上复现并记录失败步骤与日志，再排查是否为用例问题、环境问题（输入法未启用）或功能缺陷。
