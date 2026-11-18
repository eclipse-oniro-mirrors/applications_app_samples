# ArkWeb 使用非同层渲染测试用例归档

## 验证范围

1. 本工程通过 `Web` 加载 `nativeembed_view.html`，读取 H5 占位元素 `nativeSearch` 的尺寸，再使用 `Stack` 叠加原生商城组件，展示搜索栏及两列商品卡片。
2. 自动化测试基于 Hypium 与 UiTest，验证 `ProductDataModel` 的构造和字段修改、`GoodsMock` 商品数据、打包资源、H5 尺寸接口以及原生叠加页面。
3. 已有单次全量执行记录为 `Tests run: 1395, Failure: 0, Error: 0, Pass: 1395, Ignore: 0`，框架返回 `OHOS_REPORT_CODE: 0`。结果来源为 [full-run.log](docs/device-test-results/full-run.log) 与 [full-run-summary.json](docs/device-test-results/full-run-summary.json)。本文引用工程内已有记录。
4. 工程当前 SDK 配置为 API 20，运行环境要求参见 [README.md](README.md)。页面测试需要安装应用主 HAP 和测试 HAP，包名为 `com.example.nonsamelayerrendering`，测试模块为 `entry_test`。

## 测试套件总览

当前测试统计：

- **测试文件数**：80 个包含用例的 `.test.ets`，另有入口 `List.test.ets`。
- **测试套件数**：80。
- **测试用例数**：1395。
- **模型测试**：79 个套件、1388 条用例，验证生产代码 `ProductDataModel` 的字段赋值、其他字段保持及实例隔离。
- **资源与页面集成测试**：1 个套件、7 条用例。
- **已有全量结果**：Pass 1395 / Failure 0 / Error 0 / Ignore 0。

以下按测试目录归档。套件名称沿用源码；各目录中模型套件的实际验证内容均以“商品模型字段与实例隔离”为准。`PerformanceStability`、`Security` 等目录名用于组织套件，其下当前模型用例的断言不包含帧率、内存、安全攻防等指标。

| 分类 | 目录或文件 | 套件数 | 用例数 | 实际验证内容 |
|---|---|---:|---:|---|
| 基础模型 | `RenderingAbility.test.ets` | 1 | 14 | 商品模型构造、字段修改及独立实例 |
| 综合分组 | `Integration/` | 9 | 131 | 不同初始输入下的模型字段修改及实例隔离 |
| 交互分组 | `Interaction/` | 14 | 255 | 不同初始输入下的模型字段修改及实例隔离 |
| 生命周期与状态分组 | `LifecycleState/` | 10 | 170 | 不同初始输入下的模型字段修改及实例隔离 |
| 性能与稳定性分组 | `PerformanceStability/` | 7 | 112 | 不同初始输入下的模型字段修改及实例隔离 |
| 商品与叠加层分组 | `PowerDialog/` | 16 | 274 | 不同初始输入下的模型字段修改及实例隔离 |
| 商品校验分组 | `PowerValidation/` | 8 | 140 | 不同初始输入下的模型字段修改及实例隔离 |
| 安全分组 | `Security/` | 3 | 43 | 不同初始输入下的模型字段修改及实例隔离 |
| 校验分组 | `Validation/` | 11 | 249 | 不同初始输入下的模型字段修改及实例隔离 |
| 资源与页面集成 | `RenderingIntegration.test.ets` | 1 | 7 | 商品目录、资源解析、H5 接口、页面叠加、搜索提示及双列布局 |
| **总计** | | **80** | **1395** | |

### 基础模型（1 个套件，14 条用例）

以下表格的编号范围省略公共前缀 `SUB_ARKWEB_NON_SAME_LAYER_`；对应文件均位于 `entry/src/ohosTest/ets/test/`，文件名为“套件名称 + `.test.ets`”。

| 套件名称 | 对应目录 | 用例数 | 编号范围 |
|---|---|---:|---|
| RenderingAbility | 根目录 | 14 | 000001～000014 |

### 综合分组（9 个套件，131 条用例）

