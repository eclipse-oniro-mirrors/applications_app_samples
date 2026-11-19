# BuilderParamSample 测试用例

本文按 2026-11-19 的测试源码整理，结构参考 ArkTSStaticSample 的 ohosTest.md。
用例数量来自当前源码，执行结果来自指定历史归档；本次文档更新未构建或运行测试。

## 基础功能用例

预置条件：连接并解锁 API 26 真机，安装主应用与测试 HAP。
主页面断言使用真实 EntryAbility，插槽及状态变更用例使用测试包 FixtureAbility 承载生产组件。
以下结果对应 2026-11-18 的 DevEco 全量通过记录，属于后文套件的功能摘要，不重复计数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 行程页面内容 | 主应用已安装 | 启动 EntryAbility | 显示“行程规划”及出行前第 7/6/5 天三张卡片，内容、顺序和数量正确 | 是 | Pass（历史全量） |
| 多 BuilderParam 与布局 | 真实主页面就绪 | 查询标签、详情、标题、说明和分隔线边界 | 标签在详情左侧，标题在说明上方，分隔线在行下方，卡片宽度正确 | 是 | Pass（历史全量） |
| 尾随闭包与默认对齐 | Fixture 中创建生产 Card | 三槽显式传参，或向前两槽传参并以尾随闭包传 labelContent；省略 verticalAlign | 各槽内容正确，尾随内容归属 labelContent，省略属性时按 Center 对齐 | 是 | Pass（历史全量） |
| 插槽动态拓扑 | Fixture 页面就绪 | 移除/恢复槽位，切换 Text、Button、嵌套 Card 和底部多根内容 | 无旧节点残留，存在性、文字、布局和回调与当前槽位一致 | 是 | Pass（历史全量） |
| 属性绑定与兄弟隔离 | 真实 CustomCard 实例已显示 | 更新 title、description、symbol 或 testId，清空再恢复 | 目标实例更新，其他字段与兄弟实例保持，节点身份与布局正确 | 是 | Pass（历史全量） |
| Builder owner 与事件 | 已挂载不同 owner 的 Builder | 交错点击、更新、隐藏、卸载再挂载 | Builder 读取所属 owner 状态，回调计数和事件不串到兄弟或旧实例 | 是 | Pass（历史全量） |
| 宽度和对齐历史 | 已显示不同高度的槽内容 | 100%/64% 往返，切换 Top/Center/Bottom | 实际宽度和垂直对齐正确，恢复后几何满足原约束 | 是 | Pass（历史全量） |
| 前后台与主页面隔离 | 业务页或 fixture 已有状态 | Home、恢复、重复启动同一 Ability | 生命周期与实例状态符合预期，fixture 不污染真实行程页面 | 是 | Pass（历史全量） |
| 系统 ResourceStr | 系统资源可读取 | 将真实 sys.string.general_copy 资源传入生产 CustomCard | 按当前语言显示正确文字，资源/字符串往返及兄弟隔离正确 | 是 | Pass（历史全量） |
| app string 诊断 | fixture 选择 App resource probe | 传入 app.string.fixture_card_description | 直接 Text 与 CustomCard 均应显示 app 资源文字 | 诊断模式 | 已知限制，未计为通过 |

业务实现见 [Index.ets](entry/src/main/ets/pages/Index.ets) 和 [Card.ets](entry/src/main/ets/pages/Card.ets)。
Card 的 BuilderParam 为 bottomContent、detailContent、labelContent，最后一个 labelContent 接收尾随闭包。
主页面标签 Button 没有 onClick；其当前节点状态为 `isEnabled=true`、`isClickable=false`，点击后核对内容保持。

## 新增自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **88 个套件、1,562 条用例**，
通过 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
下表逐一列出真实 `describe` 名称，可用于 `-s class`；数量按 `it` 定义统计，
不包括公共驱动、fixture、诊断入口或历史局部回归的重复执行次数。

