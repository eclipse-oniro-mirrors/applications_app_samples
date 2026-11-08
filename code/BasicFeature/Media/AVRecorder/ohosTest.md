# AVRecorder 测试说明

> 本说明面向 `AVRecorder`（OpenHarmony 音视频录制示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据、当前局限与后续扩展方向。

## 1. 文档目标

本文档用于说明 `AVRecorder` 自动化测试的分层结构、用例组织、覆盖重点与质量门禁。文档聚焦"为什么这样设计测试"和"当前测试能证明什么"，用于辅助代码评审、测试审计和后续扩展。

当前测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 **22 个测试套件、972 条用例**，测试代码约 **19,297 行**（有效代码行约 **10,028 行**），另有 `TestPace.ets`（节流辅助）与 `UiSession.ets`（UI 驱动辅助）。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 Ability `TestAbility`），按以下层次拆分：

- **纯函数层**：覆盖 `utils/DateTimeUtil.ets` 中的 `fill`、`concatDate`、`concatTime`、`getTime`、`getDate`、`getShownTimer`、`dateTime`，不需要任何系统能力，可在任意设备上稳定执行。
- **服务逻辑层**：覆盖 `services/CameraService.ets` 的 `selectProfile`、`selectVideoProfile` 选型算法（纯计算，构造能力列表即可验证），以及 `services/AVRecorderService.ets` 的 prepare 前置守卫、文件描述符（fd）生命周期与录控接口无实例时的安全行为。
- **文件与设备层**：覆盖 `utils/RecorderFileUtil.ets` 在真实 `filesDir` 下创建 `AUDIO_*_*.m4a` / `VIDEO_*_*.mp4` 文件的命名契约、fd 可写可读、空文件语义与多次创建互不覆盖。
- **边界与异常层**：覆盖负值、超范围值、极大/极小时间量、空能力列表、重复分辨率、跨分/跨小时进位、闰年日期拼接等。

### 2.2 高复用设计

- **统一套件注册**：`List.test.ets` 统一 import 并调用 22 个套件入口，所有套件按固定顺序执行，便于审计与按类回归。
- **共享被测实现**：测试直接引用 `DateTimeUtil`、`CameraService`、`AVRecorderService`、`RecorderFileUtil`，不在测试内复制业务实现。
- **独立 oracle**：`DateTimeOracle.test.ets` 用独立实现的 `pad2` / `timerOracle` / `clockOracle` 作为参照，与主工程实现互相印证，避免"实现即预期"。
- **统一数据构造**：`preview(w,h)`、`video(w,h)`、`videoWithRate(w,h,min,max)`、`resolution(w,h)` 等辅助函数构造相机能力列表与目标分辨率，减少字段遗漏。
- **统一断言风格**：每条用例至少 3 个断言，覆盖返回值、类型、边界、副作用或后置条件；全量用例 0 条低于 3 个断言。

### 2.3 矩阵化设计

关键路径采用组合矩阵扩展覆盖：

- **时间矩阵**：`fill` 覆盖 0–9 全单值、10–99 双位段、100 以上位宽保持、负值确定性渲染；`concatTime` 对小时 × 分钟 × 秒做网格组合；`dateTime` 与 `getShownTimer` 覆盖 0/1/59/60/61/3599 等进位点。
- **日期矩阵**：`concatDate` 覆盖月首/月末、闰年 2 月 29 日、世纪年、跨年边界，验证"不补零直接拼接"的命名契约。
- **相机选型矩阵**：覆盖空列表、单位置命中、首位/中位/末位命中、重复分辨率取首个、部分字段一致但整体不一致、极大分辨率、随机生成能力表（确定性种子）下"返回下标必为匹配下标之一"的不变量。
- **文件矩阵**：覆盖两种文件类型 × 创建/关闭/重开/写入读回/连续创建多条 × 内容隔离。
- **录控时序矩阵**：覆盖 `prepare/start/pause/resume/stop/reset/release/closeFd/getInputSurface` 的合法与非法调用序列。

矩阵只用于真实边界和分支组合，不通过复制用例体或重复命名放大数量。

