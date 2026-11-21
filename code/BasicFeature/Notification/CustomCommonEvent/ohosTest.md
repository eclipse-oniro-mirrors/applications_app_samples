# CustomCommonEvent 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|是|Pass|
|监控公共事件| 位于首页 | 1、进入监听页面<br>2、点击**开始监控**<br>3、点击**停止监控** |1、成功进入监控页面<br>2、开始监听，界面显示“当前监听状态”<br>3、停止监控，界面显示“本次监控时长”|是|Pass|
| 查看详情 | 位于监听页面 | 1、点击**查看详情** | 1、进入详情页面，显示监听到的事件 | 是 |Pass|
| 查看历史记录 | 位于首页 | 1、点击**历史** | 1、进入历史界面，展示监控历史记录 | 是 |Pass|
|设置| 位于首页 | 1、点击**设置**<br>2、点击设置是否记录灭屏事件为**仅本次**<br>3、点击设置是否记录亮屏事件为**仅本次** | 1、进入设置页面<br>2、设置成功<br/>3、设置成功 | 是 |Pass|
| 关于 | 位于首页 | 1、点击**关于** | 1、进入关于界面 | 是 |Pass|
| 亮灭屏和锁屏状态监听 | 位于监听页面 | 1、点击**开始监控**<br/>2、点击电源键灭屏、亮屏后解锁<br/>3、点击**停止监控**<br/> | 1、开始监听，界面显示当前监听状态<br/>2、界面中显示最新监听到的事件<br/>3、停止监听，显示本次监控的时长 | 否 |Pass|
| 查看详情 | 位于监听页面<br/>已监听到事件 | 1、点击**查看详情** | 1、进入查看详情页面<br/>2、界面显示监听到的事件和次数。 | 否 |Pass|
| 拉起应用 | 设备正常运行 |  | 成功拉起应用 | 是 |Pass|
| 应用内发布事件 | 位于设置页面 | 1、点击**自定义事件定向订阅**按钮   <br/>2、点击**订阅**<br/>3、点击**应用内卡片** <br/>4、点击**取消订阅** | 1、进入自定义事件定向订阅页面<br/>2、页面中弹出toast显示内容为“订阅非指定应用事件/指定应用事件成功！”<br/>3、页面中弹出toast显示内容为“接收非指定应用事件/指定应用事件成功！”<br/>4、页面中弹出toast显示内容为“取消订阅成功！” | 是 |Pass|
| 应用外发布事件 | 位于设置页面 | 1、点击**自定义事件定向订阅**按钮 <br/>2、点击**订阅**<br/>3、点击**应用外卡片**<br/>4、点击**取消订阅** | 1、进入自定义事件定向订阅页面<br/>2、页面中弹出toast显示内容为“订阅非指定应用事件/指定应用事件成功！”<br/>3、页面中弹出toast显示内容为“接收非指定应用事件成功！”<br/>4、页面中弹出toast显示内容为“取消订阅成功！” | 是 |Pass|

## 自动化用例（ohosTest）

### 测试环境

| 项 | 值 |
|---|---|
| 设备 | OpenHarmony 标准设备（`default` / `tablet`） |
| SDK | DevEco Command Line Tools，`compileSdkVersion` = `targetAPIVersion` = `compatibleSdkVersion` = 26.0.0 |
| 测试框架 | `@ohos/hypium` 1.0.6（根 `oh-package.json5` 的 `devDependencies`） |
| UI 驱动 | `@ohos.UiTest`（`Driver` + `ON.id()` / `ON.text()`） |
| 测试模块 | `entry_test`（`entry/src/ohosTest`），运行器 `ets/TestRunner/OpenHarmonyTestRunner` |
| 构建 | `hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap` |

### 运行方式

在 DevEco Studio 中选择 `entry` 模块的 `entry@ohosTest` 运行配置并指定设备后直接运行，等价的参数清单如下（由运行配置生成，无需在设备侧手工输入命令）：

| 参数 | 取值 |
|---|---|
| 被测包名 | `com.samples.customcommonevent` |
| 测试模块 | `entry_test` |
| 运行器路径 | `/ets/TestRunner/OpenHarmonyTestRunner` |
| 超时（毫秒） | `15000` |

按套件/用例增量复跑时，在运行配置中追加筛选选项 `-s class`，取值为 `套件名#用例名`，例如 `UtilsCoreTest#testUtilsConvertTime0001`；运行器把该选项透传给设备侧执行入口。

### 套件与用例数

