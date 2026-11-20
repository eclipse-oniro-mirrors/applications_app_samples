# MultiMusic 测试用例归档

共 **37 个套件 / 2461 条用例**，全部为 Hypium 自动化用例，源码位于 `entry/src/ohosTest/ets/test/`（37 个套件文件合计 55,730 行，另有只做注册的 `List.test.ets` 96 行；`entry/src/ohosTest` 全目录 50 个文件 56,392 行）。

用例分三层覆盖：

| 层 | 用例数 | 套件构成 |
|---|---|---|
| 真实行为（手写） | 206 | ActsAbilityTest 6 + BreakpointReal 40 + ModelReal 40 + SongsDataReal 40 + ResourceReal 40 + LayoutReal 40 |
| 规格回归（批量覆盖） | 2175 | 29 个 Matrix 套件（各 75 条）：BreakpointMatrix01~12、BreakpointState01~02、ModelMatrix01~07、SongsDataMatrix01~04、ResourceMatrix01~03、LayoutMatrix01 |
| UI 探针（`@kit.TestKit`） | 80 | UiTabsReal 40 + UiLayoutReal 40 |

`@tc.size` 分布：MEDIUMTEST 2461；`@tc.level` 分布：Level0 2214 / Level1 247。

全部用例共 7,516 条断言（`expect(...)` 计数），单条用例最少 2 条。

## 用例文件与规模

| 套件文件 | 域名 | 用例数 | 行数 | `@tc.size` | `@tc.level` |
|---|---|---|---|---|---|
| `Ability.test.ets` | ABIL | 6 | 214 | MEDIUMTEST | Level0 3 / Level1 3 |
| `BreakpointMatrix01.test.ets` | BRKNUM01 | 75 | 1,743 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix02.test.ets` | BRKNUM02 | 75 | 1,743 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix03.test.ets` | BRKNUM03 | 75 | 1,745 | MEDIUMTEST | Level0 72 / Level1 3 |
| `BreakpointMatrix04.test.ets` | BRKSTR01 | 75 | 1,740 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix05.test.ets` | BRKSTR02 | 75 | 1,741 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix06.test.ets` | BRKARR01 | 75 | 1,688 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix07.test.ets` | BRKARR02 | 75 | 1,688 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix08.test.ets` | BRKOBJ01 | 75 | 1,613 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix09.test.ets` | BRKOBJ02 | 75 | 1,612 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix10.test.ets` | BRKOBJ03 | 75 | 1,911 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix11.test.ets` | BRKRES01 | 75 | 1,902 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointMatrix12.test.ets` | BRKMIX01 | 75 | 1,905 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointState01.test.ets` | BRKORD01 | 75 | 1,758 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointState02.test.ets` | BRKISO01 | 75 | 1,837 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix01.test.ets` | MDLICON01 | 75 | 1,683 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix02.test.ets` | MDLICON02 | 75 | 1,682 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix03.test.ets` | MDLOFF01 | 75 | 1,683 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix04.test.ets` | MDLPAD01 | 75 | 1,683 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix05.test.ets` | MDLSONG01 | 75 | 1,683 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix06.test.ets` | MDLSONG02 | 75 | 1,829 | MEDIUMTEST | Level0 73 / Level1 2 |
| `ModelMatrix07.test.ets` | MDLISO01 | 75 | 1,832 | MEDIUMTEST | Level0 73 / Level1 2 |
| `SongsDataMatrix01.test.ets` | DATAMEDIA01 | 75 | 1,439 | MEDIUMTEST | Level0 72 / Level1 3 |
| `SongsDataMatrix02.test.ets` | DATADESC01 | 75 | 1,474 | MEDIUMTEST | Level0 72 / Level1 3 |
| `SongsDataMatrix03.test.ets` | DATAPREFIX01 | 75 | 1,607 | MEDIUMTEST | Level0 72 / Level1 3 |
| `SongsDataMatrix04.test.ets` | DATAPROP01 | 75 | 1,553 | MEDIUMTEST | Level0 72 / Level1 3 |
| `ResourceMatrix01.test.ets` | RESSTR01 | 75 | 1,649 | MEDIUMTEST | Level0 75 |
| `ResourceMatrix02.test.ets` | RESMEDIA01 | 75 | 1,537 | MEDIUMTEST | Level0 75 |
| `ResourceMatrix03.test.ets` | RESID01 | 75 | 1,609 | MEDIUMTEST | Level0 75 |
| `LayoutMatrix01.test.ets` | LAYCFG01 | 75 | 1,737 | MEDIUMTEST | Level0 73 / Level1 2 |
| `BreakpointReal.test.ets` | BRKR | 40 | 886 | MEDIUMTEST | Level0 12 / Level1 28 |
| `ModelReal.test.ets` | MDLR | 40 | 840 | MEDIUMTEST | Level0 13 / Level1 27 |
| `SongsDataReal.test.ets` | DATAR | 40 | 914 | MEDIUMTEST | Level0 18 / Level1 22 |
| `ResourceReal.test.ets` | RESR | 40 | 779 | MEDIUMTEST | Level0 12 / Level1 28 |
| `LayoutReal.test.ets` | LAYR | 40 | 858 | MEDIUMTEST | Level0 10 / Level1 30 |
| `UiTabsReal.test.ets` | UITB | 40 | 938 | MEDIUMTEST | Level0 13 / Level1 27 |
| `UiLayoutReal.test.ets` | UILA | 40 | 995 | MEDIUMTEST | Level0 15 / Level1 25 |
| **合计** | - | **2461** | **55,730** | - | Level0 2214 / Level1 247 |

> 一级套件预置条件统一为「已安装测试 HAP，测试模块资源可按 `entry_test` 加载」；UI 与冒烟套件统一为「已安装测试 HAP，应用已启动并停在首页」，UI 套件另需设备已解锁且无系统弹窗（AAMS 连接）。下表只写与单个用例相关的额外前置。
>
> 手写与 UI 探针套件一例一行；规格回归套件按输入族归档为「主体展开 + 锚点用例」，行内条数与该套件用例数、上表逐行可核。

## 用例号段

`@tc.number` 形如 `SUB_MM_<域>_NNNN`，同一域内连续唯一、不跨主题重号；`@tc.name` 与 `it()` 名称一致。

| 域 | 号段 | 用例数 | 对应套件 |
|---|---|---|---|
| ABIL | 0100..0600 | 6 | ActsAbilityTest |
| BRKARR01 | 0100..7500 | 75 | BreakpointMatrix06 |
| BRKARR02 | 0100..7500 | 75 | BreakpointMatrix07 |
| BRKISO01 | 0100..7500 | 75 | BreakpointState02 |
| BRKMIX01 | 0100..7500 | 75 | BreakpointMatrix12 |
| BRKNUM01 | 0100..7500 | 75 | BreakpointMatrix01 |
| BRKNUM02 | 0100..7500 | 75 | BreakpointMatrix02 |
| BRKNUM03 | 0100..7500 | 75 | BreakpointMatrix03 |
| BRKOBJ01 | 0100..7500 | 75 | BreakpointMatrix08 |
| BRKOBJ02 | 0100..7500 | 75 | BreakpointMatrix09 |
| BRKOBJ03 | 0100..7500 | 75 | BreakpointMatrix10 |
| BRKORD01 | 0100..7500 | 75 | BreakpointState01 |
| BRKR | 0100..4000 | 40 | BreakpointReal |
| BRKRES01 | 0100..7500 | 75 | BreakpointMatrix11 |
| BRKSTR01 | 0100..7500 | 75 | BreakpointMatrix04 |
| BRKSTR02 | 0100..7500 | 75 | BreakpointMatrix05 |
| DATADESC01 | 0100..7500 | 75 | SongsDataMatrix02 |
| DATAMEDIA01 | 0100..7500 | 75 | SongsDataMatrix01 |
| DATAPREFIX01 | 0100..7500 | 75 | SongsDataMatrix03 |
| DATAPROP01 | 0100..7500 | 75 | SongsDataMatrix04 |
| DATAR | 0100..4000 | 40 | SongsDataReal |
| LAYCFG01 | 0100..7500 | 75 | LayoutMatrix01 |
| LAYR | 0100..4000 | 40 | LayoutReal |
| MDLICON01 | 0100..7500 | 75 | ModelMatrix01 |
| MDLICON02 | 0100..7500 | 75 | ModelMatrix02 |
| MDLISO01 | 0100..7500 | 75 | ModelMatrix07 |
| MDLOFF01 | 0100..7500 | 75 | ModelMatrix03 |
| MDLPAD01 | 0100..7500 | 75 | ModelMatrix04 |
| MDLR | 0100..4000 | 40 | ModelReal |
| MDLSONG01 | 0100..7500 | 75 | ModelMatrix05 |
| MDLSONG02 | 0100..7500 | 75 | ModelMatrix06 |
| RESID01 | 0100..7500 | 75 | ResourceMatrix03 |
| RESMEDIA01 | 0100..7500 | 75 | ResourceMatrix02 |
| RESR | 0100..4000 | 40 | ResourceReal |
| RESSTR01 | 0100..7500 | 75 | ResourceMatrix01 |
| UILA | 0100..4000 | 40 | UiLayoutReal |
| UITB | 0100..4000 | 40 | UiTabsReal |

## ActsAbilityTest 套件（`Ability.test.ets`，6 条）

端到端冒烟：经 `abilityDelegatorRegistry` 拉起 `EntryAbility`，校验页签可定位，再请求把窗口宽度缩放到 360vp / 800vp / 1080vp；全屏窗口会拒绝 `resize()`，用例按尽力而为处理，只断言窗口随后仍可用。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify the application starts and its window survives a narrow 360vp resize. | 首页 | await startApp() | ready 为真；bounds.right > bounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the application window survives a medium 800vp resize. | 首页 | await startApp() | ready 为真；bounds.right > bounds.left 为真 | 是 | 通过 |
| Verify the application window survives a wide 1080vp resize. | 首页 | await startApp() | ready 为真；bounds.right > bounds.left 为真 | 是 | 通过 |
| Verify the mine tab stays clickable while the window is resized to 360vp. | 首页 | await startApp() | ready 为真；clicked 为真 等 3 条 | 是 | 通过 |
| Verify the mine tab stays clickable while the window is resized to 800vp. | 首页 | await startApp() | ready 为真；clicked 为真 等 3 条 | 是 | 通过 |
| Verify the mine tab stays clickable while the window is resized to 1080vp. | 首页 | await startApp() | ready 为真；clicked 为真 等 3 条 | 是 | 通过 |

## BreakpointMatrix01 套件（`BreakpointMatrix01.test.ets`，75 条）

整数三元组：`BreakpointType<number>` 的三档取值与非法 key 回退。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 整数三元组逐值展开（73 条） | - | `sm/md/lg` 三槽为 `N` / `-3N` / `7N`，key 取三档、`LG`、`Lg`、尾部带空格、空串、`sm2` 等 | 三档 key 各返回自身槽位；大小写变体、带空格与空 key 返回 `undefined` | 是 | 通过 |
| Anchor: empty key and uppercase key must not resolve for numeric triples | - | new BreakpointType<number>(-1, 0, 1) | v0 为 undefined；v1 为 undefined 等 3 条 | 是 | 通过 |
| Anchor: key with trailing space must not resolve and md keeps zero | - | new BreakpointType<number>(0, 0, 2) | v0 为 undefined；v1 = 0 等 3 条 | 是 | 通过 |

## BreakpointMatrix02 套件（`BreakpointMatrix02.test.ets`，75 条）

小数与负值三元组：取值不被取整，也不被折叠为正数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 小数与负值三元组逐值展开（73 条） | - | 三槽为 `0.25N` / `-0.625N` / `1.25N` 形式的小数与负数 | 小数与负数原样返回；非法 key 返回 `undefined` | 是 | 通过 |
| Anchor: key with trailing space must not resolve and md keeps zero | - | new BreakpointType<number>(0, 0, 2) | v0 为 undefined；v1 = 0 等 3 条 | 是 | 通过 |
| Anchor: empty key and uppercase key must not resolve for numeric triples | - | new BreakpointType<number>(-1, 0, 1) | v0 为 undefined；v1 为 undefined 等 3 条 | 是 | 通过 |

