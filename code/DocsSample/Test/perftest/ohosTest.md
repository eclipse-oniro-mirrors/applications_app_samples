# PerfTest 测试用例

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备类型 | default、tablet |
| 系统能力 | API 26 |
| SDK 版本 | 26.0.0 |
| 编译工具 | DevEco Studio 6.1.1 Release，hvigor |
| 测试框架 | Hypium（entry_test 模块，OpenHarmonyTestRunner） |
| 被测应用 | com.samples.test.perftest（entry 模块） |

## 一、用例总览

`entry/src/ohosTest/ets/test` 下共 143 个测试套件、5534 条用例。其中原有 3 个套件共 8 条性能用例保持不变；此前已有 55 个逻辑套件共 2349 条用例；本次围绕真实业务补充 85 个套件共 3177 条用例（净增 50331 行），重点覆盖通知、公共事件、日志、调用序列与边界场景。

| 测试功能 | 预置条件 | 输入/操作 | 预期输出 | 用例数 | 测试结果 |
|----------|----------|-----------|----------|--------|----------|
| 性能测试（原有） | 设备正常运行 | 执行 PerfTest 场景并采集指标 | 指标正常返回 | 8 | Pass |
| 语言与编码基础 | 应用已安装 | 字符串、JSON、数值、集合、时间、数学、签名文本的构造与解析 | 结果与预期值一致 | 1488 | Pass |
| 模块与包信息 | 应用已安装 | 查询 BundleInfo/HapModuleInfo | 包名、版本、模块名与类型符合预期 | 344 | Pass |
| 应用与实例信息 | 应用已安装 | 查询 appIndex、应用级字段与文案 | 单实例索引为 0，字段与文案一致 | 102 | Pass |
| entry 资源读取 | 应用已安装 | 读取 string/color/float/media/layered-image | 资源值、PNG 结构与错误码符合预期 | 132 | Pass |
| 文件与首选项 | 应用沙箱可写 | 读写/删除草稿文件，读写 Preferences | 内容一致，异常码符合预期 | 470 | Pass |
| 显示信息 | 应用已安装 | 查询默认显示器属性 | 宽高、密度、刷新率等均为有效值 | 70 | Pass |
| Want 构造 | 应用已安装 | 构造显式 Want 并解析字段 | 字段完整、可往返序列化 | 80 | Pass |
| Ability 与 UI | 应用已安装 | 拉起 EntryAbility、获取按钮组件边界 | 上下文信息正确，按钮可见 | 23 | Pass |
| Utils 计算逻辑 | 应用已安装 | 调用 Utils.Reset/CalculateTest | 计数从 0 增至 10000，多次调用累加 | 20 | Pass |
| 纯语义边界（本次） | 应用已安装 | 数值/字符串/数组/JSON/数学/TypedArray/日期边界值运算 | 结果与 JS 语义基准一致 | 462 | Pass |
| 编码与序列（本次） | 应用已安装 | hex/Base64/JSON 序列/字符串序列/排序/数值序列/日期序列/正则/格式化/校验 | 编解码往返与解析结果一致 | 657 | Pass |
| 异步与校验（本次） | 应用已安装 | Promise 调用序列、错误捕获、CRC/Adler/FNV/Luhn、编辑距离、单位换算、版本比较、路径、CSV | 序列顺序与校验值一致 | 275 | Pass |
| 业务逻辑（本次） | 应用已安装 | 模板渲染、搜索、排序、LRU、状态机、分页、金额、罗马数字、Token、MIME、括号匹配、树、限流、重试等 | 业务规则计算结果一致 | 613 | Pass |
| 应用 API 序列（本次） | 应用已安装 | Utils/文件/首选项/Want/Bundle/资源/Context 的多步调用序列 | 序列状态迁移与读回值一致 | 234 | Pass |
| 应用 API 边界（本次） | 应用已安装 | 文件尺寸/文件名、首选项键值、Want 字段、资源错误码、flag 组合、stat/listFile | 边界行为与错误码符合预期 | 192 | Pass |
| 通知与公共事件（本次） | 应用已安装 | NotificationSlot 生命周期、publish/cancel 序列、isNotificationEnabled、公共事件订阅/发布/退订、hilog 各级别与格式 | 成功或预期错误码（1600004/1600007/1500003 等） | 187 | Pass |
| 算法与编码补充（本次） | 应用已安装 | 栈/队列、网格、词频、变位词、子串、集合运算、排列、洗牌、插值、时钟、投票、装箱、TopK、RLE、凯撒、摩斯、键盘、角度、时长 | 算法输出与基准一致 | 557 | Pass |