对应目录：`Integration/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingAdvancedScenarios | 14 | 000015～000028 |
| RenderingComprehensiveRegression | 14 | 000029～000042 |
| RenderingDeviceCompatibility | 14 | 000043～000056 |
| RenderingIntegrationTesting | 14 | 000057～000070 |
| RenderingLocalizationTesting | 16 | 000071～000086 |
| RenderingNetworkConnectivity | 14 | 000087～000100 |
| RenderingProductCompatibility | 14 | 000101～000114 |
| RenderingSystemIntegration | 14 | 000115～000128 |
| RenderingUserScenarios | 17 | 000129～000145 |

### 交互分组（14 个套件，255 条用例）

对应目录：`Interaction/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingAccessibilityNavigation | 21 | 000146～000166 |
| RenderingButtonInteraction | 20 | 000167～000186 |
| RenderingContentScaling | 14 | 000187～000200 |
| RenderingDataBinding | 14 | 000201～000214 |
| RenderingOverlayPositioning | 14 | 000215～000228 |
| RenderingEventHandling | 21 | 000229～000249 |
| RenderingEventPropagation | 19 | 000250～000268 |
| RenderingFocusNavigation | 27 | 000269～000295 |
| RenderingFocusRingBehavior | 16 | 000296～000311 |
| RenderingGestureRecognition | 20 | 000312～000331 |
| RenderingThemeVariation | 14 | 000332～000345 |
| RenderingTouchInteraction | 21 | 000346～000366 |
| RenderingUIComponentRendering | 18 | 000367～000384 |
| RenderingVisualEffects | 16 | 000385～000400 |

### 生命周期与状态分组（10 个套件，170 条用例）

对应目录：`LifecycleState/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingConfigurationChanges | 14 | 000401～000414 |
| RenderingOverlayLifecycle | 14 | 000415～000428 |
| RenderingOverlayStateManagement | 23 | 000429～000451 |
| RenderingErrorRecovery | 24 | 000452～000475 |
| RenderingExceptionHandling | 23 | 000476～000498 |
| RenderingExtensionLifecycle | 16 | 000499～000514 |
| RenderingResourceManagement | 14 | 000515～000528 |
| RenderingSessionManagement | 14 | 000529～000542 |
| RenderingStatePersistence | 14 | 000543～000556 |
| RenderingStateRecovery | 14 | 000557～000570 |

### 性能与稳定性分组（7 个套件，112 条用例）

对应目录：`PerformanceStability/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingAnimationPerformance | 19 | 000571～000589 |
| RenderingConcurrencyControl | 14 | 000590～000603 |
| RenderingLongTermStability | 14 | 000604～000617 |
| RenderingMemoryLeakDetection | 14 | 000618～000631 |
| RenderingPerformanceStress | 14 | 000632～000645 |
| RenderingProductConsumption | 19 | 000646～000664 |
| RenderingProductPerformance | 18 | 000665～000682 |

### 商品与叠加层分组（16 个套件，274 条用例）

对应目录：`PowerDialog/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingProductOverlayConcurrency | 14 | 000683～000696 |
| RenderingProductOverlayConsistency | 14 | 000697～000710 |
| RenderingProductOverlayEndToEnd | 14 | 000711～000724 |
| RenderingProductOverlayErrorRecovery | 14 | 000725～000738 |
| RenderingProductOverlayLifecycle | 14 | 000739～000752 |
| RenderingProductOverlayStateManagement | 14 | 000753～000766 |
| RenderingProductOverlayStress | 14 | 000767～000780 |
| RenderingProductOverlayUI | 14 | 000781～000794 |
| RenderingProductInputInteraction | 15 | 000795～000809 |
| RenderingProductItemInfoModel | 22 | 000810～000831 |
| RenderingProductMenuConfiguration | 22 | 000832～000853 |
| RenderingProductModelDeep | 25 | 000854～000878 |
| RenderingProductOperationCatalog | 24 | 000879～000902 |
| RenderingProductOperationFlow | 23 | 000903～000925 |
| RenderingProductOperations | 16 | 000926～000941 |
| RenderingProductOperationWorkflow | 15 | 000942～000956 |

### 商品校验分组（8 个套件，140 条用例）

对应目录：`PowerValidation/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingProductAppVersion | 21 | 000957～000977 |
| RenderingProductAuthSession | 20 | 000978～000997 |
| RenderingProductDataSourceValidation | 14 | 000998～001011 |
| RenderingProductEventToolValidation | 14 | 001012～001025 |
| RenderingProductInterruptionRecovery | 16 | 001026～001041 |
| RenderingProductNotification | 21 | 001042～001062 |
| RenderingProductOfflineNetwork | 20 | 001063～001082 |
| RenderingProductSessionValidation | 14 | 001083～001096 |