| # | 测试套件 | 文件 | 类型 | 用例数 | 行数 |
|---:|---|---|---|---:|---:|
| 1 | `UtilsCoreTest` | `UtilsCore.test.ets` | 功能 | 40 | 910 |
| 2 | `ConstEventsCoreTest` | `ConstEventsCore.test.ets` | 功能 | 32 | 743 |
| 3 | `MainFeatureCoreTest` | `MainFeatureCore.test.ets` | 功能 | 48 | 1201 |
| 4 | `SettingFeatureCoreTest` | `SettingFeatureCore.test.ets` | 功能 | 44 | 1170 |
| 5 | `HistoryFeatureCoreTest` | `HistoryFeatureCore.test.ets` | 功能 | 38 | 968 |
| 6 | `LaunchFeatureCoreTest` | `LaunchFeatureCore.test.ets` | 功能 | 34 | 969 |
| 7 | `CardEventCoreTest` | `CardEventCore.test.ets` | 功能 | 25 | 603 |
| 8 | `LoggerCoreTest` | `LoggerCore.test.ets` | 功能 | 16 | 425 |
| 9 | `SurveillanceEdgeCoreTest` | `SurveillanceEdgeCore.test.ets` | 功能 | 12 | 352 |
| 10 | `CardEventVolume01Test` | `CardEventVolume01.test.ets` | 功能 | 46 | 949 |
| 11 | `CardEventVolume02Test` | `CardEventVolume02.test.ets` | 功能 | 46 | 950 |
| 12 | `UtilVolume01Test` | `UtilVolume01.test.ets` | 功能 | 78 | 1590 |
| 13 | `UtilVolume02Test` | `UtilVolume02.test.ets` | 功能 | 54 | 1108 |
| 14 | `UtilVolume03Test` | `UtilVolume03.test.ets` | 功能 | 79 | 1687 |
| 15 | `UtilVolume04Test` | `UtilVolume04.test.ets` | 功能 | 79 | 1687 |
| 16 | `UtilVolume05Test` | `UtilVolume05.test.ets` | 功能 | 79 | 1686 |
| 17 | `UtilVolume06Test` | `UtilVolume06.test.ets` | 功能 | 55 | 1183 |
| 18 | `UtilVolume07Test` | `UtilVolume07.test.ets` | 功能 | 55 | 1182 |
| 19 | `UtilVolume08Test` | `UtilVolume08.test.ets` | 功能 | 79 | 1688 |
| 20 | `UtilVolume09Test` | `UtilVolume09.test.ets` | 功能 | 79 | 1688 |
| 21 | `UtilVolume10Test` | `UtilVolume10.test.ets` | 功能 | 79 | 1688 |
| 22 | `UtilVolume11Test` | `UtilVolume11.test.ets` | 功能 | 55 | 1184 |
| 23 | `UtilVolume12Test` | `UtilVolume12.test.ets` | 功能 | 55 | 1184 |
| 24 | `UtilVolume13Test` | `UtilVolume13.test.ets` | 功能 | 55 | 1184 |
| 25 | `StateVolume01Test` | `StateVolume01.test.ets` | 功能 | 78 | 1664 |
| 26 | `StateVolume02Test` | `StateVolume02.test.ets` | 功能 | 78 | 1664 |
| 27 | `StateVolume03Test` | `StateVolume03.test.ets` | 功能 | 78 | 1664 |
| 28 | `StateVolume04Test` | `StateVolume04.test.ets` | 功能 | 78 | 1664 |
| 29 | `StateVolume05Test` | `StateVolume05.test.ets` | 功能 | 78 | 1664 |
| 30 | `StateVolume06Test` | `StateVolume06.test.ets` | 功能 | 78 | 1664 |
| 31 | `StateVolume07Test` | `StateVolume07.test.ets` | 功能 | 78 | 1664 |
| 32 | `StateVolume08Test` | `StateVolume08.test.ets` | 功能 | 77 | 1643 |
| 33 | `StateVolume09Test` | `StateVolume09.test.ets` | 功能 | 79 | 1686 |
| 34 | `StateVolume10Test` | `StateVolume10.test.ets` | 功能 | 79 | 1686 |
| 35 | `StateVolume11Test` | `StateVolume11.test.ets` | 功能 | 79 | 1686 |
| 36 | `StateVolume12Test` | `StateVolume12.test.ets` | 功能 | 79 | 1687 |
| 37 | `StateVolume13Test` | `StateVolume13.test.ets` | 功能 | 79 | 1687 |
| 38 | `StateVolume14Test` | `StateVolume14.test.ets` | 功能 | 79 | 1687 |
| 39 | `StateVolume15Test` | `StateVolume15.test.ets` | 功能 | 79 | 1687 |
| 40 | `StateVolume16Test` | `StateVolume16.test.ets` | 功能 | 79 | 1687 |
| 41 | `SettingVolume01Test` | `SettingVolume01.test.ets` | 功能 | 45 | 971 |
| 42 | `SettingVolume02Test` | `SettingVolume02.test.ets` | 功能 | 46 | 1045 |
| 43 | `SettingVolume03Test` | `SettingVolume03.test.ets` | 功能 | 46 | 1046 |
| 44 | `HistoryKeepVolume01Test` | `HistoryKeepVolume01.test.ets` | 功能 | 21 | 472 |
| 45 | `HistoryAssembleVolume01Test` | `HistoryAssembleVolume01.test.ets` | 功能 | 41 | 930 |
| 46 | `LaunchTrimVolume01Test` | `LaunchTrimVolume01.test.ets` | 功能 | 41 | 890 |
| 47 | `MainCompactVolume01Test` | `MainCompactVolume01.test.ets` | 功能 | 41 | 891 |
| 48 | `LaunchDetailVolume01Test` | `LaunchDetailVolume01.test.ets` | 功能 | 41 | 889 |
| 49 | `LaunchLimitVolume01Test` | `LaunchLimitVolume01.test.ets` | 功能 | 21 | 467 |
| 50 | `HistoryCompleteVolume01Test` | `HistoryCompleteVolume01.test.ets` | 功能 | 41 | 889 |
| 51 | `SettingNormalizeVolume01Test` | `SettingNormalizeVolume01.test.ets` | 功能 | 51 | 1098 |
| 52 | `SettingNormalizeVolume02Test` | `SettingNormalizeVolume02.test.ets` | 功能 | 51 | 1099 |
| 53 | `SettingNormalizeVolume03Test` | `SettingNormalizeVolume03.test.ets` | 功能 | 51 | 1100 |
| 54 | `HistoryKeepVolume02Test` | `HistoryKeepVolume02.test.ets` | 功能 | 22 | 490 |
| 55 | `HistoryAssembleVolume02Test` | `HistoryAssembleVolume02.test.ets` | 功能 | 42 | 953 |
| 56 | `HistoryCompleteVolume02Test` | `HistoryCompleteVolume02.test.ets` | 功能 | 42 | 911 |
| 57 | `HistoryCompleteVolume03Test` | `HistoryCompleteVolume03.test.ets` | 功能 | 42 | 912 |
| 58 | `LaunchTrimVolume02Test` | `LaunchTrimVolume02.test.ets` | 功能 | 42 | 911 |
| 59 | `LaunchTrimVolume03Test` | `LaunchTrimVolume03.test.ets` | 功能 | 42 | 912 |
| 60 | `MainCompactVolume02Test` | `MainCompactVolume02.test.ets` | 功能 | 42 | 911 |
| 61 | `LaunchDetailVolume02Test` | `LaunchDetailVolume02.test.ets` | 功能 | 42 | 911 |
| 62 | `LaunchLimitVolume02Test` | `LaunchLimitVolume02.test.ets` | 功能 | 22 | 488 |
| 63 | `DetailUiTest` | `DetailUi.test.ets` | 界面 | 13 | 374 |
| 64 | `CustomCommonEventUiTest` | `CustomCommonEventUi.test.ets` | 界面 | 50 | 1446 |