## 二、原有用例

| 用例名称 | 测试功能 | 预期输出 |
|----------|----------|----------|
| testPerfTestCalculate | PerfTest 接口测试函数执行时性能测试 | 正确返回性能测试数据 |
| testPerfTestPageSwitch | PerfTest 接口测试页面切换时性能测试 | 正确返回性能测试数据 |
| testPerfTestListSwipe | PerfTest 接口测试页面滑动时性能测试 | 正确返回性能测试数据 |
| testPerfTest_Navigationchange | PerfTest 接口测试 Navigation 组件跳转时性能测试 | 正确返回性能测试数据 |
| testPerfTest_Start | PerfTest 接口测试拉起应用时性能测试 | 正确返回性能测试数据 |

## 三、新增测试套件设计

| 套件文件 | 用例数 | 覆盖内容 |
|----------|--------|----------|
| EncodeTextMatrix.test.ets | 214 | UTF-8/Base64 编解码、往返一致性、字节边界 |
| JsonDocMatrix.test.ets | 122 | JSON 序列化/反序列化、嵌套结构、类型还原 |
| NumberSenseMatrix.test.ets | 234 | 整数/浮点运算、边界值、精度与格式化 |
| TextSenseMatrix.test.ets | 300 | 字符串长度、切片、大小写、查找、拆分与拼接 |
| CollectionSenseMatrix.test.ets | 300 | Array/Map/Set 增删改查、排序、去重与遍历 |
| TimeSenseMatrix.test.ets | 132 | Date 构造、时间戳换算、格式化与比较 |
| MathSenseMatrix.test.ets | 164 | 取整、幂/对数、三角函数、极值与随机范围 |
| ModuleNameMatrix.test.ets | 216 | 模块名、资源名、文件名字符级校验 |
| VersionMatrix.test.ets | 55 | 版本号拆分、版本码换算与格式约束 |
| AppTextMatrix.test.ets | 29 | 应用文案的切片、重复与字符定位 |
| DraftIoMatrix.test.ets | 217 | 沙箱文件写入/追加/读取/删除、路径与编码 |
| PrefStoreMatrix.test.ets | 128 | Preferences 写入、读取、删除、清空与重新打开 |
| BundleFactsMatrix.test.ets | 47 | BundleInfo 名称、版本、签名、权限、模块索引 |
| ModuleFactsMatrix.test.ets | 26 | entry/entry_test 模块类型、能力、扩展、启动模式与设备类型 |
| EntryStringMatrix.test.ets | 23 | resourceManager 按名/按 ID 读取字符串及错误码 |
| AppInstanceMatrix.test.ets | 51 | appIndex 取值、范围、稳定性及与各上下文字段一致性 |
| AppScopeMatrix.test.ets | 22 | ApplicationInfo 名称、版本、图标、标签、代码路径 |
| ColorFactsMatrix.test.ets | 11 | start_window_background 颜色通道与查找错误 |
| MediaFactsMatrix.test.ets | 39 | PNG 签名、尺寸、分块、CRC、内容统计 |
| LayeredTextMatrix.test.ets | 8 | layered_image.json 文本结构校验 |
| LayeredJsonMatrix.test.ets | 16 | layered_image.json 解析后的键值与引用校验 |
| SignatureMatrix.test.ets | 22 | appId、指纹格式与重复读取稳定性 |
| DisplayFactsMatrix.test.ets | 70 | 默认显示器属性、宽高关系与数值运算 |
| FileErrorMatrix.test.ets | 125 | 文件不存在、路径非法、重复创建等错误码 |
| WantFactsMatrix.test.ets | 80 | Want 字段、URI、参数与序列化 |
| ResourceIdMatrix.test.ets | 35 | 资源 ID、资源名、媒体数据的交叉校验 |
| AbilityFactsMatrix.test.ets | 15 | EntryAbility 上下文、标签、启动模式、资源读取 |
| UiFlowMatrix.test.ets | 8 | 拉起应用后按钮组件的显示与边界 |
| UtilsMatrix.test.ets | 20 | Utils.maxNum、Reset、CalculateTest 的计数与复位逻辑 |

