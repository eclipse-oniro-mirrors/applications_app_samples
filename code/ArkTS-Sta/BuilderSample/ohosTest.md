# BuilderSample 测试用例

本文参考 ArkTSStaticSample 的 ohosTest.md 结构，按 2026-11-19 当前源码整理。
当前自动化范围为常量、类型样本及测试侧状态/绑定辅助模型；执行结果引用同日已有的 DevEco 归档。
本次仅更新说明，未构建、安装或运行测试。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 测试环境，主应用与测试 HAP 已安装，运行静态 Hypium 测试入口。
下表的自动化 Pass 来自 2026-11-19 当前版本的全量报告，功能摘要不重复计入用例总数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 颜色与尺寸契约 | 可导入生产 COLORS / SIZES | 读取颜色、圆角、字号、内边距和间距 | 字段值、格式、整数类型及派生关系与当前常量一致 | 是 | Pass（归档全量） |
| 数据类型样本 | 可导入 ColorOptions / SizeOptions | 按生产字段构造独立样本 | 字段值正确，样本对象与常量对象身份独立 | 是 | Pass（归档全量） |
| 测试侧绑定读写 | 创建 GetterBinding / GetterSetterBinding | 外部更新源值、读取、写入并记录次数 | getter 反映源值，setter 收到对应输入，别名与独立实例符合辅助模型契约 | 是，辅助模型 | Pass（归档全量） |
| 占位与输入状态 | 创建新的 WishBoard | 模拟 update、输入、清空及组合序列 | 正文、占位文案、回显和计数符合 WishBoard 的状态规则 | 是，辅助模型 | Pass（归档全量） |
| 文案与样式数值 | 测试侧 Copy 和生产常量可用 | 比较文案、颜色、字号与间距组合 | 当前样本值和数值关系满足断言 | 是，数据断言 | Pass（归档全量） |
| Builder 中的输入刷新 | 真机进入愿望页面 | 在实际输入框输入文字 | 父组件正文与底部回显同步更新 | 否，需人工验证 | 本次未复验 |
| Builder 中的占位刷新 | 真机显示 MainPage | 点击实际 update 按钮 | Builder 的占位文案更新为“新年快乐!” | 否，需人工验证 | 本次未复验 |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 包含 **21 个套件、2,549 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 22 个 `.test.ets` 文件，其中 List 只负责注册、不含用例。
下表列出真实 `describe` 名称，可用于 `-s class`；数量按源码 `it` 定义统计，不含 Shared 辅助文件。

### 框架基线：1 个套件，1 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ActsAbilityTest` | 原始框架基线：使用 assertContain 验证字符串包含关系；没有启动或查询真实页面 | 1 |

### 生产颜色常量：2 个套件，140 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ColorContrastTest` | 生产 COLORS 的颜色配对、测试侧亮度/对比度计算和数值关系 | 126 |
| `ColorPaletteTest` | 生产颜色字面值、格式、RGB 通道及主色数据契约 | 14 |

### 生产尺寸与派生数值：3 个套件，326 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `LayoutDerivedTest` | 基于生产 SIZES 的边距、字号和宽高等派生数值；没有读取实际节点边界 | 90 |
| `SizeMetricsTest` | 生产 radius、padding、字号与 spacing 的值、整数类型和算术性质 | 182 |
| `SpacingPlanTest` | 生产尺寸组合、水平/垂直间距计算及颜色通道派生值 | 54 |

### 类型与字段契约：1 个套件，27 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ContractShapesTest` | 生产 ColorOptions / SizeOptions 类型的样本对象、字段值及独立对象身份 | 27 |

### 测试侧文案副本：1 个套件，24 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `UiCopyTest` | 测试侧 Copy 文案副本的字面值、Unicode、长度与包含关系 | 24 |

### 文案、常量与辅助模型组合：3 个套件，294 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CrossChecksTest` | 测试侧文案关系、WishBoard 状态隔离，以及生产尺寸常量的比例关系 | 92 |
| `PageCompositionTest` | 页面相关文案副本、生产颜色/字号/间距及测试内布局数值；没有挂载组件 | 116 |
| `RelationsTest` | 生产颜色的通道/亮度关系及尺寸常量间的算术关系 | 86 |

### 测试侧绑定辅助实现：1 个套件，212 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BindingContractTest` | 测试侧 GetterBinding / GetterSetterBinding / CountingBinding 的读写、源值更新、别名和调用计数 | 212 |

### 测试侧 WishBoard 状态：9 个套件，1,525 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `InitialStateTest` | WishBoard 初始正文、占位文案、回显、空值状态和零计数 | 33 |
| `PlaceholderStateTest` | WishBoard 重复更新占位文案及正文隔离，并包含颜色解码检查 | 38 |
| `SequenceFiveATest` | WishBoard 以 A 开头的长度 5 序列，验证正文、占位文案和操作计数 | 256 |
| `SequenceFiveCTest` | WishBoard 以 C 开头的长度 5 序列，验证清空与后续更新、输入的组合 | 256 |
| `SequenceFiveNTest` | WishBoard 以 N 开头的长度 5 序列，验证中文输入与别的操作组合 | 256 |
| `SequenceFiveUTest` | WishBoard 以 U 开头的长度 5 序列，验证占位更新与别的操作组合 | 256 |
| `SequenceFourTest` | WishBoard 长度 4 的 U/A/N/C 操作序列及结束状态、更新/输入计数 | 256 |
| `SequenceShortTest` | WishBoard 长度 1–3 的 U/A/N/C 操作序列及结束状态、更新/输入计数 | 84 |
| `TextPropagationTest` | WishBoard 输入、清空、空白/Unicode 文本及标题/底部回显一致性 | 90 |
