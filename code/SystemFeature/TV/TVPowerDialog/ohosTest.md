# TVPowerDialog 测试说明

> 本说明面向 `TVPowerDialog`（OpenHarmony `sysDialog/power` TV 电源对话框）工程，用于说明电源对话框自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVPowerDialog` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试按以下层次拆分，避免所有用例堆叠在单一场景层：

- Foundation 层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作执行器、遥控器按键/触摸模拟、焦点与组件断言、对话框可见性判定、超时/容差常量与 Driver 管理
- Domain 层：围绕 `PowerItemInfo` 数据模型、`PowerOperation` 枚举、`Constants` 常量、`KeyCode` 键码契约、`Logger`/`EventUtil`/`PointerUtil`/`CommonEventUtil` 等核心域逻辑展开确定性单元测试（`test1/` 下 `model`、`keycode`、`common` 等子目录）
- Scene 层：模拟电源对话框弹出、默认焦点锚定、遥控器焦点导航、鼠标悬停/触摸交互、电源操作流、返回退出等真实 TV 使用场景
- Quality 层：补充性能、长稳压力、并发、内存泄漏、安全、契约、无障碍、配置兼容性等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- `Shared/SharedDriver.ets`：78 个测试文件复用，提供 `runSerializedUiOperation`、`triggerSerializedKey`、`pressAndWait`、`simulateTouch`、`checkFocusState`、`getCurrentFocusIndex`、`checkTextContent`、`powerDialogComponentCount`、`isPowerDialogVisible`、`waitForDialogStable`、`triggerPowerDialog`、`launchPowerDialogApp` 等能力，并统一定义遥控器键码（KEY_LEFT/RIGHT/UP/DOWN/ENTER/BACK/HOME/POWER）与超时、容差常量
- 文件级单例 Tracker 模式：每个测试文件自带 `XxxTracker.getInstance()` 单例（如 `FocusNavigationTracker`、`ConcurrencyTracker`、`StateRecoveryTracker` 等），既模拟业务状态又记录操作历史与统计
- 串行化 UI 操作执行器：TV 设备 UI 线程单例特性要求 UI 操作必须串行化，`runSerializedUiOperation` 通过 Promise 链避免并发导致的焦点竞争和状态混乱
- 测试环境安全防护：主代码 `PowerDialog.ets` 中真实电源操作（`power.shutdown`/`power.reboot`/`power.suspend`）在测试环境注释，以 Logger 记录操作成功，避免设备休眠/关机导致自动化中断

通过复用驱动、Tracker 和键码/超时常量，避免重复造轮子，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分辨率 × 语言 × 方向（`Integration/DeviceCompatibility.test.ets`、`PowerCompatibility.test.ets`）
- 输入方向 × 焦点位置（`Interaction/FocusNavigation.test.ets`、`FocusRingBehavior.test.ets`）
- 生命周期状态 × 故障模式（`LifecycleState/DialogLifecycle.test.ets`、`StateRecovery.test.ets`、`ErrorRecovery.test.ets`、`ExceptionHandling.test.ets`）
- 键码两两矩阵与属性网格（`test1/keycode/KeyCodePairwiseMatrix.test.ets`、`KeyCodePropertyGrid.test.ets`）
- 模型参数化网格与枚举扫描（`test1/model/PowerItemInfoComboGrid.test.ets`、`PowerItemInfoOperationSweep*.test.ets`）
- 主题 / 缩放 / 语言枚举矩阵（`Interaction/ThemeVariation.test.ets`、`ContentScaling.test.ets`、`Integration/LocalizationTesting.test.ets`）
- 网络状态 × 中断场景组合（`PowerValidation/PowerOfflineNetwork.test.ets`、`PowerInterruptionRecovery.test.ets`）

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 电源对话框三项操作渲染（`pages/PowerDialog.ets` 的 `aboutToAppear` 构建熄屏/关机/重启三项列表）
- 默认焦点锚定（`defaultFocus(index == 1)` 关机项默认聚焦）
- 焦点状态机（`onFocus`/`onBlur`/`onHover`/`isFocus` 翻转与高亮边框）
- 按键分发（`onKeyEvent`：ENTER 触发三操作、DPAD 方向导航、Back 退出）
- 触摸/点击分发（`EventUtil.isTouchEvent` 判定 + 三操作分支）
- 数据模型（`model/PowerItemInfo.ets`：icon/onFocusIcon/isFocus/name/operationType 五字段）
- 操作类型与常量（`common/Constant.ets`：`PowerOperation` 枚举 0/1/2、尺寸/颜色常量）
- 公共事件（`common/CommonEventUtil.ets`：熄屏 powerBoolean 发布/订阅）
- 光标切换（`common/PointerUtil.ets`：悬停时切换点击样式）
- 对话框承载（`ServiceExtAbility/PowerDialogAbility.ets`：UIExtensionAbility、`setWindowBackgroundColor` 透明、LocalStorage 传递 session）
- 生命周期（`MainAbility.ets` 窗口加载、后台 `terminateSelf`）

### 3.2 关键风险点

围绕 TV 电源对话框场景，重点识别如下风险：

- 电源操作误触发导致设备关机、重启或熄屏
- 默认焦点错位、焦点丢失或方向导航失效
- 悬停/焦点状态竞争导致高亮不一致
- 按键与触摸并发导致操作串扰
- 对话框会话未正常回收导致资源泄漏
- 公共事件发布/订阅不一致导致 SystemUI 熄屏逻辑失效
- 多语言、分辨率、字体缩放组合下布局越界
- 无障碍焦点缺失、文本不可读或无法按遥控方向导航

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"能否操作电源"，而是拆成可验证的细粒度行为：

- 三项电源操作渲染（熄屏/关机/重启的文案、图标、焦点图标）
- 默认焦点锚定与焦点唯一性
- 方向键焦点移动与边界
- 确认键触发电源操作
- 触摸/鼠标点击触发电源操作
- 鼠标悬停高亮与光标样式切换
- 返回键/返回手势退出
- 熄屏公共事件发布与订阅
- 对话框窗口透明背景
- 生命周期与前后台切换

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法按键码、越界坐标、超屏坐标注入
- 资源加载失败（图标/文本）
- 超时与无效输入
- 空引用与无效状态
- 焦点丢失与组件渲染失败
- 配置变更、网络中断、会话中断期间的异常处理

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置
- 对话框组件数量是否回到稳定基线（容差 `TOLERANCE_COMPONENT_COUNT = 3`）
- 对话框状态机是否回到合法状态
- 公共事件收发是否一致、是否存在丢失

这保证了异常测试不仅关注"报错"，也关注"报错之后系统是否恢复正确"。

### 4.3 并发与长稳

TV 形态下，用户可能连续执行导航、触发操作、开关对话框等动作，因此需要覆盖：

- 并发按键与并发操作（`PowerDialog/PowerDialogConcurrency.test.ets`、`PerformanceStability/ConcurrencyControl.test.ets`）
- 高频导航与快速焦点变化
- 长轮次混合操作回放（`test1/scenario/ScenarioStress*.test.ets`、`ScenarioLongRunning.test.ets`、`PerformanceStability/LongTermStability.test.ets`）
- 弹窗开关与导航后的内存泄漏检测（`PerformanceStability/MemoryLeakDetection.test.ets`）
- 组件数双遍比对与计数稳定性校验

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录焦点切换、对话框渲染、电源操作执行、页面渲染多类时延
- 使用平均值、峰值、最大/最小值和限时断言（500ms 焦点、2000ms 操作、1000ms 渲染等）观察趋势
- 对同一操作序列做双遍组件数与耗时指纹比对，验证稳定性
- 在多种分辨率、旋转角度（0/90/180/270）、多语言、多主题、75%~200% 缩放下重复执行

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 功能与权限映射完整性检查（`Security/PowerSecurity.test.ets`、`SecurityValidation.test.ets`）
- 系统权限要求、拒绝降级与撤销重授权（`Security/SecurityAccessibility.test.ets`）
- 电源操作目录契约（`PowerDialog/PowerOperationCatalog.test.ets`：操作类型唯一性、语义完整性、与分发逻辑联动）
- 公共事件契约（`Validation/CommonEventUtilValidation.test.ets`、`test1/common/CommonEventRoundTrip.test.ets`：订阅/退订、分发、载荷、多次发布无丢包）
- 键码数值契约（`test1/keycode/KeyCode.test.ets`：7 键值锁定、唯一性两两矩阵、DPAD 区间）
- 数据源与会话校验（`PowerValidation/PowerDataSourceValidation.test.ets`、`PowerSessionValidation.test.ets`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍焦点导航与焦点顺序逻辑（`Interaction/AccessibilityNavigation.test.ets`、`Security/SecurityAccessibility.test.ets`）
- 关键文案是否可读、高对比度兼容
- 焦点高亮样式与焦点环行为（`Interaction/FocusRingBehavior.test.ets`）
- 按钮交互与手势识别（`Interaction/ButtonInteraction.test.ets`、`GestureRecognition.test.ets`）
- 布局在不同分辨率、字体缩放下是否越界（`Interaction/ContentScaling.test.ets`、`UIComponentRendering.test.ets`）

这部分是判断 TV 大屏可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从公共驱动层到单元算法层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、安全、契约、无障碍、兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、长稳回放、双遍指纹、状态快照并存
- 数据校验细化：不仅校验操作结果，还校验焦点、组件数、状态机、公共事件与数据模型
- 测试资产可复用：SharedDriver 与文件级 Tracker 模式便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

| 目录 | 职责 |
|---|---|
| PowerDialog | 电源对话框核心交互测试（渲染、操作流、状态管理、生命周期、压力、一致性、端到端） |
| Interaction | UI 交互测试（焦点导航、焦点环、悬停、触摸、手势、事件分发、数据绑定、视觉） |
| Integration | 系统集成与端到端测试（设备兼容、多语言、网络连通、用户场景、综合回归） |
| LifecycleState | 对话框/扩展生命周期、会话管理、状态持久化与恢复、异常处理测试 |
| PerformanceStability | 性能、长稳、压力、并发与内存泄漏检测测试 |
| PowerValidation | 电源数据源、事件工具、会话、通知与中断恢复校验测试 |
| Security | 权限、安全与无障碍测试 |
| Validation | 单元级校验测试（日志、键码、指针、公共事件、焦点/对话框/配置管理器、输入、资源加载） |
| Shared | 共享 UI 操作驱动（SharedDriver）与键码/超时/容差常量 |
| ability（test1） | Ability 生命周期与扩展 Ability 测试 |
| common（test1） | 公共事件重复/往返、Logger 方法与内容网格测试 |
| keycode（test1） | 键码数值契约、分类、两两矩阵、属性网格测试 |
| model（test1） | PowerItemInfo/Constants 数据模型参数化网格与边界扫描测试 |
| powerdialog（test1） | 对话框焦点边界/导航/过渡/悬停/触摸交互测试 |
| scenario（test1） | 场景级混沌、故障注入、长稳与压力规模测试 |
| uitest（test1） | UiTest 框架组件定位、属性查询与动作注入能力验证 |

## 7. 结论

`TVPowerDialog` 当前测试设计已经形成"基础设施 + 核心域 + 真实场景 + 非功能质量"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为电源对话框后续持续集成、版本回归和测试审计的核心基础。
