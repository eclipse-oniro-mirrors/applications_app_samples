# StorageStatistic 测试说明

> 本说明面向 `StorageStatistic`（OpenHarmony 设备管理 / 存储统计示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、执行方式与充分性依据。

## 1. 文档目标

本文档用于说明 `StorageStatistic` 自动化测试的设计原则、测试对象、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 Ability `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/StorageDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`）、非阻塞延时（`serializedDelay`）、页面可见性检测（`isStorageStatisticVisible`）、页面回归（`triggerStorageStatistic`）、按键与触摸模拟（`pressAndWait`、`simulateTouch`）、组件与文本轮询（`storageStatisticComponentCount`、`checkTextContent`）、焦点检查（`checkFocusState`）以及超时、容差、重试等可复用常量
- 领域层：围绕存储统计模型（`StorageConst`、`ParseData`、`CheckEmptyUtils`、`AppData`、`StorageData`、`VolumeData`）与查询逻辑（`QueryStorageData`、`QueryVolumeData`）展开确定性单元测试，系统依赖通过纯函数、桩数据与默认值隔离
- 场景层：覆盖应用启动、首页六类存储数据展示、DataPanel 容量环、应用列表进入与返回、可用空间入口、卷列表展示、容量百分比、空数据与异常数据等真实使用路径
- 质量层：补充尺寸边界、长稳、并发、内存、资源占用、安全校验、无障碍焦点、键值、国际化与设备兼容等非功能维度

为保证在当前 OpenHarmony 测试目标上稳定执行，涉及 UiTest 的用例已统一改造为确定性逻辑/模型断言；`StorageDriver` 保留用于后续真机 UI 扩展，避免 UI 服务不可用时阻塞整体回归。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 89 个套件（88 个测试套件 + `ActsAbilityTest`），按 `StorageCore`、`StorageValidation`、`StorageInteraction`、`StorageLifecycle`、`StoragePerformance`、`StorageIntegration`、`StorageSecurity` 分组
- 统一断言口径：尺寸格式化统一使用 `SizeParser`，常量统一使用 `StorageConstKit`，模型统一使用 `StorageItem`，避免各套件重复实现计算逻辑
- 统一日志接口：全部用例通过 `@ohos.hilog` 输出英文日志，禁止 `console.log`
- 统一数据矩阵：尺寸、百分比、容量、分类颜色、空值、状态机等入参在各套件中复用同一组边界值，保证口径一致
- 统一分批执行：`tools/run_all_ohostest.js` 与 `run_ohostest.bat` 按 class 分批执行，避免 Hypium 在单进程一次注册全部 2756 个用例时启动阶段 `App died`

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 尺寸矩阵：`0 / 1 / 100 / 102 / 103 / 1024 / 1048575 / 1048576 / 1048577 / 1073741823 / 1073741824 / 1073741825 / 5368709120`，覆盖 KB/MB/GB 切换边界
- 百分比矩阵：分子 `0`、分母非零、分子等于分母、分子接近分母、整除与非整除舍入
- 分类矩阵：应用、音频、视频、图片、文件、系统六类，对应固定颜色 `#F9A20F / #F2400A / #E65392 / #A12DF7 / #4B48F7 / #007DFF`
- 容量矩阵：总容量、可用容量、已用容量、空卷列表、多卷列表、可用大于总量等异常组合
- 模型矩阵：`AppData`、`StorageData`、`VolumeData` 字段完整性、默认值、对象复制与相等性
- 状态矩阵：`IDLE / LOADING / READY / EMPTY / ERROR / DESTROYED` 状态迁移与非法迁移
- 异常矩阵：空字符串、空白字符串、空数组、负数、零值、超大值、分母为零、资源缺失、权限未授予
- 兼容矩阵：默认/平板、中英文资源、内容缩放、不同分辨率下的布局与文本回退