### 核心页面、插槽与状态转换：9 个套件，55 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `BindingUpdatesTest` | Builder 所属状态、独立回调、PropRef 与兄弟隔离、空值/Unicode/多行、系统 ResourceStr 和恢复 | 8 |
| `BuilderSlotsTest` | 三槽显式传参、最后槽尾随闭包、空底部、缺省 Center、Top/Bottom 更新和通用宽度 | 7 |
| `CardLayoutTest` | 标签与详情横向关系、标题/说明顺序、顶部对齐、分隔线、100% 宽度、边距和无重叠 | 7 |
| `CustomCardTransitionsTest` | 单字段更新、标题/说明分别清空、资源类型往返、testId 重绑与多行重排 | 6 |
| `LayoutHistoryTest` | 100% 与 64% 宽度往返、Center/Top/Bottom 循环、高度主导反转及嵌套约束恢复 | 4 |
| `MainContentTest` | 行程规划标题、第 7/6/5 天卡片顺序、详情绑定、数量、尾随标签和分隔线 | 6 |
| `MainInteractionTest` | 点击、长按、真实前后台、重复启动同实例及 fixture 与业务页面隔离 | 5 |
| `OwnerRebindingTest` | 不同 owner、属性更新后回调、卸载重建及隐藏时更新 | 4 |
| `SlotTopologyTest` | 移除与恢复插槽、Text/Button/Nested 替换、底部多根节点和事件隔离 | 8 |

### CustomCard 属性组合：4 个套件，97 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptCustomCardDescriptionTest` | 说明更新、清空与恢复；验证标题、符号和兄弟卡片保持 | 22 |
| `AdaptCustomCardRekeyTest` | testId 重新绑定后的节点迁移、唯一性、字段与布局保持 | 14 |
| `AdaptCustomCardResourceTest` | 系统 ResourceStr 与普通文字往返、独立资源期望值及兄弟状态隔离 | 28 |
| `AdaptCustomCardTitleTest` | 标题替换、空值、Unicode 与多行后的真实文字和几何变化 | 33 |

### Builder owner 与事件归属：3 个套件，88 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptOwnerFooterTest` | 底部 Builder 所属状态、回调归属、重命名/重挂载与前后台后的计数保持 | 35 |
| `AdaptOwnerInterleavedTest` | 交错操作不同 owner、标签/底部回调隔离、状态更新与实例重建 | 20 |
| `AdaptOwnerLabelTest` | 标签 Builder 所属状态、回调归属、属性变化及坐标点击后的计数保持 | 33 |

### 插槽组合的统计口径

以下 72 个套件共 1,322 条，按 Top、Center、Bottom 分表。
Button / Text 表示详情槽内容；Nested 表示详情槽内嵌套生产 Card。
Short / Tall 对应测试夹具中的较低/较高内容，Narrow / Wide 对应 64% / 100% 宽度；
Nested 的 Mounted / Remount 区分保持挂载与卸载重挂载。

各用例按其参数覆盖标签、详情、底部槽的存在/缺失、全空、额外底部根节点、更新或前后台恢复。
断言检查当前节点存在性、文字、唯一性、宽度、包含关系、对齐和适用的回调计数。
这些是现有参数场景的源码清单，不代表每个套件都包含全部操作或组合。