## 3. 测试对象拆解

### 3.1 主流程

- **应用承载**：`entryability/EntryAbility.ets` 负责应用启动与页面加载。
- **页面与交互**：
  - `pages/Index.ets`：首页，提供 `videoRecorderPage`、`audioRecorderPage` 两个入口。
  - `pages/AudioRecorder.ets`：音频录制页，含设置弹窗（`audioSetting`/`audioCancel`/`audioConfirm`）与录控按钮（`audioStart`/`audioPause`/`audioResume`/`audioStop`），录制中显示 `MM:SS` 计时文本。
  - `pages/VideoRecorder.ets`：视频录制页，含相机预览、设置弹窗（`videoSetting`/`videoCancel`/`videoConfirm`）与录控按钮（`videoStart`/`videoPause`/`videoResume`/`videoStop`）。
- **录制与相机能力**：`AVRecorderService`（create/prepare/getInputSurface/start/pause/resume/stop/reset/release、设置采样率与视频源类型/分辨率）、`CameraService`（getCameraManager、能力枚举、预览/视频 Output、VideoSession 生命周期、能力选型）。
- **文件与时间**：`RecorderFileUtil.createAudioFile` / `createVideoFile`；`DateTimeUtil` 的时间/日期拼接与时长格式化。

### 3.2 关键风险

- `AVRecorder` 真实录制依赖麦克风/相机权限、设备能力与音频路由，无权限或无摄像头的设备上录制用例无法稳定通过。
- `prepare` 在 `avRecorder` 为 `undefined` 时仍会**先创建并打开目标文件**，若打开后未成功 prepare，fd 会滞留——需要验证文件副作用与 fd 关闭语义。
- 目标文件名固定（`audio_example.m4a` / `video_example.mp4`），多次 prepare 会覆盖同一文件——需要验证"不截断已有内容"。
- `getInputSurface` 在未 prepare 时返回 `undefined` 而非抛错——需要验证守卫。
- `selectProfile` / `selectVideoProfile` 在找不到匹配分辨率时返回 0，可能选中错误能力——需要验证回退语义与"首匹配"不变量。
- `getShownTimer` 使用 `Math.round`、`dateTime` 使用 `Math.floor`，在 x.5 秒附近行为不同——需要用独立 oracle 锁定。
- `fill` 对负数、超大值与 `NaN` 无显式校验——需要锁定当前确定性行为。
- `RecorderFileUtil` 文件名不含毫秒，同一秒内连续创建会得到同名文件——需要验证连续创建的隔离和覆盖语义。
- 22 个套件串行执行、共 972 条用例，若缺少节流易触发 `THREAD_BLOCK_6S` 假失败。

## 4. 覆盖维度设计

### 4.1 功能正确性

- `fill` / `concatDate` / `concatTime` 的补零与无分隔拼接语义。
- `getTime` / `getDate` 的实时格式（6 位时间串、日期串）。
- `getShownTimer` / `dateTime` 的分钟:秒格式化与进位。
- `selectProfile` / `selectVideoProfile` 的精确命中与回退。
- `AVRecorderService` 的 prepare 落盘、fd 打开/关闭、无实例时录控接口的幂等安全。
- `RecorderFileUtil` 的文件命名、fd 返回、空文件、写入读回。

### 4.2 边界与异常

- 时间：0、1、9、10、59、60、99、100、3599、3600 及跨分/跨小时。
- 时长：499/500/1499/1500 ms 的取整边界，0 与极大毫秒。
- 日期：月末 28/29/30/31、闰年 2 月 29 日、世纪年 2000/2100。
- 非法输入：负值（-1/-5/-10/-99）、超大值、能力列表为空、无匹配分辨率。
- 文件：已存在非空文件再次 prepare 不截断、连续创建同名文件、fd 重复关闭。

### 4.3 契约与数据

- `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.size`、`@tc.type`、`@tc.level` 全量存在（972/972）。
- 用例名全局唯一、`@tc.name` 与 `it()` 名称一致；`@tc.number` 全局唯一。
- 文件命名契约：`AUDIO_\d{6,8}_\d{6}\.m4a`、`VIDEO_\d{6,8}_\d{6}\.mp4`。
- 相机能力选型契约：命中返回首个匹配下标，未命中返回 0。

