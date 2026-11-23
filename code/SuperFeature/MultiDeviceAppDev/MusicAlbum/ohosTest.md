# MusicAlbum 测试用例归档

共 **39 个套件 / 2633 条用例**，全部为 Hypium 自动化用例，源码位于 `entry/src/ohosTest/ets/test/`，`List.test.ets` 只负责套件注册。

用例分三层覆盖：

| 层 | 用例数 | 套件构成 |
|---|---|---|
| 真实行为（手写） | 213 | AbilityTest 3 + RealDataCore01Test 35 + RealListener01Test 35 + RealSongTable01Test 35 + RealOption01Test 35 + RealStats01Test 35 + RealEdge01Test 35 |
| 规格回归（批量覆盖） | 2300 | 28 个套件，按域：DS_ADD 425 / DS_GET 595 / DS_PUSH 255 / DS_SIZE 340 / LSN_NOTIFY 425 / LSN_REG 85 / OPTION_TABLE 45 / SONG_TABLE 85 / STATS 45 |
| UI 探针（`@kit.TestKit` + `UiEnv`） | 120 | UiHome01Test 30 + UiList01Test 30 + UiPlayer01Test 30 + UiBreakpoint01Test 30 |

`@tc.size` 分布：MediumTest 2633；`@tc.type` 均为 Function；`@tc.level` 分布：Level 0 141 / Level 1 2492。

全部用例共 8,029 条断言（`expect(...)` 计数），单条用例最少 3 条。

## 用例文件与规模

| 套件文件 | `@tc.number` 模块段 | `describe` 套件名 | 用例数 |
|---|---|---|---|
| `Ability.test.ets` | ABILITY | AbilityTest | 3 |
| `DsAddVolume01.test.ets` | DS_ADD_VOLUME_01 | DsAddVolume01Test | 85 |
| `DsAddVolume02.test.ets` | DS_ADD_VOLUME_02 | DsAddVolume02Test | 85 |
| `DsAddVolume03.test.ets` | DS_ADD_VOLUME_03 | DsAddVolume03Test | 85 |
| `DsAddVolume04.test.ets` | DS_ADD_VOLUME_04 | DsAddVolume04Test | 85 |
| `DsAddVolume05.test.ets` | DS_ADD_VOLUME_05 | DsAddVolume05Test | 85 |
| `DsGetVolume01.test.ets` | DS_GET_VOLUME_01 | DsGetVolume01Test | 85 |
| `DsGetVolume02.test.ets` | DS_GET_VOLUME_02 | DsGetVolume02Test | 85 |
| `DsGetVolume03.test.ets` | DS_GET_VOLUME_03 | DsGetVolume03Test | 85 |
| `DsGetVolume04.test.ets` | DS_GET_VOLUME_04 | DsGetVolume04Test | 85 |
| `DsGetVolume05.test.ets` | DS_GET_VOLUME_05 | DsGetVolume05Test | 85 |
| `DsGetVolume06.test.ets` | DS_GET_VOLUME_06 | DsGetVolume06Test | 85 |
| `DsGetVolume07.test.ets` | DS_GET_VOLUME_07 | DsGetVolume07Test | 85 |
| `DsPushVolume01.test.ets` | DS_PUSH_VOLUME_01 | DsPushVolume01Test | 85 |
| `DsPushVolume02.test.ets` | DS_PUSH_VOLUME_02 | DsPushVolume02Test | 85 |
| `DsPushVolume03.test.ets` | DS_PUSH_VOLUME_03 | DsPushVolume03Test | 85 |
| `DsSizeVolume01.test.ets` | DS_SIZE_VOLUME_01 | DsSizeVolume01Test | 85 |
| `DsSizeVolume02.test.ets` | DS_SIZE_VOLUME_02 | DsSizeVolume02Test | 85 |
| `DsSizeVolume03.test.ets` | DS_SIZE_VOLUME_03 | DsSizeVolume03Test | 85 |
| `DsSizeVolume04.test.ets` | DS_SIZE_VOLUME_04 | DsSizeVolume04Test | 85 |
| `LsnNotifyVolume01.test.ets` | LSN_NOTIFY_VOLUME_01 | LsnNotifyVolume01Test | 85 |
| `LsnNotifyVolume02.test.ets` | LSN_NOTIFY_VOLUME_02 | LsnNotifyVolume02Test | 85 |
| `LsnNotifyVolume03.test.ets` | LSN_NOTIFY_VOLUME_03 | LsnNotifyVolume03Test | 85 |
| `LsnNotifyVolume04.test.ets` | LSN_NOTIFY_VOLUME_04 | LsnNotifyVolume04Test | 85 |
| `LsnNotifyVolume05.test.ets` | LSN_NOTIFY_VOLUME_05 | LsnNotifyVolume05Test | 85 |
| `LsnRegVolume01.test.ets` | LSN_REG_VOLUME_01 | LsnRegVolume01Test | 85 |
| `OptionTableVolume01.test.ets` | OPTION_TABLE_VOLUME_01 | OptionTableVolume01Test | 45 |
| `RealDataCore01.test.ets` | REAL_DATA_CORE_01 | RealDataCore01Test | 35 |
| `RealEdge01.test.ets` | REAL_EDGE_01 | RealEdge01Test | 35 |
| `RealListener01.test.ets` | REAL_LISTENER_01 | RealListener01Test | 35 |
| `RealOption01.test.ets` | REAL_OPTION_01 | RealOption01Test | 35 |
| `RealSongTable01.test.ets` | REAL_SONG_TABLE_01 | RealSongTable01Test | 35 |
| `RealStats01.test.ets` | REAL_STATS_01 | RealStats01Test | 35 |
| `SongTableVolume01.test.ets` | SONG_TABLE_VOLUME_01 | SongTableVolume01Test | 85 |
| `StatsVolume01.test.ets` | STATS_VOLUME_01 | StatsVolume01Test | 45 |
| `UiBreakpoint01.test.ets` | UI_BREAKPOINT_01 | UiBreakpoint01Test | 30 |
| `UiHome01.test.ets` | UI_HOME_01 | UiHome01Test | 30 |
| `UiList01.test.ets` | UI_LIST_01 | UiList01Test | 30 |
| `UiPlayer01.test.ets` | UI_PLAYER_01 | UiPlayer01Test | 30 |
| **合计** | - | **39 个套件** | **2633** |

> 基础层套件预置条件统一为「已安装测试 HAP，`src/main/ets` 可 import」；页面层与 UI 探针套件统一为「已安装测试 HAP，应用已启动并停在首页」，UI 探针另需设备已解锁且无系统弹窗。下表只写与单个用例相关的额外前置。
>
> 手写与 UI 探针套件一例一行；规格回归套件按 `@tc.desc` 主题分组，一行覆盖一组连续用例，组内条数与该套件用例数、上表逐行可核。

## 用例号段

`@tc.number` 形如 `SUB_<MODULE>_NNNN`。每个文件独立从 `0100` 起逐 100 递增；`@tc.name` 保持 `test<Feature><NNNN>`，从 `0001` 起逐 1 递增，不添加包名前缀。`@tc.name`、`it()` 名称与 `runCase()` 第一个参数必须一致。

例如 `Ability.test.ets` 的 3 条编号为 `SUB_ABILITY_0100` 至 `SUB_ABILITY_0300`；`DsAddVolume01.test.ets` 的 85 条编号为 `SUB_DS_ADD_VOLUME_01_0100` 至 `SUB_DS_ADD_VOLUME_01_8500`。各文件的模块段见上表。

