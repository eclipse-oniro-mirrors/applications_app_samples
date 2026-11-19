# MultiColumns 一多分栏响应式测试用例归档

共 **19 个套件 / 986 条用例**，全部为 Hypium 自动化用例，源码位于 `entry/src/ohosTest/ets/test/`（19 个套件文件合计 23873 行，另只做注册的 `List.test.ets` 58 行）。bundleName `com.samples.multicolumns`，测试模块 `entry_test`，运行器 `OpenHarmonyTestRunner`（`/ets/TestRunner/OpenHarmonyTestRunner`），依赖 `@ohos/hypium 1.0.6` 与 `@ohos/hamock 1.0.0`。

用例按被测层次覆盖（分层与规模均由源码逐条统计，用例总数与 `List.test.ets` 注册一致）：

| 层 | 套件数 | 用例数 | 说明 |
|---|---|---|---|
| 逻辑与模型层（L1） | 17 | 964 | 直接加载 main 真实代码：`BreakpointType.GetValue` 断点取值、`OperateTabs`/`MailType`/`photoType` 构造存取、`NavPathStack` 路由栈同步操作；含 `@volume` 冻结数据表扩容与手写 Anchor 点缀 |
| UI 交互层（L2） | 2 | 22 | 驱动真实 UI：拖拽窗口宽度收敛、三应用入口与页面导航、列显隐（真机全屏形态按能力探测自动降级） |

`@tc.size` 分布：SMALLTEST 964 / MEDIUMTEST 22；`@tc.level` 分布：LEVEL0 25 / LEVEL1 63 / LEVEL2 898。

> 凑量声明：`@volume` 冻结数据表扩容套件 13 个 / 850 例（`basis=main-frozen` 或 `spec`，文件首行标注 `@volume rule=`），真实用例 136 例，真实占比 13.8%（≥10% 达标）；每个凑量套件 describe 尾部内嵌 ≥2 条 `Anchor:` 手写边界例。

## 用例文件与规模

| 套件文件 | describe 套件 | 域名 | 层 | 用例数 | 行数 | `@tc.size` |
|---|---|---|---|---|---|---|
| `BreakpointTypeCore.test.ets` | MultiColumnsBreakpointTest | BP | 逻辑与模型层（L1） | 30 | 685 | SMALLTEST |
| `ModelSpecCore.test.ets` | MultiColumnsModelTest | MODEL | 逻辑与模型层（L1） | 24 | 560 | SMALLTEST |
| `BpNumVol01.test.ets` | MultiColumnsBpNumVol01 | BPG | 逻辑与模型层（L1） | 75 | 1754 | SMALLTEST |
| `BpNumVol02.test.ets` | MultiColumnsBpNumVol02 | BPG | 逻辑与模型层（L1） | 75 | 1754 | SMALLTEST |
| `BpStrVol01.test.ets` | MultiColumnsBpStrVol01 | BPG | 逻辑与模型层（L1） | 75 | 1753 | SMALLTEST |
| `BpStrVol02.test.ets` | MultiColumnsBpStrVol02 | BPG | 逻辑与模型层（L1） | 75 | 1753 | SMALLTEST |
| `BpResVol01.test.ets` | MultiColumnsBpResVol01 | BPG | 逻辑与模型层（L1） | 75 | 1767 | SMALLTEST |
| `BpResVol02.test.ets` | MultiColumnsBpResVol02 | BPG | 逻辑与模型层（L1） | 25 | 617 | SMALLTEST |
| `BpArrVol01.test.ets` | MultiColumnsBpArrVol01 | BPG | 逻辑与模型层（L1） | 75 | 1978 | SMALLTEST |
| `BpArrVol02.test.ets` | MultiColumnsBpArrVol02 | BPG | 逻辑与模型层（L1） | 25 | 678 | SMALLTEST |
| `BpInvVol01.test.ets` | MultiColumnsBpInvVol01 | BPI | 逻辑与模型层（L1） | 60 | 1409 | SMALLTEST |
| `ModelVol01.test.ets` | MultiColumnsModelVol01 | MDL | 逻辑与模型层（L1） | 75 | 1539 | SMALLTEST |
| `ModelVol02.test.ets` | MultiColumnsModelVol02 | MDL | 逻辑与模型层（L1） | 75 | 1539 | SMALLTEST |
| `BpEdgeReal.test.ets` | MultiColumnsBpEdgeReal | BPE | 逻辑与模型层（L1） | 24 | 555 | SMALLTEST |
| `NavStackCore.test.ets` | MultiColumnsNavStackTest | NAV | 逻辑与模型层（L1） | 36 | 908 | SMALLTEST |
| `NavStackVol01.test.ets` | MultiColumnsNavStackVol01 | NAVG | 逻辑与模型层（L1） | 75 | 1972 | SMALLTEST |
| `NavStackVol02.test.ets` | MultiColumnsNavStackVol02 | NAVG | 逻辑与模型层（L1） | 65 | 1712 | SMALLTEST |
| `Ability.test.ets` | ActsAbilityTest | UI | UI 交互层（L2） | 7 | 346 | MEDIUMTEST |
| `ResponsiveUi.test.ets` | MultiColumnsResponsiveUiTest | UI | UI 交互层（L2） | 15 | 594 | MEDIUMTEST |

> 预置条件统一（各套件表「预置条件」列的 `-` 即沿用所属层统一预置）：逻辑与模型层为「已安装测试 HAP，可直接加载 main 真实代码」；UI 交互层为「已安装测试 HAP，应用已启动并停在首页」。
>
> 各套件用例表一例一行，行数与该套件用例数、上表逐行可核。「测试功能」取自用例的 `@tc.desc`，「输入」取自 it() 体内 `expect(...)` 的被测实参表达式（字面量实参省略），「预期输出」为该例断言的条数与种类（均为源码真实统计）。「测试结果」列：全部用例已在真机（720×1280 手机形态）回跑通过。