## BreakpointMatrix03 套件（`BreakpointMatrix03.test.ets`，75 条）

数值极值：`Number.MAX_VALUE` / `MIN_VALUE` / `NaN` / `Infinity` 与 `±0` 的保真。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 数值极值逐值展开（72 条） | - | 三槽取 `Number.MAX_VALUE`、`Number.MIN_VALUE`、`NaN`、`Infinity`、`-Infinity`、`±0` | 有限值原样返回；`NaN` 与无穷按原值返回；非法 key 仍为 `undefined` | 是 | 通过 |
| Anchor: NaN field must not leak into other breakpoint slots | - | new BreakpointType<number>(Number.NaN, Number.NaN, 7) | v0 为 NaN；v1 = 7 等 3 条 | 是 | 通过 |
| Anchor: negative zero must keep its sign in the sm slot | - | new BreakpointType<number>(-0, 1, 2) | v0 = Number.NEGATIVE_INFINITY；sut.getValue('sm') === 0 为真 等 3 条 | 是 | 通过 |
| Anchor: all three slots NaN must stay NaN per key | - | new BreakpointType<number>(Number.NaN, Number.NaN, Number.NaN) | v0 为 NaN；v1 为 NaN 等 3 条 | 是 | 通过 |

## BreakpointMatrix04 套件（`BreakpointMatrix04.test.ets`，75 条）

ASCII 字符串：空串是合法槽位值，但空 key 不命中。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| ASCII 字符串逐值展开（73 条） | - | 三槽为普通 ASCII 字符串，含空串与超长串，key 含大小写与空格变体 | 字符串原样返回；空串槽位可读出，空 key 返回 `undefined` | 是 | 通过 |
| Anchor: resource-like text must not be treated as breakpoint key | - | new BreakpointType<string>('small', 'medium', 'large') | v0 为 undefined；v1 = 'large' 等 3 条 | 是 | 通过 |
| Anchor: empty string is a legitimate stored value but whitespace key is not | - | new BreakpointType<string>('', 'm', 'l') | v0 = ''；v1 为 undefined 等 3 条 | 是 | 通过 |

## BreakpointMatrix05 套件（`BreakpointMatrix05.test.ets`，75 条）

Unicode 与超长字符串：多字节内容按 UTF-16 原样返回。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Unicode 字符串逐值展开（73 条） | - | 中文、emoji、带重音字符与超长串，含 `$string:` 形式文本 | 内容原样返回且长度不变；`$string:` 文本不被当作断点 key | 是 | 通过 |
| Anchor: empty string is a legitimate stored value but whitespace key is not | - | new BreakpointType<string>('', 'm', 'l') | v0 = ''；v1 为 undefined 等 3 条 | 是 | 通过 |
| Anchor: resource-like text must not be treated as breakpoint key | - | new BreakpointType<string>('small', 'medium', 'large') | v0 为 undefined；v1 = 'large' 等 3 条 | 是 | 通过 |

## BreakpointMatrix06 套件（`BreakpointMatrix06.test.ets`，75 条）

数值数组：返回同一数组引用，元素顺序与长度保持。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 数值数组逐值展开（73 条） | - | `number[]` 长度 1、2、较大值与空数组 | 返回同一数组引用，长度与末元素保持；非法 key 返回 `undefined` | 是 | 通过 |
| Anchor: empty array slot must stay empty and undefined for invalid key | - | [] | sut.getValue('sm') === empty 为真；v0 = 0 等 3 条 | 是 | 通过 |
| Anchor: large array boundary keeps length and last element | - | [] | v0 = 100；v1 = 99 等 3 条 | 是 | 通过 |

## BreakpointMatrix07 套件（`BreakpointMatrix07.test.ets`，75 条）

字符串数组：与数值数组同一契约，元素顺序不变。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 字符串数组逐值展开（73 条） | - | `string[]` 长度 1、2、较大值与空数组 | 返回同一数组引用，元素顺序不变；非法 key 返回 `undefined` | 是 | 通过 |
| Anchor: large array boundary keeps length and last element | - | [] | v0 = 100；v1 = 99 等 3 条 | 是 | 通过 |
| Anchor: empty array slot must stay empty and undefined for invalid key | - | [] | sut.getValue('sm') === empty 为真；v0 = 0 等 3 条 | 是 | 通过 |

## BreakpointMatrix08 套件（`BreakpointMatrix08.test.ets`，75 条）