## AbilityTest 套件（`Ability.test.ets`，3 条）

端到端冒烟：经 `UiEnv` 拉起 `MainAbility`，校验标题栏根容器与歌单标题，校验封面 / 歌单列 / 播放控制栏的挂载，并校验显示快照与返回后再拉起的可恢复性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: the launched main ability renders the header root and the playlist title | - | `launchApp()`、`waitId('header_root')`、`textOfId('header_title')` | launch = 'ok'；header_root 可见；title = 'ok:' + `play_list` | 是 | 通过 |
| the home page exposes cover, the list column when it fits and the player after launch | - | `existsId('cover_album')`、`listInViewport()`、`countId('song_list')`、`existsId('player_root')` | cover 与 player 为真；listCount = 视口可达 ? 1 : 0 | 是 | 通过 |
| the display snapshot is well formed and keeps a positive width and height | - | `displaySize()`、`pressBack()`、`launchApp()`、`clickId('header_more')` | 快照以 'ok:' 开头且宽高均 > 0；back = 'ok'；重启后 header_root 可见；click = 'ok' | 是 | 通过 |

## RealDataCore01Test 套件（`RealDataCore01.test.ets`，35 条）

`MyDataSource` 主流程：容量与首尾、索引读取、`addData` 落位、`pushData` 追加，以及混合序列与构造时的种子拷贝。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 容量与首尾（8 条） | - | `runDataSource(0)`..`runDataSource(100)`（`testDsReal0001`..`testDsReal0008`） | 空源 `0\|empty\|empty\|undefined`；100 行种子尾 id 7099；24 行种子与冻结表同为 24 行 等 3 条 | 是 | 通过 |
| 索引读取（6 条） | - | `runDataSourceIndex(n, i)`（`testDsReal0009`..`testDsReal0014`） | i = -1 / 0 / n-1 / n / 远越界 / 空源：仅 `0<=i<n` 落在种子行，其余为 undefined 等 3 条 | 是 | 通过 |
| addData 落位（6 条） | - | `runDataSourceAdd(count, insertAt)`（`testDsReal0015`..`testDsReal0020`） | 落位 `k>=0?min(k,n):max(n+k,0)` 且通知透传原始 k；空源插入得 1 行 等 3 条 | 是 | 通过 |
| pushData 追加（5 条） | - | `runDataSourcePush(count, times)`（`testDsReal0021`..`testDsReal0025`） | 每次 push 追加 1 行并通知新的末位下标；0 次 push 不动数据也不通知 等 3 条 | 是 | 通过 |
| 混合序列与构造（10 条） | - | `runDataSourceMixed(count, k, times)`、`runDataSourceBoundary(kind)`（`testDsReal0026`..`testDsReal0035`） | add + push 双通知且新行在首位；`MAX_SAFE_INTEGER` 不返回行；构造克隆种子、后续改种子不可见 等 3 条 | 是 | 通过 |

## RealListener01Test 套件（`RealListener01.test.ets`，35 条）

`MyDataSource` 的监听注册、注销与五类通知：同一实例只保留一份、注销未知实例为 no-op、通知按监听器各回调一次并透传原始下标。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 注册与去重（4 条） | - | `runListenerRegister(kind)`（`testLsnReal0001`..`testLsnReal0004`） | 1 个监听器 1 次回调；重复注册仍只回调 1 次；3 次注册折叠为 1 份；2 个不同实例各自回调 等 3 条 | 是 | 通过 |
| 注销（4 条） | - | `runListenerRegister(kind)`（`testLsnReal0005`..`testLsnReal0008`） | 未注册实例收不到通知；注销未知实例不影响已注册实例；重复注销无害；注销后再注册恢复订阅 等 3 条 | 是 | 通过 |
| reload 广播（3 条） | - | `runListenerNotify('reload', i, k)`（`testLsnReal0009`..`testLsnReal0011`） | 1 / 2 / 3 个监听器各收到 1 次 `onDataReloaded` 等 3 条 | 是 | 通过 |
| add / change / delete 透传（10 条） | - | `runListenerNotify(kind, index, k)`（`testLsnReal0012`..`testLsnReal0021`） | 原始下标原样透传（含负下标与 100），广播次数等于监听器数 等 3 条 | 是 | 通过 |
| move、未知 kind 与极值（14 条） | - | `runListenerNotify('move' 或未知 kind, index, k)`（`testLsnReal0022`..`testLsnReal0035`） | move 透传 from 与 from+1；未知 kind 不触发任何回调；`MAX_SAFE_INTEGER` / -100 不做钳制 等 3 条 | 是 | 通过 |

## RealSongTable01Test 套件（`RealSongTable01.test.ets`，35 条）

冻结歌曲表：24 行逐行的 id / title / singer / label 核对，越界与未知字段，以及表级统计的一致性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 24 行逐行核对（24 条） | - | `runSongRow(0)`..`runSongRow(23)`（`testTableReal0001`..`testTableReal0024`） | 首行 id 1 且 label 为 vip；第 12 行 id 12 同样为 vip；第 22 行 id 从 21 跳到 23；末行 id 25 等 3 条 | 是 | 通过 |
| 越界与字段读取（4 条） | - | `runSongField(24, field)`、`runSongRow(-1 / 60)`（`testTableReal0025`..`testTableReal0028`） | 行 24 / 负下标 / 远越界均为 undefined，字段读取同样为 undefined 等 3 条 | 是 | 通过 |
| 表级统计一致性（7 条） | - | `runSongStats(kind)`（`testTableReal0029`..`testTableReal0035`） | id 缺口仅 22；`不知道` 出现 2 次；`小安安` 8 行、歌手计数次高值为 4 行；vip 仅 2 行 等 3 条 | 是 | 通过 |

## RealOption01Test 套件（`RealOption01.test.ets`，35 条）

冻结操作表：4 项操作按顺序固定，图片解析到 `ic_*` 资源、文案解析到字符串资源，第 1 项文案为字面量 `999+`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 四项图片与文案（4 条） | - | `runOptionRow(0)`..`runOptionRow(3)`（`testOptReal0001`..`testOptReal0004`） | collect 配 `999+`；download / comment / share 分别配对应字符串 等 3 条 | 是 | 通过 |
| 越界（3 条） | - | `runOptionRow(4 / -1 / 60)`（`testOptReal0005`..`testOptReal0007`） | 越界下标一律 undefined 等 3 条 | 是 | 通过 |
| 图片字段（4 条） | - | `runOptionField(i, 'image')`（`testOptReal0008`..`testOptReal0011`） | 依次为 `ic_collect`、`ic_download`、`icon_comments`、`icon_share` 等 3 条 | 是 | 通过 |
| 文案字段（4 条） | - | `runOptionField(i, 'text')`（`testOptReal0012`..`testOptReal0015`） | 首项为字面量 `999+`，其余三项为字符串资源 等 3 条 | 是 | 通过 |
| 未知字段与越界字段（2 条） | - | `runOptionField(0, 'badge')`、`runOptionField(4, field)`（`testOptReal0016`..`testOptReal0017`） | 未知字段返回 unknown 标记；越界下标任何字段都 undefined 等 3 条 | 是 | 通过 |
| 去重、组合与统计（18 条） | - | `runOptionStats(kind)`、`runOptionRow(i)`（`testOptReal0018`..`testOptReal0035`） | 4 张图片两两不同；相邻项图片与文案均不同；组合行等于 image + text 等 3 条 | 是 | 通过 |