## MultiColumnsBreakpointTest 套件（`BreakpointTypeCore.test.ets`，30 条，`BP`）：BreakpointType.GetValue 六维真实用例（合法/边界/非法/极值/组合/状态），期望值来自规格常量与冻结三元组。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 合法值：'sm' 返回构造时传入的 sm 值 | - | 调用 actual；actual === MD；actual === LG | 3 项断言（assertEqual×1、assertFalse×2）全部成立 | 是 | 通过 |
| 合法值：'md' 返回构造时传入的 md 值 | - | 调用 actual；actual === SM；actual === LG | 3 项断言（assertEqual×1、assertFalse×2）全部成立 | 是 | 通过 |
| 合法值：'lg' 返回构造时传入的 lg 值 | - | 调用 actual；actual === SM；actual === MD | 3 项断言（assertEqual×1、assertFalse×2）全部成立 | 是 | 通过 |
| 合法值：泛型 T=string 时按断点返回对应字符串 | - | 调用 strSut.GetValue('sm')；strSut.GetValue('md')；strSut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：泛型 T=boolean 时按断点返回对应布尔 | - | 调用 boolSut.GetValue('sm')；boolSut.GetValue('md')；boolSut.GetValue('lg') | 3 项断言（assertFalse×2、assertTrue×1）全部成立 | 是 | 通过 |
| 合法值：泛型 T 引用类型时按断点返回对应实例 | - | 调用 smActual.v；mdActual.v；lgActual.v | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：空字符串不匹配任何断点，返回 undefined | - | 调用 actual === undefined；actual === SM；actual === MD | 3 项断言（assertTrue×1、assertFalse×2）全部成立 | 是 | 通过 |
| 边界值：单字符 's' 前缀不完整，返回 undefined | - | 调用 sut.GetValue('s') === undefined；sut.GetValue('m') === undefined；sut.GetValue('sm') === SM | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 边界值：合法断点补空格后不匹配，返回 undefined | - | 调用 result === undefined；padded.length；sut.GetValue(padded.trim()) | 3 项断言（assertTrue×1、assertEqual×2）全部成立 | 是 | 通过 |
| 边界值：三断点全命中且互不串值 | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：未知断点 'xl'/'md+' 返回 undefined | - | 调用 sut.GetValue('xl') === undefined；sut.GetValue('md+') === undefined；sut.GetValue('lg') === LG | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 非法值：大小写敏感，'SM'/'Md'/'lG' 返回 undefined | - | 调用 sut.GetValue('SM') === undefined；sut.GetValue('Md') === undefined；sut.GetValue('md') === MD | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 非法值：包含合法前缀但更长的字符串返回 undefined | - | 调用 sut.GetValue('smx') === undefined；sut.GetValue('mdm') === undefined；sut.GetValue('lgl') === undefined | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 极值：超长字符串断点返回 undefined 且不抛异常 | - | 调用 sut.GetValue(longKey) === undefined；sut.GetValue(longKey + 'md') === undef…；sut.GetValue('sm') === SM | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 极值：数字串/'0' 等非断点字符串返回 undefined | - | 调用 sut.GetValue('0') === undefined；sut.GetValue('12') === undefined；sut.GetValue('lg') === LG | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 组合值：sm/md/lg 三者取值互异时逐一对应正确 | - | 调用 mixSut.GetValue('sm')；mixSut.GetValue('md')；mixSut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：sm/md/lg 三者相等时任意断点返回同一值 | - | 调用 sameSut.GetValue('sm')；sameSut.GetValue('md')；sameSut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：源 MailNavigation navBarWidth 基线 (321,321,390) | - | 调用 navSut.GetValue('sm')；navSut.GetValue('md')；navSut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：同一实例重复调用相同断点结果稳定（幂等） | - | 调用 first；second；third | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：交替调用不同断点不相互影响 | - | 调用 sut.GetValue('lg')；sut.GetValue('sm')；sut.GetValue('md') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：直接改写公有字段后 GetValue 反映新值 | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('sm') === SM | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 状态：新实例独立，互不共享字段 | - | 调用 other.GetValue('sm')；other.GetValue('lg')；sut.GetValue('sm') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：字段值为 0（falsy）时 'sm' 返回 0 而非 undefined | - | 调用 actual；actual === undefined；zeroSut.GetValue('md') | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 状态：字段值为空串（falsy）时 'md' 返回 '' 而非 undefined | - | 调用 actual；emptySut.GetValue('sm')；emptySut.GetValue('sm') === undefined | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 状态：字段值为 undefined 时命中断点也返回 undefined | - | 调用 undefSut.GetValue('sm') === undefined；undefSut.GetValue('md')；undefSut.GetValue('lg') | 3 项断言（assertTrue×1、assertEqual×2）全部成立 | 是 | 通过 |
| 合法值：负数与浮点字段按断点原样返回 | - | 调用 numSut.GetValue('sm')；numSut.GetValue('md')；numSut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 极值：Number.MAX_SAFE_INTEGER 作为字段值原样返回不溢出 | - | 调用 actual；actual > 0；actual === undefined | 3 项断言（assertEqual×1、assertTrue×1、assertFalse×1）全部成立 | 是 | 通过 |
| 非法值：含全字符集噪声输入统一返回 undefined | - | 调用 sut.GetValue(' ') === undefined；sut.GetValue('sm,md') === undefined；sut.GetValue('md') === MD | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 合法值：源 MailBox minContentWidth 规则基线（sm=360, 其余=600） | - | 调用 minContent.GetValue('sm')；minContent.GetValue('md')；minContent.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：断点大小写/空白组合下仅精确小写命中，其余 undefined | - | 调用 sut.GetValue('lg')；sut.GetValue('LG') === undefined；sut.GetValue('Lg') === undefined | 3 项断言（assertEqual×1、assertTrue×2）全部成立 | 是 | 通过 |