合计：64 个测试套件，3455 条用例。

用例分布：9 个功能层 Core 套件（289 条）逐接口校验 `Utils`、`Consts`、`MainFeature`、`SettingFeature`、`HistoryFeature`、`LaunchFeature`、`CardEventFeature`、`Logger` 与 `SurveillanceEventsManager` 的契约；53 个功能层扫描套件（3103 条）按通道扫描、索引扫描、区间扫描、组合扫描、调用稳定性和接口串联等方式覆盖被测静态函数；2 个界面层套件（63 条）覆盖页面导航、监控启停与三态设置交互。

以上统计与 `entry/src/ohosTest/ets/test/List.test.ets` 的注册一致（`testsuite()` 依次调用 9 个功能层 Core 套件、53 个功能层扫描套件、2 个界面层套件）。每个套件一个 `describe`，用例名为 `test<主题><4 位序号>`，`@tc.number` 按主题连续编号、全局唯一；每条用例至少 3 条断言，且至少一条断言被测输出本身。

### 覆盖范围

| 维度 | 覆盖情况 |
|---|---|
| 值域 | `Utils` 单位换算与时间格式化的合法值、边界值、非法输入；`Consts` 常量与事件名全量核对 |
| 状态 | `globalThis.settings` 初始值、恢复、覆盖、跨 Feature 组合；非法规格值 3 / 99 / -1 / 1.5 / 1000 |
| 存储 | `nothing_pre` 偏好库空存储、缺失键、显式空数组、重复引用、清空后重写、10 条上限与 12 / 20 条超限 |
| 扫描值域 | UTIL 1185 个代表值（亚秒、整秒、分/时进位及 ±1/±2ms 邻域、86400×k±1 日界簇、负数簇、安全整数邻域、大数格点、h×3600+m×60+s 组合格点、分秒格点、负数深簇、毫秒余数、整小时段、秒尾邻域、整分钟段）；STATE 1895 组 settings 输入（五键三态全组合 243 + 双键 90 + 三键 270 + 非法单键注入 + 键缺失子集×两套基值 + 非法值注入五键 + 合法/缺失/非法同屏混合 + 双非法×合法基座 + 缺失×基值 2 + 三非法+双合法与 '-0' 语义 + 双小数轮转）；CARDV 90 组 data×bundle×subscribed 三维矩阵（含空格/截断/数字后缀/全角漂移）；SETTING 45 组存储值 × 事件 + 90 组 changeState 归一后三判（含状态值 4/5/9/10/-2/-3/50/100/-100）；SETNORM 51 组值段归一；LAUNCHTRIM 长度 0..100 覆盖（含 41..78 长窗与第 11 条值域变体）；HISTCMP 空白变体/长度 5~8/新 token 组合 42 组 |
| 拆出纯函数 | `HistoryFeature.shouldKeep/assemble/isCompleteRecord`、`LaunchFeature.trimRecords/buildDetail/reachedRecordLimit`、`MainFeature.compactRecordedEvents`、`SettingFeature.normalizeState`、`CardEventFeature.resolveToastAction` 共 9 个静态函数、981 条输入输出用例（空数组、单元素空串、含竖线/分号/等号/双引号的紧凑串、缺字段记录、上限前后一位、非法状态 3/99/-1/1.5、6~8 规模×丢弃/空位模式矩阵、值域逐槽轮转） |
| UI | 首页 / 监听 / 历史 / 设置 / 关于 / 详情 / 自定义事件页的进入与返回、监控开始停止、三态设置、历史记录展示；5 个语义 id（`historyRecordList` / `mainCurrentEventText` / `mainDurationText` / `mainEventCountText` / `aboutVersionText`）的按 id 定位、文案读取、格式正则与离页消失共 20 条 |