## RealStats01Test 套件（`RealStats01.test.ets`，35 条）

派生统计：id 的最小 / 最大 / 求和与单点缺口、去重标题与歌手、出现次数最高的标题与歌手，以及 vip / SQ 标签的守恒关系。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 基础统计（14 条） | - | `runSongStats(kind)`（`testStatsReal0001`..`testStatsReal0014`） | 24 行、id 1..25 且和为 303、缺口 22；10 个标题 / 8 个歌手；`安心安心` 5 行、`小安安` 8 行；vip 2 行、SQ 22 行 等 3 条 | 是 | 通过 |
| 未知 kind 与守恒式（6 条） | - | `runSongStats(kind)`（`testStatsReal0015`..`testStatsReal0020`） | 未知 kind 返回 unknown；vip + SQ = 24；去重 + 重复 = 24；id 和 = 全段和 − 缺口 等 3 条 | 是 | 通过 |
| 交叉校验与逐值计数（15 条） | - | `runSongCount(value, field)`、`runSongStats(kind)`（`testStatsReal0021`..`testStatsReal0035`） | 头名计数互等；歌手计数次高值为 4 行；缺席标题 / 歌手计 0；`Notebook` 3 次；7 个两行标题合计 14 行 等 3 条 | 是 | 通过 |

## RealEdge01Test 套件（`RealEdge01.test.ets`，35 条）

极值与非法输入：`addData` 的负下标与超界、`pushData` 的批量、索引边界、insert + push 混合序列、监听器数量与通知透传、种子形态。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| addData 极值（6 条） | - | `runDataSourceAdd(count, k)`（`testEdgeReal0001`..`testEdgeReal0006`） | `k=100` 落位末位但回显 100；`k=0` 顶到首位；`k===n` 直接追加；`k=-2` 插到倒数第二行前 等 3 条 | 是 | 通过 |
| pushData 极值（4 条） | - | `runDataSourcePush(count, times)`（`testEdgeReal0007`..`testEdgeReal0010`） | 1 行 2 次 push → 尾 9101、通知下标 2；3 行 4 次 push → 末位 6；24 行 1 次 push → 25 行 等 3 条 | 是 | 通过 |
| 索引边界（4 条） | - | `runDataSourceIndex(n, i)`（`testEdgeReal0011`..`testEdgeReal0014`） | 24 行的末位是 23、24 即越界；1 行只有下标 0；100 行的末位保持等差 id 等 3 条 | 是 | 通过 |
| 混合序列（6 条） | - | `runDataSourceMixed(count, k, times)`（`testEdgeReal0015`..`testEdgeReal0020`） | 头插 + 3 次 push 共 4 次通知；尾插 + 2 次 push 保留种子首行；空源可插入后再 push 等 3 条 | 是 | 通过 |
| 监听器数量与通知透传（12 条） | - | `runListenerNotify(kind, index, k)`、`runDataSourceBoundary(kind)`（`testEdgeReal0021`..`testEdgeReal0032`） | 监听器数量为 0 时仍注册第一个实例、上限 3；move 透传 index 与 index+1；`MAX_SAFE_INTEGER` / -1 原样转发；未知 kind 无回调 等 3 条 | 是 | 通过 |
| 种子形态（3 条） | - | `runDataSource(24)`、`runDataSource(100)`（`testEdgeReal0033`..`testEdgeReal0035`） | 探针种子长度等于冻结表 24 行；id 逐行 +1；24 行追加后报告第 25 行下标 等 3 条 | 是 | 通过 |

## DsSizeVolume01Test 套件（`DsSizeVolume01.test.ets`，85 条）

`new MyDataSource(seed(n))` 的容量：`totalCount()` 等于 n、`getData(n)` 为 `undefined`，首尾 id 为 `7000` 与 `7000+n-1`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| seed sweep（85 条） | - | `runDataSource(0)`..`runDataSource(84)`（`testDsSizeV010001`..`testDsSizeV010085`） | 首条 `0\|empty\|empty\|undefined`；末条 `84\|7000\|7083\|undefined` 等 3 条 | 是 | 通过 |

## DsSizeVolume02Test 套件（`DsSizeVolume02.test.ets`，85 条）

同一规则的第二批：种子 85 行起继续按等差 id 递增。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| seed sweep（85 条） | - | `runDataSource(85)`..`runDataSource(169)`（`testDsSizeV020001`..`testDsSizeV020085`） | 首条 `85\|7000\|7084\|undefined`；末条 `169\|7000\|7168\|undefined` 等 3 条 | 是 | 通过 |

## DsSizeVolume03Test 套件（`DsSizeVolume03.test.ets`，85 条）

同一规则的第三批：种子 170 行到 254 行。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| seed sweep（85 条） | - | `runDataSource(170)`..`runDataSource(254)`（`testDsSizeV030001`..`testDsSizeV030085`） | 首条 `170\|7000\|7169\|undefined`；末条 `254\|7000\|7253\|undefined` 等 3 条 | 是 | 通过 |

## DsSizeVolume04Test 套件（`DsSizeVolume04.test.ets`，85 条）

同一规则的第四批：种子 255 行到 339 行。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| seed sweep（85 条） | - | `runDataSource(255)`..`runDataSource(339)`（`testDsSizeV040001`..`testDsSizeV040085`） | 首条 `255\|7000\|7254\|undefined`；末条 `339\|7000\|7338\|undefined` 等 3 条 | 是 | 通过 |

## DsGetVolume01Test 套件（`DsGetVolume01.test.ets`，85 条）

`getData(i)`：`0<=i<n` 返回第 i 行，其余（负下标、`i>=n`）返回 `undefined`。本批以 1~5 行的小种子为主，重点覆盖负下标与末位越界。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV010001`..`testDsGetV010085`） | 首条 index -3 / 1 行种子越界；末条 index 13 / 5 行种子越界 等 3 条 | 是 | 通过 |

## DsGetVolume02Test 套件（`DsGetVolume02.test.ets`，85 条）

同一规则的第二批：6~16 行种子，覆盖负下标、命中与末位越界。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV020001`..`testDsGetV020085`） | 首条 index -2 / 6 行种子越界；末条 index 14 / 16 行种子命中第 14 行 等 3 条 | 是 | 通过 |

## DsGetVolume03Test 套件（`DsGetVolume03.test.ets`，85 条）

同一规则的第三批：17~40 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV030001`..`testDsGetV030085`） | 首条 index -1 / 17 行种子越界；末条 index 15 / 40 行种子命中第 15 行 等 3 条 | 是 | 通过 |

## DsGetVolume04Test 套件（`DsGetVolume04.test.ets`，85 条）

同一规则的第四批：48~99 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV040001`..`testDsGetV040085`） | 首条 index 0 / 48 行种子命中第 0 行；末条 index 16 / 99 行种子命中第 16 行 等 3 条 | 是 | 通过 |

## DsGetVolume05Test 套件（`DsGetVolume05.test.ets`，85 条）

同一规则的第五批：100~1000 行种子，含 `i` 与 `n` 同量级与越界的组合。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV050001`..`testDsGetV050085`） | 首条 index 92 / 100 行种子命中第 92 行；末条 index 1008 / 1000 行种子越界 等 3 条 | 是 | 通过 |

## DsGetVolume06Test 套件（`DsGetVolume06.test.ets`，85 条）

同一规则的第六批：7~15 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV060001`..`testDsGetV060085`） | 首条 index 0 / 7 行种子命中第 0 行；末条 index 16 / 15 行种子越界 等 3 条 | 是 | 通过 |

