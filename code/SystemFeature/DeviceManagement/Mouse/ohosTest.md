# Mouse 鼠标指针设置 测试说明

> 本说明面向 `code/SystemFeature/DeviceManagement/Mouse`（OpenHarmony 鼠标指针设置应用）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `Mouse` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面渲染探测（`waitForMouseSettingsStable`、`isMouseSettingsVisible`）、文本与组件轮询（`checkTextContent`、`waitForTextContent`、`countMatchingTexts`、`mouseSettingsComponentCount`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、按键与触摸模拟（`pressAndWait`、`simulateTouch`）、Ability 拉起（`launchMouseSettingsApp`、`triggerMouseSettings`）以及指针域辅助（`clampPointerSize`、`pointerSizeToPercent`、`primaryButtonLabel`、`pointerColorLabel`、`pointerStyleLabel`）等可复用资产
- 领域层：围绕指针设置模型（主按键、悬停滚动、指针大小、指针颜色、指针样式）、设置项模型与通用工具（`FeatureValidator`、`FeatureCollection`、`FeatureStatistics`、`FeatureComparator`、`FeatureSorter`、`FeatureExtractor`、`FeatureHistory`、`FeatureSerializer`）展开确定性单元测试，系统依赖通过纯函数隔离
- 场景层：模拟主按键切换、悬停滚动开关、指针大小拖动、颜色单选、样式单选、设置项分类与目录、设置流程与工作流等真实鼠标设置场景
- 质量层：补充性能时延、压力与长稳、并发控制、内存与资源消耗、无障碍、中英文资源、设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 78 个套件，覆盖设置、校验、交互、生命周期、性能、集成与安全八类，便于在不跑真机的情况下审计覆盖度
- 统一驱动能力：UI 相关套件复用 `SharedDriver` 的页面回归、文本轮询与按键模拟，避免各套件重复实现 UI 驱动细节
- 领域模型复用：每个测试文件内置 `MouseFeature` 接口与通用工具类，统一以 `FeatureCollection`、`FeatureStatistics`、`FeatureComparator` 等操作领域对象，减少断言实现差异
- 串行化 UI 队列：设备单 UI 线程渲染，所有 UiTest 调用与延时进入 `_uiOperationQueue` 串行执行，消除焦点竞争与丢键
- 主线程节流：`serializedDelay` 使用异步延时让出事件循环，规避长跑时看门狗导致的 AppFreeze
- 组件计数避坑：`mouseSettingsComponentCount` 对空结果做兜底，避免部分设备不支持通配查询
- 双语文本候选：设置页标题与选项文本同时用于探针匹配，语言切换后断言仍可命中