### 4.4 稳定性与隔离

- 每个套件 `beforeEach` 执行 `paceTurn()`（30 ms 真实定时器让步），避免 Hypium promise 链持续占用 JS 线程触发 `THREAD_BLOCK_6S`。
- 每条用例先删除 `audio_example.m4a` / `video_example.mp4` 等临时文件，结束后在 `finally` 中再次清理，避免跨用例污染。
- 文件用例先记录 `filesDir` 快照再比对新增文件名，避免依赖绝对路径。
- 纯函数用例不依赖时钟与设备状态；`getTime` 类用例只做格式与取值区间断言，不比对具体时刻。
- 每个用例使用独立的 `new AVRecorderService()` / `new CameraService()` 实例，避免单例状态串联。

### 4.5 可维护性

- 套件按"核心逻辑、时间矩阵、相机选型、文件、录控时序"分组，同一主题集中在同一文件。
- 新增边界优先追加到对应矩阵文件，不修改既有编号与用例名。
- 失败用例按 `class + testName` 可唯一定位。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- **覆盖层次完整**：从纯函数、选型算法、服务守卫到真实文件系统均有覆盖。
- **覆盖方式多样**：包含独立 oracle 比对、随机生成能力表不变量、全网格组合、非法调用序列和真实文件读写。
- **数量与质量同时约束**：972 条用例名称与编号全部唯一，无低于 3 个断言的用例。
- **断言可定位**：同时校验返回值、类型、边界、副作用和后置条件，而不是只验证"接口存在"。
- **矩阵可审计**：时间、日期、相机、文件、时序矩阵均可独立复核。

### 5.2 数量与质量门禁

| 指标 | 当前值 |
|---|---:|
| 测试套件 | 22（+ `List.test.ets`） |
| 用例总数 | 972 |
| 测试代码行数 | 19,297 |
| 有效代码行数 | 10,028 |
| 唯一用例名 | 972 |
| 唯一 `@tc.number` | 972 |
| 元数据完整用例（6 项齐全） | 972 |
| 断言总数 | 3,224（assertEqual 2,306 / assertTrue 906 / assertFalse 12） |
| 断言少于 3 个的用例 | 0 |
| 超过 120 字符的行 | 0 |

### 5.3 运行与限制

- 运行前需唤醒并解锁设备；锁屏会导致应用无法正常前台运行。
- 建议执行 `power-shell timeout -o 600000` 延长息屏时间，避免长时串行执行中断。
- 设备需具备麦克风与相机能力；目标工程 `deviceTypes` 为 `phone`，编译 SDK 为 `6.1.1(24)`。
- **当前自动化测试不覆盖真实录制链路**：`createRecorder`、`prepare` 到真实 `AVRecorder`、`start/pause/resume/stop` 的端到端录制，以及相机预览出流、权限弹窗交互均依赖真机硬件与系统权限，主要以手工用例保障（见附录）。
- 录制结果的音画同步、编码格式（AAC/AVC）、文件时长等媒体质量属性不在自动化断言范围内。
- `UiSession.ets` 已提供 UI 驱动、权限弹窗关闭与返回首页的辅助能力，但当前尚未有套件调用，UI 自动化用例仍为缺口。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 22 个套件：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---:|---:|---|
| 核心逻辑 | 1 | 5 | `AVRecorderLogicTest01`（5）：`fill`/`concatTime`/`getTime`/`getShownTimer`/`dateTime` 冒烟 |
| 时间与日期矩阵 | 11 | 804 | `DateTimeUtilMatrix`（17）、`DateTimeEdge`（60）、`DateTimeOracle`（24，独立 oracle）、`DateTimeFillWideTable`（100）、`ShownTimerTable`（104）、`DateTimeClockTable`（123）、`ConcatDateTable`（72）、`ConcatTimeTable`（96）、`DateTimeExtremeTable`（36）：补零、拼接、格式化、进位、负值与极值 |
| 相机能力选型 | 4 | 173 | `CameraProfileSelect`（17）、`CameraProfileTable`（84）、`CameraSelectionEdge`（56）、`CameraSelectionInvariant`（16，种子生成不变量）：预览/视频能力命中、回退、重复分辨率与随机不变量 |
| 文件与设备 | 4 | 54 | `RecorderFileDevice`（8）、`RecorderFileContract`（8）、`RecorderFileMatrix`（24）、`RecorderFileSequence`（14）：命名契约、fd、空文件、写入读回、连续创建 |
| 录制服务 | 4 | 108 | `RecorderPrepareGuard`（6）、`RecorderServiceLifecycle`（30）、`RecorderServicePair`（15）、`RecorderServiceSequence`（57）：prepare 守卫、fd 生命周期、多实例隔离、调用序列 |
| **合计** | **22** | **972** | |