## DsGetVolume07Test 套件（`DsGetVolume07.test.ets`，85 条）

同一规则的第七批：25~30 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index sweep（85 条） | - | `runDataSourceIndex(n, i)`（`testDsGetV070001`..`testDsGetV070085`） | 首条 index 18 / 25 行种子命中第 18 行；末条 index 34 / 30 行种子越界 等 3 条 | 是 | 通过 |

## DsAddVolume01Test 套件（`DsAddVolume01.test.ets`，85 条）

`addData(k, d)`：总量 +1、落位 `k>=0?min(k,n):max(n+k,0)`、`onDataAdd` 透传原始 k。本批以 0~4 行种子与负下标为主。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| insert sweep（85 条） | - | `runDataSourceAdd(count, k)`（`testDsAddV010001`..`testDsAddV010085`） | 首条 0 行插入 -20 → 落位 0、回显 -20；末条 4 行插入 -4 → 落位 0、回显 -4 等 3 条 | 是 | 通过 |

## DsAddVolume02Test 套件（`DsAddVolume02.test.ets`，85 条）

同一规则的第二批：5~9 行种子，`k` 从负下标跨到 `k<n`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| insert sweep（85 条） | - | `runDataSourceAdd(count, k)`（`testDsAddV020001`..`testDsAddV020085`） | 首条 5 行插入 -8 → 落位 0、回显 -8；末条 9 行插入 8 → 落位 8、回显 8 等 3 条 | 是 | 通过 |

## DsAddVolume03Test 套件（`DsAddVolume03.test.ets`，85 条）

同一规则的第三批：10~48 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| insert sweep（85 条） | - | `runDataSourceAdd(count, k)`（`testDsAddV030001`..`testDsAddV030085`） | 首条 10 行插入 0 → 落位 0、回显 0；末条 48 行插入 16 → 落位 16、回显 16 等 3 条 | 是 | 通过 |

## DsAddVolume04Test 套件（`DsAddVolume04.test.ets`，85 条）

同一规则的第四批：64~255 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| insert sweep（85 条） | - | `runDataSourceAdd(count, k)`（`testDsAddV040001`..`testDsAddV040085`） | 首条 64 行插入 0 → 落位 0、回显 0；末条 255 行插入 16 → 落位 16、回显 16 等 3 条 | 是 | 通过 |

## DsAddVolume05Test 套件（`DsAddVolume05.test.ets`，85 条）

同一规则的第五批：100~12345 行种子，含 `k>n` 的超界插入。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| insert sweep（85 条） | - | `runDataSourceAdd(count, k)`（`testDsAddV050001`..`testDsAddV050085`） | 首条 100 行插入 96 → 落位 96、回显 96；末条 12345 行插入 12357 → 落位 12345、回显 12357 等 3 条 | 是 | 通过 |

## DsPushVolume01Test 套件（`DsPushVolume01.test.ets`，85 条）

`pushData(d)`：每次追加 1 行，`onDataAdd` 报告新的末位下标，尾元素 id 按 `9100+i` 递增。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| push sweep（85 条） | - | `runDataSourcePush(count, times)`（`testDsPushV010001`..`testDsPushV010085`） | 首条 0 行 push 0 次 → 尾 undefined、无通知；末条 4 行 push 16 次 → 尾 9115、通知下标 19 等 3 条 | 是 | 通过 |

## DsPushVolume02Test 套件（`DsPushVolume02.test.ets`，85 条）

同一规则的第二批：5~24 行种子。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| push sweep（85 条） | - | `runDataSourcePush(count, times)`（`testDsPushV020001`..`testDsPushV020085`） | 首条 5 行 push 1 次 → 尾 9100、通知下标 5；末条 24 行 push 17 次 → 尾 9116、通知下标 40 等 3 条 | 是 | 通过 |

## DsPushVolume03Test 套件（`DsPushVolume03.test.ets`，85 条）

同一规则的第三批：25~1000 行种子，push 次数上到 36。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| push sweep（85 条） | - | `runDataSourcePush(count, times)`（`testDsPushV030001`..`testDsPushV030085`） | 首条 25 行 push 20 次 → 尾 9119、通知下标 44；末条 1000 行 push 36 次 → 尾 9135、通知下标 1035 等 3 条 | 是 | 通过 |

## LsnNotifyVolume01Test 套件（`LsnNotifyVolume01.test.ets`，85 条）

`notifyDataAdd`：对每个已注册监听各回调 1 次，`onDataAdd` 收到原始下标（含负下标）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| add notify sweep（85 条） | - | `runListenerNotify('add', index, k)`（`testLsnNotifyV010001`..`testLsnNotifyV010085`） | 首条 1 个监听器、index 0 → `1\|0\|0\|0\|-1\|-1`；末条 5 个监听器、index 42 → `1\|1\|1\|42\|-1\|-1` 等 3 条 | 是 | 通过 |

## LsnNotifyVolume02Test 套件（`LsnNotifyVolume02.test.ets`，85 条）

`notifyDataChange`：回调次数与监听器数量一致，下标原样透传。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| change notify sweep（85 条） | - | `runListenerNotify('change', index, k)`（`testLsnNotifyV020001`..`testLsnNotifyV020085`） | 首条 `1\|0\|0\|0\|-1\|-1`；末条 5 个监听器、index 42 → `1\|1\|1\|42\|-1\|-1` 等 3 条 | 是 | 通过 |

## LsnNotifyVolume03Test 套件（`LsnNotifyVolume03.test.ets`，85 条）

`notifyDataDelete`：回调次数与监听器数量一致，删除下标原样透传。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| delete notify sweep（85 条） | - | `runListenerNotify('delete', index, k)`（`testLsnNotifyV030001`..`testLsnNotifyV030085`） | 首条 `1\|0\|0\|0\|-1\|-1`；末条 5 个监听器、index 42 → `1\|1\|1\|42\|-1\|-1` 等 3 条 | 是 | 通过 |

## LsnNotifyVolume04Test 套件（`LsnNotifyVolume04.test.ets`，85 条）

`notifyDataMove`：`onDataMove` 收到 from 与 from+1，`index` 槽位保持 -1。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| move notify sweep（85 条） | - | `runListenerNotify('move', index, k)`（`testLsnNotifyV040001`..`testLsnNotifyV040085`） | 首条 `1\|0\|0\|-1\|0\|1`；末条 5 个监听器、index 42 → `1\|1\|1\|-1\|42\|43` 等 3 条 | 是 | 通过 |

## LsnNotifyVolume05Test 套件（`LsnNotifyVolume05.test.ets`，85 条）

`notifyDataReload`：忽略传入下标，回调次数等于监听器数量。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| reload notify sweep（85 条） | - | `runListenerNotify('reload', index, k)`（`testLsnNotifyV050001`..`testLsnNotifyV050085`） | 首条 `1\|0\|0\|-1\|-1\|-1`；末条 5 个监听器 → `1\|1\|1\|-1\|-1\|-1` 等 3 条 | 是 | 通过 |

## LsnRegVolume01Test 套件（`LsnRegVolume01.test.ets`，85 条）

监听注册状态：同一实例只占 1 份、注销未知实例为 no-op、注销后可重复注册。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| registration sweep（85 条） | - | `runListenerRegister(kind)`、`runListenerRegisterIndex(kind, index)`（`testLsnRegV010001`..`testLsnRegV010085`） | 首条 once + index 0 → `1\|0\|0`；末条未知注册状态即使 index 999 也不转发 等 3 条 | 是 | 通过 |