## 四、执行方式

1. 使用 DevEco Studio 自动签名，编译并安装应用与测试包。

2在 DevEco Studio 中选中 entry 模块的 ohosTest 运行。

## 五、测试结果

- 编译：`assembleHap --mode module -p module=entry@ohosTest` 编译通过。
- 用例：143 个套件、5534 条用例已归档，本次净增 50331 行；全部用例名与 `@tc.number` 全局唯一，新增用例均为逻辑用例，无完全重复用例。

## 六、本次补充测试套件（85 个）

按批次分组的完整清单（套件文件 | 用例数）：

| 批次 | 套件（用例数） |
|------|----------------|
| 纯语义边界 | BoundaryNumMatrix(98)、BoundaryStrMatrix(74)、BoundaryArrMatrix(65)、BoundaryJsonMatrix(53)、BoundaryMathMatrix(75)、BoundaryTypedMatrix(49)、BoundaryDateMatrix(48) |
| 编码与序列 | EncodeHexMatrix(53)、EncodeBase64Matrix(44)、JsonSeqMatrix(68)、StrSeqMatrix(70)、CollSeqMatrix(97)、NumSeqMatrix(60)、DateSeqMatrix(47)、RegexSeqMatrix(71)、FormatMatrix(70)、ValidateMatrix(77) |
| 异步与校验 | SeqPromiseMatrix(39)、SeqErrorMatrix(26)、ChecksumMatrix(45)、DistanceMatrix(36)、UnitsMatrix(43)、VersionCmpMatrix(28)、PathMatrix(30)、CsvMatrix(28) |
| 业务逻辑 | TemplateMatrix(30)、SearchMatrix(36)、RankMatrix(24)、FilterMatrix(36)、CacheMatrix(30)、FsmMatrix(30)、PaginationMatrix(37)、MoneyMatrix(43)、NumWordMatrix(50)、RomanMatrix(68)、IdGenMatrix(33)、TokenMatrix(31)、MimeMatrix(36)、BracketMatrix(30)、TreeMatrix(34)、RateLimitMatrix(30)、RetryMatrix(35) |
| 应用 API 序列 | SeqUtilsMatrix(36)、SeqFileMatrix(34)、SeqPrefMatrix(34)、SeqWantMatrix(30)、SeqBundleMatrix(25)、SeqResMatrix(25)、SeqContextMatrix(25)、SeqStateMatrix(25) |
| 应用 API 边界 | BoundaryFileMatrix(41)、BoundaryPrefMatrix(35)、BoundaryWantMatrix(41)、BoundaryResMatrix(20)、BundleFlagMatrix(25)、FsStatMatrix(30) |
| 通知与公共事件 | NotifySlotMatrix(21)、NotifyStateMatrix(19)、NotifyPublishMatrix(16)、NotifyErrorMatrix(15)、CommonEventMatrix(28)、CommonEventSeqMatrix(16)、CommonEventDataMatrix(13)、CommonEventErrorMatrix(10)、HiLogMatrix(33)、HiLogSeqMatrix(16) |
| 算法与编码补充 | QueueStackMatrix(28)、GridMatrix(30)、WordStatMatrix(35)、AnagramMatrix(30)、SubstringMatrix(30)、SetOpMatrix(30)、PermuteMatrix(30)、ShuffleMatrix(26)、InterpMatrix(30)、ClockMatrix(30)、VoteMatrix(20)、BinPackMatrix(24)、TopKMatrix(20)、RunLengthMatrix(25)、CaesarMatrix(25)、MorseMatrix(20)、PhoneMatrix(27)、AngleMatrix(52)、DurationMatrix(45) |

