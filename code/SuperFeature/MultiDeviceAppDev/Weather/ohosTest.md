# Weather 测试用例归档

共 **60 个套件 / 2445 条用例**，全部为 Hypium 自动化用例，源码位于 `product/default/src/ohosTest/ets/test/`（60 个套件文件合计 49,859 行，另有只做注册的 `List.test.ets` 141 行）。

用例分三层覆盖：

| 层 | 用例数 | 套件构成 |
|---|---|---|
| L1 真实行为（手写） | 289 | AbilityTest 7 + CanvasReal01 18 + CanvasReal02 17 + CityReal01 22 + DsReal01 20 + DsReal02 20 + FdateReal01 20 + FdateReal02 20 + LoggerReal01 12 + MockReal01 30 + ModelReal01 32 + ReqReal01 28 + ReqReal02 27 + StyleReal01 16 |
| L1 规格回归（批量覆盖） | 2128 | 41 个套件，按域：CANVAS 107 / CITY 152 / DS 147 / FDATE 887 / MOCK 205 / MODEL 200 / REQ 390 / STYLE 40 |
| L2 UI 探针（`@kit.TestKit` + `UiTestHelper`） | 28 | UiAddCity0001 5 + UiCityList0001 5 + UiHome0001 6 + UiTitleBar0001 6 + UiWindow0001 6 |

`@tc.size` 分布：MEDIUMTEST 2156 / SMALLTEST 289；`@tc.level` 分布：LEVEL1 922 / LEVEL2 1480 / LEVEL3 43。

全部用例共 7,657 条断言（`expect(...)` 与 `driver.assert*` 合并计数），单条用例最少 3 条。

## 用例文件与规模

| 套件文件 | 域名 | 用例数 | 行数 | `@tc.size` |
|---|---|---|---|---|
| `Ability.test.ets` | ABILITY | 7 | 238 | SMALLTEST 7 |
| `CanvasReal01.test.ets` | CANVAS | 18 | 370 | SMALLTEST 18 |
| `CanvasReal02.test.ets` | CANVAS | 17 | 364 | SMALLTEST 17 |
| `CityReal01.test.ets` | CITY | 22 | 445 | SMALLTEST 22 |
| `DsReal01.test.ets` | DS | 20 | 433 | SMALLTEST 20 |
| `DsReal02.test.ets` | DS | 20 | 460 | SMALLTEST 20 |
| `FdateReal01.test.ets` | FDATE | 20 | 387 | SMALLTEST 20 |
| `FdateReal02.test.ets` | FDATE | 20 | 391 | SMALLTEST 20 |
| `LoggerReal01.test.ets` | LOGGER | 12 | 234 | SMALLTEST 12 |
| `MockReal01.test.ets` | MOCK | 30 | 582 | SMALLTEST 30 |
| `ModelReal01.test.ets` | MODEL | 32 | 611 | SMALLTEST 32 |
| `ReqReal01.test.ets` | REQ | 28 | 531 | SMALLTEST 28 |
| `ReqReal02.test.ets` | REQ | 27 | 523 | SMALLTEST 27 |
| `StyleReal01.test.ets` | STYLE | 16 | 279 | SMALLTEST 16 |
| `CanvasMoon0001.test.ets` | CANVAS | 21 | 467 | MEDIUMTEST 21 |
| `CanvasRound0001.test.ets` | CANVAS | 65 | 1,326 | MEDIUMTEST 65 |
| `CanvasSun0001.test.ets` | CANVAS | 21 | 467 | MEDIUMTEST 21 |
| `CityAdd0001.test.ets` | CITY | 20 | 506 | MEDIUMTEST 20 |
| `CityList0001.test.ets` | CITY | 66 | 1,280 | MEDIUMTEST 66 |
| `CityRaw0001.test.ets` | CITY | 66 | 1,280 | MEDIUMTEST 66 |
| `DsLoop0001.test.ets` | DS | 1 | 46 | MEDIUMTEST 1 |
| `DsSnap0001.test.ets` | DS | 85 | 1,641 | MEDIUMTEST 85 |
| `DsSnap0002.test.ets` | DS | 61 | 1,185 | MEDIUMTEST 61 |
| `FdateFill0001.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateFill0002.test.ets` | FDATE | 36 | 746 | MEDIUMTEST 36 |
| `FdateMday0001.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0002.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0003.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0004.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0005.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0006.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0007.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0008.test.ets` | FDATE | 85 | 1,726 | MEDIUMTEST 85 |
| `FdateMday0009.test.ets` | FDATE | 50 | 1,026 | MEDIUMTEST 50 |
| `FdateSlot0001.test.ets` | FDATE | 36 | 746 | MEDIUMTEST 36 |
| `MockAqi0001.test.ets` | MOCK | 5 | 126 | MEDIUMTEST 5 |
| `MockDay0001.test.ets` | MOCK | 35 | 726 | MEDIUMTEST 35 |
| `MockHour0001.test.ets` | MOCK | 85 | 1,641 | MEDIUMTEST 85 |
| `MockHour0002.test.ets` | MOCK | 35 | 691 | MEDIUMTEST 35 |
| `MockIndex0001.test.ets` | MOCK | 40 | 786 | MEDIUMTEST 40 |
| `MockTop0001.test.ets` | MOCK | 5 | 121 | MEDIUMTEST 5 |
| `ModelSnap0001.test.ets` | MODEL | 85 | 1,643 | MEDIUMTEST 85 |
| `ModelSnap0002.test.ets` | MODEL | 85 | 1,643 | MEDIUMTEST 85 |
| `ModelSnap0003.test.ets` | MODEL | 30 | 596 | MEDIUMTEST 30 |
| `ReqAir0001.test.ets` | REQ | 30 | 611 | MEDIUMTEST 30 |
| `ReqBg0001.test.ets` | REQ | 60 | 1,181 | MEDIUMTEST 60 |
| `ReqHeader0001.test.ets` | REQ | 40 | 801 | MEDIUMTEST 40 |
| `ReqHours0001.test.ets` | REQ | 75 | 1,766 | MEDIUMTEST 75 |
| `ReqHours0002.test.ets` | REQ | 50 | 1,191 | MEDIUMTEST 50 |
| `ReqLife0001.test.ets` | REQ | 40 | 801 | MEDIUMTEST 40 |
| `ReqSide0001.test.ets` | REQ | 60 | 1,181 | MEDIUMTEST 60 |
| `ReqWeek0001.test.ets` | REQ | 35 | 776 | MEDIUMTEST 35 |
| `StyleCat0001.test.ets` | STYLE | 16 | 330 | MEDIUMTEST 16 |
| `StyleRel0001.test.ets` | STYLE | 8 | 178 | MEDIUMTEST 8 |
| `StyleVal0001.test.ets` | STYLE | 16 | 330 | MEDIUMTEST 16 |
| `UiAddCity0001.test.ets` | UI | 5 | 113 | MEDIUMTEST 5 |
| `UiCityList0001.test.ets` | UI | 5 | 120 | MEDIUMTEST 5 |
| `UiHome0001.test.ets` | UI | 6 | 137 | MEDIUMTEST 6 |
| `UiTitleBar0001.test.ets` | UI | 6 | 134 | MEDIUMTEST 6 |
| `UiWindow0001.test.ets` | UI | 6 | 138 | MEDIUMTEST 6 |
| **合计** | - | **2445** | **49,859** | - |

> 基础层套件预置条件统一为「已安装测试 HAP，`@ohos/common` 可导入」；页面层与 UI 探针套件统一为「已安装测试 HAP，应用已启动并停在首页」，UI 探针另需设备已解锁且无系统弹窗（AAMS 连接）。下表只写与单个用例相关的额外前置。
>
> 手写与 UI 探针套件一例一行；规格回归套件按 `@tc.desc` 主题分组，一行覆盖一组连续用例，组内条数与该套件用例数、上表逐行可核。

## 用例号段

`@tc.number` 形如 `SUB_WEATHER_<域>_NNNN`，同一域内连续唯一、不跨主题重号。

| 域 | 号段 | 用例数 | 对应套件 |
|---|---|---|---|
| ABILITY | 0001..0007 | 7 | AbilityTest |
| CANVAS | 0001..0142 | 142 | CanvasMoon0001、CanvasReal01、CanvasReal02、CanvasRound0001… |
| CITY | 0001..0174 | 174 | CityAdd0001、CityList0001、CityRaw0001、CityReal01 |
| DS | 0001..0187 | 187 | DsLoop0001、DsReal01、DsReal02、DsSnap0001… |
| FDATE | 0001..0927 | 927 | FdateFill0001、FdateFill0002、FdateMday0001、FdateMday0002… |
| LOGGER | 0001..0012 | 12 | LoggerReal01 |
| MOCK | 0001..0235 | 235 | MockAqi0001、MockDay0001、MockHour0001、MockHour0002… |
| MODEL | 0001..0232 | 232 | ModelReal01、ModelSnap0001、ModelSnap0002、ModelSnap0003 |
| REQ | 0001..0445 | 445 | ReqAir0001、ReqBg0001、ReqHeader0001、ReqHours0001… |
| STYLE | 0001..0056 | 56 | StyleCat0001、StyleReal01、StyleRel0001、StyleVal0001 |
| UI | 9001..9028 | 28 | UiAddCity0001、UiCityList0001、UiHome0001、UiTitleBar0001… |

## AbilityTest 套件（`Ability.test.ets`，7 条）

端到端冒烟：经 `abilityDelegatorRegistry` 拉起 `MainAbility`，校验标题与菜单入口，并在 LG 断点下验证侧边栏显隐、侧边栏点击切城市与首页左右滑动切城市。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Launch the application and check that MainAbility stays on top | - | abilityDelegatorRegistry.getAbilityDelegator() | info.name = 'MainAbility'；info.bundleName = 'ohos.samples.weather' 等 3 条 | 是 | 通过 |
| Hide and show the sidebar container in large breakpoint | - | driver.assertComponentExist(ON.id('cancelSubarea')) | driver.assertComponentExist(ON.id('cancelSubarea'))；driver.assertComponentExist(ON.id('iconSubarea')) 等 3 条 | 是 | 通过 |
| Switch the current city by clicking the sidebar city item | - | driver.assertComponentExist(ON.id('sliderCity1')) | driver.assertComponentExist(ON.id('sliderCity1'))；driver.assertComponentExist(ON.id('homeContent1')) 等 6 条 | 是 | 通过 |
| Switch the current city by swiping the home content | - | driver.assertComponentExist(ON.id('homeContent0')) | driver.assertComponentExist(ON.id('homeContent0'))；driver.assertComponentExist(ON.id('homeContent1')) 等 3 条 | 是 | 通过 |
| Open the update interval dialog and cancel it | - | abilityDelegatorRegistry.getAbilityDelegator() | driver.assertComponentExist(ON.id('menuPopup'))；driver.assertComponentExist(ON.id('menu1')) 等 3 条 | 是 | 通过 |
| Enter the city management page from the home menu | - | abilityDelegatorRegistry.getAbilityDelegator() | driver.assertComponentExist(ON.id('menuPopup'))；driver.assertComponentExist(ON.id('menu0')) 等 4 条 | 是 | 通过 |
| Add a city from the hot city list and return to the home page | - | abilityDelegatorRegistry.getAbilityDelegator() | driver.assertComponentExist(ON.id('addCity'))；driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.wu_han')), MatchPattern.CONTAINS)) 等 3 条 | 是 | 通过 |

## CanvasReal01 套件（`CanvasReal01.test.ets`，18 条）