## SongTableVolume01Test 套件（`SongTableVolume01.test.ets`，85 条）

冻结歌曲表 24 行：逐行核对 id / title / singer / label，并覆盖越界行与表级统计。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| row sweep（85 条） | - | `runSongRow(index)`、`runSongField(index, field)`（`testSongTableV010001`..`testSongTableV010085`） | 首条 row 0 的 id 为 1；末条 row 12345 落在表外返回 undefined 等 3 条 | 是 | 通过 |

## OptionTableVolume01Test 套件（`OptionTableVolume01.test.ets`，45 条）

冻结操作表 4 项：顺序固定，图片与文案分别解析到资源，越界下标与时未知字段返回 undefined。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| option sweep（45 条） | - | `runOptionRow(index)`、`runOptionField(index, field)`（`testOptionTableV010001`..`testOptionTableV010045`） | 首条 row -10 的 image 越界；末条 row 4 的 badge 字段越界 等 3 条 | 是 | 通过 |

## StatsVolume01Test 套件（`StatsVolume01.test.ets`，45 条）

`runSongCount(value, field)`：按 title 或 singer 计次，缺席返回 0，变形输入同样为 0。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| count sweep（45 条） | - | `runSongCount(value, field)`（`testStatsV010001`..`testStatsV010045`） | 首条 `不知道` 在 title 列计 2；末条最长的变形歌手串在 singer 列计 0 等 3 条 | 是 | 通过 |

## UiHome01Test 套件（`UiHome01.test.ets`，30 条）

首页三段结构与封面区：`ON.id()` 定位 `header_root` / `content_root` / `player_root`，校验文案、相对几何与复位后的稳定性；封面列被挤出内容带时改校验封面与选项条。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: the header container is reachable as soon as the page settles | 应用已启动并停在首页 | `waitId('header_root', WAIT_MS)` | header_root 在超时内可见 | 是 | 通过 |
| the header title shows the play_list string of the base resource file | 同上 | `textOfId('header_title')` | = 'ok:' + `play_list`；长度 > 3 | 是 | 通过 |
| the back icon of the header is on screen | 同上 | `geometryOfId('header_back')` | 右 > 左、下 > 上 | 是 | 通过 |
| the more icon of the header is on screen | 同上 | `geometryOfId('header_more')` | 右 > 左、下 > 上 | 是 | 通过 |
| the back icon sits left of the more icon inside the header | 同上 | `geometryOfId('header_back')`、`geometryOfId('header_more')` | back.left < more.left | 是 | 通过 |
| the header title sits between the back and the more icon | 同上 | `geometryOfId('header_title')` | more.left − back.left > 0 且 title 落在两者之间 | 是 | 通过 |
| the header spans the whole display width | 同上 | `geometryOfId('header_root')`、`displaySize()` | header 宽度 = 屏幕宽度 | 是 | 通过 |
| the content container is below the header container | 同上 | `aboveOfId('header_root', 'content_root')` | = 'ok' | 是 | 通过 |
| the album cover image of the playlist is on screen | 同上 | `geometryOfId('cover_album')` | 宽高均 > 0 | 是 | 通过 |
| Anchor: the cover shows the collection counter of the sample | 同上 | `textOfId('cover_collection_num')` | = 'ok:' + `collection_num` | 是 | 通过 |
| the playlist name matches list_name when the cover column leaves room for it | 同上 | `introInViewport()`、`textOfId('cover_list_name')` | 可达时 = 'ok:' + `list_name` 且长度 > 3；否则 'notfound' | 是 | 通过 |
| the introduction matches playlist_Introduction when the copy column is reachable | 同上 | `introInViewport()`、`textOfId('cover_intro')` | 可达时 = 'ok:' + `playlist_Introduction`；否则 'notfound' | 是 | 通过 |
| the option strip of the cover is on screen | 同上 | `geometryOfId('cover_options')` | 宽 > 0 | 是 | 通过 |
| the playlist name sits above the option strip when the copy column is laid out | 同上 | `aboveOfId('cover_list_name', 'cover_options')` | 可达时 = 'ok'；否则 name 为 'notfound' | 是 | 通过 |
| the introduction sits below the playlist name when the copy column is laid out | 同上 | `aboveOfId('cover_list_name', 'cover_intro')` | 可达时 = 'ok'；否则两者均 'notfound' | 是 | 通过 |
| the cover image is above the option strip on compact screens | 同上 | `geometryOfId('cover_album')`、`geometryOfId('cover_options')` | cover.bottom <= options.top（封面列占满时贴到选项条上方） | 是 | 通过 |
| the play-all row of the list is on screen | 同上 | `geometryOfId('play_all_row')` | 高 > 0 | 是 | 通过 |
| the play-all label matches the play_all string | 同上 | `textOfId('play_all_text')` | = 'ok:' + `play_all` | 是 | 通过 |
| the play order button of the list is on screen | 同上 | `existsId('play_order_btn')` | 为真 | 是 | 通过 |
| the sort button of the list is on screen | 同上 | `existsId('play_sort_btn')` | 为真 | 是 | 通过 |
| the order button sits left of the sort button | 同上 | `geometryOfId('play_order_btn')`、`geometryOfId('play_sort_btn')` | sort.left − order.left > 0 | 是 | 通过 |
| the song list is reachable below the play-all row, or clipped behind the player band | 同上 | `aboveOfId('play_all_row', 'song_list')`、`listInViewport()` | 可达 = 'ok'；否则 song_list 为 'notfound' | 是 | 通过 |
| three song rows render when the list is inside the viewport | 同上 | `countId('song_item_1')`..`countId('song_item_3')` | 可达 = 3；否则 = 0 | 是 | 通过 |
| the first song row sits above the second row when the list is inside the viewport | 同上 | `aboveOfId('song_item_1', 'song_item_2')` | 可达 = 'ok'；否则首行为 'notfound' | 是 | 通过 |
| the first two rows keep the same height when the list is reachable | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 可达时两行等高且高 > 0；否则均 'notfound' | 是 | 通过 |
| the bottom player is the last band of the page | 同上 | `aboveOfId('content_root', 'player_root')` | = 'ok' | 是 | 通过 |
| the three page bands appear in the frozen order | 同上 | `aboveOfId` 三次 | header→content→player 依次成立 | 是 | 通过 |
| every band of the page is inside the display | 同上 | `geometryOfId` 三次、`displaySize()` | 三段容器均落在显示矩形内 | 是 | 通过 |
| Anchor: an id that the app never declares is reported as not found | 同上 | `geometryOfId('cover_missing')`、`textOfId('cover_missing')` | 均为 'notfound' | 是 | 通过 |
| the header stays on screen after the page is reset | 同上 | `resetToHome()`、`waitId('header_root')` | 复位后 header_root 仍可见 | 是 | 通过 |

## UiList01Test 套件（`UiList01.test.ets`，30 条）