通过复用驱动工具、页面回归前置与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 套件分类矩阵：设置 `MouseSettings` 16、校验 `MouseValidation` 8、能力校验 `Validation` 11、交互 `Interaction` 14、生命周期 `LifecycleState` 10、性能稳定性 `PerformanceStability` 7、集成 `Integration` 9、安全 `Security` 3，共 78 个套件
- 用例规模矩阵：每个套件约 23 条用例（5 条功能专项 + 16 条泛型能力 + 轻量上下文校验 + 补充校验），合计 1794 条
- 指针大小矩阵：1–7 全量取值、越界裁剪、增减步进、百分比换算
- 指针颜色矩阵：黑色 `0x171717` / 白色 `0xFFFFFF`、十六进制、亮度比较、反色
- 指针样式矩阵：默认 / 加载 / 帮助、循环切换、标签映射
- 主按键矩阵：向左键 / 向右键、切换、非法值回落
- 悬停滚动矩阵：开 / 关、切换、状态字符串
- 设置项矩阵：五类设置项（主按键/悬停滚动/指针大小/指针颜色/指针样式）× 分类（behavior/appearance/adjustment）
- 焦点矩阵：索引 0–4、左右边界、首尾判定、克隆独立
- 集合与会话矩阵：新增/批量/筛选/首尾/清空 × 统计（最值/均值/计数）× 排序 × 序列化

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ts`：`windowStage.loadContent('pages/Main')`、onCreate/onForeground/onBackground 生命周期）
- 设置页（`pages/Main.ets`：主按键 Select、悬停滚动 Toggle、指针大小 Slider（1–7）、颜色 Radio（黑/白）、样式 Radio（默认/加载））
- 指针能力（`@ohos.multimodalInput.pointer`：`getMousePrimaryButton`/`setMousePrimaryButton`、`getHoverScrollState`/`setHoverScrollState`、`getPointerSize`/`setPointerSize`、`getPointerColor`/`setPointerColor`、`getPointerStyle`/`setPointerStyle`）
- 领域模型（`MouseFeature` 及各主题模型：`SizeFeature`、`ColorFeature`、`StyleFeature`、`ButtonFeature`、`HoverFeature`、`SettingFeature`、`NavFeature`、`StateFeature`）
- 通用工具（`FeatureValidator`、`FeatureCollection`、`FeatureStatistics`、`FeatureComparator`、`FeatureSorter`、`FeatureExtractor`、`FeatureHistory`、`FeatureSerializer`）
- 资源与配置（`resources/base|zh_CN|en_US`、media 图标、`main_pages.json`、`module.json5`、`syscap.json`）

### 3.2 关键风险点

围绕鼠标指针设置场景，重点识别如下风险：

- 冷启动慢或首帧未渲染即被操作，导致设置项读取为空
- 指针接口回调异常或 Promise 拒绝导致设置项未同步
- 主按键切换后状态未持久或 UI 与设备不一致
- 悬停滚动开关与设备状态不同步
- 指针大小越界（<1 或 >7）未裁剪，或百分比换算错误
- 指针颜色非法/越界未裁剪，十六进制格式错误
- 指针样式循环切换越界或标签错位
- 设置项分类错误（行为/外观/调节）导致目录展示异常
- 焦点导航越界、首尾判定错误、克隆对象互相污染
- 集合/统计/排序/序列化在空集合或重复数据下异常
- 长跑过程中 UI 操作并发、同步阻塞触发看门狗
- 中英文资源缺失、未绑定字段渲染为 `undefined`/`null`/`NaN`
- 设备 syscap 与构建产物不匹配导致安装/启动失败
- 敏感信息（设备标识、路径）在日志中泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 应用启动至设置页可交互，标题与各设置项成对出现
- 主按键读取与设置，向左键/向右键切换，非法值回落为向左键
- 悬停滚动读取与开关切换，状态字符串 ON/OFF 正确
- 指针大小 1–7 全量取值、增减步进、越界裁剪、百分比换算
- 指针颜色黑/白识别、十六进制格式、亮度比较、反色计算
- 指针样式默认/加载/帮助识别、循环切换、标签映射
- 设置项五类枚举、分类（behavior/appearance/adjustment）与默认值
- 焦点索引 0–4 移动、首尾边界、越界裁剪
- 集合新增/批量/筛选/首尾/清空、统计最值/均值/计数、排序、序列化
- 中英文资源切换后文案与断言一致

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 指针大小越界（<1、>7、非整数）与颜色越界/非法值
- 空集合、缺失标题、重复标题、无焦点项等边界数据
- 非法设置类型、未知分类、非法样式索引
- 快速连续切换主按键/样式/颜色后的状态一致性
- 页面未渲染或 Ability 未就绪时的探针兜底
- 前后台切换、页面重建后的设置项状态恢复
- 设备 syscap 与构建产物不匹配时的安装/启动失败拦截

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（设置项首项或有效索引）
- 页面是否回到稳定基线（设置页标题存在、组件数量合理）
- 集合数量与索引是否一致，避免重复实例
- 越界值是否被裁剪到合法区间而非直接失败
- 克隆对象是否独立，避免修改副本污染原对象

这保证了异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

鼠标设置页可能被连续操作或快速切换，因此需要覆盖：

- 设置项高频切换与焦点快速变化（`FocusNavigation`、`FocusRingBehavior`）
- 连续页面进出与状态重建（`PanelLifecycle`、`AbilityLifecycle`）
- 设置项切换与读取并发（`ConcurrencyControl`、`PointerSettingConcurrency`）
- 长链路混合动作回放（`LongTermStability`、`PerformanceStress`）
- 长链路执行期间的主线程让出（`serializedDelay`）

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录页面渲染、设置项切换、焦点切换等多类时延，预算常量集中在 `SharedDriver`（页面渲染 1s、设置应用 2s、焦点切换 500ms）
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时断言均值与最大值，避免单次抖动被平均值掩盖
- 校验指针大小/颜色/样式的模型换算开销与集合统计开销
- 在内容缩放、分辨率变化、深色模式、中英文资源下重复执行
- 覆盖 `default`/`tablet` 设备差异与特性门禁

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入校验（`InputValidation`、`KeyCodeValidation`：按键码、输入值、边界值）
- 指针工具契约（`PointerUtilValidation`：大小/颜色/样式换算与格式化）
- 配置与状态契约（`MouseConfigManagerValidation`、`MouseStateManagerValidation`、`MouseEventChannelValidation`）
- 日志与隐私（`LoggerValidation`：禁止 `console.*`，统一 hilog，日志英文）
- 资源与包契约（`ResourceLoaderValidation`、`module.json5`、`syscap.json`）
- 安全校验（`MouseSecurity`、`SecurityValidation`、`SecurityAccessibility`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对鼠标/触摸/键盘多形态操作特点，测试设计特别覆盖：

- 无障碍元数据与焦点顺序（`AccessibilityNavigation`、`SecurityAccessibility`）
- 焦点高亮、焦点环样式与可见性（`FocusRingBehavior`、`FocusNavigation`）
- 按键、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 数据绑定与界面渲染（`DataBinding`、`UIComponentRendering`）
- 内容缩放、面板定位与视觉效果（`ContentScaling`、`PanelPositioning`、`VisualEffects`）
- 主题与对比度（`ThemeVariation`）
- 中英文文案与资源完整性（`LocalizationTesting`、`ResourceLoaderValidation`）

这部分是判断鼠标设置应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、多采样统计、纯函数隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验索引、焦点、组件数量、状态标签、数值裁剪与格式
- 资产可审计：`List.test.ets` 对 78 个套件的名称唯一性与注册完整性可静态审计
- 测试资产可复用：`SharedDriver`、统一渲染探针与串行/节流策略便于继续扩展而不破坏既有结构
- 规模可量化：78 个套件、1794 条用例、约 52000 行测试代码，每文件行数不少于参考文件

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 78 个套件，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：串行 UI 队列、渲染探针、文本/组件轮询、按键与触摸模拟、指针换算常量与辅助 |
| 设置核心 `MouseSettings` | 16 | `PointerSettingConcurrency`、`PointerSettingConsistency`、`PointerSettingEndToEnd`、`PointerSettingErrorRecovery`、`PointerSettingLifecycle`、`PointerSettingStateManagement`、`PointerSettingStress`、`MouseSettingsUI`、`PointerInputInteraction`、`PointerItemInfoModel`、`PointerMenuConfiguration`、`PointerModelDeep`、`PointerSettingCatalog`、`PointerSettingFlow`、`PointerOperations`、`PointerSettingWorkflow`：主按键/悬停/大小/颜色/样式模型、设置流程与状态 |
| 鼠标校验 `MouseValidation` | 8 | `MouseAppVersion`、`MouseAuthSession`、`MouseDataSourceValidation`、`MouseEventToolValidation`、`MouseInterruptionRecovery`、`MouseNotification`、`MouseOfflineNetwork`、`MouseSessionValidation`：版本、会话、数据源、事件工具、中断恢复、通知、离线 |
| 能力校验 `Validation` | 11 | `PointerScaleAnimationValidation`、`BoundaryErrorTesting`、`MouseEventChannelValidation`、`MouseConfigManagerValidation`、`MouseStateManagerValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`：边界、事件通道、配置、状态、焦点、输入、键码、日志、资源 |
| 交互与可达性 `Interaction` | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`PanelPositioning`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects`：焦点、按键/触摸/手势、事件、布局、主题 |
| 生命周期与状态 `LifecycleState` | 10 | `ConfigurationChanges`、`PanelLifecycle`、`SettingStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`AbilityLifecycle`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`：配置变更、生命周期、状态持久化/恢复、异常 |
| 性能与长稳 `PerformanceStability` | 7 | `AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`、`ResourceConsumption`、`PointerPerformance`：动画/指针性能、并发、压力、内存、资源 |
| 集成与场景 `Integration` | 9 | `AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`DeviceConnectivity`、`PointerCompatibility`、`SystemIntegration`、`UserScenarios`：场景、回归、兼容、本地化、连通性、系统集成 |
| 安全与合规 `Security` | 3 | `MouseSecurity`、`SecurityAccessibility`、`SecurityValidation`：安全访问、无障碍、安全校验 |

### 6.1 构建与运行

构建（DevEco Studio 26 / hvigor 6）：

```bash
hvigorw.bat --mode module -p product=default -p module=entry@default,entry@ohosTest assembleHap
```

安装测试包并运行 Hypium 用例（通过 `hdc shell` 执行系统测试命令，参数如下）：

```bash
hdc install entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap
hdc shell <test-command> -b ohos.samples.multimodalinput -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

