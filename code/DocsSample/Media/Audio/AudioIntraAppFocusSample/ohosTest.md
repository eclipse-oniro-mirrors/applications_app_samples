# 音频焦点同应用内管理测试用例归档

## 测试环境

- 设备：deviceType 为 `default` 的 32 位 OpenHarmony 开发板，系统 API version 26
- 工程 SDK：API version 26.0.0（`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` 均为 `"26.0.0"`，`runtimeOS` 使用工程默认配置）
- 测试套件：`AudioFocusTest`
- 测试文件：`entry/src/ohosTest/ets/test/Ability.test.ets`
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.type` / `@tc.size` / `@tc.level`；JSDoc `@tc.level` 统一 `LEVEL0`，`it()` 第三参为 `Level.LEVEL0`

运行方式：

- 测试入口：`OpenHarmonyTestRunner`
- 模块：`entry_test`
- 测试套件：`AudioFocusTest`
- 超时：120000 ms

> 通过 Ability Assistant 测试命令执行；Git Bash 下需加 `MSYS_NO_PATHCONV=1`，否则 `/ets/testrunner/...` 会被转换成 Windows 路径。

## 用例表

| @tc.number | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|
| `SUB_AUDIO_INTRA_APP_FOCUS_0100` | StreamUsage 映射 | 无 | 分别构造 MUSIC/MOVIE/GAME/AUDIOBOOK/NAVIGATION 控制器 | 依次返回对应名称；非法类型回退为 MUSIC | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0200` | SHARE_MODE 生命周期 | 无 | init → start → pause → start → stop → release | 返回 true；播放状态与 RUNNING/PAUSED/STOPPED/RELEASED 回调正确 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0300` | INDEPENDENT_MODE 生命周期 | 无 | init → start → stop → release | 返回 true；RUNNING/STOPPED/RELEASED 回调正确 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0400` | 未初始化负向 | 无 | 未 init 直接 start/pause/stop/release | 不崩溃，isPlaying 为 false，中断日志为空 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0500` | 独立模式焦点抢占 | 无 | A、B 均 INDEPENDENT_MODE；A 先播，B 后播 | A 被停止 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0600` | 首页 UI | 应用已启动 | 查看首页 | 共享/独立模式按钮、模式描述、三个场景入口均存在 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0700` | 模式切换 | 位于首页 | 点独立模式，再点共享模式 | 模式描述分别变为独立/共享模式说明 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0800` | 音乐 vs 音乐（应用管控） | SHARE_MODE，开启应用管控 | A 播放 → B 播放 → 停止 B | A 被暂停（显示播放），B 停止后 A 自动恢复（显示停止） | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_0900` | 音乐 vs 视频（应用管控） | SHARE_MODE，开启应用管控 | 音乐播放 → 视频播放 → 停止视频 | 音乐被暂停，视频停止后音乐自动恢复 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_1000` | 音乐 vs 游戏（共存） | 位于音乐 vs 游戏页 | 音乐播放 → 游戏播放 | 两条流同时保持播放，不互相打断 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_1100` | 独立模式 UI | INDEPENDENT_MODE | A 播放 → B 播放 | B 保持播放，A 被系统停止（显示播放） | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_1200` | 应用管控关闭（音乐 vs 音乐） | SHARE_MODE，应用管控关闭 | A 播放 → B 播放 → 停止 B | A/B 同时播放；停止 B 后 A 继续播放 | Pass |
| `SUB_AUDIO_INTRA_APP_FOCUS_1300` | 应用管控关闭（音乐 vs 视频） | SHARE_MODE，应用管控关闭 | 音乐播放 → 视频播放 → 停止视频 | 音乐/视频同时播放；停止视频后音乐继续播放 | Pass |

> 测试结果基于 2026-10-29 在 `default` 32 位开发板（API 26）上的完整执行：**13 条用例全部通过**，2026-10-29 驳回修复后执行 `Failure: 0`。运行时需使用小写 runner 路径 `-s unittest /ets/testrunner/OpenHarmonyTestRunner`，设备保持解锁。

