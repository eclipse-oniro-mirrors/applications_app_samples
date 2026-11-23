# BackgroundblurSample 测试用例

本文按 2026-11-19 的测试源码整理，结构参考 ArkTSStaticSample 的 ohosTest.md。
用例数量来自当前源码，执行结果来自下文指定的历史归档；本次文档更新未构建或运行测试。

## 基础功能用例

预置条件：API 26 真机已连接、解锁，主应用与测试 HAP 已安装，真实 EntryAbility 页面可就绪。
以下自动化结果对应 2026-11-16 设备 `45010044563430333201e4ea6c381c00` 的全量通过记录，
属于后文套件的功能摘要，不重复计数。另一设备的失败记录见“验证结果与范围”。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用入口与默认选择 | 主应用冷启动 | 启动 EntryAbility，查询背景与底栏 | 显示背景图片列表、四项底栏，仅“背景模糊”选中 | 是 | Pass（历史全量） |
| 底栏渲染与布局 | 真实主页就绪 | 读取文案、图标、数量和边界 | 文案顺序正确，节点唯一，标签无重叠，底栏固定 | 是 | Pass（历史全量） |
| 标签命中与选择 | 四个标签可见 | 点击 Column、标题、图标和空白区域，重复选择及往返 | 目标项唯一选中，标题和背景位置保持 | 是 | Pass（历史全量） |
| 背景滚动与边界 | 背景列表可操作 | 滚动到中段、末项、首项并执行边界手势 | 内容真实位移，第十张图片可达，不出现第十一项，底栏位置保持 | 是 | Pass（历史全量） |
| 手势区域隔离 | 背景与底栏均可见 | 在背景或底栏区域点击、横滑、竖拖 | 点击不穿透，底栏手势不带动背景列表，不产生页面跳转 | 是 | Pass（历史全量） |
| 前后台组合状态 | 已选择非首页标签并滚动 | Home 后恢复同一应用，核对生命周期事件 | 实际进入后台并恢复前台，选择、滚动锚点和底栏几何保持 | 是 | Pass（历史全量；另一设备有失败） |
| TabInfo 数据模型 | 测试适配器可用 | 构造及修改真实模型，传入不同 ID、文案和图标 | 字段值、资源对象身份及实例隔离符合当前存储契约 | 是 | Pass（历史全量） |
| 背景模糊视觉 | 真机显示真实页面 | 对照样例动画观察初始与滚动截图 | 底栏透出的背景、模糊和提亮效果符合样例 | 否 | 历史截图已目检；无自动视觉判定 |

真实业务入口为 [Index.ets](entry/src/main/ets/pages/Index.ets) 中的 TabsSample / CustomTabsComponent，
MainContentBlur 提供十张背景图片。视觉参考为
[background_blur.gif](entry/src/main/resources/base/media/background_blur.gif)。

## 新增自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 有 **88 个套件、1,557 条用例**，
均由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
下表逐一列出真实 `describe` 名称，可用于 `-s class`；数量按源码 `it` 定义统计，
不包括注册文件、公共驱动、fixture 或人工视觉检查。

### 核心模型与真实页面：9 个套件，39 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BackgroundEdgesTest` | 顶部越界滑动、末端不产生第十一项、列表行回收后的尺寸与相邻关系 | 3 |
| `BackgroundScrollTest` | 真实内容位移、固定底栏、选中状态保持、第十张图片可达及滚动往返 | 5 |
| `PageLifecycleTest` | 系统前台状态、前后台选择与滚动位置保持、再次启动后可交互 | 4 |
| `TabBarRenderingTest` | 冷启动唯一默认选择、四项文案顺序、图标/标题唯一性、无重叠、图片顺序和固定底栏 | 7 |
| `TabHitAreaTest` | Column 空白命中、背景点击不穿透、横向手势不导航、底栏拖动不滚动背景、均分居中与几何保持 | 6 |
| `TabInfoTest` | 真实静态 TabInfo 构造、空值、Unicode、字段修改、实例隔离和数字 ID 保留 | 6 |
| `TabInfoResourceTest` | 资源描述符身份、资源与空字符串往返、两种图标字段独立切换 | 3 |
| `TabSelectionTest` | 标签选择、标题/图标事件传递、重复选择、返回首页及背景位置保持 | 4 |
| `TabStateCompositionTest` | 同一次前后台切换同时保留非首页选择、背景滚动位置与底栏几何 | 1 |

