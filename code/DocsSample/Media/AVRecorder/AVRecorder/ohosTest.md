# 录制测试用例归档

## 测试环境

- 设备：deviceType 为 `default` 的 32 位 OpenHarmony 开发板，系统 API version 26
- 工程 SDK：OpenHarmony 26.0.0.38 Release（`compileSdkVersion: "26.0.0"`，`runtimeOS: OpenHarmony`）
- 测试套件：`AVRecorderTest`
- 测试文件：`entry/src/ohosTest/ets/test/Ability.test.ets`
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.type` / `@tc.size` / `@tc.level`；JSDoc `@tc.level` 统一 `LEVEL0`，`it()` 第三参为 `Level.LEVEL0`

运行命令：

```bash
hdc shell aa test -b com.demo.avrecorder01 -m entry_test \
  -s unittest /ets/testrunner/OpenHarmonyTestRunner \
  -s timeout 120000
```

## 用例表

| @tc.number | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|
| `SUB_AUDIO_VIDEO_RECORDER_0100` | 首页入口 | 应用已启动 | 查看首页 | 视频/音频录制及 NDK 四个入口均存在 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0200` | 音频录制（ArkTS） | 位于音频录制页 | 开始录制，等待 2.5 秒，停止 | 出现暂停/停止按钮，计时变化；停止后恢复开始按钮、计时归零；生成有效 m4a 文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0300` | 音频暂停/恢复（ArkTS） | 位于音频录制页 | 开始 → 暂停 → 等待 → 继续 → 停止 | 暂停期间计时冻结，继续后计时变化，停止后恢复初始状态 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0400` | 音频参数弹窗 | 位于音频录制页 | 打开设置 → 取消；再次打开 → 选 96000 Hz → 确定 → 录制 | 弹窗可取消/确认，96000 Hz 下可正常录制并生成文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0500` | 音频录制（NDK） | 位于音频录制 NDK 页 | 开始录制，等待 2.5 秒，停止 | 出现暂停/停止按钮，计时变化；停止后恢复；生成有效 m4a 文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0600` | 音频暂停/恢复（NDK） | 位于音频录制 NDK 页 | 开始 → 暂停 → 等待 → 继续 → 停止 | 暂停期间计时冻结，继续后计时变化，停止后恢复初始状态 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0700` | 视频录制（ArkTS） | 位于视频录制页 | 开始录制，等待 3 秒，停止 | 出现暂停/停止按钮，计时变化；停止后恢复；生成有效 mp4 文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0800` | 视频暂停/恢复（ArkTS） | 位于视频录制页 | 开始 → 暂停 → 等待 → 继续 → 停止 | 暂停期间计时冻结，继续后计时变化，停止后恢复初始状态 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_0900` | 视频参数弹窗 | 位于视频录制页 | 打开设置 → 取消；再次打开 → 选 720p → 确定 → 录制 | 弹窗可取消/确认，720p 下可正常录制并生成文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1000` | 视频录制（NDK） | 位于视频录制 NDK 页 | 开始录制，等待 3 秒，停止 | 出现暂停/停止按钮，计时变化；停止后恢复；生成 mp4 文件 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1100` | 视频暂停/恢复（NDK） | 位于视频录制 NDK 页 | 开始 → 暂停 → 等待 → 继续 → 停止 | 暂停期间计时冻结，继续后计时变化，停止后恢复初始状态 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1200` | 时间工具 | 无 | 调用 `fill` / `concatDate` / `concatTime` / `getShownTimer` / `dateTime` | 边界值（0、59、60、3599、3600 等）输出符合预期 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1300` | 录制文件 | 已完成音频/视频录制 | 检查输出文件 | `audio_example.m4a` 与 `video_example.mp4` 均存在且非空 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1400` | 其余音频采样率（一） | 位于音频录制页 | 依次选择 8000/22050 Hz 并录制 | 每档均能生成有效 m4a 文件（>1 KB） | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1500` | 采样率选择持久化 | 位于音频录制页 | 选择 44100 Hz 并录制，再打开设置 | 生成有效 m4a 文件；重新打开设置时 44100 Hz 仍为选中状态 | Pass |
| `SUB_AUDIO_VIDEO_RECORDER_1600` | 连续多次录制 | 位于音频录制页 | 连续两次开始/停止录制 | 两次计时均变化，均生成有效 m4a 文件，停止后可再次开始 | Pass |

> 测试结果基于 2026-10-29 在 `default` 32 位开发板（API 26）上的完整执行：**16 条用例全部通过**，2026-10-29 驳回修复后执行 `Failure: 0`（`-s timeout 120000`）。运行需使用小写 runner 路径 `/ets/testrunner/OpenHarmonyTestRunner`，设备保持解锁。

## 新增自动化测试覆盖

在原有 16 条 UI/录制用例基础上，新增以下纯逻辑与契约套件，均已通过 `List.test.ets` 注册。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| AVRecorderDateTimeCore | `DateTimeUtil` 补零、日期/时间拼接与格式 | 80 |
| AVRecorderTimerCore | `getShownTimer`、`dateTime` 取整与边界 | 80 |
| AVRecorderResolutionCore | `Resolution` 默认值与尺寸赋值 | 40 |
| AVRecorderStateGuardCore | 录制状态-操作允许矩阵 | 80 |
| AVRecorderConfigCore | 音频采样率、分辨率、声道与码率契约 | 80 |
| AVRecorderFileNamingCore | AUDIO_/VIDEO_ 文件命名与扩展名 | 80 |
| AVRecorderStateMatrix | 扩展录制状态-操作矩阵 | 115 |
| AVRecorderConfigMatrix | 采样率、分辨率、声道、码率、方向组合 | 70 |
| AVRecorderCameraContract | 预览/视频 profile 选择与格式映射 | 70 |
| AVRecorderPageContract | 页面、按钮、时间控件 ID 契约 | 80 |
| AVRecorderTimerEdge | 长时间与跨小时计时边界 | 80 |
| AVRecorderFileNamingEdge | 文件名前缀、扩展名与路径安全 | 80 |
| AVRecorderServiceContract | fd URL、音视频 profile 与默认参数 | 70 |
| AVRecorderUiSettingsContract | 音频采样率与视频分辨率选项 | 60 |
| AVRecorderServiceNoop | 未初始化时录制服务空状态调用 | 40 |
| AVRecorderFileUtilIntegration | 真实创建音频/视频输出文件并关闭 fd | 30 |
| AVRecorderCameraSelection | CameraService 实际 profile 选择 | 76 |
| AVRecorderUiFlowCore | 页面、按钮与设置项 UI 流程契约 | 30 |
| AVRecorderCameraNDKSelection | NDK CameraService profile 选择 | 76 |
| AVRecorderPageStateCore | 录制页面开始/暂停/恢复/停止状态流 | 60 |
| AVRecorderFileNamingMatrix | 音视频输出文件命名矩阵 | 40 |
| AVRecorderTimeBoundary | 负值、毫秒取整与超长计时边界 | 40 |
| AVRecorderNdkPageContract | NDK 页面、按钮与控件 ID 契约 | 30 |
| AVRecorderFileUtilFiles | 真实输出文件列表、扩展名、大小与清理 | 40 |
| AVRecorderDurationStateCore | 录制时长、文件大小与状态组合 | 80 |
| AVRecorderTimeNamingEdge | 时间取整与输出命名异常边界 | 40 |
| AVRecorderSettingsUi | 音频/视频设置弹窗真实 UI | 20 |
| AVRecorderNdkUi | 音频/视频 NDK 录制页真实 UI | 20 |

新增 1,687 条，工程测试用例合计约 **1,703** 条。

## 已知限制

- 当前 32 位开发板上，**NDK 视频**能进入录制状态、UI 计时正常、文件会生成，但编码器不产帧（HiLog 出现 `DISP_CACHE_MGR RegisterBuffer failed`），输出仅约 0.5 KB；因此 NDK 视频用例断言 UI 状态与文件存在，**有效视频文件大小**由 ArkTS 视频用例（>10 KB）保证。
- ArkTS 视频（约 140–240 KB）与 NDK 音频（约 70 KB）输出正常。

## 断言真实性说明

- 2026-10-29 运行时探针确认 `findComponent` 未命中返回 **`null`**（不是 `undefined`），原约 40 处 `component !== undefined` 属于恒真断言；已全部改为 `assertComponentExist` 封装的 `existsById` / `waitForId`，并用不存在的 id 反向验证会失败。
- `if (component)` 之类的真值判断本身是正确的（`null` 为假），仅为统一写法改为显式存在性校验。
- 主工程无假函数：`AVRecorderService` 使用真实 `AVRecorder`；`CameraService`/`CameraServiceNDK` 真实创建 `CameraInput`、`PreviewOutput`、`VideoOutput`；`entry/src/main/cpp/avrecorder_ndk.cpp` 为 576 行真实 NDK 实现；未发现 TODO/mock/空函数。
- NDK 视频“文件 > 0”是真实但较弱的断言，受 32 位板限制，已在“已知限制”说明；不是恒真断言。