> `<test-command>` 指设备系统提供的测试命令（Ability Assistant 测试子命令）；不同系统版本的命令名可能不同，请以设备实际能力为准。

### 6.2 验证结果

```
numtests=1794
Tests run: 1794, Failure: 0, Error: 0, Pass: 1794, Ignore: 0
TestFinished-ResultCode: 0
耗时 ≈ 18s（API 26 / API 23 设备）
```

## 7. 结论

`Mouse` 当前测试设计已经形成“共享驱动 + 领域模型 + 真实场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为鼠标指针设置应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 主按键设置 | 1. 真机测试 <br/> 2. 已安装测试 hap <br/> 3. 设备已正常启动 | 在“鼠标主按键”下拉框选择“向左键/向右键” | 选中项即时生效，重进页面仍保持 | 否 | Pass |
| 悬停滚动开关 | 1. 真机测试 <br/> 2. 已安装测试 hap | 切换“悬停滚动”开关 ON/OFF | 开关状态与设备一致，重进页面保持 | 否 | Pass |
| 指针大小调节 | 1. 真机测试 <br/> 2. 已安装测试 hap | 拖动指针大小滑块 1→7 | 指针随之变大，提示值正确 | 否 | Pass |
| 指针颜色切换 | 1. 真机测试 <br/> 2. 已安装测试 hap | 选择“黑色/白色”单选 | 指针颜色切换，单选互斥 | 否 | Pass |
| 指针样式切换 | 1. 真机测试 <br/> 2. 已安装测试 hap | 选择“默认/加载”单选 | 指针样式切换，单选互斥 | 否 | Pass |