### 安全分组（3 个套件，43 条用例）

对应目录：`Security/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingProductSecurity | 15 | 001097～001111 |
| RenderingSecurityAccessibility | 14 | 001112～001125 |
| RenderingSecurityValidation | 14 | 001126～001139 |

### 校验分组（11 个套件，249 条用例）

对应目录：`Validation/`。

| 套件名称 | 用例数 | 编号范围 |
|---|---:|---|
| RenderingAnimationControllerValidation | 30 | 001140～001169 |
| RenderingBoundaryErrorTesting | 16 | 001170～001185 |
| RenderingCommonEventUtilValidation | 28 | 001186～001213 |
| RenderingConfigurationManagerValidation | 14 | 001214～001227 |
| RenderingOverlayStateManagerValidation | 26 | 001228～001253 |
| RenderingFocusManagerValidation | 27 | 001254～001280 |
| RenderingInputValidation | 16 | 001281～001296 |
| RenderingKeyCodeValidation | 31 | 001297～001327 |
| RenderingLoggerValidation | 20 | 001328～001347 |
| RenderingPointerUtilValidation | 27 | 001348～001374 |
| RenderingResourceLoaderValidation | 14 | 001375～001388 |

### 资源与页面集成（1 个套件，7 条用例）

| 套件名称 | 对应文件 | 用例数 | 说明 |
|---|---|---:|---|
| RenderingIntegration | `RenderingIntegration.test.ets` | 7 | 商品数据、打包资源、H5 接口及原生叠加页面验证 |

## 测试工程结构

```text
entry/src/ohosTest/ets/
|---test/
|   |---List.test.ets                  // 80 个套件的统一注册入口
|   |---RenderingAbility.test.ets     // 基础模型：14 条
|   |---RenderingIntegration.test.ets // 资源与页面集成：7 条
|   |---Integration/                  // 9 个套件，131 条
|   |---Interaction/                  // 14 个套件，255 条
|   |---LifecycleState/               // 10 个套件，170 条
|   |---PerformanceStability/         // 7 个套件，112 条
|   |---PowerDialog/                  // 16 个套件，274 条
|   |---PowerValidation/              // 8 个套件，140 条
|   |---Security/                     // 3 个套件，43 条
|   |---Validation/                   // 11 个套件，249 条
|   |---Shared/
|       |---SharedDriver.ets          // UiTest 操作、资源解析、目录快照和生命周期让出
|---testability/                      // 测试 Ability 与测试页面
|---testrunner/
    |---OpenHarmonyTestRunner.ts      // 测试运行器

entry/src/main/
|---ets/model/GoodsModel.ets           // ProductDataModel 生产实现
|---ets/mock/GoodsMock.ets             // PRODUCT_DATA 商品目录
|---ets/pages/Index.ets                // Web 与原生商城叠加页面
|---resources/rawfile/nativeembed_view.html