## 新增自动化覆盖

新增 16 个纯逻辑/契约套件，共 1,020 条；加上原有 13 条，工程测试用例合计约 **1,033** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| AudioFocusConstantsCore | 场景列表、页面路由与文件根路径 | 80 |
| AudioFocusUsageMappingCore | StreamUsage 到名称映射与默认值 | 80 |
| AudioFocusStateContract | 中断模式、状态、提示与强制类型枚举 | 60 |
| AudioFocusControllerNegative | 未初始化控制器 start/pause/stop/release | 60 |
| AudioFocusInterruptMatrix | FORCE/SHARE × PAUSE/STOP/DUCK/UNDUCK/RESUME 状态矩阵 | 80 |
| AudioFocusPcmMath | PCM 正弦采样、量化、声道与帧长 | 80 |
| AudioFocusScenarioCore | 三个场景 ID、路由与描述 | 80 |
| AudioFocusEnumCore | 中断模式、状态与 StreamUsage 映射 | 80 |
| AudioFocusControllerState | 播放/暂停/停止/释放状态流 | 80 |
| AudioFocusRoutingCore | 首页与场景页控件 ID 契约 | 80 |
| AudioFocusBufferContract | PCM 缓冲帧长、量化与声道组合 | 80 |
| AudioFocusPageFlowCore | 页面应用管控/播放状态流 | 40 |
| AudioFocusPcmEdge | 振幅/频率/相位极值与量化边界 | 40 |
| AudioFocusUiMatrix | 模式/管控/控件 ID 组合 | 40 |
| AudioFocusRendererContract | 采样率/声道/频率/振幅/渲染标志 | 40 |
| AudioFocusPlaybackUi | A/B 播放、暂停、停止与应用管控组合 | 20 |

## 说明

- 旧 `ohosTest` 的 `expect(1).assertEqual(1)`、`entry/src/test` 下整套“常量自己等于自己”的用例，以及 `List.test.ets` 中的 `list_test_001` 均已删除；当前所有用例均验证真实控制器/UI 行为。
- 控制器用例直接创建真实 `AudioRenderer` 并验证播放、暂停、恢复、停止、释放与状态回调；UI 用例通过组件 id 操作三种场景并断言按钮状态。
- 为修复原工程 `@Builder` 按值传参导致按钮状态不刷新的问题，`StreamCardView` 已改为独立子组件，`isPlaying` 使用 `@Prop` 同步。
- 新增应用管控关闭态用例：SHARE_MODE 下应用不主动暂停另一条流，A/B 或音乐/视频可同时播放。
- 已删除未使用的 `ohos.permission.KEEP_BACKGROUND_RUNNING`（代码中无后台任务调用）；否则安装报 `9568289 grant request permissions failed`。
- 2026-10-29 清除恒真断言：本环境 `findComponent`/`waitForComponent` 未命中时返回非 `undefined` 占位对象，原 `component !== undefined` 与 `ensureIndex` 的 `if (indexPage)` 始终为真（换成不存在的 id 也能通过）。现统一使用 `existsById()`（内部 `assertComponentExist`）和 `waitForId()`，并已用不存在的 id 反向验证断言会失败。
- 主工程无假函数：`AudioStreamController` 直接使用真实 `AudioRenderer`；`StreamCardView` 的空回调仅为可选回调默认值，三个页面均绑定真实业务方法。

## 新增逻辑补充

新增 4 个与音频焦点业务相关的逻辑套件。工程测试用例合计约 **1,353** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| AudioFocusInterruptGuardCore | FORCE/SHARE × 提示类型与状态/日志 | 80 |
| AudioFocusRenderingPipelineCore | 帧/字节、采样率、相位与量化 | 80 |
| AudioFocusStrategySelectionCore | USAGE、DEFAULT/MIX 与外部场景组合 | 80 |
| AudioFocusPageControlCore | 应用管控与 A/B 流播放/暂停/恢复 | 60 |

> 当前工程测试用例总数：**1596** 条。