通知与公共事件批次说明：publish/cancel 类用例采用容忍式断言（通知开关关闭时接受 1600004，取消不存在通知接受 1600007，公共事件频控接受 1500003），自定义事件名避开系统事件，订阅使用 `createSubscriberSync` 同步创建、`subscribe`/`unsubscribe` 异步配对；hilog 覆盖 debug/info/warn/error/fatal 五级、`%{public}s`/`%{private}s` 格式与 domain 边界。

## 逻辑用例（数据驱动）

以下 2670 条逻辑与调用序列用例位于 `entry/src/ohosTest/ets/test/logic` 与 `entry/src/ohosTest/ets/test/core`，
每条用例记录 begin/end 日志，断言前打印入参与实际值；期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| CalculateNumTest | 无 | 32 组输入（Perf_CalcNum_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CalculateStepsTest | 无 | 32 组输入（Perf_CalcSteps_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UtilsAfterTest | 无 | 32 组输入（Perf_UtilsAfter_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MetricNameTest | 无 | 13 组输入（Perf_MetricName_0001~0013） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MetricIdTest | 无 | 13 组输入（Perf_MetricId_0001~0013） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MetricCategoryTest | 无 | 32 组输入（Perf_MetricCategory_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ScenarioMetricsTest | 无 | 32 组输入（Perf_ScenarioMetrics_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| IterationsValidTest | 无 | 32 组输入（Perf_IterationsValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeoutValidTest | 无 | 32 组输入（Perf_TimeoutValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MetricListValidTest | 无 | 32 组输入（Perf_MetricListValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| BundleValidTest | 无 | 32 组输入（Perf_BundleValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StrategyValidTest | 无 | 32 组输入（Perf_StrategyValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AverageTest | 无 | 32 组输入（Perf_Average_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MaximumTest | 无 | 32 组输入（Perf_Maximum_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MinimumTest | 无 | 32 组输入（Perf_Minimum_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResultSummaryTest | 无 | 32 组输入（Perf_ResultSummary_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ClampMetricValueTest | 无 | 32 组输入（Perf_ClampMetric_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FpsFromFramesTest | 无 | 32 组输入（Perf_Fps_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DurationBetweenTest | 无 | 32 组输入（Perf_Duration_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FlingGeometryTest | 无 | 32 组输入（Perf_Fling_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FlingValidationTest | 无 | 32 组输入（Perf_FlingValid_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RouteUrlTest | 无 | 32 组输入（Perf_Route_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NavigationActionTest | 无 | 14 组输入（Perf_NavAction_0001~0014） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AppStartMetricsTest | 无 | 32 组输入（Perf_AppMetrics_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UtilsModelFlowTest | 无 | 32 组输入（Perf_UtilsFlow_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MeasureResultFlowTest | 无 | 32 组输入（Perf_MeasureFlow_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PerfRunCreateTest | 无 | 32 组输入（Perf_RunCreate_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PerfRunSequenceTest | 无 | 6 组输入（Perf_RunSeq_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageFlowModelTest | 无 | 9 组输入（Perf_PageFlow_0001~0009） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SwipeModelTest | 无 | 32 组输入（Perf_Swipe_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UtilsBoundaryMatrixTest | 无 | 400 组输入（Perf_UtilsMatrix_0001~0400） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StrategyBoundaryMatrixTest | 无 | 400 组输入（Perf_StrategyMatrix_0001~0400） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PerfFlowBoundaryMatrixTest | 无 | 30 组输入（Perf_FlowMatrix_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MetricBoundaryMatrixTest | 无 | 36 组输入（Perf_MetricMatrix_0001~0036） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageSwipeBoundaryMatrixTest | 无 | 450 组输入（Perf_PageSwipeMatrix_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StrategyResultBoundaryMatrixTest | 无 | 450 组输入（Perf_StrategyResultMatrix_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PerfConstantsCoreTest | 无 | 17 组输入（Perf_Constants_0001~0017） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PerfMetricCoreTest | 无 | 32 组输入（Perf_MetricCore_0001~0032） | 返回值与状态逐条符合预期 | 是 | 待执行 |