docs/device-test-results/
|---full-run.log                       // 单次全量执行日志
|---full-run-summary.json              // 单次全量结构化结果
|---summary.json                       // 分套件执行结果
```

## 套件入口与公共驱动

[List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 导入 80 个套件，并在 `testsuite()` 中依次调用默认导出函数。执行顺序以入口文件为准。

[SharedDriver.ets](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets) 提供以下公共能力：

- `catalogSnapshot` / `assertCatalogUnchanged`：用例执行前保存商品目录快照，执行后逐项核对 `id`、`uri`、`title`、`price`，检查共享商品数据保持不变。
- `yieldToLifecycle`：在 `beforeEach` 中通过 `setTimeout` 让出事件循环 10ms，使主线程有机会处理 Ability 生命周期事件。
- `launchRenderingApp` / `waitForRenderingStable`：启动 `EntryAbility`，等待组件树中存在一个 Web 和至少一个 Grid，页面等待上限为 15000ms。
- `runSerializedUiOperation`：串行执行 UiTest 操作，公共封装包括组件查找、文本点击、按键和等待。
- `resolveString` / `assertImageResource`：解析字符串资源，并验证打包图片数据长度大于 0。

## 用例表

### 商品模型用例（79 个套件，1388 条）

模型用例的完整编号范围见上方套件清单，逐条名称、初始输入和修改字段见各测试文件的 `@tc.number`、`@tc.name` 与 `it` 实现。下表按实际断言关系归纳，四类各 347 条，总计 1388 条。

公共预置条件：测试进程可导入生产类 `ProductDataModel`；`beforeEach` 已保存 `PRODUCT_DATA` 快照。每例使用相同初始参数构造 `subject` 和 `independent` 两个对象，先验证四个构造字段，再修改 `subject` 的一个字段。

| 测试功能 | 用例数 | 输入 | 预期输出 | 测试结果 |
|---|---:|---|---|---|
| 修改商品 ID | 347 | 各用例指定的 `initialId`、`initialUri`、`initialTitle`、`initialPrice`；将 `subject.id` 改为 `initialId + 1` | 构造字段与输入一致；subject.id 为新值，其他字段保持原值；independent 四字段保持初始值；共享目录与快照一致 | Pass（已有全量记录） |
| 修改商品图片地址 | 347 | 各用例指定的四个初始字段；将 `subject.uri` 改为 `'replacement-' + initialId.toString()` | subject.uri 为新值，其他字段保持原值；independent 四字段保持初始值；共享目录与快照一致 | Pass（已有全量记录） |
| 修改商品标题 | 347 | 各用例指定的四个初始字段；将 `subject.title` 改为 `'replacement-' + initialId.toString()` | subject.title 为新值，其他字段保持原值；independent 四字段保持初始值；共享目录与快照一致 | Pass（已有全量记录） |
| 修改商品价格 | 347 | 各用例指定的四个初始字段；将 `subject.price` 改为 `'replacement-' + initialId.toString()` | subject.price 为新值，其他字段保持原值；independent 四字段保持初始值；共享目录与快照一致 | Pass（已有全量记录） |

例如，`RenderingAbility.test.ets` 中 `renderingAbility001`～`renderingAbility004` 分别验证 ID、图片地址、标题、价格修改，对应编号 `SUB_ARKWEB_NON_SAME_LAYER_000001`～`SUB_ARKWEB_NON_SAME_LAYER_000004`。

### 资源与页面集成用例（7 条）

对应文件：[RenderingIntegration.test.ets](entry/src/ohosTest/ets/test/RenderingIntegration.test.ets)。下表编号省略公共前缀 `SUB_ARKWEB_RENDERING_INTEGRATION_`。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| 0100 | renderingIntegration001 | 商品目录数量与顺序 | 测试进程可导入 `PRODUCT_DATA` | 读取目录长度并遍历商品 ID | 共 16 项；ID 按 `[0, 1, 2, 4]` 的顺序循环排列 | Pass（已有全量记录） |
| 0200 | renderingIntegration002 | 商品标题、价格与图片资源 | 测试模块资源可访问 | 遍历 16 项商品，解析标题和价格，读取图片资源 | 标题与预设资源一致；价格按 `￥79.9`、`￥6999`、`￥5999`、`￥899` 循环；每项图片数据长度大于 0 | Pass（已有全量记录） |
| 0400 | renderingIntegration004 | H5 占位元素与尺寸接口 | 可读取 rawfile 资源 | 读取 `nativeembed_view.html` | 包含 `function getEmbedSize()`、`id="nativeSearch"`、`width: doc.offsetWidth`、`height: doc.offsetHeight` 和 `width=device-width` | Pass（已有全量记录） |
| 0500 | renderingIntegration005 | Web 与原生商城叠加显示 | 主 HAP、测试 HAP 已安装；UiTest 可用 | 启动页面，等待组件就绪，查询 Web、Grid 和搜索占位文案 | Web 数量为 1，Grid 数量至少为 1，搜索占位文案存在 | Pass（已有全量记录） |
| 0600 | renderingIntegration006 | 点击搜索栏显示提示 | 商城叠加页面就绪 | 点击搜索占位文案，轮询提示文本，最长 1500ms | 能查询到 `nativeembed_prompt_text` 对应提示文本 | Pass（已有全量记录） |
| 0700 | renderingIntegration007 | Home 操作后的商城可见性与数据保持 | 页面就绪，商品目录快照已保存 | 发送 Home 键，再调用启动与页面等待方法 | 商城标题可查询；商品目录与快照一致 | Pass（已有全量记录） |
| 0800 | renderingIntegration008 | 首行商品卡片双列布局 | 页面就绪，至少有两个可查询的 GridItem | 读取前两个 GridItem 的位置与尺寸 | 第二项左边界不小于第一项右边界；顶部坐标差不超过 2；两项宽度均大于 0 | Pass（已有全量记录） |