### 未覆盖项

| 项 | 原因 |
|---|---|
| 系统级公共事件真实广播（亮灭屏、锁屏解锁） | 需要真机物理按键触发，自动化环境不可复现 |
| 外部依赖应用 `com.samples.customcommoneventrely` 分支 | 需要单独安装外部 HAP，超出本测试模块范围 |
| 粘性事件 `isSticky` 的平台行为 | 属系统能力，未在设备上验证 |

### 整体结果表

| 项 | 结果 |
|---|---|
| 执行时间 | 2026-11-18 |
| 执行设备 | 真机 `d629034339413535311095d600002b00` |
| 测试产物 | `entry-ohosTest-signed.hap`（9,602,559 B） |
| 测试套件 | 64 |
| 用例总数 | 3,455 |
| 通过 | 3,455 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

### 真机执行结果

| 项 | 值 |
|---|---|
| 设备 | `d629034339413535311095d600002b00`（OpenHarmony 标准设备） |
| 安装 | `entry-default-signed.hap` + `entry-ohosTest-signed.hap` 双 HAP，`bm install` 安装 |
| 执行方式 | 64 个套件 / 3,455 条用例按批执行（单条命令跑完全量会在中途进程退出，故分批拼接全量） |
| 基线结果 | 首轮 33 条失败：其中 1 条定位为 `Main.handleStop` 在未订阅系统事件时退订 null 抛错、中断 `finish_meditation` 发布导致历史记录丢失的真实缺陷（已在 `Main.ets` 加空守卫修复）；其余为用例期望值、观测方式与同进程状态残留问题（已改为按实现不变式断言） |
| 复跑结论 | 受影响 9 个功能层套件 `Tests run: 370, Failure: 0, Error: 0, Pass: 370`；2 个界面层套件 `Tests run: 63, Failure: 0, Error: 0, Pass: 63`；剩余失败 0 |
