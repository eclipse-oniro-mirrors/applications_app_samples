# CapturerApplication 测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 成功拉起应用，显示首页 | 否 | 待执行 |
| 录音权限申请 | 首次进入应用 | 同意麦克风权限 | 进入录音页面，可开始录音 | 否 | 待执行 |
| 开始/停止录音 | 已授权 | 点击开始录音，再点击停止 | 生成录音文件，状态回到空闲 | 否 | 待执行 |
| 语音转文字 | 已授权 | 进入语音转文字页面并开始识别 | 页面显示识别文本 | 否 | 待执行 |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **21 个套件、1,621 条用例、约 2.9 万行测试代码**。

按 PR 12056 的写法，20 个专题文件每个固定 **81 条显式用例**，文件内自定义 `it()` / `expect()` 包装器（统一 begin/end 与 `actual:` 日志），逐条展开而非循环生成。

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `ActsAbilityTest` | 1 | 模板断言冒烟 |
| `audioSourceTypeCore` | 81 | `AudioSourceType` 8 个成员的取值与名称映射 |
| `audioSamplingRateCore` | 81 | `AudioSamplingRate` 9 个采样率取值 |
| `audioChannelCore` | 81 | `AudioChannel` MONO/STEREO/CHANNEL_3 |
| `audioSampleFormatCore` | 81 | `AudioSampleFormat` U8/S16LE/S24LE/S32LE/F32LE |
| `interruptHintTypeCore` | 81 | `InterruptHintType` 8 个提示类型 |
| `audioStateCore` | 81 | `AudioState` RUNNING~UNMUTED |
| `bufferWalkCore` | 81 | `SECOND_BUFFER_WALK=192000` 与帧/字节关系 |
| `recordingMetadataDefaultsCore` | 81 | `RecordingMetadata` 默认字段值 |
| `recordingMetadataStateCore` | 81 | 字段赋值、采样率/声道/格式组合、实例独立 |
| `samplingRateKeyMapCore` | 81 | `SAMPLING_RATE_KEY_MAP` 键值映射 |
| `channelKeyMapCore` | 81 | `CHANNEL_KEY_MAP` 键值映射与数量 |
| `sourceTypeKeyMapCore` | 81 | `SOURCE_TYPE_KEY_MAP` 8 个键值 |
| `sampleFormatKeyMapCore` | 81 | `SAMPLE_FORMAT_KEY_MAP` 5 个键值 |
| `samplingRateOptionsCore` | 81 | `SAMPLING_RATE_OPTIONS` 与 map 键一致 |
| `channelSourceOptionsCore` | 81 | 声道/音源选项与 map 一致 |
| `sampleFormatOptionsCore` | 81 | 采样格式选项与 map 一致 |
| `mediaToolsCountdownCore` | 81 | `MediaTools.msToCountdownTime` 0/秒/分/时/天格式 |
| `mediaToolsByteLengthCore` | 81 | `MediaTools.getMsFromByteLength` 字节→毫秒 |
| `mediaToolsOffsetCore` | 81 | `MediaTools.getOffsetFromTime` 毫秒→偏移 |
| `selectMapConsistencyCore` | 81 | 4 组 map 与 options 的数量/键一致性 |

- 所有用例引用真实主工程代码：`AudioConstants`、`SelectConstants`、`RecordingMetadata`、`MediaTools`。
- 每条用例带 `@tc.number/@tc.name/@tc.desc` 元数据，DOMAIN `0xF811`，TAG `[Sample_<suite>]`。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