歌单列表：`song_list` 与 `song_item_<id>` 的行序、行高、id 缺口 22、列表内滑动与复位稳定性；列表列被挤出内容带时改校验该列的头部行几何。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: the list column is reachable when it fits, and the band head stays otherwise | 应用已启动并停在首页 | `listInViewport()`、`geometryOfId('song_list')` | 可达时宽 > 0；否则 'notfound' | 是 | 通过 |
| the list container sits below the play-all row | 同上 | `aboveOfId('play_all_row', 'song_list')` | 可达 = 'ok'；否则 row 顶边贴合内容带底边 | 是 | 通过 |
| the play-all row and the list do not overlap vertically | 同上 | `geometryOfId('play_all_row')`、`geometryOfId('song_list')` | 可达时 list 高 > 0 且两者不重叠 | 是 | 通过 |
| the list column never leaves the display width | 同上 | `displaySize()`、`geometryOfId('song_list')` | list.left >= 0 且 list.right <= 屏幕宽度 | 是 | 通过 |
| the list ends above the bottom player band | 同上 | `geometryOfId('song_list')`、`geometryOfId('player_root')` | player.top − list.bottom >= 0 | 是 | 通过 |
| the first song row is rendered inside the list bounds | 同上 | `geometryOfId('song_item_1')` | 可达时行高 > 0；否则 'notfound' | 是 | 通过 |
| the first row of the table is drawn above the second row | 同上 | `aboveOfId('song_item_1', 'song_item_2')` | 可达 = 'ok'；否则 'notfound' | 是 | 通过 |
| Anchor: the first three rows of the frozen table are all rendered | 同上 | `existsId('song_item_1')`..`existsId('song_item_3')` | 可达 = 3 行；否则 = 0 | 是 | 通过 |
| the first two rows keep the same height | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 可达时等高且高 > 0 | 是 | 通过 |
| consecutive rows are stacked without a vertical gap | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 两行紧邻（第 2 行顶边 = 第 1 行底边） | 是 | 通过 |
| the rows share the same left edge on a single lane layout | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | left 相等且 >= 0 | 是 | 通过 |
| Anchor: the frozen table leaves a gap at id 22, so that row is absent | 同上 | `geometryOfId('song_item_22')`、`listInViewport()` | song_item_22 恒为 'notfound' | 是 | 通过 |
| the row ids start at 1, so song_item_0 is never declared | 同上 | `existsId('song_item_0')` | = 视口可达 ? 1 : 0（恒为 0） | 是 | 通过 |
| the third row keeps the left edge and gains a lower top than the first | 同上 | `geometryOfId('song_item_3')`、`geometryOfId('song_item_1')` | left 相等；第 3 行顶边更低 | 是 | 通过 |
| swiping inside the list container succeeds and keeps the container mounted | 同上 | `swipeUpInId('song_list')` | 可达 = 'ok'；否则 'notfound' | 是 | 通过 |
| the swipe brings later rows of the table closer to the viewport | 同上 | `swipeUpInId('song_list')`、行可见数 | 滑动后行顶边不增 | 是 | 通过 |
| scrolling content does not move the list container itself | 同上 | `geometryOfId('song_list')` 滑动前后 | 滑动前后矩形相等且高 > 0 | 是 | 通过 |
| the bottom player stays on screen while the list is scrolled | 同上 | `geometryOfId('player_root')` | player.top > 0（仍在屏内） | 是 | 通过 |
| the two first rows share the same width | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 可达时宽度相等且 > 0 | 是 | 通过 |
| the row gap stays below the height of a single row | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 0 <= 行间距 < 单行高度 | 是 | 通过 |
| the first row is bound below the play-all row | 同上 | `aboveOfId('play_all_row', 'song_item_1')` | 可达时两段均存在（= 2）；否则 order 仍成立 | 是 | 通过 |
| the list container reports a different component type than its rows | 同上 | `typeOfId('song_list')`、`typeOfId('song_item_1')` | 可达时容器类型 ≠ 行类型；否则均 'notfound' | 是 | 通过 |
| the third row is bound below the second row | 同上 | `aboveOfId('song_item_2', 'song_item_3')` | 可达 = 'ok'；否则 'notfound' | 是 | 通过 |
| Anchor: a row id outside the table is reported as missing | 同上 | `geometryOfId('song_item_99')`、`typeOfId('song_item_99')` | 均为 'notfound' | 是 | 通过 |
| at most one list container is mounted on the page | 同上 | `countId('song_list')` | = 视口可达 ? 1 : 0 | 是 | 通过 |
| the list column sits inside the display rectangle on both axes | 同上 | `geometryOfId('song_list')`、`displaySize()` | 落在显示矩形内；否则 'notfound' | 是 | 通过 |
| the list column is rebuilt in the same shape after a full reset | 同上 | `resetToHome()`、`listInViewport()`、行几何 | 复位后可见性与第一行的 id 均与复位前一致 | 是 | 通过 |
| tapping a song row keeps the page bands mounted | 同上 | `clickId('song_item_1')`、`waitId('header_root')` | 点击结果 = 可达 ? 'ok' : 'notfound'；三段容器仍在 | 是 | 通过 |
| two swipes do not detach the play-all row from the list | 同上 | `swipeUpInId('song_list')` 两次、`aboveOfId` | 两次滑动后 play_all_row 与列表的相对顺序不变 | 是 | 通过 |
| the list geometry is stable across two consecutive reads | 同上 | `geometryOfId('song_list')` 连读两次 | 两次矩形相等 | 是 | 通过 |

## UiPlayer01Test 套件（`UiPlayer01.test.ets`，30 条）