空气质量曲线：`initRound` 绘制两段圆弧、一条线性渐变与四处文字标签，覆盖空气等级文案为空、非法 AQI 字符串与超界 AQI。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Gauge paints exactly two arcs and one linear gradient | - | new CanvasStubContext() | ctx.count('arc') = 2；ctx.count('createLinearGradient') = 1 等 3 条 | 是 | 通过 |
| Background arc spans the frozen bottom opening angles | - | new CanvasStubContext() | String(args[0]) = '150'；String(args[3]) = '0.9424777960769379' 等 3 条 | 是 | 通过 |
| Gauge radius derives from canvas width minus ten | - | new CanvasStubContext() | snap.startsWith('140\|') 为真；ctx.count('arc') = 2 等 3 条 | 是 | 通过 |
| Value 28 sweeps the gauge to the frozen end angle | - | new CanvasStubContext() | snap = '140\|3.330088212805181\|优,28,0,500'；snap.includes('3.330088212805181') 为真 等 3 条 | 是 | 通过 |
| Value 0 keeps the gauge at the half-turn baseline | - | new CanvasStubContext() | snap = '140\|1.5707963267948966\|优,0,0,500'；snap.includes('1.5707963267948966') 为真 等 3 条 | 是 | 通过 |
| value 500 overshoots ten turns on the sweep angle | - | new CanvasStubContext() | snap = '140\|32.98672286269283\|严重污染,500,0,500'；snap.includes('32.98672286269283') 为真 等 3 条 | 是 | 通过 |
| Mid scale value 250 lands on the frozen angle | - | new CanvasStubContext() | snap.startsWith('140\|17.27875959474386') 为真；snap.includes('重度污染,250') 为真 等 3 条 | 是 | 通过 |
| Value 99 sweeps the frozen near-double-turn angle | - | new CanvasStubContext() | snap = '140\|7.791149780902687\|良,99,0,500'；snap.includes('良,99') 为真 等 3 条 | 是 | 通过 |
| Fractional value 0.5 adds a twentieth of a turn | - | new CanvasStubContext() | snap = '140\|1.6022122533307945\|优,0.5,0,500'；snap.includes('1.6022122533307945') 为真 等 3 条 | 是 | 通过 |
| non numeric quality produces a NaN end angle | - | new CanvasStubContext() | snap.includes('\|NaN\|') 为真；snap.startsWith('140\|') 为真 等 3 条 | 是 | 通过 |
| dash placeholder quality also collapses to NaN | - | new CanvasStubContext() | snap.includes('NaN') 为真；snap.endsWith('-,-,0,500') 为真 等 3 条 | 是 | 通过 |
| Negative value drags the sweep angle below zero | - | new CanvasStubContext() | snap = '140\|-0.18849555921538774\|优,-28,0,500'；snap.includes('-0.18849555921538774') 为真 等 3 条 | 是 | 通过 |
| Scale boundary 100 doubles the sweep past the baseline | - | new CanvasStubContext() | snap = '140\|7.853981633974483\|良,100,0,500'；snap.includes('7.853981633974483') 为真 等 3 条 | 是 | 通过 |
| Scale labels 0 and 500 are drawn at frozen coordinates | - | new CanvasStubContext() | String(zeroArgs[0]) = '0'；String(zeroArgs[1]) = '120' 等 3 条 | 是 | 通过 |
| Center texts sit on the frozen vertical offsets | - | new CanvasStubContext() | String(descArgs[2]) = '80'；String(valueArgs[2]) = '105' 等 3 条 | 是 | 通过 |
| Empty description still renders an empty center label | - | new CanvasStubContext() | snap.endsWith('\|,28,0,500') 为真；ctx.texts()[0] = '' 等 3 条 | 是 | 通过 |
| Save restore and path calls keep the paired drawing blocks | - | new CanvasStubContext() | ctx.count('save') = 2；ctx.count('restore') = 2 等 4 条 | 是 | 通过 |
| Gradient stops carry the frozen palette trio | - | new CanvasStubContext() | stops.length = 3；stops[0] = '0\|#AED34A' 等 4 条 | 是 | 通过 |

## CanvasReal02 套件（`CanvasReal02.test.ets`，17 条）

日出日落曲线：`initSun` / `initMoon` 的时间轴、太阳圆弧、月亮圆弧与日落标签落点。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Sun chart baseline sits fifty-four pixels above the bottom | - | new CanvasStubContext() | snap.startsWith('146\|300\|120\|') 为真；ctx.count('moveTo') = 1 等 3 条 | 是 | 通过 |
| Sun chart draws the frozen rise and set captions | - | new CanvasStubContext() | snap.endsWith('日出 早上6:00,日落 傍晚5:32') 为真；ctx.texts()[0] = '日出 早上6:00' 等 4 条 | 是 | 通过 |
| Sun arc uses forty percent of the canvas width as radius | - | new CanvasStubContext() | String(args[2]) = '120'；String(args[0]) = '150' 等 3 条 | 是 | 通过 |
| Sun arc angles follow the frozen 193 and 346 degree endpoints | - | new CanvasStubContext() | String(args[3]) = '3.368485456349056'；String(args[4]) = '6.03883921190038' 等 3 条 | 是 | 通过 |
| Sun path is stroked with a dashed eight pixel pattern | - | new CanvasStubContext() | ctx.count('setLineDash') = 2；String(dashArgs[0]) = '8' 等 3 条 | 是 | 通过 |
| Doubling canvas width doubles the sun arc radius | - | new CanvasStubContext() | snap.startsWith('146\|600\|240\|') 为真；snap.includes('\|240\|') 为真 等 3 条 | 是 | 通过 |
| Short canvas moves the baseline up by the frozen offset | - | new CanvasStubContext() | snap.startsWith('46\|300\|') 为真；snap.includes('120') 为真 等 3 条 | 是 | 通过 |
| Gradient in sun chart spans the whole canvas box | - | new CanvasStubContext() | String(args[0]) = '0'；String(args[2]) = '300' 等 3 条 | 是 | 通过 |
| Sun captions are painted near the chart bottom | - | new CanvasStubContext() | String(firstArgs[1]) = '50'；String(secondArgs[1]) = '250' 等 3 条 | 是 | 通过 |
| Save restore pair wraps the sun arc stroke block | - | new CanvasStubContext() | ctx.count('save') >= 1 为真；ctx.count('restore') >= 1 为真 等 4 条 | 是 | 通过 |
| Moon chart arc radius is thirty percent of canvas width | - | new CanvasStubContext() | snap.startsWith('90\|') 为真；ctx.count('arc') = 1 等 3 条 | 是 | 通过 |
| Moon chart paints the frozen three captions | - | new CanvasStubContext() | snap = '90\|月出 傍晚5:12,上弦月,月落 早上6:20'；ctx.texts().length = 3 等 3 条 | 是 | 通过 |
| Moon arc follows the frozen 197 and 342 degree geometry | - | new CanvasStubContext() | String(args[3]) = '3.4382986264288293'；String(args[4]) = '5.969026041820607' 等 3 条 | 是 | 通过 |
| Moon icon is drawn once at the top of the chart | - | new CanvasStubContext() | ctx.count('drawImage') >= 1 为真；String(args[5]) = '145' 等 4 条 | 是 | 通过 |
| Doubling canvas width scales the moon arc radius | - | new CanvasStubContext() | snap.startsWith('180\|') 为真；snap.includes('月出 傍晚5:12') 为真 等 3 条 | 是 | 通过 |
| Moon captions share one baseline twenty pixels from bottom | - | new CanvasStubContext() | String(argsA[2]) = '180'；String(argsB[2]) = '180' 等 3 条 | 是 | 通过 |
| Moon chart opens and closes one gradient pass | - | new CanvasStubContext() | ctx.count('createLinearGradient') = 1；String(args[1]) = '0' 等 4 条 | 是 | 通过 |

## CityReal01 套件（`CityReal01.test.ets`，22 条）

