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

`List.test.ets` 共注册 **24 个套件、1,560 条用例、约 22,000 行测试代码**。

| 分类 | 套件 | 用例数 | 验证点 |
|---|---|---:|---|
| Validation | `DateTimeFillMatrixPart1..4` | 300 | `fill(0..299)` 补零规则 |
| Validation | `DateTimeConcatDateMatrixPart1..4` | 300 | 300 组不同年月日拼接 |
| Validation | `DateTimeConcatTimeMatrixPart1..4` | 300 | 300 组不同时分秒六位拼接 |
| Validation | `DateTimeCountdownMatrixPart1..4` | 300 | 300 个不同秒数 → `mm:ss` |
| Security | `DateTimeBoundaryPart1` | 76 | 负数/0/小数/NaN/Infinity/极大值边界 |
| Performance | `DateTimePerfPart1` | 13 | fill/concat/countdown/getTime/getDate 的宽松耗时上界与均值 |
| Stability | `DateTimeStabilityPart1` | 30 | 各函数 50 次重复调用结果稳定 |
| Integration | `DateTimeIntegrationPart1..2` | 100 | 小时回绕一致性、`dateTime` 与 `fill` 的时分组合一致性 |
| Compatibility | `ResolutionCompatibilityPart1` | 80 | 常用分辨率、横竖屏、极值、实例独立 |
| I18n | `LoggerI18nPart1` | 60 | 4 个日志级别 × 15 组中英文/emoji/长文本输入 |
| 冒烟 | `ActsAbilityTest` | 1 | 应用启动 |

- 用例元数据：`@tc.number` = 序号 × 100（如 `..._0100`），`@tc.name` = 4 位序号；`it` 名与 `@tc.name` 一致。
- 每条用例输出 begin/end 日志；DOMAIN `0xF811`，TAG `[Sample_AVRecorder]`。
- 注：页面 `AudioRecorder`/`VideoRecorder`/`CameraService` 依赖 `libentry.so`，本次自动化只覆盖不依赖原生库的纯 TS 逻辑。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令；涉及录音/录像按钮的 UI 用例需在 arm64 设备上运行。
