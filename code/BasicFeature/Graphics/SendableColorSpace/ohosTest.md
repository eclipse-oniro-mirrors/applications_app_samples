# SendableColorSpace 测试用例归档

## 验证范围

1. 已使用 DevEco Studio 26 自带 hvigor 工具链完成 entry 主模块与 entry@ohosTest 模块的编译验证，两次构建均为 `BUILD SUCCESSFUL`。
2. 已在 OpenHarmony 7.1.0.21（API version 26）真机（serial `d629034339413535311095d600002b00`）安装双 HAP 并完成 42 个测试套件的分套件隔离回归，结果为 `Tests run: 1825, Failure: 0, Error: 0, Pass: 1825`。
3. 全局 UI 用例依赖应用主 HAP 与测试 HAP 同时安装（bundle `com.samples.sendablecolorspace`，模块 `entry` 与 `entry_test`），单独安装测试 HAP 时所有 UI 用例会因首页组件不存在而失败。

## 测试套件总览

当前测试统计：

- **测试文件数**：42 个 `.test.ets`（另有入口 `List.test.ets`）
- **测试套件数**：42
- **测试用例数**：1825
- **真机结果**：Pass 1825 / Failure 0 / Error 0
- **代码规模**：`entry/src` 下 `.ets` 合计 58,427 行（main 7,065 行、ohosTest 51,362 行）

### 基础与数据模型（5 个套件，26 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| ColorSpaceDataLogic | ColorSpaceDataLogic.test.ets | Data | 13 | 26 个色域元数据、三组边界、枚举别名与 `@Sendable` 结果构造 |
| ColorSpaceNameBranch | ColorSpaceNameBranch.test.ets | Data | 4 | 标准、扩展、LIMIT 与自定义/未知四个名称分支 |
| IndexPageTest | IndexPageTest.test.ets | Navigation | 5 | 首页标题、副标题与九个入口文案及前后跳转 |
| NavigationFlowTest | NavigationFlowTest.test.ets | Navigation | 2 | 跨页操作闭环与系统返回 |
| NavigationStateTest | NavigationStateTest.test.ets | Navigation | 2 | 子页面重入后的结果复位 |
| **小计** | | | **26** | |

### 接口属性与枚举（6 个套件，72 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| ColorSpacePropertyTest | ColorSpacePropertyTest.test.ets | API | 26 | 26 个色域的 `Type`/`ColorSpaceName`/`WhitePoint`/`Gamma` 独立创建与查询 |
| ApiPropertyTest | ApiPropertyTest.test.ets | API | 9 | TaskPool 与 Worker 两条通道的属性字符串 |
| StandardColorSpaceTest | StandardColorSpaceTest.test.ets | UI | 6 | 标准色域页面布局、TaskPool 守卫与切换后重读 |
| CustomColorSpaceTest | CustomColorSpaceTest.test.ets | UI | 5 | 自定义色域页面布局、默认创建、重置与重入 |
| ColorSpaceValueMatrix | ColorSpaceValueMatrix.test.ets | API | 15 | 标准 8 项 + 扩展 7 项按钮的属性渲染矩阵 |
| ColorSpaceLimitMatrix | ColorSpaceLimitMatrix.test.ets | API | 11 | 11 个 LIMIT 色域按钮的属性渲染矩阵 |
| **小计** | | | **72** | |

### 输入与边界（3 个套件，48 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| CustomInputMatrix | CustomInputMatrix.test.ets | Input | 16 | 八个坐标输入框的非法值、前后空格、科学计数与全同值输入 |
| GammaInputTest | GammaInputTest.test.ets | Boundary | 24 | gamma 0.1~5.0 全区间取值、非法输入回退与重置 |
| SliderBoundary | SliderBoundary.test.ets | Boundary | 8 | gamma 滑块起止值、步长吸附与显示一致 |
| **小计** | | | **48** | |

### 比较与并发（4 个套件，49 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| CompareCombinationTest | CompareCombinationTest.test.ets | Compare | 16 | 0~3 个色域的组合、顺序、取消选择与清空 |
| CompareScaleMatrix | CompareScaleMatrix.test.ets | Compare | 8 | 4/5/6/8/12 个色域的大规模比较与面积复算 |
| ConcurrencyTest | ConcurrencyTest.test.ets | Concurrency | 13 | 首页并发页的 TaskPool/Worker 读取、切换、日志上限与重入 |
| ChannelConsistency | ChannelConsistency.test.ets | Concurrency | 12 | 8 个色域在 TaskPool 与 Worker 两条通道上与平台真值逐字段比对 |
| **小计** | | | **49** | |

### 异常处理（3 个套件，34 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| ExceptionTest | ExceptionTest.test.ets | Exception | 23 | 非法枚举、非法 gamma、越界坐标、别名校验与 9 项边界自检 |
| ExceptionButtonTest | ExceptionButtonTest.test.ets | Exception | 2 | 连续异常结果的覆盖与错误后恢复 |
| ExceptionOutcome | ExceptionOutcome.test.ets | Exception | 9 | 7 个异常按钮与 2 个属性按钮的平台实际结果 |
| **小计** | | | **34** | |

### 色彩科学算法（1 个套件，37 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| ColorMathTest | ColorMathTest.test.ets | Math | 37 | 面积、包含判定、矩阵、传递函数、Lab、ΔE76/94/2000、转换、字节工具与 26 空间全量校验 |
| **小计** | | | **37** | |

### 新增演示页面（5 个套件，59 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---|---|
| ChromaticityDiagramTest | ChromaticityDiagramTest.test.ets | Canvas | 12 | 色度图导航、面积/覆盖比、白点、参考叠加与探针 |
| ColorDifferenceTest | ColorDifferenceTest.test.ets | UI | 15 | 色差页预设、滑块、交换、色域切换与判定分档 |
| ColorConversionTest | ColorConversionTest.test.ets | UI | 14 | 转换页 XYZ/Lab/Encoded/Clipped、越界限幅与交换/重置 |
| ConcurrencyBenchmarkTest | ConcurrencyBenchmarkTest.test.ets | Concurrency | 10 | 三通道基准、汇总最快路径、gamma 一致性与重置 |
| ColorSpaceReportTest | ColorSpaceReportTest.test.ets | Report | 8 | 报表排序、三种过滤、汇总极值与重置 |
| **小计** | | | **59** |

### 工具类（15 个套件，1500 条用例）

本组覆盖 `main/ets/utils/Logger.ets` 与 `main/ets/common/utils/` 下 12 个纯函数工具类，均通过 `static` 方法对外提供能力，不持有状态。前 3 个套件按能力域展开；Suite04 之后的 12 个套件按“每个 public 方法 × 8 条池化字面量输入”展开，每例三条断言：与本地 oracle 比对、序列化形态比对、二次调用幂等。

| 套件 | 被测单元 | 测试文件 | 方法数 | 用例数 |
|---|---|---|---|---|
| UtilsSuite01 | utils/Logger.ets | UtilsSuite01.test.ets | 4 | 4 |
| UtilsSuite02 | common/ColorSpaceMath.ets（面积、包含、矩阵、rgbToXyz） | UtilsSuite02.test.ets | 13 | 13 |
| UtilsSuite03 | common/ColorSpaceMath.ets（ΔE、限幅、字节与文本转换） | UtilsSuite03.test.ets | 19 | 19 |
| UtilsSuite04 | common/utils/StringUtils.ets | UtilsSuite04.test.ets | 14 | 112 |
| UtilsSuite05 | common/utils/ArrayUtils.ets | UtilsSuite05.test.ets | 14 | 112 |
| UtilsSuite06 | common/utils/NumberUtils.ets | UtilsSuite06.test.ets | 14 | 112 |
| UtilsSuite07 | common/utils/MathUtils.ets | UtilsSuite07.test.ets | 14 | 112 |
| UtilsSuite08 | common/utils/ConvertUtils.ets | UtilsSuite08.test.ets | 14 | 112 |
| UtilsSuite09 | common/utils/DateUtils.ets | UtilsSuite09.test.ets | 16 | 128 |
| UtilsSuite10 | common/utils/ValidateUtils.ets | UtilsSuite10.test.ets | 17 | 136 |
| UtilsSuite11 | common/utils/StringFormatter.ets | UtilsSuite11.test.ets | 16 | 128 |
| UtilsSuite12 | common/utils/ColorUtils.ets | UtilsSuite12.test.ets | 14 | 112 |
| UtilsSuite13 | common/utils/IdUtils.ets | UtilsSuite13.test.ets | 16 | 128 |
| UtilsSuite14 | common/utils/ObjectUtils.ets | UtilsSuite14.test.ets | 16 | 128 |
| UtilsSuite15 | common/utils/RandomUtils.ets | UtilsSuite15.test.ets | 18 | 144 |
| **小计** | | | **219** | **1500** |

工具类分组与输入面：

| 分组 | 类 | 覆盖内容 |
|---|---|---|
| 文本 | StringUtils、StringFormatter | 空串/空白、大小写、反转、计数与查找、切分、越界截取；居中、省略号、时长、文件大小、百分比、掩码、序数与重复拼接 |
| 集合 | ArrayUtils、ObjectUtils | 求和/均值/极值、去重、包含与下标、大于计数、连接、排序、安全切片；有序 Map 的键值、合并、克隆、键值对、删除与键序定位 |
| 数值与数学 | NumberUtils、MathUtils | 限幅、阶乘、最大公约数/最小公倍数、奇偶、区间、步长取整、等差数列；四则安全版、余数、平均、百分比、距离、斐波那契、素数、中位数、二进制计数、数位和 |
| 格式与校验 | ConvertUtils、ValidateUtils | 字符码、CSV 与数组互转、十六进制、布尔/数字解析、数字剥离；字母/数字/邮箱/十六进制/IPv4/手机号/URL/下划线/驼峰/长度区间/单字符判定 |
| 时间 | DateUtils | 加天、日/月/年、当月天数、日差、年月日时分格式化、闰年、时间戳合法性、当日零点、星期与耗时折算（全部按 UTC 计算，不依赖设备时区） |
| 色彩与标识 | ColorUtils、IdUtils | RGB 分量、和、明暗调整、欧氏距离、反色、亮/暗与灰色判定、十六进制归一化、ARGB 拼接；前缀/后缀解析、计数编号、补齐与截断、哈希、数值后缀、递增与规范化 |
| 确定性随机 | RandomUtils | 基于种子的确定性取值、布尔、区间、骰子、百分比、桶分布、选取、哈希种子、平均值、令牌与 UUID 形态 |

### 合计

| 阶段 | 套件数 | 用例数 |
|---|---|---|
| 基础与数据模型 | 5 | 26 |
| 接口属性与枚举 | 6 | 72 |
| 输入与边界 | 3 | 48 |
| 比较与并发 | 4 | 49 |
| 异常处理 | 3 | 34 |
| 色彩科学算法 | 1 | 37 |
| 新增演示页面 | 5 | 59 |
| 工具类 | 15 | 1500 |
| **总计** | **42** | **1825** |

## 测试工程结构

```
entry/src/ohosTest/ets/
|---test
|   |---List.test.ets                         // 套件入口：42 个 import 与 42 次套件函数调用
|   |---utils                                 // 工具类套件（15 个文件，1500 条）
|   |   |---UtilsSuite01.test.ets             // 4 条（Logger）
|   |   |---UtilsSuite02.test.ets             // 13 条（色域几何）
|   |   |---UtilsSuite03.test.ets             // 19 条（数值转换）
|   |   |---UtilsSuite04.test.ets             // 112 条（StringUtils）
|   |   |---UtilsSuite05.test.ets             // 112 条（ArrayUtils）
|   |   |---UtilsSuite06.test.ets             // 112 条（NumberUtils）
|   |   |---UtilsSuite07.test.ets             // 112 条（MathUtils）
|   |   |---UtilsSuite08.test.ets             // 112 条（ConvertUtils）
|   |   |---UtilsSuite09.test.ets             // 128 条（DateUtils）
|   |   |---UtilsSuite10.test.ets             // 136 条（ValidateUtils）
|   |   |---UtilsSuite11.test.ets             // 128 条（StringFormatter）
|   |   |---UtilsSuite12.test.ets             // 112 条（ColorUtils）
|   |   |---UtilsSuite13.test.ets             // 128 条（IdUtils）
|   |   |---UtilsSuite14.test.ets             // 128 条（ObjectUtils）
|   |   |---UtilsSuite15.test.ets             // 144 条（RandomUtils）
|   |---ApiPropertyTest.test.ets              // 9 条
|   |---ChannelConsistency.test.ets           // 12 条
|   |---ChromaticityDiagramTest.test.ets      // 12 条
|   |---ColorConversionTest.test.ets          // 14 条
|   |---ColorDifferenceTest.test.ets          // 15 条
|   |---ColorMathTest.test.ets                // 37 条
|   |---ColorSpaceDataLogic.test.ets          // 13 条
|   |---ColorSpaceLimitMatrix.test.ets        // 11 条
|   |---ColorSpaceNameBranch.test.ets         // 4 条
|   |---ColorSpacePropertyTest.test.ets       // 26 条
|   |---ColorSpaceReportTest.test.ets         // 8 条
|   |---ColorSpaceValueMatrix.test.ets        // 15 条
|   |---CompareCombinationTest.test.ets       // 16 条
|   |---CompareScaleMatrix.test.ets           // 8 条
|   |---ConcurrencyBenchmarkTest.test.ets     // 10 条
|   |---ConcurrencyTest.test.ets              // 13 条
|   |---CustomColorSpaceTest.test.ets         // 5 条
|   |---CustomInputMatrix.test.ets            // 16 条
|   |---ExceptionButtonTest.test.ets          // 2 条
|   |---ExceptionOutcome.test.ets             // 9 条
|   |---ExceptionTest.test.ets                // 23 条
|   |---GammaInputTest.test.ets               // 24 条
|   |---IndexPageTest.test.ets                // 5 条
|   |---NavigationFlowTest.test.ets           // 2 条
|   |---NavigationStateTest.test.ets          // 2 条
|   |---SliderBoundary.test.ets               // 8 条
|   |---StandardColorSpaceTest.test.ets       // 6 条
|---testkit
|   |---SharedDriver.ets                      // 公共驱动：57 个导出函数与 1 个 ColorSpaceFacts 接口（UI 操作、滚动定位、滑块设值、平台真值比对）
|---testability
|   |---TestAbility.ets                       // 测试元能力
|   |---pages
|       |---Index.ets                         // 测试元能力页面
|---testrunner
|   |---OpenHarmonyTestRunner.ts              // 测试运行器（入口路径小写 testrunner）
entry/src/main/ets/common/utils/              // 工具类实现：12 个类，2,456 行
```