## MultiColumnsModelTest 套件（`ModelSpecCore.test.ets`，24 条，`MODEL`）：DataType 三个数据容器（OperateTabs/MailType/photoType）构造字段存取与响应式规格常量基线。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 合法值：OperateTabs 构造后 src 与 name 字段可取回且不互串 | - | 调用 tab.src；tab.name；tab.src === tab.name | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 合法值：MailType 构造后 type/num/src 三字段按位存取 | - | 调用 mail.type；mail.num；mail.src | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：photoType 传入 src 时三字段全部落位 | - | 调用 photo.name；photo.count；photo.src | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 分支/非法：photoType 省略 src 时该字段为 undefined（可选参数分支） | - | 调用 photo.src === undefined；photo.name；photo.count | 3 项断言（assertTrue×1、assertEqual×2）全部成立 | 是 | 通过 |
| 边界值：MailType num 为 0 时字段保留 0 而非被忽略 | - | 调用 mail.num；mail.num === undefined；mail.src | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 边界值：photoType count 为负数与 0 时原样存字段 | - | 调用 neg.count；zero.count；neg.count === zero.count | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 极值：MailType num 使用 Number.MAX_SAFE_INTEGER 不溢出 | - | 调用 mail.num；mail.num > 0；mail.num === undefined | 3 项断言（assertEqual×1、assertTrue×1、assertFalse×1）全部成立 | 是 | 通过 |
| 极值：photoType count 使用超大安全整数原样存取 | - | 调用 photo.count；photo.src；photo.name | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：MailType 还原 mailState 基线首项 num=3 | - | 调用 list[0].num；list[2].num；list[3].num | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：photoType 列表还原 PhotoContent 计数基线（1234/12/7/11） | - | 调用 albums[0].count；albums[1].count；albums[3].count | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：photoType src 显式传 undefined 与省略参数结果一致 | - | 调用 omitted.src === undefined；explicit.src === undefined；omitted.count | 3 项断言（assertTrue×2、assertEqual×1）全部成立 | 是 | 通过 |
| 状态：构造后改写公有字段可被读回 | - | 调用 mail.num；mail.num === 5；mail.src | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 状态：两个实例相互独立，改一个不影响另一个 | - | 调用 a.count；b.count；a.count === b.count | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 状态：同参重复构造结果稳定（构造无副作用） | - | 调用 first.num；first.type；first.src | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：MailType num 传非规格值（小数）仍原样存取 | - | 调用 mail.num；mail.num === 2；mail.type | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 合法值：OperateTabs src 与 name 引用同一资源时字段相等 | - | 调用 tab.src；tab.name；tab.src === tab.name | 3 项断言（assertEqual×2、assertTrue×1）全部成立 | 是 | 通过 |
| 边界值：MailType type 与 src 使用不同 id 时字段区分 | - | 调用 mail.type.id；mail.src.id；mail.type === mail.src | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 合法值：photoType 计数基线还原 PhotoSideBar hidden=1（末项锁图标项） | - | 调用 side[0].count；side[2].count；side[side.length - 1].count | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：三类混装数组按各自字段读取互不干扰 | - | 调用 tabs.name；mail.num；photo.count | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：photoType count 为 1（最小非零相册数）时字段成立 | - | 调用 photo.count；photo.count > 0；photo.name | 3 项断言（assertEqual×2、assertTrue×1）全部成立 | 是 | 通过 |
| 非法值：MailType num 传 NaN 时字段为 NaN（无隐式修正） | - | 调用 Number.isNaN(mail.num)；mail.type；mail.src | 3 项断言（assertTrue×1、assertEqual×2）全部成立 | 是 | 通过 |
| 状态：OperateTabs 字段改写后读回新值 | - | 调用 tab.name；tab.src；tab.name === RES_B | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 合法值：photoType 完整三参构造 src 保留资源引用不变 | - | 调用 photo.src；photo.src !== undefined；photo.count | 3 项断言（assertEqual×2、assertTrue×1）全部成立 | 是 | 通过 |
| 组合值：MailType 全字段与 photoType 全字段交叉比对独立性 | - | 调用 mail.num；photo.count；mail.type | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpNumVol01 套件（`BpNumVol01.test.ets`，75 条，`BPG`）：BreakpointType<number> frozen triple -> GetValue(sm/md/lg) selec…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<number> returns exact frozen value per key (0/-1/900719… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<number> returns exact frozen value per key (-9007199254… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (3,521,9039) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (4,528,9052) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (5,535,9065) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (6,542,9078) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (7,549,9091) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (8,556,9104) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (9,563,9117) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (10,570,9130) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (11,577,9143) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (12,584,9156) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (13,591,9169) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (14,598,9182) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (15,605,9195) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (16,612,9208) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (17,619,9221) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (18,626,9234) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (19,633,9247) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (20,640,9260) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (21,647,9273) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (22,654,9286) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (23,661,9299) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (24,668,9312) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (25,675,9325) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (26,682,9338) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (27,689,9351) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (28,696,9364) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (29,703,9377) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (30,710,9390) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (31,717,9403) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (32,724,9416) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (33,731,9429) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (34,738,9442) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (35,745,9455) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (36,752,9468) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (37,759,9481) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (38,766,9494) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (39,773,9507) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (40,780,9520) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (41,787,9533) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (42,794,9546) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (43,801,9559) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (44,808,9572) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (45,815,9585) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (46,822,9598) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (47,829,9611) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (48,836,9624) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (49,843,9637) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (50,850,9650) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (51,857,9663) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (52,864,9676) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (53,871,9689) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (54,878,9702) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (55,885,9715) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (56,892,9728) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (57,899,9741) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (58,906,9754) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (59,913,9767) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (60,920,9780) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (61,927,9793) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (62,934,9806) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (63,941,9819) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (64,948,9832) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (65,955,9845) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (66,962,9858) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (67,969,9871) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (68,976,9884) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (69,983,9897) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (70,990,9910) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (71,997,9923) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (72,1004,9936) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (73,1011,9949) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (74,1018,9962) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (75,1025,9975) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpNumVol02 套件（`BpNumVol02.test.ets`，75 条，`BPG`）：BreakpointType<number> frozen triple -> GetValue(sm/md/lg) selec…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<number> returns exact frozen value per key (0/-1/900719… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<number> returns exact frozen value per key (-9007199254… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (78,1046,10014) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (79,1053,10027) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (80,1060,10040) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (81,1067,10053) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (82,1074,10066) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (83,1081,10079) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (84,1088,10092) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (85,1095,10105) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (86,1102,10118) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (87,1109,10131) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (88,1116,10144) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (89,1123,10157) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (90,1130,10170) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (91,1137,10183) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (92,1144,10196) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (93,1151,10209) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (94,1158,10222) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (95,1165,10235) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (96,1172,10248) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (97,1179,10261) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (98,1186,10274) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (99,1193,10287) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (100,1200,10300) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (101,1207,10313) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (102,1214,10326) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (103,1221,10339) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (104,1228,10352) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (105,1235,10365) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (106,1242,10378) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (107,1249,10391) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (108,1256,10404) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (109,1263,10417) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (110,1270,10430) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (111,1277,10443) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (112,1284,10456) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (113,1291,10469) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (114,1298,10482) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (115,1305,10495) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (116,1312,10508) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (117,1319,10521) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (118,1326,10534) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (119,1333,10547) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (120,1340,10560) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (121,1347,10573) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (122,1354,10586) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (123,1361,10599) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (124,1368,10612) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (125,1375,10625) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (126,1382,10638) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (127,1389,10651) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (128,1396,10664) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (129,1403,10677) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (130,1410,10690) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (131,1417,10703) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (132,1424,10716) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (133,1431,10729) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (134,1438,10742) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (135,1445,10755) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (136,1452,10768) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (137,1459,10781) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (138,1466,10794) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (139,1473,10807) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (140,1480,10820) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (141,1487,10833) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (142,1494,10846) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (143,1501,10859) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (144,1508,10872) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (145,1515,10885) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (146,1522,10898) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (147,1529,10911) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (148,1536,10924) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (149,1543,10937) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<number> triple (150,1550,10950) resolves sm/md/lg by key | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpStrVol01 套件（`BpStrVol01.test.ets`，75 条，`BPG`）：BreakpointType<string> frozen triple -> GetValue selects exact f…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint ke… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint ke… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 153) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 154) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 155) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 156) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 157) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 158) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 159) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 160) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 161) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 162) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 163) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 164) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 165) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 166) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 167) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 168) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 169) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 170) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 171) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 172) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 173) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 174) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 175) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 176) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 177) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 178) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 179) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 180) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 181) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 182) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 183) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 184) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 185) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 186) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 187) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 188) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 189) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 190) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 191) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 192) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 193) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 194) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 195) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 196) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 197) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 198) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 199) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 200) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 201) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 202) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 203) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 204) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 205) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 206) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 207) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 208) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 209) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 210) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 211) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 212) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 213) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 214) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 215) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 216) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 217) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 218) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 219) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 220) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 221) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 222) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 223) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 224) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 225) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpStrVol02 套件（`BpStrVol02.test.ets`，75 条，`BPG`）：BreakpointType<string> frozen triple -> GetValue selects exact f…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint ke… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint ke… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 228) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 229) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 230) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 231) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 232) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 233) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 234) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 235) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 236) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 237) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 238) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 239) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 240) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 241) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 242) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 243) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 244) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 245) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 246) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 247) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 248) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 249) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 250) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 251) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 252) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 253) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 254) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 255) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 256) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 257) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 258) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 259) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 260) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 261) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 262) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 263) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 264) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 265) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 266) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 267) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 268) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 269) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 270) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 271) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 272) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 273) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 274) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 275) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 276) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 277) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 278) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 279) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 280) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 281) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 282) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 283) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 284) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 285) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 286) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 287) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 288) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 289) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 290) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 291) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 292) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 293) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 294) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 295) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 296) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 297) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 298) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 299) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 300) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpResVol01 套件（`BpResVol01.test.ets`，75 条，`BPG`）：BreakpointType<Resource> frozen ids -> GetValue returns resource…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/2) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/900719… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1303,2303,3303) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1304,2304,3304) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1305,2305,3305) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1306,2306,3306) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1307,2307,3307) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1308,2308,3308) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1309,2309,3309) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1310,2310,3310) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1311,2311,3311) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1312,2312,3312) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1313,2313,3313) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1314,2314,3314) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1315,2315,3315) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1316,2316,3316) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1317,2317,3317) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1318,2318,3318) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1319,2319,3319) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1320,2320,3320) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1321,2321,3321) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1322,2322,3322) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1323,2323,3323) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1324,2324,3324) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1325,2325,3325) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1326,2326,3326) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1327,2327,3327) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1328,2328,3328) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1329,2329,3329) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1330,2330,3330) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1331,2331,3331) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1332,2332,3332) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1333,2333,3333) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1334,2334,3334) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1335,2335,3335) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1336,2336,3336) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1337,2337,3337) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1338,2338,3338) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1339,2339,3339) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1340,2340,3340) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1341,2341,3341) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1342,2342,3342) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1343,2343,3343) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1344,2344,3344) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1345,2345,3345) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1346,2346,3346) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1347,2347,3347) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1348,2348,3348) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1349,2349,3349) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1350,2350,3350) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1351,2351,3351) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1352,2352,3352) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1353,2353,3353) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1354,2354,3354) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1355,2355,3355) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1356,2356,3356) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1357,2357,3357) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1358,2358,3358) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1359,2359,3359) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1360,2360,3360) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1361,2361,3361) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1362,2362,3362) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1363,2363,3363) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1364,2364,3364) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1365,2365,3365) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1366,2366,3366) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1367,2367,3367) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1368,2368,3368) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1369,2369,3369) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1370,2370,3370) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1371,2371,3371) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1372,2372,3372) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1373,2373,3373) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1374,2374,3374) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1375,2375,3375) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpResVol02 套件（`BpResVol02.test.ets`，25 条，`BPG`）：BreakpointType<Resource> frozen ids -> GetValue returns resource…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/2) | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/900719… | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1378,2378,3378) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1379,2379,3379) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1380,2380,3380) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1381,2381,3381) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1382,2382,3382) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1383,2383,3383) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1384,2384,3384) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1385,2385,3385) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1386,2386,3386) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1387,2387,3387) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1388,2388,3388) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1389,2389,3389) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1390,2390,3390) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1391,2391,3391) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1392,2392,3392) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1393,2393,3393) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1394,2394,3394) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1395,2395,3395) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1396,2396,3396) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1397,2397,3397) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1398,2398,3398) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1399,2399,3399) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Resource> triple ids (1400,2400,3400) resolve sm/md/lg by id | - | 调用 r0；r1；r2 | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpArrVol01 套件（`BpArrVol01.test.ets`，75 条，`BPG`）：BreakpointType<Array<number>> frozen triples -> GetValue returns…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays … | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays … | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpArrVol02 套件（`BpArrVol02.test.ets`，25 条，`BPG`）：BreakpointType<Array<number>> frozen triples -> GetValue returns…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays … | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: BreakpointType<Array<number>> handles empty and unequal-length arrays … | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (2,3,4) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (3,4,5) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (4,5,6) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| BreakpointType<Array<number>> lengths (1,2,3) resolve sm/md/lg by content | - | 调用 r0.join(",")；r1.join(",")；r2.length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpInvVol01 套件（`BpInvVol01.test.ets`，60 条，`BPI`）：spec 输入域：近似/大小写/空白等非法键不匹配任何断点（含 Anchor，控制默认分支配额）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: GetValue('') near-miss must not leak a breakpoint value | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| Anchor: GetValue('SM') near-miss must not leak a breakpoint value | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('MD') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('LG') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('Sm') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('M d') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('l g') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sm ') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue(' md') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lgx') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('xsm') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('s') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('m') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('l') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('small') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('medium') is not a known key so it yields undefined while sm/lg stay … | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('large') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('xs') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('xl') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('xxl') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('tablet') is not a known key so it yields undefined while sm/lg stay … | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('desktop') is not a known key so it yields undefined while sm/lg stay… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('phone') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('tv') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('wearable') is not a known key so it yields undefined while sm/lg sta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('0') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('1') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('2') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('3') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('-1') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sm\t') is not a known key so it yields undefined while sm/lg stay in… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('md\n') is not a known key so it yields undefined while sm/lg stay in… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lg ') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('SMALL') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('Medium') is not a known key so it yields undefined while sm/lg stay … | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('LARGE') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sm-') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('_md') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lg_lg') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('smsm') is not a known key so it yields undefined while sm/lg stay in… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('mdmd') is not a known key so it yields undefined while sm/lg stay in… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lglg') is not a known key so it yields undefined while sm/lg stay in… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue(' sm') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('md ') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sM') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('mD') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lG') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('zz') is not a known key so it yields undefined while sm/lg stay inta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('2.5') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('NaN') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('Infinity') is not a known key so it yields undefined while sm/lg sta… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('0x1') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sm/md') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('md-lg') is not a known key so it yields undefined while sm/lg stay i… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('a') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('z') is not a known key so it yields undefined while sm/lg stay intac… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('mdmdmd') is not a known key so it yields undefined while sm/lg stay … | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('sm:') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('lg;') is not a known key so it yields undefined while sm/lg stay int… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| GetValue('bad_key_59') is not a known key so it yields undefined while sm/lg s… | - | 调用 r；ok1；ok2 | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |

## MultiColumnsModelVol01 套件（`ModelVol01.test.ets`，75 条，`MDL`）：Model data types (MailType/photoType/OperateTabs) frozen instanc…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: MailType stores zero num and low resource ids verbatim | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 101, num 4, src id 501) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 102, num 7, src id 502) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 103, num 10, src id 503) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 104, num 13, src id 504) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 105, num 16, src id 505) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 106, num 19, src id 506) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 107, num 22, src id 507) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 108, num 25, src id 508) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 109, num 28, src id 509) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 110, num 31, src id 510) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 111, num 34, src id 511) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 112, num 37, src id 512) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 113, num 40, src id 513) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 114, num 43, src id 514) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 115, num 46, src id 515) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 116, num 49, src id 516) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 117, num 52, src id 517) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 118, num 55, src id 518) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 119, num 58, src id 519) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 120, num 61, src id 520) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 121, num 64, src id 521) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 122, num 67, src id 522) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 123, num 70, src id 523) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 124, num 73, src id 524) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 125, num 76, src id 525) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 126, num 79, src id 526) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 127, num 82, src id 527) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 128, num 85, src id 528) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 129, num 88, src id 529) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 130, num 91, src id 530) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 131, num 94, src id 531) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 132, num 97, src id 532) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 133, num 100, src id 533) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 134, num 103, src id 534) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 135, num 106, src id 535) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 136, num 109, src id 536) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 137, num 112, src id 537) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 138, num 115, src id 538) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 139, num 118, src id 539) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 140, num 121, src id 540) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 141, num 124, src id 541) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 142, num 127, src id 542) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 143, num 130, src id 543) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 144, num 133, src id 544) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 145, num 136, src id 545) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 146, num 139, src id 546) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 147, num 142, src id 547) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 148, num 145, src id 548) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 149, num 148, src id 549) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 150, num 151, src id 550) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 151, num 154, src id 551) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 152, num 157, src id 552) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 153, num 160, src id 553) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 154, num 163, src id 554) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 155, num 166, src id 555) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 156, num 169, src id 556) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 157, num 172, src id 557) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 158, num 175, src id 558) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| MailType(type id 159, num 178, src id 559) keeps all three fields | - | 调用 m.num；m.type.id；m.src.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 260, count 302, src id 760) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 261, count 307, src id 761) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 262, count 312, src id 762) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 263, count 317, src id 763) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 264, count 322, src id 764) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 265, count 327, src id 765) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 266, count 332, src id 766) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 267, count 337, src id 767) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 268, count 342, src id 768) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 269, count 347, src id 769) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 270, count 352, src id 770) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 271, count 357, src id 771) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 272, count 362, src id 772) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 273, count 367, src id 773) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 274, count 372, src id 774) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsModelVol02 套件（`ModelVol02.test.ets`，75 条，`MDL`）：Model data types (MailType/photoType/OperateTabs) frozen instanc…。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| photoType(name id 275, count 377, src id 775) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 276, count 382, src id 776) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 277, count 387, src id 777) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 278, count 392, src id 778) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 279, count 397, src id 779) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 280, count 402, src id 780) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 281, count 407, src id 781) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 282, count 412, src id 782) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 283, count 417, src id 783) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 284, count 422, src id 784) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 285, count 427, src id 785) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 286, count 432, src id 786) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 287, count 437, src id 787) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 288, count 442, src id 788) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 289, count 447, src id 789) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 290, count 452, src id 790) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 291, count 457, src id 791) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 292, count 462, src id 792) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 293, count 467, src id 793) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 294, count 472, src id 794) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 295, count 477, src id 795) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 296, count 482, src id 796) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 297, count 487, src id 797) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 298, count 492, src id 798) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 299, count 497, src id 799) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 300, count 502, src id 800) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 301, count 507, src id 801) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 302, count 512, src id 802) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 303, count 517, src id 803) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 304, count 522, src id 804) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 305, count 527, src id 805) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 306, count 532, src id 806) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 307, count 537, src id 807) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 308, count 542, src id 808) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType(name id 309, count 547, src id 809) keeps provided src | - | 调用 p.count；p.name.id；(p.src as Resource).id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (410/227) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (411/229) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (412/231) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (413/233) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (414/235) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (415/237) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (416/239) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (417/241) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (418/243) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (419/245) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (420/247) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (421/249) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (422/251) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (423/253) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (424/255) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (425/257) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (426/259) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (427/261) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (428/263) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| photoType omitted src stays undefined while name/count stored (429/265) | - | 调用 p.count；p.name.id；p.src | 3 项断言（assertEqual×2、assertUndefined×1）全部成立 | 是 | 通过 |
| OperateTabs(src id 530, name id 1030) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 531, name id 1031) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 532, name id 1032) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 533, name id 1033) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 534, name id 1034) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 535, name id 1035) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 536, name id 1036) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 537, name id 1037) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 538, name id 1038) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 539, name id 1039) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 540, name id 1040) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 541, name id 1041) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 542, name id 1042) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 543, name id 1043) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 544, name id 1044) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 545, name id 1045) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 546, name id 1046) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 547, name id 1047) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 548, name id 1048) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| OperateTabs(src id 549, name id 1049) stores both resource references | - | 调用 o.src.id；o.name.id；o.src.id + o.name.id | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |

## MultiColumnsBpEdgeReal 套件（`BpEdgeReal.test.ets`，24 条，`BPE`）：手写边界真实用例（含 Anchor），覆盖布尔/极值/非法键域。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: 布尔三元组 (false,false,false) 三键均返回 false | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: 布尔三元组 (true,false,true) 仅 md 返回 false | - | 调用 sut.GetValue('sm') === true；sut.GetValue('md') === false；sut.GetValue('lg') === true | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 布尔三元组 (false,true,false) 仅 md 返回 true | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertFalse×2、assertTrue×1）全部成立 | 是 | 通过 |
| 布尔三元组 (true,true,false) 仅 lg 返回 false | - | 调用 b1.GetValue('sm')；b1.GetValue('md')；b1.GetValue('lg') | 3 项断言（assertTrue×2、assertFalse×1）全部成立 | 是 | 通过 |
| 数值退化三元组 sm==md==lg 三键返回同一值 | - | 调用 a；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: 正负零三元组 sm=0 md=-0，GetValue 不改变数值语义 | - | 调用 smVal；lgVal；smVal === lgVal | 3 项断言（assertEqual×2、assertFalse×1）全部成立 | 是 | 通过 |
| 数值极值三元组 sm=MAX_SAFE_INTEGER md=MIN lg=0 原样返回 | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| NaN 分支：GetValue 返回同一 NaN，用 Number.isNaN 判定 | - | 调用 Number.isNaN(v)；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertTrue×1、assertEqual×2）全部成立 | 是 | 通过 |
| Infinity 三元组 sm=+Inf md=-Inf，仅 lg 为有限值 | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；Number.isFinite(sut.GetValue('lg') as … | 3 项断言（assertEqual×2、assertTrue×1）全部成立 | 是 | 通过 |
| Anchor: 空字符串作为 sm 值仍被返回，区别于非法键的 undefined | - | 调用 empty；empty.length；sut.GetValue('md') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| columnsTemplate 风格值（含空格）按断点原样返回 | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法键大写 'SM'/'MD' 返回 undefined，合法键不受影响 | - | 调用 sut.GetValue('SM')；sut.GetValue('MD')；sut.GetValue('sm') | 3 项断言（assertUndefined×2、assertEqual×1）全部成立 | 是 | 通过 |
| 非法键 'sm '（尾随空格）返回 undefined，三合法键仍各自命中 | - | 调用 sut.GetValue('sm ') === undefined；sut.GetValue('sm')；sut.GetValue('md')；sut.GetValue('lg') | 4 项断言（assertTrue×1、assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: 合法键重复串 'smsm'/'mdmd'/'lglg' 全部返回 undefined | - | 调用 sut.GetValue('smsm') === undefined；sut.GetValue('mdmd') === undefined；sut.GetValue('lglg') === undefined；sut.GetValue('md') | 4 项断言（assertTrue×3、assertEqual×1）全部成立 | 是 | 通过 |
| 前缀不完整键 's'/'m'/'l' 均返回 undefined | - | 调用 sut.GetValue('s') === undefined；sut.GetValue('m') === undefined；sut.GetValue('l') === undefined | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| Anchor: 空键 '' 与空白键 ' ' 均不匹配，且 'sm' 键仍命中 | - | 调用 sut.GetValue('') === undefined；' '.startsWith('sm')；sut.GetValue('sm') | 3 项断言（assertTrue×1、assertFalse×1、assertEqual×1）全部成立 | 是 | 通过 |
| 数值型/浮点键 '1'/'0' 非法，但 'sm' 合法证明未串扰 | - | 调用 sut.GetValue('1') === undefined；sut.GetValue('0') === undefined；sut.GetValue('sm') === undefined | 3 项断言（assertTrue×2、assertFalse×1）全部成立 | 是 | 通过 |
| 设备名键 'phone'/'tablet' 非法且互等（同 undefined），sm 合法 | - | 调用 bad === undefined；bad === sut.GetValue('tablet')；sut.GetValue('sm') | 3 项断言（assertTrue×2、assertEqual×1）全部成立 | 是 | 通过 |
| 泛型数组引用类型：GetValue 返回同一引用（identity 保持） | - | 调用 sut.GetValue('sm')；sut.GetValue('md')；(sut.GetValue('lg') as Array<number>).… | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: 命中/未命中混用时 undefined 与合法值互不等 | - | 调用 sut.GetValue('xx') === undefined；sut.GetValue('md')；sut.GetValue('md') === sut.GetValue('x… | 3 项断言（assertTrue×1、assertEqual×1、assertFalse×1）全部成立 | 是 | 通过 |
| 单键多次调用返回稳定同值（无状态副作用） | - | 调用 first；first；sut.GetValue('sm') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 对象引用三元组按键返回对应实例的字段值 | - | 调用 (sut.GetValue('sm') as EdgeBox).v；(sut.GetValue('md') as EdgeBox).v；(sut.GetValue('lg') as EdgeBox).v | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: 三键全命中求和，验证 GetValue 覆盖全部字段 | - | 调用 sum；sut.GetValue('md')；sut.GetValue('lg') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 近似键 'smx'/'mdm'/'lgl'（合法键+后缀）均返回 undefined | - | 调用 miss；sut.GetValue('lgx') === undefined；sut.GetValue('md') | 3 项断言（assertEqual×2、assertTrue×1）全部成立 | 是 | 通过 |

## MultiColumnsNavStackTest 套件（`NavStackCore.test.ets`，36 条，`NAV`）：NavPathStack 路由栈同步操作真实用例（push/pop/查询/替换/删除/清空）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| smoke：新建路由栈为空（size 0、无路径名、任意名索引为空） | - | 调用 st.size()；st.getAllPathName().length；st.getIndexByName('none').length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| smoke：pushPath 单入栈后 size 与路径名序列一致 | - | 调用 st.size()；st.getAllPathName()[0]；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：getIndexByName 命中唯一路径返回其索引 [0] | - | 调用 idx.length；idx[0]；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：pushPathByName 携带 number 参数可原样回读 | - | 调用 st.getParamByName('two').length；st.getParamByName('two')[0] as number；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：多页入栈保持插入顺序且参数按索引可读 | - | 调用 st.getAllPathName().join(',')；st.size()；st.getParamByIndex(2) as number | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：pop 返回并移除栈顶元素 | - | 调用 popped?.name；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：同名多次入栈 getIndexByName 返回全部索引 | - | 调用 idx.length；idx[1]；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：getParamByIndex 命中返回 string 参数 | - | 调用 st.getParamByIndex(0) as string；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：popToName 命中栈底目标返回其索引并回退到该页 | - | 调用 st.popToName('a', false)；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：removeByName 返回被删除页面数量 | - | 调用 st.removeByName('a')；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：removeByIndexes 按索引集合删除并返回数量 | - | 调用 st.removeByIndexes([0, 2])；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：moveToTop 将首个同名页移到栈顶并返回其原索引 | - | 调用 st.moveToTop('a', false)；st.getAllPathName().join(',')；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：replacePath 用新页替换栈顶且栈大小不变 | - | 调用 st.size()；st.getAllPathName()[1]；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：clear 清空栈中所有页面 | - | 调用 st.size()；st.getAllPathName().length；st.getIndexByName('a').length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：空栈 pop 返回 undefined 且栈仍为空 | - | 调用 popped；st.size()；st.getAllPathName().length | 3 项断言（assertUndefined×1、assertEqual×2）全部成立 | 是 | 通过 |
| 边界值：空栈查询接口返回空集合且 popToName 返回 -1 | - | 调用 st.getAllPathName().length；st.size()；st.popToName('x', false) | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：空栈 clear 幂等且随后仍可正常入栈 | - | 调用 st.size()；st.getAllPathName().length；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：单元素栈 pop 后回到空栈 | - | 调用 popped?.name；st.size()；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 边界值：getParamByIndex 越界（上溢/负数）返回 undefined | - | 调用 st.getParamByIndex(5)；st.getParamByIndex(-1)；st.size() | 3 项断言（assertUndefined×2、assertEqual×1）全部成立 | 是 | 通过 |
| 边界值：popToIndex 回退到栈底索引 0 仅保留首页 | - | 调用 st.size()；st.getAllPathName()[0]；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：popToName 目标名不存在返回 -1 且不改动栈 | - | 调用 st.popToName('zzz', false)；st.size()；st.getAllPathName().join(',') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：moveToTop 目标名不存在返回 -1 且顺序不变 | - | 调用 st.moveToTop('zzz', false)；st.size()；st.getAllPathName().join(',') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：removeByName 目标名不存在返回 0 且栈不变 | - | 调用 st.removeByName('zzz')；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：getIndexByName 目标名不存在返回空数组 | - | 调用 st.getIndexByName('zzz').length；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：removeByIndexes 传入空索引数组返回 0 且栈不变 | - | 调用 st.removeByIndexes([])；st.size()；st.getAllPathName().join(',') | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 非法值：空字符串页名可入栈并作为合法键被检索 | - | 调用 st.size()；st.getAllPathName()[0]；st.getIndexByName('').length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 极值：连续入栈 50 页后大小/顺序/末位参数均正确 | - | 调用 st.size()；st.getAllPathName().length；st.getAllPathName()[49] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 极值：连续 pop 至空，首个弹出为最后入栈且最终 size 0 | - | 调用 first?.name；st.size()；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 极值：超长字符串参数可原样入栈并回读 | - | 调用 st.getParamByName('big')[0] as string；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 极值：同名页连续入栈 50 次 getIndexByName 返回全部索引 | - | 调用 st.getIndexByName('a').length；st.size()；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：pop 后重新 push 同名再 push 新页得到 [A B]（对齐文档复用说明） | - | 调用 st.getAllPathName().join(',')；st.size()；st.getAllPathName()[1] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 组合值：replace + remove + clear 交错每步快照一致 | - | 调用 st.getAllPathName().join(',')；st.removeByName('a')；st.getAllPathName().join(',')；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| 组合值：同栈内 number 与 string 两类参数各自精确回读 | - | 调用 st.getParamByName('n')[0] as number；st.getParamByName('s')[0] as string；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：完整生命周期 size 迁移 0→1→2→1→0→1 | - | 调用 st.size()；st.size()；st.size()；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| 状态：重复查询 getAllPathName 稳定且不影响栈 | - | 调用 first；second；st.size() | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| 状态：removeByName 删除同名后再 popToName 得到预期栈底 | - | 调用 st.removeByName('a')；st.popToName('b', false)；st.getAllPathName()[0]；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |

## MultiColumnsNavStackVol01 套件（`NavStackVol01.test.ets`，75 条，`NAVG`）：NavPathStack.pushN(depth)->size+topName+paramRoundTrip+pop。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: NavPathStack pop of a single entry returns that page and empties the s… | - | 调用 popped?.name；st.size()；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: NavPathStack keeps duplicate names addressable and shrinks index list … | - | 调用 st.size()；st.getIndexByName('dup').length；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |

## MultiColumnsNavStackVol02 套件（`NavStackVol02.test.ets`，65 条，`NAVG`）：NavPathStack.pushN(depth)->size+topName+paramRoundTrip+pop。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Anchor: NavPathStack pop of a single entry returns that page and empties the s… | - | 调用 popped?.name；st.size()；st.getAllPathName().length | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| Anchor: NavPathStack keeps duplicate names addressable and shrinks index list … | - | 调用 st.size()；st.getIndexByName('dup').length；st.getAllPathName()[0] | 3 项断言（assertEqual×3）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 2 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(1) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 3 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(2) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 4 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(3) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 5 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(4) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 6 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(5) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 7 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(6) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 8 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(7) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 9 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(8) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 10 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(9) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |
| NavPathStack push depth 1 keeps ordered names, param round-trip and pop | - | 调用 st.size()；last；st.getParamByIndex(0) as number；st.size() | 4 项断言（assertEqual×4）全部成立 | 是 | 通过 |

## ActsAbilityTest 套件（`Ability.test.ets`，7 条，`UI`）：拉起三应用页面并拖拽窗口，校验窗口宽度收敛（真机全屏形态自动降级为占满屏宽）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起 A+B+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 A+B+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 A+B+C 页面，拖拽窗口至 850vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 A+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 A+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 B+C 页面，拖拽窗口至 360vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |
| 拉起 B+C 页面，拖拽窗口至 600vp，窗口宽度收敛到目标值 | - | 调用 await ensureHome(driver) | 1 项断言（assertTrue×1）全部成立 | 是 | 通过 |

## MultiColumnsResponsiveUiTest 套件（`ResponsiveUi.test.ets`，15 条，`UI`）：L2 响应式 UI 交互真实用例（入口按钮/页面导航/拖窗列显隐/窗口重排）。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 合法值：首页三个响应式入口按钮 caseOne/caseTwo/caseThree 均存在 | - | 调用 one；two；three | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 合法值：入口按钮文案符合 Index.ets 规格 | - | 调用 await waitForId(driver, 'caseOne')；textOne；await btnTwo.getText()；await btnThree.getText() | 4 项断言（assertTrue×1、assertEqual×3）全部成立 | 是 | 通过 |
| 合法值：入口按钮类型为 Button | - | 调用 await waitForId(driver, 'caseOne')；typeOne；await btnTwo.getType()；await btnOne.getId() | 4 项断言（assertTrue×1、assertEqual×3）全部成立 | 是 | 通过 |
| 状态：点击 caseOne 进入 MailBox 后首页按钮消失 | - | 调用 await waitForId(driver, 'caseOne')；gone；caseTwoGone；gone === caseTwoGone | 4 项断言（assertTrue×2、assertFalse×2）全部成立 | 是 | 通过 |
| 状态：MailBox 按返回键后首页 caseOne 重现（返回被内部 Navigation 消费时会重新拉起应用校验） | - | 调用 await waitForId(driver, 'caseOne')；back；still；reFind !== null | 4 项断言（assertTrue×4）全部成立 | 是 | 通过 |
| 状态：点击 caseTwo 进入 PhotoAlbum 后首页按钮消失 | - | 调用 await waitForId(driver, 'caseTwo')；twoGone；oneGone；twoGone === oneGone | 4 项断言（assertTrue×2、assertFalse×2）全部成立 | 是 | 通过 |
| 状态：点击 caseThree 进入 Settings 后首页按钮消失 | - | 调用 await waitForId(driver, 'caseThree')；threeGone；oneGone；threeGone === oneGone | 4 项断言（assertTrue×2、assertFalse×2）全部成立 | 是 | 通过 |
| 合法值：应用主窗口可按 bundleName 定位 | - | 调用 win !== null；width > 0；height > 0 | 3 项断言（assertTrue×3）全部成立 | 是 | 通过 |
| 状态：窗口变窄触发响应式重排后应用仍存活可返回首页 | - | 调用 after < before；screenWidth > 0；after === screenWidth；after > 0；homeOk | 5 项断言（assertTrue×5）全部成立 | 是 | 通过 |
| 状态：窗口变宽触发响应式重排后应用仍存活 | - | 调用 wide > narrow；screenWidth > 0；wide === screenWidth；wide > 0；await waitForId(driver, 'caseTwo') | 5 项断言（assertTrue×5）全部成立 | 是 | 通过 |
| 组合值：caseOne→返回首页后 caseTwo 再次导航，页面切换与入口状态正常 | - | 调用 await waitForId(driver, 'caseOne')；await waitForId(driver, 'caseOne', 200…；twoGone；oneGone | 4 项断言（assertTrue×2、assertFalse×2）全部成立 | 是 | 通过 |
| 边界值：caseOne 可点击且响应后发生页面切换 | - | 调用 await waitForId(driver, 'caseOne')；clickable；beforeGone；afterGone | 4 项断言（assertTrue×3、assertFalse×1）全部成立 | 是 | 通过 |
| 合法值：按 id 精确匹配定位到唯一入口按钮 | - | 调用 await waitForId(driver, 'caseOne')；idText；text；comp !== null | 4 项断言（assertTrue×2、assertEqual×2）全部成立 | 是 | 通过 |
| 状态：复位后三个入口按钮重新全部存在（用例间零依赖） | - | 调用 await waitForId(driver, 'caseThree')；one；two；three | 4 项断言（assertTrue×4）全部成立 | 是 | 通过 |
| 极值：拖窗至较小宽度后首页仍可交互，不崩溃 | - | 调用 after > 0；after <= before；screenWidth > 0；after === screenWidth；win !== null | 5 项断言（assertTrue×5）全部成立 | 是 | 通过 |

## 运行与验证

构建（工程根目录执行，仅编译测试 HAP 与其依赖的 main 代码；`<SDK 根目录>` 与 `<DevEco>` 为占位符，分别替换为本机 SDK 根目录与 DevEco Studio 安装目录）：

```powershell
$env:DEVECO_SDK_HOME = '<SDK 根目录>'
"<DevEco>\tools\node\node.exe" "<DevEco>\tools\hvigor\bin\hvigorw.js" --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

工程同时保留 `hvigorw` / `hvigorw.bat` / `hvigor/hvigor-wrapper.js`，便于 IDE 与 CI 直接调用。

产物：`entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap`

安装与执行（真机需用户授权；不传 `-s class` 即执行 `List.test.ets` 注册的全部 19 个套件）：

```powershell
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

套件执行顺序：L1 逻辑套件先跑，L2 UI 套件最后跑（`List.test.ets` 注册顺序），避免 UI 交互与纯逻辑相互干扰。单轮用例耗时长，`-s timeout` 建议不小于 20000 毫秒（L2 UI 用例含轮询等待与进程重启，单用例实测最坏约 8 秒，留足余量）。

## 用例编号规范

每条用例的 `@tc.number` 形如 `SUB_MC_<主题>_<4位序号>`（BP/BPG/BPI/BPE/MODEL/MDL/NAV/NAVG/UI 主题，4 位序号全局唯一、同主题连续；UI 主题为 `SUB_MC_UI_0001`～`SUB_MC_UI_0022`，其中 0001～0015 在 `ResponsiveUi.test.ets`、0016～0022 在 `Ability.test.ets`）；`@tc.name` 与 `it()` 名称逐字一致（如 `testBpNumVol0001`），两者一一对应。`@tc.type` 统一为 `FUNCTION`，`@tc.size` 取 `SMALLTEST`/`MEDIUMTEST`，`@tc.level` 取 `LEVEL0`/`LEVEL1`/`LEVEL2`，与 it() 签名中的 `Size.*`/`Level.*` 一致。每条 `expect` 断言前均有一行 `hilog` 打印实际值与期望值。

## 测试结果

执行环境：OpenHarmony-7.1.0.21（API 26），设备类型 `default`，2026-11-19，`com.samples.multicolumns` + `entry_test` + `OpenHarmonyTestRunner`。

| 项目 | 数值 |
|---|---|
| 测试套件 | 19 |
| 用例总数 | 986 |
| 通过 | 986 |
| 失败 | 0 |
| 错误 | 0 |

> 原始结果行：`OHOS_REPORT_RESULT: stream=Tests run: 986, Failure: 0, Error: 0, Pass: 986, Ignore: 0`，`TestFinished-ResultCode: 0`，taskconsuming=76816ms（约 77 秒）。19 个套件即在 `List.test.ets` 中 import 并在 `testsuite()` 内调用的全部套件，每套件用例数与 `OHOS_REPORT_SUM` 之和为 986，与上表逐条用例行数一致。

> 本轮回归前修复了两类用例缺陷：其一，`NavStackCore.test.ets` 中部分用例在 `hilog` 日志行与 `expect` 断言行各调用一次有副作用的方法（`removeByName`/`removeByIndexes`/`moveToTop`/`popToName`），第二次调用时栈状态已改变，导致 5 条用例（testNavStack3010/3011/3012/3032/3036）失败；现统一把副作用调用提取为局部变量，日志与断言共用同一结果值。其二，`ResponsiveUi.test.ets` 的 `backToHome()` 改为返回首页是否就绪，重启进程后延长退出间隔，`testUi0011` 在未就绪时补一次拉起，避免把冷启动时序误判为页面逻辑失败。修复后单套件验证：NavStack 36/36、ResponsiveUi 15/15，再全量 986/986 通过。

> 本次修订仅补充每条断言前的 `hilog` 参数日志、统一 `@tc` 元数据大小写、将 UI 主题编号改为连续 4 位序号、去掉生成脚本痕迹，未改动任何断言的被测对象与期望值，上述真机结果仍然有效。修订后测试 HAP 已重新构建通过（`BUILD SUCCESSFUL`）。

## 六维覆盖

| 主题 | 合法 | 边界 | 非法 | 极值 | 组合 | 状态 |
|---|---|---|---|---|---|---|
| BreakpointType.GetValue（真实） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| BreakpointType.GetValue（number/string/Resource/array 泛型凑量） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| GetValue 非法键域（近似/大小写/空格/数值/设备名） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| DataType(OperateTabs/MailType/photoType 含可选 src) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| NavPathStack 路由栈（真实，push/pop/query/replace/remove/clear） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| NavPathStack 路由栈（depth 凑量，size/名字/参数回读） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| 响应式 UI（导航/拖窗/列显隐） | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

## 已知问题与测试约束

L2 UI 用例在手机形态（720×1280，全屏窗口，decor=false）实机执行时存在以下约束，用例已按「能力探测 + 降级断言」处理，保证在手机与 2in1/自由窗口两种形态下都能执行：

| 约束 | 现象 | 用例处理 |
|---|---|---|
| 全屏窗口不可调整尺寸 | `Window.resize()` 抛 `Fullscreen window can not resize`（code 17000005） | 捕获后记录 `resizable=false`，降级为校验「窗口宽度 == 屏幕宽度」（`driver.getDisplaySize()`）；自由窗口下仍执行原「宽度收敛到目标 ±60px」断言 |
| MailBox 内部 Navigation 拦截返回键 | 首次 `pressBack` 被 Navigation 消费，再次按返回会退出应用，且 router 栈仍停留在子页面（重新拉起仍停在 MailBox） | `backToHome()` 返回是否已回到首页：短探测（1.2s）回首页则直接返回 true，未回则「拉起→terminateSelf→再拉起」重启进程清空路由栈，再次等待首页（3s）；调用方在 false 时可再拉起补等，避免冷启动时序被误判为页面逻辑失败 |
| NavPathStack 有副作用的接口只能调用一次 | `removeByName`/`removeByIndexes`/`moveToTop`/`popToName`/`pop`/`clear` 会改变栈状态，若在 `hilog` 日志行与 `expect` 断言行各调用一次，第二次拿到的是已变更后的结果，断言与日志互相污染 | 先调用一次并存入局部变量，日志与断言共用该变量（如 `const removed = st.removeByName('a');`），查询类无副作用接口（`size`/`getAllPathName`/`getParamByIndex`/`getIndexByName`）可重复调用 |
| 单用例超时 | 用例超时后仍在调用 UiTest API，会与后续用例冲突并报 `uitest-api dose not allow calling concurrently`；`-s timeout` 取 15000 时含进程重启的 UI 用例有超时风险 | 所有等待改为轮询 + 短超时预算，单用例实测最坏约 8s，`-s timeout` 取 20000 留足余量 |
| 测试 Ability 与被测应用同 bundle | 直接对「当前顶部 Ability」调用 `terminateSelf` 会误杀测试进程（`App died`） | `terminateApp/terminateAbility` 仅在 `bundleName + abilityName === EntryAbility` 时才终止 |

> 另：异常中断后再次运行出现 `Can not connect to AAMS, REGISTER_LISTENER_FAILED` / `RET_ERR_CONNECTION_EXIST`，说明残留了 uitest 服务进程：`hdc shell ps -ef | grep uitest` 查 pid 后 `hdc shell "kill -9 <pid>"` 即可恢复，无需重启设备。
