# ArkTS-Static 演示工程测试用例

## 基础功能用例

预置条件：连接并解锁 API 26 真机，安装主应用和测试 HAP，进入 ArkTS-Static 示例应用。
以下结果来自 2026-11-14 的设备全量回归；基础功能对应下文已有套件，不重复计入用例总数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面显示 | 已安装主应用和测试 HAP | 启动 EntryAbility，等待页面就绪 | 显示 `Hello 0` 标题和“卡片 1”“卡片 2”“卡片 3” | 是 | Pass |
| 卡片列表渲染 | 已进入示例页面 | 查询 Text、List、ListItem 和组件边界 | 三张卡片文本、顺序和数量正确，组件可用且边界非空 | 是 | Pass |
| 卡片交互 | 三张卡片可见 | 点击、双击和长按卡片 | 操作后卡片内容、数量和顺序保持正确 | 是 | Pass |
| 页面前后台切换 | EntryAbility 处于前台 | 返回桌面，确认进入后台，再恢复同一 Ability | 恢复前台后页面稳定，三张卡片内容和交互正常 | 是 | Pass |
| 样例布局解析 | 已注册 text 类型 resolver | 解析工程内 `jsonData.json` | 返回三张 TextCardData，标题和顺序与样例资源一致 | 是 | Pass |
| 静态解析与桥接 | API 26 设备，静态工厂已初始化 | 通过 DataParserStaW 执行真实静态 taskpool 解析 | 静态结果正确转换为动态数据源，字段和顺序保持一致 | 是 | Pass |
| 运行时分发 | 已读取当前设备 API 版本 | 通过 library 统一出口创建 DataParser | 当前 API 26 设备使用静态包装器实现 | 是 | Pass |
| 异常处理与恢复 | 已创建解析器并注册对应类型 | 输入非法 JSON 或触发 resolver 异常，再输入有效布局 | 异常按接口契约传播，后续有效请求成功 | 是 | Pass |

## 新增自动化测试覆盖

当前 `entry/src/ohosTest/ets/test` 中共有 **96 个套件、1,782 条用例**，
均通过 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册执行。
下表使用 `describe` 的真实套件名称，可直接用于 `-s class` 参数；
数量按源码中的 `it` 统计，并与设备完成记录核对。

### 应用入口与页面：4 个套件，54 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AbilityTest` | EntryAbility 启动、页面标题和三张样例卡片的实际可见性 | 1 |
| `CardListRenderingTest` | Text/List/ListItem、卡片文本顺序、可用状态及非空边界 | 24 |
| `CardListInteractionTest` | 点击、双击、长按后的卡片文本、数量和顺序 | 15 |
| `PageLifecycleTest` | 同一 Ability 的前后台切换、页面稳定及恢复后的内容和交互 | 14 |

### 数据模型：17 个套件，415 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AccessBoundaryTest` | payload 访问器、继承属性、属性重定义、模型快照和冻结对象 | 6 |
| `CardConstructionTest` | CardData/TextCardData 构造、字段透传、嵌套访问和对象身份 | 33 |
| `CardResolverTest` | 创建 TextCardData、共享 payload 和独立对象 ID | 36 |
| `CardStateTest` | type、data 和 getObjectId 在状态更新中的契约 | 17 |
| `CardTitleAccessTest` | 嵌套 item.title.name、标题长度及 JSON 编码一致性 | 29 |
| `IdentityStabilityTest` | 批量卡片 ID 唯一性和内容修改后的身份稳定性 | 6 |
| `LiteralTitlesTest` | 标记、表达式样式和转义字符作为标题数据保留 | 11 |
| `ModelCaptureTest` | 构造时字段读取顺序、次数、getter 异常和捕获时序 | 4 |
| `NestedPayloadTest` | 深层对象、数组、共享引用和嵌套修改 | 33 |
| `ObjectIdentityTest` | 不同实例 ID 唯一性及内容修改后的 ID 稳定性 | 24 |
| `OptionalPayloadTest` | 省略 data、后续赋值、重新清空及 undefined 返回值 | 45 |
| `PayloadMutationTest` | 深层修改、整体 payload 替换与 ID 保持 | 32 |
| `PayloadRoundTripTest` | JSON 往返后的值保持和对象引用隔离 | 10 |
| `PayloadValuesTest` | null、布尔、零、空串、数组、对象和数值透传 | 47 |
| `PropertyKeysTest` | 空键、原型相关键、Unicode 键及缺失属性 | 52 |
| `StylePayloadTest` | 样式宽度、主题字段和引用修改后的可见性 | 8 |
| `UnicodeCardDataTest` | 中文、多语言、组合字符、转义字符和空标题 | 22 |