城市表 `cityData` 的 22 条冻结记录：城市名、温度、天气与排列顺序。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| City table contains 22 supported locations | - | - | cityData.length = 22；cityData[0].name = '北京' 等 3 条 | 是 | 通过 |
| Beijing row keeps frozen temperature and weather | - | cityData[0] | row.name = '北京'；row.temp = '32' 等 3 条 | 是 | 通过 |
| Shanghai row keeps frozen temperature and weather | - | cityData[1] | row.name = '上海'；row.temp = '28' 等 3 条 | 是 | 通过 |
| Guangzhou row keeps frozen temperature and weather | - | cityData[2] | row.name = '广州'；row.temp = '35' 等 3 条 | 是 | 通过 |
| Tianjin row keeps frozen temperature and weather | - | cityData[3] | row.name = '天津'；row.temp = '35' 等 3 条 | 是 | 通过 |
| Wuhan row keeps frozen temperature and weather | - | cityData[4] | row.name = '武汉'；row.temp = '26' 等 3 条 | 是 | 通过 |
| Shenyang and Chongqing rows keep frozen payloads | - | cityData[5] | sy.name = '沈阳'；sy.temp = '25' 等 3 条 | 是 | 通过 |
| Hangzhou and Nanjing rows keep frozen payloads | - | cityData[7] | hz.name = '杭州'；hz.temp = '35' 等 3 条 | 是 | 通过 |
| Harbin and Changsha rows keep frozen payloads | - | cityData[9] | heb.name = '哈尔滨'；heb.temp = '25' 等 3 条 | 是 | 通过 |
| Changsha is the only shower city in the table | - | for (let i = 0; i < cityData.length; i++) { | showerCount = 1；cityData[10].name = '长春' 等 3 条 | 是 | 通过 |
| Hohhot and Shijiazhuang rows keep frozen payloads | - | cityData[11] | hh.name = '呼和浩特'；hh.temp = '25' 等 3 条 | 是 | 通过 |
| Yinchuan and Urumqi rows keep frozen payloads | - | cityData[13] | yc.name = '银川'；yc.temp = '25' 等 3 条 | 是 | 通过 |
| Lhasa and Xining rows keep frozen payloads | - | cityData[15] | ls.name = '拉萨'；ls.temp = '35' 等 3 条 | 是 | 通过 |
| Xian and Lanzhou rows keep frozen payloads | - | cityData[17] | xa.name = '西安'；xa.weather = '晴' 等 3 条 | 是 | 通过 |
| Taiyuan and Kunming rows keep frozen payloads | - | cityData[19] | ty.name = '太原'；ty.weather = '阴' 等 3 条 | 是 | 通过 |
| Nanning closes the table with the coolest temperature | - | cityData[21] | nn.name = '南宁'；nn.temp = '20' 等 3 条 | 是 | 通过 |
| All city names are unique | - | cityData.map(x => x.name) | new Set(names).size = 22；names.length = 22 等 3 条 | 是 | 通过 |
| Every temperature is a two-digit numeric string | - | for (let i = 0; i < cityData.length; i++) { | allNumeric 为真；cityData[0].temp.length = 2 等 3 条 | 是 | 通过 |
| Weather labels stay inside the six supported tokens | - | for (let i = 0; i < cityData.length; i++) { | inSet 为真；allowed.length = 6 等 3 条 | 是 | 通过 |
| Sunny cities outnumber rainy cities in the frozen table | - | for (let i = 0; i < cityData.length; i++) { | sunny > rainy 为真；sunny + rainy <= 22 为真 等 3 条 | 是 | 通过 |
| The first five cities match the weather detail records | - | for (let i = 0; i < head.length; i++) { | matched 为真；cityData[4].name = '武汉' 等 3 条 | 是 | 通过 |
| temperature spread of the table runs from 20 to 35 | - | cityData.map(x => Number(x.temp)) | lo = 20；hi = 35 等 3 条 | 是 | 通过 |

## DsReal01 套件（`DsReal01.test.ets`，20 条）

`MyDataSource` 的注册、监听、数据读取与越界访问拒绝。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Empty source reports zero total count | - | new MyDataSource<string>(empty) | ds.totalCount() = 0；ds.totalCount() === 0 为真 等 3 条 | 是 | 通过 |
| Single element source reads back the stored item | - | new MyDataSource<string>(src) | ds.totalCount() = 1；ds.getData(0) = 'only' 等 3 条 | 是 | 通过 |
| Multi element source preserves order | - | new MyDataSource<string>(src) | ds.getData(0) = 'a'；ds.getData(1) = 'b' 等 3 条 | 是 | 通过 |
| Out-of-range index resolves to undefined | - | new MyDataSource<string>(src) | oob 为 undefined；ds.totalCount() = 1 等 3 条 | 是 | 通过 |
| Negative index resolves to undefined | - | new MyDataSource<string>(src) | neg 为 undefined；ds.getData(1) = 'q' 等 3 条 | 是 | 通过 |
| setData replaces the whole backing array | - | new MyDataSource<string>(src) | ds.totalCount() = 1；ds.getData(0) = 'new1' 等 3 条 | 是 | 通过 |
| setData accepts an empty array collapsing the source | - | new MyDataSource<string>(src) | ds.totalCount() = 0；ds.getData(0) 为 undefined 等 3 条 | 是 | 通过 |
| Source keeps object element identity for model classes | - | new City('北京', '32', '晴') | ds.getData(0) === c1 为真；ds.getData(1).name = '上海' 等 3 条 | 是 | 通过 |
| Ten element source reads every index correctly | - | new MyDataSource<string>(src) | allOk 为真；ds.totalCount() = 10 等 3 条 | 是 | 通过 |
| Two sources built from one array reflect shared mutation | - | new MyDataSource<string>(src) | ds1.totalCount() = 2；ds2.totalCount() = 2 等 3 条 | 是 | 通过 |
| Empty source push grows the count to one | - | new MyDataSource<string>(empty) | ds.totalCount() = 1；ds.getData(0) = 'first' 等 3 条 | 是 | 通过 |
| pushData appends after the last element without reordering | - | new MyDataSource<string>(src) | ds.getData(0) = 'a'；ds.getData(1) = 'b' 等 3 条 | 是 | 通过 |
| addData at index zero shifts the head element | - | new MyDataSource<string>(src) | ds.getData(0) = 'a'；ds.getData(1) = 'b' 等 3 条 | 是 | 通过 |
| addData at the middle index inserts precisely there | - | new MyDataSource<string>(src) | ds.getData(1) = 'b'；ds.getData(2) = 'c' 等 3 条 | 是 | 通过 |
| addData beyond length appends like splice tail insertion | - | new MyDataSource<string>(src) | ds.totalCount() = 2；ds.getData(1) = 'far' 等 3 条 | 是 | 通过 |
| addData with negative index behaves as splice clamp | - | new MyDataSource<string>(src) | ds.totalCount() = 3；ds.getData(1) = 'tail' 等 3 条 | 是 | 通过 |
| totalCount is idempotent across repeated reads | - | new MyDataSource<string>(src) | t1 = 3；t2 = t1 等 3 条 | 是 | 通过 |
| getData(0) on an empty source yields undefined not an error | - | new MyDataSource<string>(empty) | head 为 undefined；ds.totalCount() = 0 等 3 条 | 是 | 通过 |
| setData after mutations fully replaces previous state | - | new MyDataSource<string>(src) | ds.totalCount() = 1；ds.getData(0) = 'only' 等 3 条 | 是 | 通过 |
| Registering and using a change listener keeps data intact | - | new MyDataSource<string>(src) | recorder.notified = 1；ds.totalCount() = 2 等 3 条 | 是 | 通过 |

## DsReal02 套件（`DsReal02.test.ets`，20 条）

`MyDataSource` 的第二组覆盖：写入、监听与计数口径。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Three consecutive pushes grow the source in order | - | new MyDataSource<string>(empty) | ds.totalCount() = 3；ds.getData(0) = 'p1' 等 3 条 | 是 | 通过 |
| Repeated head insertion reverses the arrival order | - | new MyDataSource<string>(empty) | ds.getData(0) = 'c'；ds.getData(1) = 'b' 等 3 条 | 是 | 通过 |
| Mixed insert and push operations keep a coherent snapshot | - | new MyDataSource<string>(src) | ds.totalCount() = 4；ds.getData(0) = 'head' 等 4 条 | 是 | 通过 |
| repeated far-out-of-range inserts append sequentially | - | new MyDataSource<string>(src) | ds.totalCount() = 3；ds.getData(1) = 'far1' 等 3 条 | 是 | 通过 |
| After collapsing to empty via setData new pushes start fresh | - | new MyDataSource<string>(src) | ds.totalCount() = 1；ds.getData(0) = 'fresh' 等 3 条 | 是 | 通过 |
| addData at current length behaves like a push | - | new MyDataSource<string>(src) | ds.getData(2) = 'three'；ds.totalCount() = 3 等 3 条 | 是 | 通过 |
| Five-step mixed operation ends with a frozen snapshot | - | new MyDataSource<string>(src) | ds.totalCount() = 4；ds.getData(0) = 's3' 等 4 条 | 是 | 通过 |
| Object-typed source drives City payloads | - | [new City('北京', '32', '晴')] | ds.totalCount() = 3；ds.getData(0).name = '广州' 等 4 条 | 是 | 通过 |
| Out-of-range reads never mutate the stored state | - | new MyDataSource<string>(src) | miss1 为 undefined；miss2 为 undefined 等 4 条 | 是 | 通过 |
| Successive setData calls leave only the last array | - | new MyDataSource<string>(src) | ds.totalCount() = 1；ds.getData(0) = 't1' 等 3 条 | 是 | 通过 |
| Valid reads still succeed after undefined probes | - | new MyDataSource<string>(src) | probe 为 undefined；ds.getData(0) = 'alive' 等 3 条 | 是 | 通过 |
| Ten pushes onto an empty source count exactly ten | - | new MyDataSource<string>(empty) | ds.totalCount() = 10；ds.getData(0) = 'k0' 等 3 条 | 是 | 通过 |
| Sequential middle insertions stack to the left of the cursor | - | new MyDataSource<string>(src) | ds.getData(1) = 'Y'；ds.getData(2) = 'X' 等 4 条 | 是 | 通过 |
| Head element survives all later mutations of the source | - | new MyDataSource<string>(src) | ds.getData(0) = 'head'；ds.getData(3) = 'three' 等 4 条 | 是 | 通过 |
| Twenty-element source exposes correct head and tail reads | - | for (let i = 0; i < 20; i++) { | ds.totalCount() = 20；ds.getData(0) = 'e0' 等 4 条 | 是 | 通过 |
| Duplicated values are stored as independent entries | - | new MyDataSource<string>(src) | ds.totalCount() = 3；ds.getData(0) = ds.getData(1) 等 3 条 | 是 | 通过 |
| Head insertion into an empty source mirrors push semantics | - | new MyDataSource<string>(empty) | ds.getData(0) = 'solo'；ds.totalCount() = 1 等 3 条 | 是 | 通过 |
| Pushes after a negative-index insert append behind it | - | new MyDataSource<string>(src) | ds.getData(1) = 'x'；ds.getData(2) = 'b' 等 4 条 | 是 | 通过 |
| Two sources over separate arrays evolve independently | - | new MyDataSource<string>(s1) | d1.totalCount() = 2；d2.totalCount() = 1 等 4 条 | 是 | 通过 |
| the source holds the caller array by reference | - | new MyDataSource<string>(src) | ds.totalCount() = 3；src.length = 3 等 4 条 | 是 | 通过 |

## FdateReal01 套件（`FdateReal01.test.ets`，20 条）

`FormDate` 的 `fill` 补位、`formMonthDay` 与 `formTimeSlot` 冻结输出。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formTimeSlot(0) resolves to the early-morning slot (0 is a valid hour) | - | new FormDate() | result = '早上'；String(result) !== '' 为真 | 是 | 通过 |
| formTimeSlot returns 早上 for mid-night hour 4 | - | new FormDate() | result = '早上'；typeof result = 'string' 等 3 条 | 是 | 通过 |
| formTimeSlot returns 早上 for upper boundary hour 8 | - | new FormDate() | result = '早上'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 上午 for lower boundary hour 9 | - | new FormDate() | result = '上午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 上午 for hour 10 (excluded from 中午) | - | new FormDate() | result = '上午'；String(result).length > 0 为真 等 3 条 | 是 | 通过 |
| formTimeSlot returns 中午 for lower boundary hour 11 | - | new FormDate() | result = '中午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 中午 for noon hour 12 | - | new FormDate() | result = '中午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 中午 for upper boundary hour 13 | - | new FormDate() | result = '中午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 下午 for lower boundary hour 14 | - | new FormDate() | result = '下午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 下午 for upper boundary hour 16 | - | new FormDate() | result = '下午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 傍晚 for lower boundary hour 17 | - | new FormDate() | result = '傍晚'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 傍晚 for hour 18 | - | new FormDate() | result = '傍晚'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 傍晚 for hour 19 (first-match wins over 晚上) | - | new FormDate() | result = '傍晚'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 晚上 for hour 20 | - | new FormDate() | result = '晚上'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot returns 晚上 for hour 23 (last hour of day) | - | new FormDate() | result = '晚上'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot without argument resolves the current hour slot | - | new FormDate() | labels.includes(String(result)) 为真；typeof result = 'string' 等 3 条 | 是 | 通过 |
| fill pads single digit 0 with leading zero | - | new FormDate() | result = '00'；String(result).length = 2 等 3 条 | 是 | 通过 |
| fill pads single digit 9 with leading zero | - | new FormDate() | result = '09'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formMonthDay pads a single-digit month but keeps the day unpadded | - | new FormDate() | result = '03/5'；result.includes('/') 为真 等 3 条 | 是 | 通过 |
| formMonthDay keeps a padded month and unpadded day in a double-digit month | - | new FormDate() | result = '09/7'；result.split('/').length = 2 等 3 条 | 是 | 通过 |

## FdateReal02 套件（`FdateReal02.test.ets`，20 条）

`FormDate` 的时间槽与星期文案映射，覆盖整点与时刻边界。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formTimeSlot(24) is out of every slot range and yields undefined | - | new FormDate() | result 为 undefined；String(result) === 'null' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(-1) negative hour yields undefined | - | new FormDate() | result 为 undefined；String(result) === 'null' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(8.5) falls into the gap between 早上 and 上午 | - | new FormDate() | result 为 undefined；result === '早上' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(10.5) stays inside 上午 range 9..11 exclusive | - | new FormDate() | result = '上午'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot(23.5) exceeds the 晚上 upper bound 23 | - | new FormDate() | result 为 undefined；result === '晚上' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(0.5) belongs to 早上 since range starts at 0 inclusive | - | new FormDate() | result = '早上'；String(result).length = 2 等 3 条 | 是 | 通过 |
| fill(10) keeps the two-digit value | - | new FormDate() | result = '10'；String(result).length = 2 等 3 条 | 是 | 通过 |
| fill(99) keeps the two-digit value | - | new FormDate() | result = '99'；String(result).length = 2 等 3 条 | 是 | 通过 |
| fill(undefined) string-concatenates to '0undefined' | - | new FormDate() | result = '0undefined'；result.startsWith('0') 为真 等 3 条 | 是 | 通过 |
| fill(-1) pads the negative literal producing '0-1' | - | new FormDate() | result = '0-1'；String(result).length = 3 等 3 条 | 是 | 通过 |
| formMonthDay keeps the double-digit month prefix | - | new FormDate() | result = '10/15'；String(result).length = 5 等 3 条 | 是 | 通过 |
| formMonthDay keeps padded month and raw two-digit day (leap day) | - | new FormDate() | result = '02/29'；result.startsWith('02') 为真 等 3 条 | 是 | 通过 |
| formMonthDay keeps double-digit month and single-digit day unpadded | - | new FormDate() | result = '12/5'；result.endsWith('5') 为真 等 3 条 | 是 | 通过 |
| formMonthDay without argument always contains a slash separator | - | new FormDate() | result.includes('/') 为真；result.split('/').length = 2 等 3 条 | 是 | 通过 |
| formDay maps getDay() 0-6 to the seven weekday labels, Sunday included | - | new FormDate() | result = '星期日'；String(result).startsWith('星期') 为真 等 4 条 | 是 | 通过 |
| formDay returns one of the seven weekday labels or undefined | - | new FormDate() | result === undefined \|\| labels.includes(String(result)) 为真；String(result) === 'null' 为假 等 3 条 | 是 | 通过 |
| fill(5) pads to '05' preserving the numeric text | - | new FormDate() | result = '05'；String(result).length = 2 等 3 条 | 是 | 通过 |
| formTimeSlot(13.5) falls into the gap between 中午 and 下午 | - | new FormDate() | result 为 undefined；result === '中午' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(16.5) falls into the gap between 下午 and 傍晚 | - | new FormDate() | result 为 undefined；result === '下午' 为假 等 3 条 | 是 | 通过 |
| formTimeSlot(11.5) stays inside 中午 for half-open integer ranges | - | new FormDate() | result = '中午'；String(result).length = 2 等 3 条 | 是 | 通过 |

## LoggerReal01 套件（`LoggerReal01.test.ets`，12 条）

`Logger` 对 hilog 的封装：域名、标签与单 / 多占位符转发。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Logger prefix equals the frozen sample tag | - | - | Logger.PREFIX = '[Sample_Weather]'；Logger.PREFIX.startsWith('[') 为真 等 3 条 | 是 | 通过 |
| Logger prefix length is stable at sixteen characters | - | - | Logger.PREFIX.length = 16；Logger.PREFIX.includes('Weather') 为真 等 3 条 | 是 | 通过 |
| Logger prefix keeps the sample namespace marker | - | Logger.PREFIX.split('_') | parts.length = 2；parts[0] = '[Sample' 等 3 条 | 是 | 通过 |
| Logger domain equals the frozen 0xFF00 numeric value | - | - | Logger.DOMAIN = 0xFF00；Logger.DOMAIN = 65280 等 3 条 | 是 | 通过 |
| Logger domain stays inside the hilog 16-bit range | - | - | Logger.DOMAIN < 65536 为真；Logger.DOMAIN >= 0xFF00 为真 等 3 条 | 是 | 通过 |
| Logger domain low byte is zero as designed | - | - | Logger.DOMAIN % 256 = 0；Logger.DOMAIN / 256 = 255 等 3 条 | 是 | 通过 |
| Logger format equals the frozen public placeholder pair | - | - | Logger.FORMAT = '%{public}s, %{public}s'；Logger.FORMAT.length = 22 等 3 条 | 是 | 通过 |
| Logger format splits into exactly two placeholders | - | Logger.FORMAT.split(', ') | parts.length = 2；parts[0] = '%{public}s' 等 3 条 | 是 | 通过 |
| Logger format carries no private markers keeping logs readable | - | - | Logger.FORMAT.includes('private') 为假；Logger.FORMAT.startsWith('%') 为真 等 3 条 | 是 | 通过 |
| Logger info takes var-args without throwing and logs through the single placeholder sink | - | Logger.info('action', 'testLogger0010') | thrown = ''；Logger.PREFIX = '[Sample_Weather]' 等 5 条 | 是 | 通过 |
| Logger warn and error run without mutating constants | - | Logger.warn('w', '1') | Logger.FORMAT === before 为真；Logger.PREFIX.length = 16 等 3 条 | 是 | 通过 |
| Logger debug with empty arguments is a safe no-throw call | - | Logger.debug() | thrown = ''；Logger.FORMAT.split(', ').length = 2 等 3 条 | 是 | 通过 |

## MockReal01 套件（`MockReal01.test.ets`，30 条）

`weather` 冻结基线：首条城市的当前温度、天气描述、日落时刻与空气质量字段。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Frozen weather table contains exactly five cities | - | - | weather.length = 5；weather[4] !== undefined 为真 等 3 条 | 是 | 通过 |
| Every city record carries seven daily entries | - | for (let i = 0; i < weather.length; i++) { | allSeven 为真；weather[0].data.length = 7 等 3 条 | 是 | 通过 |
| Beijing record keeps frozen identifiers and localized names | - | weather[0] | beijing.cityid = '101210101'；beijing.city = '北京' 等 3 条 | 是 | 通过 |
| Shanghai record keeps frozen identifiers | - | weather[1] | shanghai.cityid = '101210102'；shanghai.city = '上海' 等 3 条 | 是 | 通过 |
| Guangzhou record keeps frozen identifiers | - | weather[2] | gz.cityid = '101210103'；gz.city = '广州' 等 3 条 | 是 | 通过 |
| Tianjin record keeps frozen identifiers | - | weather[3] | tj.cityid = '101210104'；tj.city = '天津' 等 3 条 | 是 | 通过 |
| Wuhan record keeps frozen identifiers | - | weather[4] | wh.cityid = '101210105'；wh.city = '武汉' 等 3 条 | 是 | 通过 |
| Every city record reports China as its country | - | for (let i = 0; i < weather.length; i++) { | allChina 为真；weather[0].country = '中国' 等 3 条 | 是 | 通过 |
| Day two of Beijing mirrors the frozen 2022-06-24 header | - | weather[0].data[1] | d1.date = '2022-06-24'；d1.week = '星期五' 等 3 条 | 是 | 通过 |
| Beijing day two temperature triple equals frozen numbers | - | weather[0].data[1] | String(d1.tem) = '32'；String(d1.tem1) = '35' 等 3 条 | 是 | 通过 |
| First day carries no hourly or index detail lists | - | weather[0].data[0] | d0.hours.length = 0；d0.index.length = 0 等 3 条 | 是 | 通过 |
| Second day exposes the full 24-slot hourly list | - | weather[0].data[1].hours as HourItem[] | hours.length = 24；hours[0].hours = '09时' 等 3 条 | 是 | 通过 |
| Beijing hourly head keeps frozen weather payload | - | (weather[0].data[1].hours as HourItem[])[0] | String(head.tem) = '30'；head.wea = '晴' 等 3 条 | 是 | 通过 |
| Beijing 17:00 hourly entry switches to cloudy payload | - | (weather[0].data[1].hours as HourItem[])[8] | item.hours = '17时'；item.wea = '多云' 等 4 条 | 是 | 通过 |
| Every hourly entry carries the six frozen field names | - | for (let i = 0; i < hours.length; i++) { | shaped 为真；hours[0].hours = '08时' 等 3 条 | 是 | 通过 |
| Second day carries exactly eight life index rows | - | weather[0].data[1].index as IndexItem[] | idx.length = 8；idx[0].title = '湿度' 等 3 条 | 是 | 通过 |
| Life index titles follow the frozen eight-topic order | - | for (let i = 0; i < titles.length; i++) { | same 为真；idx[4].title = '穿衣' 等 3 条 | 是 | 通过 |
| Beijing first index row keeps the frozen humidity tip text | - | (weather[0].data[1].index as IndexItem[])[0] | row.desc = '湿度刚好。'；row.title = '湿度' 等 3 条 | 是 | 通过 |
| Beijing aqi block keeps frozen headline values | - | weather[0].aqi | aqi.air = '28'；aqi.air_level = '优' 等 3 条 | 是 | 通过 |
| Beijing pollutant readings equal the frozen particulate trio | - | weather[0].aqi | aqi.pm10 = '181'；aqi.pm25 = '94' 等 3 条 | 是 | 通过 |
| Beijing gas readings keep frozen ozone and carbon values | - | weather[0].aqi | aqi.o3 = '19'；aqi.no2 = '105' 等 3 条 | 是 | 通过 |
| Beijing advice fields keep the frozen five lifestyle texts | - | weather[0].aqi | aqi.kouzhao = '不用佩戴口罩'；aqi.yundong = '非常适宜运动' 等 3 条 | 是 | 通过 |
| Beijing aqi cityEn accidentally equals hangzhou | - | weather[0].aqi | aqi.cityEn = 'hangzhou'；aqi.cityEn === weather[0].cityEn 为假 等 3 条 | 是 | 通过 |
| Shanghai aqi keeps its internally consistent identifiers | - | weather[1].aqi | aqi.cityid = '101210102'；aqi.cityEn = 'shanghai' 等 3 条 | 是 | 通过 |
| Tianjin air quality is rated 良 with 良 sub-descriptors | - | weather[3].aqi | aqi.air = '50'；aqi.air_level = '良' 等 3 条 | 是 | 通过 |
| Wuhan aqi keeps the frozen low pollution readings | - | weather[4].aqi | aqi.air = '29'；aqi.air_level = '优' 等 3 条 | 是 | 通过 |
| Daily label combines padded day number and weekday | - | weather[2].data[0] | d0.day = '23日（星期四）'；d6.day = '29日（星期三）' 等 3 条 | 是 | 通过 |
| Guangzhou surface data keeps frozen rainy readings | - | weather[2].data[1] | d1.wea = '小雨'；String(d1.tem) = '26' 等 3 条 | 是 | 通过 |
| all five cities share the same day-two date stamp | - | for (let i = 0; i < weather.length; i++) { | sameDate 为真；weather[3].data[1].date = '2022-06-24' 等 3 条 | 是 | 通过 |
| Day sequence runs 23rd through 29th without gaps | - | for (let i = 0; i < 7; i++) { | ordered 为真；weather[1].data[0].date = '2022-06-23' 等 3 条 | 是 | 通过 |

## ModelReal01 套件（`ModelReal01.test.ets`，32 条）

模型类构造与字段：`Forecast` / `WeekWeather` / `AirIndex` / `SuitData` / `AirData` / `HeaderData` / `City` / `CityListData`。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Forecast stores all six constructor arguments verbatim | - | new Forecast('30°', '09:00', '上午', 'sunny', '西南风', '3-4级') | f.degree = '30°'；f.date = '09:00' 等 4 条 | 是 | 通过 |
| Forecast accepts empty strings for every text field | - | new Forecast('', '', '', '', '', '') | f.degree.length = 0；f.date.length = 0 等 4 条 | 是 | 通过 |
| Forecast icon field accepts a plain string payload | - | new Forecast('1°', '00:00', '早上', 'stringIcon', '无风', '<1级') | f.icon = 'stringIcon'；typeof f.icon = 'string' 等 3 条 | 是 | 通过 |
| Forecast instances keep independent field values | - | new Forecast('1°', 'a', 'b', 'c', 'd', 'e') | a.degree === b.degree 为假；a.date = 'a' 等 4 条 | 是 | 通过 |
| WeekWeather stores seven text fields and icon verbatim | - | new WeekWeather('06/23', '星期四', 'yin', '阴', '优', '35', '25') | w.date = '06/23'；w.weather = '阴' 等 4 条 | 是 | 通过 |
| WeekWeather min/max fields accept arbitrary strings untouched | - | new WeekWeather('', '', 'x', '', '', '-9', 'N/A') | w.min = 'N/A'；w.max = '-9' 等 4 条 | 是 | 通过 |
| WeekWeather accepts a Resource object in the icon slot | - | new WeekWeather('06/', '星期五', $r('app.media.ic_weather_sunny'), '晴', '良', '30', '20') | w.weather = '晴'；w.icon instanceof Object 为真 等 3 条 | 是 | 通过 |
| WeekWeather unicode payloads survive round-trip untouched | - | new WeekWeather('😀/🌧', '星期☀', 'i', '雪❄', '优💡', '🔥', '💧') | w.date = '😀/🌧'；w.weather = '雪❄' 等 4 条 | 是 | 通过 |
| AirIndex stores label and figure untouched | - | new AirIndex('PM10', 181) | a.index = 'PM10'；a.figure = 181 等 3 条 | 是 | 通过 |
| AirIndex keeps a string figure supplied by mock data | - | new AirIndex('O2', '94') | String(a.figure) = '94'；a.index = 'O2' 等 3 条 | 是 | 通过 |
| AirIndex tolerates numeric edge values zero and negatives | - | new AirIndex('CO', 0) | z.figure = 0；n.figure = -5 等 3 条 | 是 | 通过 |
| AirIndex empty label stays empty | - | new AirIndex('', 500) | a.index.length = 0；a.figure = 500 等 3 条 | 是 | 通过 |
| SuitData stores resource plus description and value | - | new SuitData($r('app.media.ic_weather_sunny'), '湿度', '42%') | s.desc = '湿度'；s.value = '42%' 等 3 条 | 是 | 通过 |
| SuitData accepts empty description and value strings | - | new SuitData($r('app.media.ic_weather_yin'), '', '') | s.desc.length = 0；s.value.length = 0 等 3 条 | 是 | 通过 |
| SuitData resource field carries the referenced media id | - | new SuitData($r('app.media.ic_weather_sunny'), '穿衣', '短袖') | s1.src.id === s2.src.id 为假；s1.value = '短袖' 等 3 条 | 是 | 通过 |
| SuitData long value strings are stored without truncation | - | '适宜'.repeat(50) | s.value.length = 100；s.value.startsWith('适宜') 为真 等 3 条 | 是 | 通过 |
| AirData stores quality number and description text | - | new AirData('28', '优') | air.airQuality = '28'；air.airDesc = '优' 等 3 条 | 是 | 通过 |
| AirData empty values remain empty strings | - | new AirData('', '') | air.airQuality.length = 0；air.airDesc.length = 0 等 3 条 | 是 | 通过 |
| AirData boundary values 0 and 500 are stored verbatim | - | new AirData('0', '优') | low.airQuality = '0'；high.airQuality = '500' 等 3 条 | 是 | 通过 |
| AirData non numeric quality stays untouched | - | new AirData('abc', '-') | air.airQuality = 'abc'；air.airDesc = '-' 等 3 条 | 是 | 通过 |
| HeaderData stores the eight home-header fields | - | new AirData('28', '优') | h.city = '北京'；h.temp = '32' 等 4 条 | 是 | 通过 |
| HeaderData max/min/tips fields keep supplied strings | - | new HeaderData('X', '1', '阴', '2', '0', 'yin', new AirData('1', '良'), 'tips') | h.max = '2'；h.min = '0' 等 4 条 | 是 | 通过 |
| HeaderData icon slot accepts a Resource instance | - | new HeaderData('上海', '28', '阴', '32', '25', $r('app.media.ic_weather_yin'), new AirData('32', '优'), 't') | h.city = '上海'；h.icon instanceof Object 为真 等 3 条 | 是 | 通过 |
| HeaderData shares the referenced AirData instance by reference | - | new AirData('28', '优') | h.airData === air 为真；h.airData.airQuality = '28' 等 3 条 | 是 | 通过 |
| City stores name temp weather triple | - | new City('北京', '32', '晴') | c.name = '北京'；c.temp = '32' 等 3 条 | 是 | 通过 |
| City fields are mutable after construction | - | new City('测试城', '0', '晴') | c.weather = '小雨'；c.temp = '26' 等 3 条 | 是 | 通过 |
| City with empty triple keeps all fields empty | - | new City('', '', '') | c.name.length = 0；c.temp.length = 0 等 3 条 | 是 | 通过 |
| City name supports long unicode payloads | - | new City('呼和浩特'.repeat(10), '-1', '雷阵雨☡') | c.name.length = 40；c.temp = '-1' 等 3 条 | 是 | 通过 |
| CityListData bundles all seven aggregate sections | - | new AirData('28', '优') | cl.city = '北京'；cl.header.weatherType = '晴' 等 3 条 | 是 | 通过 |
| CityListData list sections keep supplied lengths | - | [new Forecast('1°', 'a', 'b', 'c', 'd', 'e')] | cl.hoursData.length = 1；cl.weekData.length = 1 等 4 条 | 是 | 通过 |
| CityListData with empty arrays initialises empty sections | - | new AirData('', '') | cl.hoursData.length = 0；cl.weekData.length = 0 等 4 条 | 是 | 通过 |
| CityListData instances do not share list containers | - | new AirData('1', '优') | c1.hoursData.length = 1；c2.hoursData.length = 0 等 4 条 | 是 | 通过 |

## ReqReal01 套件（`ReqReal01.test.ets`，28 条）

`RequestData` 的首页数据装配：城市列表、首页头部、小时数据与一周天气。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| getUpdateTimes exposes exactly seven refresh options | - | getUpdateTimes() | result.length = 7；result[result.length - 1] = '不更新' 等 3 条 | 是 | 通过 |
| getUpdateTimes starts with one hour option | - | getUpdateTimes() | result[0] = '1小时'；result[1] = '2小时' 等 3 条 | 是 | 通过 |
| getUpdateTimes options are the frozen sequence and unique | - | getUpdateTimes() | JSON.stringify(result) = JSON.stringify(expected)；new Set(result).size = result.length 等 3 条 | 是 | 通过 |
| getMenuInfo returns exactly two menu entries | - | getMenuInfo() | result.length = 2；result[0] instanceof MenuData 为真 等 3 条 | 是 | 通过 |
| First menu entry is manage-city pointing to CityList page | - | getMenuInfo()[0] | entry.title = '管理城市'；entry.url = 'pages/CityList' 等 3 条 | 是 | 通过 |
| Second menu entry is update interval with empty uri | - | getMenuInfo()[1] | entry.title = '更新间隔'；entry.url = '' 等 3 条 | 是 | 通过 |
| Two menu entries carry distinct titles and urls | - | getMenuInfo() | menu[0].title === menu[1].title 为假；menu[0].url === menu[1].url 为假 等 3 条 | 是 | 通过 |
| getCityList exposes all 22 supported cities | - | getCityList() | result.length = 22；result[0] instanceof City 为真 等 3 条 | 是 | 通过 |
| First city is Beijing with frozen temperature and weather | - | getCityList()[0] | city.name = '北京'；city.temp = '32' 等 3 条 | 是 | 通过 |
| Last city is Nanning with frozen temperature and weather | - | getCityList()[21] | city.name = '南宁'；city.temp = '20' 等 3 条 | 是 | 通过 |
| Every city entry carries non-empty name, temp and weather | - | getCityList() | ok 为真；list.length = 22 等 3 条 | 是 | 通过 |
| All city weather labels stay inside the frozen label set | - | getCityList() | inSet 为真；list[2].weather = '小雨' 等 3 条 | 是 | 通过 |
| getBg maps 晴 to sunny background resource | - | resName(getBg('晴')) | result Contain 'sunny_bg'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg maps light rain to rain background resource | - | resName(getBg('小雨')) | result Contain 'rain_bg'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg maps 阴 to default yin background resource | - | resName(getBg('阴')) | result Contain 'yin_bg'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg maps 中雨 to rain background by substring rule | - | resName(getBg('中雨')) | result Contain 'rain_bg'；result.includes('bg') 为真 等 3 条 | 是 | 通过 |
| getBg maps 多云 to default yin background resource | - | resName(getBg('多云')) | result Contain 'yin_bg'；result.includes('sunny') 为假 等 3 条 | 是 | 通过 |
| getBg maps 大雨 to rain background resource | - | resName(getBg('大雨')) | result Contain 'rain_bg'；result.includes('bg') 为真 等 3 条 | 是 | 通过 |
| getSideBg maps 晴 to fine side panel resource | - | resName(getSideBg('晴')) | result Contain 'weather_fine'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg maps 阵雨 to rain side panel resource | - | resName(getSideBg('阵雨')) | result Contain 'weather_rain'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg maps 阴 to yin side panel resource | - | resName(getSideBg('阴')) | result Contain 'weather_yin'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg maps 雷阵雨 to rain side panel by substring rule | - | resName(getSideBg('雷阵雨')) | result Contain 'weather_rain'；result.includes('weather') 为真 等 3 条 | 是 | 通过 |
| getAirIndexData returns six pollutant rows for a city | - | getAirIndexData(0) | result.length = 6；result[0] instanceof AirIndex 为真 等 3 条 | 是 | 通过 |
| Pollutant label order is frozen including the O2 slot | - | getAirIndexData(0) | match 为真；result[0].index = 'PM10' 等 3 条 | 是 | 通过 |
| Beijing pollutant figures equal frozen aqi values of day one | - | getAirIndexData(0) | String(result[0].figure) = '181'；String(result[1].figure) = '94' 等 3 条 | 是 | 通过 |
| Tianjin pollutant figures equal frozen aqi values with 良 O3 | - | getAirIndexData(3) | String(result[0].figure) = '180'；String(result[4].figure) = '30' 等 3 条 | 是 | 通过 |
| getLifeData returns eight lifestyle rows mirroring day indices | - | getLifeData(0) | result.length = 8；result[0] instanceof SuitData 为真 等 3 条 | 是 | 通过 |
| Beijing life values equal frozen index levels | - | getLifeData(0) | match 为真；result[0].value = '42%' 等 3 条 | 是 | 通过 |

## ReqReal02 套件（`ReqReal02.test.ets`，27 条）

`RequestData` 的空气质量、生活指数与背景图接口，另含 `FormDate` 辅助断言。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Header of city 0 shows Beijing frozen day-1 temperature fields | - | getHeaderDate(0) | header.city = '北京'；String(header.temp) = '32' 等 3 条 | 是 | 通过 |
| Header of city 0 carries frozen max and min temperatures | - | getHeaderDate(0) | String(header.max) = '35'；String(header.min) = '25' 等 3 条 | 是 | 通过 |
| Header air data equals frozen Beijing aqi level and tips | - | getHeaderDate(0) | header.airData.airQuality = '28'；header.airData.airDesc = '优' 等 3 条 | 是 | 通过 |
| Header icon resource of a sunny city resolves to ic_weather_sunny | - | getHeaderDate(0) | name Contain 'ic_weather_sunny'；name.length > 0 为真 等 3 条 | 是 | 通过 |
| Header of city 1 shows Shanghai frozen day-1 fields | - | getHeaderDate(1) | header.city = '上海'；String(header.temp) = '28' 等 3 条 | 是 | 通过 |
| Header tips and icon of the overcast city match frozen data | - | getHeaderDate(1) | header.airTips = '当前阴，紫外线弱，适合外出游玩！'；name Contain 'ic_weather_yin' 等 3 条 | 是 | 通过 |
| Optional city parameter overrides only the displayed city name | - | new City('测试城', '1', '晴') | header.city = '测试城'；header.weatherType = '晴' 等 3 条 | 是 | 通过 |
| City override keeps air data of the indexed weather record | - | getHeaderDate(2, new City('广州新城', '9', '小雨')) | header.city = '广州新城'；header.weatherType = '小雨' 等 3 条 | 是 | 通过 |
| Weekly forecast always exposes seven days | - | getWeekWeatherData(0) | week.length = 7；week[0] instanceof WeekWeather 为真 等 3 条 | 是 | 通过 |
| First week row mirrors June 23rd with the padded-month format | - | getWeekWeatherData(0)[0] | row.date = '06/23'；row.week = '星期四' 等 3 条 | 是 | 通过 |
| First week row carries frozen air level and temperature range | - | getWeekWeatherData(0)[0] | row.airLevel = '优'；String(row.max) = '35' 等 3 条 | 是 | 通过 |
| Last week row mirrors June 29th with a higher minimum | - | getWeekWeatherData(0)[6] | row.week = '星期三'；row.weather = '多云' 等 3 条 | 是 | 通过 |
| Wuhan week head keeps its own frozen values | - | getWeekWeatherData(4)[0] | row.weather = '多云'；String(row.max) = '39' 等 3 条 | 是 | 通过 |
| All week rows share the padded June month prefix but keep raw days | - | getWeekWeatherData(3) | allJune 为真；week.length = 7 等 4 条 | 是 | 通过 |
| Hourly list holds 25 rows because the sunset row is inserted | - | getHoursData(0) | hours.length = 25；hours[0] instanceof Forecast 为真 等 3 条 | 是 | 通过 |
| First hourly row of Beijing is 09:00 with 上午 slot and degree text | - | getHoursData(0)[0] | row.degree = '30°'；row.date = '09:00' 等 3 条 | 是 | 通过 |
| First hourly row keeps wind fields and the sunny icon | - | getHoursData(0)[0] | row.win = '西南风'；row.winSpeed = '3-4级' 等 3 条 | 是 | 通过 |
| sunset row is injected right after the 17:00 entry | - | getHoursData(0)[9] | row.degree = '日落'；row.date = '17:32' 等 3 条 | 是 | 通过 |
| Sunset row reuses wind data of the 17:00 item and shows sunset icon | - | getHoursData(0)[9] | row.win = '西北风'；row.winSpeed = '3-4级' 等 3 条 | 是 | 通过 |
| Midnight hourly row formats as 00:00 while its slot follows the clock | - | getHoursData(0)[16] | row.date = '00:00'；row.desc = slot 等 3 条 | 是 | 通过 |
| Shanghai hourly list starts at 08:00 with the overcast icon | - | getHoursData(1) | hours.length = 25；hours[0].date = '08:00' 等 3 条 | 是 | 通过 |
| sunset insertion shifts with the varying hourly start | - | getHoursData(1) | hours[10].degree = '日落'；hours[10].date = '17:32' 等 3 条 | 是 | 通过 |
| addCity on an empty list backfills weather of index 0 before push | - | AppStorage.setOrCreate('cityList', empty) | added.weather = '晴'；added.temp = '32' 等 3 条 | 是 | 通过 |
| addCity with two stored cities backfills weather of index 2 | - | [new City('甲', '1', '晴'), new City('乙', '2', '阴')] | added.weather = '小雨'；added.temp = '26' 等 3 条 | 是 | 通过 |
| addCity keeps the user supplied name while overwriting visuals | - | AppStorage.setOrCreate('cityList', empty) | added.name = '保留名'；added.weather = '晴' 等 3 条 | 是 | 通过 |
| City weather page seeds two default cities when storage is empty | - | AppStorage.setOrCreate('cityList', empty) | result.length = 2；result[0] instanceof CityListData 为真 等 3 条 | 是 | 通过 |
| Aggregated city data keeps consistent sub-list sizes | - | AppStorage.setOrCreate('cityList', empty) | data.hoursData.length = 25；data.weekData.length = 7 等 4 条 | 是 | 通过 |

## StyleReal01 套件（`StyleReal01.test.ets`，16 条）

`Style` 样式令牌的冻结值，以及令牌之间的大小与倍数关系。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Card height constant equals frozen value 192 | - | - | Style.CARD_HEIGHT = 192；Style.CARD_HEIGHT > Style.NORMAL_RADIUS 为真 等 3 条 | 是 | 通过 |
| Weather item width constant equals frozen value 80 | - | - | Style.WEATHER_ITEM_WIDTH = 80；Style.WEATHER_ITEM_WIDTH < Style.CARD_HEIGHT 为真 等 3 条 | 是 | 通过 |
| Normal padding equals 14 | - | - | Style.NORMAL_PADDING = 14；Style.NORMAL_PADDING = Style.NORMAL_MARGIN 等 3 条 | 是 | 通过 |
| Normal margin equals 14 | - | - | Style.NORMAL_MARGIN = 14；Style.NORMAL_MARGIN < Style.NORMAL_RADIUS 为真 等 3 条 | 是 | 通过 |
| Normal space equals 12 | - | - | Style.NORMAL_SPACE = 12；Style.NORMAL_SPACE = Style.GRID_GUTTER 等 3 条 | 是 | 通过 |
| Grid gutter equals 12 | - | - | Style.GRID_GUTTER = 12；Style.GRID_GUTTER > Style.ADD_CITY_BOTTOM 为真 等 3 条 | 是 | 通过 |
| Normal radius equals 16 | - | - | Style.NORMAL_RADIUS = 16；Style.NORMAL_RADIUS > Style.NORMAL_MARGIN 为真 等 3 条 | 是 | 通过 |
| City text radius equals 18 | - | - | Style.CITY_TEXT_RADIUS = 18；Style.CITY_TEXT_RADIUS - Style.NORMAL_RADIUS = 2 等 3 条 | 是 | 通过 |
| Add city bottom margin equals 6 | - | - | Style.ADD_CITY_BOTTOM = 6；Style.ADD_CITY_BOTTOM < Style.ADD_CITY_BOTTOM_LG 为真 等 3 条 | 是 | 通过 |
| Large add city bottom margin equals 28 | - | - | Style.ADD_CITY_BOTTOM_LG = 28；Style.ADD_CITY_BOTTOM_LG > Style.NORMAL_RADIUS 为真 等 3 条 | 是 | 通过 |
| Card background color is the frozen alpha white literal | - | - | Style.CARD_BACKGROUND_COLOR = '#24FFFFFF'；Style.CARD_BACKGROUND_COLOR.startsWith('#') 为真 等 3 条 | 是 | 通过 |
| Dialog padding out equals 42 | - | - | Style.DIALOG_PADDING_OUT = 42；Style.DIALOG_PADDING_OUT > Style.DIALOG_PADDING 为真 等 3 条 | 是 | 通过 |
| Dialog padding equals 24 | - | - | Style.DIALOG_PADDING = 24；Style.DIALOG_PADDING + Style.DIALOG_PADDING_OUT = 66 等 3 条 | 是 | 通过 |
| Big font weight equals 300 | - | - | Style.BIG_FONT_WEIGHT = 300；Style.BIG_FONT_WEIGHT > Style.TIME_LIST_HEIGHT 为真 等 3 条 | 是 | 通过 |
| Time list height equals 48 | - | - | Style.TIME_LIST_HEIGHT = 48；Style.TIME_LIST_HEIGHT > Style.TIME_LIST_MARGIN 为真 等 3 条 | 是 | 通过 |
| Time list margin equals 22 | - | - | Style.TIME_LIST_MARGIN = 22；Style.TIME_LIST_MARGIN > Style.DIALOG_PADDING / 2 为真 等 3 条 | 是 | 通过 |

## CanvasMoon0001 套件（`CanvasMoon0001.test.ets`，21 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| initMoon width（21 条） | - | new CanvasStubContext()..new CanvasStubContext()（`testCanvas0122`..`testCanvas0142`） | 逐条按冻结基线断言，首条 result = "30\|月出 傍晚5:12,上弦月,月落 早上6:20"；result.split('\|').length === 2 为真 等 3 条 | 是 | 通过 |

## CanvasRound0001 套件（`CanvasRound0001.test.ets`，65 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| initRound air（51 条） | - | new CanvasStubContext()..new CanvasStubContext()（`testCanvas0036`..`testCanvas0086`） | 逐条按冻结基线断言，首条 result = "140\|1.5707963267948966\|优,0,0,500"；result.split('\|').length === 3 为真 等 3 条 | 是 | 通过 |
| initRound invalid air（7 条） | - | new CanvasStubContext()..new CanvasStubContext()（`testCanvas0087`..`testCanvas0093`） | 逐条按冻结基线断言，首条 result = "140\|-0.18849555921538774\|优,-28,0,500"；result.split('\|').length === 3 为真 等 3 条 | 是 | 通过 |
| initRound desc（7 条） | - | new CanvasStubContext()..new CanvasStubContext()（`testCanvas0094`..`testCanvas0100`） | 逐条按冻结基线断言，首条 result = "140\|4.71238898038469\|良,50,0,500"；result.split('\|').length === 3 为真 等 3 条 | 是 | 通过 |

## CanvasSun0001 套件（`CanvasSun0001.test.ets`，21 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| initSun width（21 条） | - | new CanvasStubContext()..new CanvasStubContext()（`testCanvas0101`..`testCanvas0121`） | 逐条按冻结基线断言，首条 result = "146\|100\|40\|日出 早上6:00,日落 傍晚5:32"；result.split('\|').length === 4 为真 等 3 条 | 是 | 通过 |

## CityAdd0001 套件（`CityAdd0001.test.ets`，20 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| addCity over seeded list n（20 条） | - | for (let k: number = 0; k < 0; k++) { base.push(new City('c' + k, '1', '晴')); }..for (let k: number = 0; k < 19; k++) { base.push(new City('c' + k, '1', '晴')); }（`testCity0155`..`testCity0174`） | 逐条按冻结基线断言，首条 result = "1"；stored[0].weather = "晴" 等 3 条 | 是 | 通过 |

## CityList0001 套件（`CityList0001.test.ets`，66 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| getCityList()[（66 条） | - | String(getCityList()[0].name)..String(getCityList()[21].weather)（`testCity0089`..`testCity0154`） | 逐条按冻结基线断言，首条 result = "北京"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## CityRaw0001 套件（`CityRaw0001.test.ets`，66 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| cityData[（66 条） | - | String(cityData[0].name)..String(cityData[21].weather)（`testCity0023`..`testCity0088`） | 逐条按冻结基线断言，首条 result = "北京"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## DsLoop0001 套件（`DsLoop0001.test.ets`，1 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| runDs total/push/oob invariants over n=16..40 | - | for (let n: number = 16; n <= 40; n++) { | runDs(n, 'total') = String(n)；runDs(n, 'push') = String(n + 1) + "\|new" 等 3 条 | 是 | 通过 |

## DsSnap0001 套件（`DsSnap0001.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| runDs n（85 条） | - | runDs(0, 'total')..runDs(9, 'oob')（`testDs0041`..`testDs0125`） | 逐条按冻结基线断言，首条 result = "0"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## DsSnap0002 套件（`DsSnap0002.test.ets`，61 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| runDs n（59 条） | - | runDs(9, 'push')..runDs(15, 'set')（`testDs0126`..`testDs0184`） | 逐条按冻结基线断言，首条 result = "10\|new"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| runDs large n（2 条） | - | runDs(100, 'total')..runDs(500, 'total')（`testDs0185`..`testDs0186`） | 逐条按冻结基线断言，首条 result = "100"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## FdateFill0001 套件（`FdateFill0001.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| fill scan n（85 条） | - | new FormDate()..new FormDate()（`testFdate0041`..`testFdate0125`） | 逐条按冻结基线断言，首条 result = "0-10"；result === 'null' 为假 等 3 条 | 是 | 通过 |

## FdateFill0002 套件（`FdateFill0002.test.ets`，36 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| fill scan n（36 条） | - | new FormDate()..new FormDate()（`testFdate0126`..`testFdate0161`） | 逐条按冻结基线断言，首条 result = "75"；result === 'null' 为假 等 3 条 | 是 | 通过 |

## FdateMday0001 套件（`FdateMday0001.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0162`..`testFdate0246`） | 逐条按冻结基线断言，首条 result = "01/1"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0002 套件（`FdateMday0002.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0247`..`testFdate0331`） | 逐条按冻结基线断言，首条 result = "03/27"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0003 套件（`FdateMday0003.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0332`..`testFdate0416`） | 逐条按冻结基线断言，首条 result = "06/20"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0004 套件（`FdateMday0004.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0417`..`testFdate0501`） | 逐条按冻结基线断言，首条 result = "09/13"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0005 套件（`FdateMday0005.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0502`..`testFdate0586`） | 逐条按冻结基线断言，首条 result = "12/7"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0006 套件（`FdateMday0006.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0587`..`testFdate0671`） | 逐条按冻结基线断言，首条 result = "03/1"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0007 套件（`FdateMday0007.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0672`..`testFdate0756`） | 逐条按冻结基线断言，首条 result = "05/25"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0008 套件（`FdateMday0008.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（85 条） | - | new FormDate()..new FormDate()（`testFdate0757`..`testFdate0841`） | 逐条按冻结基线断言，首条 result = "08/18"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateMday0009 套件（`FdateMday0009.test.ets`，50 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formMonthDay（50 条） | - | new FormDate()..new FormDate()（`testFdate0842`..`testFdate0891`） | 逐条按冻结基线断言，首条 result = "11/11"；result.includes('/') 为真 等 3 条 | 是 | 通过 |

## FdateSlot0001 套件（`FdateSlot0001.test.ets`，36 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| formTimeSlot hour（23 条） | - | new FormDate()..new FormDate()（`testFdate0892`..`testFdate0914`） | 逐条按冻结基线断言，首条 result = "早上"；result !== 'null' 为真 等 3 条 | 是 | 通过 |
| formTimeSlot fraction（11 条） | - | new FormDate()..new FormDate()（`testFdate0915`..`testFdate0925`） | 逐条按冻结基线断言，首条 result = "早上"；result !== 'null' 为真 等 3 条 | 是 | 通过 |
| formTimeSlot out-of-range（2 条） | - | new FormDate()..new FormDate()（`testFdate0926`..`testFdate0927`） | 逐条按冻结基线断言，首条 result = "undefined"；result !== 'null' 为真 等 3 条 | 是 | 通过 |

## MockAqi0001 套件（`MockAqi0001.test.ets`，5 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| aqi snapshot city（5 条） | - | runMockAqi(0)..runMockAqi(4)（`testMock0036`..`testMock0040`） | 逐条按冻结基线断言，首条 result = "28\|优\|94\|181\|19\|105\|67\|19\|不用佩戴口罩\|非常适宜运动\|关闭净化器\|hangzhou\|13:44"；result.split('\|').length === 13 为真 等 3 条 | 是 | 通过 |

## MockDay0001 套件（`MockDay0001.test.ets`，35 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| day snapshot city（35 条） | - | runMockDay(0, 0)..runMockDay(4, 6)（`testMock0041`..`testMock0075`） | 逐条按冻结基线断言，首条 result = "23日（星期四）\|2022-06-23\|星期四\|阴\|yun\|32\|35\|25\|20\|优\|04:58\|19:04\|5-6级转3-4级"；result.split('\|').length === 13 为真 等 3 条 | 是 | 通过 |

## MockHour0001 套件（`MockHour0001.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| hour snapshot city（85 条） | - | runMockHour(0, 0)..runMockHour(3, 12)（`testMock0076`..`testMock0160`） | 逐条按冻结基线断言，首条 result = "09时\|晴\|sunny\|30\|西南风\|3-4级"；result.split('\|').length === 6 为真 等 3 条 | 是 | 通过 |

## MockHour0002 套件（`MockHour0002.test.ets`，35 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| hour snapshot city（35 条） | - | runMockHour(3, 13)..runMockHour(4, 23)（`testMock0161`..`testMock0195`） | 逐条按冻结基线断言，首条 result = "21时\|小雨\|yu\|27\|西南风\|<3级"；result.split('\|').length === 6 为真 等 3 条 | 是 | 通过 |

## MockIndex0001 套件（`MockIndex0001.test.ets`，40 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| index snapshot city（40 条） | - | runMockIndex(0, 0)..runMockIndex(4, 7)（`testMock0196`..`testMock0235`） | 逐条按冻结基线断言，首条 result = "湿度\|42%\|湿度刚好。"；result.split('\|').length === 3 为真 等 3 条 | 是 | 通过 |

## MockTop0001 套件（`MockTop0001.test.ets`，5 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| top snapshot city（5 条） | - | runMockTop(0)..runMockTop(4)（`testMock0031`..`testMock0035`） | 逐条按冻结基线断言，首条 result = "101210101\|北京\|beijing\|中国\|China\|2022-06-23 13:09:59"；result.split('\|').length === 6 为真 等 3 条 | 是 | 通过 |

## ModelSnap0001 套件（`ModelSnap0001.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Forecast payload set（25 条） | - | runModel('Forecast', 'A0', 'B0', 'C0', 'D0')..runModel('Forecast', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0033`..`testModel0057`） | 逐条按冻结基线断言，首条 result = "A0\|B0\|C0\|A0\|B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| WeekWeather payload set（25 条） | - | runModel('WeekWeather', 'A0', 'B0', 'C0', 'D0')..runModel('WeekWeather', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0058`..`testModel0082`） | 逐条按冻结基线断言，首条 result = "A0\|B0\|C0\|D0\|A0\|B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| AirIndex payload set（25 条） | - | runModel('AirIndex', 'A0', 'B0', 'C0', 'D0')..runModel('AirIndex', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0083`..`testModel0107`） | 逐条按冻结基线断言，首条 result = "A0\|B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| SuitData payload set（10 条） | - | runModel('SuitData', 'A0', 'B0', 'C0', 'D0')..runModel('SuitData', 'A9', 'B9', 'C9', 'D9')（`testModel0108`..`testModel0117`） | 逐条按冻结基线断言，首条 result = "A0\|B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |

## ModelSnap0002 套件（`ModelSnap0002.test.ets`，85 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| SuitData payload set（15 条） | - | runModel('SuitData', 'A10', 'B10', 'C10', 'D10')..runModel('SuitData', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0118`..`testModel0132`） | 逐条按冻结基线断言，首条 result = "A10\|B10"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| AirData payload set（25 条） | - | runModel('AirData', 'A0', 'B0', 'C0', 'D0')..runModel('AirData', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0133`..`testModel0157`） | 逐条按冻结基线断言，首条 result = "A0\|B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| HeaderData payload set（25 条） | - | runModel('HeaderData', 'A0', 'B0', 'C0', 'D0')..runModel('HeaderData', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0158`..`testModel0182`） | 逐条按冻结基线断言，首条 result = "A0\|B0\|C0\|D0\|A0\|B0\|A0B0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| City payload set（20 条） | - | runModel('City', 'A0', 'B0', 'C0', 'D0')..runModel('City', 'A19', 'B19', 'C19', 'D19')（`testModel0183`..`testModel0202`） | 逐条按冻结基线断言，首条 result = "A0\|B0\|C0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |

## ModelSnap0003 套件（`ModelSnap0003.test.ets`，30 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| City payload set（5 条） | - | runModel('City', '', 'B', '', 'D')..runModel('City', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0203`..`testModel0207`） | 逐条按冻结基线断言，首条 result = "\|B\|"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |
| CityListData payload set（25 条） | - | runModel('CityListData', 'A0', 'B0', 'C0', 'D0')..runModel('CityListData', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'y', 'z', 'w')（`testModel0208`..`testModel0232`） | 逐条按冻结基线断言，首条 result = "A0\|B0\|0\|0\|0"；result.split('\|').length >= 2 为真 等 3 条 | 是 | 通过 |

## ReqAir0001 套件（`ReqAir0001.test.ets`，30 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| air city（30 条） | - | getAirIndexData(0)[0]..getAirIndexData(4)[5]（`testReq0336`..`testReq0365`） | 逐条按冻结基线断言，首条 result.index = "PM10"；String(result.figure) = "181" 等 3 条 | 是 | 通过 |

## ReqBg0001 套件（`ReqBg0001.test.ets`，60 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| getBg 晴 | - | resName(getBg('晴')) | result = "sunny_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 多云 | - | resName(getBg('多云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阴 | - | resName(getBg('阴')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 小雨 | - | resName(getBg('小雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 中雨 | - | resName(getBg('中雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 大雨 | - | resName(getBg('大雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雷阵雨 | - | resName(getBg('雷阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阵雨 | - | resName(getBg('阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雨夹雪 | - | resName(getBg('雨夹雪')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 冻雨 | - | resName(getBg('冻雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 暴雨 | - | resName(getBg('暴雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 大暴雨 | - | resName(getBg('大暴雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 特大暴雨 | - | resName(getBg('特大暴雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 局部阵雨 | - | resName(getBg('局部阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阵雪 | - | resName(getBg('阵雪')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 小雪 | - | resName(getBg('小雪')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 中雪 | - | resName(getBg('中雪')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 大雪 | - | resName(getBg('大雪')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雾 | - | resName(getBg('雾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 霾 | - | resName(getBg('霾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 扬沙 | - | resName(getBg('扬沙')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 浮尘 | - | resName(getBg('浮尘')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 沙尘暴 | - | resName(getBg('沙尘暴')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 强沙尘暴 | - | resName(getBg('强沙尘暴')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 晴间多云 | - | resName(getBg('晴间多云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阴转多云 | - | resName(getBg('阴转多云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 多云转阴 | - | resName(getBg('多云转阴')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 小雨转中雨 | - | resName(getBg('小雨转中雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 中雨转大雨 | - | resName(getBg('中雨转大雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 夜间雷阵雨 | - | resName(getBg('夜间雷阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 傍晚阵雨 | - | resName(getBg('傍晚阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 午后雷阵雨 | - | resName(getBg('午后雷阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 清晨雾 | - | resName(getBg('清晨雾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 重度霾 | - | resName(getBg('重度霾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 轻度霾 | - | resName(getBg('轻度霾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 晴转小雨 | - | resName(getBg('晴转小雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阴转中雨 | - | resName(getBg('阴转中雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雷阵雨伴冰雹 | - | resName(getBg('雷阵雨伴冰雹')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 零星小雨 | - | resName(getBg('零星小雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 毛毛雨 | - | resName(getBg('毛毛雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雨夹雪转小雪 | - | resName(getBg('雨夹雪转小雪')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 高云 | - | resName(getBg('高云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 低云 | - | resName(getBg('低云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 积雨云 | - | resName(getBg('积雨云')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 薄雾 | - | resName(getBg('薄雾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 薄云 | - | resName(getBg('薄云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 浓雾 | - | resName(getBg('浓雾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 浓霾 | - | resName(getBg('浓霾')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 微雨 | - | resName(getBg('微雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 冻雷雨 | - | resName(getBg('冻雷雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 夜雨 | - | resName(getBg('夜雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 晨雨 | - | resName(getBg('晨雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 斜雨 | - | resName(getBg('斜雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 雷暴雨 | - | resName(getBg('雷暴雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阵性雨 | - | resName(getBg('阵性雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 晴间阵雨 | - | resName(getBg('晴间阵雨')) | result = "rain_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 阴间多云 | - | resName(getBg('阴间多云')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 多云间晴 | - | resName(getBg('多云间晴')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 极端大风 | - | resName(getBg('极端大风')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getBg 晴有微风 | - | resName(getBg('晴有微风')) | result = "yin_bg"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## ReqHeader0001 套件（`ReqHeader0001.test.ets`，40 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| header city（40 条） | - | String(getHeaderDate(0).city)..String(getHeaderDate(4).airTips)（`testReq0406`..`testReq0445`） | 逐条按冻结基线断言，首条 result = "北京"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## ReqHours0001 套件（`ReqHours0001.test.ets`，75 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| hours city（9 条） | - | getHoursData(0)[0]..getHoursData(0)[8]（`testReq0176`..`testReq0184`） | 逐条按冻结基线断言，首条 result.degree = "30°"；result.date = "09:00" 等 5 条 | 是 | 通过 |
| sunset row city=0 | - | getHoursData(0)[9] | result.degree = "日落"；result.date = "17:32" 等 5 条 | 是 | 通过 |
| hours city（25 条） | - | getHoursData(0)[10]..getHoursData(1)[9]（`testReq0186`..`testReq0210`） | 逐条按冻结基线断言，首条 result.degree = "29°"；result.date = "18:00" 等 5 条 | 是 | 通过 |
| sunset row city=1 | - | getHoursData(1)[10] | result.degree = "日落"；result.date = "17:32" 等 5 条 | 是 | 通过 |
| hours city（24 条） | - | getHoursData(1)[11]..getHoursData(2)[9]（`testReq0212`..`testReq0235`） | 逐条按冻结基线断言，首条 result.degree = "29°"；result.date = "18:00" 等 5 条 | 是 | 通过 |
| sunset row city=2 | - | getHoursData(2)[10] | result.degree = "日落"；result.date = "17:32" 等 5 条 | 是 | 通过 |
| hours city（14 条） | - | getHoursData(2)[11]..getHoursData(2)[24]（`testReq0237`..`testReq0250`） | 逐条按冻结基线断言，首条 result.degree = "29°"；result.date = "18:00" 等 5 条 | 是 | 通过 |

## ReqHours0002 套件（`ReqHours0002.test.ets`，50 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| hours city（10 条） | - | getHoursData(3)[0]..getHoursData(3)[9]（`testReq0251`..`testReq0260`） | 逐条按冻结基线断言，首条 result.degree = "29°"；result.date = "08:00" 等 5 条 | 是 | 通过 |
| sunset row city=3 | - | getHoursData(3)[10] | result.degree = "日落"；result.date = "17:32" 等 5 条 | 是 | 通过 |
| hours city（24 条） | - | getHoursData(3)[11]..getHoursData(4)[9]（`testReq0262`..`testReq0285`） | 逐条按冻结基线断言，首条 result.degree = "29°"；result.date = "18:00" 等 5 条 | 是 | 通过 |
| sunset row city=4 | - | getHoursData(4)[10] | result.degree = "日落"；result.date = "17:32" 等 5 条 | 是 | 通过 |
| hours city（14 条） | - | getHoursData(4)[11]..getHoursData(4)[24]（`testReq0287`..`testReq0300`） | 逐条按冻结基线断言，首条 result.degree = "27°"；result.date = "18:00" 等 5 条 | 是 | 通过 |

## ReqLife0001 套件（`ReqLife0001.test.ets`，40 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| life city（40 条） | - | getLifeData(0)[0]..getLifeData(4)[7]（`testReq0366`..`testReq0405`） | 逐条按冻结基线断言，首条 result.desc = "湿度"；result.value = "42%" 等 3 条 | 是 | 通过 |

## ReqSide0001 套件（`ReqSide0001.test.ets`，60 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| getSideBg 晴 | - | resName(getSideBg('晴')) | result = "weather_fine"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 多云 | - | resName(getSideBg('多云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阴 | - | resName(getSideBg('阴')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 小雨 | - | resName(getSideBg('小雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 中雨 | - | resName(getSideBg('中雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 大雨 | - | resName(getSideBg('大雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雷阵雨 | - | resName(getSideBg('雷阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阵雨 | - | resName(getSideBg('阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雨夹雪 | - | resName(getSideBg('雨夹雪')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 冻雨 | - | resName(getSideBg('冻雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 暴雨 | - | resName(getSideBg('暴雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 大暴雨 | - | resName(getSideBg('大暴雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 特大暴雨 | - | resName(getSideBg('特大暴雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 局部阵雨 | - | resName(getSideBg('局部阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阵雪 | - | resName(getSideBg('阵雪')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 小雪 | - | resName(getSideBg('小雪')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 中雪 | - | resName(getSideBg('中雪')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 大雪 | - | resName(getSideBg('大雪')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雾 | - | resName(getSideBg('雾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 霾 | - | resName(getSideBg('霾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 扬沙 | - | resName(getSideBg('扬沙')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 浮尘 | - | resName(getSideBg('浮尘')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 沙尘暴 | - | resName(getSideBg('沙尘暴')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 强沙尘暴 | - | resName(getSideBg('强沙尘暴')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 晴间多云 | - | resName(getSideBg('晴间多云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阴转多云 | - | resName(getSideBg('阴转多云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 多云转阴 | - | resName(getSideBg('多云转阴')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 小雨转中雨 | - | resName(getSideBg('小雨转中雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 中雨转大雨 | - | resName(getSideBg('中雨转大雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 夜间雷阵雨 | - | resName(getSideBg('夜间雷阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 傍晚阵雨 | - | resName(getSideBg('傍晚阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 午后雷阵雨 | - | resName(getSideBg('午后雷阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 清晨雾 | - | resName(getSideBg('清晨雾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 重度霾 | - | resName(getSideBg('重度霾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 轻度霾 | - | resName(getSideBg('轻度霾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 晴转小雨 | - | resName(getSideBg('晴转小雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阴转中雨 | - | resName(getSideBg('阴转中雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雷阵雨伴冰雹 | - | resName(getSideBg('雷阵雨伴冰雹')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 零星小雨 | - | resName(getSideBg('零星小雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 毛毛雨 | - | resName(getSideBg('毛毛雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雨夹雪转小雪 | - | resName(getSideBg('雨夹雪转小雪')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 高云 | - | resName(getSideBg('高云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 低云 | - | resName(getSideBg('低云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 积雨云 | - | resName(getSideBg('积雨云')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 薄雾 | - | resName(getSideBg('薄雾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 薄云 | - | resName(getSideBg('薄云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 浓雾 | - | resName(getSideBg('浓雾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 浓霾 | - | resName(getSideBg('浓霾')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 微雨 | - | resName(getSideBg('微雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 冻雷雨 | - | resName(getSideBg('冻雷雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 夜雨 | - | resName(getSideBg('夜雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 晨雨 | - | resName(getSideBg('晨雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 斜雨 | - | resName(getSideBg('斜雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 雷暴雨 | - | resName(getSideBg('雷暴雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阵性雨 | - | resName(getSideBg('阵性雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 晴间阵雨 | - | resName(getSideBg('晴间阵雨')) | result = "weather_rain"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 阴间多云 | - | resName(getSideBg('阴间多云')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 多云间晴 | - | resName(getSideBg('多云间晴')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 极端大风 | - | resName(getSideBg('极端大风')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| getSideBg 晴有微风 | - | resName(getSideBg('晴有微风')) | result = "weather_yin"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## ReqWeek0001 套件（`ReqWeek0001.test.ets`，35 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| week city（35 条） | - | getWeekWeatherData(0)[0]..getWeekWeatherData(4)[6]（`testReq0301`..`testReq0335`） | 逐条按冻结基线断言，首条 result.week = "星期四"；result.weather = "阴" 等 4 条 | 是 | 通过 |

## StyleCat0001 套件（`StyleCat0001.test.ets`，16 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Style.CARD_HEIGHT string concat | - | 'v:' + Style.CARD_HEIGHT | result = "v:192"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.WEATHER_ITEM_WIDTH string concat | - | 'v:' + Style.WEATHER_ITEM_WIDTH | result = "v:80"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_PADDING string concat | - | 'v:' + Style.NORMAL_PADDING | result = "v:14"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_MARGIN string concat | - | 'v:' + Style.NORMAL_MARGIN | result = "v:14"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_SPACE string concat | - | 'v:' + Style.NORMAL_SPACE | result = "v:12"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.GRID_GUTTER string concat | - | 'v:' + Style.GRID_GUTTER | result = "v:12"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_RADIUS string concat | - | 'v:' + Style.NORMAL_RADIUS | result = "v:16"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.CITY_TEXT_RADIUS string concat | - | 'v:' + Style.CITY_TEXT_RADIUS | result = "v:18"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.ADD_CITY_BOTTOM string concat | - | 'v:' + Style.ADD_CITY_BOTTOM | result = "v:6"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.ADD_CITY_BOTTOM_LG string concat | - | 'v:' + Style.ADD_CITY_BOTTOM_LG | result = "v:28"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.CARD_BACKGROUND_COLOR string concat | - | 'v:' + Style.CARD_BACKGROUND_COLOR | result = "v:#24FFFFFF"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.DIALOG_PADDING_OUT string concat | - | 'v:' + Style.DIALOG_PADDING_OUT | result = "v:42"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.DIALOG_PADDING string concat | - | 'v:' + Style.DIALOG_PADDING | result = "v:24"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.BIG_FONT_WEIGHT string concat | - | 'v:' + Style.BIG_FONT_WEIGHT | result = "v:300"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.TIME_LIST_HEIGHT string concat | - | 'v:' + Style.TIME_LIST_HEIGHT | result = "v:48"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.TIME_LIST_MARGIN string concat | - | 'v:' + Style.TIME_LIST_MARGIN | result = "v:22"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## StyleRel0001 套件（`StyleRel0001.test.ets`，8 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| relation Style.DIALOG_PADDING + Style.DIALOG_PADDING_OUT | - | String(Style.DIALOG_PADDING + Style.DIALOG_PADDING_OUT) | result = "66"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.NORMAL_PADDING + Style.NORMAL_MARGIN | - | String(Style.NORMAL_PADDING + Style.NORMAL_MARGIN) | result = "28"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.NORMAL_SPACE + Style.GRID_GUTTER | - | String(Style.NORMAL_SPACE + Style.GRID_GUTTER) | result = "24"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.CARD_HEIGHT - Style.TIME_LIST_HEIGHT | - | String(Style.CARD_HEIGHT - Style.TIME_LIST_HEIGHT) | result = "144"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.WEATHER_ITEM_WIDTH * 2 | - | String(Style.WEATHER_ITEM_WIDTH * 2) | result = "160"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.CITY_TEXT_RADIUS - Style.NORMAL_RADIUS | - | String(Style.CITY_TEXT_RADIUS - Style.NORMAL_RADIUS) | result = "2"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.BIG_FONT_WEIGHT / 100 | - | String(Style.BIG_FONT_WEIGHT / 100) | result = "3"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| relation Style.ADD_CITY_BOTTOM_LG - Style.ADD_CITY_BOTTOM | - | String(Style.ADD_CITY_BOTTOM_LG - Style.ADD_CITY_BOTTOM) | result = "22"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## StyleVal0001 套件（`StyleVal0001.test.ets`，16 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| Style.CARD_HEIGHT frozen value | - | String(Style.CARD_HEIGHT) | result = "192"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.WEATHER_ITEM_WIDTH frozen value | - | String(Style.WEATHER_ITEM_WIDTH) | result = "80"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_PADDING frozen value | - | String(Style.NORMAL_PADDING) | result = "14"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_MARGIN frozen value | - | String(Style.NORMAL_MARGIN) | result = "14"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_SPACE frozen value | - | String(Style.NORMAL_SPACE) | result = "12"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.GRID_GUTTER frozen value | - | String(Style.GRID_GUTTER) | result = "12"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.NORMAL_RADIUS frozen value | - | String(Style.NORMAL_RADIUS) | result = "16"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.CITY_TEXT_RADIUS frozen value | - | String(Style.CITY_TEXT_RADIUS) | result = "18"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.ADD_CITY_BOTTOM frozen value | - | String(Style.ADD_CITY_BOTTOM) | result = "6"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.ADD_CITY_BOTTOM_LG frozen value | - | String(Style.ADD_CITY_BOTTOM_LG) | result = "28"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.CARD_BACKGROUND_COLOR frozen value | - | String(Style.CARD_BACKGROUND_COLOR) | result = "#24FFFFFF"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.DIALOG_PADDING_OUT frozen value | - | String(Style.DIALOG_PADDING_OUT) | result = "42"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.DIALOG_PADDING frozen value | - | String(Style.DIALOG_PADDING) | result = "24"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.BIG_FONT_WEIGHT frozen value | - | String(Style.BIG_FONT_WEIGHT) | result = "300"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.TIME_LIST_HEIGHT frozen value | - | String(Style.TIME_LIST_HEIGHT) | result = "48"；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Style.TIME_LIST_MARGIN frozen value | - | String(Style.TIME_LIST_MARGIN) | result = "22"；result.length > 0 为真 等 3 条 | 是 | 通过 |

## UiAddCity0001 套件（`UiAddCity0001.test.ets`，5 条）

UI 探针：添加城市页的组件类型与文本快照。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| hot city text 北京 answers UI query without crash | - | probeComponentTypeByText('北京') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| hot city text 上海 probe is crash-free | - | probeComponentTypeByText('上海') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| hot city text 深圳 probe is crash-free | - | probeComponentTypeByText('深圳') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| section title text 热门城市 probe is crash-free | - | probeComponentTypeByText('热门城市') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Text type multi-match probe is crash-free | - | probeComponentsByType('Text') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |

## UiCityList0001 套件（`UiCityList0001.test.ets`，5 条）

UI 探针：城市管理页的组件类型与元素快照。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| addCity entry node answers UI query without crash | - | probeComponentType('addCity') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| addCity bounds probe stays a well-formed snapshot | - | probeComponentBounds('addCity') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| addCity multi-match count probe is crash-free | - | probeComponentsById('addCity') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| ListItem type multi-match probe is crash-free | - | probeComponentsByType('ListItem') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| generic On selector bounds probe is crash-free | - | probeComponentBoundsByOn(ON.id('addCity')) | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |

## UiHome0001 套件（`UiHome0001.test.ets`，6 条）

UI 探针：首页 Swiper 与内容节点的类型、边界快照。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| home swiper node answers UI query without crash | - | probeComponentType('swiper') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| homeContent0 node type probe is crash-free | - | probeComponentType('homeContent0') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| homeContent1 node type probe is crash-free | - | probeComponentType('homeContent1') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| swiper bounds probe stays a well-formed snapshot | - | probeComponentBounds('swiper') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| homeContent0 multi-match count probe is crash-free | - | probeComponentsById('homeContent0') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| Swiper type multi-match probe is crash-free | - | probeComponentsByType('Swiper') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |

## UiTitleBar0001 套件（`UiTitleBar0001.test.ets`，6 条）

UI 探针：首页标题栏与菜单按钮的组件快照。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| menu0 node answers UI query without crash | - | probeComponentType('menu0') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| menu1 node type probe is crash-free | - | probeComponentType('menu1') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| iconSubarea node type probe is crash-free | - | probeComponentType('iconSubarea') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| iconSubarea bounds probe stays a well-formed snapshot | - | probeComponentBounds('iconSubarea') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| menuPopup node type probe is crash-free | - | probeComponentType('menuPopup') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| menu0 multi-match count probe is crash-free | - | probeComponentsById('menu0') | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |

## UiWindow0001 套件（`UiWindow0001.test.ets`，6 条）

UI 探针：窗口尺寸、断点与布局信息快照。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| display size snapshot is stable across two queries | - | probeDisplaySize() | typeof first = 'string'；first = second 等 3 条 | 是 | 通过 |
| display size probe answers without crash | - | probeDisplaySize() | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| active window mode probe answers without crash | - | probeActiveWindowMode() | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| active window mode snapshot is stable across two queries | - | probeActiveWindowMode() | typeof first = 'string'；first = second 等 3 条 | 是 | 通过 |
| active window bounds probe answers without crash | - | probeActiveWindowBounds() | typeof result = 'string'；result.length > 0 为真 等 3 条 | 是 | 通过 |
| active window bounds snapshot is stable across two queries | - | probeActiveWindowBounds() | typeof first = 'string'；first = second 等 3 条 | 是 | 通过 |

## 运行与验证

构建（模块级 ohosTest HAP）。`build-profile.json5` 的 `compileSdkVersion` / `compatibleSdkVersion` 为字符串
`"26.0.0"`（API 26 起 hvigor 强制要求字符串形态），`signingConfigs` 留空、`products[0].signingConfig` 指向
`default`，属 Sample 仓库惯例（由 IDE 或 `hap-sign-tool` 在构建后补签名），因此 CLI 直接产出的产物为 unsigned。

方式一：IDE 构建。在 IDE 中执行 `Build > Build Hap(s)/APP(s) > Build Hap(s)`，构建目标选择 module `default` 的
`ohosTest`。

方式二：`devecocli`（CI 与脚本化场景，本工程实测方式，使用 DevEco Studio 内置 hvigor，无需联网拉取依赖）：

```shell
devecocli build --modules default@ohosTest
```

方式三：工程根目录自带的 `hvigorw` / `hvigorw.bat`（wrapper 首次运行会先安装 hvigor，需可访问 npm 源）：

```shell
# Windows
hvigorw.bat --mode module -p module=default@ohosTest assembleHap --no-daemon
# Linux / macOS
./hvigorw --mode module -p module=default@ohosTest assembleHap --no-daemon
```

```text
# 产物：product/default/build/default/outputs/ohosTest/default-ohosTest-unsigned.hap
```

真机只能安装签名后的 HAP（直接安装 unsigned 产物会报 `code:9568320 error: no signature file`）：

- 在 IDE 中 `File > Project Structure > Signing Configs` 勾选自动签名，构建即产出已签名 HAP；
- 或在 CI 中用 SDK 自带材料手工签名：`toolchains/lib` 下的 `hap-sign-tool.jar` + `OpenHarmony.p12`、
  `OpenHarmonyProfileRelease.pem`、`UnsgnedReleasedProfileTemplate.json`，依次执行 `generate-app-cert`
  （生成 `app-cert-chain.cer`）、`sign-profile`（生成 `.p7b`）、`sign-app -inForm zip`（产出
  `default-ohosTest-signed.hap`）。注意 profile 的 `bundle-name` 必须是 `ohos.samples.weather`；
  若设备上已装过其它签名的同包名应用，需先 `hdc uninstall ohos.samples.weather` 再安装。

```shell
hdc install product/default/build/default/outputs/ohosTest/default-ohosTest-signed.hap
```

单进程整跑 2445 条用例会触发 App died，按下表分 9 批执行（每批 ≤8 个套件 / ≤350 条用例）：

| 批次 | `-s class` 套件清单 | 套件数 | 用例数 |
|---|---|---|---|
| 1 | AbilityTest、CanvasMoon0001、CanvasReal01、CanvasReal02、CanvasRound0001、CanvasSun0001、CityAdd0001、CityList0001 | 8 | 235 |
| 2 | CityRaw0001、CityReal01、DsLoop0001、DsReal01、DsReal02、DsSnap0001、DsSnap0002、FdateFill0002 | 8 | 311 |
| 3 | FdateFill0001、FdateMday0001、FdateMday0002、FdateMday0003 | 4 | 340 |
| 4 | FdateMday0004、FdateMday0005、FdateMday0006、FdateMday0007 | 4 | 340 |
| 5 | FdateMday0008、FdateMday0009、FdateReal01、FdateReal02、FdateSlot0001、LoggerReal01、MockAqi0001、MockDay0001 | 8 | 263 |
| 6 | MockHour0001、MockHour0002、MockIndex0001、MockReal01、MockTop0001、ModelReal01、ModelSnap0001 | 7 | 312 |
| 7 | ModelSnap0002、ModelSnap0003、ReqAir0001、ReqBg0001、ReqHeader0001、ReqHours0001 | 6 | 320 |
| 8 | ReqHours0002、ReqLife0001、ReqReal01、ReqReal02、ReqSide0001、ReqWeek0001、StyleCat0001、StyleReal01 | 8 | 272 |
| 9 | StyleRel0001、StyleVal0001、UiAddCity0001、UiCityList0001、UiHome0001、UiTitleBar0001、UiWindow0001 | 7 | 52 |
| **合计** | - | **60** | **2445** |

逐批命令示例（第 1 批的第 1 个套件）：

> 执行前置条件：UI 探针用例通过 `@kit.TestKit` 的 `Driver.create()` 连接 AAMS，执行前需保证设备处于解锁状态、
> 无系统弹窗（如“USB 连接方式”）或其它应用占据顶层窗口；若出现 `Can not connect to AAMS,
> RET_ERR_CONNECTION_EXIST`，重启设备后重跑即可。

## 测试结果

| 检查项 | 结果 |
|---|---|
| 构建 `default@ohosTest` | `BUILD SUCCESSFUL` |
| 套件注册 | 60 个套件全部在 `List.test.ets` 中 import 并在 `testsuite()` 内调用 |
| 用例规模 | 2445 条，与本文件各套件表格逐行一致（未增未删） |
| 真机运行 | 2445 条通过 / 0 条失败 / 0 条错误 |
| 结论 | **2445 条用例全部通过** |

设备与执行参数：OpenHarmony-7.1.0.21（API 26），设备类型 default，真机 `d629034339413535311028a580d3ab00`，2026-11-19，`ohos.samples.weather` + `entry_test` + `OpenHarmonyTestRunner`。

| 参数 | 取值 | 运行时选项 |
|---|---|---|
| 应用包名 | `ohos.samples.weather` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单批超时（毫秒） | `60000` | `-s timeout` |

9 批 `Tests run` 分别为 235 / 311 / 340 / 340 / 263 / 312 / 320 / 272 / 52，合计 Pass=2445、Failure=0、Error=0。只跑指定套件时，在上表基础上追加 `-s class <套件名或 Suite#method，逗号分隔>`。