### 顶部对齐插槽：24 个套件，380 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptSlotTopButtonShortLabelShortDetailNarrowTest` | 按钮详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 9 |
| `AdaptSlotTopButtonShortLabelShortDetailWideTest` | 按钮详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 9 |
| `AdaptSlotTopButtonShortLabelTallDetailNarrowTest` | 按钮详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 5 |
| `AdaptSlotTopButtonShortLabelTallDetailWideTest` | 按钮详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 25 |
| `AdaptSlotTopButtonTallLabelShortDetailNarrowTest` | 按钮详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 7 |
| `AdaptSlotTopButtonTallLabelShortDetailWideTest` | 按钮详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 6 |
| `AdaptSlotTopButtonTallLabelTallDetailNarrowTest` | 按钮详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 25 |
| `AdaptSlotTopButtonTallLabelTallDetailWideTest` | 按钮详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 18 |
| `AdaptSlotTopNestedShortLabelMountedNarrowTest` | 嵌套 Card、低标签、64% 宽度；保持挂载时的内外插槽约束 | 16 |
| `AdaptSlotTopNestedShortLabelMountedWideTest` | 嵌套 Card、低标签、100% 宽度；保持挂载时的内外插槽约束 | 24 |
| `AdaptSlotTopNestedShortLabelRemountNarrowTest` | 嵌套 Card、低标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 12 |
| `AdaptSlotTopNestedShortLabelRemountWideTest` | 嵌套 Card、低标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 13 |
| `AdaptSlotTopNestedTallLabelMountedNarrowTest` | 嵌套 Card、高标签、64% 宽度；保持挂载时的内外插槽约束 | 16 |
| `AdaptSlotTopNestedTallLabelMountedWideTest` | 嵌套 Card、高标签、100% 宽度；保持挂载时的内外插槽约束 | 16 |
| `AdaptSlotTopNestedTallLabelRemountNarrowTest` | 嵌套 Card、高标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 4 |
| `AdaptSlotTopNestedTallLabelRemountWideTest` | 嵌套 Card、高标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 13 |
| `AdaptSlotTopTextShortLabelShortDetailNarrowTest` | 文本详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 9 |
| `AdaptSlotTopTextShortLabelShortDetailWideTest` | 文本详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 13 |
| `AdaptSlotTopTextShortLabelTallDetailNarrowTest` | 文本详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 32 |
| `AdaptSlotTopTextShortLabelTallDetailWideTest` | 文本详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 31 |
| `AdaptSlotTopTextTallLabelShortDetailNarrowTest` | 文本详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 21 |
| `AdaptSlotTopTextTallLabelShortDetailWideTest` | 文本详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 31 |
| `AdaptSlotTopTextTallLabelTallDetailNarrowTest` | 文本详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 13 |
| `AdaptSlotTopTextTallLabelTallDetailWideTest` | 文本详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 12 |

### 居中对齐插槽：24 个套件，397 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptSlotCenterButtonShortLabelShortDetailNarrowTest` | 按钮详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 22 |
| `AdaptSlotCenterButtonShortLabelShortDetailWideTest` | 按钮详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 11 |
| `AdaptSlotCenterButtonShortLabelTallDetailNarrowTest` | 按钮详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 26 |
| `AdaptSlotCenterButtonShortLabelTallDetailWideTest` | 按钮详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 27 |
| `AdaptSlotCenterButtonTallLabelShortDetailNarrowTest` | 按钮详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 12 |
| `AdaptSlotCenterButtonTallLabelShortDetailWideTest` | 按钮详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 9 |
| `AdaptSlotCenterButtonTallLabelTallDetailNarrowTest` | 按钮详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 27 |
| `AdaptSlotCenterButtonTallLabelTallDetailWideTest` | 按钮详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 9 |
| `AdaptSlotCenterNestedShortLabelMountedNarrowTest` | 嵌套 Card、低标签、64% 宽度；保持挂载时的内外插槽约束 | 36 |
| `AdaptSlotCenterNestedShortLabelMountedWideTest` | 嵌套 Card、低标签、100% 宽度；保持挂载时的内外插槽约束 | 25 |
| `AdaptSlotCenterNestedShortLabelRemountNarrowTest` | 嵌套 Card、低标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 21 |
| `AdaptSlotCenterNestedShortLabelRemountWideTest` | 嵌套 Card、低标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 17 |
| `AdaptSlotCenterNestedTallLabelMountedNarrowTest` | 嵌套 Card、高标签、64% 宽度；保持挂载时的内外插槽约束 | 28 |
| `AdaptSlotCenterNestedTallLabelMountedWideTest` | 嵌套 Card、高标签、100% 宽度；保持挂载时的内外插槽约束 | 9 |
| `AdaptSlotCenterNestedTallLabelRemountNarrowTest` | 嵌套 Card、高标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 16 |
| `AdaptSlotCenterNestedTallLabelRemountWideTest` | 嵌套 Card、高标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 19 |
| `AdaptSlotCenterTextShortLabelShortDetailNarrowTest` | 文本详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 8 |
| `AdaptSlotCenterTextShortLabelShortDetailWideTest` | 文本详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 2 |
| `AdaptSlotCenterTextShortLabelTallDetailNarrowTest` | 文本详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 3 |
| `AdaptSlotCenterTextShortLabelTallDetailWideTest` | 文本详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 15 |
| `AdaptSlotCenterTextTallLabelShortDetailNarrowTest` | 文本详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 21 |
| `AdaptSlotCenterTextTallLabelShortDetailWideTest` | 文本详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 11 |
| `AdaptSlotCenterTextTallLabelTallDetailNarrowTest` | 文本详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 19 |
| `AdaptSlotCenterTextTallLabelTallDetailWideTest` | 文本详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 4 |