### 动态解析器：21 个套件，397 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BatchOrderTest` | 不同组大小和空组位置下的数量与展平顺序 | 24 |
| `ConcurrentParsingTest` | 并发请求的结果、顺序和原始 payload 隔离 | 18 |
| `EmptyGroupsTest` | 空组和空组 JSON 数组字符串不创建卡片 | 24 |
| `ErrorRecoveryTest` | 非法 JSON 异常及同一解析器的后续有效请求 | 34 |
| `ExecutionBoundaryTest` | workload 顺序、同步异常、重入、resolver 副作用和部分失败 | 14 |
| `FlatteningTest` | 展平后的数量、标题及 sequence 字段 | 29 |
| `GroupOrderingTest` | 多组数量、组内顺序和跨组展平 | 27 |
| `InputShapesTest` | 对象组、单 payload、布局数组和 JSON 数组字符串 | 23 |
| `InvalidJsonTest` | 空串、截断 JSON、非法键和尾逗号的 SyntaxError | 34 |
| `LocalLayoutParsingTest` | 本地布局数组的真实解析 | 2 |
| `MetadataPreservationTest` | sequence 等 payload 元数据在解析后保留 | 16 |
| `ParserReuseTest` | 重复解析不覆盖前一请求的结果 | 9 |
| `PropertyFailureTest` | getter 异常、空组和未知类型短路、缺失样式与冻结 payload | 7 |
| `RetryAfterFailureTest` | 失败后有效请求的数量和 resolver 调用记录 | 9 |
| `StyleBoundaryTest` | width 属性缺失、枚举性、可配置性、惰性求值和样式替换 | 8 |
| `TraversalMutationTest` | 遍历中修改 payload 数组、类型和顶层组，以及共享引用 | 8 |
| `UnknownTypeIsolationTest` | 已知与未知类型混排后的过滤和顺序 | 11 |
| `UnknownTypesTest` | 未知类型跳过且不调用已注册 resolver | 31 |
| `WidthFormulaTest` | 动态 width getter 每次求值的相对变化和 style 引用 | 8 |
| `WidthMutationTest` | getter 属性描述符、读取序列和无 setter 契约 | 41 |
| `WidthReadSequenceTest` | 连续读取 width 的相对步长 | 20 |

### 静态包装与互操作：20 个套件，230 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ConcurrentWrapperTest` | 同一包装器并发请求返回独立动态数据源 | 3 |
| `ConversionBoundaryTest` | 原生 count/getData 协议、读取顺序、转换中变更和失败恢复 | 12 |
| `DeferredConversionTest` | 延迟完成、乱序返回、微任务窗口、注册表切换和并发失败隔离 | 9 |
| `FactoryCaptureTest` | 构造时捕获工厂及新旧工厂调用计数 | 22 |
| `FactoryFailureTest` | 缺失工厂、构造异常及工厂失效后已有实例的可用性 | 3 |
| `FactoryLifecycleTest` | 实例不受后续全局工厂切换影响 | 17 |
| `FactoryReplacementTest` | 工厂替换后新旧包装器分别调用各自解析器 | 9 |
| `NativeResultBoundaryTest` | 原生属性访问异常、数量不一致、冻结结果和字段重绑定 | 6 |
| `ParserResultIsolationTest` | 多次转换的独立结果容器及新对象 ID | 14 |
| `ResolverConversionTest` | 转换时跳过未注册类型并保留已注册卡片 | 23 |
| `RuntimeDispatchTest` | 当前设备 API 版本对应的真实分发类与实例类型 | 2 |
| `SerializationBoundaryTest` | 循环引用、BigInt、toJSON、getter 异常和动态宽度序列化 | 8 |
| `SerializationEffectsTest` | 继承/不可枚举字段、别名、嵌套 toJSON 和部分序列化失败 | 7 |
| `WrapperCallAccountingTest` | 工厂创建、原生解析和 resolver 转换的调用次数 | 22 |
| `WrapperInputTest` | 对象、数组和字符串输入传入原生解析器的参数 | 16 |
| `WrapperInstanceIsolationTest` | 多次解析容器及卡片独立，payload 按当前契约共享 | 13 |
| `WrapperParityTest` | 字段与原生结果一致且动态对象身份独立 | 13 |
| `WrapperRecoveryTest` | 原生依赖抛错后同一包装器恢复解析 | 15 |
| `WrapperReentrancyTest` | resolver、toJSON 和原生 getter 中重入及嵌套失败隔离 | 4 |
| `WrapperRejectionTest` | 同步异常和 Promise 拒绝传播，结束后恢复工厂 | 12 |

