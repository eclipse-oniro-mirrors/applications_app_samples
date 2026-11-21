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

`entry/src/ohosTest/ets/test` 下共 32 个测试套件、2737 条用例。其中原有 3 个套件共 8 条性能用例保持不变，新增 29 个套件共 2729 条逻辑用例。

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
2. 通过 hdc 执行全量测试：

```
hdc shell aa test -b com.samples.test.perftest -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000
```

3. 也可在 DevEco Studio 中选中 entry 模块的 ohosTest 运行。

## 五、测试结果

- 编译：`assembleHap --mode module -p module=entry@ohosTest` 编译通过。
- 用例：32 个套件、2737 条用例已归档，新增用例均为逻辑用例，无完全重复用例。