### 底部对齐插槽：24 个套件，545 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `AdaptSlotBottomButtonShortLabelShortDetailNarrowTest` | 按钮详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 27 |
| `AdaptSlotBottomButtonShortLabelShortDetailWideTest` | 按钮详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 21 |
| `AdaptSlotBottomButtonShortLabelTallDetailNarrowTest` | 按钮详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 16 |
| `AdaptSlotBottomButtonShortLabelTallDetailWideTest` | 按钮详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 26 |
| `AdaptSlotBottomButtonTallLabelShortDetailNarrowTest` | 按钮详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 20 |
| `AdaptSlotBottomButtonTallLabelShortDetailWideTest` | 按钮详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 15 |
| `AdaptSlotBottomButtonTallLabelTallDetailNarrowTest` | 按钮详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 26 |
| `AdaptSlotBottomButtonTallLabelTallDetailWideTest` | 按钮详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 27 |
| `AdaptSlotBottomNestedShortLabelMountedNarrowTest` | 嵌套 Card、低标签、64% 宽度；保持挂载时的内外插槽约束 | 19 |
| `AdaptSlotBottomNestedShortLabelMountedWideTest` | 嵌套 Card、低标签、100% 宽度；保持挂载时的内外插槽约束 | 17 |
| `AdaptSlotBottomNestedShortLabelRemountNarrowTest` | 嵌套 Card、低标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 9 |
| `AdaptSlotBottomNestedShortLabelRemountWideTest` | 嵌套 Card、低标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 9 |
| `AdaptSlotBottomNestedTallLabelMountedNarrowTest` | 嵌套 Card、高标签、64% 宽度；保持挂载时的内外插槽约束 | 21 |
| `AdaptSlotBottomNestedTallLabelMountedWideTest` | 嵌套 Card、高标签、100% 宽度；保持挂载时的内外插槽约束 | 39 |
| `AdaptSlotBottomNestedTallLabelRemountNarrowTest` | 嵌套 Card、高标签、64% 宽度；卸载后重挂载时的内外插槽约束 | 14 |
| `AdaptSlotBottomNestedTallLabelRemountWideTest` | 嵌套 Card、高标签、100% 宽度；卸载后重挂载时的内外插槽约束 | 30 |
| `AdaptSlotBottomTextShortLabelShortDetailNarrowTest` | 文本详情、低标签/低详情、64% 宽度下的插槽状态与布局 | 20 |
| `AdaptSlotBottomTextShortLabelShortDetailWideTest` | 文本详情、低标签/低详情、100% 宽度下的插槽状态与布局 | 15 |
| `AdaptSlotBottomTextShortLabelTallDetailNarrowTest` | 文本详情、低标签/高详情、64% 宽度下的插槽状态与布局 | 29 |
| `AdaptSlotBottomTextShortLabelTallDetailWideTest` | 文本详情、低标签/高详情、100% 宽度下的插槽状态与布局 | 29 |
| `AdaptSlotBottomTextTallLabelShortDetailNarrowTest` | 文本详情、高标签/低详情、64% 宽度下的插槽状态与布局 | 32 |
| `AdaptSlotBottomTextTallLabelShortDetailWideTest` | 文本详情、高标签/低详情、100% 宽度下的插槽状态与布局 | 33 |
| `AdaptSlotBottomTextTallLabelTallDetailNarrowTest` | 文本详情、高标签/高详情、64% 宽度下的插槽状态与布局 | 20 |
| `AdaptSlotBottomTextTallLabelTallDetailWideTest` | 文本详情、高标签/高详情、100% 宽度下的插槽状态与布局 | 31 |