### 注册表：8 个套件，189 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CreateDataContractTest` | createData 接收原 DataModel 并返回生产 CardData | 22 |
| `ExactKeyDispatchTest` | 空键、原型键、大小写、空白、Unicode 和 NUL 的精确分发 | 8 |
| `RegistrationIsolationTest` | 类型键独立注册和覆盖，不污染别的类型 | 28 |
| `ResolverCallsTest` | resolver 调用次数、接收模型和返回的新实例 | 39 |
| `ResolverDispatchTest` | 注册后的 resolver 分发和 createData 调用 | 28 |
| `ResolverReplacementTest` | 同类型覆盖、原 resolver 隔离及别的类型不受影响 | 12 |
| `SpecialTypeKeysTest` | 含空白、大小写和原型相关名称的类型键注册 | 19 |
| `TypeCatalogTest` | 类型目录注册、查找、重复创建及未注册键 | 33 |

### 数据源：14 个套件，307 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AppendStabilityTest` | 持续追加后已有条目的内容、顺序和身份 | 6 |
| `BackingStoreTest` | dataList 重绑定、冻结追加失败恢复、共享数组及索引 getter 异常 | 4 |
| `DataBindingTest` | 数据源持有真实 CardData 引用并反映 payload 修改 | 15 |
| `EmptyAndSingleTest` | 空数据源、追加和末尾越界 | 3 |
| `IndependentSourcesTest` | 多个数据源独立追加后的长度、内容和对象引用 | 13 |
| `IndexBoundariesTest` | 负索引、长度边界、小数、NaN 和无穷值 | 27 |
| `IndexLookupTest` | 多种容量下 getData 与 dataList 存储一致 | 44 |
| `InsertionOrderTest` | 追加顺序、已有内容、尾部访问和唯一 ID | 9 |
| `LargeBatchTest` | 较大批次追加、完整内容核验和索引上界 | 21 |
| `ListenerContractTest` | 监听注册/注销的当前空实现契约，不产生通知 | 18 |
| `ListenerLifecycleTest` | 重复注册、注销和追加后存储变化正确，事件仍为空 | 32 |
| `ReadConsistencyTest` | 重复读取不改变长度、顺序、引用和内容 | 44 |
| `RepeatedAppendTest` | 重复追加同一对象保留引用且数量正确 | 34 |
| `SourceIsolationTest` | 不同数据源数组独立及显式共享 CardData 引用 | 37 |

### 集成流程：9 个套件，124 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BundledLayoutTest` | 工程原始样例资源、三张卡片和原始顺序 | 16 |
| `ConcurrentPipelineTest` | 两个并发解析请求的输出顺序、身份和调用次数 | 7 |
| `ParserRegressionTest` | 非空组与空组混排后的展平顺序和索引边界 | 14 |
| `ResolverPipelineTest` | 真实解析器传递模型、传播异常和恢复解析 | 11 |
| `ResolverWorkflowTest` | resolver 失败到恢复的真实流程 | 22 |
| `SampleLayoutTest` | 基于工程样例资源替换卡片标题后的解析 | 24 |
| `StaticInputBoundaryTest` | 真实 taskpool 的对象根、单 payload、畸形组隔离和输入快照 | 8 |
| `StaticPipelineTest` | 真实静态 taskpool、跨语言转换、TextCardData 类型和结果顺序 | 13 |
| `StaticRecoveryTest` | 静态部分失败、任务拒绝恢复、width 求值、引用隔离和空集合 | 9 |

### 计算工作负载：3 个套件，66 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `EntryWorkloadTest` | entry 递归 Fibonacci 与独立迭代预言机比较 | 26 |
| `LibraryWorkloadTest` | library 递归 Fibonacci 的区间、重复调用和基础分支 | 25 |
| `WorkloadParityTest` | entry、library 两份实现与独立预言机交叉比较 | 15 |


## 本机运行

本机环境和工程配置见 [README](README.md#本机运行环境)。
在 DevEco Studio 终端执行下列命令，会构建主应用与测试包、安装、运行全量用例

## 验证结果与范围

2026-11-14 的设备全量结果：

```text
Tests run: 1782, Failure: 0, Error: 0, Pass: 1782, Ignore: 0
OHOS_REPORT_CODE: 0
TestFinished-ResultCode: 0
```