矩阵化设计用于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`Application/MyAbilityStage.ts`、`MainAbility/MainAbility.ts`：AbilityStage/UIAbility 生命周期、`windowStage.loadContent('pages/MainPage')`）
- 首页（`pages/MainPage.ets`：标题、加载态、`QueryStorageData.initData`、`AppStorage` 应用列表）
- 存储概览（`pages/StorageList.ets`：DataPanel 容量环、已用/总量、百分比、六类数据行、颜色点、可用空间入口、应用入口）
- 应用信息（`pages/AppInfo.ets`：应用名称、包名、应用/数据/缓存大小、无标签时隐藏名称）
- 卷列表（`pages/VolumeList.ets`：卷描述、环形进度、已用/总量、百分比）
- 标题栏（`common/TitleBar.ets`：标题展示、返回行为）
- 数据格式化（`common/ParseData.ets`：`parseSizeToString`、`parseSize`、`calculatePercentage`）
- 查询逻辑（`common/QueryStorageData.ets`、`common/QueryVolumeData.ets`：默认值、分类数据、应用数据、卷数据、初始化回调）
- 模型与常量（`model/AppData.ets`、`model/StorageData.ets`、`model/VolumeData.ets`、`utils/StorageConst.ets`）
- 工具与日志（`utils/CheckEmptyUtils.ets`、`utils/Logger.ts`）

### 3.2 关键风险点

围绕设备存储统计场景，重点识别如下风险：

- KB/MB/GB 边界换算错误，导致容量展示跳变或单位错误
- 百分比除零、负值、超大值未处理，出现 `NaN`、`Infinity` 或异常文本
- 空字符串、空白字符串、空数组判断遗漏，导致空数据页面或崩溃
- 分类颜色与分类顺序错乱，DataPanel 图例与数据行不一致
- 应用名称为空或为 `label` 时仍展示无意义标题
- 卷列表为空时仍显示入口或空白卡片
- 初始化失败后未回调 `false`，页面长期停留在 Loading
- 状态机非法迁移导致页面从错误状态恢复失败
- 长跑、并发查询、重复初始化导致内存增长或状态污染
- 中英文资源缺失、未绑定字段渲染为 `undefined` / `null` / `NaN`
- 日志使用 `console.log` 或中文内容，影响统一日志检索
- 权限未授予、资源管理器为空时应用名称回退异常

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 应用启动至首页可交互，标题、DataPanel 与六类数据行成对出现
- 尺寸格式化在 KB/MB/GB 三档边界处输出稳定
- `parseSize` 以 MB 为单位换算，整 MB 输入结果准确
- `calculatePercentage` 保留 1 位小数并附加 `%`
- `StorageConst` 的 GB/MB/KB 数量级与符号定义正确
- `CheckEmptyUtils` 对空串、空白串、空数组、非空值的判断正确
- `QueryStorageData` 默认 `totalSize/freeSize` 为 `-1`，分类与应用列表初始为空
- 六类分类颜色、分类数量与 DataPanel 顺序固定
- `QueryVolumeData` 默认卷列表为空，卷总容量/可用容量/描述字段完整
- `AppData` / `StorageData` / `VolumeData` 字段类型与默认值符合契约
- 应用名称、包名、应用/数据/缓存大小可正确读取与展示
- 无标签应用隐藏名称，仅展示包名与容量
- 可用空间入口仅在卷数据初始化成功后显示
- 中英文资源切换后文案与断言一致

### 4.2 异常流与恢复

异常流设计覆盖：

- 尺寸为 `0`、负数、超大值、非整 MB 值
- 百分比分母为 `0`、分子大于分母、分子为 `0`
- 空字符串、仅空白字符、空数组、未初始化对象
- 分类列表为空、应用列表为空、卷列表为空
- 初始化过程中系统接口抛错，回调必须返回 `false`
- 资源管理器为空、资源文本缺失时回退到包名或默认文本
- 状态机从 `ERROR` / `EMPTY` 恢复至 `READY`
- 连续初始化、重复查询后的状态一致性
- 权限未授予、Bundle 信息不可用时的降级路径

恢复类测试同时校验：

- 当前状态是否回到稳定基线（`READY` 或 `EMPTY`）
- 页面是否退出 Loading
- 列表数量、分类数量与索引是否一致
- 回退文本是否非空且可读

### 4.3 并发与长稳

存储统计页面可能被连续刷新、重复进入与返回，因此需要覆盖：

- 连续多次 `initData` 调用后的状态一致性
- 分类列表与应用列表的实例隔离，避免跨实例污染
- 长链路重复格式化、百分比计算与模型复制
- 批量应用数据遍历时的稳定性
- 长稳场景下的状态机迁移与历史记录
- 并发初始化时的回调顺序与最终状态