### TabInfo 的 ID、标题与图标组合：48 个套件，800 条

这些套件覆盖生产模型的字段存储与修改；小数、负数和较大整数 ID 的用例不代表存在业务 ID 校验规则。
Literal 文案作为数据保留，不执行其中的标记或表达式。每行数量是当前已定义用例数，不能按组合名称推算。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptTabFractionalLiteralIconRolesTest` | 小数 ID、标记/表达式样式文案；选中/默认图标角色独立 | 27 |
| `AdaptTabFractionalLiteralInstanceIsolationTest` | 小数 ID、标记/表达式样式文案；多个模型实例字段隔离 | 5 |
| `AdaptTabFractionalLiteralTitleRoundTripTest` | 小数 ID、标记/表达式样式文案；标题更新与恢复 | 10 |
| `AdaptTabFractionalPlainIconRolesTest` | 小数 ID、普通文案；选中/默认图标角色独立 | 9 |
| `AdaptTabFractionalPlainInstanceIsolationTest` | 小数 ID、普通文案；多个模型实例字段隔离 | 27 |
| `AdaptTabFractionalPlainTitleRoundTripTest` | 小数 ID、普通文案；标题更新与恢复 | 13 |
| `AdaptTabFractionalUnicodeIconRolesTest` | 小数 ID、多语言文案；选中/默认图标角色独立 | 13 |
| `AdaptTabFractionalUnicodeInstanceIsolationTest` | 小数 ID、多语言文案；多个模型实例字段隔离 | 8 |
| `AdaptTabFractionalUnicodeTitleRoundTripTest` | 小数 ID、多语言文案；标题更新与恢复 | 12 |
| `AdaptTabFractionalWhitespaceIconRolesTest` | 小数 ID、空串/空白文案；选中/默认图标角色独立 | 32 |
| `AdaptTabFractionalWhitespaceInstanceIsolationTest` | 小数 ID、空串/空白文案；多个模型实例字段隔离 | 19 |
| `AdaptTabFractionalWhitespaceTitleRoundTripTest` | 小数 ID、空串/空白文案；标题更新与恢复 | 33 |
| `AdaptTabPositionalLiteralIconRolesTest` | 位置序号 ID、标记/表达式样式文案；选中/默认图标角色独立 | 29 |
| `AdaptTabPositionalLiteralInstanceIsolationTest` | 位置序号 ID、标记/表达式样式文案；多个模型实例字段隔离 | 23 |
| `AdaptTabPositionalLiteralTitleRoundTripTest` | 位置序号 ID、标记/表达式样式文案；标题更新与恢复 | 24 |
| `AdaptTabPositionalPlainIconRolesTest` | 位置序号 ID、普通文案；选中/默认图标角色独立 | 8 |
| `AdaptTabPositionalPlainInstanceIsolationTest` | 位置序号 ID、普通文案；多个模型实例字段隔离 | 13 |
| `AdaptTabPositionalPlainTitleRoundTripTest` | 位置序号 ID、普通文案；标题更新与恢复 | 2 |
| `AdaptTabPositionalUnicodeIconRolesTest` | 位置序号 ID、多语言文案；选中/默认图标角色独立 | 20 |
| `AdaptTabPositionalUnicodeInstanceIsolationTest` | 位置序号 ID、多语言文案；多个模型实例字段隔离 | 10 |
| `AdaptTabPositionalUnicodeTitleRoundTripTest` | 位置序号 ID、多语言文案；标题更新与恢复 | 4 |
| `AdaptTabPositionalWhitespaceIconRolesTest` | 位置序号 ID、空串/空白文案；选中/默认图标角色独立 | 11 |
| `AdaptTabPositionalWhitespaceInstanceIsolationTest` | 位置序号 ID、空串/空白文案；多个模型实例字段隔离 | 18 |
| `AdaptTabPositionalWhitespaceTitleRoundTripTest` | 位置序号 ID、空串/空白文案；标题更新与恢复 | 3 |
| `AdaptTabSignedLiteralIconRolesTest` | 负数 ID、标记/表达式样式文案；选中/默认图标角色独立 | 24 |
| `AdaptTabSignedLiteralInstanceIsolationTest` | 负数 ID、标记/表达式样式文案；多个模型实例字段隔离 | 18 |
| `AdaptTabSignedLiteralTitleRoundTripTest` | 负数 ID、标记/表达式样式文案；标题更新与恢复 | 30 |
| `AdaptTabSignedPlainIconRolesTest` | 负数 ID、普通文案；选中/默认图标角色独立 | 13 |
| `AdaptTabSignedPlainInstanceIsolationTest` | 负数 ID、普通文案；多个模型实例字段隔离 | 8 |
| `AdaptTabSignedPlainTitleRoundTripTest` | 负数 ID、普通文案；标题更新与恢复 | 10 |
| `AdaptTabSignedUnicodeIconRolesTest` | 负数 ID、多语言文案；选中/默认图标角色独立 | 27 |
| `AdaptTabSignedUnicodeInstanceIsolationTest` | 负数 ID、多语言文案；多个模型实例字段隔离 | 8 |
| `AdaptTabSignedUnicodeTitleRoundTripTest` | 负数 ID、多语言文案；标题更新与恢复 | 22 |
| `AdaptTabSignedWhitespaceIconRolesTest` | 负数 ID、空串/空白文案；选中/默认图标角色独立 | 27 |
| `AdaptTabSignedWhitespaceInstanceIsolationTest` | 负数 ID、空串/空白文案；多个模型实例字段隔离 | 31 |
| `AdaptTabSignedWhitespaceTitleRoundTripTest` | 负数 ID、空串/空白文案；标题更新与恢复 | 28 |
| `AdaptTabWideLiteralIconRolesTest` | 较大整数 ID、标记/表达式样式文案；选中/默认图标角色独立 | 17 |
| `AdaptTabWideLiteralInstanceIsolationTest` | 较大整数 ID、标记/表达式样式文案；多个模型实例字段隔离 | 4 |
| `AdaptTabWideLiteralTitleRoundTripTest` | 较大整数 ID、标记/表达式样式文案；标题更新与恢复 | 18 |
| `AdaptTabWidePlainIconRolesTest` | 较大整数 ID、普通文案；选中/默认图标角色独立 | 7 |
| `AdaptTabWidePlainInstanceIsolationTest` | 较大整数 ID、普通文案；多个模型实例字段隔离 | 16 |
| `AdaptTabWidePlainTitleRoundTripTest` | 较大整数 ID、普通文案；标题更新与恢复 | 6 |
| `AdaptTabWideUnicodeIconRolesTest` | 较大整数 ID、多语言文案；选中/默认图标角色独立 | 16 |
| `AdaptTabWideUnicodeInstanceIsolationTest` | 较大整数 ID、多语言文案；多个模型实例字段隔离 | 15 |
| `AdaptTabWideUnicodeTitleRoundTripTest` | 较大整数 ID、多语言文案；标题更新与恢复 | 17 |
| `AdaptTabWideWhitespaceIconRolesTest` | 较大整数 ID、空串/空白文案；选中/默认图标角色独立 | 25 |
| `AdaptTabWideWhitespaceInstanceIsolationTest` | 较大整数 ID、空串/空白文案；多个模型实例字段隔离 | 14 |
| `AdaptTabWideWhitespaceTitleRoundTripTest` | 较大整数 ID、空串/空白文案；标题更新与恢复 | 26 |

### ResourceStr 字段组合：7 个套件，229 条

Mask 的位含义为 `1=title`、`2=selectedIcon`、`4=defaultIcon`。
覆盖资源描述符与字符串的组合、顺序切换和逆序恢复，核对对象身份和别的字段保持；不判定图片渲染质量。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptTabResourceMask1Test` | title 的资源与字符串组合、切换及恢复；未修改字段保持 | 43 |
| `AdaptTabResourceMask2Test` | selectedIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 45 |
| `AdaptTabResourceMask3Test` | title / selectedIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 20 |
| `AdaptTabResourceMask4Test` | defaultIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 52 |
| `AdaptTabResourceMask5Test` | title / defaultIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 24 |
| `AdaptTabResourceMask6Test` | selectedIcon / defaultIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 33 |
| `AdaptTabResourceMask7Test` | title / selectedIcon / defaultIcon 的资源与字符串组合、切换及恢复；未修改字段保持 | 12 |

