# CapturerApplication 测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 成功拉起应用，显示首页 | 否 | 待执行 |
| 录音权限申请 | 初次进入应用 | 同意麦克风权限 | 进入录音页面，可开始录音 | 否 | 待执行 |
| 开始/停止录音 | 已授权 | 点击开始录音，再点击停止 | 生成录音文件，状态回到空闲 | 否 | 待执行 |
| 语音转文字 | 已授权 | 进入语音转文字页面并开始识别 | 页面显示识别文本 | 否 | 待执行 |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **24 个套件、1,497 条用例、约 23,000 行测试代码**。

| 分类 | 套件 | 用例数 | 验证点 |
|---|---|---:|---|
| Validation | `MediaByteLengthMatrixPart1..3` | 250 | 250 个不同字节长度 → 毫秒 |
| Validation | `MediaOffsetMatrixPart1..3` | 249 | 249 个不同毫秒 → 字节偏移 |
| Validation | `MediaRoundTripMatrixPart1..3` | 250 | 250 个不同毫秒的往返一致性 |
| Validation | `MediaCountdownMatrixPart1..3` | 250 | 250 个不同毫秒 → 倒计时文本 |
| Security | `MediaBoundaryPart1..2` | 103 | 负数/0/小数/NaN/Infinity/极大值 |
| Performance | `MediaPerfPart1` | 10 | 三类换算的耗时预算与均值 |
| Stability | `MediaStabilityPart1` | 30 | 各输入 50 次重复调用结果稳定 |
| Integration | `MediaIntegrationPart1..2` | 100 | 字节→毫秒→字节 往返 |
| Compatibility | `RecordingMetadataMatrixPart1..3` | 180 | 采样率×声道×格式×低时延组合 |
| Validation | `AudioEnumValuesPart1` | 34 | 5 个枚举全部成员 + `SECOND_BUFFER_WALK` |
| Validation | `SelectOptionContractPart1` | 40 | 4 组 KEY_MAP/OPTIONS 全量键值与一致性 |
| 冒烟 | `ActsAbilityTest` | 1 | 应用启动 |

- 用例元数据：`@tc.number` = 序号 × 100（如 `..._0100`），`@tc.name` = 4 位序号；`it` 名与 `@tc.name` 一致。
- 每条用例输出 begin/end 日志；DOMAIN `0xF811`，TAG `[Sample_CapturerApplication]`。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
