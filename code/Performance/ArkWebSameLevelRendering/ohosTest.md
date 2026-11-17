# 基于 ArkWeb 实现系统原生组件渲染至 H5 页面测试用例归档

## 验证范围

本工程基于 Stage 模型和 ArkTS，使用 Hypium 编写断言，使用 UiTest 和 AbilityDelegator 执行设备端交互测试。测试入口为 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets)。

当前注册 **79 个套件、2280 条有效用例**，以测试源码中实际注册的 `it` 为统计口径，不计入已删除用例、辅助文件或历史备份。

本工程测试覆盖商品模型构造与修改、六项商品资源绑定、本地资源解析、原生节点控制器及商城 UI 交互。

最新全量测试结果：**2,280 条执行，2,280 条通过，失败 0，错误 0**。结果依据项目负责人确认的当前版本测试结论归档。

## 测试环境与预置条件

| 项目 | 要求 |
|---|---|
| 工程 | ArkWebSameLevelRendering |
| 应用包名 | `com.example.nativeembed` |
| 应用模块／入口 | `entry`／`EntryAbility` |
| 测试模块／入口 | `entry_test`／`TestAbility` |
| SDK | 工程配置为 OpenHarmony API 20；设备需支持 ArkWeb 原生组件同层渲染 |
| 设备状态 | HDC 连接正常、屏幕解锁，关闭系统弹窗；页面可完整展示六项商品 |
| 测试依赖 | `@ohos/hypium` 1.0.21、系统 UiTest 能力 |
| 超时 | 单用例 30,000ms；部分 UI 输入和节点布局等待耗时超过 15 秒 |

## 执行方法

### 1. 构建测试包

在工程根目录执行（PowerShell）：

```powershell
& "D:\DevEco Studio2\tools\node\node.exe" "D:\DevEco Studio2\tools\hvigor\bin\hvigorw.js" --mode module -p module=entry@ohosTest -p isOhosTest=true -p product=default -p buildMode=test assembleHap --analyze=normal --parallel --incremental --no-daemon
```

### 2. 部署与运行

使用 DevEco Studio 的 OpenHarmony Test 运行配置部署应用包和测试包；或使用 HDC 安装签名后的两个 HAP，再执行：

```shell
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.example.nativeembed -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 30000
```

应用包需先通过 `entry@default` 目标构建。按套件执行时可追加 `-s class GoodsConstructionPart01`。在 DevEco 中运行时同步将 Timeout 设置为 30,000ms；测试入口也设置该超时，避免默认短超时造成仍在执行的 UI 操作与后续用例重叠。

## 功能验收用例

| 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 设备正常运行，已安装应用 | 启动 EntryAbility | 成功进入 ArkWeb 同层渲染页面 | Pass |
| 原生商品卡片展示 | 商城页面加载完成 | 观察六项商品和双列布局 | 图片、标题及价格正常展示 | Pass |
| 搜索框输入与清空 | 搜索框可见并可交互 | 输入英文、数字、符号及代表性长文本后清空 | 文本与输入一致，清空后为空；商品仍保持静态展示 | Pass |
| 前后台恢复 | 商城与商品可见 | 切换后台后重新进入 | 页面恢复，商品与搜索组件可访问 | Pass |

本示例未实现搜索过滤业务，因此输入搜索文本后不要求商品目录发生筛选。

## 测试套件总览

| 模块 | 套件数 | 用例数 | 核心覆盖 |
|---|---:|---:|---|
| 商品模型构造（GoodsConstruction） | 14 | 412 | ProductDataModel 构造参数、标识边界和图片／标题／价格字段保持。 |
| 商品字段修改（GoodsMutation） | 13 | 343 | 商品字段赋值、无关字段保持及生产商品数据隔离。 |
| 商品目录绑定（CatalogBinding） | 13 | 372 | 六项 PRODUCT_DATA 的顺序、标识、资源绑定和对象独立性。 |
| 本地资源解析（ResourceResolution） | 13 | 467 | 商品字符串、PNG 图片数据及 embed_view.html 原生占位标签。 |
| 原生节点控制器（EmbedController） | 13 | 434 | setRenderOption 参数配置、Embed 标识保持和空 BuilderNode 更新／释放。 |
| 同层渲染交互（NativeInteraction） | 13 | 252 | 商城加载、搜索输入／清空、商品文本、双列布局和前后台恢复。 |
| **合计** | **79** | **2,280** | **全部通过** |

## 测试工程结构

```text
entry/src/ohosTest/ets/
|---test
|   |---List.test.ets                 // 测试套件注册入口
|   |---GoodsConstruction/            // 商品构造回归
|   |---GoodsMutation/                // 商品字段修改回归
|   |---CatalogBinding/               // 商品目录与资源绑定
|   |---ResourceResolution/           // 字符串、图片、HTML 解析
|   |---EmbedController/              // 原生节点控制器
|   |---NativeInteraction/            // 商城页面及搜索交互
|   |---Shared/
|       |---SharedDriver.ets          // UI、资源、布局与焦点辅助函数
|       |---TestScheduling.ets        // 测试调度辅助函数
|---testability/
|   |---TestAbility.ets               // 启动应用与 Hypium
|   |---pages/Index.ets
|---testrunner/
    |---OpenHarmonyTestRunner.ets     // 测试运行器
```

## 用例设计说明

### 1. 商品模型与资源

- 商品构造用例核对 ID 边界以及图片、标题、价格字段与实际输入一致。
- 字段修改用例检查指定字段赋值、其余字段保持，以及原始商品目录不被副本修改。
- 商品目录用例检查六项数量、顺序、商品 ID、实例关系和资源描述内容。
- 资源用例通过测试模块 ResourceManager 读取商品文案、PNG 数据及 HTML 占位标签。

### 2. 节点控制器与页面交互

- 控制器用例验证尺寸及 Embed 标识配置、空根节点更新与释放后的状态。
- 页面用例等待商城就绪，验证标题、价格、六张商品卡片和双列布局。
- 搜索用例操作实际 `__SearchField__` 编辑节点，读取输入文本并校验清空结果。
- 前后台用例验证应用恢复后商品与搜索组件仍可访问。

### 3. 共享测试基础设施

`SharedDriver.ets` 提供串行 UI 队列、资源查询、页面就绪轮询、输入法状态处理、搜索输入和布局检查；`TestScheduling.ets` 在用例间让出事件循环，避免大量同步测试阻塞 UI 主线程。

## 最近一次全量测试结果

根据项目负责人确认，当前版本全部测试通过：

```text
Tests run: 2280, Failure: 0, Error: 0, Pass: 2280, Ignore: 0
```

## 约束与边界

1. 主 HAP 和 ohosTest HAP 必须同时安装，设备保持解锁并关闭系统遮挡弹窗。
2. 测试运行配置使用 30,000ms 单用例超时，输入法和同层渲染布局等待包含在耗时中。
3. 模型、资源和空节点断言验证各自的逻辑，不等同于 Surface 绑定、内存泄漏或功耗专项测量。
4. 本示例商品目录为静态数据，搜索输入不触发商品筛选。
5. 测试日志使用标准 hilog 接口。

## 完整用例表

以下按套件列出当前有效用例，编号为本文展示序号；英文用例名称与源码一致，可直接用于定位。输入组合由用例名称中的 `id`、`image`、`title`、`price`、`width`、`height` 等字段标明，具体取值见对应代码。表中 Pass 依据项目负责人确认的当前版本全量测试结果归档。

### GoodsConstructionPart01