底部播放控制栏：`player_*` 七个部件的存在性、1:1 按钮、左右次序、与内容带 / 显示矩形的边界，以及点击播放 / 下一首 / 歌单后的页面稳定性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: the bottom player band is reachable on the home screen | 应用已启动并停在首页 | `waitId('player_root', WAIT_MS)` | 在超时内可见 | 是 | 通过 |
| the player band spans the whole display width | 同上 | `displaySize()`、`geometryOfId('player_root')` | player 宽度 = 屏幕宽度 | 是 | 通过 |
| the seven declared parts of the band are all rendered | 同上 | `existsId` 七个部件 | 存在的部件 = 8（含根容器）；按钮 = 3 | 是 | 通过 |
| the song name of the band follows the song_name string | 同上 | `textOfId('player_song_name')` | = 'ok:' + `song_name`；长度 > 3 | 是 | 通过 |
| the singer of the band follows the singer string | 同上 | `textOfId('player_singer')` | = 'ok:' + `singer` | 是 | 通过 |
| the vip badge sits inside the player band | 同上 | `geometryOfId('player_vip')` | 宽 > 0 | 是 | 通过 |
| the album cover of the band is a square | 同上 | `geometryOfId('player_cover')` | 宽 = 高 且 > 0 | 是 | 通过 |
| the play/pause button is a square | 同上 | `geometryOfId('player_play_btn')` | 宽 = 高 且 > 0 | 是 | 通过 |
| the next button is a square | 同上 | `geometryOfId('player_next_btn')` | 宽 = 高 | 是 | 通过 |
| the playlist button is a square | 同上 | `geometryOfId('player_list_btn')` | 宽 = 高；left > 0 | 是 | 通过 |
| the cover is drawn left of the song name | 同上 | `geometryOfId('player_cover')`、`geometryOfId('player_song_name')` | cover.right <= song_name.left | 是 | 通过 |
| the song name is drawn above the singer line | 同上 | `aboveOfId('player_song_name', 'player_singer')` | = 'ok' | 是 | 通过 |
| the vip badge leads the singer text | 同上 | `geometryOfId('player_vip')`、`geometryOfId('player_singer')` | singer.left − vip.right >= 0 | 是 | 通过 |
| the play button leads the next button | 同上 | `geometryOfId('player_play_btn')`、`geometryOfId('player_next_btn')` | play.right <= next.left | 是 | 通过 |
| the next button leads the playlist button | 同上 | `geometryOfId('player_next_btn')`、`geometryOfId('player_list_btn')` | next.right <= list.left | 是 | 通过 |
| every control of the band stays inside the band height | 同上 | `geometryOfId('player_root')` 与各部件 | 部件上下边均落在 band 高度内 | 是 | 通过 |
| the transport buttons share one vertical centre line | 同上 | `geometryOfId` 三个按钮 | 三者垂直中心相等 | 是 | 通过 |
| the text block does not run under the transport buttons | 同上 | `geometryOfId('player_play_btn')`、`geometryOfId('player_singer')` | play.left > 0 且 singer 宽度 > 0 | 是 | 通过 |
| the band is mounted below the content container | 同上 | `aboveOfId('content_root', 'player_root')` | = 'ok' | 是 | 通过 |
| the band does not leave the bottom of the display | 同上 | `geometryOfId('player_root')`、`displaySize()` | player.bottom <= 屏幕高度 | 是 | 通过 |
| clicking the play button keeps the band and its copy mounted | 同上 | `clickId('player_play_btn')`、`textOfId('player_song_name')` | click = 'ok'；歌名文案不变 | 是 | 通过 |
| clicking the next button keeps the page on the same screen | 同上 | `clickId('player_next_btn')` | click = 'ok'；歌手文案不变 | 是 | 通过 |
| Anchor: the playlist button can be tapped, back leaves the page and a relaunch restores it | 同上 | `clickId('player_list_btn')`、`pressBack()`、`launchApp()` | click = 'ok'；back = 'ok'；重启后 player_root 可见 | 是 | 通过 |
| Anchor: an id the player never declares is reported as missing | 同上 | `geometryOfId('player_missing')`、`textOfId('player_missing')` | 均为 'notfound' | 是 | 通过 |
| exactly one player band is mounted on the page | 同上 | `countId('player_root')`、`countId('player_cover')` | 均为 1 | 是 | 通过 |
| the cover and the vip badge overlap the band vertically | 同上 | `geometryOfId('player_root')`、`geometryOfId('player_vip')` | band 高度 > vip 高度 | 是 | 通过 |
| the playlist button is the right-most control of the band | 同上 | `geometryOfId('player_list_btn')`、`geometryOfId('player_root')` | list.right > 0 且在按钮中最右 | 是 | 通过 |
| the player band stays below the header band | 同上 | `aboveOfId('header_root', 'player_root')` | = 'ok' | 是 | 通过 |
| the band geometry and copy survive a reset of the page | 同上 | `resetToHome()`、`geometryOfId('player_root')` | 复位后 player 顶边与复位前一致 | 是 | 通过 |
| repeated reads of the band return the same rectangle and type | 同上 | `geometryOfId('player_root')` 连读两次、`typeOfId` | 两次矩形与类型均相等 | 是 | 通过 |

## UiBreakpoint01Test 套件（`UiBreakpoint01.test.ets`，30 条）

断点与整体几何：显示矩形、三段容器的宽度与堆叠、1:1 封面、sm 堆叠 / md-lg 分栏两种排布的自洽性，以及复位后的重建顺序。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: the driver reports a positive display rectangle | 应用已启动并停在首页 | `displaySize()` | 宽高均 > 0 | 是 | 通过 |
| the display rectangle is stable between two reads | 同上 | `displaySize()` 连读两次 | 两次快照相等 | 是 | 通过 |
| the display is at least as wide as the smallest declared breakpoint | 同上 | `displaySize()` | 宽 >= 320vp 对应的最小断点 | 是 | 通过 |
| the header band covers the whole display width | 同上 | `geometryOfId('header_root')` | left = 0；宽度 = 屏幕宽度 | 是 | 通过 |
| the content band covers the whole display width | 同上 | `geometryOfId('content_root')` | 宽 > 0；right = 屏幕宽度 | 是 | 通过 |
| the player band covers the whole display width | 同上 | `geometryOfId('player_root')` | 宽度 = 屏幕宽度 | 是 | 通过 |
| the page is built from exactly three bands | 同上 | `countId` 三段容器 | 合计 = 3 | 是 | 通过 |
| the header band is rendered above the content band | 同上 | `aboveOfId('header_root', 'content_root')` | = 'ok' | 是 | 通过 |
| the content band is rendered above the player band | 同上 | `aboveOfId('content_root', 'player_root')` | = 'ok' | 是 | 通过 |
| the three bands are stacked with strictly increasing tops | 同上 | 三段容器 geometry | header.top < content.top < player.top | 是 | 通过 |
| the content band takes the space left between the two toolbars | 同上 | 三段容器 geometry | 上方间隙 >= 0；下方间隙 >= 0 | 是 | 通过 |
| the content band never exceeds the display height | 同上 | `geometryOfId('content_root')`、`displaySize()` | 内容带高 > 0 且不超过屏幕高度 | 是 | 通过 |
| the album cover keeps the 1:1 aspect ratio required by the layout | 同上 | `geometryOfId('cover_album')` | 宽 = 高 且 > 0 | 是 | 通过 |
| the album cover is inside the content band | 同上 | `geometryOfId('cover_album')`、`geometryOfId('content_root')` | 封面落在内容带内 | 是 | 通过 |
| the collection counter is drawn over the album cover | 同上 | `textOfId('cover_collection_num')` | = 'ok:' + `collection_num` | 是 | 通过 |
| the playlist name is inside the content band when the copy column is laid out | 同上 | `introInViewport()`、`geometryOfId('cover_list_name')` | 可达时落在内容带内；否则 'notfound' | 是 | 通过 |
| the playlist introduction keeps the copy of the resource file | 同上 | `textOfId('cover_intro')` | 可达时 = 'ok:' + `playlist_Introduction` | 是 | 通过 |
| the option strip keeps a positive height inside the content band | 同上 | `geometryOfId('cover_options')` | 高 > 0 | 是 | 通过 |
| Anchor: the cover column and the list column use one of the two declared arrangements | 同上 | `listInViewport()`、`introInViewport()` 与封面几何 | 命中「并排」或「堆叠」其中一种，两者互斥 | 是 | 通过 |
| the arrangement on screen agrees with the geometry it implies | 同上 | 同上 | 堆叠时列表列不在右侧；并排时两列左右相邻 | 是 | 通过 |
| the song list column never leaves the right edge of the display | 同上 | `geometryOfId('song_list')`、`displaySize()` | 可达时 right <= 屏幕宽度；否则 'notfound' | 是 | 通过 |
| the header band is shorter than the display it sits in | 同上 | `geometryOfId('header_root')` | 高 > 0 且 < 屏幕高度 | 是 | 通过 |
| the first two song rows share the same height when the list is on screen | 同上 | `geometryOfId('song_item_1')`、`geometryOfId('song_item_2')` | 可达时等高且 > 0 | 是 | 通过 |
| the play-all row starts at the left edge of its column | 同上 | `geometryOfId('play_all_row')`、`geometryOfId('song_list')` | row.left = list.left（可达时） | 是 | 通过 |
| the playlist name and the cover are both inside the display width | 同上 | `geometryOfId('cover_album')`、`geometryOfId('cover_list_name')` | 两者左右边均在 [0, 屏幕宽度] 内 | 是 | 通过 |
| the header title keeps the play_list copy on every breakpoint | 同上 | `textOfId('header_title')` | = 'ok:' + `play_list`；长度 > 3 | 是 | 通过 |
| the cover never overlaps the option strip vertically | 同上 | `geometryOfId('cover_album')`、`geometryOfId('cover_options')` | 封面底边 <= 选项条顶边（或反之） | 是 | 通过 |
| Anchor: an undeclared id is reported as missing on every breakpoint | 同上 | `geometryOfId('content_missing')`、`countId` 三段容器 | 'notfound'；三段容器仍为 3 | 是 | 通过 |
| the band chain is rebuilt in the same order after a reset | 同上 | `resetToHome()`、三段容器 geometry | header→content→player 顺序不变 | 是 | 通过 |
| the display rectangle is wider than a single song row is tall | 同上 | `displaySize()`、`geometryOfId('song_item_1')` | 屏幕宽度 > 行高 | 是 | 通过 |