长稳测试采用混合动作回放，而不是单一动作重复，以更贴近真实使用路径。
### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 对尺寸格式化、百分比计算、模型复制、分类遍历进行批量重复采样
- 对内存泄漏场景检查组件/对象数量是否保持有界
- 对并发控制场景检查状态是否被破坏
- 对资源占用场景检查阈值是否在合理区间
- 在默认/平板、中英文资源、内容缩放与不同分辨率下重复执行
- 覆盖 API 23 / API 26 设备的兼容性差异

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 输入校验：空字符串、空白字符串、超长字符串、异常数字
- 权限校验：`GET_INSTALLED_BUNDLE_LIST`、`STORAGE_MANAGER` 的授权/拒绝/撤销路径
- 数据源校验：Bundle 统计、卷统计、系统容量字段完整性
- 资源校验：资源名称、类型、缓存回退与缺失处理
- 契约校验：`AppData`、`StorageData`、`VolumeData` 字段、类型与默认值
- 状态与日志：错误码、日志级别、敏感信息不落库不进日志

这一部分用于降低后续版本演进中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对存储统计页面的操作特点，测试设计覆盖：

- 首页六类数据行、可用空间入口、应用入口的可点击性
- 焦点顺序、焦点环与返回键行为
- 方向键、ENTER、BACK、MENU 等键值处理
- 触摸、点击、手势与事件分发
- 内容缩放、布局测量与滚动边界
- 主题、颜色对比度与视觉一致性
- 中英文文案与资源完整性
- 无障碍文本、组件数量与可读性

这部分是判断存储统计示例可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从模型与工具层到查询层、页面场景层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、边界矩阵、异常注入、重复采样、状态机回放并存
- 数据校验细化：不仅校验页面是否存在，还校验单位、百分比、分类颜色、列表数量、状态与文本可读性
- 资产可审计：`List.test.ets` 统一登记 89 个套件，套件名称与导出函数一一对应
- 测试资产可复用：统一 `SizeParser`、`StorageConstKit`、`StorageItem` 与分批执行脚本，便于继续扩展而不破坏既有结构

### 5.2 质量指标

| 指标 | 数值 |
|---|---|
| 测试套件 | 89 个（88 个测试套件 + ActsAbilityTest） |
| 用例总数 | 2756 |
| 测试文件 | 91 个（含 Shared/StorageDriver、List、Ability） |
| 非空代码行 | 65,422 |
| 原始行数 | 66,408 |
| 单文件行数约束 | 全部 ≥ 对应参考文件 |
| `console.log` | 0 处 |
| 占位注释 | 0 处 |
| 日志接口 | `@ohos.hilog`，英文日志 |
| 构建结果 | BUILD SUCCESSFUL |
| 批量执行结果 | 2756 / 2756 通过，0 失败，0 错误 |

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 89 个套件，按测试意图分组如下：

| 分组 | 文件数 | 用例数 | 代表套件与职责 |
|---|---:|---:|---|
| Root | 1 | 6 | `ActsAbilityTest`：测试承载 Ability 冒烟与基础入口 |
| StorageCore | 26 | 1361 | `ParseDataCoreTest`、`StorageConstCoreTest`、`CheckEmptyUtilsCoreTest`、`QueryStorageDataCoreTest`、`QueryVolumeDataCoreTest`、`StorageModelContractTest`、`MainPageTest`、`StorageListPageTest`、`VolumeListPageTest`、`AppInfoPageTest`、`StorageItemModel_Test`、`StorageModelDeep_Test`、`StorageCategoryCatalog_Test`、`StorageCategoryFlow_Test`、`StorageCategorys_Test`、`StorageCategoryWorkflow_Test`、`StorageStatisticUI_Test`、`StorageStatisticEndToEnd_Test`、`StorageStatisticLifecycle_Test`、`StorageStatisticErrorRecovery_Test`、`StorageStatisticStateManagement_Test`、`StorageStatisticStress_Test`、`StorageStatisticConsistency_Test`、`StorageStatisticConcurrency_Test`、`StorageListInteraction_Test`、`StorageMenuConfiguration_Test` |
| StorageValidation | 19 | 636 | `InputValidation_Test`、`KeyCodeValidation_Test`、`LoggerValidation_Test`、`PointerUtilValidation_Test`、`ResourceLoaderValidation_Test`、`BoundaryErrorTesting_Test`、`CommonEventUtilValidation_Test`、`ConfigurationManagerValidation_Test`、`AnimationControllerValidation_Test`、`FocusManagerValidation_Test`、`PageStateManagerValidation_Test`、`StorageAppVersion_Test`、`StorageNotification_Test`、`StorageOfflineNetwork_Test`、`StorageAuthSession_Test`、`StorageDataSourceValidation_Test`、`StorageInterruptionRecovery_Test`、`QuerySessionValidation_Test`、`StorageEventToolValidation_Test` |
| StorageInteraction | 14 | 272 | `AccessibilityNavigation_Test`、`ButtonInteraction_Test`、`ContentScaling_Test`、`DataBinding_Test`、`EventHandling_Test`、`EventPropagation_Test`、`FocusNavigation_Test`、`FocusRingBehavior_Test`、`GestureRecognition_Test`、`PagePositioning_Test`、`ThemeVariation_Test`、`TouchInteraction_Test`、`UIComponentRendering_Test`、`VisualEffects_Test` |
| StorageLifecycle | 10 | 184 | `PageLifecycle_Test`、`PageStateManagement_Test`、`ErrorRecovery_Test`、`ExceptionHandling_Test`、`ExtensionLifecycle_Test`、`ResourceManagement_Test`、`SessionManagement_Test`、`StatePersistence_Test`、`StateRecovery_Test`、`ConfigurationChanges_Test` |
| StoragePerformance | 7 | 132 | `AnimationPerformance_Test`、`ConcurrencyControl_Test`、`LongTermStability_Test`、`MemoryLeakDetection_Test`、`PerformanceStress_Test`、`ResourceConsumption_Test`、`StoragePerformance_Test` |
| StorageIntegration | 9 | 110 | `AdvancedScenarios_Test`、`ComprehensiveRegression_Test`、`DeviceCompatibility_Test`、`IntegrationTesting_Test`、`LocalizationTesting_Test`、`NetworkConnectivity_Test`、`StorageCompatibility_Test`、`SystemIntegration_Test`、`UserScenarios_Test` |
| Security | 3 | 55 | `StorageSecurity_Test`、`SecurityValidation_Test`、`SecurityAccessibility_Test` |

