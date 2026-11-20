# AbilityStartMode 测试说明

> 本说明面向 `AbilityStartMode`（OpenHarmony 应用模型 - Ability 启动模式示例，包名 `ohos.samples.startmode`）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与执行方式。

## 1. 文档目标

本文档说明本工程自动化测试"如何分层、为什么这样设计、当前覆盖到什么程度、如何执行与扩展"，用于辅助代码评审、测试审计与后续维护。文档内容与实际代码一一对应，测试代码位于 `entry/src/ohosTest/`。

当前规模：**78 个测试套件、2,877 个自动化用例、88 个文件、约 58,900 行代码**。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `ets/test/List.test.ets`，运行器 `ets/testrunner/OpenHarmonyTestRunner.ets`，承载页 `ets/testability/TestAbility.ets`），按四层拆分：

- **共享驱动层**：以 `ets/test/Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列 `runSerializedUiOperation`、非阻塞延时 `serializedDelay`、单次操作超时保护 `withOperationTimeout`、页面回归 `resetToHome`、三模式启动 `launchStandardAbility/launchSpecifiedAbility/launchSingletonAbility`、点击模拟 `clickText/clickFoodItem/clickModeEntry`、文本与组件轮询 `waitForHomePageStable/waitForFoodDetailStable/checkTextContent/countMatchingTexts/componentCount`、焦点检查 `checkFocusState/getCurrentFocusIndex`、按键与触摸 `pressAndWait/simulateTouch`、页面度量 `collectPageMetrics/PageMetrics` 等可复用资产
- **领域模型层**：围绕食物数据模型（`FoodInfo`：id、名称、图标、分类、卡路里、蛋白质、脂肪、碳水、维生素C）、分类枚举 `CategoryId`、模拟数据 `MokeData/DataUtil`、启动参数结构 `StartModeParameters`、日志封装 `Logger` 展开确定性逻辑测试，不依赖页面
- **场景回归层**：模拟真实使用路径——首页三组列表（standard/specified/sinleton）、点击食物进入详情、详情页营养信息与"其余食物"切换、返回首页、单例模式重复启动提示等
- **质量层**：补充生命周期与状态、并发与压力、长时稳定性、内存与资源占用、性能时延、安全与无障碍、本地化等非功能维度

分层设计使基础行为、复杂交互与质量属性均有对应测试，避免用例集中在单一场景。

### 2.2 高复用设计

- **集中式套件清单**：`List.test.ets` 统一 import 并调用 78 个套件默认导出函数，套件命名与文件一一对应（`<业务>_Test`）
- **统一 UI 驱动**：所有套件复用 `SharedDriver` 的页面回归、启动、点击、轮询与断言辅助，不重复实现驱动细节
- **不按 BACK 的页面回归**：`resetToHome` 优先检测首页；离开详情页时通过重启 `MainAbility` 回到首页，避免使用 BACK 把应用切到后台（后台状态下 UiTest 查询会阻塞，长跑易卡死）
- **实例复用与回收**：`launchStandardAbility` 在详情页已可见时跳过重复启动；示例侧 `MainAbility` 使用 `singleton`，`StandardAbility` 在 `onBackground` 调用 `terminateSelf()`，避免长跑时 Ability 实例堆叠导致进程被系统回收
- **串行化 + 超时保护**：所有 UiTest 调用进入 `_uiOperationQueue` 串行执行，单次调用 3s 超时、`startAbility` 5s 超时且重试 3 次，任何一步挂起都不会堵塞后续用例
- **组件计数避坑**：`componentCount` 优先使用 `ON.type('*')`，设备不支持通配时回退统计 `Text`/`Image`，避免空结果造成误判
- **中英文文本兼容**：`checkTextContent` 支持 `" standard"` 前导空格与中英别名（Tomato/番茄、Cucumber/黄瓜、Walnut/核桃、Blueberry/蓝莓、IceCream/冰激凌、Crab/螃蟹），资源语言切换后断言仍可命中
- **触屏设备焦点容错**：`checkFocusState` 在触屏形态下无持久焦点时以"页面已渲染"作为有效状态，避免非 TV 设备误报

### 2.3 矩阵化设计

关键能力不按单点验证，而采用组合矩阵：

- **模式 × 食物矩阵**：standard/specified/sinleton × 6 种食物（Tomato、Cucumber、Walnut、Blueberry、IceCream、Crab）
- **操作矩阵**：页面渲染、模式标签、食物可见、详情渲染、营养标签、模式入口点击、食物点击、返回恢复、组件稳定性、焦点导航、触摸事件、文本内容、Ability 启动、辅助函数复用、压测轮次、生命周期轮次
- **按键矩阵**：方向键、ENTER、BACK 的合法序列与重复触发（`KeyCodeValidation`、`FocusNavigation`）
- **状态矩阵**：首页分组索引、foodItemId、modeName、target 的组合与非法值（`StartModeStateManagement`、`BoundaryErrorTesting`）
- **资源 × 语言矩阵**：base/zh_CN 资源键、图片资源、缺省回退（`ResourceLoaderValidation`、`LocalizationTesting`）
- **性能矩阵**：启动、切页、焦点切换、组件查询的耗时与稳定性（`PerformanceStress`、`RuntimePerformance`）
- **安全矩阵**：参数越界、目标页注入、敏感信息与无障碍可见性（`AppSecurity`、`SecurityValidation`）

## 3. 测试对象拆解

### 3.1 主流程

- **应用入口**：`MainAbility/MainAbility.ts`（加载 `pages/Home`，`singleton` 启动模式）
- **首页**：`pages/Home.ets`（三组模式列表：standard/specified/sinleton；每组两个食物；`startMode` 参数携带 `foodItemId/modeName/foodListIndex`）
- **三种启动模式**：
  - `StandardAbility`（每次启动新实例，`onBackground` 时 `terminateSelf`）
  - `SpecifiedAbility`（`MyAbilityStage.onAcceptWant` 以 `SpecifiedAbility${foodItemId}` 作为实例键，相同 id 复用）
  - `SingletonAbility`（`onNewWant` 把 `foodItemId` 在 0/1 间翻转并通过 `emitter` 通知页面，重复启动提示"实例已存在"）
- **详情页**：`pages/FoodDetail.ets`（页面标题、营养信息卡、卡路里进度、"其余食物"网格、返回首页）
- **数据与工具**：`model/DataModels.ts`、`model/MokeData.ts`、`model/DataUtil.ts`、`common/Util.ts`、`common/Logger.ts`
- **配置与资源**：`module.json5`、`syscap.json`、`resources/base`（字符串、颜色、图片、页面配置）、签名配置

### 3.2 关键风险点

- 三种启动模式的实例语义回归（standard 新建、specified 按 id 复用、singleton 单实例 + onNewWant 翻转）
- 启动参数缺失或类型错误导致详情页取参失败
- 首页分组索引与食物 id 越界
- 详情页渲染时延或重复启动导致页面空窗
- 单例重复启动的提示与页面状态一致性
- 长链路重复启动造成 Ability 实例堆积、测试进程被系统回收
- UiTest 并发调用（`findComponents` 与 `delayMs` 交叉）导致 API 拒绝
- 设备系统能力差异导致安装失败（`runtimeOS` 与 `syscap.json` 裁剪）
- 中英文资源缺失或未绑定字段渲染异常
- 日志规范（统一 `hilog`，禁止 `console`）
## 4. 覆盖维度设计

### 4.1 功能正确性

- 应用冷启动至首页可交互，三组模式标签与六个食物成对出现
- 首页列表项点击进入对应模式的详情页，详情页标题与营养标签完整（Calories、Nutrition Element、Fat、Carbohydrates、VitaminC）
- 详情页"其余食物"切换与返回首页流程
- 三种模式的启动参数（`foodItemId`、`modeName`、`foodListIndex`、`target`）传递正确
- 单例模式 `onNewWant` 翻转与"实例已存在"提示
- 指定模式相同 `foodItemId` 复用、不同 id 新建
- 数据模型字段、分类枚举与模拟数据数量/顺序一致

### 4.2 异常流与恢复

- 缺失/非法启动参数、非法分组索引、非法 `target` 页面、空模式名
- 详情页未渲染或渲染超时后的重新拉起
- 启动失败重试（`startAbility` 最多 3 次）
- 返回后页面状态恢复（首页标签、组件数量、文本可读）
- 异常捕获与日志（错误分支不抛出未捕获异常）

### 4.3 并发与长稳

- 高频方向键、快速焦点切换、连续页面切换后的状态一致性
- 连续启动三种模式、重复启动同一模式
- 串行化队列保证 UiTest 调用不并发，单次操作有超时上界
- 长链路执行后的页面与组件稳定性（`StartModeStress`、`LongTermStability`、`MemoryLeakDetection`）
- Ability 实例回收（standard 后台销毁）与长跑内存控制

### 4.4 性能与兼容性

- 启动、切页、焦点切换、组件查询耗时记录与宽松上界断言
- 多轮采样、避免单次抖动误判
- 不同设备形态（default/tablet、触屏无持久焦点）下的页面与断言兼容
- 中英文资源与缺省回退
- 系统能力裁剪后可在 OpenHarmony 设备安装运行（`runtimeOS: OpenHarmony` + `syscap.json`）

### 4.5 安全与契约

- 启动参数边界（负数、极值、超长字符串）与目标页注入
- 页面可见性与无障碍属性
- 日志与提示信息不含敏感数据
- 配置契约：`module.json5` 的 `srcEntry/exported/launchType`、`syscap.json`、资源键完整性

### 4.6 可达性与易用性

- 无障碍导航与文本可读性（`BarrierFreeNavigation`、`SecurityBarrierFree`）
- 焦点导航、焦点环、按钮/触摸/手势与事件分发
- 布局定位、内容缩放、主题与视觉表现
- 文本输入与按键键值校验

## 5. 充分性说明

- **层次完整**：共享驱动、领域模型、场景回归、质量维度均有覆盖
- **维度齐全**：功能、异常、并发、性能、安全、无障碍、资源与兼容性均纳入
- **方式多样**：单点验证、组合矩阵、重复压测、多轮采样并存
- **校验细化**：不只校验"页面存在"，还校验模式标签数量、营养标签数量、组件数量稳定性、文本内容、启动参数与状态恢复
- **资产可复用**：`SharedDriver` 统一驱动与超时保护，便于继续扩展用例而不破坏既有结构
- **真机验证**：78 个套件均已按套件（`-s class`）在 OpenHarmony 6.1（API 23）设备上执行，结果为 0 失败、0 超时

## 6. 测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 注册 78 个套件：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 共享驱动 `Shared/` | 1 | — | `SharedDriver.ets`：串行队列、启动与页面回归、点击与按键、文本/组件轮询、超时保护、焦点检查、页面度量 |
| 启动模式 `StartMode/` | 16 | 594 | `StartModeUI`、`StartOperations`、`StartOperationFlow`、`StartOperationCatalog`、`StartOperationWorkflow`、`StartModeLifecycle`、`StartModeStateManagement`、`StartModeConsistency`、`StartModeConcurrency`、`StartModeErrorRecovery`、`StartModeEndToEnd`、`StartModeMenuConfiguration`、`StartModeInputInteraction`、`StartModeStress`、`FoodItemModel`、`FoodModelDeep`：启动流程、模式语义、数据模型与端到端 |
| 校验 `Validation/` | 11 | 759 | `KeyCodeValidation`、`LoggerValidation`、`InputValidation`、`BoundaryErrorTesting`、`FocusManagerValidation`、`PointerUtilValidation`、`EventUtilValidation`、`ResourceLoaderValidation`、`ConfigurationManagerValidation`、`PageStateManagerValidation`、`AnimationControllerValidation` |
| 交互 `Interaction/` | 14 | 477 | `FocusNavigation`、`FocusRingBehavior`、`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`、`BarrierFreeNavigation`、`UIComponentRendering`、`VisualEffects`、`ContentScaling`、`DataBinding`、`PageLayoutPositioning`、`ThemeVariation` |
| 生命周期与状态 `LifecycleState/` | 10 | 225 | `PageLifecycle`、`PageStateManagement`、`StatePersistence`、`StateRecovery`、`ErrorRecovery`、`ExceptionHandling`、`AbilityStageLifecycle`、`ResourceManagement`、`SessionManagement`、`ConfigurationChanges` |
| 启动模式校验 `StartModeValidation/` | 8 | 360 | `AppVersionValidation`、`AuthSessionValidation`、`DataSourceValidation`、`EventToolValidation`、`SessionValidation`、`NotificationValidation`、`InterruptionRecovery`、`OfflineNetworkValidation` |
| 集成 `Integration/` | 9 | 189 | `UserScenarios`、`AdvancedScenarios`、`SystemIntegration`、`IntegrationTesting`、`ComprehensiveRegression`、`ModeCompatibility`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity` |
| 性能与稳定 `PerformanceStability/` | 7 | 221 | `AnimationPerformance`、`RuntimePerformance`、`ResourceConsumption`、`PerformanceStress`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection` |
| 安全 `Security/` | 3 | 51 | `AppSecurity`、`SecurityValidation`、`SecurityBarrierFree` |
| 根目录 | 2 | 8 | `Ability.test.ets`（框架自检，未注册到列表）、`List.test.ets`（套件注册与执行） |

## 7. 执行方式与已知限制

### 7.1 构建与安装

```bat
hvigorw.bat --mode module -p product=default -p module=entry@default,entry@ohosTest assembleHap
hdc install -r entry\build\default\outputs\default\entry-default-signed.hap
hdc install -r entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap
```

### 7.2 执行

```bat
:: 说明：<test-tool> 指 OpenHarmony 测试命令行工具（Ability Assistant 可执行文件）