## 运行与验证

构建（模块级 ohosTest HAP）。`entry/build-profile.json5` 声明了 `default` 与 `ohosTest` 两个 target，根 `build-profile.json5` 的
`targetSdkVersion` / `compileSdkVersion` / `compatibleSdkVersion` 均为 `23`，`runtimeOS` 为 `OpenHarmony`。

方式一：IDE 构建。在 IDE 中执行 `Build > Build Hap(s)/APP(s) > Build Hap(s)`，构建目标选择 module `entry` 的 `ohosTest`。

方式二：命令行构建。优先使用 `devecocli`，也可使用工程根目录已有的 `hvigorw.bat`：

```shell
devecocli build --modules entry@ohosTest
devecocli build --modules entry@default
```

```shell
.\hvigorw.bat --mode module -p module=entry@ohosTest -p product=default -p buildMode=debug assembleHap --no-daemon
.\hvigorw.bat --mode module -p module=entry@default -p product=default -p buildMode=debug assembleHap --no-daemon
```

```text
# 产物目录：entry/build/default/outputs/ohosTest/
#           entry/build/default/outputs/default/
```

> 仓库不保存签名配置、证书或密钥。真机安装前需在 DevEco Studio 的 `Project Structure > Signing Configs` 中配置本机自动签名，且不得将生成的签名材料提交到仓库。
> 产物是 `-signed.hap` 还是 `-unsigned.hap` 取决于本机签名配置；只有正确签名的 HAP 才能安装。ohosTest 构建会清理 `outputs/default`，装包前需要再构建一次主包。

真机安装（测试 HAP 与主 HAP 一起装，避免只装测试包时被测应用缺失）：

```shell
hdc uninstall ohos.samples.musicalbum
hdc shell mkdir data/local/tmp/musicalbum
hdc file send entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap /data/local/tmp/musicalbum/entry-ohosTest.hap
hdc file send entry/build/default/outputs/default/entry-default-signed.hap /data/local/tmp/musicalbum/entry-default.hap
hdc shell bm install -p /data/local/tmp/musicalbum
hdc shell rm -rf data/local/tmp/musicalbum
```

单进程整跑 2633 条用例会触发 App died，按下表分 15 批执行（每批不超过 255 条用例）：

| 批次 | `-s class` 套件清单 | 套件数 | 用例数 |
|---|---|---|---|
| 1 | AbilityTest、UiHome01Test | 2 | 33 |
| 2 | UiList01Test、UiPlayer01Test、UiBreakpoint01Test | 3 | 90 |
| 3 | RealDataCore01Test、RealListener01Test、RealSongTable01Test、RealOption01Test、RealStats01Test、RealEdge01Test | 6 | 210 |
| 4 | DsSizeVolume01Test、DsSizeVolume02Test | 2 | 170 |
| 5 | DsSizeVolume03Test、DsSizeVolume04Test | 2 | 170 |
| 6 | DsAddVolume01Test、DsAddVolume02Test | 2 | 170 |
| 7 | DsAddVolume03Test、DsAddVolume04Test、DsAddVolume05Test | 3 | 255 |
| 8 | DsGetVolume01Test、DsGetVolume02Test、DsGetVolume03Test | 3 | 255 |
| 9 | DsGetVolume04Test、DsGetVolume05Test | 2 | 170 |
| 10 | DsGetVolume06Test、DsGetVolume07Test | 2 | 170 |
| 11 | DsPushVolume01Test、DsPushVolume02Test、DsPushVolume03Test | 3 | 255 |
| 12 | LsnRegVolume01Test、LsnNotifyVolume01Test | 2 | 170 |
| 13 | LsnNotifyVolume02Test、LsnNotifyVolume03Test、LsnNotifyVolume04Test | 3 | 255 |
| 14 | LsnNotifyVolume05Test、SongTableVolume01Test | 2 | 170 |
| 15 | OptionTableVolume01Test、StatsVolume01Test | 2 | 90 |
| **合计** | - | **39** | **2633** |

> 执行前置条件：UI 探针用例通过 `@kit.TestKit` 的 `Driver` 连接 AAMS，执行前需保证设备处于解锁状态、无系统弹窗或其它应用占据顶层窗口。
> 设备停在锁屏时，`launchApp()` 无法把应用带到前台，全部 L2 用例会返回 `notfound` / `error:geometry`；执行前可用
> `hdc shell power-shell wakeup` 与上滑手势解锁，并用 `hdc shell power-shell setmode 602` 保持常亮。

## 测试结果

### 本轮整改验证

| 检查项 | 结果 |
|---|---|
| 套件注册 | 39 个套件全部在 `List.test.ets` 中 import 并在 `testsuite()` 内调用 |
| 静态审计 | 2633 条用例、8029 条断言；编号、名称、元数据、`runCase()` 和断言前日志检查无问题；69 个源码及配置文件版权头完整，120 字符长行为 0 |
| 本地构建 | `entry@default` 与 `entry@ohosTest` 均 `BUILD SUCCESSFUL`；真机验证使用本机签名产物 `entry-default-signed.hap` 与 `entry-ohosTest-signed.hap`，仓库不保留签名配置 |
| Code Linter | 0 错误、0 建议；剩余 3 条性能警告涉及自定义组件改 Builder 或可复用组件的结构改造，未通过关闭规则规避 |
| 真机运行 | 2026-11-20 连续两轮各执行 15 批；每轮 2633 条通过、0 失败、0 错误、0 忽略，两轮结果一致 |

### 历史真机基线（2026-11-19，整改前）

2633 条通过 / 0 条失败 / 0 条错误。执行环境为 OpenHarmony-7.1.0.21（API 26）、设备类型 default，应用使用整改前包名，测试模块为 `entry_test`。设备标识不写入文档。该机为 720×1280 px、密度 2，即 360×640 vp 的 sm 档窗口。

当前运行参数如下：

| 参数 | 取值 | 运行时选项 |
|---|---|---|
| 应用包名 | `ohos.samples.musicalbum` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器 | `/ets/TestRunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单批超时（毫秒） | `15000` | `-s timeout` |

历史 15 批 `Tests run` 分别为 33 / 90 / 210 / 170 / 170 / 170 / 255 / 255 / 170 / 170 / 255 / 170 / 255 / 170 / 90，合计 Pass=2633、Failure=0、Error=0。只跑指定套件时，在当前批次命令基础上追加 `-s class <套件名或 Suite#method，逗号分隔>`。

说明：本设备为 sm 窄屏，`Content.ets` 的 `GridRow` 会把封面列与歌单列上下堆叠，且 1:1 封面会占满整个内容带高度，因此 `song_list` / `song_item_*` 与 `cover_list_name` / `cover_intro` 在该窗口下不进入无障碍树。UI 用例统一先用 `listInViewport()` / `introInViewport()` 探针判断当前视口，再分别断言「列可达」与「列被挤出」两种真实排布，避免把单一窗口尺寸写死。