### 选择、视口与恢复组合：24 个套件，489 条

初始选项采用零基序号 0–3，视口分为 Start、Interior、End。
用例按各自参数选择 Column / Title / Icon / Gutter 命中位置，以及 Select / Reselect / RoundTrip 操作；
检查唯一选择、标题、图标、列表和底栏边界，Resume 分支还观察真实前后台恢复。
下表描述每个套件的场景范围，具体命中方式和操作以该套件的逐条用例为准。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptTabFrom0EndForegroundTest` | 初始选项 0、背景末端；前台交互时的选择、文字与几何保持 | 28 |
| `AdaptTabFrom0EndResumeTest` | 初始选项 0、背景末端；交互后前后台恢复时的选择、文字与几何保持 | 28 |
| `AdaptTabFrom0InteriorForegroundTest` | 初始选项 0、背景中段；前台交互时的选择、文字与几何保持 | 25 |
| `AdaptTabFrom0InteriorResumeTest` | 初始选项 0、背景中段；交互后前后台恢复时的选择、文字与几何保持 | 25 |
| `AdaptTabFrom0StartForegroundTest` | 初始选项 0、背景顶部；前台交互时的选择、文字与几何保持 | 13 |
| `AdaptTabFrom0StartResumeTest` | 初始选项 0、背景顶部；交互后前后台恢复时的选择、文字与几何保持 | 17 |
| `AdaptTabFrom1EndForegroundTest` | 初始选项 1、背景末端；前台交互时的选择、文字与几何保持 | 23 |
| `AdaptTabFrom1EndResumeTest` | 初始选项 1、背景末端；交互后前后台恢复时的选择、文字与几何保持 | 14 |
| `AdaptTabFrom1InteriorForegroundTest` | 初始选项 1、背景中段；前台交互时的选择、文字与几何保持 | 18 |
| `AdaptTabFrom1InteriorResumeTest` | 初始选项 1、背景中段；交互后前后台恢复时的选择、文字与几何保持 | 24 |
| `AdaptTabFrom1StartForegroundTest` | 初始选项 1、背景顶部；前台交互时的选择、文字与几何保持 | 26 |
| `AdaptTabFrom1StartResumeTest` | 初始选项 1、背景顶部；交互后前后台恢复时的选择、文字与几何保持 | 17 |
| `AdaptTabFrom2EndForegroundTest` | 初始选项 2、背景末端；前台交互时的选择、文字与几何保持 | 15 |
| `AdaptTabFrom2EndResumeTest` | 初始选项 2、背景末端；交互后前后台恢复时的选择、文字与几何保持 | 17 |
| `AdaptTabFrom2InteriorForegroundTest` | 初始选项 2、背景中段；前台交互时的选择、文字与几何保持 | 24 |
| `AdaptTabFrom2InteriorResumeTest` | 初始选项 2、背景中段；交互后前后台恢复时的选择、文字与几何保持 | 23 |
| `AdaptTabFrom2StartForegroundTest` | 初始选项 2、背景顶部；前台交互时的选择、文字与几何保持 | 14 |
| `AdaptTabFrom2StartResumeTest` | 初始选项 2、背景顶部；交互后前后台恢复时的选择、文字与几何保持 | 18 |
| `AdaptTabFrom3EndForegroundTest` | 初始选项 3、背景末端；前台交互时的选择、文字与几何保持 | 32 |
| `AdaptTabFrom3EndResumeTest` | 初始选项 3、背景末端；交互后前后台恢复时的选择、文字与几何保持 | 15 |
| `AdaptTabFrom3InteriorForegroundTest` | 初始选项 3、背景中段；前台交互时的选择、文字与几何保持 | 35 |
| `AdaptTabFrom3InteriorResumeTest` | 初始选项 3、背景中段；交互后前后台恢复时的选择、文字与几何保持 | 19 |
| `AdaptTabFrom3StartForegroundTest` | 初始选项 3、背景顶部；前台交互时的选择、文字与几何保持 | 10 |
| `AdaptTabFrom3StartResumeTest` | 初始选项 3、背景顶部；交互后前后台恢复时的选择、文字与几何保持 | 9 |