:: 全量（约 2,877 个用例）
hdc shell <test-tool> test -b ohos.samples.startmode -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000

:: 按套件（推荐用于回归与定位）
hdc shell <test-tool> test -b ohos.samples.startmode -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000 -s class StartModeUI_Test
```

### 7.3 已知限制

- 测试进程与被测应用同进程，全量连续执行约 1,300 个 UI 用例后，设备会因累计资源（Ability 记录/窗口/内存）静默回收进程（`App died`，无崩溃日志）。此时已执行部分全部通过。
- 建议按套件（`-s class`）分批执行，进程随每次测试命令重启，78 个套件全部通过。
- 单条完整编译需 `Clean Project` 后执行，避免沿用旧产物（如 `rpcid.sc`、旧测试运行器路径）。
## 8. 结论

`AbilityStartMode` 的 ohosTest 已形成"共享驱动 + 领域校验 + 真实场景 + 非功能质量"的组合式覆盖结构：以 `SharedDriver` 统一驱动与超时保护，按启动模式语义拆解用例，覆盖功能、异常、并发、性能、安全、无障碍与兼容性维度，具备良好的可维护性与回归价值。所有 78 个套件已在真机按套件执行通过，可作为后续持续集成与版本回归的基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 1. 需在真机测试 <br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动 | 无 | 成功拉起应用并展示首页 | 是 | Pass |
| 首页食物列表 | 进入首页 | 上下滑动列表 | 三组模式（standard/specified/sinleton）与六个食物正常展示 | 是 | Pass |
| 进入详情页 | 食物列表正常展示 | 点击"番茄" | 进入番茄详情页 | 是 | Pass |
| 水果具体数据 | 进入水果详情页 | 左滑水果详细参数列表 | 从右侧滑入卡路里详情卡 | 是 | Pass |
| 详情页的其余食物列表 | 进入水果详情页 | 下滑列表，点击其余食物中的"黄瓜" | 进入黄瓜详情页 | 是 | Pass |
| 单例模式重复启动 | 首页正常展示 | 连续点击 sinleton 组食物 | 页面保持详情展示并提示"实例已存在" | 是 | Pass |
| 指定模式相同 id 复用 | 首页正常展示 | 连续点击 specified 组同一食物 | 复用同一实例并保持详情页 | 是 | Pass |