源码：[GoodsConstructionPart01.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart01.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart01_0001_constructor_id0_image0_title0_price0` | `GoodsConstructionPart01_0001_constructor_id0_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0002_constructor_id1_image0_title0_price0` | `GoodsConstructionPart01_0002_constructor_id1_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0003_constructor_id2_image0_title0_price0` | `GoodsConstructionPart01_0003_constructor_id2_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0004_constructor_id3_image0_title0_price0` | `GoodsConstructionPart01_0004_constructor_id3_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0005_constructor_id4_image0_title0_price0` | `GoodsConstructionPart01_0005_constructor_id4_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0006_constructor_id5_image0_title0_price0` | `GoodsConstructionPart01_0006_constructor_id5_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0007_constructor_id6_image0_title0_price0` | `GoodsConstructionPart01_0007_constructor_id6_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0008_constructor_id7_image0_title0_price0` | `GoodsConstructionPart01_0008_constructor_id7_image0_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image0_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0009_constructor_id0_image1_title0_price0` | `GoodsConstructionPart01_0009_constructor_id0_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0010_constructor_id1_image1_title0_price0` | `GoodsConstructionPart01_0010_constructor_id1_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0011_constructor_id2_image1_title0_price0` | `GoodsConstructionPart01_0011_constructor_id2_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0012_constructor_id3_image1_title0_price0` | `GoodsConstructionPart01_0012_constructor_id3_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0013_constructor_id4_image1_title0_price0` | `GoodsConstructionPart01_0013_constructor_id4_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0014_constructor_id5_image1_title0_price0` | `GoodsConstructionPart01_0014_constructor_id5_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0015_constructor_id6_image1_title0_price0` | `GoodsConstructionPart01_0015_constructor_id6_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0016_constructor_id7_image1_title0_price0` | `GoodsConstructionPart01_0016_constructor_id7_image1_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image1_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0017_constructor_id0_image2_title0_price0` | `GoodsConstructionPart01_0017_constructor_id0_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0018_constructor_id1_image2_title0_price0` | `GoodsConstructionPart01_0018_constructor_id1_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0019_constructor_id2_image2_title0_price0` | `GoodsConstructionPart01_0019_constructor_id2_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0020_constructor_id3_image2_title0_price0` | `GoodsConstructionPart01_0020_constructor_id3_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0021_constructor_id4_image2_title0_price0` | `GoodsConstructionPart01_0021_constructor_id4_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0022_constructor_id5_image2_title0_price0` | `GoodsConstructionPart01_0022_constructor_id5_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0023_constructor_id6_image2_title0_price0` | `GoodsConstructionPart01_0023_constructor_id6_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0024_constructor_id7_image2_title0_price0` | `GoodsConstructionPart01_0024_constructor_id7_image2_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image2_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0025_constructor_id0_image3_title0_price0` | `GoodsConstructionPart01_0025_constructor_id0_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart01_0026_constructor_id1_image3_title0_price0` | `GoodsConstructionPart01_0026_constructor_id1_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart02

源码：[GoodsMutationPart02.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart02.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart02_0001_mutate_id_source0_image0_title0_price0_mode0` | `GoodsMutationPart02_0001_mutate_id_source0_image0_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0002_mutate_imageRes_source0_image0_title0_price0_mode1` | `GoodsMutationPart02_0002_mutate_imageRes_source0_image0_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0003_mutate_title_source0_image0_title0_price0_mode2` | `GoodsMutationPart02_0003_mutate_title_source0_image0_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0004_mutate_price_source0_image0_title0_price0_mode3` | `GoodsMutationPart02_0004_mutate_price_source0_image0_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0005_mutate_id_source0_image0_title0_price0_mode4` | `GoodsMutationPart02_0005_mutate_id_source0_image0_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0006_mutate_imageRes_source0_image0_title0_price0_mode5` | `GoodsMutationPart02_0006_mutate_imageRes_source0_image0_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0007_mutate_title_source0_image0_title0_price0_mode6` | `GoodsMutationPart02_0007_mutate_title_source0_image0_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0008_mutate_price_source0_image0_title0_price0_mode7` | `GoodsMutationPart02_0008_mutate_price_source0_image0_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0009_mutate_id_source1_image1_title0_price0_mode0` | `GoodsMutationPart02_0009_mutate_id_source1_image1_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0010_mutate_imageRes_source1_image1_title0_price0_mode1` | `GoodsMutationPart02_0010_mutate_imageRes_source1_image1_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0011_mutate_title_source1_image1_title0_price0_mode2` | `GoodsMutationPart02_0011_mutate_title_source1_image1_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0012_mutate_price_source1_image1_title0_price0_mode3` | `GoodsMutationPart02_0012_mutate_price_source1_image1_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0013_mutate_id_source1_image1_title0_price0_mode4` | `GoodsMutationPart02_0013_mutate_id_source1_image1_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0014_mutate_imageRes_source1_image1_title0_price0_mode5` | `GoodsMutationPart02_0014_mutate_imageRes_source1_image1_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0015_mutate_title_source1_image1_title0_price0_mode6` | `GoodsMutationPart02_0015_mutate_title_source1_image1_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0016_mutate_price_source1_image1_title0_price0_mode7` | `GoodsMutationPart02_0016_mutate_price_source1_image1_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0017_mutate_id_source2_image2_title0_price0_mode0` | `GoodsMutationPart02_0017_mutate_id_source2_image2_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0018_mutate_imageRes_source2_image2_title0_price0_mode1` | `GoodsMutationPart02_0018_mutate_imageRes_source2_image2_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0019_mutate_title_source2_image2_title0_price0_mode2` | `GoodsMutationPart02_0019_mutate_title_source2_image2_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0020_mutate_price_source2_image2_title0_price0_mode3` | `GoodsMutationPart02_0020_mutate_price_source2_image2_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0021_mutate_id_source2_image2_title0_price0_mode4` | `GoodsMutationPart02_0021_mutate_id_source2_image2_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0022_mutate_imageRes_source2_image2_title0_price0_mode5` | `GoodsMutationPart02_0022_mutate_imageRes_source2_image2_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart02_0023_mutate_title_source2_image2_title0_price0_mode6` | `GoodsMutationPart02_0023_mutate_title_source2_image2_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart03

源码：[CatalogBindingPart03.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart03.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart03_0001_catalog_binding_0_peer0_third0` | `CatalogBindingPart03_0001_catalog_binding_0_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0002_catalog_binding_1_peer0_third0` | `CatalogBindingPart03_0002_catalog_binding_1_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0003_catalog_binding_2_peer0_third0` | `CatalogBindingPart03_0003_catalog_binding_2_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0004_catalog_binding_3_peer0_third0` | `CatalogBindingPart03_0004_catalog_binding_3_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0005_catalog_binding_4_peer0_third0` | `CatalogBindingPart03_0005_catalog_binding_4_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0006_catalog_binding_5_peer0_third0` | `CatalogBindingPart03_0006_catalog_binding_5_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0007_catalog_binding_0_peer1_third0` | `CatalogBindingPart03_0007_catalog_binding_0_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0008_catalog_binding_1_peer1_third0` | `CatalogBindingPart03_0008_catalog_binding_1_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0009_catalog_binding_2_peer1_third0` | `CatalogBindingPart03_0009_catalog_binding_2_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0010_catalog_binding_3_peer1_third0` | `CatalogBindingPart03_0010_catalog_binding_3_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0011_catalog_binding_4_peer1_third0` | `CatalogBindingPart03_0011_catalog_binding_4_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0012_catalog_binding_5_peer1_third0` | `CatalogBindingPart03_0012_catalog_binding_5_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0013_catalog_binding_0_peer2_third0` | `CatalogBindingPart03_0013_catalog_binding_0_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0014_catalog_binding_1_peer2_third0` | `CatalogBindingPart03_0014_catalog_binding_1_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0015_catalog_binding_2_peer2_third0` | `CatalogBindingPart03_0015_catalog_binding_2_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0016_catalog_binding_3_peer2_third0` | `CatalogBindingPart03_0016_catalog_binding_3_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0017_catalog_binding_4_peer2_third0` | `CatalogBindingPart03_0017_catalog_binding_4_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0018_catalog_binding_5_peer2_third0` | `CatalogBindingPart03_0018_catalog_binding_5_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0019_catalog_binding_0_peer3_third0` | `CatalogBindingPart03_0019_catalog_binding_0_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0020_catalog_binding_1_peer3_third0` | `CatalogBindingPart03_0020_catalog_binding_1_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0021_catalog_binding_2_peer3_third0` | `CatalogBindingPart03_0021_catalog_binding_2_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0022_catalog_binding_3_peer3_third0` | `CatalogBindingPart03_0022_catalog_binding_3_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart03_0023_catalog_binding_4_peer3_third0` | `CatalogBindingPart03_0023_catalog_binding_4_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart04

源码：[ResourceResolutionPart04.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart04.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart04_0001_resources_title0_price0_image0` | `ResourceResolutionPart04_0001_resources_title0_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0002_resources_title1_price0_image0` | `ResourceResolutionPart04_0002_resources_title1_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0003_resources_title2_price0_image0` | `ResourceResolutionPart04_0003_resources_title2_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0004_resources_title3_price0_image0` | `ResourceResolutionPart04_0004_resources_title3_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0005_resources_title4_price0_image0` | `ResourceResolutionPart04_0005_resources_title4_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0006_resources_title5_price0_image0` | `ResourceResolutionPart04_0006_resources_title5_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0007_resources_title0_price1_image0` | `ResourceResolutionPart04_0007_resources_title0_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0008_resources_title1_price1_image0` | `ResourceResolutionPart04_0008_resources_title1_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0009_resources_title2_price1_image0` | `ResourceResolutionPart04_0009_resources_title2_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0010_resources_title3_price1_image0` | `ResourceResolutionPart04_0010_resources_title3_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0011_resources_title4_price1_image0` | `ResourceResolutionPart04_0011_resources_title4_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0012_resources_title5_price1_image0` | `ResourceResolutionPart04_0012_resources_title5_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0013_resources_title0_price2_image0` | `ResourceResolutionPart04_0013_resources_title0_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0014_resources_title1_price2_image0` | `ResourceResolutionPart04_0014_resources_title1_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0015_resources_title2_price2_image0` | `ResourceResolutionPart04_0015_resources_title2_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0016_resources_title3_price2_image0` | `ResourceResolutionPart04_0016_resources_title3_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0017_resources_title4_price2_image0` | `ResourceResolutionPart04_0017_resources_title4_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0018_resources_title5_price2_image0` | `ResourceResolutionPart04_0018_resources_title5_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0019_resources_title0_price3_image0` | `ResourceResolutionPart04_0019_resources_title0_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0020_resources_title1_price3_image0` | `ResourceResolutionPart04_0020_resources_title1_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0021_resources_title2_price3_image0` | `ResourceResolutionPart04_0021_resources_title2_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0022_resources_title3_price3_image0` | `ResourceResolutionPart04_0022_resources_title3_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0023_resources_title4_price3_image0` | `ResourceResolutionPart04_0023_resources_title4_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0024_resources_title5_price3_image0` | `ResourceResolutionPart04_0024_resources_title5_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0025_resources_title0_price4_image0` | `ResourceResolutionPart04_0025_resources_title0_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart04_0026_resources_title1_price4_image0` | `ResourceResolutionPart04_0026_resources_title1_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart05

源码：[EmbedControllerPart05.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart05.test.ets)；用例数：24。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart05_0001_controller_width0_height0_embed0` | `EmbedControllerPart05_0001_controller_width0_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0002_controller_width1_height0_embed0` | `EmbedControllerPart05_0002_controller_width1_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0003_controller_width2_height0_embed0` | `EmbedControllerPart05_0003_controller_width2_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0004_controller_width3_height0_embed0` | `EmbedControllerPart05_0004_controller_width3_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0005_controller_width4_height0_embed0` | `EmbedControllerPart05_0005_controller_width4_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0006_controller_width5_height0_embed0` | `EmbedControllerPart05_0006_controller_width5_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0007_controller_width0_height1_embed0` | `EmbedControllerPart05_0007_controller_width0_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0008_controller_width1_height1_embed0` | `EmbedControllerPart05_0008_controller_width1_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0009_controller_width2_height1_embed0` | `EmbedControllerPart05_0009_controller_width2_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0010_controller_width3_height1_embed0` | `EmbedControllerPart05_0010_controller_width3_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0011_controller_width4_height1_embed0` | `EmbedControllerPart05_0011_controller_width4_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0012_controller_width5_height1_embed0` | `EmbedControllerPart05_0012_controller_width5_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0013_controller_width0_height2_embed0` | `EmbedControllerPart05_0013_controller_width0_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0014_controller_width1_height2_embed0` | `EmbedControllerPart05_0014_controller_width1_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0015_controller_width2_height2_embed0` | `EmbedControllerPart05_0015_controller_width2_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0016_controller_width3_height2_embed0` | `EmbedControllerPart05_0016_controller_width3_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0017_controller_width4_height2_embed0` | `EmbedControllerPart05_0017_controller_width4_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0018_controller_width5_height2_embed0` | `EmbedControllerPart05_0018_controller_width5_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0019_controller_width0_height3_embed0` | `EmbedControllerPart05_0019_controller_width0_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0020_controller_width1_height3_embed0` | `EmbedControllerPart05_0020_controller_width1_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0021_controller_width2_height3_embed0` | `EmbedControllerPart05_0021_controller_width2_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0022_controller_width3_height3_embed0` | `EmbedControllerPart05_0022_controller_width3_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0023_controller_width4_height3_embed0` | `EmbedControllerPart05_0023_controller_width4_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart05_0024_controller_width5_height3_embed0` | `EmbedControllerPart05_0024_controller_width5_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart06

源码：[NativeInteractionPart06.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart06.test.ets)；用例数：28。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart06_0001_native_search_input0_title0_price0` | `NativeInteractionPart06_0001_native_search_input0_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0002_native_search_input1_title0_price0` | `NativeInteractionPart06_0002_native_search_input1_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0003_native_search_input2_title0_price0` | `NativeInteractionPart06_0003_native_search_input2_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0004_native_search_input3_title0_price0` | `NativeInteractionPart06_0004_native_search_input3_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0005_native_search_input4_title0_price0` | `NativeInteractionPart06_0005_native_search_input4_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0006_native_search_input5_title0_price0` | `NativeInteractionPart06_0006_native_search_input5_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0007_native_search_input7_title0_price0` | `NativeInteractionPart06_0007_native_search_input7_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0008_native_search_input0_title1_price0` | `NativeInteractionPart06_0008_native_search_input0_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0009_native_search_input1_title1_price0` | `NativeInteractionPart06_0009_native_search_input1_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0010_native_search_input2_title1_price0` | `NativeInteractionPart06_0010_native_search_input2_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0011_native_search_input3_title1_price0` | `NativeInteractionPart06_0011_native_search_input3_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0012_native_search_input4_title1_price0` | `NativeInteractionPart06_0012_native_search_input4_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0013_native_search_input5_title1_price0` | `NativeInteractionPart06_0013_native_search_input5_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0014_native_search_input7_title1_price0` | `NativeInteractionPart06_0014_native_search_input7_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0015_native_search_input0_title2_price0` | `NativeInteractionPart06_0015_native_search_input0_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0016_native_search_input1_title2_price0` | `NativeInteractionPart06_0016_native_search_input1_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0017_native_search_input2_title2_price0` | `NativeInteractionPart06_0017_native_search_input2_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0018_native_search_input3_title2_price0` | `NativeInteractionPart06_0018_native_search_input3_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0019_native_search_input4_title2_price0` | `NativeInteractionPart06_0019_native_search_input4_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0020_native_search_input5_title2_price0` | `NativeInteractionPart06_0020_native_search_input5_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0021_native_search_input7_title2_price0` | `NativeInteractionPart06_0021_native_search_input7_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0022_native_search_input0_title3_price0` | `NativeInteractionPart06_0022_native_search_input0_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0023_native_search_input1_title3_price0` | `NativeInteractionPart06_0023_native_search_input1_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0024_native_search_input2_title3_price0` | `NativeInteractionPart06_0024_native_search_input2_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0025_native_search_input3_title3_price0` | `NativeInteractionPart06_0025_native_search_input3_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0026_native_search_input4_title3_price0` | `NativeInteractionPart06_0026_native_search_input4_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0027_native_search_input5_title3_price0` | `NativeInteractionPart06_0027_native_search_input5_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart06_0028_native_search_input7_title3_price0` | `NativeInteractionPart06_0028_native_search_input7_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart07

源码：[GoodsConstructionPart07.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart07.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart07_0001_constructor_id2_image3_title0_price0` | `GoodsConstructionPart07_0001_constructor_id2_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0002_constructor_id3_image3_title0_price0` | `GoodsConstructionPart07_0002_constructor_id3_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0003_constructor_id4_image3_title0_price0` | `GoodsConstructionPart07_0003_constructor_id4_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0004_constructor_id5_image3_title0_price0` | `GoodsConstructionPart07_0004_constructor_id5_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0005_constructor_id6_image3_title0_price0` | `GoodsConstructionPart07_0005_constructor_id6_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0006_constructor_id7_image3_title0_price0` | `GoodsConstructionPart07_0006_constructor_id7_image3_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image3_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0007_constructor_id0_image4_title0_price0` | `GoodsConstructionPart07_0007_constructor_id0_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0008_constructor_id1_image4_title0_price0` | `GoodsConstructionPart07_0008_constructor_id1_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0009_constructor_id2_image4_title0_price0` | `GoodsConstructionPart07_0009_constructor_id2_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0010_constructor_id3_image4_title0_price0` | `GoodsConstructionPart07_0010_constructor_id3_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0011_constructor_id4_image4_title0_price0` | `GoodsConstructionPart07_0011_constructor_id4_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0012_constructor_id5_image4_title0_price0` | `GoodsConstructionPart07_0012_constructor_id5_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0013_constructor_id6_image4_title0_price0` | `GoodsConstructionPart07_0013_constructor_id6_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0014_constructor_id7_image4_title0_price0` | `GoodsConstructionPart07_0014_constructor_id7_image4_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image4_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0015_constructor_id0_image5_title0_price0` | `GoodsConstructionPart07_0015_constructor_id0_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0016_constructor_id1_image5_title0_price0` | `GoodsConstructionPart07_0016_constructor_id1_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0017_constructor_id2_image5_title0_price0` | `GoodsConstructionPart07_0017_constructor_id2_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0018_constructor_id3_image5_title0_price0` | `GoodsConstructionPart07_0018_constructor_id3_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0019_constructor_id4_image5_title0_price0` | `GoodsConstructionPart07_0019_constructor_id4_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0020_constructor_id5_image5_title0_price0` | `GoodsConstructionPart07_0020_constructor_id5_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0021_constructor_id6_image5_title0_price0` | `GoodsConstructionPart07_0021_constructor_id6_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0022_constructor_id7_image5_title0_price0` | `GoodsConstructionPart07_0022_constructor_id7_image5_title0_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image5_title0_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0023_constructor_id0_image0_title1_price0` | `GoodsConstructionPart07_0023_constructor_id0_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0024_constructor_id1_image0_title1_price0` | `GoodsConstructionPart07_0024_constructor_id1_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0025_constructor_id2_image0_title1_price0` | `GoodsConstructionPart07_0025_constructor_id2_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart07_0026_constructor_id3_image0_title1_price0` | `GoodsConstructionPart07_0026_constructor_id3_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart08

源码：[GoodsMutationPart08.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart08.test.ets)；用例数：25。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart08_0001_mutate_price_source2_image2_title0_price0_mode7` | `GoodsMutationPart08_0001_mutate_price_source2_image2_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0002_mutate_id_source3_image3_title0_price0_mode0` | `GoodsMutationPart08_0002_mutate_id_source3_image3_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0003_mutate_imageRes_source3_image3_title0_price0_mode1` | `GoodsMutationPart08_0003_mutate_imageRes_source3_image3_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0004_mutate_title_source3_image3_title0_price0_mode2` | `GoodsMutationPart08_0004_mutate_title_source3_image3_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0005_mutate_price_source3_image3_title0_price0_mode3` | `GoodsMutationPart08_0005_mutate_price_source3_image3_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0006_mutate_id_source3_image3_title0_price0_mode4` | `GoodsMutationPart08_0006_mutate_id_source3_image3_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0007_mutate_imageRes_source3_image3_title0_price0_mode5` | `GoodsMutationPart08_0007_mutate_imageRes_source3_image3_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0008_mutate_title_source3_image3_title0_price0_mode6` | `GoodsMutationPart08_0008_mutate_title_source3_image3_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0009_mutate_price_source3_image3_title0_price0_mode7` | `GoodsMutationPart08_0009_mutate_price_source3_image3_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0010_mutate_id_source4_image4_title0_price0_mode0` | `GoodsMutationPart08_0010_mutate_id_source4_image4_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0011_mutate_imageRes_source4_image4_title0_price0_mode1` | `GoodsMutationPart08_0011_mutate_imageRes_source4_image4_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0012_mutate_title_source4_image4_title0_price0_mode2` | `GoodsMutationPart08_0012_mutate_title_source4_image4_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0013_mutate_price_source4_image4_title0_price0_mode3` | `GoodsMutationPart08_0013_mutate_price_source4_image4_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0014_mutate_id_source4_image4_title0_price0_mode4` | `GoodsMutationPart08_0014_mutate_id_source4_image4_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0015_mutate_imageRes_source4_image4_title0_price0_mode5` | `GoodsMutationPart08_0015_mutate_imageRes_source4_image4_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0016_mutate_title_source4_image4_title0_price0_mode6` | `GoodsMutationPart08_0016_mutate_title_source4_image4_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0017_mutate_price_source4_image4_title0_price0_mode7` | `GoodsMutationPart08_0017_mutate_price_source4_image4_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0018_mutate_id_source5_image5_title0_price0_mode0` | `GoodsMutationPart08_0018_mutate_id_source5_image5_title0_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title0_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0019_mutate_imageRes_source5_image5_title0_price0_mode1` | `GoodsMutationPart08_0019_mutate_imageRes_source5_image5_title0_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title0_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0020_mutate_title_source5_image5_title0_price0_mode2` | `GoodsMutationPart08_0020_mutate_title_source5_image5_title0_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title0_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0021_mutate_price_source5_image5_title0_price0_mode3` | `GoodsMutationPart08_0021_mutate_price_source5_image5_title0_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title0_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0022_mutate_id_source5_image5_title0_price0_mode4` | `GoodsMutationPart08_0022_mutate_id_source5_image5_title0_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title0_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0023_mutate_imageRes_source5_image5_title0_price0_mode5` | `GoodsMutationPart08_0023_mutate_imageRes_source5_image5_title0_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title0_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0024_mutate_title_source5_image5_title0_price0_mode6` | `GoodsMutationPart08_0024_mutate_title_source5_image5_title0_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title0_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart08_0025_mutate_price_source5_image5_title0_price0_mode7` | `GoodsMutationPart08_0025_mutate_price_source5_image5_title0_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title0_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart09

源码：[CatalogBindingPart09.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart09.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart09_0001_catalog_binding_4_peer3_third0` | `CatalogBindingPart09_0001_catalog_binding_4_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0002_catalog_binding_5_peer3_third0` | `CatalogBindingPart09_0002_catalog_binding_5_peer3_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0003_catalog_binding_0_peer4_third0` | `CatalogBindingPart09_0003_catalog_binding_0_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0004_catalog_binding_1_peer4_third0` | `CatalogBindingPart09_0004_catalog_binding_1_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0005_catalog_binding_2_peer4_third0` | `CatalogBindingPart09_0005_catalog_binding_2_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0006_catalog_binding_3_peer4_third0` | `CatalogBindingPart09_0006_catalog_binding_3_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0007_catalog_binding_4_peer4_third0` | `CatalogBindingPart09_0007_catalog_binding_4_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0008_catalog_binding_5_peer4_third0` | `CatalogBindingPart09_0008_catalog_binding_5_peer4_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0009_catalog_binding_0_peer5_third0` | `CatalogBindingPart09_0009_catalog_binding_0_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0010_catalog_binding_1_peer5_third0` | `CatalogBindingPart09_0010_catalog_binding_1_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0011_catalog_binding_2_peer5_third0` | `CatalogBindingPart09_0011_catalog_binding_2_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0012_catalog_binding_3_peer5_third0` | `CatalogBindingPart09_0012_catalog_binding_3_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0013_catalog_binding_4_peer5_third0` | `CatalogBindingPart09_0013_catalog_binding_4_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0014_catalog_binding_5_peer5_third0` | `CatalogBindingPart09_0014_catalog_binding_5_peer5_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0015_catalog_binding_0_peer0_third1` | `CatalogBindingPart09_0015_catalog_binding_0_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0016_catalog_binding_1_peer0_third1` | `CatalogBindingPart09_0016_catalog_binding_1_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0017_catalog_binding_2_peer0_third1` | `CatalogBindingPart09_0017_catalog_binding_2_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0018_catalog_binding_3_peer0_third1` | `CatalogBindingPart09_0018_catalog_binding_3_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0019_catalog_binding_4_peer0_third1` | `CatalogBindingPart09_0019_catalog_binding_4_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0020_catalog_binding_5_peer0_third1` | `CatalogBindingPart09_0020_catalog_binding_5_peer0_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0021_catalog_binding_0_peer1_third1` | `CatalogBindingPart09_0021_catalog_binding_0_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0022_catalog_binding_1_peer1_third1` | `CatalogBindingPart09_0022_catalog_binding_1_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart09_0023_catalog_binding_2_peer1_third1` | `CatalogBindingPart09_0023_catalog_binding_2_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart10

源码：[ResourceResolutionPart10.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart10.test.ets)；用例数：33。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart10_0001_resources_title1_price4_image0` | `ResourceResolutionPart10_0001_resources_title1_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0002_resources_title2_price4_image0` | `ResourceResolutionPart10_0002_resources_title2_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0003_resources_title3_price4_image0` | `ResourceResolutionPart10_0003_resources_title3_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0004_resources_title4_price4_image0` | `ResourceResolutionPart10_0004_resources_title4_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0005_resources_title5_price4_image0` | `ResourceResolutionPart10_0005_resources_title5_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0006_resources_title0_price5_image0` | `ResourceResolutionPart10_0006_resources_title0_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0007_resources_title1_price5_image0` | `ResourceResolutionPart10_0007_resources_title1_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0008_resources_title2_price5_image0` | `ResourceResolutionPart10_0008_resources_title2_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0009_resources_title3_price5_image0` | `ResourceResolutionPart10_0009_resources_title3_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0010_resources_title4_price5_image0` | `ResourceResolutionPart10_0010_resources_title4_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0011_resources_title5_price5_image0` | `ResourceResolutionPart10_0011_resources_title5_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0012_resources_title0_price0_image1` | `ResourceResolutionPart10_0012_resources_title0_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0013_resources_title1_price0_image1` | `ResourceResolutionPart10_0013_resources_title1_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0014_resources_title2_price0_image1` | `ResourceResolutionPart10_0014_resources_title2_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0015_resources_title3_price0_image1` | `ResourceResolutionPart10_0015_resources_title3_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0016_resources_title4_price0_image1` | `ResourceResolutionPart10_0016_resources_title4_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0017_resources_title5_price0_image1` | `ResourceResolutionPart10_0017_resources_title5_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0018_resources_title0_price1_image1` | `ResourceResolutionPart10_0018_resources_title0_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0019_resources_title1_price1_image1` | `ResourceResolutionPart10_0019_resources_title1_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0020_resources_title2_price1_image1` | `ResourceResolutionPart10_0020_resources_title2_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0021_resources_title3_price1_image1` | `ResourceResolutionPart10_0021_resources_title3_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0022_resources_title4_price1_image1` | `ResourceResolutionPart10_0022_resources_title4_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0023_resources_title5_price1_image1` | `ResourceResolutionPart10_0023_resources_title5_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0024_resources_title0_price2_image1` | `ResourceResolutionPart10_0024_resources_title0_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0025_resources_title1_price2_image1` | `ResourceResolutionPart10_0025_resources_title1_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0026_resources_title2_price2_image1` | `ResourceResolutionPart10_0026_resources_title2_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0027_resources_title3_price2_image1` | `ResourceResolutionPart10_0027_resources_title3_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0028_resources_title4_price2_image1` | `ResourceResolutionPart10_0028_resources_title4_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0029_resources_title5_price2_image1` | `ResourceResolutionPart10_0029_resources_title5_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0030_resources_title0_price3_image1` | `ResourceResolutionPart10_0030_resources_title0_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0031_resources_title1_price3_image1` | `ResourceResolutionPart10_0031_resources_title1_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0032_resources_title2_price3_image1` | `ResourceResolutionPart10_0032_resources_title2_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart10_0033_resources_title3_price3_image1` | `ResourceResolutionPart10_0033_resources_title3_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart11

源码：[EmbedControllerPart11.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart11.test.ets)；用例数：36。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart11_0001_controller_width5_height3_embed0` | `EmbedControllerPart11_0001_controller_width5_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0002_controller_width0_height4_embed0` | `EmbedControllerPart11_0002_controller_width0_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0003_controller_width1_height4_embed0` | `EmbedControllerPart11_0003_controller_width1_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0004_controller_width2_height4_embed0` | `EmbedControllerPart11_0004_controller_width2_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0005_controller_width3_height4_embed0` | `EmbedControllerPart11_0005_controller_width3_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0006_controller_width4_height4_embed0` | `EmbedControllerPart11_0006_controller_width4_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0007_controller_width5_height4_embed0` | `EmbedControllerPart11_0007_controller_width5_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0008_controller_width0_height5_embed0` | `EmbedControllerPart11_0008_controller_width0_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0009_controller_width1_height5_embed0` | `EmbedControllerPart11_0009_controller_width1_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0010_controller_width2_height5_embed0` | `EmbedControllerPart11_0010_controller_width2_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0011_controller_width3_height5_embed0` | `EmbedControllerPart11_0011_controller_width3_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0012_controller_width4_height5_embed0` | `EmbedControllerPart11_0012_controller_width4_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0013_controller_width5_height5_embed0` | `EmbedControllerPart11_0013_controller_width5_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0014_controller_width0_height0_embed1` | `EmbedControllerPart11_0014_controller_width0_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0015_controller_width1_height0_embed1` | `EmbedControllerPart11_0015_controller_width1_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0016_controller_width2_height0_embed1` | `EmbedControllerPart11_0016_controller_width2_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0017_controller_width3_height0_embed1` | `EmbedControllerPart11_0017_controller_width3_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0018_controller_width4_height0_embed1` | `EmbedControllerPart11_0018_controller_width4_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0019_controller_width5_height0_embed1` | `EmbedControllerPart11_0019_controller_width5_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0020_controller_width0_height1_embed1` | `EmbedControllerPart11_0020_controller_width0_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0021_controller_width1_height1_embed1` | `EmbedControllerPart11_0021_controller_width1_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0022_controller_width2_height1_embed1` | `EmbedControllerPart11_0022_controller_width2_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0023_controller_width3_height1_embed1` | `EmbedControllerPart11_0023_controller_width3_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0024_controller_width4_height1_embed1` | `EmbedControllerPart11_0024_controller_width4_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0025_controller_width5_height1_embed1` | `EmbedControllerPart11_0025_controller_width5_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0026_controller_width0_height2_embed1` | `EmbedControllerPart11_0026_controller_width0_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0027_controller_width1_height2_embed1` | `EmbedControllerPart11_0027_controller_width1_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0028_controller_width2_height2_embed1` | `EmbedControllerPart11_0028_controller_width2_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0029_controller_width3_height2_embed1` | `EmbedControllerPart11_0029_controller_width3_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0030_controller_width4_height2_embed1` | `EmbedControllerPart11_0030_controller_width4_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0031_controller_width5_height2_embed1` | `EmbedControllerPart11_0031_controller_width5_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0032_controller_width0_height3_embed1` | `EmbedControllerPart11_0032_controller_width0_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0033_controller_width1_height3_embed1` | `EmbedControllerPart11_0033_controller_width1_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0034_controller_width2_height3_embed1` | `EmbedControllerPart11_0034_controller_width2_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0035_controller_width3_height3_embed1` | `EmbedControllerPart11_0035_controller_width3_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart11_0036_controller_width4_height3_embed1` | `EmbedControllerPart11_0036_controller_width4_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart12

源码：[NativeInteractionPart12.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart12.test.ets)；用例数：24。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart12_0001_background_foreground` | `NativeInteractionPart12_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |
| `NativeInteractionPart12_0002_native_search_input0_title0_price1` | `NativeInteractionPart12_0002_native_search_input0_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0003_native_search_input1_title0_price1` | `NativeInteractionPart12_0003_native_search_input1_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0004_native_search_input2_title0_price1` | `NativeInteractionPart12_0004_native_search_input2_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0005_native_search_input3_title0_price1` | `NativeInteractionPart12_0005_native_search_input3_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0006_native_search_input4_title0_price1` | `NativeInteractionPart12_0006_native_search_input4_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0007_native_search_input5_title0_price1` | `NativeInteractionPart12_0007_native_search_input5_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0008_native_search_input7_title0_price1` | `NativeInteractionPart12_0008_native_search_input7_title0_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title0_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0009_native_search_input0_title1_price1` | `NativeInteractionPart12_0009_native_search_input0_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0010_native_search_input1_title1_price1` | `NativeInteractionPart12_0010_native_search_input1_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0011_native_search_input2_title1_price1` | `NativeInteractionPart12_0011_native_search_input2_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0012_native_search_input3_title1_price1` | `NativeInteractionPart12_0012_native_search_input3_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0013_native_search_input4_title1_price1` | `NativeInteractionPart12_0013_native_search_input4_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0014_native_search_input5_title1_price1` | `NativeInteractionPart12_0014_native_search_input5_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0015_native_search_input7_title1_price1` | `NativeInteractionPart12_0015_native_search_input7_title1_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title1_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0016_native_search_input0_title2_price1` | `NativeInteractionPart12_0016_native_search_input0_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0017_native_search_input1_title2_price1` | `NativeInteractionPart12_0017_native_search_input1_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0018_native_search_input2_title2_price1` | `NativeInteractionPart12_0018_native_search_input2_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0019_native_search_input3_title2_price1` | `NativeInteractionPart12_0019_native_search_input3_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0020_native_search_input4_title2_price1` | `NativeInteractionPart12_0020_native_search_input4_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0021_native_search_input5_title2_price1` | `NativeInteractionPart12_0021_native_search_input5_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0022_native_search_input7_title2_price1` | `NativeInteractionPart12_0022_native_search_input7_title2_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title2_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0023_native_search_input0_title3_price1` | `NativeInteractionPart12_0023_native_search_input0_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart12_0024_native_search_input1_title3_price1` | `NativeInteractionPart12_0024_native_search_input1_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart13

源码：[GoodsConstructionPart13.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart13.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart13_0001_constructor_id4_image0_title1_price0` | `GoodsConstructionPart13_0001_constructor_id4_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0002_constructor_id5_image0_title1_price0` | `GoodsConstructionPart13_0002_constructor_id5_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0003_constructor_id6_image0_title1_price0` | `GoodsConstructionPart13_0003_constructor_id6_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0004_constructor_id7_image0_title1_price0` | `GoodsConstructionPart13_0004_constructor_id7_image0_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image0_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0005_constructor_id0_image1_title1_price0` | `GoodsConstructionPart13_0005_constructor_id0_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0006_constructor_id1_image1_title1_price0` | `GoodsConstructionPart13_0006_constructor_id1_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0007_constructor_id2_image1_title1_price0` | `GoodsConstructionPart13_0007_constructor_id2_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0008_constructor_id3_image1_title1_price0` | `GoodsConstructionPart13_0008_constructor_id3_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0009_constructor_id4_image1_title1_price0` | `GoodsConstructionPart13_0009_constructor_id4_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0010_constructor_id5_image1_title1_price0` | `GoodsConstructionPart13_0010_constructor_id5_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0011_constructor_id6_image1_title1_price0` | `GoodsConstructionPart13_0011_constructor_id6_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0012_constructor_id7_image1_title1_price0` | `GoodsConstructionPart13_0012_constructor_id7_image1_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image1_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0013_constructor_id0_image2_title1_price0` | `GoodsConstructionPart13_0013_constructor_id0_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0014_constructor_id1_image2_title1_price0` | `GoodsConstructionPart13_0014_constructor_id1_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0015_constructor_id2_image2_title1_price0` | `GoodsConstructionPart13_0015_constructor_id2_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0016_constructor_id3_image2_title1_price0` | `GoodsConstructionPart13_0016_constructor_id3_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0017_constructor_id4_image2_title1_price0` | `GoodsConstructionPart13_0017_constructor_id4_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0018_constructor_id5_image2_title1_price0` | `GoodsConstructionPart13_0018_constructor_id5_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0019_constructor_id6_image2_title1_price0` | `GoodsConstructionPart13_0019_constructor_id6_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0020_constructor_id7_image2_title1_price0` | `GoodsConstructionPart13_0020_constructor_id7_image2_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image2_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0021_constructor_id0_image3_title1_price0` | `GoodsConstructionPart13_0021_constructor_id0_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0022_constructor_id1_image3_title1_price0` | `GoodsConstructionPart13_0022_constructor_id1_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0023_constructor_id2_image3_title1_price0` | `GoodsConstructionPart13_0023_constructor_id2_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0024_constructor_id3_image3_title1_price0` | `GoodsConstructionPart13_0024_constructor_id3_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0025_constructor_id4_image3_title1_price0` | `GoodsConstructionPart13_0025_constructor_id4_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart13_0026_constructor_id5_image3_title1_price0` | `GoodsConstructionPart13_0026_constructor_id5_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart14

源码：[GoodsMutationPart14.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart14.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart14_0001_mutate_id_source0_image0_title1_price0_mode0` | `GoodsMutationPart14_0001_mutate_id_source0_image0_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0002_mutate_imageRes_source0_image0_title1_price0_mode1` | `GoodsMutationPart14_0002_mutate_imageRes_source0_image0_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0003_mutate_title_source0_image0_title1_price0_mode2` | `GoodsMutationPart14_0003_mutate_title_source0_image0_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0004_mutate_price_source0_image0_title1_price0_mode3` | `GoodsMutationPart14_0004_mutate_price_source0_image0_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0005_mutate_id_source0_image0_title1_price0_mode4` | `GoodsMutationPart14_0005_mutate_id_source0_image0_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0006_mutate_imageRes_source0_image0_title1_price0_mode5` | `GoodsMutationPart14_0006_mutate_imageRes_source0_image0_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0007_mutate_title_source0_image0_title1_price0_mode6` | `GoodsMutationPart14_0007_mutate_title_source0_image0_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0008_mutate_price_source0_image0_title1_price0_mode7` | `GoodsMutationPart14_0008_mutate_price_source0_image0_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0009_mutate_id_source1_image1_title1_price0_mode0` | `GoodsMutationPart14_0009_mutate_id_source1_image1_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0010_mutate_imageRes_source1_image1_title1_price0_mode1` | `GoodsMutationPart14_0010_mutate_imageRes_source1_image1_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0011_mutate_title_source1_image1_title1_price0_mode2` | `GoodsMutationPart14_0011_mutate_title_source1_image1_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0012_mutate_price_source1_image1_title1_price0_mode3` | `GoodsMutationPart14_0012_mutate_price_source1_image1_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0013_mutate_id_source1_image1_title1_price0_mode4` | `GoodsMutationPart14_0013_mutate_id_source1_image1_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0014_mutate_imageRes_source1_image1_title1_price0_mode5` | `GoodsMutationPart14_0014_mutate_imageRes_source1_image1_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0015_mutate_title_source1_image1_title1_price0_mode6` | `GoodsMutationPart14_0015_mutate_title_source1_image1_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0016_mutate_price_source1_image1_title1_price0_mode7` | `GoodsMutationPart14_0016_mutate_price_source1_image1_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0017_mutate_id_source2_image2_title1_price0_mode0` | `GoodsMutationPart14_0017_mutate_id_source2_image2_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0018_mutate_imageRes_source2_image2_title1_price0_mode1` | `GoodsMutationPart14_0018_mutate_imageRes_source2_image2_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0019_mutate_title_source2_image2_title1_price0_mode2` | `GoodsMutationPart14_0019_mutate_title_source2_image2_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0020_mutate_price_source2_image2_title1_price0_mode3` | `GoodsMutationPart14_0020_mutate_price_source2_image2_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0021_mutate_id_source2_image2_title1_price0_mode4` | `GoodsMutationPart14_0021_mutate_id_source2_image2_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0022_mutate_imageRes_source2_image2_title1_price0_mode5` | `GoodsMutationPart14_0022_mutate_imageRes_source2_image2_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart14_0023_mutate_title_source2_image2_title1_price0_mode6` | `GoodsMutationPart14_0023_mutate_title_source2_image2_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart15

源码：[CatalogBindingPart15.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart15.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart15_0001_catalog_binding_2_peer1_third1` | `CatalogBindingPart15_0001_catalog_binding_2_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0002_catalog_binding_3_peer1_third1` | `CatalogBindingPart15_0002_catalog_binding_3_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0003_catalog_binding_4_peer1_third1` | `CatalogBindingPart15_0003_catalog_binding_4_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0004_catalog_binding_5_peer1_third1` | `CatalogBindingPart15_0004_catalog_binding_5_peer1_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0005_catalog_binding_0_peer2_third1` | `CatalogBindingPart15_0005_catalog_binding_0_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0006_catalog_binding_1_peer2_third1` | `CatalogBindingPart15_0006_catalog_binding_1_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0007_catalog_binding_2_peer2_third1` | `CatalogBindingPart15_0007_catalog_binding_2_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0008_catalog_binding_3_peer2_third1` | `CatalogBindingPart15_0008_catalog_binding_3_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0009_catalog_binding_4_peer2_third1` | `CatalogBindingPart15_0009_catalog_binding_4_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0010_catalog_binding_5_peer2_third1` | `CatalogBindingPart15_0010_catalog_binding_5_peer2_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0011_catalog_binding_0_peer3_third1` | `CatalogBindingPart15_0011_catalog_binding_0_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0012_catalog_binding_1_peer3_third1` | `CatalogBindingPart15_0012_catalog_binding_1_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0013_catalog_binding_2_peer3_third1` | `CatalogBindingPart15_0013_catalog_binding_2_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0014_catalog_binding_3_peer3_third1` | `CatalogBindingPart15_0014_catalog_binding_3_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0015_catalog_binding_4_peer3_third1` | `CatalogBindingPart15_0015_catalog_binding_4_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0016_catalog_binding_5_peer3_third1` | `CatalogBindingPart15_0016_catalog_binding_5_peer3_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0017_catalog_binding_0_peer4_third1` | `CatalogBindingPart15_0017_catalog_binding_0_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0018_catalog_binding_1_peer4_third1` | `CatalogBindingPart15_0018_catalog_binding_1_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0019_catalog_binding_2_peer4_third1` | `CatalogBindingPart15_0019_catalog_binding_2_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0020_catalog_binding_3_peer4_third1` | `CatalogBindingPart15_0020_catalog_binding_3_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0021_catalog_binding_4_peer4_third1` | `CatalogBindingPart15_0021_catalog_binding_4_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0022_catalog_binding_5_peer4_third1` | `CatalogBindingPart15_0022_catalog_binding_5_peer4_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart15_0023_catalog_binding_0_peer5_third1` | `CatalogBindingPart15_0023_catalog_binding_0_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart16

源码：[ResourceResolutionPart16.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart16.test.ets)；用例数：38。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart16_0001_resources_title3_price3_image1` | `ResourceResolutionPart16_0001_resources_title3_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0002_resources_title4_price3_image1` | `ResourceResolutionPart16_0002_resources_title4_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0003_resources_title5_price3_image1` | `ResourceResolutionPart16_0003_resources_title5_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0004_resources_title0_price4_image1` | `ResourceResolutionPart16_0004_resources_title0_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0005_resources_title1_price4_image1` | `ResourceResolutionPart16_0005_resources_title1_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0006_resources_title2_price4_image1` | `ResourceResolutionPart16_0006_resources_title2_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0007_resources_title3_price4_image1` | `ResourceResolutionPart16_0007_resources_title3_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0008_resources_title4_price4_image1` | `ResourceResolutionPart16_0008_resources_title4_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0009_resources_title5_price4_image1` | `ResourceResolutionPart16_0009_resources_title5_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0010_resources_title0_price5_image1` | `ResourceResolutionPart16_0010_resources_title0_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0011_resources_title1_price5_image1` | `ResourceResolutionPart16_0011_resources_title1_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0012_resources_title2_price5_image1` | `ResourceResolutionPart16_0012_resources_title2_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0013_resources_title3_price5_image1` | `ResourceResolutionPart16_0013_resources_title3_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0014_resources_title4_price5_image1` | `ResourceResolutionPart16_0014_resources_title4_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0015_resources_title5_price5_image1` | `ResourceResolutionPart16_0015_resources_title5_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0016_resources_title0_price0_image2` | `ResourceResolutionPart16_0016_resources_title0_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0017_resources_title1_price0_image2` | `ResourceResolutionPart16_0017_resources_title1_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0018_resources_title2_price0_image2` | `ResourceResolutionPart16_0018_resources_title2_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0019_resources_title3_price0_image2` | `ResourceResolutionPart16_0019_resources_title3_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0020_resources_title4_price0_image2` | `ResourceResolutionPart16_0020_resources_title4_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0021_resources_title5_price0_image2` | `ResourceResolutionPart16_0021_resources_title5_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0022_resources_title0_price1_image2` | `ResourceResolutionPart16_0022_resources_title0_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0023_resources_title1_price1_image2` | `ResourceResolutionPart16_0023_resources_title1_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0024_resources_title2_price1_image2` | `ResourceResolutionPart16_0024_resources_title2_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0025_resources_title3_price1_image2` | `ResourceResolutionPart16_0025_resources_title3_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0026_resources_title4_price1_image2` | `ResourceResolutionPart16_0026_resources_title4_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0027_resources_title5_price1_image2` | `ResourceResolutionPart16_0027_resources_title5_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0028_resources_title0_price2_image2` | `ResourceResolutionPart16_0028_resources_title0_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0029_resources_title1_price2_image2` | `ResourceResolutionPart16_0029_resources_title1_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0030_resources_title2_price2_image2` | `ResourceResolutionPart16_0030_resources_title2_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0031_resources_title3_price2_image2` | `ResourceResolutionPart16_0031_resources_title3_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0032_resources_title4_price2_image2` | `ResourceResolutionPart16_0032_resources_title4_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0033_resources_title5_price2_image2` | `ResourceResolutionPart16_0033_resources_title5_price2_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0034_resources_title0_price3_image2` | `ResourceResolutionPart16_0034_resources_title0_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0035_resources_title1_price3_image2` | `ResourceResolutionPart16_0035_resources_title1_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0036_resources_title2_price3_image2` | `ResourceResolutionPart16_0036_resources_title2_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0037_resources_title3_price3_image2` | `ResourceResolutionPart16_0037_resources_title3_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart16_0038_resources_title4_price3_image2` | `ResourceResolutionPart16_0038_resources_title4_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart17

源码：[EmbedControllerPart17.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart17.test.ets)；用例数：33。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart17_0001_controller_width4_height3_embed1` | `EmbedControllerPart17_0001_controller_width4_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0002_controller_width5_height3_embed1` | `EmbedControllerPart17_0002_controller_width5_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0003_controller_width0_height4_embed1` | `EmbedControllerPart17_0003_controller_width0_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0004_controller_width1_height4_embed1` | `EmbedControllerPart17_0004_controller_width1_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0005_controller_width2_height4_embed1` | `EmbedControllerPart17_0005_controller_width2_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0006_controller_width3_height4_embed1` | `EmbedControllerPart17_0006_controller_width3_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0007_controller_width4_height4_embed1` | `EmbedControllerPart17_0007_controller_width4_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0008_controller_width5_height4_embed1` | `EmbedControllerPart17_0008_controller_width5_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0009_controller_width0_height5_embed1` | `EmbedControllerPart17_0009_controller_width0_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0010_controller_width1_height5_embed1` | `EmbedControllerPart17_0010_controller_width1_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0011_controller_width2_height5_embed1` | `EmbedControllerPart17_0011_controller_width2_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0012_controller_width3_height5_embed1` | `EmbedControllerPart17_0012_controller_width3_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0013_controller_width4_height5_embed1` | `EmbedControllerPart17_0013_controller_width4_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0014_controller_width5_height5_embed1` | `EmbedControllerPart17_0014_controller_width5_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0015_controller_width0_height0_embed2` | `EmbedControllerPart17_0015_controller_width0_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0016_controller_width1_height0_embed2` | `EmbedControllerPart17_0016_controller_width1_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0017_controller_width2_height0_embed2` | `EmbedControllerPart17_0017_controller_width2_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0018_controller_width3_height0_embed2` | `EmbedControllerPart17_0018_controller_width3_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0019_controller_width4_height0_embed2` | `EmbedControllerPart17_0019_controller_width4_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0020_controller_width5_height0_embed2` | `EmbedControllerPart17_0020_controller_width5_height0_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0021_controller_width0_height1_embed2` | `EmbedControllerPart17_0021_controller_width0_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0022_controller_width1_height1_embed2` | `EmbedControllerPart17_0022_controller_width1_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0023_controller_width2_height1_embed2` | `EmbedControllerPart17_0023_controller_width2_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0024_controller_width3_height1_embed2` | `EmbedControllerPart17_0024_controller_width3_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0025_controller_width4_height1_embed2` | `EmbedControllerPart17_0025_controller_width4_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0026_controller_width5_height1_embed2` | `EmbedControllerPart17_0026_controller_width5_height1_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0027_controller_width0_height2_embed2` | `EmbedControllerPart17_0027_controller_width0_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0028_controller_width1_height2_embed2` | `EmbedControllerPart17_0028_controller_width1_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0029_controller_width2_height2_embed2` | `EmbedControllerPart17_0029_controller_width2_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0030_controller_width3_height2_embed2` | `EmbedControllerPart17_0030_controller_width3_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0031_controller_width4_height2_embed2` | `EmbedControllerPart17_0031_controller_width4_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0032_controller_width5_height2_embed2` | `EmbedControllerPart17_0032_controller_width5_height2_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart17_0033_controller_width0_height3_embed2` | `EmbedControllerPart17_0033_controller_width0_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart18

源码：[NativeInteractionPart18.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart18.test.ets)；用例数：33。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart18_0001_background_foreground` | `NativeInteractionPart18_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |
| `NativeInteractionPart18_0002_native_search_input2_title3_price1` | `NativeInteractionPart18_0002_native_search_input2_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0003_native_search_input3_title3_price1` | `NativeInteractionPart18_0003_native_search_input3_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0004_native_search_input4_title3_price1` | `NativeInteractionPart18_0004_native_search_input4_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0005_native_search_input5_title3_price1` | `NativeInteractionPart18_0005_native_search_input5_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0006_native_search_input7_title3_price1` | `NativeInteractionPart18_0006_native_search_input7_title3_price1` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title3_price1` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0007_native_search_input0_title0_price2` | `NativeInteractionPart18_0007_native_search_input0_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0008_native_search_input1_title0_price2` | `NativeInteractionPart18_0008_native_search_input1_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0009_native_search_input2_title0_price2` | `NativeInteractionPart18_0009_native_search_input2_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0010_native_search_input3_title0_price2` | `NativeInteractionPart18_0010_native_search_input3_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0011_native_search_input4_title0_price2` | `NativeInteractionPart18_0011_native_search_input4_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0012_native_search_input5_title0_price2` | `NativeInteractionPart18_0012_native_search_input5_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0013_native_search_input7_title0_price2` | `NativeInteractionPart18_0013_native_search_input7_title0_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title0_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0014_native_search_input0_title1_price2` | `NativeInteractionPart18_0014_native_search_input0_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0015_native_search_input1_title1_price2` | `NativeInteractionPart18_0015_native_search_input1_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0016_native_search_input2_title1_price2` | `NativeInteractionPart18_0016_native_search_input2_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0017_native_search_input3_title1_price2` | `NativeInteractionPart18_0017_native_search_input3_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0018_native_search_input4_title1_price2` | `NativeInteractionPart18_0018_native_search_input4_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0019_native_search_input5_title1_price2` | `NativeInteractionPart18_0019_native_search_input5_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0020_native_search_input7_title1_price2` | `NativeInteractionPart18_0020_native_search_input7_title1_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title1_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0021_native_search_input0_title2_price2` | `NativeInteractionPart18_0021_native_search_input0_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0022_native_search_input1_title2_price2` | `NativeInteractionPart18_0022_native_search_input1_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0023_native_search_input2_title2_price2` | `NativeInteractionPart18_0023_native_search_input2_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0024_native_search_input3_title2_price2` | `NativeInteractionPart18_0024_native_search_input3_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0025_native_search_input4_title2_price2` | `NativeInteractionPart18_0025_native_search_input4_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0026_native_search_input5_title2_price2` | `NativeInteractionPart18_0026_native_search_input5_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0027_native_search_input7_title2_price2` | `NativeInteractionPart18_0027_native_search_input7_title2_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title2_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0028_native_search_input0_title3_price2` | `NativeInteractionPart18_0028_native_search_input0_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0029_native_search_input1_title3_price2` | `NativeInteractionPart18_0029_native_search_input1_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0030_native_search_input2_title3_price2` | `NativeInteractionPart18_0030_native_search_input2_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0031_native_search_input3_title3_price2` | `NativeInteractionPart18_0031_native_search_input3_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0032_native_search_input4_title3_price2` | `NativeInteractionPart18_0032_native_search_input4_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart18_0033_native_search_input5_title3_price2` | `NativeInteractionPart18_0033_native_search_input5_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart19

源码：[GoodsConstructionPart19.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart19.test.ets)；用例数：32。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart19_0001_constructor_id6_image3_title1_price0` | `GoodsConstructionPart19_0001_constructor_id6_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0002_constructor_id7_image3_title1_price0` | `GoodsConstructionPart19_0002_constructor_id7_image3_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image3_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0003_constructor_id0_image4_title1_price0` | `GoodsConstructionPart19_0003_constructor_id0_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0004_constructor_id1_image4_title1_price0` | `GoodsConstructionPart19_0004_constructor_id1_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0005_constructor_id2_image4_title1_price0` | `GoodsConstructionPart19_0005_constructor_id2_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0006_constructor_id3_image4_title1_price0` | `GoodsConstructionPart19_0006_constructor_id3_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0007_constructor_id4_image4_title1_price0` | `GoodsConstructionPart19_0007_constructor_id4_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0008_constructor_id5_image4_title1_price0` | `GoodsConstructionPart19_0008_constructor_id5_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0009_constructor_id6_image4_title1_price0` | `GoodsConstructionPart19_0009_constructor_id6_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0010_constructor_id7_image4_title1_price0` | `GoodsConstructionPart19_0010_constructor_id7_image4_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image4_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0011_constructor_id0_image5_title1_price0` | `GoodsConstructionPart19_0011_constructor_id0_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0012_constructor_id1_image5_title1_price0` | `GoodsConstructionPart19_0012_constructor_id1_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0013_constructor_id2_image5_title1_price0` | `GoodsConstructionPart19_0013_constructor_id2_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0014_constructor_id3_image5_title1_price0` | `GoodsConstructionPart19_0014_constructor_id3_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0015_constructor_id4_image5_title1_price0` | `GoodsConstructionPart19_0015_constructor_id4_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0016_constructor_id5_image5_title1_price0` | `GoodsConstructionPart19_0016_constructor_id5_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0017_constructor_id6_image5_title1_price0` | `GoodsConstructionPart19_0017_constructor_id6_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0018_constructor_id7_image5_title1_price0` | `GoodsConstructionPart19_0018_constructor_id7_image5_title1_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image5_title1_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0019_constructor_id0_image0_title2_price0` | `GoodsConstructionPart19_0019_constructor_id0_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0020_constructor_id1_image0_title2_price0` | `GoodsConstructionPart19_0020_constructor_id1_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0021_constructor_id2_image0_title2_price0` | `GoodsConstructionPart19_0021_constructor_id2_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0022_constructor_id3_image0_title2_price0` | `GoodsConstructionPart19_0022_constructor_id3_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0023_constructor_id4_image0_title2_price0` | `GoodsConstructionPart19_0023_constructor_id4_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0024_constructor_id5_image0_title2_price0` | `GoodsConstructionPart19_0024_constructor_id5_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0025_constructor_id6_image0_title2_price0` | `GoodsConstructionPart19_0025_constructor_id6_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0026_constructor_id7_image0_title2_price0` | `GoodsConstructionPart19_0026_constructor_id7_image0_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image0_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0027_constructor_id0_image1_title2_price0` | `GoodsConstructionPart19_0027_constructor_id0_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0028_constructor_id1_image1_title2_price0` | `GoodsConstructionPart19_0028_constructor_id1_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0029_constructor_id2_image1_title2_price0` | `GoodsConstructionPart19_0029_constructor_id2_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0030_constructor_id3_image1_title2_price0` | `GoodsConstructionPart19_0030_constructor_id3_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0031_constructor_id4_image1_title2_price0` | `GoodsConstructionPart19_0031_constructor_id4_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart19_0032_constructor_id5_image1_title2_price0` | `GoodsConstructionPart19_0032_constructor_id5_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart20

源码：[GoodsMutationPart20.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart20.test.ets)；用例数：33。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart20_0001_mutate_price_source2_image2_title1_price0_mode7` | `GoodsMutationPart20_0001_mutate_price_source2_image2_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0002_mutate_id_source3_image3_title1_price0_mode0` | `GoodsMutationPart20_0002_mutate_id_source3_image3_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0003_mutate_imageRes_source3_image3_title1_price0_mode1` | `GoodsMutationPart20_0003_mutate_imageRes_source3_image3_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0004_mutate_title_source3_image3_title1_price0_mode2` | `GoodsMutationPart20_0004_mutate_title_source3_image3_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0005_mutate_price_source3_image3_title1_price0_mode3` | `GoodsMutationPart20_0005_mutate_price_source3_image3_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0006_mutate_id_source3_image3_title1_price0_mode4` | `GoodsMutationPart20_0006_mutate_id_source3_image3_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0007_mutate_imageRes_source3_image3_title1_price0_mode5` | `GoodsMutationPart20_0007_mutate_imageRes_source3_image3_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0008_mutate_title_source3_image3_title1_price0_mode6` | `GoodsMutationPart20_0008_mutate_title_source3_image3_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0009_mutate_price_source3_image3_title1_price0_mode7` | `GoodsMutationPart20_0009_mutate_price_source3_image3_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0010_mutate_id_source4_image4_title1_price0_mode0` | `GoodsMutationPart20_0010_mutate_id_source4_image4_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0011_mutate_imageRes_source4_image4_title1_price0_mode1` | `GoodsMutationPart20_0011_mutate_imageRes_source4_image4_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0012_mutate_title_source4_image4_title1_price0_mode2` | `GoodsMutationPart20_0012_mutate_title_source4_image4_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0013_mutate_price_source4_image4_title1_price0_mode3` | `GoodsMutationPart20_0013_mutate_price_source4_image4_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0014_mutate_id_source4_image4_title1_price0_mode4` | `GoodsMutationPart20_0014_mutate_id_source4_image4_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0015_mutate_imageRes_source4_image4_title1_price0_mode5` | `GoodsMutationPart20_0015_mutate_imageRes_source4_image4_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0016_mutate_title_source4_image4_title1_price0_mode6` | `GoodsMutationPart20_0016_mutate_title_source4_image4_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0017_mutate_price_source4_image4_title1_price0_mode7` | `GoodsMutationPart20_0017_mutate_price_source4_image4_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0018_mutate_id_source5_image5_title1_price0_mode0` | `GoodsMutationPart20_0018_mutate_id_source5_image5_title1_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title1_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0019_mutate_imageRes_source5_image5_title1_price0_mode1` | `GoodsMutationPart20_0019_mutate_imageRes_source5_image5_title1_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title1_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0020_mutate_title_source5_image5_title1_price0_mode2` | `GoodsMutationPart20_0020_mutate_title_source5_image5_title1_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title1_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0021_mutate_price_source5_image5_title1_price0_mode3` | `GoodsMutationPart20_0021_mutate_price_source5_image5_title1_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title1_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0022_mutate_id_source5_image5_title1_price0_mode4` | `GoodsMutationPart20_0022_mutate_id_source5_image5_title1_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title1_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0023_mutate_imageRes_source5_image5_title1_price0_mode5` | `GoodsMutationPart20_0023_mutate_imageRes_source5_image5_title1_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title1_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0024_mutate_title_source5_image5_title1_price0_mode6` | `GoodsMutationPart20_0024_mutate_title_source5_image5_title1_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title1_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0025_mutate_price_source5_image5_title1_price0_mode7` | `GoodsMutationPart20_0025_mutate_price_source5_image5_title1_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title1_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0026_mutate_id_source0_image0_title2_price0_mode0` | `GoodsMutationPart20_0026_mutate_id_source0_image0_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0027_mutate_imageRes_source0_image0_title2_price0_mode1` | `GoodsMutationPart20_0027_mutate_imageRes_source0_image0_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0028_mutate_title_source0_image0_title2_price0_mode2` | `GoodsMutationPart20_0028_mutate_title_source0_image0_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0029_mutate_price_source0_image0_title2_price0_mode3` | `GoodsMutationPart20_0029_mutate_price_source0_image0_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0030_mutate_id_source0_image0_title2_price0_mode4` | `GoodsMutationPart20_0030_mutate_id_source0_image0_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0031_mutate_imageRes_source0_image0_title2_price0_mode5` | `GoodsMutationPart20_0031_mutate_imageRes_source0_image0_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0032_mutate_title_source0_image0_title2_price0_mode6` | `GoodsMutationPart20_0032_mutate_title_source0_image0_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart20_0033_mutate_price_source0_image0_title2_price0_mode7` | `GoodsMutationPart20_0033_mutate_price_source0_image0_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart21

源码：[CatalogBindingPart21.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart21.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart21_0001_catalog_binding_0_peer5_third1` | `CatalogBindingPart21_0001_catalog_binding_0_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0002_catalog_binding_1_peer5_third1` | `CatalogBindingPart21_0002_catalog_binding_1_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0003_catalog_binding_2_peer5_third1` | `CatalogBindingPart21_0003_catalog_binding_2_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0004_catalog_binding_3_peer5_third1` | `CatalogBindingPart21_0004_catalog_binding_3_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0005_catalog_binding_4_peer5_third1` | `CatalogBindingPart21_0005_catalog_binding_4_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0006_catalog_binding_5_peer5_third1` | `CatalogBindingPart21_0006_catalog_binding_5_peer5_third1` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third1` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0007_catalog_binding_0_peer0_third2` | `CatalogBindingPart21_0007_catalog_binding_0_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0008_catalog_binding_1_peer0_third2` | `CatalogBindingPart21_0008_catalog_binding_1_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0009_catalog_binding_2_peer0_third2` | `CatalogBindingPart21_0009_catalog_binding_2_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0010_catalog_binding_3_peer0_third2` | `CatalogBindingPart21_0010_catalog_binding_3_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0011_catalog_binding_4_peer0_third2` | `CatalogBindingPart21_0011_catalog_binding_4_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0012_catalog_binding_5_peer0_third2` | `CatalogBindingPart21_0012_catalog_binding_5_peer0_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0013_catalog_binding_0_peer1_third2` | `CatalogBindingPart21_0013_catalog_binding_0_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0014_catalog_binding_1_peer1_third2` | `CatalogBindingPart21_0014_catalog_binding_1_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0015_catalog_binding_2_peer1_third2` | `CatalogBindingPart21_0015_catalog_binding_2_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0016_catalog_binding_3_peer1_third2` | `CatalogBindingPart21_0016_catalog_binding_3_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0017_catalog_binding_4_peer1_third2` | `CatalogBindingPart21_0017_catalog_binding_4_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0018_catalog_binding_5_peer1_third2` | `CatalogBindingPart21_0018_catalog_binding_5_peer1_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0019_catalog_binding_0_peer2_third2` | `CatalogBindingPart21_0019_catalog_binding_0_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0020_catalog_binding_1_peer2_third2` | `CatalogBindingPart21_0020_catalog_binding_1_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0021_catalog_binding_2_peer2_third2` | `CatalogBindingPart21_0021_catalog_binding_2_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0022_catalog_binding_3_peer2_third2` | `CatalogBindingPart21_0022_catalog_binding_3_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart21_0023_catalog_binding_4_peer2_third2` | `CatalogBindingPart21_0023_catalog_binding_4_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart22

源码：[ResourceResolutionPart22.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart22.test.ets)；用例数：39。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart22_0001_resources_title4_price3_image2` | `ResourceResolutionPart22_0001_resources_title4_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0002_resources_title5_price3_image2` | `ResourceResolutionPart22_0002_resources_title5_price3_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0003_resources_title0_price4_image2` | `ResourceResolutionPart22_0003_resources_title0_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0004_resources_title1_price4_image2` | `ResourceResolutionPart22_0004_resources_title1_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0005_resources_title2_price4_image2` | `ResourceResolutionPart22_0005_resources_title2_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0006_resources_title3_price4_image2` | `ResourceResolutionPart22_0006_resources_title3_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0007_resources_title4_price4_image2` | `ResourceResolutionPart22_0007_resources_title4_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0008_resources_title5_price4_image2` | `ResourceResolutionPart22_0008_resources_title5_price4_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0009_resources_title0_price5_image2` | `ResourceResolutionPart22_0009_resources_title0_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0010_resources_title1_price5_image2` | `ResourceResolutionPart22_0010_resources_title1_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0011_resources_title2_price5_image2` | `ResourceResolutionPart22_0011_resources_title2_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0012_resources_title3_price5_image2` | `ResourceResolutionPart22_0012_resources_title3_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0013_resources_title4_price5_image2` | `ResourceResolutionPart22_0013_resources_title4_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0014_resources_title5_price5_image2` | `ResourceResolutionPart22_0014_resources_title5_price5_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0015_resources_title0_price0_image3` | `ResourceResolutionPart22_0015_resources_title0_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0016_resources_title1_price0_image3` | `ResourceResolutionPart22_0016_resources_title1_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0017_resources_title2_price0_image3` | `ResourceResolutionPart22_0017_resources_title2_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0018_resources_title3_price0_image3` | `ResourceResolutionPart22_0018_resources_title3_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0019_resources_title4_price0_image3` | `ResourceResolutionPart22_0019_resources_title4_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0020_resources_title5_price0_image3` | `ResourceResolutionPart22_0020_resources_title5_price0_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0021_resources_title0_price1_image3` | `ResourceResolutionPart22_0021_resources_title0_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0022_resources_title1_price1_image3` | `ResourceResolutionPart22_0022_resources_title1_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0023_resources_title2_price1_image3` | `ResourceResolutionPart22_0023_resources_title2_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0024_resources_title3_price1_image3` | `ResourceResolutionPart22_0024_resources_title3_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0025_resources_title4_price1_image3` | `ResourceResolutionPart22_0025_resources_title4_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0026_resources_title5_price1_image3` | `ResourceResolutionPart22_0026_resources_title5_price1_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0027_resources_title0_price2_image3` | `ResourceResolutionPart22_0027_resources_title0_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0028_resources_title1_price2_image3` | `ResourceResolutionPart22_0028_resources_title1_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0029_resources_title2_price2_image3` | `ResourceResolutionPart22_0029_resources_title2_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0030_resources_title3_price2_image3` | `ResourceResolutionPart22_0030_resources_title3_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0031_resources_title4_price2_image3` | `ResourceResolutionPart22_0031_resources_title4_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0032_resources_title5_price2_image3` | `ResourceResolutionPart22_0032_resources_title5_price2_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0033_resources_title0_price3_image3` | `ResourceResolutionPart22_0033_resources_title0_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0034_resources_title1_price3_image3` | `ResourceResolutionPart22_0034_resources_title1_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0035_resources_title2_price3_image3` | `ResourceResolutionPart22_0035_resources_title2_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0036_resources_title3_price3_image3` | `ResourceResolutionPart22_0036_resources_title3_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0037_resources_title4_price3_image3` | `ResourceResolutionPart22_0037_resources_title4_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0038_resources_title5_price3_image3` | `ResourceResolutionPart22_0038_resources_title5_price3_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart22_0039_resources_title0_price4_image3` | `ResourceResolutionPart22_0039_resources_title0_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart23

源码：[EmbedControllerPart23.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart23.test.ets)；用例数：31。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart23_0001_controller_width0_height3_embed2` | `EmbedControllerPart23_0001_controller_width0_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0002_controller_width1_height3_embed2` | `EmbedControllerPart23_0002_controller_width1_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0003_controller_width2_height3_embed2` | `EmbedControllerPart23_0003_controller_width2_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0004_controller_width3_height3_embed2` | `EmbedControllerPart23_0004_controller_width3_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0005_controller_width4_height3_embed2` | `EmbedControllerPart23_0005_controller_width4_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0006_controller_width5_height3_embed2` | `EmbedControllerPart23_0006_controller_width5_height3_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0007_controller_width0_height4_embed2` | `EmbedControllerPart23_0007_controller_width0_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0008_controller_width1_height4_embed2` | `EmbedControllerPart23_0008_controller_width1_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0009_controller_width2_height4_embed2` | `EmbedControllerPart23_0009_controller_width2_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0010_controller_width3_height4_embed2` | `EmbedControllerPart23_0010_controller_width3_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0011_controller_width4_height4_embed2` | `EmbedControllerPart23_0011_controller_width4_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0012_controller_width5_height4_embed2` | `EmbedControllerPart23_0012_controller_width5_height4_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0013_controller_width0_height5_embed2` | `EmbedControllerPart23_0013_controller_width0_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0014_controller_width1_height5_embed2` | `EmbedControllerPart23_0014_controller_width1_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0015_controller_width2_height5_embed2` | `EmbedControllerPart23_0015_controller_width2_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0016_controller_width3_height5_embed2` | `EmbedControllerPart23_0016_controller_width3_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0017_controller_width4_height5_embed2` | `EmbedControllerPart23_0017_controller_width4_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0018_controller_width5_height5_embed2` | `EmbedControllerPart23_0018_controller_width5_height5_embed2` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed2` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0019_controller_width0_height0_embed3` | `EmbedControllerPart23_0019_controller_width0_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0020_controller_width1_height0_embed3` | `EmbedControllerPart23_0020_controller_width1_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0021_controller_width2_height0_embed3` | `EmbedControllerPart23_0021_controller_width2_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0022_controller_width3_height0_embed3` | `EmbedControllerPart23_0022_controller_width3_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0023_controller_width4_height0_embed3` | `EmbedControllerPart23_0023_controller_width4_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0024_controller_width5_height0_embed3` | `EmbedControllerPart23_0024_controller_width5_height0_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0025_controller_width0_height1_embed3` | `EmbedControllerPart23_0025_controller_width0_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0026_controller_width1_height1_embed3` | `EmbedControllerPart23_0026_controller_width1_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0027_controller_width2_height1_embed3` | `EmbedControllerPart23_0027_controller_width2_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0028_controller_width3_height1_embed3` | `EmbedControllerPart23_0028_controller_width3_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0029_controller_width4_height1_embed3` | `EmbedControllerPart23_0029_controller_width4_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0030_controller_width5_height1_embed3` | `EmbedControllerPart23_0030_controller_width5_height1_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart23_0031_controller_width0_height2_embed3` | `EmbedControllerPart23_0031_controller_width0_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart24

源码：[NativeInteractionPart24.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart24.test.ets)；用例数：15。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart24_0001_background_foreground` | `NativeInteractionPart24_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |
| `NativeInteractionPart24_0002_native_search_input7_title3_price2` | `NativeInteractionPart24_0002_native_search_input7_title3_price2` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title3_price2` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0003_native_search_input0_title0_price3` | `NativeInteractionPart24_0003_native_search_input0_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0004_native_search_input1_title0_price3` | `NativeInteractionPart24_0004_native_search_input1_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0005_native_search_input2_title0_price3` | `NativeInteractionPart24_0005_native_search_input2_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0006_native_search_input3_title0_price3` | `NativeInteractionPart24_0006_native_search_input3_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0007_native_search_input4_title0_price3` | `NativeInteractionPart24_0007_native_search_input4_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0008_native_search_input5_title0_price3` | `NativeInteractionPart24_0008_native_search_input5_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0009_native_search_input7_title0_price3` | `NativeInteractionPart24_0009_native_search_input7_title0_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title0_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0010_native_search_input0_title1_price3` | `NativeInteractionPart24_0010_native_search_input0_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0011_native_search_input1_title1_price3` | `NativeInteractionPart24_0011_native_search_input1_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0012_native_search_input2_title1_price3` | `NativeInteractionPart24_0012_native_search_input2_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0013_native_search_input3_title1_price3` | `NativeInteractionPart24_0013_native_search_input3_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0014_native_search_input4_title1_price3` | `NativeInteractionPart24_0014_native_search_input4_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart24_0015_native_search_input5_title1_price3` | `NativeInteractionPart24_0015_native_search_input5_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart25

源码：[GoodsConstructionPart25.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart25.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart25_0001_constructor_id6_image1_title2_price0` | `GoodsConstructionPart25_0001_constructor_id6_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0002_constructor_id7_image1_title2_price0` | `GoodsConstructionPart25_0002_constructor_id7_image1_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image1_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0003_constructor_id0_image2_title2_price0` | `GoodsConstructionPart25_0003_constructor_id0_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0004_constructor_id1_image2_title2_price0` | `GoodsConstructionPart25_0004_constructor_id1_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0005_constructor_id2_image2_title2_price0` | `GoodsConstructionPart25_0005_constructor_id2_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0006_constructor_id3_image2_title2_price0` | `GoodsConstructionPart25_0006_constructor_id3_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0007_constructor_id4_image2_title2_price0` | `GoodsConstructionPart25_0007_constructor_id4_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0008_constructor_id5_image2_title2_price0` | `GoodsConstructionPart25_0008_constructor_id5_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0009_constructor_id6_image2_title2_price0` | `GoodsConstructionPart25_0009_constructor_id6_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0010_constructor_id7_image2_title2_price0` | `GoodsConstructionPart25_0010_constructor_id7_image2_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image2_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0011_constructor_id0_image3_title2_price0` | `GoodsConstructionPart25_0011_constructor_id0_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0012_constructor_id1_image3_title2_price0` | `GoodsConstructionPart25_0012_constructor_id1_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0013_constructor_id2_image3_title2_price0` | `GoodsConstructionPart25_0013_constructor_id2_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0014_constructor_id3_image3_title2_price0` | `GoodsConstructionPart25_0014_constructor_id3_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0015_constructor_id4_image3_title2_price0` | `GoodsConstructionPart25_0015_constructor_id4_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0016_constructor_id5_image3_title2_price0` | `GoodsConstructionPart25_0016_constructor_id5_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0017_constructor_id6_image3_title2_price0` | `GoodsConstructionPart25_0017_constructor_id6_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0018_constructor_id7_image3_title2_price0` | `GoodsConstructionPart25_0018_constructor_id7_image3_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image3_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0019_constructor_id0_image4_title2_price0` | `GoodsConstructionPart25_0019_constructor_id0_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0020_constructor_id1_image4_title2_price0` | `GoodsConstructionPart25_0020_constructor_id1_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0021_constructor_id2_image4_title2_price0` | `GoodsConstructionPart25_0021_constructor_id2_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0022_constructor_id3_image4_title2_price0` | `GoodsConstructionPart25_0022_constructor_id3_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0023_constructor_id4_image4_title2_price0` | `GoodsConstructionPart25_0023_constructor_id4_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0024_constructor_id5_image4_title2_price0` | `GoodsConstructionPart25_0024_constructor_id5_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0025_constructor_id6_image4_title2_price0` | `GoodsConstructionPart25_0025_constructor_id6_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart25_0026_constructor_id7_image4_title2_price0` | `GoodsConstructionPart25_0026_constructor_id7_image4_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image4_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart26

源码：[GoodsMutationPart26.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart26.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart26_0001_mutate_id_source1_image1_title2_price0_mode0` | `GoodsMutationPart26_0001_mutate_id_source1_image1_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0002_mutate_imageRes_source1_image1_title2_price0_mode1` | `GoodsMutationPart26_0002_mutate_imageRes_source1_image1_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0003_mutate_title_source1_image1_title2_price0_mode2` | `GoodsMutationPart26_0003_mutate_title_source1_image1_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0004_mutate_price_source1_image1_title2_price0_mode3` | `GoodsMutationPart26_0004_mutate_price_source1_image1_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0005_mutate_id_source1_image1_title2_price0_mode4` | `GoodsMutationPart26_0005_mutate_id_source1_image1_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0006_mutate_imageRes_source1_image1_title2_price0_mode5` | `GoodsMutationPart26_0006_mutate_imageRes_source1_image1_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0007_mutate_title_source1_image1_title2_price0_mode6` | `GoodsMutationPart26_0007_mutate_title_source1_image1_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0008_mutate_price_source1_image1_title2_price0_mode7` | `GoodsMutationPart26_0008_mutate_price_source1_image1_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0009_mutate_id_source2_image2_title2_price0_mode0` | `GoodsMutationPart26_0009_mutate_id_source2_image2_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0010_mutate_imageRes_source2_image2_title2_price0_mode1` | `GoodsMutationPart26_0010_mutate_imageRes_source2_image2_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0011_mutate_title_source2_image2_title2_price0_mode2` | `GoodsMutationPart26_0011_mutate_title_source2_image2_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0012_mutate_price_source2_image2_title2_price0_mode3` | `GoodsMutationPart26_0012_mutate_price_source2_image2_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0013_mutate_id_source2_image2_title2_price0_mode4` | `GoodsMutationPart26_0013_mutate_id_source2_image2_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0014_mutate_imageRes_source2_image2_title2_price0_mode5` | `GoodsMutationPart26_0014_mutate_imageRes_source2_image2_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0015_mutate_title_source2_image2_title2_price0_mode6` | `GoodsMutationPart26_0015_mutate_title_source2_image2_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0016_mutate_price_source2_image2_title2_price0_mode7` | `GoodsMutationPart26_0016_mutate_price_source2_image2_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0017_mutate_id_source3_image3_title2_price0_mode0` | `GoodsMutationPart26_0017_mutate_id_source3_image3_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0018_mutate_imageRes_source3_image3_title2_price0_mode1` | `GoodsMutationPart26_0018_mutate_imageRes_source3_image3_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0019_mutate_title_source3_image3_title2_price0_mode2` | `GoodsMutationPart26_0019_mutate_title_source3_image3_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0020_mutate_price_source3_image3_title2_price0_mode3` | `GoodsMutationPart26_0020_mutate_price_source3_image3_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0021_mutate_id_source3_image3_title2_price0_mode4` | `GoodsMutationPart26_0021_mutate_id_source3_image3_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0022_mutate_imageRes_source3_image3_title2_price0_mode5` | `GoodsMutationPart26_0022_mutate_imageRes_source3_image3_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart26_0023_mutate_title_source3_image3_title2_price0_mode6` | `GoodsMutationPart26_0023_mutate_title_source3_image3_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart27

源码：[CatalogBindingPart27.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart27.test.ets)；用例数：38。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart27_0001_catalog_binding_4_peer2_third2` | `CatalogBindingPart27_0001_catalog_binding_4_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0002_catalog_binding_5_peer2_third2` | `CatalogBindingPart27_0002_catalog_binding_5_peer2_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0003_catalog_binding_0_peer3_third2` | `CatalogBindingPart27_0003_catalog_binding_0_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0004_catalog_binding_1_peer3_third2` | `CatalogBindingPart27_0004_catalog_binding_1_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0005_catalog_binding_2_peer3_third2` | `CatalogBindingPart27_0005_catalog_binding_2_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0006_catalog_binding_3_peer3_third2` | `CatalogBindingPart27_0006_catalog_binding_3_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0007_catalog_binding_4_peer3_third2` | `CatalogBindingPart27_0007_catalog_binding_4_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0008_catalog_binding_5_peer3_third2` | `CatalogBindingPart27_0008_catalog_binding_5_peer3_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0009_catalog_binding_0_peer4_third2` | `CatalogBindingPart27_0009_catalog_binding_0_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0010_catalog_binding_1_peer4_third2` | `CatalogBindingPart27_0010_catalog_binding_1_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0011_catalog_binding_2_peer4_third2` | `CatalogBindingPart27_0011_catalog_binding_2_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0012_catalog_binding_3_peer4_third2` | `CatalogBindingPart27_0012_catalog_binding_3_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0013_catalog_binding_4_peer4_third2` | `CatalogBindingPart27_0013_catalog_binding_4_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0014_catalog_binding_5_peer4_third2` | `CatalogBindingPart27_0014_catalog_binding_5_peer4_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0015_catalog_binding_0_peer5_third2` | `CatalogBindingPart27_0015_catalog_binding_0_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0016_catalog_binding_1_peer5_third2` | `CatalogBindingPart27_0016_catalog_binding_1_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0017_catalog_binding_2_peer5_third2` | `CatalogBindingPart27_0017_catalog_binding_2_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0018_catalog_binding_3_peer5_third2` | `CatalogBindingPart27_0018_catalog_binding_3_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0019_catalog_binding_4_peer5_third2` | `CatalogBindingPart27_0019_catalog_binding_4_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0020_catalog_binding_5_peer5_third2` | `CatalogBindingPart27_0020_catalog_binding_5_peer5_third2` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third2` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0021_catalog_binding_0_peer0_third3` | `CatalogBindingPart27_0021_catalog_binding_0_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0022_catalog_binding_1_peer0_third3` | `CatalogBindingPart27_0022_catalog_binding_1_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0023_catalog_binding_2_peer0_third3` | `CatalogBindingPart27_0023_catalog_binding_2_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0024_catalog_binding_3_peer0_third3` | `CatalogBindingPart27_0024_catalog_binding_3_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0025_catalog_binding_4_peer0_third3` | `CatalogBindingPart27_0025_catalog_binding_4_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0026_catalog_binding_5_peer0_third3` | `CatalogBindingPart27_0026_catalog_binding_5_peer0_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0027_catalog_binding_0_peer1_third3` | `CatalogBindingPart27_0027_catalog_binding_0_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0028_catalog_binding_1_peer1_third3` | `CatalogBindingPart27_0028_catalog_binding_1_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0029_catalog_binding_2_peer1_third3` | `CatalogBindingPart27_0029_catalog_binding_2_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0030_catalog_binding_3_peer1_third3` | `CatalogBindingPart27_0030_catalog_binding_3_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0031_catalog_binding_4_peer1_third3` | `CatalogBindingPart27_0031_catalog_binding_4_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0032_catalog_binding_5_peer1_third3` | `CatalogBindingPart27_0032_catalog_binding_5_peer1_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0033_catalog_binding_0_peer2_third3` | `CatalogBindingPart27_0033_catalog_binding_0_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0034_catalog_binding_1_peer2_third3` | `CatalogBindingPart27_0034_catalog_binding_1_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0035_catalog_binding_2_peer2_third3` | `CatalogBindingPart27_0035_catalog_binding_2_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0036_catalog_binding_3_peer2_third3` | `CatalogBindingPart27_0036_catalog_binding_3_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0037_catalog_binding_4_peer2_third3` | `CatalogBindingPart27_0037_catalog_binding_4_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart27_0038_catalog_binding_5_peer2_third3` | `CatalogBindingPart27_0038_catalog_binding_5_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart28

源码：[ResourceResolutionPart28.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart28.test.ets)；用例数：43。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart28_0001_resources_title0_price4_image3` | `ResourceResolutionPart28_0001_resources_title0_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0002_resources_title1_price4_image3` | `ResourceResolutionPart28_0002_resources_title1_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0003_resources_title2_price4_image3` | `ResourceResolutionPart28_0003_resources_title2_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0004_resources_title3_price4_image3` | `ResourceResolutionPart28_0004_resources_title3_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0005_resources_title4_price4_image3` | `ResourceResolutionPart28_0005_resources_title4_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0006_resources_title5_price4_image3` | `ResourceResolutionPart28_0006_resources_title5_price4_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0007_resources_title0_price5_image3` | `ResourceResolutionPart28_0007_resources_title0_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0008_resources_title1_price5_image3` | `ResourceResolutionPart28_0008_resources_title1_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0009_resources_title2_price5_image3` | `ResourceResolutionPart28_0009_resources_title2_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0010_resources_title3_price5_image3` | `ResourceResolutionPart28_0010_resources_title3_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0011_resources_title4_price5_image3` | `ResourceResolutionPart28_0011_resources_title4_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0012_resources_title5_price5_image3` | `ResourceResolutionPart28_0012_resources_title5_price5_image3` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image3` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0013_resources_title0_price0_image4` | `ResourceResolutionPart28_0013_resources_title0_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0014_resources_title1_price0_image4` | `ResourceResolutionPart28_0014_resources_title1_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0015_resources_title2_price0_image4` | `ResourceResolutionPart28_0015_resources_title2_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0016_resources_title3_price0_image4` | `ResourceResolutionPart28_0016_resources_title3_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0017_resources_title4_price0_image4` | `ResourceResolutionPart28_0017_resources_title4_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0018_resources_title5_price0_image4` | `ResourceResolutionPart28_0018_resources_title5_price0_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0019_resources_title0_price1_image4` | `ResourceResolutionPart28_0019_resources_title0_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0020_resources_title1_price1_image4` | `ResourceResolutionPart28_0020_resources_title1_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0021_resources_title2_price1_image4` | `ResourceResolutionPart28_0021_resources_title2_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0022_resources_title3_price1_image4` | `ResourceResolutionPart28_0022_resources_title3_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0023_resources_title4_price1_image4` | `ResourceResolutionPart28_0023_resources_title4_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0024_resources_title5_price1_image4` | `ResourceResolutionPart28_0024_resources_title5_price1_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0025_resources_title0_price2_image4` | `ResourceResolutionPart28_0025_resources_title0_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0026_resources_title1_price2_image4` | `ResourceResolutionPart28_0026_resources_title1_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0027_resources_title2_price2_image4` | `ResourceResolutionPart28_0027_resources_title2_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0028_resources_title3_price2_image4` | `ResourceResolutionPart28_0028_resources_title3_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0029_resources_title4_price2_image4` | `ResourceResolutionPart28_0029_resources_title4_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0030_resources_title5_price2_image4` | `ResourceResolutionPart28_0030_resources_title5_price2_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0031_resources_title0_price3_image4` | `ResourceResolutionPart28_0031_resources_title0_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0032_resources_title1_price3_image4` | `ResourceResolutionPart28_0032_resources_title1_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0033_resources_title2_price3_image4` | `ResourceResolutionPart28_0033_resources_title2_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0034_resources_title3_price3_image4` | `ResourceResolutionPart28_0034_resources_title3_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0035_resources_title4_price3_image4` | `ResourceResolutionPart28_0035_resources_title4_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0036_resources_title5_price3_image4` | `ResourceResolutionPart28_0036_resources_title5_price3_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0037_resources_title0_price4_image4` | `ResourceResolutionPart28_0037_resources_title0_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0038_resources_title1_price4_image4` | `ResourceResolutionPart28_0038_resources_title1_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0039_resources_title2_price4_image4` | `ResourceResolutionPart28_0039_resources_title2_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0040_resources_title3_price4_image4` | `ResourceResolutionPart28_0040_resources_title3_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0041_resources_title4_price4_image4` | `ResourceResolutionPart28_0041_resources_title4_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0042_resources_title5_price4_image4` | `ResourceResolutionPart28_0042_resources_title5_price4_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart28_0043_resources_title0_price5_image4` | `ResourceResolutionPart28_0043_resources_title0_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart29

源码：[EmbedControllerPart29.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart29.test.ets)；用例数：40。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart29_0001_controller_width0_height2_embed3` | `EmbedControllerPart29_0001_controller_width0_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0002_controller_width1_height2_embed3` | `EmbedControllerPart29_0002_controller_width1_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0003_controller_width2_height2_embed3` | `EmbedControllerPart29_0003_controller_width2_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0004_controller_width3_height2_embed3` | `EmbedControllerPart29_0004_controller_width3_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0005_controller_width4_height2_embed3` | `EmbedControllerPart29_0005_controller_width4_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0006_controller_width5_height2_embed3` | `EmbedControllerPart29_0006_controller_width5_height2_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0007_controller_width0_height3_embed3` | `EmbedControllerPart29_0007_controller_width0_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0008_controller_width1_height3_embed3` | `EmbedControllerPart29_0008_controller_width1_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0009_controller_width2_height3_embed3` | `EmbedControllerPart29_0009_controller_width2_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0010_controller_width3_height3_embed3` | `EmbedControllerPart29_0010_controller_width3_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0011_controller_width4_height3_embed3` | `EmbedControllerPart29_0011_controller_width4_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0012_controller_width5_height3_embed3` | `EmbedControllerPart29_0012_controller_width5_height3_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0013_controller_width0_height4_embed3` | `EmbedControllerPart29_0013_controller_width0_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0014_controller_width1_height4_embed3` | `EmbedControllerPart29_0014_controller_width1_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0015_controller_width2_height4_embed3` | `EmbedControllerPart29_0015_controller_width2_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0016_controller_width3_height4_embed3` | `EmbedControllerPart29_0016_controller_width3_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0017_controller_width4_height4_embed3` | `EmbedControllerPart29_0017_controller_width4_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0018_controller_width5_height4_embed3` | `EmbedControllerPart29_0018_controller_width5_height4_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0019_controller_width0_height5_embed3` | `EmbedControllerPart29_0019_controller_width0_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0020_controller_width1_height5_embed3` | `EmbedControllerPart29_0020_controller_width1_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0021_controller_width2_height5_embed3` | `EmbedControllerPart29_0021_controller_width2_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0022_controller_width3_height5_embed3` | `EmbedControllerPart29_0022_controller_width3_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0023_controller_width4_height5_embed3` | `EmbedControllerPart29_0023_controller_width4_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0024_controller_width5_height5_embed3` | `EmbedControllerPart29_0024_controller_width5_height5_embed3` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed3` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0025_controller_width0_height0_embed4` | `EmbedControllerPart29_0025_controller_width0_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0026_controller_width1_height0_embed4` | `EmbedControllerPart29_0026_controller_width1_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0027_controller_width2_height0_embed4` | `EmbedControllerPart29_0027_controller_width2_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0028_controller_width3_height0_embed4` | `EmbedControllerPart29_0028_controller_width3_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0029_controller_width4_height0_embed4` | `EmbedControllerPart29_0029_controller_width4_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0030_controller_width5_height0_embed4` | `EmbedControllerPart29_0030_controller_width5_height0_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0031_controller_width0_height1_embed4` | `EmbedControllerPart29_0031_controller_width0_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0032_controller_width1_height1_embed4` | `EmbedControllerPart29_0032_controller_width1_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0033_controller_width2_height1_embed4` | `EmbedControllerPart29_0033_controller_width2_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0034_controller_width3_height1_embed4` | `EmbedControllerPart29_0034_controller_width3_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0035_controller_width4_height1_embed4` | `EmbedControllerPart29_0035_controller_width4_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0036_controller_width5_height1_embed4` | `EmbedControllerPart29_0036_controller_width5_height1_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0037_controller_width0_height2_embed4` | `EmbedControllerPart29_0037_controller_width0_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0038_controller_width1_height2_embed4` | `EmbedControllerPart29_0038_controller_width1_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0039_controller_width2_height2_embed4` | `EmbedControllerPart29_0039_controller_width2_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart29_0040_controller_width3_height2_embed4` | `EmbedControllerPart29_0040_controller_width3_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart30

源码：[NativeInteractionPart30.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart30.test.ets)；用例数：16。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart30_0001_background_foreground` | `NativeInteractionPart30_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |
| `NativeInteractionPart30_0002_native_search_input7_title1_price3` | `NativeInteractionPart30_0002_native_search_input7_title1_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title1_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0003_native_search_input0_title2_price3` | `NativeInteractionPart30_0003_native_search_input0_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0004_native_search_input1_title2_price3` | `NativeInteractionPart30_0004_native_search_input1_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0005_native_search_input2_title2_price3` | `NativeInteractionPart30_0005_native_search_input2_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0006_native_search_input3_title2_price3` | `NativeInteractionPart30_0006_native_search_input3_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0007_native_search_input4_title2_price3` | `NativeInteractionPart30_0007_native_search_input4_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0008_native_search_input5_title2_price3` | `NativeInteractionPart30_0008_native_search_input5_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0009_native_search_input7_title2_price3` | `NativeInteractionPart30_0009_native_search_input7_title2_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title2_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0010_native_search_input0_title3_price3` | `NativeInteractionPart30_0010_native_search_input0_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0011_native_search_input1_title3_price3` | `NativeInteractionPart30_0011_native_search_input1_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0012_native_search_input2_title3_price3` | `NativeInteractionPart30_0012_native_search_input2_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0013_native_search_input3_title3_price3` | `NativeInteractionPart30_0013_native_search_input3_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0014_native_search_input4_title3_price3` | `NativeInteractionPart30_0014_native_search_input4_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0015_native_search_input5_title3_price3` | `NativeInteractionPart30_0015_native_search_input5_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart30_0016_native_search_input7_title3_price3` | `NativeInteractionPart30_0016_native_search_input7_title3_price3` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title3_price3` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart31

源码：[GoodsConstructionPart31.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart31.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart31_0001_constructor_id0_image5_title2_price0` | `GoodsConstructionPart31_0001_constructor_id0_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0002_constructor_id1_image5_title2_price0` | `GoodsConstructionPart31_0002_constructor_id1_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0003_constructor_id2_image5_title2_price0` | `GoodsConstructionPart31_0003_constructor_id2_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0004_constructor_id3_image5_title2_price0` | `GoodsConstructionPart31_0004_constructor_id3_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0005_constructor_id4_image5_title2_price0` | `GoodsConstructionPart31_0005_constructor_id4_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0006_constructor_id5_image5_title2_price0` | `GoodsConstructionPart31_0006_constructor_id5_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0007_constructor_id6_image5_title2_price0` | `GoodsConstructionPart31_0007_constructor_id6_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0008_constructor_id7_image5_title2_price0` | `GoodsConstructionPart31_0008_constructor_id7_image5_title2_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image5_title2_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0009_constructor_id0_image0_title3_price0` | `GoodsConstructionPart31_0009_constructor_id0_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0010_constructor_id1_image0_title3_price0` | `GoodsConstructionPart31_0010_constructor_id1_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0011_constructor_id2_image0_title3_price0` | `GoodsConstructionPart31_0011_constructor_id2_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0012_constructor_id3_image0_title3_price0` | `GoodsConstructionPart31_0012_constructor_id3_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0013_constructor_id4_image0_title3_price0` | `GoodsConstructionPart31_0013_constructor_id4_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0014_constructor_id5_image0_title3_price0` | `GoodsConstructionPart31_0014_constructor_id5_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0015_constructor_id6_image0_title3_price0` | `GoodsConstructionPart31_0015_constructor_id6_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0016_constructor_id7_image0_title3_price0` | `GoodsConstructionPart31_0016_constructor_id7_image0_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image0_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0017_constructor_id0_image1_title3_price0` | `GoodsConstructionPart31_0017_constructor_id0_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0018_constructor_id1_image1_title3_price0` | `GoodsConstructionPart31_0018_constructor_id1_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0019_constructor_id2_image1_title3_price0` | `GoodsConstructionPart31_0019_constructor_id2_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0020_constructor_id3_image1_title3_price0` | `GoodsConstructionPart31_0020_constructor_id3_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0021_constructor_id4_image1_title3_price0` | `GoodsConstructionPart31_0021_constructor_id4_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0022_constructor_id5_image1_title3_price0` | `GoodsConstructionPart31_0022_constructor_id5_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0023_constructor_id6_image1_title3_price0` | `GoodsConstructionPart31_0023_constructor_id6_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0024_constructor_id7_image1_title3_price0` | `GoodsConstructionPart31_0024_constructor_id7_image1_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image1_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0025_constructor_id0_image2_title3_price0` | `GoodsConstructionPart31_0025_constructor_id0_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart31_0026_constructor_id1_image2_title3_price0` | `GoodsConstructionPart31_0026_constructor_id1_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart32

源码：[GoodsMutationPart32.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart32.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart32_0001_mutate_price_source3_image3_title2_price0_mode7` | `GoodsMutationPart32_0001_mutate_price_source3_image3_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0002_mutate_id_source4_image4_title2_price0_mode0` | `GoodsMutationPart32_0002_mutate_id_source4_image4_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0003_mutate_imageRes_source4_image4_title2_price0_mode1` | `GoodsMutationPart32_0003_mutate_imageRes_source4_image4_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0004_mutate_title_source4_image4_title2_price0_mode2` | `GoodsMutationPart32_0004_mutate_title_source4_image4_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0005_mutate_price_source4_image4_title2_price0_mode3` | `GoodsMutationPart32_0005_mutate_price_source4_image4_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0006_mutate_id_source4_image4_title2_price0_mode4` | `GoodsMutationPart32_0006_mutate_id_source4_image4_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0007_mutate_imageRes_source4_image4_title2_price0_mode5` | `GoodsMutationPart32_0007_mutate_imageRes_source4_image4_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0008_mutate_title_source4_image4_title2_price0_mode6` | `GoodsMutationPart32_0008_mutate_title_source4_image4_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0009_mutate_price_source4_image4_title2_price0_mode7` | `GoodsMutationPart32_0009_mutate_price_source4_image4_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0010_mutate_id_source5_image5_title2_price0_mode0` | `GoodsMutationPart32_0010_mutate_id_source5_image5_title2_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title2_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0011_mutate_imageRes_source5_image5_title2_price0_mode1` | `GoodsMutationPart32_0011_mutate_imageRes_source5_image5_title2_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title2_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0012_mutate_title_source5_image5_title2_price0_mode2` | `GoodsMutationPart32_0012_mutate_title_source5_image5_title2_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title2_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0013_mutate_price_source5_image5_title2_price0_mode3` | `GoodsMutationPart32_0013_mutate_price_source5_image5_title2_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title2_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0014_mutate_id_source5_image5_title2_price0_mode4` | `GoodsMutationPart32_0014_mutate_id_source5_image5_title2_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title2_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0015_mutate_imageRes_source5_image5_title2_price0_mode5` | `GoodsMutationPart32_0015_mutate_imageRes_source5_image5_title2_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title2_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0016_mutate_title_source5_image5_title2_price0_mode6` | `GoodsMutationPart32_0016_mutate_title_source5_image5_title2_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title2_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0017_mutate_price_source5_image5_title2_price0_mode7` | `GoodsMutationPart32_0017_mutate_price_source5_image5_title2_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title2_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0018_mutate_id_source0_image0_title3_price0_mode0` | `GoodsMutationPart32_0018_mutate_id_source0_image0_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0019_mutate_imageRes_source0_image0_title3_price0_mode1` | `GoodsMutationPart32_0019_mutate_imageRes_source0_image0_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0020_mutate_title_source0_image0_title3_price0_mode2` | `GoodsMutationPart32_0020_mutate_title_source0_image0_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0021_mutate_price_source0_image0_title3_price0_mode3` | `GoodsMutationPart32_0021_mutate_price_source0_image0_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0022_mutate_id_source0_image0_title3_price0_mode4` | `GoodsMutationPart32_0022_mutate_id_source0_image0_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart32_0023_mutate_imageRes_source0_image0_title3_price0_mode5` | `GoodsMutationPart32_0023_mutate_imageRes_source0_image0_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart33

源码：[CatalogBindingPart33.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart33.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart33_0001_catalog_binding_5_peer2_third3` | `CatalogBindingPart33_0001_catalog_binding_5_peer2_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0002_catalog_binding_0_peer3_third3` | `CatalogBindingPart33_0002_catalog_binding_0_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0003_catalog_binding_1_peer3_third3` | `CatalogBindingPart33_0003_catalog_binding_1_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0004_catalog_binding_2_peer3_third3` | `CatalogBindingPart33_0004_catalog_binding_2_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0005_catalog_binding_3_peer3_third3` | `CatalogBindingPart33_0005_catalog_binding_3_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0006_catalog_binding_4_peer3_third3` | `CatalogBindingPart33_0006_catalog_binding_4_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0007_catalog_binding_5_peer3_third3` | `CatalogBindingPart33_0007_catalog_binding_5_peer3_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0008_catalog_binding_0_peer4_third3` | `CatalogBindingPart33_0008_catalog_binding_0_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0009_catalog_binding_1_peer4_third3` | `CatalogBindingPart33_0009_catalog_binding_1_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0010_catalog_binding_2_peer4_third3` | `CatalogBindingPart33_0010_catalog_binding_2_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0011_catalog_binding_3_peer4_third3` | `CatalogBindingPart33_0011_catalog_binding_3_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0012_catalog_binding_4_peer4_third3` | `CatalogBindingPart33_0012_catalog_binding_4_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0013_catalog_binding_5_peer4_third3` | `CatalogBindingPart33_0013_catalog_binding_5_peer4_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0014_catalog_binding_0_peer5_third3` | `CatalogBindingPart33_0014_catalog_binding_0_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0015_catalog_binding_1_peer5_third3` | `CatalogBindingPart33_0015_catalog_binding_1_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0016_catalog_binding_2_peer5_third3` | `CatalogBindingPart33_0016_catalog_binding_2_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0017_catalog_binding_3_peer5_third3` | `CatalogBindingPart33_0017_catalog_binding_3_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0018_catalog_binding_4_peer5_third3` | `CatalogBindingPart33_0018_catalog_binding_4_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0019_catalog_binding_5_peer5_third3` | `CatalogBindingPart33_0019_catalog_binding_5_peer5_third3` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third3` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0020_catalog_binding_0_peer0_third4` | `CatalogBindingPart33_0020_catalog_binding_0_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0021_catalog_binding_1_peer0_third4` | `CatalogBindingPart33_0021_catalog_binding_1_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0022_catalog_binding_2_peer0_third4` | `CatalogBindingPart33_0022_catalog_binding_2_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart33_0023_catalog_binding_3_peer0_third4` | `CatalogBindingPart33_0023_catalog_binding_3_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart34

源码：[ResourceResolutionPart34.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart34.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart34_0001_resources_title0_price5_image4` | `ResourceResolutionPart34_0001_resources_title0_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0002_resources_title1_price5_image4` | `ResourceResolutionPart34_0002_resources_title1_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0003_resources_title2_price5_image4` | `ResourceResolutionPart34_0003_resources_title2_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0004_resources_title3_price5_image4` | `ResourceResolutionPart34_0004_resources_title3_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0005_resources_title4_price5_image4` | `ResourceResolutionPart34_0005_resources_title4_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0006_resources_title5_price5_image4` | `ResourceResolutionPart34_0006_resources_title5_price5_image4` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image4` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0007_resources_title0_price0_image5` | `ResourceResolutionPart34_0007_resources_title0_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0008_resources_title1_price0_image5` | `ResourceResolutionPart34_0008_resources_title1_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0009_resources_title2_price0_image5` | `ResourceResolutionPart34_0009_resources_title2_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0010_resources_title3_price0_image5` | `ResourceResolutionPart34_0010_resources_title3_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0011_resources_title4_price0_image5` | `ResourceResolutionPart34_0011_resources_title4_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0012_resources_title5_price0_image5` | `ResourceResolutionPart34_0012_resources_title5_price0_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0013_resources_title0_price1_image5` | `ResourceResolutionPart34_0013_resources_title0_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0014_resources_title1_price1_image5` | `ResourceResolutionPart34_0014_resources_title1_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0015_resources_title2_price1_image5` | `ResourceResolutionPart34_0015_resources_title2_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0016_resources_title3_price1_image5` | `ResourceResolutionPart34_0016_resources_title3_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0017_resources_title4_price1_image5` | `ResourceResolutionPart34_0017_resources_title4_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0018_resources_title5_price1_image5` | `ResourceResolutionPart34_0018_resources_title5_price1_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0019_resources_title0_price2_image5` | `ResourceResolutionPart34_0019_resources_title0_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0020_resources_title1_price2_image5` | `ResourceResolutionPart34_0020_resources_title1_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0021_resources_title2_price2_image5` | `ResourceResolutionPart34_0021_resources_title2_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0022_resources_title3_price2_image5` | `ResourceResolutionPart34_0022_resources_title3_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0023_resources_title4_price2_image5` | `ResourceResolutionPart34_0023_resources_title4_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0024_resources_title5_price2_image5` | `ResourceResolutionPart34_0024_resources_title5_price2_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0025_resources_title0_price3_image5` | `ResourceResolutionPart34_0025_resources_title0_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart34_0026_resources_title1_price3_image5` | `ResourceResolutionPart34_0026_resources_title1_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart35

源码：[EmbedControllerPart35.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart35.test.ets)；用例数：34。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart35_0001_controller_width3_height2_embed4` | `EmbedControllerPart35_0001_controller_width3_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0002_controller_width4_height2_embed4` | `EmbedControllerPart35_0002_controller_width4_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0003_controller_width5_height2_embed4` | `EmbedControllerPart35_0003_controller_width5_height2_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0004_controller_width0_height3_embed4` | `EmbedControllerPart35_0004_controller_width0_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0005_controller_width1_height3_embed4` | `EmbedControllerPart35_0005_controller_width1_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0006_controller_width2_height3_embed4` | `EmbedControllerPart35_0006_controller_width2_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0007_controller_width3_height3_embed4` | `EmbedControllerPart35_0007_controller_width3_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0008_controller_width4_height3_embed4` | `EmbedControllerPart35_0008_controller_width4_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0009_controller_width5_height3_embed4` | `EmbedControllerPart35_0009_controller_width5_height3_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0010_controller_width0_height4_embed4` | `EmbedControllerPart35_0010_controller_width0_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0011_controller_width1_height4_embed4` | `EmbedControllerPart35_0011_controller_width1_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0012_controller_width2_height4_embed4` | `EmbedControllerPart35_0012_controller_width2_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0013_controller_width3_height4_embed4` | `EmbedControllerPart35_0013_controller_width3_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0014_controller_width4_height4_embed4` | `EmbedControllerPart35_0014_controller_width4_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0015_controller_width5_height4_embed4` | `EmbedControllerPart35_0015_controller_width5_height4_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0016_controller_width0_height5_embed4` | `EmbedControllerPart35_0016_controller_width0_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0017_controller_width1_height5_embed4` | `EmbedControllerPart35_0017_controller_width1_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0018_controller_width2_height5_embed4` | `EmbedControllerPart35_0018_controller_width2_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0019_controller_width3_height5_embed4` | `EmbedControllerPart35_0019_controller_width3_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0020_controller_width4_height5_embed4` | `EmbedControllerPart35_0020_controller_width4_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0021_controller_width5_height5_embed4` | `EmbedControllerPart35_0021_controller_width5_height5_embed4` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed4` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0022_controller_width0_height0_embed5` | `EmbedControllerPart35_0022_controller_width0_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0023_controller_width1_height0_embed5` | `EmbedControllerPart35_0023_controller_width1_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0024_controller_width2_height0_embed5` | `EmbedControllerPart35_0024_controller_width2_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0025_controller_width3_height0_embed5` | `EmbedControllerPart35_0025_controller_width3_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0026_controller_width4_height0_embed5` | `EmbedControllerPart35_0026_controller_width4_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0027_controller_width5_height0_embed5` | `EmbedControllerPart35_0027_controller_width5_height0_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0028_controller_width0_height1_embed5` | `EmbedControllerPart35_0028_controller_width0_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0029_controller_width1_height1_embed5` | `EmbedControllerPart35_0029_controller_width1_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0030_controller_width2_height1_embed5` | `EmbedControllerPart35_0030_controller_width2_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0031_controller_width3_height1_embed5` | `EmbedControllerPart35_0031_controller_width3_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0032_controller_width4_height1_embed5` | `EmbedControllerPart35_0032_controller_width4_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0033_controller_width5_height1_embed5` | `EmbedControllerPart35_0033_controller_width5_height1_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart35_0034_controller_width0_height2_embed5` | `EmbedControllerPart35_0034_controller_width0_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart36

源码：[NativeInteractionPart36.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart36.test.ets)；用例数：1。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart36_0001_background_foreground` | `NativeInteractionPart36_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |

### GoodsConstructionPart37

源码：[GoodsConstructionPart37.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart37.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart37_0001_constructor_id2_image2_title3_price0` | `GoodsConstructionPart37_0001_constructor_id2_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0002_constructor_id3_image2_title3_price0` | `GoodsConstructionPart37_0002_constructor_id3_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0003_constructor_id4_image2_title3_price0` | `GoodsConstructionPart37_0003_constructor_id4_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0004_constructor_id5_image2_title3_price0` | `GoodsConstructionPart37_0004_constructor_id5_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0005_constructor_id6_image2_title3_price0` | `GoodsConstructionPart37_0005_constructor_id6_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0006_constructor_id7_image2_title3_price0` | `GoodsConstructionPart37_0006_constructor_id7_image2_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image2_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0007_constructor_id0_image3_title3_price0` | `GoodsConstructionPart37_0007_constructor_id0_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0008_constructor_id1_image3_title3_price0` | `GoodsConstructionPart37_0008_constructor_id1_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0009_constructor_id2_image3_title3_price0` | `GoodsConstructionPart37_0009_constructor_id2_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0010_constructor_id3_image3_title3_price0` | `GoodsConstructionPart37_0010_constructor_id3_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0011_constructor_id4_image3_title3_price0` | `GoodsConstructionPart37_0011_constructor_id4_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0012_constructor_id5_image3_title3_price0` | `GoodsConstructionPart37_0012_constructor_id5_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0013_constructor_id6_image3_title3_price0` | `GoodsConstructionPart37_0013_constructor_id6_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0014_constructor_id7_image3_title3_price0` | `GoodsConstructionPart37_0014_constructor_id7_image3_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image3_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0015_constructor_id0_image4_title3_price0` | `GoodsConstructionPart37_0015_constructor_id0_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0016_constructor_id1_image4_title3_price0` | `GoodsConstructionPart37_0016_constructor_id1_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0017_constructor_id2_image4_title3_price0` | `GoodsConstructionPart37_0017_constructor_id2_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0018_constructor_id3_image4_title3_price0` | `GoodsConstructionPart37_0018_constructor_id3_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0019_constructor_id4_image4_title3_price0` | `GoodsConstructionPart37_0019_constructor_id4_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0020_constructor_id5_image4_title3_price0` | `GoodsConstructionPart37_0020_constructor_id5_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0021_constructor_id6_image4_title3_price0` | `GoodsConstructionPart37_0021_constructor_id6_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0022_constructor_id7_image4_title3_price0` | `GoodsConstructionPart37_0022_constructor_id7_image4_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image4_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0023_constructor_id0_image5_title3_price0` | `GoodsConstructionPart37_0023_constructor_id0_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0024_constructor_id1_image5_title3_price0` | `GoodsConstructionPart37_0024_constructor_id1_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0025_constructor_id2_image5_title3_price0` | `GoodsConstructionPart37_0025_constructor_id2_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart37_0026_constructor_id3_image5_title3_price0` | `GoodsConstructionPart37_0026_constructor_id3_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart38

源码：[GoodsMutationPart38.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart38.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart38_0001_mutate_title_source0_image0_title3_price0_mode6` | `GoodsMutationPart38_0001_mutate_title_source0_image0_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0002_mutate_price_source0_image0_title3_price0_mode7` | `GoodsMutationPart38_0002_mutate_price_source0_image0_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0003_mutate_id_source1_image1_title3_price0_mode0` | `GoodsMutationPart38_0003_mutate_id_source1_image1_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0004_mutate_imageRes_source1_image1_title3_price0_mode1` | `GoodsMutationPart38_0004_mutate_imageRes_source1_image1_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0005_mutate_title_source1_image1_title3_price0_mode2` | `GoodsMutationPart38_0005_mutate_title_source1_image1_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0006_mutate_price_source1_image1_title3_price0_mode3` | `GoodsMutationPart38_0006_mutate_price_source1_image1_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0007_mutate_id_source1_image1_title3_price0_mode4` | `GoodsMutationPart38_0007_mutate_id_source1_image1_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0008_mutate_imageRes_source1_image1_title3_price0_mode5` | `GoodsMutationPart38_0008_mutate_imageRes_source1_image1_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0009_mutate_title_source1_image1_title3_price0_mode6` | `GoodsMutationPart38_0009_mutate_title_source1_image1_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0010_mutate_price_source1_image1_title3_price0_mode7` | `GoodsMutationPart38_0010_mutate_price_source1_image1_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0011_mutate_id_source2_image2_title3_price0_mode0` | `GoodsMutationPart38_0011_mutate_id_source2_image2_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0012_mutate_imageRes_source2_image2_title3_price0_mode1` | `GoodsMutationPart38_0012_mutate_imageRes_source2_image2_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0013_mutate_title_source2_image2_title3_price0_mode2` | `GoodsMutationPart38_0013_mutate_title_source2_image2_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0014_mutate_price_source2_image2_title3_price0_mode3` | `GoodsMutationPart38_0014_mutate_price_source2_image2_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0015_mutate_id_source2_image2_title3_price0_mode4` | `GoodsMutationPart38_0015_mutate_id_source2_image2_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0016_mutate_imageRes_source2_image2_title3_price0_mode5` | `GoodsMutationPart38_0016_mutate_imageRes_source2_image2_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0017_mutate_title_source2_image2_title3_price0_mode6` | `GoodsMutationPart38_0017_mutate_title_source2_image2_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0018_mutate_price_source2_image2_title3_price0_mode7` | `GoodsMutationPart38_0018_mutate_price_source2_image2_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0019_mutate_id_source3_image3_title3_price0_mode0` | `GoodsMutationPart38_0019_mutate_id_source3_image3_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0020_mutate_imageRes_source3_image3_title3_price0_mode1` | `GoodsMutationPart38_0020_mutate_imageRes_source3_image3_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0021_mutate_title_source3_image3_title3_price0_mode2` | `GoodsMutationPart38_0021_mutate_title_source3_image3_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0022_mutate_price_source3_image3_title3_price0_mode3` | `GoodsMutationPart38_0022_mutate_price_source3_image3_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart38_0023_mutate_id_source3_image3_title3_price0_mode4` | `GoodsMutationPart38_0023_mutate_id_source3_image3_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart39

源码：[CatalogBindingPart39.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart39.test.ets)；用例数：25。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart39_0001_catalog_binding_3_peer0_third4` | `CatalogBindingPart39_0001_catalog_binding_3_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0002_catalog_binding_4_peer0_third4` | `CatalogBindingPart39_0002_catalog_binding_4_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0003_catalog_binding_5_peer0_third4` | `CatalogBindingPart39_0003_catalog_binding_5_peer0_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0004_catalog_binding_0_peer1_third4` | `CatalogBindingPart39_0004_catalog_binding_0_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0005_catalog_binding_1_peer1_third4` | `CatalogBindingPart39_0005_catalog_binding_1_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0006_catalog_binding_2_peer1_third4` | `CatalogBindingPart39_0006_catalog_binding_2_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0007_catalog_binding_3_peer1_third4` | `CatalogBindingPart39_0007_catalog_binding_3_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0008_catalog_binding_4_peer1_third4` | `CatalogBindingPart39_0008_catalog_binding_4_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0009_catalog_binding_5_peer1_third4` | `CatalogBindingPart39_0009_catalog_binding_5_peer1_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0010_catalog_binding_0_peer2_third4` | `CatalogBindingPart39_0010_catalog_binding_0_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0011_catalog_binding_1_peer2_third4` | `CatalogBindingPart39_0011_catalog_binding_1_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0012_catalog_binding_2_peer2_third4` | `CatalogBindingPart39_0012_catalog_binding_2_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0013_catalog_binding_3_peer2_third4` | `CatalogBindingPart39_0013_catalog_binding_3_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0014_catalog_binding_4_peer2_third4` | `CatalogBindingPart39_0014_catalog_binding_4_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0015_catalog_binding_5_peer2_third4` | `CatalogBindingPart39_0015_catalog_binding_5_peer2_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0016_catalog_binding_0_peer3_third4` | `CatalogBindingPart39_0016_catalog_binding_0_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0017_catalog_binding_1_peer3_third4` | `CatalogBindingPart39_0017_catalog_binding_1_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0018_catalog_binding_2_peer3_third4` | `CatalogBindingPart39_0018_catalog_binding_2_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0019_catalog_binding_3_peer3_third4` | `CatalogBindingPart39_0019_catalog_binding_3_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0020_catalog_binding_4_peer3_third4` | `CatalogBindingPart39_0020_catalog_binding_4_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0021_catalog_binding_5_peer3_third4` | `CatalogBindingPart39_0021_catalog_binding_5_peer3_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0022_catalog_binding_0_peer4_third4` | `CatalogBindingPart39_0022_catalog_binding_0_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0023_catalog_binding_1_peer4_third4` | `CatalogBindingPart39_0023_catalog_binding_1_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0024_catalog_binding_2_peer4_third4` | `CatalogBindingPart39_0024_catalog_binding_2_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart39_0025_catalog_binding_3_peer4_third4` | `CatalogBindingPart39_0025_catalog_binding_3_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart40

源码：[ResourceResolutionPart40.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart40.test.ets)；用例数：36。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart40_0001_resources_title1_price3_image5` | `ResourceResolutionPart40_0001_resources_title1_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0002_resources_title2_price3_image5` | `ResourceResolutionPart40_0002_resources_title2_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0003_resources_title3_price3_image5` | `ResourceResolutionPart40_0003_resources_title3_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0004_resources_title4_price3_image5` | `ResourceResolutionPart40_0004_resources_title4_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0005_resources_title5_price3_image5` | `ResourceResolutionPart40_0005_resources_title5_price3_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0006_resources_title0_price4_image5` | `ResourceResolutionPart40_0006_resources_title0_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0007_resources_title1_price4_image5` | `ResourceResolutionPart40_0007_resources_title1_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0008_resources_title2_price4_image5` | `ResourceResolutionPart40_0008_resources_title2_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0009_resources_title3_price4_image5` | `ResourceResolutionPart40_0009_resources_title3_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0010_resources_title4_price4_image5` | `ResourceResolutionPart40_0010_resources_title4_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0011_resources_title5_price4_image5` | `ResourceResolutionPart40_0011_resources_title5_price4_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0012_resources_title0_price5_image5` | `ResourceResolutionPart40_0012_resources_title0_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0013_resources_title1_price5_image5` | `ResourceResolutionPart40_0013_resources_title1_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0014_resources_title2_price5_image5` | `ResourceResolutionPart40_0014_resources_title2_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0015_resources_title3_price5_image5` | `ResourceResolutionPart40_0015_resources_title3_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0016_resources_title4_price5_image5` | `ResourceResolutionPart40_0016_resources_title4_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0017_resources_title5_price5_image5` | `ResourceResolutionPart40_0017_resources_title5_price5_image5` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image5` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0018_resources_title0_price0_image0` | `ResourceResolutionPart40_0018_resources_title0_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0019_resources_title1_price0_image0` | `ResourceResolutionPart40_0019_resources_title1_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0020_resources_title2_price0_image0` | `ResourceResolutionPart40_0020_resources_title2_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0021_resources_title3_price0_image0` | `ResourceResolutionPart40_0021_resources_title3_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0022_resources_title4_price0_image0` | `ResourceResolutionPart40_0022_resources_title4_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0023_resources_title5_price0_image0` | `ResourceResolutionPart40_0023_resources_title5_price0_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0024_resources_title0_price1_image0` | `ResourceResolutionPart40_0024_resources_title0_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0025_resources_title1_price1_image0` | `ResourceResolutionPart40_0025_resources_title1_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0026_resources_title2_price1_image0` | `ResourceResolutionPart40_0026_resources_title2_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0027_resources_title3_price1_image0` | `ResourceResolutionPart40_0027_resources_title3_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0028_resources_title4_price1_image0` | `ResourceResolutionPart40_0028_resources_title4_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0029_resources_title5_price1_image0` | `ResourceResolutionPart40_0029_resources_title5_price1_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0030_resources_title0_price2_image0` | `ResourceResolutionPart40_0030_resources_title0_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0031_resources_title1_price2_image0` | `ResourceResolutionPart40_0031_resources_title1_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0032_resources_title2_price2_image0` | `ResourceResolutionPart40_0032_resources_title2_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0033_resources_title3_price2_image0` | `ResourceResolutionPart40_0033_resources_title3_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0034_resources_title4_price2_image0` | `ResourceResolutionPart40_0034_resources_title4_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0035_resources_title5_price2_image0` | `ResourceResolutionPart40_0035_resources_title5_price2_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart40_0036_resources_title0_price3_image0` | `ResourceResolutionPart40_0036_resources_title0_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart41

源码：[EmbedControllerPart41.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart41.test.ets)；用例数：32。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart41_0001_controller_width0_height2_embed5` | `EmbedControllerPart41_0001_controller_width0_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0002_controller_width1_height2_embed5` | `EmbedControllerPart41_0002_controller_width1_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0003_controller_width2_height2_embed5` | `EmbedControllerPart41_0003_controller_width2_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0004_controller_width3_height2_embed5` | `EmbedControllerPart41_0004_controller_width3_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0005_controller_width4_height2_embed5` | `EmbedControllerPart41_0005_controller_width4_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0006_controller_width5_height2_embed5` | `EmbedControllerPart41_0006_controller_width5_height2_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0007_controller_width0_height3_embed5` | `EmbedControllerPart41_0007_controller_width0_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0008_controller_width1_height3_embed5` | `EmbedControllerPart41_0008_controller_width1_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0009_controller_width2_height3_embed5` | `EmbedControllerPart41_0009_controller_width2_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0010_controller_width3_height3_embed5` | `EmbedControllerPart41_0010_controller_width3_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0011_controller_width4_height3_embed5` | `EmbedControllerPart41_0011_controller_width4_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0012_controller_width5_height3_embed5` | `EmbedControllerPart41_0012_controller_width5_height3_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0013_controller_width0_height4_embed5` | `EmbedControllerPart41_0013_controller_width0_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0014_controller_width1_height4_embed5` | `EmbedControllerPart41_0014_controller_width1_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0015_controller_width2_height4_embed5` | `EmbedControllerPart41_0015_controller_width2_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0016_controller_width3_height4_embed5` | `EmbedControllerPart41_0016_controller_width3_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0017_controller_width4_height4_embed5` | `EmbedControllerPart41_0017_controller_width4_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0018_controller_width5_height4_embed5` | `EmbedControllerPart41_0018_controller_width5_height4_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0019_controller_width0_height5_embed5` | `EmbedControllerPart41_0019_controller_width0_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0020_controller_width1_height5_embed5` | `EmbedControllerPart41_0020_controller_width1_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0021_controller_width2_height5_embed5` | `EmbedControllerPart41_0021_controller_width2_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0022_controller_width3_height5_embed5` | `EmbedControllerPart41_0022_controller_width3_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0023_controller_width4_height5_embed5` | `EmbedControllerPart41_0023_controller_width4_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0024_controller_width5_height5_embed5` | `EmbedControllerPart41_0024_controller_width5_height5_embed5` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed5` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0025_controller_width0_height0_embed0` | `EmbedControllerPart41_0025_controller_width0_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0026_controller_width1_height0_embed0` | `EmbedControllerPart41_0026_controller_width1_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0027_controller_width2_height0_embed0` | `EmbedControllerPart41_0027_controller_width2_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0028_controller_width3_height0_embed0` | `EmbedControllerPart41_0028_controller_width3_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0029_controller_width4_height0_embed0` | `EmbedControllerPart41_0029_controller_width4_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0030_controller_width5_height0_embed0` | `EmbedControllerPart41_0030_controller_width5_height0_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0031_controller_width0_height1_embed0` | `EmbedControllerPart41_0031_controller_width0_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart41_0032_controller_width1_height1_embed0` | `EmbedControllerPart41_0032_controller_width1_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart42

源码：[NativeInteractionPart42.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart42.test.ets)；用例数：1。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart42_0001_background_foreground` | `NativeInteractionPart42_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |

### GoodsConstructionPart43

源码：[GoodsConstructionPart43.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart43.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart43_0001_constructor_id4_image5_title3_price0` | `GoodsConstructionPart43_0001_constructor_id4_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0002_constructor_id5_image5_title3_price0` | `GoodsConstructionPart43_0002_constructor_id5_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0003_constructor_id6_image5_title3_price0` | `GoodsConstructionPart43_0003_constructor_id6_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0004_constructor_id7_image5_title3_price0` | `GoodsConstructionPart43_0004_constructor_id7_image5_title3_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image5_title3_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0005_constructor_id0_image0_title4_price0` | `GoodsConstructionPart43_0005_constructor_id0_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0006_constructor_id1_image0_title4_price0` | `GoodsConstructionPart43_0006_constructor_id1_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0007_constructor_id2_image0_title4_price0` | `GoodsConstructionPart43_0007_constructor_id2_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0008_constructor_id3_image0_title4_price0` | `GoodsConstructionPart43_0008_constructor_id3_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0009_constructor_id4_image0_title4_price0` | `GoodsConstructionPart43_0009_constructor_id4_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0010_constructor_id5_image0_title4_price0` | `GoodsConstructionPart43_0010_constructor_id5_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0011_constructor_id6_image0_title4_price0` | `GoodsConstructionPart43_0011_constructor_id6_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0012_constructor_id7_image0_title4_price0` | `GoodsConstructionPart43_0012_constructor_id7_image0_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image0_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0013_constructor_id0_image1_title4_price0` | `GoodsConstructionPart43_0013_constructor_id0_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0014_constructor_id1_image1_title4_price0` | `GoodsConstructionPart43_0014_constructor_id1_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0015_constructor_id2_image1_title4_price0` | `GoodsConstructionPart43_0015_constructor_id2_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0016_constructor_id3_image1_title4_price0` | `GoodsConstructionPart43_0016_constructor_id3_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0017_constructor_id4_image1_title4_price0` | `GoodsConstructionPart43_0017_constructor_id4_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0018_constructor_id5_image1_title4_price0` | `GoodsConstructionPart43_0018_constructor_id5_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0019_constructor_id6_image1_title4_price0` | `GoodsConstructionPart43_0019_constructor_id6_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0020_constructor_id7_image1_title4_price0` | `GoodsConstructionPart43_0020_constructor_id7_image1_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image1_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0021_constructor_id0_image2_title4_price0` | `GoodsConstructionPart43_0021_constructor_id0_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0022_constructor_id1_image2_title4_price0` | `GoodsConstructionPart43_0022_constructor_id1_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0023_constructor_id2_image2_title4_price0` | `GoodsConstructionPart43_0023_constructor_id2_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0024_constructor_id3_image2_title4_price0` | `GoodsConstructionPart43_0024_constructor_id3_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0025_constructor_id4_image2_title4_price0` | `GoodsConstructionPart43_0025_constructor_id4_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart43_0026_constructor_id5_image2_title4_price0` | `GoodsConstructionPart43_0026_constructor_id5_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart44

源码：[GoodsMutationPart44.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart44.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart44_0001_mutate_imageRes_source3_image3_title3_price0_mode5` | `GoodsMutationPart44_0001_mutate_imageRes_source3_image3_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0002_mutate_title_source3_image3_title3_price0_mode6` | `GoodsMutationPart44_0002_mutate_title_source3_image3_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0003_mutate_price_source3_image3_title3_price0_mode7` | `GoodsMutationPart44_0003_mutate_price_source3_image3_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0004_mutate_id_source4_image4_title3_price0_mode0` | `GoodsMutationPart44_0004_mutate_id_source4_image4_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0005_mutate_imageRes_source4_image4_title3_price0_mode1` | `GoodsMutationPart44_0005_mutate_imageRes_source4_image4_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0006_mutate_title_source4_image4_title3_price0_mode2` | `GoodsMutationPart44_0006_mutate_title_source4_image4_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0007_mutate_price_source4_image4_title3_price0_mode3` | `GoodsMutationPart44_0007_mutate_price_source4_image4_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0008_mutate_id_source4_image4_title3_price0_mode4` | `GoodsMutationPart44_0008_mutate_id_source4_image4_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source4_image4_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0009_mutate_imageRes_source4_image4_title3_price0_mode5` | `GoodsMutationPart44_0009_mutate_imageRes_source4_image4_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source4_image4_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0010_mutate_title_source4_image4_title3_price0_mode6` | `GoodsMutationPart44_0010_mutate_title_source4_image4_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source4_image4_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0011_mutate_price_source4_image4_title3_price0_mode7` | `GoodsMutationPart44_0011_mutate_price_source4_image4_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source4_image4_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0012_mutate_id_source5_image5_title3_price0_mode0` | `GoodsMutationPart44_0012_mutate_id_source5_image5_title3_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title3_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0013_mutate_imageRes_source5_image5_title3_price0_mode1` | `GoodsMutationPart44_0013_mutate_imageRes_source5_image5_title3_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title3_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0014_mutate_title_source5_image5_title3_price0_mode2` | `GoodsMutationPart44_0014_mutate_title_source5_image5_title3_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title3_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0015_mutate_price_source5_image5_title3_price0_mode3` | `GoodsMutationPart44_0015_mutate_price_source5_image5_title3_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title3_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0016_mutate_id_source5_image5_title3_price0_mode4` | `GoodsMutationPart44_0016_mutate_id_source5_image5_title3_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source5_image5_title3_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0017_mutate_imageRes_source5_image5_title3_price0_mode5` | `GoodsMutationPart44_0017_mutate_imageRes_source5_image5_title3_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source5_image5_title3_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0018_mutate_title_source5_image5_title3_price0_mode6` | `GoodsMutationPart44_0018_mutate_title_source5_image5_title3_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source5_image5_title3_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0019_mutate_price_source5_image5_title3_price0_mode7` | `GoodsMutationPart44_0019_mutate_price_source5_image5_title3_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source5_image5_title3_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0020_mutate_id_source0_image0_title4_price0_mode0` | `GoodsMutationPart44_0020_mutate_id_source0_image0_title4_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title4_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0021_mutate_imageRes_source0_image0_title4_price0_mode1` | `GoodsMutationPart44_0021_mutate_imageRes_source0_image0_title4_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title4_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0022_mutate_title_source0_image0_title4_price0_mode2` | `GoodsMutationPart44_0022_mutate_title_source0_image0_title4_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title4_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart44_0023_mutate_price_source0_image0_title4_price0_mode3` | `GoodsMutationPart44_0023_mutate_price_source0_image0_title4_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title4_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart45

源码：[CatalogBindingPart45.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart45.test.ets)；用例数：23。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart45_0001_catalog_binding_3_peer4_third4` | `CatalogBindingPart45_0001_catalog_binding_3_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0002_catalog_binding_4_peer4_third4` | `CatalogBindingPart45_0002_catalog_binding_4_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0003_catalog_binding_5_peer4_third4` | `CatalogBindingPart45_0003_catalog_binding_5_peer4_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0004_catalog_binding_0_peer5_third4` | `CatalogBindingPart45_0004_catalog_binding_0_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0005_catalog_binding_1_peer5_third4` | `CatalogBindingPart45_0005_catalog_binding_1_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0006_catalog_binding_2_peer5_third4` | `CatalogBindingPart45_0006_catalog_binding_2_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0007_catalog_binding_3_peer5_third4` | `CatalogBindingPart45_0007_catalog_binding_3_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0008_catalog_binding_4_peer5_third4` | `CatalogBindingPart45_0008_catalog_binding_4_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0009_catalog_binding_5_peer5_third4` | `CatalogBindingPart45_0009_catalog_binding_5_peer5_third4` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third4` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0010_catalog_binding_0_peer0_third5` | `CatalogBindingPart45_0010_catalog_binding_0_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0011_catalog_binding_1_peer0_third5` | `CatalogBindingPart45_0011_catalog_binding_1_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0012_catalog_binding_2_peer0_third5` | `CatalogBindingPart45_0012_catalog_binding_2_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0013_catalog_binding_3_peer0_third5` | `CatalogBindingPart45_0013_catalog_binding_3_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0014_catalog_binding_4_peer0_third5` | `CatalogBindingPart45_0014_catalog_binding_4_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0015_catalog_binding_5_peer0_third5` | `CatalogBindingPart45_0015_catalog_binding_5_peer0_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0016_catalog_binding_0_peer1_third5` | `CatalogBindingPart45_0016_catalog_binding_0_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0017_catalog_binding_1_peer1_third5` | `CatalogBindingPart45_0017_catalog_binding_1_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0018_catalog_binding_2_peer1_third5` | `CatalogBindingPart45_0018_catalog_binding_2_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0019_catalog_binding_3_peer1_third5` | `CatalogBindingPart45_0019_catalog_binding_3_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0020_catalog_binding_4_peer1_third5` | `CatalogBindingPart45_0020_catalog_binding_4_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0021_catalog_binding_5_peer1_third5` | `CatalogBindingPart45_0021_catalog_binding_5_peer1_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0022_catalog_binding_0_peer2_third5` | `CatalogBindingPart45_0022_catalog_binding_0_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart45_0023_catalog_binding_1_peer2_third5` | `CatalogBindingPart45_0023_catalog_binding_1_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart46

源码：[ResourceResolutionPart46.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart46.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart46_0001_resources_title0_price3_image0` | `ResourceResolutionPart46_0001_resources_title0_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0002_resources_title1_price3_image0` | `ResourceResolutionPart46_0002_resources_title1_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0003_resources_title2_price3_image0` | `ResourceResolutionPart46_0003_resources_title2_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0004_resources_title3_price3_image0` | `ResourceResolutionPart46_0004_resources_title3_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0005_resources_title4_price3_image0` | `ResourceResolutionPart46_0005_resources_title4_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0006_resources_title5_price3_image0` | `ResourceResolutionPart46_0006_resources_title5_price3_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0007_resources_title0_price4_image0` | `ResourceResolutionPart46_0007_resources_title0_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0008_resources_title1_price4_image0` | `ResourceResolutionPart46_0008_resources_title1_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0009_resources_title2_price4_image0` | `ResourceResolutionPart46_0009_resources_title2_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0010_resources_title3_price4_image0` | `ResourceResolutionPart46_0010_resources_title3_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0011_resources_title4_price4_image0` | `ResourceResolutionPart46_0011_resources_title4_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0012_resources_title5_price4_image0` | `ResourceResolutionPart46_0012_resources_title5_price4_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0013_resources_title0_price5_image0` | `ResourceResolutionPart46_0013_resources_title0_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0014_resources_title1_price5_image0` | `ResourceResolutionPart46_0014_resources_title1_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0015_resources_title2_price5_image0` | `ResourceResolutionPart46_0015_resources_title2_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0016_resources_title3_price5_image0` | `ResourceResolutionPart46_0016_resources_title3_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0017_resources_title4_price5_image0` | `ResourceResolutionPart46_0017_resources_title4_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0018_resources_title5_price5_image0` | `ResourceResolutionPart46_0018_resources_title5_price5_image0` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image0` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0019_resources_title0_price0_image1` | `ResourceResolutionPart46_0019_resources_title0_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0020_resources_title1_price0_image1` | `ResourceResolutionPart46_0020_resources_title1_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0021_resources_title2_price0_image1` | `ResourceResolutionPart46_0021_resources_title2_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0022_resources_title3_price0_image1` | `ResourceResolutionPart46_0022_resources_title3_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0023_resources_title4_price0_image1` | `ResourceResolutionPart46_0023_resources_title4_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0024_resources_title5_price0_image1` | `ResourceResolutionPart46_0024_resources_title5_price0_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0025_resources_title0_price1_image1` | `ResourceResolutionPart46_0025_resources_title0_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart46_0026_resources_title1_price1_image1` | `ResourceResolutionPart46_0026_resources_title1_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart47

源码：[EmbedControllerPart47.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart47.test.ets)；用例数：24。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart47_0001_controller_width1_height1_embed0` | `EmbedControllerPart47_0001_controller_width1_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0002_controller_width2_height1_embed0` | `EmbedControllerPart47_0002_controller_width2_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0003_controller_width3_height1_embed0` | `EmbedControllerPart47_0003_controller_width3_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0004_controller_width4_height1_embed0` | `EmbedControllerPart47_0004_controller_width4_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0005_controller_width5_height1_embed0` | `EmbedControllerPart47_0005_controller_width5_height1_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0006_controller_width0_height2_embed0` | `EmbedControllerPart47_0006_controller_width0_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0007_controller_width1_height2_embed0` | `EmbedControllerPart47_0007_controller_width1_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0008_controller_width2_height2_embed0` | `EmbedControllerPart47_0008_controller_width2_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0009_controller_width3_height2_embed0` | `EmbedControllerPart47_0009_controller_width3_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0010_controller_width4_height2_embed0` | `EmbedControllerPart47_0010_controller_width4_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0011_controller_width5_height2_embed0` | `EmbedControllerPart47_0011_controller_width5_height2_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0012_controller_width0_height3_embed0` | `EmbedControllerPart47_0012_controller_width0_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0013_controller_width1_height3_embed0` | `EmbedControllerPart47_0013_controller_width1_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0014_controller_width2_height3_embed0` | `EmbedControllerPart47_0014_controller_width2_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0015_controller_width3_height3_embed0` | `EmbedControllerPart47_0015_controller_width3_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0016_controller_width4_height3_embed0` | `EmbedControllerPart47_0016_controller_width4_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0017_controller_width5_height3_embed0` | `EmbedControllerPart47_0017_controller_width5_height3_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0018_controller_width0_height4_embed0` | `EmbedControllerPart47_0018_controller_width0_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0019_controller_width1_height4_embed0` | `EmbedControllerPart47_0019_controller_width1_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0020_controller_width2_height4_embed0` | `EmbedControllerPart47_0020_controller_width2_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0021_controller_width3_height4_embed0` | `EmbedControllerPart47_0021_controller_width3_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0022_controller_width4_height4_embed0` | `EmbedControllerPart47_0022_controller_width4_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0023_controller_width5_height4_embed0` | `EmbedControllerPart47_0023_controller_width5_height4_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart47_0024_controller_width0_height5_embed0` | `EmbedControllerPart47_0024_controller_width0_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart48

源码：[NativeInteractionPart48.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart48.test.ets)；用例数：1。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart48_0001_background_foreground` | `NativeInteractionPart48_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |

### GoodsConstructionPart49

源码：[GoodsConstructionPart49.test.ets](entry/src/ohosTest/ets/test/GoodsConstruction/GoodsConstructionPart49.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsConstructionPart49_0001_constructor_id6_image2_title4_price0` | `GoodsConstructionPart49_0001_constructor_id6_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0002_constructor_id7_image2_title4_price0` | `GoodsConstructionPart49_0002_constructor_id7_image2_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image2_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0003_constructor_id0_image3_title4_price0` | `GoodsConstructionPart49_0003_constructor_id0_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0004_constructor_id1_image3_title4_price0` | `GoodsConstructionPart49_0004_constructor_id1_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0005_constructor_id2_image3_title4_price0` | `GoodsConstructionPart49_0005_constructor_id2_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0006_constructor_id3_image3_title4_price0` | `GoodsConstructionPart49_0006_constructor_id3_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0007_constructor_id4_image3_title4_price0` | `GoodsConstructionPart49_0007_constructor_id4_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0008_constructor_id5_image3_title4_price0` | `GoodsConstructionPart49_0008_constructor_id5_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0009_constructor_id6_image3_title4_price0` | `GoodsConstructionPart49_0009_constructor_id6_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0010_constructor_id7_image3_title4_price0` | `GoodsConstructionPart49_0010_constructor_id7_image3_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image3_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0011_constructor_id0_image4_title4_price0` | `GoodsConstructionPart49_0011_constructor_id0_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0012_constructor_id1_image4_title4_price0` | `GoodsConstructionPart49_0012_constructor_id1_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0013_constructor_id2_image4_title4_price0` | `GoodsConstructionPart49_0013_constructor_id2_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0014_constructor_id3_image4_title4_price0` | `GoodsConstructionPart49_0014_constructor_id3_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0015_constructor_id4_image4_title4_price0` | `GoodsConstructionPart49_0015_constructor_id4_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0016_constructor_id5_image4_title4_price0` | `GoodsConstructionPart49_0016_constructor_id5_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0017_constructor_id6_image4_title4_price0` | `GoodsConstructionPart49_0017_constructor_id6_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0018_constructor_id7_image4_title4_price0` | `GoodsConstructionPart49_0018_constructor_id7_image4_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image4_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0019_constructor_id0_image5_title4_price0` | `GoodsConstructionPart49_0019_constructor_id0_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id0_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0020_constructor_id1_image5_title4_price0` | `GoodsConstructionPart49_0020_constructor_id1_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id1_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0021_constructor_id2_image5_title4_price0` | `GoodsConstructionPart49_0021_constructor_id2_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id2_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0022_constructor_id3_image5_title4_price0` | `GoodsConstructionPart49_0022_constructor_id3_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id3_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0023_constructor_id4_image5_title4_price0` | `GoodsConstructionPart49_0023_constructor_id4_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id4_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0024_constructor_id5_image5_title4_price0` | `GoodsConstructionPart49_0024_constructor_id5_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id5_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0025_constructor_id6_image5_title4_price0` | `GoodsConstructionPart49_0025_constructor_id6_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id6_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |
| `GoodsConstructionPart49_0026_constructor_id7_image5_title4_price0` | `GoodsConstructionPart49_0026_constructor_id7_image5_title4_price0` | 商品模型构造 | 测试模块已加载，被测模块及资源可访问 | `constructor_id7_image5_title4_price0` | 构造商品对象，逐项核对 ID、图片、标题及价格与输入一致。 | Pass |

### GoodsMutationPart50

源码：[GoodsMutationPart50.test.ets](entry/src/ohosTest/ets/test/GoodsMutation/GoodsMutationPart50.test.ets)；用例数：26。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `GoodsMutationPart50_0001_mutate_id_source0_image0_title4_price0_mode4` | `GoodsMutationPart50_0001_mutate_id_source0_image0_title4_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source0_image0_title4_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0002_mutate_imageRes_source0_image0_title4_price0_mode5` | `GoodsMutationPart50_0002_mutate_imageRes_source0_image0_title4_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source0_image0_title4_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0003_mutate_title_source0_image0_title4_price0_mode6` | `GoodsMutationPart50_0003_mutate_title_source0_image0_title4_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source0_image0_title4_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0004_mutate_price_source0_image0_title4_price0_mode7` | `GoodsMutationPart50_0004_mutate_price_source0_image0_title4_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source0_image0_title4_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0005_mutate_id_source1_image1_title4_price0_mode0` | `GoodsMutationPart50_0005_mutate_id_source1_image1_title4_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title4_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0006_mutate_imageRes_source1_image1_title4_price0_mode1` | `GoodsMutationPart50_0006_mutate_imageRes_source1_image1_title4_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title4_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0007_mutate_title_source1_image1_title4_price0_mode2` | `GoodsMutationPart50_0007_mutate_title_source1_image1_title4_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title4_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0008_mutate_price_source1_image1_title4_price0_mode3` | `GoodsMutationPart50_0008_mutate_price_source1_image1_title4_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title4_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0009_mutate_id_source1_image1_title4_price0_mode4` | `GoodsMutationPart50_0009_mutate_id_source1_image1_title4_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source1_image1_title4_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0010_mutate_imageRes_source1_image1_title4_price0_mode5` | `GoodsMutationPart50_0010_mutate_imageRes_source1_image1_title4_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source1_image1_title4_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0011_mutate_title_source1_image1_title4_price0_mode6` | `GoodsMutationPart50_0011_mutate_title_source1_image1_title4_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source1_image1_title4_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0012_mutate_price_source1_image1_title4_price0_mode7` | `GoodsMutationPart50_0012_mutate_price_source1_image1_title4_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source1_image1_title4_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0013_mutate_id_source2_image2_title4_price0_mode0` | `GoodsMutationPart50_0013_mutate_id_source2_image2_title4_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title4_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0014_mutate_imageRes_source2_image2_title4_price0_mode1` | `GoodsMutationPart50_0014_mutate_imageRes_source2_image2_title4_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title4_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0015_mutate_title_source2_image2_title4_price0_mode2` | `GoodsMutationPart50_0015_mutate_title_source2_image2_title4_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title4_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0016_mutate_price_source2_image2_title4_price0_mode3` | `GoodsMutationPart50_0016_mutate_price_source2_image2_title4_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title4_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0017_mutate_id_source2_image2_title4_price0_mode4` | `GoodsMutationPart50_0017_mutate_id_source2_image2_title4_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source2_image2_title4_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0018_mutate_imageRes_source2_image2_title4_price0_mode5` | `GoodsMutationPart50_0018_mutate_imageRes_source2_image2_title4_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source2_image2_title4_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0019_mutate_title_source2_image2_title4_price0_mode6` | `GoodsMutationPart50_0019_mutate_title_source2_image2_title4_price0_mode6` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source2_image2_title4_price0_mode6` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0020_mutate_price_source2_image2_title4_price0_mode7` | `GoodsMutationPart50_0020_mutate_price_source2_image2_title4_price0_mode7` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source2_image2_title4_price0_mode7` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0021_mutate_id_source3_image3_title4_price0_mode0` | `GoodsMutationPart50_0021_mutate_id_source3_image3_title4_price0_mode0` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title4_price0_mode0` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0022_mutate_imageRes_source3_image3_title4_price0_mode1` | `GoodsMutationPart50_0022_mutate_imageRes_source3_image3_title4_price0_mode1` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title4_price0_mode1` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0023_mutate_title_source3_image3_title4_price0_mode2` | `GoodsMutationPart50_0023_mutate_title_source3_image3_title4_price0_mode2` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_title_source3_image3_title4_price0_mode2` | 修改商品 title，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0024_mutate_price_source3_image3_title4_price0_mode3` | `GoodsMutationPart50_0024_mutate_price_source3_image3_title4_price0_mode3` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_price_source3_image3_title4_price0_mode3` | 修改商品 price，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0025_mutate_id_source3_image3_title4_price0_mode4` | `GoodsMutationPart50_0025_mutate_id_source3_image3_title4_price0_mode4` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_id_source3_image3_title4_price0_mode4` | 修改商品 id，核对修改值、其余字段及原始目录数据。 | Pass |
| `GoodsMutationPart50_0026_mutate_imageRes_source3_image3_title4_price0_mode5` | `GoodsMutationPart50_0026_mutate_imageRes_source3_image3_title4_price0_mode5` | 商品字段修改 | 测试模块已加载，被测模块及资源可访问 | `mutate_imageRes_source3_image3_title4_price0_mode5` | 修改商品 imageRes，核对修改值、其余字段及原始目录数据。 | Pass |

### CatalogBindingPart51

源码：[CatalogBindingPart51.test.ets](entry/src/ohosTest/ets/test/CatalogBinding/CatalogBindingPart51.test.ets)；用例数：36。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `CatalogBindingPart51_0001_catalog_binding_1_peer2_third5` | `CatalogBindingPart51_0001_catalog_binding_1_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0002_catalog_binding_2_peer2_third5` | `CatalogBindingPart51_0002_catalog_binding_2_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0003_catalog_binding_3_peer2_third5` | `CatalogBindingPart51_0003_catalog_binding_3_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0004_catalog_binding_4_peer2_third5` | `CatalogBindingPart51_0004_catalog_binding_4_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0005_catalog_binding_5_peer2_third5` | `CatalogBindingPart51_0005_catalog_binding_5_peer2_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer2_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0006_catalog_binding_0_peer3_third5` | `CatalogBindingPart51_0006_catalog_binding_0_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0007_catalog_binding_1_peer3_third5` | `CatalogBindingPart51_0007_catalog_binding_1_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0008_catalog_binding_2_peer3_third5` | `CatalogBindingPart51_0008_catalog_binding_2_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0009_catalog_binding_3_peer3_third5` | `CatalogBindingPart51_0009_catalog_binding_3_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0010_catalog_binding_4_peer3_third5` | `CatalogBindingPart51_0010_catalog_binding_4_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0011_catalog_binding_5_peer3_third5` | `CatalogBindingPart51_0011_catalog_binding_5_peer3_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer3_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0012_catalog_binding_0_peer4_third5` | `CatalogBindingPart51_0012_catalog_binding_0_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0013_catalog_binding_1_peer4_third5` | `CatalogBindingPart51_0013_catalog_binding_1_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0014_catalog_binding_2_peer4_third5` | `CatalogBindingPart51_0014_catalog_binding_2_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0015_catalog_binding_3_peer4_third5` | `CatalogBindingPart51_0015_catalog_binding_3_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0016_catalog_binding_4_peer4_third5` | `CatalogBindingPart51_0016_catalog_binding_4_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0017_catalog_binding_5_peer4_third5` | `CatalogBindingPart51_0017_catalog_binding_5_peer4_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer4_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0018_catalog_binding_0_peer5_third5` | `CatalogBindingPart51_0018_catalog_binding_0_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0019_catalog_binding_1_peer5_third5` | `CatalogBindingPart51_0019_catalog_binding_1_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0020_catalog_binding_2_peer5_third5` | `CatalogBindingPart51_0020_catalog_binding_2_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0021_catalog_binding_3_peer5_third5` | `CatalogBindingPart51_0021_catalog_binding_3_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0022_catalog_binding_4_peer5_third5` | `CatalogBindingPart51_0022_catalog_binding_4_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0023_catalog_binding_5_peer5_third5` | `CatalogBindingPart51_0023_catalog_binding_5_peer5_third5` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer5_third5` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0024_catalog_binding_0_peer0_third0` | `CatalogBindingPart51_0024_catalog_binding_0_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0025_catalog_binding_1_peer0_third0` | `CatalogBindingPart51_0025_catalog_binding_1_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0026_catalog_binding_2_peer0_third0` | `CatalogBindingPart51_0026_catalog_binding_2_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0027_catalog_binding_3_peer0_third0` | `CatalogBindingPart51_0027_catalog_binding_3_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0028_catalog_binding_4_peer0_third0` | `CatalogBindingPart51_0028_catalog_binding_4_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0029_catalog_binding_5_peer0_third0` | `CatalogBindingPart51_0029_catalog_binding_5_peer0_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer0_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0030_catalog_binding_0_peer1_third0` | `CatalogBindingPart51_0030_catalog_binding_0_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0031_catalog_binding_1_peer1_third0` | `CatalogBindingPart51_0031_catalog_binding_1_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_1_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0032_catalog_binding_2_peer1_third0` | `CatalogBindingPart51_0032_catalog_binding_2_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_2_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0033_catalog_binding_3_peer1_third0` | `CatalogBindingPart51_0033_catalog_binding_3_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_3_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0034_catalog_binding_4_peer1_third0` | `CatalogBindingPart51_0034_catalog_binding_4_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_4_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0035_catalog_binding_5_peer1_third0` | `CatalogBindingPart51_0035_catalog_binding_5_peer1_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_5_peer1_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |
| `CatalogBindingPart51_0036_catalog_binding_0_peer2_third0` | `CatalogBindingPart51_0036_catalog_binding_0_peer2_third0` | 商品目录绑定 | 测试模块已加载，被测模块及资源可访问 | `catalog_binding_0_peer2_third0` | 读取商品目录，核对六项数量、资源描述内容、商品 ID 和实例关系。 | Pass |

### ResourceResolutionPart52

源码：[ResourceResolutionPart52.test.ets](entry/src/ohosTest/ets/test/ResourceResolution/ResourceResolutionPart52.test.ets)；用例数：39。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `ResourceResolutionPart52_0001_resources_title1_price1_image1` | `ResourceResolutionPart52_0001_resources_title1_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0002_resources_title2_price1_image1` | `ResourceResolutionPart52_0002_resources_title2_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0003_resources_title3_price1_image1` | `ResourceResolutionPart52_0003_resources_title3_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0004_resources_title4_price1_image1` | `ResourceResolutionPart52_0004_resources_title4_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0005_resources_title5_price1_image1` | `ResourceResolutionPart52_0005_resources_title5_price1_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price1_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0006_resources_title0_price2_image1` | `ResourceResolutionPart52_0006_resources_title0_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0007_resources_title1_price2_image1` | `ResourceResolutionPart52_0007_resources_title1_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0008_resources_title2_price2_image1` | `ResourceResolutionPart52_0008_resources_title2_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0009_resources_title3_price2_image1` | `ResourceResolutionPart52_0009_resources_title3_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0010_resources_title4_price2_image1` | `ResourceResolutionPart52_0010_resources_title4_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0011_resources_title5_price2_image1` | `ResourceResolutionPart52_0011_resources_title5_price2_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price2_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0012_resources_title0_price3_image1` | `ResourceResolutionPart52_0012_resources_title0_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0013_resources_title1_price3_image1` | `ResourceResolutionPart52_0013_resources_title1_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0014_resources_title2_price3_image1` | `ResourceResolutionPart52_0014_resources_title2_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0015_resources_title3_price3_image1` | `ResourceResolutionPart52_0015_resources_title3_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0016_resources_title4_price3_image1` | `ResourceResolutionPart52_0016_resources_title4_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0017_resources_title5_price3_image1` | `ResourceResolutionPart52_0017_resources_title5_price3_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price3_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0018_resources_title0_price4_image1` | `ResourceResolutionPart52_0018_resources_title0_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0019_resources_title1_price4_image1` | `ResourceResolutionPart52_0019_resources_title1_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0020_resources_title2_price4_image1` | `ResourceResolutionPart52_0020_resources_title2_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0021_resources_title3_price4_image1` | `ResourceResolutionPart52_0021_resources_title3_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0022_resources_title4_price4_image1` | `ResourceResolutionPart52_0022_resources_title4_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0023_resources_title5_price4_image1` | `ResourceResolutionPart52_0023_resources_title5_price4_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price4_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0024_resources_title0_price5_image1` | `ResourceResolutionPart52_0024_resources_title0_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0025_resources_title1_price5_image1` | `ResourceResolutionPart52_0025_resources_title1_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0026_resources_title2_price5_image1` | `ResourceResolutionPart52_0026_resources_title2_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0027_resources_title3_price5_image1` | `ResourceResolutionPart52_0027_resources_title3_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0028_resources_title4_price5_image1` | `ResourceResolutionPart52_0028_resources_title4_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0029_resources_title5_price5_image1` | `ResourceResolutionPart52_0029_resources_title5_price5_image1` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price5_image1` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0030_resources_title0_price0_image2` | `ResourceResolutionPart52_0030_resources_title0_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0031_resources_title1_price0_image2` | `ResourceResolutionPart52_0031_resources_title1_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0032_resources_title2_price0_image2` | `ResourceResolutionPart52_0032_resources_title2_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0033_resources_title3_price0_image2` | `ResourceResolutionPart52_0033_resources_title3_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0034_resources_title4_price0_image2` | `ResourceResolutionPart52_0034_resources_title4_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title4_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0035_resources_title5_price0_image2` | `ResourceResolutionPart52_0035_resources_title5_price0_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title5_price0_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0036_resources_title0_price1_image2` | `ResourceResolutionPart52_0036_resources_title0_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title0_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0037_resources_title1_price1_image2` | `ResourceResolutionPart52_0037_resources_title1_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title1_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0038_resources_title2_price1_image2` | `ResourceResolutionPart52_0038_resources_title2_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title2_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |
| `ResourceResolutionPart52_0039_resources_title3_price1_image2` | `ResourceResolutionPart52_0039_resources_title3_price1_image2` | 本地资源解析 | 测试模块已加载，被测模块及资源可访问 | `resources_title3_price1_image2` | 通过资源管理器读取标题、价格、PNG 签名和 HTML 中的 nativeSearch 占位标签。 | Pass |

### EmbedControllerPart53

源码：[EmbedControllerPart53.test.ets](entry/src/ohosTest/ets/test/EmbedController/EmbedControllerPart53.test.ets)；用例数：41。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `EmbedControllerPart53_0001_controller_width0_height5_embed0` | `EmbedControllerPart53_0001_controller_width0_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0002_controller_width1_height5_embed0` | `EmbedControllerPart53_0002_controller_width1_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0003_controller_width2_height5_embed0` | `EmbedControllerPart53_0003_controller_width2_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0004_controller_width3_height5_embed0` | `EmbedControllerPart53_0004_controller_width3_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0005_controller_width4_height5_embed0` | `EmbedControllerPart53_0005_controller_width4_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0006_controller_width5_height5_embed0` | `EmbedControllerPart53_0006_controller_width5_height5_embed0` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height5_embed0` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0007_controller_width0_height0_embed1` | `EmbedControllerPart53_0007_controller_width0_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0008_controller_width1_height0_embed1` | `EmbedControllerPart53_0008_controller_width1_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0009_controller_width2_height0_embed1` | `EmbedControllerPart53_0009_controller_width2_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0010_controller_width3_height0_embed1` | `EmbedControllerPart53_0010_controller_width3_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0011_controller_width4_height0_embed1` | `EmbedControllerPart53_0011_controller_width4_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0012_controller_width5_height0_embed1` | `EmbedControllerPart53_0012_controller_width5_height0_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height0_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0013_controller_width0_height1_embed1` | `EmbedControllerPart53_0013_controller_width0_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0014_controller_width1_height1_embed1` | `EmbedControllerPart53_0014_controller_width1_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0015_controller_width2_height1_embed1` | `EmbedControllerPart53_0015_controller_width2_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0016_controller_width3_height1_embed1` | `EmbedControllerPart53_0016_controller_width3_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0017_controller_width4_height1_embed1` | `EmbedControllerPart53_0017_controller_width4_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0018_controller_width5_height1_embed1` | `EmbedControllerPart53_0018_controller_width5_height1_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height1_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0019_controller_width0_height2_embed1` | `EmbedControllerPart53_0019_controller_width0_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0020_controller_width1_height2_embed1` | `EmbedControllerPart53_0020_controller_width1_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0021_controller_width2_height2_embed1` | `EmbedControllerPart53_0021_controller_width2_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0022_controller_width3_height2_embed1` | `EmbedControllerPart53_0022_controller_width3_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0023_controller_width4_height2_embed1` | `EmbedControllerPart53_0023_controller_width4_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0024_controller_width5_height2_embed1` | `EmbedControllerPart53_0024_controller_width5_height2_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height2_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0025_controller_width0_height3_embed1` | `EmbedControllerPart53_0025_controller_width0_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0026_controller_width1_height3_embed1` | `EmbedControllerPart53_0026_controller_width1_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0027_controller_width2_height3_embed1` | `EmbedControllerPart53_0027_controller_width2_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0028_controller_width3_height3_embed1` | `EmbedControllerPart53_0028_controller_width3_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0029_controller_width4_height3_embed1` | `EmbedControllerPart53_0029_controller_width4_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0030_controller_width5_height3_embed1` | `EmbedControllerPart53_0030_controller_width5_height3_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height3_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0031_controller_width0_height4_embed1` | `EmbedControllerPart53_0031_controller_width0_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0032_controller_width1_height4_embed1` | `EmbedControllerPart53_0032_controller_width1_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0033_controller_width2_height4_embed1` | `EmbedControllerPart53_0033_controller_width2_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0034_controller_width3_height4_embed1` | `EmbedControllerPart53_0034_controller_width3_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0035_controller_width4_height4_embed1` | `EmbedControllerPart53_0035_controller_width4_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0036_controller_width5_height4_embed1` | `EmbedControllerPart53_0036_controller_width5_height4_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width5_height4_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0037_controller_width0_height5_embed1` | `EmbedControllerPart53_0037_controller_width0_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width0_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0038_controller_width1_height5_embed1` | `EmbedControllerPart53_0038_controller_width1_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width1_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0039_controller_width2_height5_embed1` | `EmbedControllerPart53_0039_controller_width2_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width2_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0040_controller_width3_height5_embed1` | `EmbedControllerPart53_0040_controller_width3_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width3_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |
| `EmbedControllerPart53_0041_controller_width4_height5_embed1` | `EmbedControllerPart53_0041_controller_width4_height5_embed1` | 原生节点控制器 | 测试模块已加载，被测模块及资源可访问 | `controller_width4_height5_embed1` | 配置控制器尺寸及标识，验证标识保持，并验证未创建根节点时更新、置空后的状态。 | Pass |

### NativeInteractionPart54

源码：[NativeInteractionPart54.test.ets](entry/src/ohosTest/ets/test/NativeInteraction/NativeInteractionPart54.test.ets)；用例数：33。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入／操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| `NativeInteractionPart54_0001_background_foreground` | `NativeInteractionPart54_0001_background_foreground` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `background_foreground` | 等待商城加载，切至后台再恢复，检查商品可见、六张卡片双列布局及搜索聚焦。 | Pass |
| `NativeInteractionPart54_0013_native_search_input0_title0_price0` | `NativeInteractionPart54_0013_native_search_input0_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0014_native_search_input1_title0_price0` | `NativeInteractionPart54_0014_native_search_input1_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0015_native_search_input2_title0_price0` | `NativeInteractionPart54_0015_native_search_input2_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0016_native_search_input3_title0_price0` | `NativeInteractionPart54_0016_native_search_input3_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0017_native_search_input4_title0_price0` | `NativeInteractionPart54_0017_native_search_input4_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0018_native_search_input5_title0_price0` | `NativeInteractionPart54_0018_native_search_input5_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0019_native_search_input6_title0_price0` | `NativeInteractionPart54_0019_native_search_input6_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input6_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0020_native_search_input7_title0_price0` | `NativeInteractionPart54_0020_native_search_input7_title0_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title0_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0021_native_search_input0_title1_price0` | `NativeInteractionPart54_0021_native_search_input0_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0022_native_search_input1_title1_price0` | `NativeInteractionPart54_0022_native_search_input1_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0023_native_search_input2_title1_price0` | `NativeInteractionPart54_0023_native_search_input2_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0024_native_search_input3_title1_price0` | `NativeInteractionPart54_0024_native_search_input3_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0025_native_search_input4_title1_price0` | `NativeInteractionPart54_0025_native_search_input4_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0026_native_search_input5_title1_price0` | `NativeInteractionPart54_0026_native_search_input5_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0027_native_search_input6_title1_price0` | `NativeInteractionPart54_0027_native_search_input6_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input6_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0028_native_search_input7_title1_price0` | `NativeInteractionPart54_0028_native_search_input7_title1_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title1_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0029_native_search_input0_title2_price0` | `NativeInteractionPart54_0029_native_search_input0_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0030_native_search_input1_title2_price0` | `NativeInteractionPart54_0030_native_search_input1_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0031_native_search_input2_title2_price0` | `NativeInteractionPart54_0031_native_search_input2_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0032_native_search_input3_title2_price0` | `NativeInteractionPart54_0032_native_search_input3_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0033_native_search_input4_title2_price0` | `NativeInteractionPart54_0033_native_search_input4_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0034_native_search_input5_title2_price0` | `NativeInteractionPart54_0034_native_search_input5_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0035_native_search_input6_title2_price0` | `NativeInteractionPart54_0035_native_search_input6_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input6_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0036_native_search_input7_title2_price0` | `NativeInteractionPart54_0036_native_search_input7_title2_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title2_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0037_native_search_input0_title3_price0` | `NativeInteractionPart54_0037_native_search_input0_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input0_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0038_native_search_input1_title3_price0` | `NativeInteractionPart54_0038_native_search_input1_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input1_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0039_native_search_input2_title3_price0` | `NativeInteractionPart54_0039_native_search_input2_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input2_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0040_native_search_input3_title3_price0` | `NativeInteractionPart54_0040_native_search_input3_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input3_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0041_native_search_input4_title3_price0` | `NativeInteractionPart54_0041_native_search_input4_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input4_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0042_native_search_input5_title3_price0` | `NativeInteractionPart54_0042_native_search_input5_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input5_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0043_native_search_input6_title3_price0` | `NativeInteractionPart54_0043_native_search_input6_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input6_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |
| `NativeInteractionPart54_0044_native_search_input7_title3_price0` | `NativeInteractionPart54_0044_native_search_input7_title3_price0` | 同层渲染交互 | 主 HAP 已启动，商城页面可交互 | `native_search_input7_title3_price0` | 验证指定商品标题／价格，输入并读取搜索文本，检查商品保持展示，清空后核对空文本。 | Pass |

### GoodsConstructionPart55