`IconItem` 实例：三槽分别返回各自实例，描述互不串位。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| `IconItem` 实例逐值展开（73 条） | - | 三槽各放一个 `IconItem`，媒体与描述两两不同 | 三槽分别返回各自实例；非法 key 返回 `undefined` | 是 | 通过 |
| Anchor: IconItem reference must survive a repeated read | - | new IconItem($r('app.media.list1'), labelByName('song_label_01')) | sut.getValue('lg') === first 为真；v0 = labelByName('song_label_01') 等 3 条 | 是 | 通过 |
| Anchor: IconItem slots must keep separate descriptions | - | new BreakpointType<IconItem>(new IconItem($r('app.media.list1'), … | v0 = "a"；v1 = "c" 等 3 条 | 是 | 通过 |

## BreakpointMatrix09 套件（`BreakpointMatrix09.test.ets`，75 条）

`OffsetDataType` 实例：偏移字段保真，负值不被折叠为正。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| `OffsetDataType` 实例逐值展开（73 条） | - | 三槽各放一个 `OffsetDataType`，含负偏移与零 | `x` / `y` 与构造入参一致；非法 key 返回 `undefined` | 是 | 通过 |
| Anchor: zero offset must keep both fields at zero | - | new BreakpointType<OffsetDataType>(new OffsetDataType(0, 0), new … | v0 = 0；v1 = 0 等 3 条 | 是 | 通过 |
| Anchor: negative offset must not be folded into positive values | - | new BreakpointType<OffsetDataType>(new OffsetDataType(11, -11), n… | v0 = -11；v1 = -11 等 3 条 | 是 | 通过 |

## BreakpointMatrix10 套件（`BreakpointMatrix10.test.ets`，75 条）

接口类型：满足同一接口的两个不同实现对象分别入槽。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 接口类型实例逐值展开（73 条） | - | 满足同一接口的两个不同实现对象 | 返回同一对象标识且字段完整；两槽标识不相同 | 是 | 通过 |
| Anchor: interface value with disabled flag must keep boolean false | - | { id: 7, label: 'disabled', enabled: false } | v0 = false；v1 = 7 等 3 条 | 是 | 通过 |
| Anchor: two interface slots must hold different identifiers | - | { id: 1, label: 'low', enabled: false } | v0 = 2；v1 = 1 等 3 条 | 是 | 通过 |

## BreakpointMatrix11 套件（`BreakpointMatrix11.test.ets`，75 条）

`Resource` 值：资源 id 为正，`moduleName` 归属测试模块 `entry_test`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| `Resource` 值逐值展开（73 条） | - | 三槽各放一个 `$r` 资源（字符串与媒体混合） | 资源 id 为正、`moduleName` 为 `entry_test`，三槽互不相同 | 是 | 通过 |
| Anchor: resource slots must keep module metadata for each key | - | new BreakpointType<Resource>($r('app.media.list12'), $r('app.medi… | v0 = $r('app.media.list12').id；v1 = $r('app.media.list1').id 等 3 条 | 是 | 通过 |
| Anchor: resource id must be positive and module name must be entry_test | - | new BreakpointType<Resource>($r('app.media.banner1'), $r('app.med… | sut.md.id > 0 为真；v0 = TEST_MODULE_NAME 等 3 条 | 是 | 通过 |

## BreakpointMatrix12 套件（`BreakpointMatrix12.test.ets`，75 条）

类实例跨槽隔离：`PaddingDataType` 的左右值不跨槽泄漏。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| `PaddingDataType` 实例逐值展开（73 条） | - | 三槽各放一个 `PaddingDataType`，左右值不对称 | 返回对应槽位的类实例，`left` / `right` 不跨槽泄漏 | 是 | 通过 |
| Anchor: SongType slots must keep their own count | - | new BreakpointType<SongType>(new SongType($r('app.media.list4'), … | v0 = 16；v1 = 48 等 3 条 | 是 | 通过 |
| Anchor: PaddingDataType slots must keep left and right separately | - | new BreakpointType<PaddingDataType>(new PaddingDataType(16, 16), … | v0 = 24；v1 = 24 等 3 条 | 是 | 通过 |

## BreakpointState01 套件（`BreakpointState01.test.ets`，75 条）

key 读取顺序：返回值与赋值、读取顺序无关。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| key 顺序组合逐值展开（73 条） | - | 以 `md>sm>lg`、`sm>lg>md`、`lg>sm>md` 等六种顺序赋值并重复读取 | 返回值与赋值顺序无关，重复读取同一 key 结果稳定 | 是 | 通过 |
| Anchor: invalid keys interleaved between valid reads must not affect results | - | new BreakpointType<string>('s', 'm', 'l') | v0 为 undefined；v1 = 'l' 等 3 条 | 是 | 通过 |
| Anchor: repeated reads of the same key stay stable | - | new BreakpointType<string>('s', 'm', 'l') | v0 = 'm'；v1 = 'm' 等 3 条 | 是 | 通过 |

## BreakpointState02 套件（`BreakpointState02.test.ets`，75 条）

实例隔离：两个独立三元组互不影响。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 双实例隔离逐值展开（73 条） | - | 两个独立三元组，修改并重置其中一个 | 另一个实例的槽位完全不受影响 | 是 | 通过 |
| Anchor: mutating all three fields of A must leave B untouched | - | new BreakpointType<number>(1, 2, 3) | v0 = 6；v1 = 30 等 3 条 | 是 | 通过 |
| Anchor: resetting A to the original values must not change B | - | new BreakpointType<string>('a', 'b', 'c') | v0 = 'c'；v1 = 'c' 等 3 条 | 是 | 通过 |

## ModelMatrix01 套件（`ModelMatrix01.test.ets`，75 条）

`IconItem` 字符串描述：`description` 保持字符串形态，不被包装成资源。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 字符串描述逐媒体展开（73 条） | - | 媒体资源配普通字符串描述，含空串与超长串 | `description` 保持字符串形态与内容，`typeof` 为 `string` | 是 | 通过 |
| Anchor: empty description is preserved as empty string not as undefined | - | new IconItem($r('app.media.list1'), '') | v0 = ''；typeof item.description === 'string' 为真 等 3 条 | 是 | 通过 |
| Anchor: description union must report the resource state when a Resource is passed | - | new IconItem($r('app.media.ic_play'), $r('app.string.index')) | typeof item.description === 'string' 为假；v0 = $r('app.string.index').id 等 3 条 | 是 | 通过 |

## ModelMatrix02 套件（`ModelMatrix02.test.ets`，75 条）

`IconItem` 资源描述：`description` 保持资源形态且可解析。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 资源描述逐媒体展开（73 条） | - | 媒体资源配 `$r` 资源描述 | `description` 保持资源形态，id 为正且可解析 | 是 | 通过 |
| Anchor: description union must report the resource state when a Resource is passed | - | new IconItem($r('app.media.ic_play'), $r('app.string.index')) | typeof item.description === 'string' 为假；v0 = $r('app.string.index').id 等 3 条 | 是 | 通过 |
| Anchor: empty description is preserved as empty string not as undefined | - | new IconItem($r('app.media.list1'), '') | v0 = ''；typeof item.description === 'string' 为真 等 3 条 | 是 | 通过 |

## ModelMatrix03 套件（`ModelMatrix03.test.ets`，75 条）

`OffsetDataType`：`x` 与 `y` 不互换，负值与零按原值保存。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 偏移字段逐值展开（73 条） | - | `x` / `y` 取正负值、大值与零，含 `-36 / -2` | 字段原样保留，`x` 与 `y` 不互换 | 是 | 通过 |
| Anchor: zero and negative boundaries must be preserved verbatim | - | new OffsetDataType(0, -0) | v0 = 0；v1 = 0 等 3 条 | 是 | 通过 |
| Anchor: large padding values must not overflow the fields | - | new PaddingDataType(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTE… | v0 = Number.MAX_SAFE_INTEGER；v1 = Number.MAX_SAFE_INTEGER - 1 等 3 条 | 是 | 通过 |

## ModelMatrix04 套件（`ModelMatrix04.test.ets`，75 条）

`PaddingDataType`：左右两侧字段分别保留。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 内边距字段逐值展开（73 条） | - | `left` / `right` 取 0、负数、大值与不对称组合 | 两侧字段分别保留，零与负数按原值保存 | 是 | 通过 |
| Anchor: large padding values must not overflow the fields | - | new PaddingDataType(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTE… | v0 = Number.MAX_SAFE_INTEGER；v1 = Number.MAX_SAFE_INTEGER - 1 等 3 条 | 是 | 通过 |
| Anchor: zero and negative boundaries must be preserved verbatim | - | new OffsetDataType(0, -0) | v0 = 0；v1 = 0 等 3 条 | 是 | 通过 |

## ModelMatrix05 套件（`ModelMatrix05.test.ets`，75 条）

`SongType` 构造：三个字段与入参一致。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 歌单字段逐值展开（73 条） | - | 三个字段分别取边界值，含数量 0 与大数 | 三个字段与入参一致，数量保持 `number` 类型 | 是 | 通过 |
| Anchor: song count zero is a valid boundary | - | new SongType($r('app.media.list13'), $r('app.string.emo'), 0) | v0 = 0；song.count === 0 为真 等 3 条 | 是 | 通过 |
| Anchor: large song count must stay a plain number | - | new SongType($r('app.media.list1'), $r('app.string.rock'), 100000… | v0 = 1000000；song.count > 999999 为真 等 3 条 | 是 | 通过 |

## ModelMatrix06 套件（`ModelMatrix06.test.ets`，75 条）

`SongType` 字段更新：只改数量，其余字段不动。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 字段更新逐值展开（73 条） | - | 修改 `count` 后再读其余字段 | 只改变数量，两个资源字段不动；数量 0 为合法边界 | 是 | 通过 |
| Anchor: large song count must stay a plain number | - | new SongType($r('app.media.list1'), $r('app.string.rock'), 100000… | v0 = 1000000；song.count > 999999 为真 等 3 条 | 是 | 通过 |
| Anchor: song count zero is a valid boundary | - | new SongType($r('app.media.list13'), $r('app.string.emo'), 0) | v0 = 0；song.count === 0 为真 等 3 条 | 是 | 通过 |

## ModelMatrix07 套件（`ModelMatrix07.test.ets`，75 条）

实例隔离：多个 `OffsetDataType` 实例之间不共享字段状态。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 实例隔离逐值展开（73 条） | - | 多个 `OffsetDataType` 实例，逐个修改 | 实例之间不共享字段状态，修改一个不影响其余 | 是 | 通过 |
| Anchor: three instances must keep three different counts | - | new SongType($r('app.media.list1'), $r('app.string.emo'), 1) | v0 = 6；first.count === second.count 为假 等 3 条 | 是 | 通过 |
| Anchor: mutating one instance must not move the others | - | new PaddingDataType(1, 1) | v0 = 2；v1 = 99 等 3 条 | 是 | 通过 |

## SongsDataMatrix01 套件（`SongsDataMatrix01.test.ets`，75 条）

图片映射：索引 0 ~ 11 依次指向 `list12` ~ `list1`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 封面逐索引展开（72 条） | - | 索引 0 ~ 11 逐个读取 `imageSrc`，含越界索引 | 依次指向 `list12` ~ `list1`，id 为正且 `moduleName` 为 `entry_test`；越界不返回媒体 | 是 | 通过 |
| Anchor: songsList media mapping must stay reversed from list12 to list1 | - | songsList[0].imageSrc.id | v0 = $r('app.media.list12').id；v1 = $r('app.media.list1').id 等 3 条 | 是 | 通过 |
| Anchor: songsList media ids must be pairwise distinct for all 12 entries | - | songsList[0].imageSrc.id !== songsList[1].imageSrc.id | songsList[0].imageSrc.id !== songsList[1].imageSrc.id 为真；songsList[5].imageSrc.id !== songsList[6].imageSrc.id 为真 等 3 条 | 是 | 通过 |
| Anchor: unknown index boundary of songsList must not return a media | - | songsList.length | v0 = 12；v1 = $r('app.media.list1').id 等 3 条 | 是 | 通过 |

## SongsDataMatrix02 套件（`SongsDataMatrix02.test.ets`，75 条）

描述映射：6 个 `song_label` 字符串资源循环。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 描述逐索引展开（72 条） | - | 索引 0 ~ 11 逐个读取 `description` | 在 6 个 `song_label` 资源间循环，解析文本与资源名一致 | 是 | 通过 |
| Anchor: songsList descriptions must contain exactly six distinct values | - | new Set<string>(songsList.map((item: IconItem): string => resolve… | v0 = 6；v1 = 12 等 3 条 | 是 | 通过 |
| Anchor: songsList first and last description rows | - | resolveLabel(songsList[0].description) | v0 = labelByName('song_label_01')；v1 = labelByName('song_label_06') 等 3 条 | 是 | 通过 |
| Anchor: description must be a string resource in songsList | - | songsList.length | typeof songsList[0].description === 'object' 为真；typeof songsList[11].description === 'object' 为真 等 3 条 | 是 | 通过 |

## SongsDataMatrix03 套件（`SongsDataMatrix03.test.ets`，75 条）

前缀分布：每个前缀出现两次，「每日私选」行不带冒号。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 前缀分布逐角度展开（72 条） | - | 按 6 个歌单前缀统计条目，含切片、计数与组合不变式 | 每个前缀出现两次；两条「每日私选」共用同一描述且不带冒号 | 是 | 通过 |
| Anchor: unknown prefix must match nothing in songsList | - | songsList.filter((item: IconItem) => (resolveLabel(item.descripti… | v0 = 0；v1 = 12 等 3 条 | 是 | 通过 |
| Anchor: prefix matching must be anchored at index 0 not anywhere | - | songsList.filter((item: IconItem) => (resolveLabel(item.descripti… | v0 = 10；v1 = 0 等 3 条 | 是 | 通过 |
| Anchor: private selection rows share one description and carry no colon | - | songsList.filter((item: IconItem) => (resolveLabel(item.descripti… | v0 = 2；v1 = colonFreePrefix() 等 3 条 | 是 | 通过 |

## SongsDataMatrix04 套件（`SongsDataMatrix04.test.ets`，75 条）

条目属性：每条同时具备媒体与文本，字段类型正确。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 条目属性逐角度展开（72 条） | - | 逐条检查媒体与文本字段 | 每条同时具备媒体与文本，字段类型与取值域正确 | 是 | 通过 |
| Anchor: songsList index range must be exactly 0..11 | - | songsList.length | v0 = 12；v1 = $r('app.media.list1').id 等 3 条 | 是 | 通过 |
| Anchor: songsList must not contain an entry with empty description | - | songsList.filter((item: IconItem) => (resolveLabel(item.descripti… | v0 = 0；v1 = 0 等 3 条 | 是 | 通过 |
| Anchor: songsList entries must expose both media and text | - | songsList.filter((item: IconItem) => item.imageSrc.id > 0).length | v0 = 12；v1 = 12 等 3 条 | 是 | 通过 |

## ResourceMatrix01 套件（`ResourceMatrix01.test.ets`，75 条）

字符串资源：43 个 `app.string` 逐键读取，期望值按资源名在设备上解析，不绑定语种。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 字符串资源逐键展开（75 条） | - | 43 个 `app.string` 按键读取取值、长度与去空白形式 | 每个键都能取到非空字符串，不含 `$string:` 原文，首尾无多余空白 | 是 | 通过 |

## ResourceMatrix02 套件（`ResourceMatrix02.test.ets`，75 条）

媒体资源：43 个 `app.media` 逐键读取字节内容。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 媒体资源逐键展开（75 条） | - | 43 个 `app.media` 逐键读取 | 每个资源都能取到非零字节内容 | 是 | 通过 |

## ResourceMatrix03 套件（`ResourceMatrix03.test.ets`，75 条）

资源标识：id、`moduleName` 与资源名的一致性与唯一性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 资源标识逐键展开（75 条） | - | 逐键比较 id、`moduleName` 与资源名 | id 为正、`moduleName` 为 `entry_test`，不同键的 id 不重复 | 是 | 通过 |

## LayoutMatrix01 套件（`LayoutMatrix01.test.ets`，75 条）

布局常量表：三档列数、列模板、行间距、轮播数量与页面内边距逐项核对 `Constants.ets`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 布局常量逐项展开（73 条） | - | 三档列数、列模板、行间距、轮播数量与页面内边距常量逐项读取，含 12 首歌的行数不变式 | 与 `Constants.ets` 声明一致，行数为 `ceil(12 / cols)`；非法断点 key 被拒绝 | 是 | 通过 |
| Anchor: invalid breakpoint key must not silently select a column count | - | new BreakpointType<number>(3, 5, 6) | picked 为 undefined；v0 = 6 等 3 条 | 是 | 通过 |
| Anchor: uppercase breakpoint key must be rejected by the layout table | - | new BreakpointType<number>(3, 5, 6) | picked 为 undefined；v0 = 'present' 等 3 条 | 是 | 通过 |

## BreakpointReal 套件（`BreakpointReal.test.ets`，40 条）

真实三档配置：直接断言 `Index` / `TitleBar` / `RecommendPage` 中 `BreakpointType` 三元组的槽位取值、数值保真与极值、非法 key 回退、引用与状态稳定性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify Index GridRow columns triple 4/8/12 resolves per breakpoint key. | - | new BreakpointType<number>(4, 8, 12) | sm = 4；sut.getValue('md') = 8 等 3 条 | 是 | 通过 |
| Verify Index GridCol span triple keeps the same 4/8/12 values read in reverse order. | - | new BreakpointType<number>(4, 8, 12) | lg = 12；sut.getValue('md') = 8 等 4 条 | 是 | 通过 |
| Verify Index Tabs barPosition switches to start only on the large breakpoint. | - | new BreakpointType<string>('end', 'end', 'start') | sm = 'end'；sut.getValue('md') = 'end' 等 4 条 | 是 | 通过 |
| Verify Index Tabs vertical flag is only enabled on the large breakpoint. | - | new BreakpointType<boolean>(false, false, true) | sm 为假；md 为假 等 4 条 | 是 | 通过 |
| Verify RecommendPage song grid has 3/5/6 equal columns per breakpoint. | - | new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', | smColumns = 3；mdColumns = 5 等 3 条 | 是 | 通过 |
| Verify UserSongList grid keeps a single column on sm and 5/6 columns above it. | - | new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', | smColumns = 1；sut.getValue('md') === sut.getValue('md') 为真 等 4 条 | 是 | 通过 |
| Verify ListModule horizontal list spacing grows from 0 to 35 and 63. | - | new BreakpointType<number>(0, 35, 63) | sm = 0；sut.getValue('md') = 35 等 4 条 | 是 | 通过 |
| Verify banner swiper indicator dots stay visible on sm only. | - | new BreakpointType<boolean>(true, false, false) | sm 为真；md 为假 等 4 条 | 是 | 通过 |
| Verify banner swiper shows 1/2/3 cards as the breakpoint widens. | - | new BreakpointType<number>(1, 2, 3) | sm = 1；md = 2 等 5 条 | 是 | 通过 |
| Verify TitleBar GridRow uses 8/16/24 columns while its four GridCol spans stay fixed. | - | new BreakpointType<number>(8, 16, 24) | lgColumns = 24；lgSpanCount = 4 等 4 条 | 是 | 通过 |
| Verify all three keys return zero when zero is stored at every slot. | - | new BreakpointType<number>(0, 0, 0) | sm = 0；sut.getValue('md') = 0 等 4 条 | 是 | 通过 |
| Verify 32 bit boundary integers survive the constructor without clamping. | - | new BreakpointType<number>(2147483647, -2147483648, 0) | sm = 2147483647；md = -2147483648 等 4 条 | 是 | 通过 |
| Verify the maximum safe integer is returned unchanged from both edge keys. | - | new BreakpointType<number>(Number.MAX_SAFE_INTEGER, 0, | sm = Number.MAX_SAFE_INTEGER；lg = Number.MIN_SAFE_INTEGER 等 4 条 | 是 | 通过 |
| Verify decimal values keep their binary representation instead of being rounded. | - | new BreakpointType<number>(0.1 + 0.2, 0.3, 1 / 3) | sm = 0.30000000000000004；md = 0.3 等 4 条 | 是 | 通过 |
| Verify negative slot values are never folded into their absolute value. | - | new BreakpointType<number>(-1, -2, -3) | md = -2；lg = -3 等 4 条 | 是 | 通过 |
| Verify a NaN slot stays NaN and does not poison the other two slots. | - | new BreakpointType<number>(Number.NaN, 1, 2) | raw 为 NaN；Number.isNaN(sm) 为真 等 4 条 | 是 | 通过 |
| Verify positive and negative infinity are preserved per slot. | - | new BreakpointType<number>(Number.POSITIVE_INFINITY, 0, | sm = Number.POSITIVE_INFINITY；lg = Number.NEGATIVE_INFINITY 等 4 条 | 是 | 通过 |
| Verify negative zero stays distinguishable from positive zero in the two slots. | - | new BreakpointType<number>(-0, 0, 1) | 1 / pickNumber(sm, 1) === Number.NEGATIVE_INFINITY 为真；1 / pickNumber(md, 1) === Number.POSITIVE_INFINITY 为真 等 4 条 | 是 | 通过 |
| Verify the empty key is rejected while valid keys keep working. | - | new BreakpointType<string>('s', 'm', 'l') | empty 为 undefined；sut.getValue('sm') = 's' 等 3 条 | 是 | 通过 |
| Verify an upper case key is rejected because matching is case sensitive. | - | new BreakpointType<string>('s', 'm', 'l') | upper 为 undefined；sut.getValue('lg') = 'l' 等 3 条 | 是 | 通过 |
| Verify the mixed case key Lg is rejected without touching the lower case slot. | - | new BreakpointType<number>(1, 2, 3) | mixed 为 undefined；sut.getValue('lg') = 3 等 3 条 | 是 | 通过 |
| Verify a trailing space in the key is not trimmed before matching. | - | new BreakpointType<number>(1, 2, 3) | trailing 为 undefined；sut.getValue('lg') = 3 等 3 条 | 是 | 通过 |
| Verify a leading space in the key is not trimmed before matching. | - | new BreakpointType<number>(1, 2, 3) | leading 为 undefined；sut.getValue('sm') = 1 等 3 条 | 是 | 通过 |
| Verify the descriptive key large is rejected because only lg is accepted. | - | new BreakpointType<string>('a', 'b', 'c') | longKey 为 undefined；sut.getValue('lg') = 'c' 等 3 条 | 是 | 通过 |
| Verify the suffixed key sm2 is rejected and does not match sm by prefix. | - | new BreakpointType<string>('a', 'b', 'c') | suffixed 为 undefined；sut.getValue('sm') = 'a' 等 3 条 | 是 | 通过 |
| Verify the upper case MD key does not resolve the md slot. | - | new BreakpointType<number>(7, 8, 9) | upper 为 undefined；lower = 8 等 3 条 | 是 | 通过 |
| Verify a tab character inside the key keeps the lookup unresolved. | - | new BreakpointType<number>(7, 8, 9) | tabbed 为 undefined；sut.getValue('md') = 8 等 3 条 | 是 | 通过 |
| Verify a newline terminated key keeps the lookup unresolved. | - | new BreakpointType<number>(7, 8, 9) | newlined 为 undefined；sut.getValue('lg') = 9 等 3 条 | 是 | 通过 |
| Verify the plural key mds is rejected instead of matching md. | - | new BreakpointType<boolean>(true, false, true) | plural 为 undefined；sut.getValue('md') 为假 等 3 条 | 是 | 通过 |
| Verify the all caps key SMALL does not resolve any slot. | - | new BreakpointType<string>('small', 'medium', 'large') | caps 为 undefined；sut.getValue('sm') = 'small' 等 4 条 | 是 | 通过 |
| Verify writing the lg field is visible through getValue immediately. | - | new BreakpointType<string>('s', 'm', 'l') | lg = 'lg-after-write'；sut.getValue('sm') = 's' 等 3 条 | 是 | 通过 |
| Verify writing the md field leaves the sm and lg slots untouched. | - | new BreakpointType<number>(4, 8, 12) | md = 10；sut.getValue('sm') = 4 等 3 条 | 是 | 通过 |
| Verify mutating one instance never leaks into a second instance. | - | new BreakpointType<number>(4, 8, 12) | firstLg = 24；secondLg = 12 等 3 条 | 是 | 通过 |
| Verify getValue returns the very object stored in the field, not a copy. | - | new PaddingDataType(16, 24) | got === padding 为真；got === sut.lg 为真 等 4 条 | 是 | 通过 |
| Verify a value read back can drive a further write without corrupting the other slots. | - | new BreakpointType<number>(1, 2, 3) | lg = 12；sut.getValue('md') = 2 等 3 条 | 是 | 通过 |
| Verify the string union type reports undefined for a miss and a value for a hit. | - | new BreakpointType<string>('sm-value', 'md-value', 'lg-value') | miss 为 undefined；hit = 'lg-value' 等 3 条 | 是 | 通过 |
| Verify a Resource slot keeps its media identifier through getValue. | - | new BreakpointType<Resource>($r('app.media.list1'), $r('app.media… | lgId = $r('app.media.list3').id；lgId > 0 为真 等 3 条 | 是 | 通过 |
| Verify an IconItem slot keeps its description string through getValue. | - | new BreakpointType<IconItem>(new IconItem($r('app.media.list4'), … | description = labelByName('index')；description.length = 2 等 3 条 | 是 | 通过 |
| Verify the constructor binds the first argument to sm and the third to lg. | - | new BreakpointType<string>('small', 'medium', 'large') | sm = 'small'；md = 'medium' 等 4 条 | 是 | 通过 |
| Verify repeated reads of the three keys stay stable within one instance. | - | new BreakpointType<number>(4, 8, 12) | firstSm = secondSm；sut.getValue('lg') = sut.getValue('lg') 等 4 条 | 是 | 通过 |

## ModelReal 套件（`ModelReal.test.ets`，40 条）

四个数据类（`IconItem` / `OffsetDataType` / `PaddingDataType` / `SongType`）与断点三元组的组合构造，覆盖字符串 / 资源双态描述、偏移、内边距与数量字段的自洽性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify IconItem keeps the tab label string passed together with its icon. | - | new IconItem($r('app.media.ic_public_home'), labelByName('index')) | description = labelByName('index')；item.imageSrc.id = $r('app.media.ic_public_home').id 等 3 条 | 是 | 通过 |
| Verify IconItem accepts a string resource as the label of a tab entry. | - | new IconItem($r('app.media.ic_radio'), $r('app.string.radio')) | isString 为假；labelId = $r('app.string.radio').id 等 3 条 | 是 | 通过 |
| Verify an empty label stays an empty string instead of becoming undefined. | - | new IconItem($r('app.media.ic_find'), '') | description = ''；description.length = 0 等 3 条 | 是 | 通过 |
| Verify a chinese song label keeps every character untouched. | - | new IconItem($r('app.media.list7'), labelByName('song_label_06')) | description = labelByName('song_label_06')；description.indexOf(labelPrefixByName('song_label_06')) = 0 等 3 条 | 是 | 通过 |
| Verify a label that mixes chinese and english keeps its exact content. | - | new IconItem($r('app.media.ic_music_hires'), 'Hi-Res') | description = 'Hi-Res'；description.indexOf('-') = 2 等 3 条 | 是 | 通过 |
| Verify the icon and the label resource are stored as two different resources. | - | new IconItem($r('app.media.ic_mine'), $r('app.string.mine')) | imageId = $r('app.media.ic_mine').id；labelId = $r('app.string.mine').id 等 3 条 | 是 | 通过 |
| Verify replacing the icon of an item leaves its label unchanged. | - | new IconItem($r('app.media.ic_public_home'), labelByName('index')) | item.imageSrc.id = $r('app.media.ic_public_home_filled').id；description = labelByName('index') 等 3 条 | 是 | 通过 |
| Verify replacing the label of an item leaves its icon unchanged. | - | new IconItem($r('app.media.ic_find'), labelByName('discovery')) | labelId = $r('app.string.discovery').id；item.imageSrc.id = $r('app.media.ic_find').id 等 3 条 | 是 | 通过 |
| Verify two IconItem instances never share their label state. | - | new IconItem($r('app.media.list1'), 'first') | firstLabel = 'first-updated'；secondLabel = 'second' 等 3 条 | 是 | 通过 |
| Verify the icon identifier of a real tab entry is a positive resource id. | - | new IconItem($r('app.media.ic_listener'), 'listener') | imageId = $r('app.media.ic_listener').id；imageId > 0 为真 等 3 条 | 是 | 通过 |
| Verify an icon resource keeps the application bundle name. | - | new IconItem($r('app.media.banner1'), 'banner') | bundleName = BUNDLE_NAME；item.imageSrc.id = $r('app.media.banner1').id 等 3 条 | 是 | 通过 |
| Verify a long label is stored in full without truncation. | - | labelByName('song_label_01') | description = longLabel；description.indexOf(':') = 4 等 3 条 | 是 | 通过 |
| Verify the song cover play icon offset keeps x right and y up for desktop breakpoints. | - | new OffsetDataType(11, -11) | offset.x = 11；offset.y = -11 等 3 条 | 是 | 通过 |
| Verify the compact breakpoint offset keeps both axes at zero. | - | new OffsetDataType(0, 0) | offset.x = 0；offset.y = 0 等 3 条 | 是 | 通过 |
| Verify the first constructor argument is stored in x and the second in y. | - | new OffsetDataType(3, 7) | offset.x = 3；offset.y = 7 等 3 条 | 是 | 通过 |
| Verify a negative x is not clamped to zero. | - | new OffsetDataType(-24, 12) | offset.x = -24；offset.x < 0 为真 等 3 条 | 是 | 通过 |
| Verify writing x only leaves y untouched. | - | new OffsetDataType(1, 2) | offset.x = 20；offset.y = 2 等 3 条 | 是 | 通过 |
| Verify two offsets with mirrored values keep independent fields. | - | new OffsetDataType(11, -11) | forward.x = 11；backward.x = -11 等 4 条 | 是 | 通过 |
| Verify a large offset keeps full integer precision. | - | new OffsetDataType(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTE… | offset.x = Number.MAX_SAFE_INTEGER；offset.y = -Number.MAX_SAFE_INTEGER 等 3 条 | 是 | 通过 |
| Verify a decimal offset keeps its fractional part. | - | new OffsetDataType(0.5, -0.5) | offset.x = 0.5；offset.y = -0.5 等 3 条 | 是 | 通过 |
| Verify the compact page padding keeps 16 on both sides. | - | new PaddingDataType(16, 16) | padding.left = 16；padding.right = 16 等 3 条 | 是 | 通过 |
| Verify the large page padding widens both sides to 24. | - | new PaddingDataType(24, 24) | padding.left = 24；padding.right = 24 等 3 条 | 是 | 通过 |
| Verify an asymmetric padding keeps left and right apart. | - | new PaddingDataType(8, 32) | padding.left = 8；padding.right = 32 等 3 条 | 是 | 通过 |
| Verify writing right does not move the left padding. | - | new PaddingDataType(16, 16) | padding.left = 16；padding.right = 40 等 3 条 | 是 | 通过 |
| Verify two padding instances keep their own values after mutation. | - | new PaddingDataType(16, 16) | compact.left = 0；large.left = 24 等 3 条 | 是 | 通过 |
| Verify a zero padding is a valid boundary and stays zero. | - | new PaddingDataType(0, 0) | padding.left = 0；padding.right = 0 等 3 条 | 是 | 通过 |
| Verify the constructor argument order is left then right. | - | new PaddingDataType(12, 48) | padding.left = 12；padding.right = 48 等 3 条 | 是 | 通过 |
| Verify a fractional padding keeps its decimal part on both sides. | - | new PaddingDataType(2.5, 7.5) | padding.left = 2.5；padding.right = 7.5 等 3 条 | 是 | 通过 |
| Verify the first entry of the user song list keeps its cover, label and count. | - | new SongType($r('app.media.list4'), $r('app.string.emo'), 16) | song.count = 16；song.imageSrc.id = $r('app.media.list4').id 等 3 条 | 是 | 通过 |
| Verify a song with a zero count is still constructible and readable. | - | new SongType($r('app.media.list13'), $r('app.string.sleep'), 0) | song.count = 0；song.count >= 0 为真 等 3 条 | 是 | 通过 |
| Verify updating the count of a song keeps its two resources untouched. | - | new SongType($r('app.media.list7'), $r('app.string.noon'), 30) | song.count = 31；song.imageSrc.id = $r('app.media.list7').id 等 3 条 | 是 | 通过 |
| Verify the song label resource is never confused with the cover resource. | - | new SongType($r('app.media.list1'), $r('app.string.bgm'), 16) | coverId = $r('app.media.list1').id；labelId = $r('app.string.bgm').id 等 3 条 | 是 | 通过 |
| Verify two songs with the same cover keep independent counts. | - | new SongType($r('app.media.list4'), $r('app.string.emo'), 16) | first.count = 0；second.count = 25 等 3 条 | 是 | 通过 |
| Verify a large song count stays an exact number. | - | new SongType($r('app.media.list2'), $r('app.string.oldYear'), 48) | song.count = 48；song.count > 30 为真 等 3 条 | 是 | 通过 |
| Verify swapping the label of a song keeps the count and the cover. | - | new SongType($r('app.media.list3'), $r('app.string.pops'), 30) | song.description.id = $r('app.string.oldYear').id；song.count = 30 等 3 条 | 是 | 通过 |
| Verify consecutive count increments accumulate on one instance only. | - | new SongType($r('app.media.list5'), $r('app.string.sleep'), 18) | song.count = 20；song.count = 18 + 2 等 3 条 | 是 | 通过 |
| Verify the page padding config returns a fresh PaddingDataType per breakpoint. | - | new BreakpointType<PaddingDataType>( | smallLeft = 16；largeLeft = 24 等 4 条 | 是 | 通过 |
| Verify the cover play icon offset config keeps compact zero and desktop -11. | - | new BreakpointType<OffsetDataType>( | smallY = 0；mediumY = -11 等 3 条 | 是 | 通过 |
| Verify a tab icon triple built from the Index tab list resolves per breakpoint. | - | new IconItem($r('app.media.ic_public_home'), $r('app.string.index… | mediumImageId = $r('app.media.ic_radio').id；tabs.getValue('lg') === mine 为真 等 3 条 | 是 | 通过 |
| Verify a SongType triple keeps three distinct counts across breakpoints. | - | new BreakpointType<SongType>( | smallCount = 24；largeCount = 16 等 4 条 | 是 | 通过 |

## SongsDataReal 套件（`SongsDataReal.test.ets`，40 条）

`songsList` 冻结表核对：长度与逐索引映射、前缀分布与去重、标签格式与资源完整性。标签文本经 `resolveLabel()` 在运行设备上按资源名解析，不写死语种。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify the frozen song table keeps exactly 12 entries. | - | songsList.length | length = 12；length > 0 为真 等 3 条 | 是 | 通过 |
| Verify entry 0 uses cover list12 and the 怀旧经典 label. | - | songsList[0].imageSrc.id | coverId = $r('app.media.list12').id；label.indexOf(prefixAt(0)) = 0 等 3 条 | 是 | 通过 |
| Verify entry 1 uses cover list11 and the 北欧天籁 label. | - | songsList[1].imageSrc.id | coverId = $r('app.media.list11').id；label.indexOf(prefixAt(1)) = 0 等 3 条 | 是 | 通过 |
| Verify entry 2 uses cover list10 and the 欧美新曲 label. | - | songsList[2].imageSrc.id | coverId = $r('app.media.list10').id；labelAt(2).indexOf(prefixAt(2)) = 0 等 3 条 | 是 | 通过 |
| Verify entry 3 uses cover list9 and the 每日新歌 label. | - | String(songsList[3].imageSrc.id), String($r('app.media.list9').id… | songsList[3].imageSrc.id = $r('app.media.list9').id；labelAt(3).indexOf(prefixAt(3)) = 0 等 3 条 | 是 | 通过 |
| Verify entry 4 uses cover list8 and the 新歌推荐 label. | - | String(songsList[4].imageSrc.id), String($r('app.media.list8').id… | songsList[4].imageSrc.id = $r('app.media.list8').id；labelAt(4).indexOf(prefixAt(4)) = 0 等 3 条 | 是 | 通过 |
| Verify entry 5 uses cover list7 and the colon free 每日私选 wording. | - | labelAt(5) | songsList[5].imageSrc.id = $r('app.media.list7').id；label = colonFreeLabel() 等 3 条 | 是 | 通过 |
| Verify entry 6 restarts the label rotation with cover list6. | - | String(songsList[6].imageSrc.id), String($r('app.media.list6').id… | songsList[6].imageSrc.id = $r('app.media.list6').id；labelAt(6) = labelAt(0) 等 3 条 | 是 | 通过 |
| Verify entry 7 mirrors entry 1 while keeping a different cover. | - | songsList[7].imageSrc.id | songsList[7].imageSrc.id = $r('app.media.list5').id；labelAt(7) = labelAt(1) 等 3 条 | 是 | 通过 |
| Verify entry 8 mirrors entry 2 and uses cover list4. | - | songsList[8].imageSrc.id | songsList[8].imageSrc.id = $r('app.media.list4').id；labelAt(8) = labelAt(2) 等 3 条 | 是 | 通过 |
| Verify entry 9 mirrors entry 3 and uses cover list3. | - | songsList[9].imageSrc.id | songsList[9].imageSrc.id = $r('app.media.list3').id；labelAt(9) = labelAt(3) 等 3 条 | 是 | 通过 |
| Verify entry 10 mirrors entry 4 and uses cover list2. | - | songsList[10].imageSrc.id | songsList[10].imageSrc.id = $r('app.media.list2').id；labelAt(10) = labelAt(4) 等 3 条 | 是 | 通过 |
| Verify entry 11 mirrors entry 5 and closes the table with cover list1. | - | songsList[11] | last.imageSrc.id = $r('app.media.list1').id；labelAt(11) = colonFreeLabel() 等 3 条 | 是 | 通过 |
| Verify the 怀旧经典 prefix covers exactly two entries. | - | countPrefix(prefixAt(0)) | count = 2；count < 3 为真 等 3 条 | 是 | 通过 |
| Verify the 北欧天籁 prefix covers exactly two entries. | - | countPrefix(prefixAt(1)) | count = 2；labelAt(1).indexOf(prefixAt(1)) = 0 等 3 条 | 是 | 通过 |
| Verify the 欧美新曲 prefix covers exactly two entries. | - | countPrefix(prefixAt(2)) | count = 2；labelAt(2).indexOf(prefixAt(2)) = 0 等 3 条 | 是 | 通过 |
| Verify the 每日新歌 prefix covers exactly two entries. | - | countPrefix(prefixAt(3)) | count = 2；labelAt(3).indexOf(prefixAt(3)) = 0 等 3 条 | 是 | 通过 |
| Verify the 新歌推荐 prefix covers exactly two entries. | - | countPrefix(prefixAt(4)) | count = 2；labelAt(4).indexOf(prefixAt(4)) = 0 等 3 条 | 是 | 通过 |
| Verify the 每日私选 prefix also covers exactly two entries. | - | countPrefix(prefixAt(5)) | count = 2；labelAt(5).indexOf(prefixAt(5)) = 0 等 3 条 | 是 | 通过 |
| Verify the six prefixes together account for all 12 entries. | - | 0 | total = 12；total = songsList.length 等 3 条 | 是 | 通过 |
| Verify the label table collapses to exactly six distinct strings. | - | new Set<string>() | distinct.size = 6；distinct.has(colonFreeLabel()) 为真 等 3 条 | 是 | 通过 |
| Verify the shared track fragment appears in exactly ten entries. | - | countContaining(sharedTrack()) | count = 10；count = songsList.length - COLON_FREE_LABELS 等 3 条 | 是 | 通过 |
| Verify the shared artist fragment appears in exactly ten entries. | - | countContaining(sharedArtist()) | count = 10；labelAt(5).indexOf(sharedArtist()) = -1 等 3 条 | 是 | 通过 |
| Verify no entry has an empty label. | - | 0 | empty = 0；labelAt(0).length > 0 为真 等 3 条 | 是 | 通过 |
| Verify no label carries leading or trailing whitespace. | - | 0 | padded = 0；labelAt(3) = labelAt(3).trim() 等 3 条 | 是 | 通过 |
| Verify exactly ten labels carry a separator colon at position 4. | - | 0 | matched = 10；labelAt(4).charAt(prefixAt(4).length) = SEPARATOR 等 3 条 | 是 | 通过 |
| Verify the two 每日私选 labels contain no separator colon. | - | labelAt(5) | first.indexOf(':') = -1；second.indexOf(':') = -1 等 3 条 | 是 | 通过 |
| Verify the ten colon labels all end with the same track fragment. | - | 0 | endsMatched = 10；labelAt(0).endsWith(sharedTrack()) 为真 等 3 条 | 是 | 通过 |
| Verify all twelve labels are stored as string resources. | - | 0 | resourceLabels = 12；resourceLabels = songsList.length 等 3 条 | 是 | 通过 |
| Verify the label length sum matches the summed resource lengths. | - | 0 | total = expectedLengthSum()；total > songsList.length 为真 等 4 条 | 是 | 通过 |
| Verify every cover identifier is distinct across the twelve entries. | - | new Set<number>() | covers.size = 12；covers.has($r('app.media.list1').id) 为真 等 3 条 | 是 | 通过 |
| Verify every cover belongs to the entry_test module. | - | 0 | entryCovers = 12；songsList[0].imageSrc.moduleName = TEST_MODULE_NAME 等 3 条 | 是 | 通过 |
| Verify every cover resolves inside the sample bundle. | - | 0 | bundleCovers = 12；songsList[3].imageSrc.bundleName = BUNDLE_NAME 等 3 条 | 是 | 通过 |
| Verify reading the same entry twice returns identical label and cover. | - | labelAt(0) | firstLabel = secondLabel；firstCover = secondCover 等 3 条 | 是 | 通过 |
| Verify adjacent entries never repeat the same cover identifier. | - | 0 | repeated = 0；songsList[0].imageSrc.id === songsList[1].imageSrc.id 为假 等 3 条 | 是 | 通过 |
| Verify the two 每日私选 entries share the label but not the cover. | - | labelAt(5) | sharedLabel = labelAt(11)；songsList[5].imageSrc.id = $r('app.media.list7').id 等 4 条 | 是 | 通过 |
| Verify the six mirrored pairs keep equal labels and different covers. | - | 0 | mirrored = 6；labelAt(2) = labelAt(8) 等 3 条 | 是 | 通过 |
| Verify the table is ordered by prefix rotation instead of by label value. | - | 0 | rotation = 6；labelAt(0).indexOf(prefixAt(1)) = -1 等 3 条 | 是 | 通过 |
| Verify every entry exposes a cover resource object and never undefined. | - | 0 | present = 12；songsList[0].imageSrc.id > 0 为真 等 3 条 | 是 | 通过 |
| Verify the frozen table supports a full end to end read of all twelve entries. | - | '' | joined.length = expectedLengthSum()；joined.indexOf(prefixAt(0)) = 0 等 4 条 | 是 | 通过 |

## ResourceReal 套件（`ResourceReal.test.ets`，40 条）

文案与媒体实读：歌单 / 页签文案 20 条、结构约束 4 条、媒体可读性 16 条，覆盖 `%d` 格式化资源与中英文案的位置关系。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify the coffee playlist label resolves to the frozen base value. | - | stringOf($r('app.string.coffee').id) | value = labelByName('coffee')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the cantonese pop label resolves to the frozen base value. | - | stringOf($r('app.string.pops').id) | value = labelByName('pops')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the 80s label keeps its digits together with the chinese text. | - | stringOf($r('app.string.oldYear').id) | value = labelByName('oldYear')；value.indexOf('80') = 0 等 3 条 | 是 | 通过 |
| Verify the emo playlist label keeps its latin letters and chinese suffix. | - | stringOf($r('app.string.emo').id) | value = labelByName('emo')；value.indexOf('EMO') = 0 等 3 条 | 是 | 通过 |
| Verify the rock label resolves to the frozen base value. | - | stringOf($r('app.string.rock').id) | value = labelByName('rock')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the warm afternoon label resolves to the frozen base value. | - | stringOf($r('app.string.noon').id) | value = labelByName('noon')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the blues label resolves to the frozen base value. | - | stringOf($r('app.string.bluce').id) | value = labelByName('bluce')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the restless label resolves to the frozen base value. | - | stringOf($r('app.string.noise').id) | value = labelByName('noise')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the jazz label resolves to the frozen base value. | - | stringOf($r('app.string.jazz').id) | value = labelByName('jazz')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the stay awake label resolves to the frozen base value. | - | stringOf($r('app.string.noSleep').id) | value = labelByName('noSleep')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the western bgm label keeps its chinese prefix and latin suffix. | - | stringOf($r('app.string.bgm').id) | value = labelByName('bgm')；value.indexOf('BGM') = 5 等 3 条 | 是 | 通过 |
| Verify the sunshine label resolves to the frozen base value. | - | stringOf($r('app.string.sunshine').id) | value = labelByName('sunshine')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the sleep label resolves to the frozen base value. | - | stringOf($r('app.string.sleep').id) | value = labelByName('sleep')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the mine tab label resolves to the frozen base value. | - | stringOf($r('app.string.mine').id) | value = labelByName('mine')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the discovery tab label resolves to the frozen base value. | - | stringOf($r('app.string.discovery').id) | value = labelByName('discovery')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the radio tab label resolves to the frozen base value. | - | stringOf($r('app.string.radio').id) | value = labelByName('radio')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the home tab label resolves to the frozen base value. | - | stringOf($r('app.string.index').id) | value = labelByName('index')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the private fm shortcut label resolves to the frozen base value. | - | stringOf($r('app.string.privacy').id) | value = labelByName('privacy')；value.indexOf('FM') = 2 等 3 条 | 是 | 通过 |
| Verify the singer shortcut label resolves to the frozen base value. | - | stringOf($r('app.string.singer').id) | value = labelByName('singer')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the recommend title resolves to the frozen base value. | - | stringOf($r('app.string.recommend').id) | value = labelByName('recommend')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the module description resolves to one of its two legal locale forms. | - | stringOf($r('app.string.module_desc').id) | legal 为真；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify the ability description resolves through its id and its name to the same text. | - | stringOf($r('app.string.EntryAbility_desc').id) | value = byName；value.length = byName.length 等 3 条 | 是 | 通过 |
| Verify the ability label resolves through its id and its name to the same text. | - | stringOf($r('app.string.EntryAbility_label').id) | value = byName；value.length = byName.length 等 3 条 | 是 | 通过 |
| Verify the playlist recommendation title keeps its four chinese characters. | - | stringOf($r('app.string.singRecommend').id) | value = labelByName('singRecommend')；value.length > 0 为真 等 3 条 | 是 | 通过 |
| Verify cover list1 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list1').id) | first > 0 为真；second = first 等 3 条 | 是 | 通过 |
| Verify cover list2 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list2').id) | first > 0 为真；second = first 等 3 条 | 是 | 通过 |
| Verify cover list3 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list3').id) | first > 0 为真；mediaSize($r('app.media.list3').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list4 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list4').id) | first > 0 为真；mediaSize($r('app.media.list4').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list5 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list5').id) | first > 0 为真；mediaSize($r('app.media.list5').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list6 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list6').id) | first > 0 为真；mediaSize($r('app.media.list6').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list7 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list7').id) | first > 0 为真；mediaSize($r('app.media.list7').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list8 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list8').id) | first > 0 为真；mediaSize($r('app.media.list8').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list9 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list9').id) | first > 0 为真；mediaSize($r('app.media.list9').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list10 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list10').id) | first > 0 为真；mediaSize($r('app.media.list10').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list11 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list11').id) | first > 0 为真；mediaSize($r('app.media.list11').id) = first 等 3 条 | 是 | 通过 |
| Verify cover list12 is readable and returns a stable byte length. | - | mediaSize($r('app.media.list12').id) | first > 0 为真；mediaSize($r('app.media.list12').id) = first 等 3 条 | 是 | 通过 |
| Verify the first banner is readable and returns a stable byte length. | - | mediaSize($r('app.media.banner1').id) | first > 0 为真；mediaSize($r('app.media.banner1').id) = first 等 3 条 | 是 | 通过 |
| Verify the second banner is readable and returns a stable byte length. | - | mediaSize($r('app.media.banner2').id) | first > 0 为真；mediaSize($r('app.media.banner2').id) = first 等 3 条 | 是 | 通过 |
| Verify the third banner is readable and differs in size from the first one. | - | mediaSize($r('app.media.banner3').id) | third > 0 为真；mediaSize($r('app.media.banner3').id) = third 等 3 条 | 是 | 通过 |
| Verify a vector tab icon is readable as media content. | - | mediaSize($r('app.media.ic_public_home').id) | iconSize > 0 为真；filledSize > 0 为真 等 3 条 | 是 | 通过 |

## LayoutReal 套件（`LayoutReal.test.ets`，40 条）

布局实算：12 首歌 × 三档列数的行数、网格高度公式、间距与轮播配置、非法断点守卫，全部锚定 `Constants.ets` 中的常量。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify 12 songs in 3 columns need 4 rows on the compact breakpoint. | - | new BreakpointType<number>(3, 5, 6).getValue('sm') | columns = 3；rows = 4 等 3 条 | 是 | 通过 |
| Verify 12 songs in 5 columns need 3 rows on the medium breakpoint. | - | new BreakpointType<number>(3, 5, 6).getValue('md') | columns = 5；rows = 3 等 3 条 | 是 | 通过 |
| Verify 12 songs in 6 columns need exactly 2 rows on the large breakpoint. | - | new BreakpointType<number>(3, 5, 6).getValue('lg') | columns = 6；rows = 2 等 3 条 | 是 | 通过 |
| Verify a 40vp cell in 3 columns produces a 256vp compact grid height. | - | gridHeightOf(40, 3, true) | expected = 256；expected > 4 * 40 为真 等 3 条 | 是 | 通过 |
| Verify a 40vp cell in 5 columns produces a 200vp medium grid height. | - | gridHeightOf(40, 5, true) | expected = 200；expected < gridHeightOf(40, 3, true) 为真 等 3 条 | 是 | 通过 |
| Verify a 40vp cell in 6 columns produces a 96vp large grid height without the player bar. | - | gridHeightOf(40, 6, false) | expected = 96；expected = 2 * 40 + ROW_GAP 等 3 条 | 是 | 通过 |
| Verify a 87.5vp fractional cell keeps its half vp in the compact grid height. | - | gridHeightOf(87.5, 3, true) | expected = 446；expected > 400 为真 等 3 条 | 是 | 通过 |
| Verify a 87.5vp fractional cell keeps its half vp in the large grid height. | - | gridHeightOf(87.5, 6, false) | expected = 191；expected === 191.0 为真 等 3 条 | 是 | 通过 |
| Verify a zero height cell still reserves the row gaps and the player bar. | - | gridHeightOf(0, 5, true) | expected = 80；expected - PLAYER_BAR = 32 等 3 条 | 是 | 通过 |
| Verify a zero height cell on lg collapses to a single row gap. | - | gridHeightOf(0, 6, false) | expected = 16；expected = ROW_GAP 等 3 条 | 是 | 通过 |
| Verify a tall 120vp cell in 3 columns keeps the compact player bar offset. | - | gridHeightOf(120, 3, true) | expected = 576；expected - 4 * 120 = 96 等 3 条 | 是 | 通过 |
| Verify a tall 120vp cell in 6 columns keeps the two row contract. | - | gridHeightOf(120, 6, false) | expected = 256；expected = 2 * 120 + ROW_GAP 等 3 条 | 是 | 通过 |
| Verify the song grid template uses three equal columns on sm. | - | new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', | columnsOf(templateText) = 3；tokens[0] = '1fr' 等 3 条 | 是 | 通过 |
| Verify the song grid template uses five equal columns on md. | - | new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', | columnsOf(templateText) = 5；templateText.indexOf('1fr 1fr 1fr 1fr 1fr') = 0 等 3 条 | 是 | 通过 |
| Verify the song grid template uses six equal columns on lg. | - | new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', | columnsOf(templateText) = 6；tokensOf(templateText)[5] = '1fr' 等 3 条 | 是 | 通过 |
| Verify the user song grid collapses to a single column on sm. | - | new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', | templateText = '1fr'；columnsOf(templateText) = 1 等 3 条 | 是 | 通过 |
| Verify the user song grid uses five columns on md. | - | new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', | columnsOf(templateText) = 5；columnsOf(templateText) > 1 为真 等 3 条 | 是 | 通过 |
| Verify the user song grid uses six columns on lg and matches the song grid. | - | new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', | userLg = songsLg；columnsOf(userLg === undefined ? '' : userLg) = 6 等 3 条 | 是 | 通过 |
| Verify the title bar spans fill exactly the 16 medium grid columns. | - | new BreakpointType<number>(8, 16, 24) | sum = 16；columns.getValue('md') = sum 等 3 条 | 是 | 通过 |
| Verify the title bar spans fill exactly the 24 large grid columns. | - | new BreakpointType<number>(8, 16, 24) | sum = 24；columns.getValue('lg') = sum 等 3 条 | 是 | 通过 |
| Verify the compact title bar wraps because its four spans exceed 8 columns. | - | new BreakpointType<number>(8, 16, 24) | sum = 16；sum > (columns.getValue('sm') === undefined ? 0 : Number(columns.getV… 等 3 条 | 是 | 通过 |
| Verify the shortcut list has no spacing on the compact breakpoint. | - | new BreakpointType<number>(0, 35, 63) | sm = 0；sm === 0 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut list spacing doubles at the medium breakpoint. | - | new BreakpointType<number>(0, 35, 63) | md = 35；md === 35 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut list spacing reaches 63 on the large breakpoint. | - | new BreakpointType<number>(0, 35, 63) | lg = 63；lg === 63 为真 等 3 条 | 是 | 通过 |
| Verify the banner swiper shows one of three banners on sm. | - | 3 | visible = 1；visible === 1 为真 等 3 条 | 是 | 通过 |
| Verify the banner swiper shows two of three banners on md. | - | new BreakpointType<number>(1, 2, 3).getValue('md') | visible = 2；visible === 2 为真 等 3 条 | 是 | 通过 |
| Verify the banner swiper shows all three banners on lg and switches to the column layout. | - | new BreakpointType<number>(1, 2, 3).getValue('lg') | visible = 3；indicator 为假 等 3 条 | 是 | 通过 |
| Verify the page padding grows from 16 to 24 only on the large breakpoint. | - | new BreakpointType<PaddingDataType>( | smLeft = 16；lgLeft = 24 等 3 条 | 是 | 通过 |
| Verify the page padding stays symmetric on the medium breakpoint. | - | new BreakpointType<PaddingDataType>( | mdLeft = 16；mdRight = 16 等 3 条 | 是 | 通过 |
| Verify the compact tabs are bottom aligned and become vertical only on lg. | - | new BreakpointType<boolean>(false, false, true) | smVertical 为假；lgVertical 为真 等 4 条 | 是 | 通过 |
| Verify the medium tabs stay horizontal but the player bar is still outside the grid. | - | new BreakpointType<boolean>(false, false, true) | mdVertical 为假；mdVertical === true 为假 等 3 条 | 是 | 通过 |
| Verify an empty breakpoint returns no song template so the guard skips the height update. | - | new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', | miss 为 undefined；sut.getValue('lg') = '1fr 1fr 1fr 1fr 1fr 1fr' 等 3 条 | 是 | 通过 |
| Verify an upper case breakpoint cannot reach the large layout. | - | new BreakpointType<number>(3, 5, 6) | miss 为 undefined；sut.getValue('lg') = 6 等 3 条 | 是 | 通过 |
| Verify the descriptive breakpoint name large leaves the padding config untouched. | - | new BreakpointType<PaddingDataType>( | miss 为 undefined；sut.getValue('lg') === sut.lg 为真 等 3 条 | 是 | 通过 |
| Verify a 12 item grid divides evenly by 3 and 6 but not by 5. | - | String(SONG_COUNT % 3), String(SONG_COUNT % 6), String(SONG_COUNT… | SONG_COUNT % 3 = 0；SONG_COUNT % 6 = 0 等 4 条 | 是 | 通过 |
| Verify the same row formula keeps 3 rows when one more song is added. | - | Math.ceil(13 / 5) | rows = 3；height = 200 等 3 条 | 是 | 通过 |
| Verify an empty song list produces zero rows and a negative free height. | - | Math.ceil(0 / 6) | rows = 0；height = -ROW_GAP 等 3 条 | 是 | 通过 |
| Verify a full single row cancels the trailing row gap. | - | (ROW_GAP + 40) * 1 - ROW_GAP | singleRow = 40；singleRow = gridHeightOf(40, 12, false) 等 3 条 | 是 | 通过 |
| Verify the player bar offset is exactly 48 on both non large breakpoints. | - | gridHeightOf(40, 3, false) | withBar - withoutBar = PLAYER_BAR；PLAYER_BAR = 48 等 3 条 | 是 | 通过 |
| Verify the lg layout contract end to end through one breakpoint config. | - | new BreakpointType<number>(3, 5, 6) | lgColumns = 6；lgTokens = lgColumns 等 3 条 | 是 | 通过 |

## UiTabsReal 套件（`UiTabsReal.test.ets`，40 条）

页签与内容：只用 `ON.id('tabs0'~'tabs3')`、`ON.text()` 与 `ON.type('Search')` 定位，不使用硬编码坐标；`beforeAll` 启动应用后轮询关键节点，`afterEach` 复位到首页。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify the home tab is reachable through its semantic id. | 首页 | await presentById('tabs0') | exists 为真；id = 'tabs0' 等 4 条 | 是 | 通过 |
| Verify the radio tab is reachable through its semantic id. | 首页 | await presentById('tabs1') | exists 为真；id = 'tabs1' 等 3 条 | 是 | 通过 |
| Verify the discovery tab is reachable through its semantic id. | 首页 | await presentById('tabs2') | exists 为真；id = 'tabs2' 等 3 条 | 是 | 通过 |
| Verify the mine tab is reachable through its semantic id. | 首页 | await presentById('tabs3') | exists 为真；id = 'tabs3' 等 3 条 | 是 | 通过 |
| Verify a non existing tab id is reported as absent. | 首页 | await presentById('tabs4') | fourth 为假；bare 为假 等 3 条 | 是 | 通过 |
| Verify the tab id lookup is case sensitive. | 首页 | await presentById('TABS0') | upper 为假；spaced 为假 等 3 条 | 是 | 通过 |
| Verify the four tab labels are rendered as searchable text. | 首页 | await presentByText(systemLabelByName('index')) | home 为真；radio 为真 等 4 条 | 是 | 通过 |
| Verify all four tabs stay present at the same time. | 首页 | 0 | count = 4；count = ids.length 等 3 条 | 是 | 通过 |
| Verify the first two tabs share the same top edge in the compact layout. | 首页 | await boundsOf('tabs0') | first.top = second.top；second.left > first.left 为真 等 3 条 | 是 | 通过 |
| Verify the third and fourth tabs share the same top edge in the compact layout. | 首页 | await boundsOf('tabs2') | third.top = fourth.top；fourth.left > third.left 为真 等 3 条 | 是 | 通过 |
| Verify the tab order runs from left to right as declared in the source. | 首页 | await boundsOf('tabs0') | second.left > first.left 为真；third.left > second.left 为真 等 3 条 | 是 | 通过 |
| Verify the mine tab is the right most tab of the bar. | 首页 | await boundsOf('tabs2') | mine.left > discovery.left 为真；mine.right > discovery.right 为真 等 3 条 | 是 | 通过 |
| Verify the four tabs have identical widths when the bar is horizontal. | 首页 | await boundsOf('tabs0') | second.right - second.left = firstWidth；fourth.right - fourth.left = firstWidth 等 3 条 | 是 | 通过 |
| Verify the four tabs have identical heights. | 首页 | await boundsOf('tabs0') | second.bottom - second.top = height；third.bottom - third.top = height 等 3 条 | 是 | 通过 |
| Verify the tab bar stays inside the window width. | 首页 | await driver().findWindow({ actived: true }) | mine.right <= windowRect.right 为真；mine.left >= windowRect.left 为真 等 3 条 | 是 | 通过 |
| Verify the tab bar sits in the lower part of the window on the compact layout. | 首页 | await driver().findWindow({ actived: true }) | home.top > middle 为真；home.bottom <= windowRect.bottom 为真 等 3 条 | 是 | 通过 |
| Verify the home and mine tabs share the same vertical band. | 首页 | await boundsOf('tabs0') | mine.top = home.top；mine.bottom = home.bottom 等 3 条 | 是 | 通过 |
| Verify the tab heights stay below the bar height budget of 56vp. | 首页 | await boundsOf('tabs0') | height = vpToPx(56)；height > 0 为真 等 3 条 | 是 | 通过 |
| Verify the bar leaves no horizontal gap between the first and last tab. | 首页 | await boundsOf('tabs0') | span > mine.right - mine.left 为真；home.left >= 0 为真 等 3 条 | 是 | 通过 |
| Verify the home tab anchors the left edge of the bar. | 首页 | await boundsOf('tabs0') | home.left < radio.left 为真；home.left < vpToPx(80) 为真 等 3 条 | 是 | 通过 |
| Verify the home tab renders the recommend title. | 首页 | await presentByText(systemLabelByName('recommend')) | title 为真；more 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut entries of the home page are rendered. | 首页 | await presentByText(systemLabelByName('privacy')) | privacy 为真；singer 为真 等 3 条 | 是 | 通过 |
| Verify the mine page is not part of the home content. | 首页 | await presentByText(systemLabelByName('mySongs')) | mineTitle 为假；await presentByText(systemLabelByName('recommend')) 为真 等 3 条 | 是 | 通过 |
| Verify clicking the mine tab reveals the user song list title. | 首页 | await clickId('tabs3') | title 为真；id = 'tabs3' 等 3 条 | 是 | 通过 |
| Verify the home playlist recommendation disappears after switching to the mine tab. | 首页 | await clickId('tabs3') | recommend 为假；await presentByText(systemLabelByName('mySongs')) 为真 等 3 条 | 是 | 通过 |
| Verify returning to the home tab restores the playlist recommendation block. | 首页 | await clickId('tabs3') | recommend 为真；mineTitle 为假 等 3 条 | 是 | 通过 |
| Verify the radio tab stays selectable and the bar remains visible after the click. | 首页 | await clickId('tabs1') | id = 'tabs1'；bounds.bottom > bounds.top 为真 等 3 条 | 是 | 通过 |
| Verify the discovery tab stays selectable and the bar remains visible after the click. | 首页 | await clickId('tabs2') | id = 'tabs2'；await presentById('tabs1') 为真 等 3 条 | 是 | 通过 |
| Verify going back home from the radio tab restores the home content. | 首页 | await clickId('tabs1') | title 为真；await presentByText(systemLabelByName('singRecommend')) 为真 等 3 条 | 是 | 通过 |
| Verify the tab bar keeps four entries after visiting every tab once. | 首页 | await clickId('tabs1') | count = 4；await presentByText(systemLabelByName('recommend')) 为真 等 3 条 | 是 | 通过 |
| Verify the mine page lists the first user playlist entry. | 首页 | await clickId('tabs3') | mineTitle 为真；emo 为真 等 3 条 | 是 | 通过 |
| Verify the mine page hides the recommend page banner text. | 首页 | await clickId('tabs3') | more 为假；await presentByText(systemLabelByName('mySongs')) 为真 等 3 条 | 是 | 通过 |
| Verify the player bar is rendered on the home page below the large breakpoint. | 首页 | await presentByText('Witness') | title 为真；artist 为真 等 3 条 | 是 | 通过 |
| Verify the player bar keeps both text rows aligned in one block. | 首页 | await driver().findComponent(ON.text('Witness')) | artistRect.top > titleRect.top 为真；artistRect.left = titleRect.left 等 3 条 | 是 | 通过 |
| Verify the home content and the tab bar never overlap vertically. | 首页 | await driver().findComponent(ON.text(systemLabelByName('recommend… | titleRect.top < titleRect.bottom；barRect.top > titleRect.top 为真 等 3 条 | 是 | 通过 |
| Verify the mine tab keeps the player bar as well. | 首页 | await clickId('tabs3') | title 为真；player 为真 等 3 条 | 是 | 通过 |
| Verify the mine page opens on the first playlist entry of the grid. | 首页 | await clickId('tabs3') | first 为真；owner 为真 等 3 条 | 是 | 通过 |
| Verify the radio placeholder page keeps the tab bar interactive. | 首页 | await clickId('tabs1') | radio = 'tabs1'；home = 'tabs0' 等 3 条 | 是 | 通过 |
| Verify switching twice in a row ends on the requested tab. | 首页 | await clickId('tabs3') | radioOnly 为假；await presentById('tabs1') 为真 等 3 条 | 是 | 通过 |
| Verify the suite leaves the application on the home tab. | 首页 | await clickId('tabs3') | title 为真；mineTitle 为假 等 3 条 | 是 | 通过 |

## UiLayoutReal 套件（`UiLayoutReal.test.ets`，40 条）

页面几何：窗口与标题栏、歌单推荐区与歌曲网格、快捷入口行与播放条、用户歌单页四组，每组 10 条；几何断言按「任意断点都成立」的契约编写，不依赖具体档位。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Verify the application window exposes a usable portrait viewport. | 首页 | await windowRect() | width > 0 为真；height > 0 为真 等 4 条 | 是 | 通过 |
| Verify the recommend title is laid out inside the window. | 首页 | await windowRect() | title.left >= windowBounds.left 为真；title.right <= windowBounds.right 为真 等 4 条 | 是 | 通过 |
| Verify the recommend title keeps the frozen 56vp title bar height. | 首页 | await boundsOfText(systemLabelByName('recommend')) | near(height, vpToPx(TITLE_BAR_HEIGHT)) 为真；height > vpToPx(MINE_TITLE_HEIGHT) 为真 等 3 条 | 是 | 通过 |
| Verify the recommend title keeps the page padding on its left edge. | 首页 | await windowRect() | inset >= vpToPx(PAGE_PADDING) 为真；title.left > windowBounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the recommend title stays in the upper half of the window. | 首页 | await windowRect() | title.top < middle 为真；title.top >= windowBounds.top 为真 等 3 条 | 是 | 通过 |
| Verify the title bar renders a search box component. | 首页 | await presentByType('Search') | exists 为真；search.right > search.left 为真 等 3 条 | 是 | 通过 |
| Verify the search box keeps the frozen 40vp height. | 首页 | await boundsOfType('Search') | near(height, vpToPx(SEARCH_HEIGHT)) 为真；height > 0 为真 等 3 条 | 是 | 通过 |
| Verify the search box is flush inside the window horizontally. | 首页 | await windowRect() | search.left >= windowBounds.left 为真；search.right <= windowBounds.right 为真 等 3 条 | 是 | 通过 |
| Verify the search box is not pushed out of the window vertically. | 首页 | await windowRect() | search.top >= title.top 为真；search.top >= windowBounds.top 为真 等 3 条 | 是 | 通过 |
| Verify the song section header starts below the title bar. | 首页 | await boundsOfText(systemLabelByName('recommend')) | section.top >= title.bottom 为真；section.bottom > section.top 为真 等 3 条 | 是 | 通过 |
| Verify the song section header is laid out inside the window. | 首页 | await windowRect() | section.left >= windowBounds.left 为真；section.right <= windowBounds.right 为真 等 3 条 | 是 | 通过 |
| Verify the more entry of the song section is reachable as text. | 首页 | await presentByText(systemLabelByName('more'), false) | exists 为真；more.right > more.left 为真 等 3 条 | 是 | 通过 |
| Verify the more entry sits on the right side of the section header. | 首页 | await boundsOfText(systemLabelByName('singRecommend')) | more.left > section.left 为真；more.right > more.left 为真 等 3 条 | 是 | 通过 |
| Verify the more entry stays inside the window right edge. | 首页 | await windowRect() | more.right <= windowBounds.right 为真；more.left >= windowBounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the section header and the more entry share one text row. | 首页 | await boundsOfText(systemLabelByName('singRecommend')) | gap <= vpToPx(16) 为真；more.bottom <= section.bottom + vpToPx(16) 为真 等 3 条 | 是 | 通过 |
| Verify the first frozen song label from the nostalgia group is rendered. | 首页 | await presentByText(songLabel('song_label_01'), false) | exists 为真；label.right > label.left 为真 等 3 条 | 是 | 通过 |
| Verify the first frozen song label from the nordic group is rendered. | 首页 | await presentByText(songLabel('song_label_02'), false) | exists 为真；label.right > label.left 为真 等 3 条 | 是 | 通过 |
| Verify the first frozen song label from the europe group is rendered. | 首页 | await windowRect() | exists 为真；label.bottom > label.top 为真 等 3 条 | 是 | 通过 |
| Verify every song label keeps the frozen 38vp two line box. | 首页 | await boundsOfText(songLabel('song_label_01')) | near(first, vpToPx(SONG_LABEL_HEIGHT)) 为真；near(second, vpToPx(SONG_LABEL_HEIGHT)) 为真 等 4 条 | 是 | 通过 |
| Verify the first three song labels share one grid row and grow to the right. | 首页 | await boundsOfText(songLabel('song_label_01')) | nostalgia.top = nordic.top；nordic.top = europe.top 等 4 条 | 是 | 通过 |
| Verify the first shortcut entry keeps its frozen private fm label. | 首页 | await windowRect() | exists 为真；entry.left >= windowBounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the second shortcut entry keeps its frozen singer label. | 首页 | await presentByText(systemLabelByName('singer'), false) | exists 为真；entry.right > entry.left 为真 等 3 条 | 是 | 通过 |
| Verify the third shortcut entry keeps its frozen playlist label. | 首页 | await presentByText(systemLabelByName('singList'), false) | exists 为真；entry.right > entry.left 为真 等 3 条 | 是 | 通过 |
| Verify the fourth shortcut entry keeps its frozen ranking label. | 首页 | await presentByText(systemLabelByName('rank'), false) | exists 为真；entry.right > entry.left 为真 等 3 条 | 是 | 通过 |
| Verify the visible shortcut entries share one horizontal row. | 首页 | await boundsOfText(systemLabelByName('privacy')) | privacy.top = singer.top；singer.top = playlist.top 等 3 条 | 是 | 通过 |
| Verify the shortcut entries are laid out from left to right. | 首页 | await boundsOfText(systemLabelByName('privacy')) | singer.left > privacy.left 为真；playlist.left > singer.left 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut row is placed above the song section header. | 首页 | await boundsOfText(systemLabelByName('privacy')) | privacy.top < section.top 为真；privacy.bottom < section.top 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut row never overflows the window bottom edge. | 首页 | await windowRect() | privacy.bottom <= windowBounds.bottom 为真；singer.bottom <= windowBounds.bottom 为真 等 3 条 | 是 | 通过 |
| Verify the shortcut labels stay centered in evenly spaced cells. | 首页 | await boundsOfText(systemLabelByName('privacy')) | stepGap > vpToPx(32) 为真；near(stepGap, secondStep) 为真 等 3 条 | 是 | 通过 |
| Verify the player bar shows the frozen song title and artist stacked. | 首页 | await presentByText('Witness', false) | titleExists 为真；artistExists 为真 等 4 条 | 是 | 通过 |
| Verify the mine page renders its title inside the window. | 首页 | await clickId('tabs3') | await presentByText(systemLabelByName('mySongs'), false) 为真；title.left >= windowBounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the mine page title keeps the page padding on its left edge. | 首页 | await clickId('tabs3') | inset >= vpToPx(PAGE_PADDING) 为真；title.left > windowBounds.left 为真 等 3 条 | 是 | 通过 |
| Verify the mine page title keeps the frozen 33vp line box. | 首页 | await clickId('tabs3') | near(height, vpToPx(MINE_TITLE_HEIGHT)) 为真；height > vpToPx(MINE_ENTRY_HEIGHT) 为真 等 3 条 | 是 | 通过 |
| Verify the self built playlist caption is rendered as one text node. | 首页 | await clickId('tabs3') | caption 为真；rect.right > rect.left 为真 等 3 条 | 是 | 通过 |
| Verify the first frozen user playlist entry is rendered on the mine page. | 首页 | await clickId('tabs3') | exists 为真；entry.right > entry.left 为真 等 3 条 | 是 | 通过 |
| Verify the second frozen user playlist entry is rendered on the mine page. | 首页 | await clickId('tabs3') | exists 为真；entry.right > entry.left 为真 等 3 条 | 是 | 通过 |
| Verify the user playlist entry label keeps the frozen 22vp line box. | 首页 | await clickId('tabs3') | near(height, vpToPx(MINE_ENTRY_HEIGHT)) 为真；height > 0 为真 等 3 条 | 是 | 通过 |
| Verify the user playlist entry label respects the page padding and window edge. | 首页 | await clickId('tabs3') | inset >= vpToPx(PAGE_PADDING) 为真；entry.right <= windowBounds.right 为真 等 3 条 | 是 | 通过 |
| Verify the player bar is still rendered while the mine page is open. | 首页 | await clickId('tabs3') | mineTitle 为真；player 为真 等 3 条 | 是 | 通过 |
| Verify the suite leaves the application on a clean home layout. | 首页 | await clickId('tabs3') | title 为真；section 为真 等 3 条 | 是 | 通过 |

## 运行与验证

构建（工程根目录执行）。`build-profile.json5` 的 `compileSdkVersion` / `compatibleSdkVersion` / `targetSdkVersion` 均为字符串 `"26.0.0"`，`signingConfigs.default` 指向本机调试签名材料，因此 CLI 直接产出 `-signed.hap`；在其它机器构建时，需先在 IDE `File > Project Structure > Signing Configs` 配置自动签名，否则只能得到 unsigned 产物，真机安装会报 `code:9568320 error: no signature file`。

方式一：IDE 构建。在 IDE 中执行 `Build > Build Hap(s)/APP(s) > Build Hap(s)`，构建目标选择 module `entry` 的 `ohosTest`。

方式二：`devecocli`（CI 与脚本化场景）。两个模块需分别构建，`--modules` 一次只处理最后一个目标：

```shell
devecocli build --modules entry@default
devecocli build --modules entry@ohosTest
```

方式三：直接使用 DevEco Studio 内置 hvigor（本工程实测方式，无需联网拉取依赖）：

```shell
# Windows（路径按本机 DevEco Studio 安装位置调整）
& "<DevEco>/tools/hvigor/bin/hvigorw.bat" --mode module -p module=entry@default -p product=default -p buildMode=debug assembleHap --no-daemon
& "<DevEco>/tools/hvigor/bin/hvigorw.bat" --mode module -p module=entry@ohosTest -p product=default -p buildMode=debug assembleHap --no-daemon
```

```text
# 产物：entry/build/default/outputs/default/entry-default-signed.hap
# 产物：entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装（需设备授权）：

```shell
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

单进程整跑 2461 条用例会触发 `App died`（`TestFinished-ResultCode: -1`，非用例失败），按下表分 9 批执行（每批 ≤5 个套件 / ≤300 条用例）：

| 批次 | `-s class` 套件清单 | 套件数 | 用例数 |
|---|---|---|---|
| 1 | ActsAbilityTest、BreakpointMatrix01、BreakpointMatrix02、BreakpointMatrix03 | 4 | 231 |
| 2 | BreakpointMatrix04、BreakpointMatrix05、BreakpointMatrix06、BreakpointMatrix07 | 4 | 300 |
| 3 | BreakpointMatrix08、BreakpointMatrix09、BreakpointMatrix10、BreakpointMatrix11 | 4 | 300 |
| 4 | BreakpointMatrix12、BreakpointState01、BreakpointState02、ModelMatrix01 | 4 | 300 |
| 5 | ModelMatrix02、ModelMatrix03、ModelMatrix04、ModelMatrix05 | 4 | 300 |
| 6 | ModelMatrix06、ModelMatrix07、SongsDataMatrix01、SongsDataMatrix02 | 4 | 300 |
| 7 | SongsDataMatrix03、SongsDataMatrix04、ResourceMatrix01、ResourceMatrix02 | 4 | 300 |
| 8 | ResourceMatrix03、LayoutMatrix01、BreakpointReal、ModelReal、SongsDataReal | 5 | 270 |
| 9 | ResourceReal、LayoutReal、UiTabsReal、UiLayoutReal | 4 | 160 |
| **合计** | - | **37** | **2461** |

- 判定口径：`OHOS_REPORT_RESULT` 中 `Failure=0` 且 `Error=0`、`Tests run` 等于本批用例数，同时 `TestFinished-ResultCode` 为 `0`；`-2` 表示用例失败，`-1` 表示进程异常。
- 执行前置条件：UI 套件通过 `@kit.TestKit` 的 `Driver.create()` 连接 AAMS，执行前需保证设备处于解锁状态、无系统弹窗或其它应用占据顶层窗口；若出现 `Can not connect to AAMS, REGISTER_LISTENER_FAILED`，重新跑该批即可恢复。
- 套件顺序：一级（断点 → 模型 → 歌单 → 资源 → 布局）先跑，二级（页签 → 页面几何）后跑；冒烟套件会请求缩放窗口，单独安排以免影响几何断言。

## 测试结果

| 检查项 | 结果 |
|---|---|
| 构建 `entry@default` | `BUILD SUCCESSFUL` |
| 构建 `entry@ohosTest` | `BUILD SUCCESSFUL`，无 `ArkTS:ERROR` |
| 用例规范审计 | `@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.level` 齐全，`it()` 名称与 `@tc.name` 一致 |
| 套件注册 | 37 个套件全部在 `List.test.ets` 中 import 并在 `testsuite()` 内调用 |
| 用例规模 | 2461 条，与本文件各套件表格逐行一致（未增未删） |
| 真机运行 | 2461 条通过 / 0 条失败 / 0 条错误 |
| 结论 | **2461 条用例全部通过** |

设备与执行参数：OpenHarmony-7.1.0.21（API 26），720×1280 标准系统真机 `d629034339413535311028a580d3ab00`，2026-11-19，`com.sample.multimusic` + `entry_test` + `OpenHarmonyTestRunner`。

| 参数 | 取值 | 运行时选项 |
|---|---|---|
| 应用包名 | `com.sample.multimusic` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单用例超时（毫秒） | `30000` | `-s timeout` |

9 批 `Tests run` 分别为 231 / 300 / 300 / 300 / 300 / 300 / 300 / 270 / 160，合计 Pass=2461、Failure=0、Error=0，各批 `TestFinished-ResultCode` 均为 0。

## 已知限制

- `src/main` 没有为测试新增 `id`：歌曲格、轮播与快捷入口图标只有文案可定位，图片节点无法按 id 断言。
- 期望值通过 `getStringByNameSync` / `getStringSync` 在运行设备上按资源名解析，可在 `zh_CN` / `en_US` 设备上直接运行；`module_desc` 等有语言变体的键只按两种合法形式互证。
- 真机结果采自单台 720×1280 标准系统设备，未在折叠屏、平板等形态上复测；全屏窗口设备上 `ActsAbilityTest` 只验证窗口仍可用，不断言宽度精确等于请求值。
- 二级几何断言按「任意断点都成立」的契约编写，不依赖具体档位，因此单台设备即可覆盖；三档视觉差异需在预览器或支持窗口拖拽的设备上人工确认。