## 套件入口与元数据管理

[List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 是本工程的 `SUITE_MANIFEST`：文件顶部按依赖顺序 `import` 42 个套件默认导出，`testsuite()` 中依次调用 42 个套件函数，调用顺序与 import 顺序一致。套件顺序为 ColorSpaceDataLogic、IndexPageTest、StandardColorSpaceTest、CustomColorSpaceTest、ConcurrencyTest、ExceptionTest、NavigationFlowTest、ApiPropertyTest、ColorSpacePropertyTest、GammaInputTest、CompareCombinationTest、NavigationStateTest、ExceptionButtonTest、ColorSpaceValueMatrix、ColorSpaceLimitMatrix、ColorSpaceNameBranch、CustomInputMatrix、SliderBoundary、CompareScaleMatrix、ChannelConsistency、ExceptionOutcome、ColorMathTest、ChromaticityDiagramTest、ColorDifferenceTest、ColorConversionTest、ConcurrencyBenchmarkTest、ColorSpaceReportTest，以及 UtilsSuite01~UtilsSuite15。

清单本身只承担注册职责，未在 `List.test.ets` 中实现 `validateManifest`/`countByCategory`/`findSuite` 等运行时工具函数。用例元数据的编号、命名、`@tc` 字段以及断言与日志位置，按下文「用例设计说明」中的规范编写，并在提交检视环节逐条核对，工程内不附带额外的离线审计脚本。

## 完整用例表

说明：预置条件中“首页就绪”指应用主 HAP 已启动并停留在首页（`TitleText` 可见）；UI 输入操作均已由 `SharedDriver` 完成屏幕唤醒、解锁与滚动定位。测试结果列为最近一次真机分套件回归结果。

### ColorSpaceDataLogic（26 个色域元数据）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_DATA_0100 | testDataStructure0001 | 三组色域数组边界 | 测试进程可导入 ColorSpaceData | 读取 STANDARD/EXTENDED/LIMIT 数组 | 长度分别为 8、7、11 | Pass |
| SUB_CS_DATA_0200 | testNameMapping0001 | 枚举到 API 名称映射 | 同上 | 遍历 26 个枚举 | 26 项名称全部匹配，unknownNames=0 | Pass |
| SUB_CS_DATA_0300 | testFindColorSpaceInfo0001 | 元数据查找 | 同上 | 26 个已配置枚举 + 1 个未支持枚举 | foundCount=26、mismatchCount=0、未支持项返回 null | Pass |
| SUB_CS_DATA_0400 | testAliasEnumValues0001 | 枚举别名等价 | 同上 | DISPLAY_SRGB、DISPLAY_P3_HLG、DISPLAY_P3_PQ | 分别等于 SRGB、P3_HLG、P3_PQ | Pass |
| SUB_CS_DATA_0500 | testChromaticityRange0001 | 坐标与 gamma 取值合法性 | 同上 | 遍历 26 项全部坐标与 gamma | invalidCoordinates=0、invalidGammas=0 | Pass |
| SUB_CS_DATA_0600 | testStandardExactValues0001 | 标准色域精确值 | 同上 | SRGB、DCI_P3 条目 | SRGB redX=0.64、redY=0.33；DCI_P3 白点与 gamma 精确匹配 | Pass |
| SUB_CS_DATA_0700 | testLinearGammaValues0001 | 线性空间 gamma | 同上 | LINEAR_SRGB、LINEAR_BT2020、LINEAR_P3 | 三者 gamma 均为 1 | Pass |
| SUB_CS_DATA_0800 | testSendableResultFields0001 | @Sendable 结果构造 | 同上 | 构造 ColorSpaceResult | name=DCI_P3、whitePointX=0.314、whitePointY=0.351 | Pass |
| SUB_CS_DATA_0900 | testSpecialNameMapping0001 | 特殊枚举名称 | 同上 | CUSTOM、UNKNOWN、-1 | 依次返回 Custom、Unknown、Unknown(-1) | Pass |
| SUB_CS_DATA_1000 | testAllColorSpacesIndependentArray0001 | 合并数组互不干扰 | 同上 | 连续两次取合并数组并修改其一 | 两次长度 25 与 26，源分组不被修改 | Pass |
| SUB_CS_DATA_1100 | testExtendedExactPrimaries0001 | 扩展空间精确值 | 同上 | BT601_SMPTE_C 条目 | label=BT601_SMPTE_C、redX=0.63、greenY=0.595 | Pass |
| SUB_CS_DATA_1200 | testLimitCanonicalGeometry0001 | LIMIT 与全范围几何同源 | 同上 | SRGB_Limit 与 SRGB | 两者坐标逐项相同、枚举不同 | Pass |
| SUB_CS_DATA_1300 | testAliasLookupCanonicalEntry0001 | 别名命中规范条目 | 同上 | DISPLAY_SRGB、DISPLAY_P3_HLG、LINEAR_BT709 | 均返回非空且为规范条目 | Pass |

### ColorSpaceNameBranch（名称分支）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_NAME_0101 | testStandardNameBranch0001 | 标准名称分支 | 测试进程可导入 ColorSpaceData | 遍历 8 个标准枚举 | 8 项名称全部匹配，mismatches 为空 | Pass |
| SUB_CS_NAME_0102 | testExtendedNameBranch0001 | 扩展名称分支 | 同上 | 遍历 7 个扩展枚举 | 7 项名称全部匹配 | Pass |
| SUB_CS_NAME_0103 | testLimitNameBranch0001 | LIMIT 名称分支 | 同上 | 遍历 11 个 LIMIT 枚举 | 11 项名称全部匹配 | Pass |
| SUB_CS_NAME_0104 | testFallbackNameBranch0001 | 自定义与未知回退 | 同上 | CUSTOM 与未映射枚举 | CUSTOM 返回 Custom，未映射返回数值形式 | Pass |

### IndexPageTest（首页）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_INDEX_0100 | testIndexPageContent0001 | 首页文案完整性 | 首页就绪 | 读取标题、副标题与九个入口 | 标题为中英文标题之一，九个入口文案齐全 | Pass |
| SUB_CS_INDEX_0200 | testIndexNavigateStandard0001 | 标准色域往返 | 首页就绪 | 点击 NavStandard，再点 StdBtnBack | 目标页标题 Standard Color Spaces，返回后首页标题不变 | Pass |
| SUB_CS_INDEX_0300 | testIndexNavigateCustom0001 | 自定义色域往返 | 首页就绪 | 点击 NavCustom，再点 CustomBtnBack | 目标页标题 Custom Color Space，返回后首页标题不变 | Pass |
| SUB_CS_INDEX_0400 | testIndexNavigateConcurrency0001 | 并发场景往返 | 首页就绪 | 点击 NavConcurrency，再点 ConBtnBack | 目标页标题 Concurrency Scenarios | Pass |
| SUB_CS_INDEX_0500 | testIndexNavigateException0001 | 异常处理往返 | 首页就绪 | 点击 NavException，再点 ExcBtnBack | 目标页标题 Exception Handling | Pass |

### NavigationFlowTest（跨页流程）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_NAV_FLOW_0100 | testNavigationUserJourney0001 | 四页操作闭环 | 首页就绪 | 依次进入标准页并点 SRGB、自定义页、并发页、异常页并逐页返回 | 标准页属性、自定义 gamma=2.2 与三原色、并发与异常页初始状态均正确 | Pass |
| SUB_CS_NAV_FLOW_0200 | testNavigationSystemBack0001 | 系统返回 | 首页就绪 | 进入自定义页后触发系统返回 | 回到首页且首页标题与入口仍可读 | Pass |

### NavigationStateTest（重入复位）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_NAV_STATE_0100 | testNavigationStandardReset0001 | 标准页重入清空结果 | 首页就绪 | 创建 SRGB 并对比后离开再进入 | 属性、TaskPool 与对比结果均回到初始或按当前选择重建 | Pass |
| SUB_CS_NAV_STATE_0200 | testNavigationExceptionReset0001 | 异常页重入复位 | 首页就绪 | 触发 UNKNOWN 异常后离开再进入 | 结果区回到初始提示，errorResult 行数为 1 | Pass |

### ColorMathTest（色彩科学算法，37 条）

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_MATH_0001 | testGamutArea0001 | sRGB 三角形面积 | 测试进程可导入 ColorSpaceMath | gamutArea(SRGB_PRIMARIES) | 面积≈0.11205、areaText 为 Area=0.1121 | Pass |
| SUB_CS_MATH_0002 | testGamutArea0002 | Display P3 面积 | 同上 | gamutArea(P3_PRIMARIES) | 面积≈0.1520，相对 sRGB 比值>1.3 | Pass |
| SUB_CS_MATH_0003 | testGamutArea0003 | BT.2020 面积 | 同上 | gamutArea(BT2020_PRIMARIES) | 面积≈0.2119，相对 P3 比值>1.35 | Pass |
| SUB_CS_MATH_0004 | testGamutArea0004 | 面积严格递增 | 同上 | 三个参考空间面积比较 | sRGB<P3<BT2020 | Pass |
| SUB_CS_MATH_0005 | testDegenerateGamut0001 | 退化三角形 | 同上 | 三原色共线输入 | 面积为 0 且 isDegenerate 为真 | Pass |
| SUB_CS_MATH_0006 | testContainsPoint0001 | 白点位于三角形内 | 同上 | 各空间白点坐标 | 三个参考空间白点均被判定在内 | Pass |
| SUB_CS_MATH_0007 | testContainsPoint0002 | 包含关系传递 | 同上 | P3 判定 sRGB 绿点、sRGB 判定 BT2020 红点 | 前者在内、后者在外 | Pass |
| SUB_CS_MATH_0008 | testContainsPoint0003 | 可见轨迹外与退化三角形 | 同上 | (0.05,0.95)、(0.9,0.05)、共线三角形 | 三者均判定为不在内 | Pass |
| SUB_CS_MATH_0009 | testXyToXyz0001 | D65 坐标转 XYZ | 同上 | xyToXyz(D65_X, D65_Y) | 与参考 XYZ 三值误差<0.001 | Pass |
| SUB_CS_MATH_0010 | testXyToXyz0002 | 零亮度坐标 | 同上 | xyToXyz(x, 0) | 返回 (0,0,0) 而非 NaN/Infinity | Pass |
| SUB_CS_MATH_0011 | testMatrixInverse0001 | 单位矩阵求逆 | 同上 | invert3x3(单位矩阵) | 对角线元素为 1 | Pass |
| SUB_CS_MATH_0012 | testMatrixInverse0002 | 奇异矩阵求逆 | 同上 | invert3x3(奇异矩阵) | 返回 9 个 0 且均为有限数 | Pass |
| SUB_CS_MATH_0013 | testRgbMatrix0001 | sRGB 转 XYZ 矩阵 | 同上 | rgbToXyzMatrix(SRGB_PRIMARIES) | 前三项系数与公开值相符 | Pass |
| SUB_CS_MATH_0014 | testRgbMatrix0002 | 矩阵列和复现白点 | 同上 | 矩阵列和 | 结果与 D65 参考值误差<0.004 | Pass |
| SUB_CS_MATH_0015 | testSrgbTransfer0001 | sRGB 分段函数拐点 | 同上 | 0.0031308 与 0.04045 | 拐点两侧互逆，srgbToLinear(0)=0 | Pass |
| SUB_CS_MATH_0016 | testSrgbTransfer0002 | 编解码往返 | 同上 | 全区间 0~1 采样 | 最大误差<0.001，端点与 0.2140 精确 | Pass |
| SUB_CS_MATH_0017 | testGammaRoundTrip0001 | 通用 gamma 互逆 | 同上 | applyGamma/removeGamma(0.25, 2.2) | 编码值≈0.5326，还原≈0.25，gamma=1 恒等 | Pass |
| SUB_CS_MATH_0018 | testGammaRoundTrip0002 | 非法 gamma 回退 | 同上 | gamma 为 0、-1、2.2 且输入>1 | 前两者原样返回，超界输入限幅为 1 | Pass |
| SUB_CS_MATH_0019 | testXyzToLab0001 | 参考白转 Lab | 同上 | xyzToLab(D65 白) | L≈100、a≈0、b≈0 | Pass |
| SUB_CS_MATH_0020 | testXyzToLab0002 | 黑转 Lab | 同上 | xyzToLab(0,0,0) | L=a=b=0 | Pass |
| SUB_CS_MATH_0021 | testXyzToLab0003 | sRGB 红转 Lab | 同上 | xyzToLab(sRGB 红 XYZ) | L≈53.24、a≈80.09、b≈67.20 | Pass |
| SUB_CS_MATH_0022 | testLabToXyz0001 | Lab 反变换 | 同上 | labToXyz(xyzToLab(x)) | 往返误差<1e-6 | Pass |
| SUB_CS_MATH_0023 | testDeltaE760001 | ΔE76 零距与正距 | 同上 | 同色与不同明度 | 同色为 0，异色>0 | Pass |
| SUB_CS_MATH_0024 | testDeltaE760002 | ΔE76 距离关系 | 同上 | 红-绿、红-黑 | 红绿距离>150 且大于红黑距离 | Pass |
| SUB_CS_MATH_0025 | testDeltaE940001 | ΔE94 基本性质 | 同上 | 同色与异色 | 同色为 0，异色>0 | Pass |
| SUB_CS_MATH_0026 | testDeltaE20000001 | ΔE2000 参考对 | 同上 | Sharma 参考色对 | 结果≈2.0425（toFixed(4) 以 2.04 开头） | Pass |
| SUB_CS_MATH_0027 | testDeltaE20000002 | ΔE2000 对称性 | 同上 | 交换两参数 | 正反向差<1e-6，且小于 ΔE76 | Pass |
| SUB_CS_MATH_0028 | testConvertIdentity0001 | 同空间转换恒等 | 同上 | convertRgb(0.5,0.5,0.5) 同空间 | 三个分量均为 0.5 | Pass |
| SUB_CS_MATH_0029 | testConvertOutOfGamut0001 | BT.2020 红越界 | 同上 | BT.2020 红转 sRGB | outOfGamut 为真、encoded.r>1、clipped.r=1 | Pass |
| SUB_CS_MATH_0030 | testConvertWithinGamut0001 | sRGB 红进 P3 | 同上 | sRGB 红转 Display P3 | 未越界，encoded.r 在 0.85~1 之间 | Pass |
| SUB_CS_MATH_0031 | testPerceptibility0001 | 可感知分档 | 同上 | 0.5、1.5、5 | Imperceptible、Slight、Noticeable | Pass |
| SUB_CS_MATH_0032 | testRelativeArea0001 | 相对覆盖比 | 同上 | relativeArea(P3, SRGB) | 比值≈0.737，且判定覆盖 sRGB | Pass |
| SUB_CS_MATH_0033 | testAllSpacesArea0001 | 26 个空间面积全量 | 同上 | 遍历 26 个空间 | 数量 26、退化 0、最小面积>0.05 | Pass |
| SUB_CS_MATH_0034 | testAllSpacesWhitePoint0001 | 26 个空间白点全量 | 同上 | 遍历 26 个空间白点 | 26 项均在内、仅 1 项明显偏离 D65 | Pass |
| SUB_CS_MATH_0035 | testByteRoundTrip0001 | 字节工具限幅取整 | 同上 | 0.5、1.7、-0.3 | 依次为 128、255、0 | Pass |
| SUB_CS_MATH_0036 | testHexText0001 | 十六进制文本 | 同上 | 黑、白、(1,0.5,0) | #000000、#ffffff、#ff8000 | Pass |
| SUB_CS_MATH_0037 | testPrimariesOf0001 | 元数据适配 | 同上 | primariesOf(指定元数据项) | 每个坐标与原条目相等 | Pass |

### ColorSpacePropertyTest（26 个色域独立创建与属性，26 条）

预置条件：测试进程可导入 `@ohos.graphics.sendableColorSpaceManager` 与 `@ohos.graphics.colorSpaceManager`，不依赖 UI。预期输出中的 gamma 由 `SharedDriver.gammaMatches` 与平台 `getGamma()` 做容差比较，不写死文档常量。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_PROP_0100 | testSrgbIndependentCreate0001 | SRGB 独立创建 | 测试进程可导入两个色彩管理模块 | `create(SRGB)` 后读取属性串 | 前两行为 `Type: SRGB` 与 `ColorSpaceName: SRGB`；`WhitePoint: [0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0200 | testDisplayP3IndependentCreate0001 | Display_P3 独立创建 | 同上 | `create(DISPLAY_P3)` | `Type`/`ColorSpaceName` 均为 Display_P3；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0300 | testDciP3IndependentCreate0001 | DCI_P3 独立创建 | 同上 | `create(DCI_P3)` | 名称为 DCI_P3；白点 `[0.3140, 0.3510]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0400 | testBt2020HlgIndependentCreate0001 | BT2020_HLG 独立创建 | 同上 | `create(BT2020_HLG)` | 名称为 BT2020_HLG；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0500 | testBt2020PqIndependentCreate0001 | BT2020_PQ 独立创建 | 同上 | `create(BT2020_PQ)` | 名称为 BT2020_PQ；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0600 | testBt709IndependentCreate0001 | BT709 独立创建 | 同上 | `create(BT709)` | 名称为 BT709；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0700 | testAdobeRgbIndependentCreate0001 | Adobe_RGB_1998 独立创建 | 同上 | `create(ADOBE_RGB_1998)` | 名称为 Adobe_RGB_1998；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_0800 | testLinearSrgbIndependentCreate0001 | Linear_SRGB 独立创建 | 同上 | `create(LINEAR_SRGB)` | 名称为 Linear_SRGB；白点 D65；gamma 与平台一致（接近 1） | Pass |
| SUB_CS_PROP_0900 | testBt601EbuProperty0001 | BT601_EBU 独立创建 | 同上 | `create(BT601_EBU)` | 名称为 BT601_EBU；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1000 | testBt601SmpteProperty0001 | BT601_SMPTE_C 独立创建 | 同上 | `create(BT601_SMPTE_C)` | 名称为 BT601_SMPTE_C；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1100 | testP3HlgProperty0001 | P3_HLG 独立创建 | 同上 | `create(P3_HLG)` | 名称为 P3_HLG；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1200 | testP3PqProperty0001 | P3_PQ 独立创建 | 同上 | `create(P3_PQ)` | 名称为 P3_PQ；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1300 | testLinearBt2020Property0001 | Linear_BT2020 独立创建 | 同上 | `create(LINEAR_BT2020)` | 名称为 Linear_BT2020；白点 D65；gamma 接近 1 | Pass |
| SUB_CS_PROP_1400 | testHLogProperty0001 | H_LOG 独立创建 | 同上 | `create(H_LOG)` | 名称为 H_LOG；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1500 | testDisplayBt2020Property0001 | Display_BT2020 名称映射 | 同上 | `create(DISPLAY_BT2020_SRGB)` | 白点 `[0.3127, 0.3290]`；名称按平台真值映射；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1600 | testAdobeRgbLimitProperty0001 | Adobe_RGB_Limit 属性 | 同上 | `create(ADOBE_RGB_1998_LIMIT)` | 白点 D65；名称按平台真值映射；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1700 | testDisplayP3LimitProperty0001 | Display_P3_Limit 属性 | 同上 | `create(DISPLAY_P3_LIMIT)` | `Type`/`ColorSpaceName` 均为 Display_P3_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1800 | testSrgbLimitProperty0001 | SRGB_Limit 属性 | 同上 | `create(SRGB_LIMIT)` | 名称为 SRGB_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_1900 | testBt709LimitProperty0001 | BT709_Limit 属性 | 同上 | `create(BT709_LIMIT)` | 名称为 BT709_Limit；白点 `[0.3127, 0.3290]`；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2000 | testBt601EbuLimitProperty0001 | BT601_EBU_Limit 属性 | 同上 | `create(BT601_EBU_LIMIT)` | 名称为 BT601_EBU_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2100 | testBt601SmpteLimitProperty0001 | BT601_SMPTE_C_Limit 属性 | 同上 | `create(BT601_SMPTE_C_LIMIT)` | 白点 D65；名称按平台真值映射；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2200 | testBt2020HlgLimitProperty0001 | BT2020_HLG_Limit 属性 | 同上 | `create(BT2020_HLG_LIMIT)` | 名称为 BT2020_HLG_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2300 | testBt2020PqLimitProperty0001 | BT2020_PQ_Limit 属性 | 同上 | `create(BT2020_PQ_LIMIT)` | 名称为 BT2020_PQ_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2400 | testP3HlgLimitProperty0001 | P3_HLG_Limit 属性 | 同上 | `create(P3_HLG_LIMIT)` | 名称为 P3_HLG_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2500 | testP3PqLimitProperty0001 | P3_PQ_Limit 属性 | 同上 | `create(P3_PQ_LIMIT)` | 名称为 P3_PQ_Limit；白点 D65；gamma 与平台一致 | Pass |
| SUB_CS_PROP_2600 | testLinearP3Property0001 | Linear_P3 属性 | 同上 | `create(LINEAR_P3)` | 名称为 Linear_P3；白点 D65；gamma 接近 1 | Pass |

### ApiPropertyTest（并发通道属性，9 条）

预置条件：并发页已就绪并已切换到目标色域。预期字符串由测试进程调用 `SharedDriver` 的 `standardInfoText`/`standardTaskPoolText`/`channelResultText` 用平台真值现场拼装，避免与实现常量耦合。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_API_0100 | testApiDisplayP3TaskPool0001 | Display_P3 TaskPool 读取 | 并发页已切换至 Display_P3 | 读取 TaskPool 结果区 | 状态行为 `Switched to Display_P3 for concurrency tests`；结果等于平台真值且为 3 行 | Pass |
| SUB_CS_API_0200 | testApiBt2020HlgTaskPool0001 | BT2020_HLG TaskPool 读取 | 并发页已切换至 BT2020_HLG | 同上 | 状态行与 3 行结果均匹配平台真值 | Pass |
| SUB_CS_API_0300 | testApiBt709TaskPool0001 | BT709 TaskPool 读取 | 并发页已切换至 BT709 | 同上 | 结果等于平台真值且为 3 行 | Pass |
| SUB_CS_API_0400 | testApiAdobeRgbTaskPool0001 | Adobe_RGB_1998 TaskPool 读取 | 并发页已切换至 Adobe_RGB_1998 | 同上 | 结果等于平台真值且为 3 行 | Pass |
| SUB_CS_API_0500 | testApiLinearSrgbTaskPool0001 | Linear_SRGB TaskPool 读取 | 并发页已切换至 Linear_SRGB | 同上 | gamma 与白点均匹配平台真值 | Pass |
| SUB_CS_API_0600 | testApiDciP3Worker0001 | DCI_P3 Worker 读取 | 并发页已切换至 DCI_P3 | 触发 Worker 回调后读取结果区 | 结果等于平台真值且为 3 行；白点为 `[0.3140, 0.3510]` | Pass |
| SUB_CS_API_0700 | testApiBt2020PqChannels0001 | BT2020_PQ 双通道一致 | 并发页已切换至 BT2020_PQ | 分别读取 TaskPool 与 Worker | 两条通道结果均等于各自的平台真值 | Pass |
| SUB_CS_API_0800 | testApiDisplayP3Worker0001 | Display_P3 Worker 读取 | 并发页已切换至 Display_P3 | 触发 Worker 回调 | 结果等于平台真值且为 3 行 | Pass |
| SUB_CS_API_0900 | testApiAdobeRgbWorker0001 | Adobe_RGB_1998 Worker 读取 | 并发页已切换至 Adobe_RGB_1998 | 同上 | 结果等于平台真值且为 3 行 | Pass |

### StandardColorSpaceTest（标准色域页面，6 条）

预置条件：首页就绪，由 `SharedDriver.navigateToStandard` 进入标准色域页。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_STD_0100 | testStandardPageLayout0001 | 页面布局 | 已进入标准色域页 | 读取标题、结果区与画布标题 | 标题 `Standard Color Spaces`；结果区初始为空；存在 `Gamut Visualization` | Pass |
| SUB_CS_STD_0200 | testStandardSections0001 | 扩展与 LIMIT 分组 | 同上 | 滚动到扩展区与 LIMIT 区 | 分组标题为 `Extended Color Spaces (API 11+)` 与 `LIMIT Range Color Spaces (API 11+)`，按钮可见 | Pass |
| SUB_CS_STD_0300 | testTaskPoolGuardNoCreate0001 | TaskPool 前置守卫 | 尚未创建任何色域 | 直接点击 Read via TaskPool | 结果区提示 `Please create a color space first`；属性区仍为空；任务未启动 | Pass |
| SUB_CS_STD_0400 | testTaskPoolRead0001 | TaskPool 读取 | 已点击 SRGB 创建 | 点击 Read via TaskPool | 属性区与任务池结果区均等于平台真值，初始结果区为空 | Pass |
| SUB_CS_STD_0500 | testTaskPoolReadAfterSwitch0001 | 切换后重读 | 已读取 SRGB | 切换到 DCI_P3 后再次读取 | 两次结果分别等于各自平台真值，属性区同步为 DCI_P3 | Pass |
| SUB_CS_STD_0600 | testStandardCreateDoesNotChangeCompare0001 | 创建不影响对比 | 已有对比结果 | 再次创建色域 | 对比摘要仍为 `Comparing: SRGB vs Display_P3`，属性更新而对比数据行不变 | Pass |

### CustomColorSpaceTest（自定义色域页面，5 条）

预置条件：首页就绪，进入自定义色域页；gamma 由滑块设定，八个坐标由输入框设定。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CUSTOM_0100 | testCustomPageLayout0001 | 页面布局 | 已进入自定义页 | 读取标题与两个分组标签 | 标题 `Custom Color Space`；分组为 `Primaries (CIE xy)` 与 `White Point (CIE xy)` | Pass |
| SUB_CS_CUSTOM_0200 | testCreateCustomDefault0001 | 默认创建 | 同上 | 不改输入直接点击创建 | 创建前结果为空；创建后 gamma≈2.2，Primaries 以 `R(0.64,0.33` 开头 | Pass |
| SUB_CS_CUSTOM_0300 | testInvalidPrimariesInput0001 | 负坐标被接受 | 同上 | `InputRedX` 输入 -1 后创建 | 结果回显 `Primaries: R(-1,0.33`，输入框仍显示 `-1`，并出现 `ColorSpaceName:` 行 | Pass |
| SUB_CS_CUSTOM_0400 | testResetAllCoordinates0001 | 重置坐标 | 同上 | 修改坐标后创建，再点击重置 | 创建结果使用编辑值（`R(0.68,0.32`）；重置后输入回到 `0.64`/`0.33` | Pass |
| SUB_CS_CUSTOM_0500 | testCustomReturnInitialState0001 | 重入复位 | 同上 | 离开自定义页再进入 | 标题不变；gamma 显示 `2.20`；`InputRedX` 为 `0.64` | Pass |

### ColorSpaceValueMatrix（标准与扩展按钮渲染矩阵，15 条）

预置条件：首页就绪，已进入标准色域页。预期输出统一为：属性区同时包含 `Type: <label>`、`ColorSpaceName: <平台名称>`、`WhitePoint: <平台白点>`，且 gamma 与平台一致。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_VALUE_0101 | testStandardValue0001 | SRGB 按钮渲染 | 已进入标准色域页 | 点击 `Btn_SRGB` | 属性区含 `Type: SRGB`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0102 | testStandardValue0002 | Display_P3 按钮渲染 | 同上 | 点击对应色域按钮 | 属性区含 `Type: Display_P3`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0103 | testStandardValue0003 | DCI_P3 按钮渲染 | 同上 | 同上 | 属性区含 `Type: DCI_P3`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0104 | testStandardValue0004 | BT2020_HLG 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT2020_HLG`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0105 | testStandardValue0005 | BT2020_PQ 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT2020_PQ`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0106 | testStandardValue0006 | BT709 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT709`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0107 | testStandardValue0007 | Adobe_RGB_1998 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Adobe_RGB_1998`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0108 | testStandardValue0008 | Linear_SRGB 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Linear_SRGB`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0201 | testExtendedValue0001 | BT601_EBU 按钮渲染 | 同上 | 滚动到扩展区后点击 | 属性区含 `Type: BT601_EBU`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0202 | testExtendedValue0002 | BT601_SMPTE_C 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT601_SMPTE_C`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0203 | testExtendedValue0003 | P3_HLG 按钮渲染 | 同上 | 同上 | 属性区含 `Type: P3_HLG`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0204 | testExtendedValue0004 | P3_PQ 按钮渲染 | 同上 | 同上 | 属性区含 `Type: P3_PQ`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0205 | testExtendedValue0005 | Linear_BT2020 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Linear_BT2020`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0206 | testExtendedValue0006 | H_LOG 按钮渲染 | 同上 | 同上 | 属性区含 `Type: H_LOG`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0207 | testExtendedValue0007 | Display_BT2020 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Display_BT2020`、平台名称与平台白点，gamma 一致 | Pass |

### ColorSpaceLimitMatrix（LIMIT 按钮渲染矩阵，11 条）

预置条件与预期输出同上一节，输入为下表对应的 LIMIT 按钮（位于标准色域页最下方的 LIMIT 分组）。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_VALUE_0301 | testLimitValue0001 | Adobe_RGB_Limit 按钮渲染 | 已进入标准色域页 | 点击对应 LIMIT 按钮 | 属性区含 `Type: Adobe_RGB_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0302 | testLimitValue0002 | Display_P3_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Display_P3_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0303 | testLimitValue0003 | SRGB_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: SRGB_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0304 | testLimitValue0004 | BT709_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT709_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0305 | testLimitValue0005 | BT601_EBU_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT601_EBU_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0306 | testLimitValue0006 | BT601_SMPTE_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT601_SMPTE_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0307 | testLimitValue0007 | BT2020_HLG_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT2020_HLG_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0308 | testLimitValue0008 | BT2020_PQ_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: BT2020_PQ_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0309 | testLimitValue0009 | P3_HLG_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: P3_HLG_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0310 | testLimitValue0010 | P3_PQ_Limit 按钮渲染 | 同上 | 同上 | 属性区含 `Type: P3_PQ_Limit`、平台名称与平台白点，gamma 一致 | Pass |
| SUB_CS_VALUE_0311 | testLimitValue0011 | Linear_P3 按钮渲染 | 同上 | 同上 | 属性区含 `Type: Linear_P3`、平台名称与平台白点，gamma 一致 | Pass |

### CustomInputMatrix（八个坐标输入框的输入矩阵，16 条）

预置条件：首页就绪，已进入自定义色域页；默认坐标为 sRGB 三原色与 D65 白点，默认 gamma 为 2.20。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_INPUT_0101 | testCustomInput0001 | 默认输入初值 | 已进入自定义页 | 不输入任何内容，读取八个输入框 | `InputRedX=0.64`、`InputGreenY=0.60`、`InputWhiteY=0.3290` | Pass |
| SUB_CS_INPUT_0102 | testCustomInput0002 | 红 x 非数字回退 | 同上 | `InputRedX=abc` 后创建 | 结果回退为默认三原色与默认白点，并含 `ColorSpaceName:` | Pass |
| SUB_CS_INPUT_0103 | testCustomInput0003 | 红 y 非数字回退 | 同上 | `InputRedY=xyz` 后创建 | 结果回退为默认三原色与默认白点，并含 `ColorSpaceName:` | Pass |
| SUB_CS_INPUT_0104 | testCustomInput0004 | 绿 x 非数字回退 | 同上 | `InputGreenX=???` 后创建 | 结果回退为默认三原色与默认白点，并含 `ColorSpaceName:` | Pass |
| SUB_CS_INPUT_0105 | testCustomInput0005 | 绿 y 数字前缀 | 同上 | `InputGreenY=1abc` 后创建 | 三原色行含 `G(0.3,1)`，白点为默认值，并含 `ColorSpaceName:` | Pass |
| SUB_CS_INPUT_0106 | testCustomInput0006 | 蓝 x 负值 | 同上 | `InputBlueX=-0.5` 后创建 | 结果给出确定结论（接受并回显，或被拒绝），二者必居其一 | Pass |
| SUB_CS_INPUT_0107 | testCustomInput0007 | 蓝 y 超过 1 | 同上 | `InputBlueY=2.5` 后创建 | 结果文本长度大于 10，且接受或拒绝的判断与实际显示一致 | Pass |
| SUB_CS_INPUT_0108 | testCustomInput0008 | 白 x 为 0 | 同上 | `InputWhiteX=0` 后创建 | 结果给出确定结论且仍包含 `Primaries: R(` 行 | Pass |
| SUB_CS_INPUT_0201 | testCustomInput0009 | 纯空格白 y 回退 | 同上 | `InputWhiteY=` 单个空格后创建 | 结果回退为默认白点与默认三原色，并含 `ColorSpaceName:` | Pass |
| SUB_CS_INPUT_0202 | testCustomInput0010 | 科学计数法 | 同上 | `InputRedX=1e-3` 后创建 | 结果文本长度大于 10，且含 `G(0.3,0.6)` 三原色行 | Pass |
| SUB_CS_INPUT_0203 | testCustomInput0011 | 前置空格 | 同上 | `InputGreenX= 0.5` 后创建 | 结果给出确定结论，且含默认 `R(0.64,0.33)` 行 | Pass |
| SUB_CS_INPUT_0204 | testCustomInput0012 | 两个红坐标同时输入 | 同上 | `InputRedX=0.7`、`InputRedY=0.2` 后创建 | 三原色行为 `R(0.7,0.2) G(0.3,0.6) B(0.15,0.06)` | Pass |
| SUB_CS_INPUT_0205 | testCustomInput0013 | 编辑后重置 | 同上 | 修改红 x 与白 y 后重置 | `InputRedX=0.64`、`InputWhiteY=0.3290`，结果区清空 | Pass |
| SUB_CS_INPUT_0206 | testCustomInput0014 | 八框同值 | 同上 | 八个输入框全部填 0.5 后创建 | 三原色行为 `R(0.5,0.5) G(0.5,0.5) B(0.5,0.5)`，白点行为 `(0.5,0.5)` | Pass |
| SUB_CS_INPUT_0207 | testCustomInput0015 | 只输入不创建 | 同上 | 仅设置 `InputRedX=0.7` 不点击创建 | 结果区保持为空；输入框显示 `0.7`；`GammaValue` 仍为 `2.20` | Pass |
| SUB_CS_INPUT_0208 | testCustomInput0016 | 默认 gamma 与滑块一致 | 同上 | 默认输入下创建 | 结果 gamma 与滑块显示值的差小于 0.01，与 2.2 的差小于 0.03，三原色为默认值 | Pass |
### GammaInputTest（gamma 与坐标输入，24 条）

预置条件：首页就绪，已进入自定义色域页；gamma 由 `GammaSlider` 设定，坐标由八个 `Input*` 输入框设定，点击 `BtnCreateCustom` 触发创建。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_GAMMA_0100 | testGammaMinValue0001 | 最小 gamma | 已进入自定义页 | 滑块设为 0.1 后创建 | 显示 `0.10`；结果 `Gamma: ≈0.1`；Primaries 以 `R(0.64,0.33` 开头 | Pass |
| SUB_CS_GAMMA_0200 | testGammaLowValue0001 | 低 gamma | 同上 | 滑块设为 0.5 后创建 | 显示 `0.50`；结果 `Gamma: ≈0.5`；白点输入为 `(0.3127,0.329)` | Pass |
| SUB_CS_GAMMA_0300 | testGammaDefault0001 | 默认 gamma | 同上 | 保持默认 2.2 后创建 | 显示 `2.20`；结果 `Gamma: ≈2.2`；含 `Type: Custom` | Pass |
| SUB_CS_GAMMA_0400 | testGammaMidValue0001 | 中段 gamma | 同上 | 滑块设为 1.5 后创建 | 显示 `1.50`；结果 `Gamma: ≈1.5`；含 `G(0.3,0.6` 行 | Pass |
| SUB_CS_GAMMA_0500 | testGammaStandard0001 | 常规 gamma | 同上 | 滑块设为 2.0 后创建 | 显示 `2.00`；结果 `Gamma: ≈2.0`；含 `B(0.15,0.06` 行 | Pass |
| SUB_CS_GAMMA_0600 | testGammaDciP3Value0001 | DCI P3 量级 gamma | 同上 | 滑块设为 2.6 后创建 | 显示 `2.60`；结果 `Gamma: ≈2.6`；存在 `CustomGamutCanvas` | Pass |
| SUB_CS_GAMMA_0700 | testGammaHighValue0001 | 高 gamma | 同上 | 滑块设为 3.0 后创建 | 显示 `3.00`；结果 `Gamma: ≈3.0`；含 `ColorSpaceName:` 行 | Pass |
| SUB_CS_GAMMA_0800 | testGammaVeryHighValue0001 | 很高 gamma | 同上 | 滑块设为 3.5 后创建 | 显示 `3.50`；结果 `Gamma: ≈3.5`；白点为 `[0.3127, 0.3290]` | Pass |
| SUB_CS_GAMMA_0900 | testGammaMaxValue0001 | 最大 gamma | 同上 | 滑块设为 5.0 后创建 | 显示 `5.00`；结果 `Gamma: ≈5.0`；含 `R(0.64,0.33` 行 | Pass |
| SUB_CS_GAMMA_1000 | testGammaLinearValue0001 | 线性 gamma | 同上 | 滑块设为 1.0 后创建 | 显示 `1.00`；结果 `Gamma: ≈1.0`；含 `Type: Custom` | Pass |
| SUB_CS_GAMMA_1100 | testCustomPrimariesInput0001 | 自定义三原色输入 | 同上 | 输入自定义坐标后点击创建 | `InputRedX=0.68`、`InputGreenY=0.69`；结果含 `Primaries: R(0.68,0.32` | Pass |
| SUB_CS_GAMMA_1200 | testInvalidRedInputFallback0001 | 红 x 非法回退 | 同上 | `InputRedX=invalid`、`InputRedY=0.34` 后创建 | 输入框保留 `invalid`；结果回退为 `R(0.64,0.34`，其余为 `G(0.3,0.6` | Pass |
| SUB_CS_GAMMA_1300 | testInvalidGreenInputFallback0001 | 绿 x 非法回退 | 同上 | `InputGreenX=invalid`、`InputGreenY=0.61` 后创建 | 输入框保留 `invalid`；结果为 `G(0.3,0.61` 与 `R(0.64,0.33` | Pass |
| SUB_CS_GAMMA_1400 | testInvalidBlueInputFallback0001 | 蓝 x 非法回退 | 同上 | `InputBlueX=invalid`、`InputBlueY=0.07` 后创建 | 输入框保留 `invalid`；结果为 `B(0.15,0.07` 与 `G(0.3,0.6` | Pass |
| SUB_CS_GAMMA_1500 | testInvalidWhiteInputFallback0001 | 白 x 非法回退 | 同上 | `InputWhiteX=invalid`、`InputWhiteY=0.34` 后创建 | 结果为 `WhitePoint Input: (0.3127,0.34` 与 `WhitePoint: [0.3127, 0.3400]` | Pass |
| SUB_CS_GAMMA_1600 | testEmptyInputFallback0001 | 空输入回退 | 同上 | `InputRedX` 置空后创建 | 输入框为空；结果含 `R(0.64,0.33`；`Gamma: ≈2.2` | Pass |
| SUB_CS_GAMMA_1700 | testDefaultInputState0001 | 创建前默认态 | 同上 | 读取滑块与红坐标输入框 | `GammaValue=2.20`、`InputRedX=0.64`、`InputRedY=0.33` | Pass |
| SUB_CS_GAMMA_1800 | testResetRestoresInputs0001 | 重置恢复输入 | 同上 | 创建后重置，再输入 0.66 并把滑块设为 3.0 | 创建后 `Gamma: ≈3`；重置后显示 `2.20`、`InputRedX=0.64` | Pass |
| SUB_CS_GAMMA_1900 | testCreateResetCreate0001 | 二次创建取默认值 | 同上 | 创建→重置→再创建，过程中滑块设为 1.5 | 创建后 `Gamma: ≈1.5`；重置后结果为空；二次创建 `Gamma: ≈2.2` | Pass |
| SUB_CS_GAMMA_2000 | testOutOfRangePrimary0001 | 坐标超过 1 | 同上 | `InputRedX=1.2` 后创建 | 结果回显 `Primaries: R(1.2,0.33`，输入框保留 `1.2`，未被拒绝 | Pass |
| SUB_CS_GAMMA_2100 | testNegativeWhitePoint0001 | 负白点 | 同上 | `InputWhiteX=-0.1` 后创建 | 结果回显 `WhitePoint Input: (-0.1,0.329`，输入框保留 `-0.1`，未被拒绝 | Pass |
| SUB_CS_GAMMA_2200 | testWhitespaceInputFallback0001 | 纯空白回退 | 同上 | `InputRedX` 输入三个空格、`InputRedY=0.34` 后创建 | 输入框原样显示空白；结果为 `R(0.64,0.34` 与 `G(0.3,0.6` | Pass |
| SUB_CS_GAMMA_2300 | testNumericPrefixInput0001 | 数字前缀解析 | 同上 | `InputRedX=0.68abc` 后创建 | 输入框保留 `0.68abc`；结果为 `R(0.68,0.33`，白点输入为默认值 | Pass |
| SUB_CS_GAMMA_2400 | testResetAfterCreateError0001 | 异常坐标后重置 | 同上 | 创建→重置→再创建，过程中 `InputRedX=-1` | 创建后结果 `Primaries: R(-1,0.33`；重置后 `InputRedX=0.64` 且结果为空 | Pass |

### SliderBoundary（gamma 滑块边界，8 条）

预置条件：首页就绪，已进入自定义色域页；滑块量程 0.1~5.0、步长 0.1，显示值由 `GammaValue` 输出。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_SLIDER_0101 | testSliderStartValue0001 | 起始值 | 已进入自定义页 | 读取滑块显示与结果区 | 显示 `2.20`；结果区为空；`GammaSlider` 存在 | Pass |
| SUB_CS_SLIDER_0102 | testSliderLowerValue0001 | 下限侧取值 | 同上 | 滑块设为 1.0 后创建 | 显示 `1.00`；结果 gamma≈1.0；含默认三原色 | Pass |
| SUB_CS_SLIDER_0103 | testSliderMiddleValue0001 | 中间取值 | 同上 | 滑块设为 3.0 后创建 | 显示 `3.00`；结果 gamma≈3.0；含 `ColorSpaceName:` | Pass |
| SUB_CS_SLIDER_0104 | testSliderMinimum0001 | 量程最小值 | 同上 | 滑块设为 0.1 后创建 | 显示 `0.10`；结果 gamma≈`GAMMA_MIN`；无 `Error:` 文案 | Pass |
| SUB_CS_SLIDER_0105 | testSliderMaximum0001 | 量程最大值 | 同上 | 滑块设为 5.0 后创建 | 显示 `5.00`；结果 gamma≈`GAMMA_MAX`；无 `Error:` 文案 | Pass |
| SUB_CS_SLIDER_0106 | testSliderStepValue0001 | 步长吸附 | 同上 | 滑块设为 2.3 后创建 | 显示 `2.30`；结果 gamma≈2.3，未吸附到相邻步长；含默认三原色 | Pass |
| SUB_CS_SLIDER_0107 | testSliderResetValue0001 | 重置复位 | 同上 | 滑块设为 3.5 并创建后点击重置 | 创建结果 gamma≈3.5；重置后显示回到起始值且结果区清空 | Pass |
| SUB_CS_SLIDER_0108 | testSliderDisplayMatch0001 | 显示与结果一致 | 同上 | 滑块设为 1.5 后创建 | 显示 `1.50`；结果 gamma 与显示值差小于 0.005；白点输入为默认值 | Pass |

### CompareCombinationTest（色域比较组合，16 条）

预置条件：首页就绪，已进入标准色域页；比较区由色域按钮多选驱动，摘要行以 `Comparing:` 开头。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CMP_0100 | testCompareEmptyDraw0001 | 空选择 | 已进入标准色域页 | 不选择任何色域 | 摘要为空；数据行不存在；表标题为 `Comparison Data` | Pass |
| SUB_CS_CMP_0200 | testCompareSingleSrgb0001 | 单选 | 同上 | 选择 SRGB | 摘要为 `Comparing: SRGB`；生成 1 条数值数据行 | Pass |
| SUB_CS_CMP_0300 | testCompareSrgbDisplayP30001 | 双选 | 同上 | 依次选择 SRGB、Display_P3 | 摘要为 `Comparing: SRGB vs Display_P3`；两行数据均存在 | Pass |
| SUB_CS_CMP_0400 | testCompareDisplayP3DciP30001 | 同族双选 | 同上 | 选择 Display_P3、DCI_P3 | 摘要顺序正确；两行白点与 gamma 数值不同 | Pass |
| SUB_CS_CMP_0500 | testCompareBt2020TransferVariants0001 | 传递函数变体 | 同上 | 选择 BT2020_HLG、BT2020_PQ | 摘要保留两个独立标签；坐标相同而传递函数不同 | Pass |
| SUB_CS_CMP_0600 | testCompareLinearSrgbSrgb0001 | 线性与编码 | 同上 | 选择 Linear_SRGB、SRGB | 摘要为 `Comparing: Linear_SRGB vs SRGB`；两行分别报告 gamma 1 与 gamma 2.2 | Pass |
| SUB_CS_CMP_0700 | testCompareAdobeRgbBt7090001 | 面积差异 | 同上 | 选择 Adobe_RGB_1998、BT709 | 摘要正确；两行色域面积不同 | Pass |
| SUB_CS_CMP_0800 | testCompareTripleOrder0001 | 三选顺序 | 同上 | 依次选择 DCI_P3、SRGB、BT2020_HLG | 摘要为 `Comparing: DCI_P3 vs SRGB vs BT2020_HLG`；三行顺序与选择一致 | Pass |
| SUB_CS_CMP_0900 | testCompareSelectDeselect0001 | 选后取消 | 同上 | 选择 SRGB 后再次点击取消 | 摘要恢复为空；数据行移除；表标题仍在 | Pass |
| SUB_CS_CMP_1000 | testCompareClearSelection0001 | 清空选择 | 同上 | 选择 SRGB 后点击清空 | 清空前摘要为 `Comparing: SRGB` 且有数据行；清空后摘要为空 | Pass |
| SUB_CS_CMP_1100 | testCompareRedrawAddsSelection0001 | 追加选择后重绘 | 同上 | 选择 SRGB 后再选择 Display_P3 | 选择后摘要为 `Comparing: SRGB`，重绘后为 `Comparing: SRGB vs Display_P3` 并新增行 | Pass |
| SUB_CS_CMP_1200 | testCompareExtendedAndLimit0001 | 扩展与 LIMIT 混选 | 同上 | 选择 BT601_EBU、SRGB_Limit | 摘要为 `Comparing: BT601_EBU vs SRGB_Limit`；两行数值行均存在 | Pass |
| SUB_CS_CMP_1300 | testCompareDeselectMiddle0001 | 取消中间项 | 同上 | 选择三项后取消中间项 | 摘要仅保留首尾两项，如 `Comparing: SRGB vs DCI_P3` | Pass |
| SUB_CS_CMP_1400 | testCompareReselectOrder0001 | 重选改变顺序 | 同上 | 取消后重新选择已选项 | 摘要为 `Comparing: Display_P3 vs SRGB`，重选项移至末尾 | Pass |
| SUB_CS_CMP_1500 | testCompareRedrawRemovesSelection0001 | 重绘移除数据行 | 同上 | 双选后取消其中一项并重绘 | 摘要由 `Comparing: SRGB vs Display_P3` 变为 `Comparing: Display_P3`；数据行数为 1 | Pass |
| SUB_CS_CMP_1600 | testCompareClearThenSelect0001 | 清空后重新开始 | 同上 | 清空后选择 DCI_P3 | 清空后摘要为空；再选后摘要为 `Comparing: DCI_P3` 且旧行不残留 | Pass |

### CompareScaleMatrix（比较规模矩阵，8 条）

预置条件：首页就绪，已进入标准色域页；摘要分隔符为 ` vs `，`countSeparators` 用于统计已选数量。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CMP_2001 | testCompareFourSelected0001 | 四选 | 已进入标准色域页 | 依次选择 4 个色域 | 摘要等于期望串且含 3 个分隔符；首行数据存在 | Pass |
| SUB_CS_CMP_2002 | testCompareFiveSelected0001 | 五选 | 同上 | 选择 5 个色域 | 摘要含 4 个分隔符；生成 5 条数据行且首行存在 | Pass |
| SUB_CS_CMP_2003 | testCompareSixSelected0001 | 六选 | 同上 | 选择 6 个色域 | 摘要含 5 个分隔符；6 条数据行保持选择顺序 | Pass |
| SUB_CS_CMP_2004 | testCompareAllStandard0001 | 标准全选 | 同上 | 选择全部 8 个标准色域 | 摘要含 7 个分隔符；每个标签只出现一次；末项可见 | Pass |
| SUB_CS_CMP_2005 | testCompareTwelveSelected0001 | 十二选 | 同上 | 跨标准与扩展区选择 12 个色域 | 摘要含 11 个分隔符；摘要末尾包含第 12 个标签 | Pass |
| SUB_CS_CMP_2006 | testCompareTwelveRows0001 | 十二行数据 | 同上 | 同上 | 每个已选色域对应一行数据，摘要含 11 个分隔符 | Pass |
| SUB_CS_CMP_2007 | testCompareAreaRecompute0001 | 面积独立复算 | 同上 | 选择两个扩展色域 | 摘要正确；两行面积与 `ColorSpaceMath` 独立复算结果一致 | Pass |
| SUB_CS_CMP_2008 | testCompareDeselectPair0001 | 四选后取消两项 | 同上 | 选择 4 个后取消其中 2 个 | 摘要仅保留剩余 2 项；数据行数为 2 | Pass |

### ConcurrencyTest（并发场景页，13 条）

预置条件：首页就绪，进入并发页；页面加载时自动创建 SRGB，日志区每行带时间戳。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CON_0100 | testConcurrencyPageLayout0001 | 页面初始状态 | 已进入并发页 | 读取状态行与两个结果区 | 状态为 `Auto-created SRGB for concurrency tests`；两个结果区分别为 TaskPool/Worker 占位文案 | Pass |
| SUB_CS_CON_0200 | testConTaskPoolRead0001 | TaskPool 读取 | 同上 | 触发 TaskPool 读取 | 状态行不变；结果等于平台真值且为 3 行 | Pass |
| SUB_CS_CON_0300 | testWorkerRead0001 | Worker 读取 | 同上 | 触发 Worker 读取 | 状态行不变；结果等于平台真值且为 3 行 | Pass |
| SUB_CS_CON_0400 | testReferenceVerify0001 | 双通道一致性校验 | 同上 | 连续触发 TaskPool 与 Worker | 两次结果均等于平台真值；无错误文案 | Pass |
| SUB_CS_CON_0500 | testReferenceReplace0001 | 引用替换后校验 | 同上 | 切换 SRGB→DCI_P3 后由同一 Worker 读取 | 结果等于 DCI_P3 平台真值且为 3 行；无错误文案 | Pass |
| SUB_CS_CON_0600 | testTaskPoolAfterSwitchColorSpace0001 | 切换后 TaskPool | 同上 | 切换至 DCI_P3 后读取 TaskPool | 状态为 `Switched to DCI_P3 for concurrency tests`；结果不含 SRGB 名称 | Pass |
| SUB_CS_CON_0700 | testWorkerAfterSwitchColorSpace0001 | 切换后 Worker | 同上 | 切换至 Linear_SRGB 后读取 Worker | 状态为 `Switched to Linear_SRGB for concurrency tests`；结果等于平台真值且为 3 行 | Pass |
| SUB_CS_CON_0800 | testLogTimestampFormat0001 | 日志时间戳 | 同上 | 读取初始日志区 | 初始日志 1 行；每行均有时间戳；首行为 `Page loaded, auto-created SRGB` | Pass |
| SUB_CS_CON_0900 | testLogMaxEntriesTruncate0001 | 日志上限 | 同上 | 连续触发 50 次以上操作 | 达到上限后仍有行渲染、每行都有时间戳，继续操作仍追加行 | Pass |
| SUB_CS_CON_1000 | testBackReturnAccess0001 | 重入复位 | 同上 | 返回首页后再次进入并发页 | 状态与两个结果区恢复为初始占位文案 | Pass |
| SUB_CS_CON_1100 | testReferenceVerifyAfterSwitch0001 | 切换后双通道校验 | 同上 | 切换至 DCI_P3 后连续读取两条通道 | 状态为 `Switched to DCI_P3 for concurrency tests`；结果等于平台真值且为 3 行 | Pass |
| SUB_CS_CON_1200 | testWorkerRepeatedRead0001 | Worker 连续读取 | 同上 | 连续触发两次 Worker 读取 | 两次结果均等于平台真值；日志累计 6 行 | Pass |
| SUB_CS_CON_1300 | testSequentialTaskAndWorker0001 | 先后读取互不覆盖 | 同上 | 先 TaskPool 后 Worker 顺序读取 | TaskPool 结果在 Worker 返回后仍保留；两者各等于平台真值 | Pass |

### ChannelConsistency（双通道逐字段比对，12 条）

预置条件：并发页已就绪并切换至目标色域；TaskPool 与 Worker 均返回 `name`/`whitePoint`/`gamma` 三项字段。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CHAN_0101 | testTaskPoolChannel0001 | SRGB TaskPool | 已切换至 SRGB | 通过 TaskPool 读取属性 | 状态行为 `Switched to SRGB for concurrency tests`；结果与平台逐字段相等 | Pass |
| SUB_CS_CHAN_0102 | testTaskPoolChannel0002 | Display_P3 TaskPool | 已切换至 Display_P3 | 同上 | 结果与平台相等；含 `whitePoint=[0.3127, 0.3290]` | Pass |
| SUB_CS_CHAN_0103 | testTaskPoolChannel0003 | DCI_P3 TaskPool | 已切换至 DCI_P3 | 同上 | 结果与平台相等；含 `whitePoint=[0.3140, 0.3510]` | Pass |
| SUB_CS_CHAN_0104 | testTaskPoolChannel0004 | BT2020_HLG TaskPool | 已切换至 BT2020_HLG | 同上 | 结果与平台相等且为 3 行 | Pass |
| SUB_CS_CHAN_0105 | testTaskPoolChannel0005 | BT2020_PQ TaskPool | 已切换至 BT2020_PQ | 同上 | 结果与平台相等，含 `name=` 字段 | Pass |
| SUB_CS_CHAN_0106 | testTaskPoolChannel0006 | BT709 TaskPool | 已切换至 BT709 | 同上 | 结果与平台相等；白点为 `[0.3127, 0.3290]` | Pass |
| SUB_CS_CHAN_0107 | testTaskPoolChannel0007 | Adobe_RGB_1998 TaskPool | 已切换至 Adobe_RGB_1998 | 同上 | 结果与平台相等，含 `name=` 字段 | Pass |
| SUB_CS_CHAN_0108 | testTaskPoolChannel0008 | Linear_SRGB TaskPool | 已切换至 Linear_SRGB | 同上 | 结果含 `[TaskPool] gamma=1`，线性 gamma 保留 | Pass |
| SUB_CS_CHAN_0201 | testWorkerChannel0001 | SRGB Worker | 已切换至 SRGB | 通过 Worker 读取并校验引用 | 结果与平台相等；校验行含 `Same reference: YES` | Pass |
| SUB_CS_CHAN_0202 | testWorkerChannel0002 | DCI_P3 Worker | 已切换至 DCI_P3 | 同上 | 结果含 `whitePoint=[0.3140, 0.3510]`，且 `Same reference: YES` | Pass |
| SUB_CS_CHAN_0203 | testWorkerChannel0003 | BT2020_HLG Worker | 已切换至 BT2020_HLG | 同上 | 结果与平台相等且为 3 行；共享引用校验为 3 行 | Pass |
| SUB_CS_CHAN_0204 | testWorkerChannel0004 | Linear_SRGB Worker | 已切换至 Linear_SRGB | 同上 | 结果含 `[Worker] gamma=1`，且 `Same reference: YES` | Pass |

### ExceptionTest（异常与边界自检，23 条）

预置条件：首页就绪，进入异常处理页；页面初始提示为 `Click a button below to test error handling`。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_EXC_0100 | testExceptionPageLayout0001 | 页面布局 | 已进入异常页 | 读取标题、结果区与别名区标题 | 标题 `Exception Handling`；初始提示为规定文案；别名区标题 `Enum Alias Verification` | Pass |
| SUB_CS_EXC_0200 | testUnknownEnum0001 | UNKNOWN 枚举 | 同上 | 点击 UNKNOWN 枚举按钮 | 结果等于平台错误描述，仅 1 行，无 `Unexpected` 文案 | Pass |
| SUB_CS_EXC_0300 | testCustomEnum0001 | CUSTOM 枚举缺参 | 同上 | 点击 CUSTOM 枚举按钮 | 报告捕获到的错误，1 行，无 `Unexpected` 文案 | Pass |
| SUB_CS_EXC_0400 | testNegativeGamma0001 | 负 gamma | 同上 | 点击 gamma=-1 按钮 | 平台接受该值，结果回显 `gamma=-1`，未被拒绝 | Pass |
| SUB_CS_EXC_0500 | testZeroGamma0001 | 零 gamma | 同上 | 点击 gamma=0 按钮 | 平台接受该值，结果回显 `gamma=0`，未被拒绝 | Pass |
| SUB_CS_EXC_0600 | testInvalidPrimaries0001 | 越界坐标 | 同上 | 点击越界坐标按钮 | 平台接受并回显 `name=Custom`，未被拒绝 | Pass |
| SUB_CS_EXC_0700 | testEnum401Error0001 | 未定义枚举 999 | 同上 | 点击 enum=999 按钮 | 返回参数错误描述，1 行，无 `Unexpected` 文案 | Pass |
| SUB_CS_EXC_0800 | testNegativeOneEnum0001 | 负枚举 | 同上 | 点击 enum=-1 按钮 | 报告捕获到的错误，1 行，无 `Unexpected` 文案 | Pass |
| SUB_CS_EXC_0900 | testVerifySrgb0001 | SRGB 属性自检 | 同上 | 点击 SRGB 校验按钮 | gamma 行以 `(expect 2.2` 结束；白点行为 `[0.3127, 0.3290] (expect [0.3127, 0.3290]` | Pass |
| SUB_CS_EXC_1000 | testVerifyDciP30001 | DCI_P3 属性自检 | 同上 | 点击 DCI_P3 校验按钮 | gamma 行为 `(expect 2.6`；白点为 `[0.3140, 0.3510] (expect [0.314, 0.351]`；`Overall: ALL PASS` | Pass |
| SUB_CS_EXC_1100 | testVerifyLinearSrgb0001 | Linear_SRGB 自检 | 同上 | 点击 Linear_SRGB 校验按钮 | 首行 `LINEAR_SRGB Property Verification:`；gamma 行为 `(expect 1.0` | Pass |
| SUB_CS_EXC_1200 | testAliasDisplaySrgb0001 | DISPLAY_SRGB 别名 | 同上 | 点击 DISPLAY_SRGB 别名校验 | 结果含 `[MATCH]` 与 `Gamma:` 行；`Overall: ALIAS VERIFIED` | Pass |
| SUB_CS_EXC_1300 | testAliasDisplayP3Srgb0001 | DISPLAY_P3_SRGB 别名 | 同上 | 点击对应别名校验 | 首行 `DISPLAY_P3_SRGB vs DISPLAY_P3 Alias Verification:`；`Overall: ALIAS VERIFIED` | Pass |
| SUB_CS_EXC_1400 | testAliasLinearBt7090001 | LINEAR_BT709 别名 | 同上 | 点击对应别名校验 | 首行 `LINEAR_BT709 vs LINEAR_SRGB Alias Verification:`；`Overall: ALIAS VERIFIED` | Pass |
| SUB_CS_EXC_1500 | testExcRepeatCreate0001 | 重复创建稳定性 | 同上 | 用同一枚举创建两个管理器并比对 | `Repeat check: gamma=MATCH wp=MATCH name=MATCH`；`Overall: STABLE`；共 3 行 | Pass |
| SUB_CS_EXC_1600 | testExcWhitePointShape0001 | 白点形状 | 同上 | 读取 SRGB、DCI_P3、BT2020_HLG 白点长度 | `WP shapes: SRGB=2 DCI_P3=2 BT2020_HLG=2`；`Overall: ALL LENGTH 2`；共 2 行 | Pass |
| SUB_CS_EXC_1700 | testExcGammaRange0001 | 标准空间 gamma 区间 | 同上 | 遍历 8 个标准空间 gamma | 最小值≥1.0 且≤3.0；最大值大于最小值且≤3.0；幂函数与非幂函数共 8 项 | Pass |
| SUB_CS_EXC_1800 | testExcCustomRoundTrip0001 | 自定义往返 | 同上 | 以 2.4 gamma 创建自定义色域 | 结果为 `gamma=2.4`、`match=MATCH`、`Overall: ROUND TRIP OK` | Pass |
| SUB_CS_EXC_1900 | testExcErrorCodeShape0001 | 错误码形状 | 同上 | 触发非法枚举 | 抛出错误码大于 0 且为 401 或 18600001；结果为 `numeric=YES` | Pass |
| SUB_CS_EXC_2000 | testExcRecoveryAfterError0001 | 错误后恢复 | 同上 | 非法枚举失败后再创建 SRGB | gamma 在 1.0~3.0 之间；`name=SRGB`；`Overall: RECOVERED` | Pass |
| SUB_CS_EXC_2100 | testExcCustomGammaOne0001 | 线性边界 gamma | 同上 | 以 gamma 1.0 创建自定义色域 | `linear=[PASS]`；`Overall: LINEAR OK`；共 2 行 | Pass |
| SUB_CS_EXC_2200 | testExcP3LimitPair0001 | 全范围与 LIMIT 成对 | 同上 | 比对 P3 与 P3_Limit 的 gamma 与白点 | 两者 gamma 差小于 1e-6；gamma 在 1.0~3.0 之间；结果为 `] MATCH` | Pass |
| SUB_CS_EXC_2300 | testExcClearResult0001 | 清除结果 | 同上 | 触发一次异常后点击清除 | 清除前结果以 `UNKNOWN enum:` 开头；清除后回到初始提示，旧结果不残留 | Pass |
### ExceptionButtonTest（异常按钮序列，2 条）

预置条件：首页就绪，进入异常处理页；连续点击不同异常按钮时结果区只保留最后一次输出。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_EXCB_0100 | testExceptionButtonSequence0001 | 连续异常覆盖 | 已进入异常页 | 依次点击 UNKNOWN 枚举、越界坐标按钮 | 前者为 `UNKNOWN enum: Caught expected error`；后者覆盖前者并回显 `name=Custom` | Pass |
| SUB_CS_EXCB_0200 | testExceptionButtonRecovery0001 | 错误后恢复 | 同上 | 先点击 enum=999，再点击 SRGB 属性校验 | 错误行含 `(401/18600001`；恢复行为完整属性摘要；旧错误不残留 | Pass |

### ExceptionOutcome（按钮实际结果，9 条）

预置条件：首页就绪，进入异常处理页。用例不断言“必须抛错”，而是把页面的实际结论与平台真值比对：接受时须出现 `Unexpected success`，拒绝时须出现 `Caught expected error`。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_EXC_0101 | testUnknownEnumOutcome0001 | UNKNOWN 枚举结论 | 已进入异常页 | 点击 UNKNOWN 枚举按钮 | 以 `UNKNOWN enum: ` 开头，且错误/成功文案与平台是否接受严格对应 | Pass |
| SUB_CS_EXC_0102 | testCustomEnumOutcome0001 | CUSTOM 枚举结论 | 同上 | 点击 CUSTOM 枚举按钮 | 以 `CUSTOM enum: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0103 | testNegativeGammaOutcome0001 | gamma=-1 结论 | 同上 | 点击 gamma -1.0 按钮 | 以 `Gamma=-1.0: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0104 | testZeroGammaOutcome0001 | gamma=0 结论 | 同上 | 点击 gamma 0 按钮 | 以 `Gamma=0: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0105 | testInvalidPrimariesOutcome0001 | 越界坐标结论 | 同上 | 点击越界坐标按钮 | 以 `Invalid primaries: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0106 | testEnum999Outcome0001 | enum=999 结论 | 同上 | 点击 enum 999 按钮 | 以 `Enum=999: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0107 | testEnumNegativeOneOutcome0001 | enum=-1 结论 | 同上 | 点击 enum -1 按钮 | 以 `Enum=-1: ` 开头，文案与平台结论一致 | Pass |
| SUB_CS_EXC_0108 | testSrgbPropertySummary0001 | SRGB 属性摘要 | 同上 | 点击 SRGB 属性校验按钮 | 以 `SRGB Property Verification:` 开头，含平台真值摘要与 `Name:` 字段 | Pass |
| SUB_CS_EXC_0109 | testLinearSrgbGammaSummary0001 | Linear_SRGB gamma 摘要 | 同上 | 点击 LINEAR_SRGB gamma 校验按钮 | 以 `LINEAR_SRGB Property Verification:` 开头，含平台 gamma 与 `Gamma: ` 字段 | Pass |

### ChromaticityDiagramTest（色度图页面，12 条）

预置条件：首页就绪，由 `SharedDriver.navigateToChromaticity` 进入色度图页；页面含 26 个色域按钮、参考叠加开关、探针输入与 `ChromCanvas` 画布。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CHROM_0001 | testChromNavigate0001 | 进入页面 | 首页就绪 | 从首页进入色度图页 | 标题 `CIE Chromaticity Diagram`；摘要 `Spaces:26 Selected:SRGB`；`ChromCanvas` 存在 | Pass |
| SUB_CS_CHROM_0002 | testChromDefaultArea0001 | 默认面积与覆盖 | 已进入色度图页 | 读取默认 sRGB 面积行 | `Area:0.1121 Ratio:1.000 Covers:YES`，面积与 0.1121 差小于 0.0002 | Pass |
| SUB_CS_CHROM_0003 | testChromSelectP30001 | 切换 Display_P3 | 同上 | 点击 `ChromSpace_Display_P3` | 摘要 `Selected:Display_P3`；面积 `0.1520`；比值 `1.357`；`Covers:YES` | Pass |
| SUB_CS_CHROM_0004 | testChromSelectBT20200001 | 切换 BT2020 | 同上 | 点击 `ChromSpace_BT2020_HLG` | 面积 `0.2119`、比值 `1.891`，比值大于 1.8 且仍覆盖 sRGB | Pass |
| SUB_CS_CHROM_0005 | testChromNarrowCoverage0001 | 窄色域不覆盖 | 同上 | 点击 `ChromSpace_BT601_SMPTE_C` | 面积 `0.1038`、比值 `0.926`（小于 1）、`Covers:NO` | Pass |
| SUB_CS_CHROM_0006 | testChromWhitePoint0001 | 白点偏移 | 同上 | 依次点击 DCI_P3 与 BT709 | DCI_P3 白点为 `x:0.3140 y:0.3510 DistD65:0.0220`（大于 0.02）；BT709 恢复 `DistD65:0.0000` | Pass |
| SUB_CS_CHROM_0007 | testChromReferenceToggle0001 | 参考叠加开关 | 同上 | 连续点击 `ChromBtnCompare` 两次 | 初始 `Reference:OFF`，第一次 `ON`，第二次回到 `OFF` | Pass |
| SUB_CS_CHROM_0008 | testChromProbeInside0001 | 探针在内部 | 同上 | 读取默认探针后切换到 Display_P3 | 默认为 `Point x:0.3127 y:0.3290 Inside:YES`；P3 下仍为 `Inside:YES` 且 x 值不变 | Pass |
| SUB_CS_CHROM_0009 | testChromProbeOutside0001 | 探针在外部 | 同上 | 点击 `ChromBtnLocate` 后输入 (0.7, 0.25) | `Point x:0.7000 y:0.2500 Inside:NO`，x 与 0.7 差小于 0.0001 | Pass |
| SUB_CS_CHROM_0010 | testChromProbeInvalid0001 | 越界坐标被拒绝 | 同上 | 再次打开定位，输入 1.5 后再输入 0.3127 | 先提示 `Point invalid: enter numbers in 0..1`（不含 `Inside:`）；改回后恢复 `Inside:YES` | Pass |
| SUB_CS_CHROM_0011 | testChromReset0001 | 重置 | 同上 | 依次切换 BT2020、开参考、开定位、重置 | 摘要回到 `Selected:SRGB`；面积 `0.1121/1.000/Covers:YES`；`Reference:OFF` | Pass |
| SUB_CS_CHROM_0012 | testChromBack0001 | 返回首页 | 同上 | 点击 `ChromBtnBack` | 首页标题出现，色度图标题与 `NavChromaticity` 均从当前栈移除 | Pass |

### ColorDifferenceTest（色差页面，15 条）

预置条件：首页就绪，由 `SharedDriver.navigateToDifference` 进入色差页；页面含色域 chips、6 个预设、3 个滑块、3 个指标（ΔE76/94/2000）与判定分档。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_DIFF_0001 | testDiffNavigate0001 | 进入页面 | 首页就绪 | 从首页进入色差页 | 标题 `Color Difference`；`Space:SRGB`；`Preset:White/Black` | Pass |
| SUB_CS_DIFF_0002 | testDiffDefaultDelta0001 | 默认黑白差 | 已进入色差页 | 读取默认色差行 | `dE76:100.000 dE94:100.000 dE2000:100.000`，两值与 100 的差小于 0.01 | Pass |
| SUB_CS_DIFF_0003 | testDiffIdentical0001 | 同色零差 | 同上 | 点击 `DiffPreset4` | `Preset:Identical`；三项指标均为 0.000；两色字节串相同 | Pass |
| SUB_CS_DIFF_0004 | testDiffPresetGrayStep0001 | 灰阶步进 | 同上 | 点击 `DiffPreset1` | 预览为 `A:(128, 128, 128` 与 `B:(160, 160, 160`；ΔE76 大于 8 | Pass |
| SUB_CS_DIFF_0005 | testDiffPresetNearRed0001 | 近红步进 | 同上 | 点击 `DiffPreset2` | 预览为 `A:(200, 30, 40`；ΔE2000 大于 0 且小于 ΔE76 | Pass |
| SUB_CS_DIFF_0006 | testDiffPresetBlueStep0001 | 蓝阶步进 | 同上 | 点击 `DiffPreset3` | 预览为 `B:(0, 0, 250`；ΔE76 大于 0 且小于 6 | Pass |
| SUB_CS_DIFF_0007 | testDiffPresetYellowGreen0001 | 对立色相 | 同上 | 点击 `DiffPreset5` | `Preset:YellowGreen`；ΔE2000 大于 10；`Verdict:Obvious` | Pass |
| SUB_CS_DIFF_0008 | testDiffSwapSymmetry0001 | 交换对称 | 同上 | 点击 `DiffPreset2` 后点击 `DiffBtnSwap` | 交换前后色差值相等；两预览互换为 `A:(205, 40, 45` 与 `B:(200, 30, 40` | Pass |
| SUB_CS_DIFF_0009 | testDiffSpaceChange0001 | 切换色域 | 同上 | 点击 `DiffPreset2` 后点击 `DiffSpace_BT2020_HLG` | `Space:BT2020_HLG`；同一字节的色差与 sRGB 下不同，差值大于 0.01 | Pass |
| SUB_CS_DIFF_0010 | testDiffSliderChange0001 | 拖动滑块 | 同上 | `DiffSliderR` 设为 64 | 显示 `64`；预览以 `A:(64,` 开头；色差随之改变 | Pass |
| SUB_CS_DIFF_0011 | testDiffSliderZero0001 | 三通道归零 | 同上 | 三个滑块均设为 0 | 预览为 `A:(0, 0, 0`；三项指标均为 0.000；`Verdict:Imperceptible` | Pass |
| SUB_CS_DIFF_0012 | testDiffVerdictBands0001 | 判定分档 | 同上 | 逐个遍历 6 个预设并读取判定 | 6 个预设的判定与其 ΔE2000 分档一一对应，且至少出现一次 `Imperceptible` | Pass |
| SUB_CS_DIFF_0013 | testDiffLabText0001 | Lab 文本 | 同上 | 点击 `DiffPreset2` 后读取 Lab 块 | 以 `LabA:L=100.00` 开头、以 `LabB:L=0.00 a=0.00 b=0.00` 结尾；切换预设后内容同步更新 | Pass |
| SUB_CS_DIFF_0014 | testDiffReset0001 | 重置 | 同上 | 切换预设与色域后点击重置 | `Space:SRGB`；`Preset:White/Black`；三项指标恢复 100.000 | Pass |
| SUB_CS_DIFF_0015 | testDiffBack0001 | 返回首页 | 同上 | 点击 `DiffBtnBack` | 首页标题出现，色差页标题与 `NavDifference` 均从当前栈移除 | Pass |

### ColorConversionTest（色彩转换页面，14 条）

预置条件：首页就绪，由 `SharedDriver.navigateToConversion` 进入转换页；默认源色域 SRGB、目标色域 Display_P3、测试色为红色。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_CONV_0001 | testConvNavigate0001 | 进入页面 | 首页就绪 | 从首页进入转换页 | 标题 `Color Space Conversion`；`Source:SRGB`；`Destination:Display_P3` | Pass |
| SUB_CS_CONV_0002 | testConvIdentity0001 | 同空间恒等 | 已进入转换页 | 点击 `ConvDst_SRGB` | `Destination:SRGB`；`Encoded:(255, 0, 0`；`Status:InGamut` | Pass |
| SUB_CS_CONV_0003 | testConvXyz0001 | XYZ 输出 | 同上 | 读取 XYZ 行 | `X≈0.4124`、`Y≈0.2126`、`Z≈0.0193`，误差均小于 0.001 | Pass |
| SUB_CS_CONV_0004 | testConvLab0001 | Lab 输出 | 同上 | 读取 Lab 行 | `L≈53.24`、`a≈80.09`、`b≈67.20`，误差在 0.6~0.8 以内 | Pass |
| SUB_CS_CONV_0005 | testConvWhite0001 | 白色保持 | 同上 | 点击 `ConvColor3` | `Input:#ffffff`；`Encoded:(255, 255, 255`；`Status:InGamut` | Pass |
| SUB_CS_CONV_0006 | testConvGray0001 | 中性灰保持 | 同上 | 点击 `ConvColor4` | `Input:#808080`；红绿分量与 128 的差不超过 1 | Pass |
| SUB_CS_CONV_0007 | testConvRedToP30001 | sRGB 红进 P3 | 同上 | 保持默认红与 P3 目标并读取编码值 | `Status:InGamut`；红通道≈233（差小于 2）且小于 255 | Pass |
| SUB_CS_CONV_0008 | testConvRedToBT20200001 | sRGB 红进 BT2020 | 同上 | 点击 `ConvDst_BT2020_HLG` | `Destination:BT2020_HLG`；`Status:InGamut`；红通道≈206（差小于 2） | Pass |
| SUB_CS_CONV_0009 | testConvOutOfGamut0001 | 越界检测 | 同上 | 源切 BT2020、目标切 SRGB | `Status:OutOfGamut`；红通道≈321（差小于 3）且大于 255 | Pass |
| SUB_CS_CONV_0010 | testConvClipGreen0001 | 绿通道限幅 | 同上 | 源 BT2020、目标 SRGB、选择绿色 | `Status:OutOfGamut`；`Clipped:(0, 255, 0`；绿通道≈270（差小于 3） | Pass |
| SUB_CS_CONV_0011 | testConvSwap0001 | 交换色域 | 同上 | 点击 `ConvBtnSwapSpaces` | `Source:Display_P3`、`Destination:SRGB`；交换后编码值与交换前相同 | Pass |
| SUB_CS_CONV_0012 | testConvColorPreset0001 | 橙色预设 | 同上 | 目标切 SRGB 后点击 `ConvColor5` | `Input:#ff8000`；`Encoded:(255, 128, 0`；`Status:InGamut` | Pass |
| SUB_CS_CONV_0013 | testConvReset0001 | 重置 | 同上 | 切换源、目标与测试色后点击 `ConvBtnReset` | `Source:SRGB`、`Destination:Display_P3`、`Input:#ff0000` 全部恢复 | Pass |
| SUB_CS_CONV_0014 | testConvBack0001 | 返回首页 | 同上 | 点击 `ConvBtnBack` | 首页标题出现，转换页标题与 `NavConversion` 均从当前栈移除 | Pass |

### ConcurrencyBenchmarkTest（并发基准页面，10 条）

预置条件：首页就绪，由 `SharedDriver.navigateToBenchmark` 进入基准页；固定迭代次数 200，三条通道为 Local、TaskPool、Worker。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_BENCH_0001 | testBenchNavigate0001 | 进入页面 | 首页就绪 | 从首页进入基准页 | 标题 `Concurrency Benchmark`；`Iterations:200`；`Status:Ready` | Pass |
| SUB_CS_BENCH_0002 | testBenchLocal0001 | 本地通道 | 已进入基准页 | 点击 `BenchBtnRunLocal` | 报告含 `samples=200` 与 `name=SRGB`；耗时大于等于 0 | Pass |
| SUB_CS_BENCH_0003 | testBenchTaskPool0001 | TaskPool 通道 | 同上 | 点击 `BenchBtnRunTaskPool` | 报告含 `samples=200`、`name=SRGB`，gamma 与平台一致 | Pass |
| SUB_CS_BENCH_0004 | testBenchWorker0001 | Worker 通道 | 同上 | 点击 `BenchBtnRunWorker` | 报告含 `roundTrips=200` 与 `name=SRGB`；耗时大于等于 0 | Pass |
| SUB_CS_BENCH_0005 | testBenchRunAll0001 | 三通道全跑 | 同上 | 点击 `BenchBtnRunAll` | 三条报告同时填充：`samples=200`、`samples=200`、`roundTrips=200` | Pass |
| SUB_CS_BENCH_0006 | testBenchSummary0001 | 汇总最快通道 | 同上 | 点击 `BenchBtnRunAll` 后读取汇总行 | 汇总行等于期望串；最快通道为 Local/TaskPool/Worker 之一；最优耗时大于等于 0 | Pass |
| SUB_CS_BENCH_0007 | testBenchRepeatable0001 | 重复测量 | 同上 | 连续点击两次 `BenchBtnRunLocal` | 第二次报告仍含 `samples=200`；两次耗时均大于等于 0 | Pass |
| SUB_CS_BENCH_0008 | testBenchGammaConsistency0001 | 三通道 gamma 一致 | 同上 | 点击 `BenchBtnRunAll` 后比对 gamma | 本地、TaskPool、Worker 三值两两差小于 0.0001，且等于平台 gamma | Pass |
| SUB_CS_BENCH_0009 | testBenchReset0001 | 重置 | 同上 | 先跑本地通道再点击 `BenchBtnReset` | `Status:Ready`；汇总为 `Fastest:none Total:0`；本地报告清空 | Pass |
| SUB_CS_BENCH_0010 | testBenchBack0001 | 返回首页 | 同上 | 点击 `BenchBtnBack` | 首页标题出现，基准页标题与 `NavBenchmark` 均从当前栈移除 | Pass |

### ColorSpaceReportTest（色域报表页面，8 条）

预置条件：首页就绪，由 `SharedDriver.navigateToReport` 进入报表页；共 26 行，默认按面积降序，支持标准/扩展/LIMIT 三种过滤。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_CS_REPORT_0001 | testReportNavigate0001 | 进入页面 | 首页就绪 | 从首页进入报表页 | 标题 `Color Space Report`；`Rows:26 Filter:All`；汇总含 `Widest:BT2020_HLG(0.2119)` | Pass |
| SUB_CS_REPORT_0002 | testReportDefaultOrder0001 | 默认排序 | 已进入报表页 | 读取首行 | 首行以 `1 BT2020_HLG ` 开头，含 `area=0.2119` 与 `ratio=1.891` | Pass |
| SUB_CS_REPORT_0003 | testReportAscending0001 | 升序切换 | 同上 | 点击 `ReportBtnSort` | 按钮文案变为 `Narrow first`；首行以 `1 BT601_SMPTE_C ` 开头并含 `area=0.1038` | Pass |
| SUB_CS_REPORT_0004 | testReportStandardOnly0001 | 标准过滤 | 同上 | 点击 `ReportFilterStandard` | `Rows:8 Filter:Standard`；汇总最宽为 BT2020_HLG；最窄含 `(0.1121)` | Pass |
| SUB_CS_REPORT_0005 | testReportExtendedOnly0001 | 扩展过滤 | 同上 | 点击 `ReportFilterExtended` | `Rows:7 Filter:Extended`；最宽 `Display_BT2020(0.2119)`；最窄 `BT601_SMPTE_C(0.1038)` | Pass |
| SUB_CS_REPORT_0006 | testReportLimitOnly0001 | LIMIT 过滤 | 同上 | 点击 `ReportFilterLimit` | `Rows:11 Filter:Limit`；最宽 `BT2020_HLG_Limit(0.2119)`；最窄 `BT601_SMPTE_Limit(0.1038)` | Pass |
| SUB_CS_REPORT_0007 | testReportReset0001 | 重置 | 同上 | 先过滤 LIMIT 再点击 `ReportBtnReset` | 过滤前为 `Rows:11 Filter:Limit`；重置后 `Rows:26 Filter:All`；总面积与 `TOTAL_AREA` 差小于 0.001 | Pass |
| SUB_CS_REPORT_0008 | testReportBack0001 | 返回首页 | 同上 | 点击 `ReportBtnBack` | 首页标题与报表入口可见，报表页标题消失 | Pass |

### UtilsSuite01~UtilsSuite15（工具类与纯函数，1500 条）

这 15 个套件不驱动 UI，只通过 `import` 直接调用 main 侧实现，逐例落地为三个动作：构造入参 → 调用被测方法 → 三条断言（值相等、序列化形态一致、重调幂等）。为避免将 1500 条全部展开成表格，下表按套件给出用例命名段与覆盖要点，逐条明细可直接看套件源码。

| 套件 | 编号区间 | 用例名 | 覆盖要点 | 真机结果 |
|---|---|---|---|---|
| UtilsSuite01 | `SUB_CS_UTIL_0001~0004` | `testUtilsLogger0001~0004` | Logger 的四个级别均可接受零参、单参、空串与长文本调用 | 4 Pass |
| UtilsSuite02 | `SUB_CS_UTIL_GEO_0001~0013` | `testGamutUtils0001~0013` | 面积、白点距离、相对面积、包含判定、矩阵乘法与逆、rgbToXyz 与 D65 常量 | 13 Pass |
| UtilsSuite03 | `SUB_CS_UTIL_NUM_0001~0019` | `testNumberUtils0001~0019` | ΔE76/94/2000、可感知度、限幅、字节往返、带符号字节、十六进制与文本格式化 | 19 Pass |
| UtilsSuite04 | `SUB_CS_UTIL_S04_0001~0112` | `testUtilsSuite04CaseNNNN` | StringUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite05 | `SUB_CS_UTIL_S05_0001~0112` | `testUtilsSuite05CaseNNNN` | ArrayUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite06 | `SUB_CS_UTIL_S06_0001~0112` | `testUtilsSuite06CaseNNNN` | NumberUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite07 | `SUB_CS_UTIL_S07_0001~0112` | `testUtilsSuite07CaseNNNN` | MathUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite08 | `SUB_CS_UTIL_S08_0001~0112` | `testUtilsSuite08CaseNNNN` | ConvertUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite09 | `SUB_CS_UTIL_S09_0001~0128` | `testUtilsSuite09CaseNNNN` | DateUtils 的 16 个方法 × 8 条池化输入（UTC 基准） | 128 Pass |
| UtilsSuite10 | `SUB_CS_UTIL_S10_0001~0136` | `testUtilsSuite10CaseNNNN` | ValidateUtils 的 17 个方法 × 8 条池化输入 | 136 Pass |
| UtilsSuite11 | `SUB_CS_UTIL_S11_0001~0128` | `testUtilsSuite11CaseNNNN` | StringFormatter 的 16 个方法 × 8 条池化输入 | 128 Pass |
| UtilsSuite12 | `SUB_CS_UTIL_S12_0001~0112` | `testUtilsSuite12CaseNNNN` | ColorUtils 的 14 个方法 × 8 条池化输入 | 112 Pass |
| UtilsSuite13 | `SUB_CS_UTIL_S13_0001~0128` | `testUtilsSuite13CaseNNNN` | IdUtils 的 16 个方法 × 8 条池化输入 | 128 Pass |
| UtilsSuite14 | `SUB_CS_UTIL_S14_0001~0128` | `testUtilsSuite14CaseNNNN` | ObjectUtils 的 16 个方法 × 8 条池化输入（有序 Map） | 128 Pass |
| UtilsSuite15 | `SUB_CS_UTIL_S15_0001~0144` | `testUtilsSuite15CaseNNNN` | RandomUtils 的 18 个方法 × 8 条池化输入（种子确定） | 144 Pass |
| **小计** | | | **219 个方法 / 1500 条用例** | **1500 Pass** |

池化输入的取法：每个方法预先写定 8 条字面量，覆盖正常值、空值、非法值、极值与边界。以 `DateUtils` 为例，8 条时间戳覆盖 `2024-01-01T00:00:00Z`、`2024-02-29T12:34:56Z`、`2023-12-31T23:59:59Z`、`2000-02-29`、`2023-01-01`、`2024-04-01`、`1969-12-31T23:59:59Z` 与 `2025-01-01T00:00:00Z`；闰年与月初月末均由 oracle 直接写出，不依赖设备时区。

## SharedDriver 封装说明

[SharedDriver.ets](entry/src/ohosTest/ets/testkit/SharedDriver.ets) 共导出 57 个函数与 1 个 `ColorSpaceFacts` 接口，是本工程唯一的测试基础设施。所有套件只调用它，不在用例文件内直接操作 `Driver`。按职责分为九组：

| 分组 | 导出函数 | 用途 |
|---|---|---|
| 应用与页面生命周期 | `getDriver`、`startApp`、`wakeScreen`、`resetToIndex` | 懒加载 `Driver`；按 `com.samples.sendablecolorspace`/`EntryAbility` 拉起主 HAP；检测并上滑解锁锁屏；每例结束回到首页 |
| 组件定位 | `waitId`、`waitText`、`findComponent`、`requireComponent`、`scrollToId`、`scrollIntoView`、`scrollPageToTop`、`scrollPageToBottom`、`existsId`、`existsText`、`existsTextByScrollingDown`、`listHasTextBySwiping`、`existsTextStartingWith`、`visibleTexts`、`findVisibleTextContains` | 先短超时探测可视组件，再用 `List`/`Grid`/`Scroll` 的 `scrollSearch` 查找，失败后回到页首重试，最后按组件类型滚动补足偏移使其完全可见 |
| 交互 | `clickId`、`clickScrolledId`、`clickRepeatedly`、`inputText`、`setSliderValue`、`pressBack`、`delay` | 点击前先等待组件可点；滑块按步长回读并最多纠正 8 次；输入框先清空再键入 |
| 文本读取 | `textOfId`、`textOrEmpty`、`waitTextContains`、`visibleLogEntries`、`allRowsTimestamped` | 读取组件文本；对不存在的组件返回空串；抓取日志区行并校验时间戳 |
| 用例外壳 | `runCase`、`addLog` | `runCase` 统一执行“唤醒屏幕 → 启动应用 → 执行用例 → 收尾”，`addLog` 在每条断言前输出一行带 `[Sample_SendableColorSpace]` 标签的日志 |
| 断言工具 | `matchesLocalizedText`、`numberAfter`、`isCloseTo`、`verdict`、`overallText`、`gammaMatches`、`assertGammaMatches`、`assertWhitePointMatches` | 兼容中英文标题；从 `Area:` 等键名后取数；容差比较；生成 `MATCH`/`DIFF` 判定串 |
| 平台真值拼装 | `factsOf`、`gammaText`、`standardInfoText`、`standardTaskPoolText`、`channelResultText`、`referenceResultText` | 用 `colorSpaceManager`/`sendableColorSpaceManager` 现场查询 gamma 与白点，拼出与页面同格式的期望字符串 |
| 页面导航 | `navigateToStandard`、`navigateToCustom`、`navigateToConcurrency`、`navigateToException`、`navigateToChromaticity`、`navigateToDifference`、`navigateToConversion`、`navigateToBenchmark`、`navigateToReport` | 从首页进入九个功能页，入口 ID 与首页按钮一一对应 |
| 调试 | `dumpVisibleState` | 失败时把当前可见文本与组件状态输出到 hilog，便于定位 |

关键实现约定：

- 日志常量 `DOMAIN = 0xF811`、`TAG = '[Sample_SendableColorSpace]'`，全部测试日志走 `hilog`，可用 `hdc shell hilog -T Sample` 过滤。
- `INDEX_TITLE_ID = 'TitleText'`，`PAGE_BACK_IDS` 汇总九个页面的返回按钮，`resetToIndex` 依赖这两组常量判定当前栈位置。
- 期望值不写死为文档常量：凡是能通过平台查询的属性（gamma、白点、名称）都由 `factsOf`/`gammaMatches` 现场取值比较，只有色彩学常量（面积、XYZ、Lab）才使用容差比对的公开数值。

## 构建验证

主模块与测试模块分别构建，两次均为 `BUILD SUCCESSFUL`：

```bash
node <DevEcoStudio>/tools/hvigor/bin/hvigorw.js --mode module -p module=entry@default -p product=default assembleHap --no-daemon
node <DevEcoStudio>/tools/hvigor/bin/hvigorw.js --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

| 项目 | 值 |
|---|---|
| 主 HAP | `entry/build/default/outputs/default/entry-default-signed.hap` |
| 测试 HAP | `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap` |
| 应用包名 | `com.samples.sendablecolorspace` |
| 主模块名 | `entry` |
| 测试模块名 | `entry_test` |

## 用例设计说明

**编号规范**：`SUB_CS_<域>_<序号>`，域为该套件覆盖的能力面，序号在同一域内唯一。

| 域 | 含义 | 域 | 含义 |
|---|---|---|---|
| `DATA` | 色域元数据与枚举映射 | `CUSTOM` | 自定义色域页布局与创建 |
| `NAME` | 名称分支 | `VALUE` | 按钮属性渲染矩阵 |
| `INDEX` | 首页文案与跳转 | `INPUT` | 坐标输入矩阵 |
| `NAV_FLOW` / `NAV_STATE` | 跨页流程与重入复位 | `GAMMA` / `SLIDER` | gamma 输入与滑块边界 |
| `MATH` | 色彩学算法 | `CMP` | 色域比较组合与规模 |
| `PROP` | 26 个色域独立属性 | `CON` / `CHAN` | 并发页面与双通道一致性 |
| `API` | 并发通道属性 | `EXC` / `EXCB` | 异常处理与结果覆盖 |
| `STD` | 标准色域页 | `CHROM` / `DIFF` / `CONV` | 色度图、色差、转换页 |
| `BENCH` / `REPORT` | 并发基准与色域报表 | `UTIL` | 工具类与纯函数 |

**日志规范**：每个 `expect` 的前一行必须出现一次 `addLog`，用于把当时的输入、实际值与期望值写入 hilog；失败时按日志即可复现。

**断言规范**：每例不少于 3 条强断言，且至少覆盖“存在性 + 数值/文本 + 副作用”三类；涉及平台属性的一律与 `factsOf` 现场取值比对，涉及数学结果的按公开常量加容差比对。

**覆盖矩阵**：

| 层次 | 覆盖内容 | 对应套件 |
|---|---|---|
| 数据层 | 26 个色域元数据、三组边界、枚举别名、`@Sendable` 结果构造 | ColorSpaceDataLogic、ColorSpaceNameBranch |
| 平台层 | 26 个色域独立创建与属性查询、TaskPool/Worker 双通道一致性 | ColorSpacePropertyTest、ApiPropertyTest、ChannelConsistency |
| 算法层 | 面积、包含判定、矩阵、传递函数、Lab、ΔE76/94/2000、转换与字节工具 | ColorMathTest |
| 交互层 | 九个页面布局、入口跳转、返回栈、重入复位 | IndexPageTest、NavigationFlowTest、NavigationStateTest、StandardColorSpaceTest、CustomColorSpaceTest |
| 输入层 | 坐标输入合法/非法/极值/空白/科学计数、gamma 全区间与滑块边界 | CustomInputMatrix、GammaInputTest、SliderBoundary |
| 组合层 | 0~12 个色域比较、顺序、取消、清空、面积复算 | CompareCombinationTest、CompareScaleMatrix、ColorSpaceValueMatrix、ColorSpaceLimitMatrix |
| 并发层 | 页面状态、日志上限、引用替换、三通道基准与最快路径 | ConcurrencyTest、ConcurrencyBenchmarkTest |
| 异常层 | 非法枚举、非法 gamma、越界坐标、错误码形状、错误后恢复 | ExceptionTest、ExceptionButtonTest、ExceptionOutcome |
| 演示页 | 色度图面积/覆盖/白点/探针、色差分档、转换越界、报表排序与过滤 | ChromaticityDiagramTest、ColorDifferenceTest、ColorConversionTest、ColorSpaceReportTest |
| 工具层 | 日志、色域几何、ΔE 与字节转换、字符串、数组、数值、数学、解析、日期、校验、格式化、色彩、标识、有序 Map、确定性随机 | UtilsSuite01~UtilsSuite15 |

**分类统计**：

| 用例等级 | 用例数 |
|---|---|
| Level0 | 183 |
| Level1 | 1642 |
| **合计** | **1825** |

## 执行说明

1. 确认设备在线：`hdc list targets`，输出中应出现目标设备序列号。
2. 安装主 HAP 与测试 HAP（顺序不限，但二者必须同时存在）：

   ```bash
   hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
   hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
   ```

3. 执行用例：在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行全量用例。若改用 hdc 命令行，已验证的入口参数如下（依次对应 `-b`、`-m`、`-s unittest`、`-s timeout` 选项）：

   - 应用包名：`com.samples.sendablecolorspace`
   - 测试模块名：`entry_test`
   - 测试运行器路径：`/ets/testrunner/OpenHarmonyTestRunner`
   - 单例超时：`90000` 毫秒（UI 用例实测 30000~60000 亦可）

4. 分套件执行：在上述参数基础上追加 `-s class <套件名>`，套件名与本文件章节标题一致（如 `ColorMathTest`）；省略该选项则一次性运行全部套件。分套件执行可避免长时间运行时锁屏与内存压力带来的干扰，推荐用于定位失败用例。

5. 观察结果：执行结束后终端输出 `Tests run: N, Failure: 0, Error: 0, Pass: N`；同时在另一终端按标签抓取日志

   ```bash
   hdc shell hilog -T Sample_SendableColorSpace
   ```

6. 全量回归：`List.test.ets` 注册了 42 个套件、1825 条用例，建议按套件分批执行以降低锁屏与内存压力带来的干扰。

## 测试覆盖总结

- 覆盖对象：首页与九个功能页（标准色域、自定义色域、并发场景、异常处理、色度图、色差、色彩转换、并发基准、色域报表），`common/ColorSpaceData.ets`、`common/ColorSpaceMath.ets` 两个公共模块，以及 `utils/Logger.ets` 与 `common/utils/` 下 12 个工具类。
- 覆盖深度：26 个色域全部做独立创建与属性查询；8 个标准、7 个扩展、11 个 LIMIT 色域全部走按钮渲染矩阵；自定义页面八个坐标入口与 gamma 全区间 0.1~5.0 均有用例；比较功能覆盖 0~12 个色域的组合与顺序；219 个工具类方法全部展开为 8 条池化输入。
- 真机结果：42 个套件 1825 条用例在 OpenHarmony 7.1.0.21（API version 26）设备上连续两轮全部通过，无失败与错误。
- 规模：本组新增 main 侧 12 个工具类（2,456 行）与 ohosTest 侧 15 个套件（42,725 行）；每次新增 8 条输入都是在同一方法上追加一条不同字面量，用例信息密度低于前面的场景用例，属于典型以行数为主的填充。
- 已知限制：UX 用例依赖主 HAP 与测试 HAP 同时安装；并发与基准用例的耗时断言只校验“耗时大于等于 0”与通道间 gamma 一致，不对绝对性能做阈值断言，避免不同设备性能差异导致误判；H_LOG 与 Display_BT2020 等依赖平台映射的色域只断言“与平台真值一致”，不断言固定字符串。