## 7. 结论

`AVRecorder` 当前测试已经形成"纯函数 + 选型算法 + 服务守卫 + 真实文件系统 + 时序矩阵"的组合式覆盖结构。该结构具备明确的分层、可复现的执行前置、唯一的用例编号和较完整的边界组合，可作为后续版本回归、接口变更审计和测试扩展的基础。

后续扩展应优先补齐真实录制链路与 UI 流程（使用已有的 `UiSession.ets`），而不是继续放大纯函数矩阵；新增用例需继续保持唯一名称/编号、至少 3 个有效断言，并优先复现真实业务分支。

## 附录：手工用例归档

### 测试环境

- 设备：支持麦克风与相机的 HarmonyOS 手机（`deviceTypes: phone`）
- 工程 SDK：`compileSdkVersion` / `compatibleSdkVersion` = `6.1.1(24)`
- 测试套件：`AVRecorderLogicTest01` 等 22 个套件
- 测试目录：`entry/src/ohosTest/ets/test/`
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level`；`@tc.size` 统一 `MediumTest`，`@tc.type` 统一 `Function`，`@tc.level` 统一 `LEVEL0`，`it()` 第二参统一 `0`

运行方式：

使用 DevEco Studio 或 hdc 以 `entry_test` 模块运行 `List.test.ets`，指定运行器 `OpenHarmonyTestRunner` 和测试 Ability `TestAbility`。运行前需解锁设备并执行 `power-shell timeout -o 600000`。

### 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 应用已安装 | 启动 bundle `com.samples.avrecorder`、ability `EntryAbility` | 成功拉起应用，显示视频录制 / 音频录制入口 | Pass |
| 允许权限 | 首次启动弹出麦克风、相机权限框 | 点击"允许" | 授权后进入首页 | Pass |
| 音频录制参数选择 | 位于音频录制页 | 1、点击设置按钮；2、选择采样率参数；3、点击确定 | 参数设置成功，关闭弹窗 | Pass |
| 音频录制状态切换 | 位于音频录制页 | 1、点击开始并录制 2 s；2、点击暂停；3、点击继续并录制 1 s；4、点击停止 | 1、进入录制中，计时从 00:00 递增；2、进入暂停，计时停止；3、恢复录制，计时继续；4、停止后回到 00:00 初始态 | Pass |
| 视频录制参数选择 | 位于视频录制页，预览正常 | 1、点击设置按钮；2、选择分辨率；3、点击确定 | 参数设置成功，预览按新分辨率刷新 | Pass |
| 视频录制状态切换 | 位于视频录制页 | 1、点击开始并录制 2 s；2、点击暂停；3、点击继续；4、点击停止 | 1、进入录制中并显示相机预览；2、暂停后画面冻结；3、恢复录制；4、停止后回到初始态 | Pass |
| 录制文件生成 | 已完成一次音频/视频录制 | 在应用 `filesDir` 下查看产物 | 生成以 `AUDIO_` 开头 `.m4a` / 以 `VIDEO_` 开头 `.mp4` 的非空文件 | Pass |
| 无权限录制（负向） | 拒绝麦克风/相机权限 | 点击开始 | 不进入录制中状态，无异常崩溃 | Pass |