## 7. 执行方式

### 7.1 通过测试运行器执行

在 DevEco Studio 中选择目标设备后运行 `entry_test` 模块的测试套件；也可在命令行中调用 OpenHarmony 测试运行器执行 `OpenHarmonyTestRunner`。执行前请确认目标设备已连接，并统一通过工程 `run_ohostest.bat` 传入设备标识，避免多设备场景下目标不明确。

### 7.2 分批执行（推荐）

为避免单进程一次注册 2756 个用例导致启动阶段 `App died`，使用项目脚本按 class 分批执行：

```powershell
.\run_ohostest.bat 45010044563430333201a0ea6c381c00 10
```

脚本会自动 `force-stop`、按 10 个 suite 一批执行、无结果自动单类重试，并输出汇总到 `tools/ohostest_summary.txt`。

## 8. 结论

`StorageStatistic` 当前测试设计已经形成“模型工具 + 查询逻辑 + 页面场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为存储统计示例后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 应用启动 | 1. 真机测试 <br/> 2. 构建并安装 HAP <br/> 3. 设备正常启动 | 打开应用 | 应用启动成功，进入首页 | 是 | Pass |
| 首页存储概览 | 应用已启动，数据初始化完成 | 进入首页 | DataPanel、已用/总量、六类数据行展示正常 | 是 | Pass |
| 应用列表 | 首页数据展示正常 | 点击应用数据行 | 进入应用信息页，应用名称/包名/容量展示正常 | 是 | Pass |
| 卷列表 | 首页数据展示正常且存在卷信息 | 点击可用空间入口 | 进入卷列表页，卷描述、环形进度、容量与百分比展示正常 | 是 | Pass |
| 尺寸格式化 | 单元测试环境 | `0/102/103/1024/1048576/1073741824` 等边界值 | KB/MB/GB 输出符合约定，无 `NaN`/`Infinity` | 是 | Pass |
| 百分比计算 | 单元测试环境 | 分子 `0`、分子等于分母、分子大于分母 | 保留 1 位小数并带 `%` | 是 | Pass |
| 空数据处理 | 单元测试环境 | 空字符串、空白串、空数组 | 判断结果正确，页面不崩溃 | 是 | Pass |
| 初始化失败恢复 | 模拟系统接口异常 | 调用 `initData` | 回调返回 `false`，页面退出 Loading | 是 | Pass |
| 中英文资源 | 切换系统语言 | 中文/英文 | 文案展示一致，无 `undefined` | 是 | Pass |
| 连续刷新与长稳 | 应用已启动 | 连续进入/返回/刷新 | 状态一致，无内存增长或崩溃 | 是 | Pass |