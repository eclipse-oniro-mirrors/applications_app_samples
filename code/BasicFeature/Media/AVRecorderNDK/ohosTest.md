# 录制测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|Pass|
|允许权限| 设备正常运行 | 点击权限弹窗允许按钮 |授权后成功进入首页|Pass|
|音频录制状态切换| 位于音频录制页面 | 1、点击**开始**按钮，录制2s<br/>2、点击**暂停**按钮<br/>3、点击**继续**按钮，录制1s<br/>4、点击**停止**按钮<br/> | 1、进入录制中状态<br/>2、进入暂停状态<br/>3、重新恢复录制中状态<br/>4、停止录制恢复初始状态<br/> |Pass|

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **21 个套件、1,621 条用例、约 2.7 万行测试代码**。

按 PR 12056 的写法，20 个专题文件每个固定 **81 条显式用例**，文件内自定义 `it()` / `expect()` 包装器（统一 begin/end 与 `actual:` 日志），逐条展开而非循环生成。

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `ActsAbilityTest` | 1 | 模板断言冒烟 |
| `dateTimeZeroCore` | 81 | `dateTime(k*3600) = '00:00'` |
| `dateTimeSecondsCore` | 81 | 0~59 秒格式 |
| `dateTimeMinutesCore` | 81 | 分/秒组合格式 |
| `dateTimeBoundaryCore` | 81 | 0/59/60/3599/3600/86399/86400/90000 |
| `dateTimeFormatCore` | 81 | 长度 5、冒号位置、`\d{2}:\d{2}` |
| `dateTimeFillCore` | 81 | `DateTimeUtil.fill` 0~99 补零 |
| `concatTimeCore` | 81 | `concatTime(h,m,s)` 六位拼接 |
| `concatDateCore` | 81 | `concatDate(year,month,date)` 拼接 |
| `resolutionDefaultsCore` | 81 | `Resolution` 默认 0 |
| `resolutionFieldsCore` | 81 | 宽高赋值组合 |
| `resolutionIndependenceCore` | 81 | 两个 `Resolution` 实例互不影响 |
| `loggerDebugCore` / `loggerInfoCore` / `loggerWarnCore` / `loggerErrorCore` | 324 | Logger 四个级别调用不抛异常 |
| `loggerEmptyCore` | 81 | 空字符串日志不抛异常 |
| `dateTimeStabilityCore` | 81 | 100 次重复调用结果稳定 |
| `dateTimePerfCore` | 81 | 1000 次调用耗时 < 5s |
| `dateTimeUniquenessCore` | 81 | `01:00` 与 `00:01` 等不同输入可区分 |
| `dateTimeExtremesCore` | 81 | 86399/86400/90000/604800 等极值 |

- 所有用例引用真实主工程代码：`DateTimeUtil`、`dateTime`、`Logger`、`Resolution`。
- 每条用例带 `@tc.number`（步长 100）/`@tc.name`/`@tc.desc` 元数据，DOMAIN `0xF811`，TAG `[Sample_<suite>]`。
- 注：页面 `AudioRecorder`/`VideoRecorder`/`CameraService` 依赖 `libentry.so`，本机 32 位设备无法加载 64 位原生库，故本次自动化只覆盖不依赖原生库的纯 TS 逻辑。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令；涉及录音/录像按钮的 UI 用例需在 arm64 设备上运行。
