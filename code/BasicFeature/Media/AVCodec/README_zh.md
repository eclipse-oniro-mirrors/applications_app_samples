# AVCodecSample

### 介绍

AVCodec 部件示例 Sample，基于 API26 构建，提供视频播放（含音频）和录制的功能。

- 视频播放的主要流程是将视频文件通过解封装->解码->送显/播放。
- 视频录制的主要流程是相机采集->编码->封装成mp4文件。

<a id="feature-navigation"></a>

### 功能概览与实现导航

本示例不仅演示基础音视频编解码接口，还实现了文件选择、解封装、两种视频送显路径、音画同步、倍速与智能流畅、播放状态管理、媒体信息展示，以及相机录制和音视频封装等完整链路。可通过下表直接跳转到对应实现说明。

#### 播放能力

| 功能 | 示例中的行为 | 实现说明 |
|---|---|---|
| 文件选择与异常校验 | 支持从文件管理器或图库选择媒体；空文件和无效文件给出可识别提示 | [播放入口与结构化配置](#playback-entry) |
| 解封装 | 解析媒体源、音视频轨、时长、码率、分辨率、帧率、Profile、Codec Config 等信息 | [解封装](#demuxer) |
| 解码器选择 | 支持自动选择、硬件解码器和软件解码器 | [视频解码](#video-decoding) |
| 同步/异步 Codec 模式 | 异步模式使用回调队列，Sync 模式由工作线程主动查询输入和输出 Buffer | [视频解码](#video-decoding) |
| SurfaceMode 送显 | 解码器直接输出到 XComponent Surface，并按目标时间释放送显 | [SurfaceMode 送显](#surface-output) |
| BufferMode 送显 | 应用取得解码 Buffer，按 stride 拷贝到 NativeWindowBuffer 后调用图形接口送显 | [BufferMode 送显](#buffer-output) |
| BufferMode HDR Vivid | 透传色彩空间及 HDR 静态/动态元数据，确认后在播放窗口右上角显示水印 | [HDR Vivid 检测与送显](#hdr-vivid-output) |
| 解码帧 Dump | BufferMode 下可选择将原始解码帧写入应用沙箱，默认关闭且不影响正常送显 | [Buffer Dump](#buffer-dump) |
| 音频解码与播放 | 解码压缩音频为 PCM，通过 AudioRenderer 回调持续播放 | [音频解码与播放](#audio-playback) |
| 长按倍速 | 播放时长按窗口进入 X2，松开恢复 X1 | [倍速播放](#playback-speed) |
| 倍速菜单 | 支持在播放过程中选择 X1、X2、X3 | [倍速播放](#playback-speed) |
| 智能流畅 | X2/X3 使用 ADAPTIVE 保帧策略，X1 恢复 FULL；温控告警时可切换 UNIFORM | [智能流畅](#smart-fluency) |
| 音画同步 | 以 AudioRenderer 实际播放位置为主时钟，对视频帧执行等待、定时送显或丢帧 | [音画同步](#av-sync) |
| 画面变换 | 播放中支持旋转、水平/垂直翻转及组合变换 | [画面变换](#video-transform) |
| 播放状态与进度 | 显示状态、目标倍速、位置/时长、音视频轨和智能流畅可用性 | [播放状态与媒体信息](#playback-info) |
| 媒体详情 | 展示媒体源、音视频轨、解码配置和原始 Source/Track Format 信息 | [播放状态与媒体信息](#playback-info) |
| Stop 与资源释放 | 支持主动停止、自然结束和异常结束，并通过统一状态机完成线程和资源回收 | [播放线程与释放生命周期](#player-lifecycle) |

#### 录制能力

| 功能 | 示例中的行为 | 实现说明 |
|---|---|---|
| 相机预览与页面跳转 | 主页面初始化编码 Surface，携带 SurfaceId 和配置跳转录制页；录制页创建预览和录像输出流 | [相机采集与录制](#camera-recording) |
| 视频编码 | 相机直接向编码器 Surface 送帧，支持 H.264/H.265、Sync/Async 输出 | [视频编码](#video-encoding) |
| 音频采集与编码 | AudioCapturer 采集 PCM，AudioCodec 编码 AAC 后写入封装器 | [音频采集与编码](#audio-encoding) |
| HDR Vivid 录制 | 根据设备能力选择 P010 和对应色彩空间，配置 HDR 视频编码参数 | [相机采集与录制](#camera-recording) |
| MP4/FLV 封装 | 将音视频编码输出并发写入 Muxer，MP4 同时写入旋转信息 | [封装](#muxing) |
| 停止与图库落盘 | 等待 CameraKit、编码 EOS、Muxer 释放和文件 fd 关闭后再返回主页面 | [录制停止流程](#recording-stop) |
| 自动化与真机测试 | Hypium 覆盖纯逻辑，真机用例覆盖编解码、送显、同步、录制及异常场景 | [测试](#testing) |

### 播放支持的原子能力规格

| 媒体格式 | 封装格式             | 码流格式                                                                                                                                             |
|------|:-----------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| 视频   | mp4、mkv、mpeg-ts等 | 视频码流：<br/>- 硬解：AVC(H.264)、HEVC(H.265)<br/>- 软解：MPEG2、MPEG4、H.263、AVC(H.264)<br/> 音频码流:<br/>AAC、MPEG(MP3)、Flac、Vorbis、AMR(amrnb、amrwb)、G711mu、APE |

更多格式请参考[AVCodec支持的格式](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/avcodec/avcodec-support-formats.md#avcodec%E6%94%AF%E6%8C%81%E7%9A%84%E6%A0%BC%E5%BC%8F)

### 录制支持的原子能力规格

| 封装格式 |      视频编解码类型        |      音频编解码类型     |
| :-----: | :-----------------------: | :-------------------: |
|   mp4   | HEVC(H.265)、 AVC(H.264)  |    AAC、MPEG（MP3）    |

更多格式请参考[AVCodec支持的格式](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/avcodec/avcodec-support-formats.md#avcodec%E6%94%AF%E6%8C%81%E7%9A%84%E6%A0%BC%E5%BC%8F)

### 效果预览

| 播放（模式选择）                                  | 播放（选择播放路径）          | 播放（横屏）        |
|-------------------------------------------|------------------------------|--------------------------|
| ![播放_模式选择.jepg](screenshots/播放_模式选择.jpeg) | ![播放_选择播放路径.jpeg](screenshots/播放_选择播放路径.jpeg) | ![播放_横屏.jpeg](screenshots/播放_横屏.jpeg) | 

|播放(竖屏)      | 播放（倍速）                    | 播放（变换矩阵）            | 
|-----------------------|----------------------|----------------------------------|
|![播放_竖屏.jpeg](screenshots/播放_竖屏.jpeg) | ![播放_倍速.jpeg](screenshots/播放_倍速.jpeg) | ![播放_变换矩阵.jpeg](screenshots/播放_变换矩阵.jpeg) |

|播放（垂直翻转并旋转90度）    | 录制（模式选择）                                  | 录制（开始录制）         | 
|-----------------------|-------------------------------------------|--------------------------------------------|
| ![播放_垂直翻转并旋转90度.jpeg](screenshots/播放_垂直翻转并旋转90度.jpeg) | ![录制_模式选择.jpeg](screenshots/录制_模式选择.jpeg) | ![录制_开始录制.jpeg](screenshots/录制_开始录制.jpeg) |
### 使用说明

播放功能不需要相机和麦克风权限。用户点击 MP4/FLV 录制按钮时，应用会检查并申请相机、麦克风权限；授权成功后才会进入录制流程。

如果用户拒绝授权，系统不会允许应用再次通过普通动态授权接口拉起相同弹窗。应用会调用 `requestPermissionOnSetting()` 拉起权限设置弹窗，引导用户重新授权。相关流程可参考 OpenHarmony 应用权限管理中的用户授权指南。

- 推送视频到文件管理？
  hdc file send xx.xx storage/media/100/local/files/Docs
- 推送视频到图库？
  hdc file send xx.mp4 storage/media/100/local/files
  hdc shell mediatool send /storage/media/100/local/files/xx.mp4

#### 播放

1. 推送文件到本地(可单独音频、单独视频、视频含音频)或点击下方“录制”，录制一个视频文件（含音频）

2. 点击播放按钮，选择从文件管理选取或从图库选取，点击确定，选择文件播放

3. 播放过程中，可长按播放窗口2倍速播放，松开原速播放，或点击播放按钮，选择指定倍速播放

#### 录制

1. （可选）设置-配置相机参数

2. 点击“录制”

3. 点击“保存”

4. 点击“开始录制”

5. 点击“停止录制”

<a id="testing"></a>

### 测试

自动化测试位于 `entry/src/ohosTest/ets/test`，使用 Hypium 覆盖以下可重复验证的逻辑：

- 时间和录制计时格式化；
- 文件选择索引、索引边界和空文件判断；
- 相机录制参数默认值及编码格式、分辨率更新；
- 播放、录制设置的完整解析和非法值拒绝；
- 播放状态、倍速、轨道和媒体时间的显示格式化；
- 媒体源、音视频轨、解码配置和原始 Format 信息的面板格式化；
- 播放、录制、封装格式、Dump 和 NativeWindow 变换配置完整性。

可在 DevEco Studio 中选择 `entry > ohosTest` 目标并执行测试。音视频解封装、软硬件编解码、Surface/BufferMode
送显、音频 async/sync 输出、权限弹窗和相机录制依赖真实设备能力，继续通过真机手工测试验证。详细的测试环境、测试素材和操作步骤请参考：
[AVCodecSample 手工测试用例](./ohosTest.md)。

也可以连接设备后通过命令行构建并执行：

```text
hvigorw --mode module -p product=default -p module=entry@ohosTest assembleHap
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.avcodecsample -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 300000"
```

### 目录

与本示例功能相关的主要目录结构如下：

```
AVCodec/
├── README_zh.md                              # 示例说明和实现文档
├── ohosTest.md                               # 真机手工测试用例
└── entry/src/
    ├── main/
    │   ├── cpp                               # Native 层
    │   │   ├── capbilities                   # 媒体能力接口和实现
    │   │   │   ├── include                   # 音视频编解码、封装和解封装接口
    │   │   │   ├── audio_capturer.cpp        # 音频采集实现
    │   │   │   ├── audio_decoder.cpp         # 音频解码实现
    │   │   │   ├── audio_encoder.cpp         # 音频编码实现
    │   │   │   ├── demuxer.cpp               # 解封装实现
    │   │   │   ├── muxer.cpp                 # 封装实现
    │   │   │   ├── video_decoder.cpp         # 视频解码实现
    │   │   │   └── video_encoder.cpp         # 视频编码实现
    │   │   ├── common                        # Native 公共模块
    │   │   │   ├── dfx                       # 日志和错误码
    │   │   │   ├── sample_callback.cpp       # codec 和 AudioRenderer 回调实现
    │   │   │   ├── sample_callback.h         # 公共回调定义
    │   │   │   └── sample_info.h             # 参数、Buffer 队列和回调上下文
    │   │   ├── render                        # XComponent 和 NativeWindow 送显模块
    │   │   │   ├── include                   # 送显模块接口
    │   │   │   ├── plugin_manager.cpp        # XComponent 与窗口管理
    │   │   │   └── plugin_render.cpp         # Surface 生命周期和交互回调
    │   │   ├── sample
    │   │   │   ├── player                    # Native 播放接口和实现
    │   │   │   │   ├── AudioOutputPump.cpp   # 音频 async/sync 公共输出数据泵
    │   │   │   │   ├── AudioOutputPump.h     # 音频输出数据泵接口
    │   │   │   │   ├── BufferRenderer.cpp    # BufferMode 手动拷贝送显实现
    │   │   │   │   ├── BufferRenderer.h      # BufferMode 送显接口
    │   │   │   │   ├── HdrMetadataHelper.cpp # 解码输出 HDR 元数据检测和透传
    │   │   │   │   ├── HdrMetadataHelper.h   # HDR 元数据辅助接口
    │   │   │   │   ├── Player.cpp            # 播放、同步和资源释放实现
    │   │   │   │   ├── Player.h              # Player 接口和状态定义
    │   │   │   │   ├── PlayerNative.cpp      # 播放 NAPI 入口
    │   │   │   │   └── PlayerNative.h        # 播放 NAPI 接口
    │   │   │   └── recorder                  # Native 录制接口和实现
    │   │   │       ├── Recorder.cpp          # 录制生命周期和数据流实现
    │   │   │       ├── Recorder.h            # Recorder 接口和状态定义
    │   │   │       ├── RecorderNative.cpp    # 录制 NAPI 入口
    │   │   │       └── RecorderNative.h      # 录制 NAPI 接口
    │   │   ├── types                         # Native 模块对 ArkTS 暴露的类型
    │   │   │   ├── libplayer                 # 播放模块类型声明
    │   │   │   └── librecorder               # 录制模块类型声明
    │   │   └── CMakeLists.txt                # Native 编译入口
    │   ├── ets                               # ArkTS UI 和业务逻辑
    │   │   ├── common
    │   │   │   ├── CommonConstants.ets       # 播放、录制和选择器常量
    │   │   │   └── utils
    │   │   │       ├── CameraCheck.ets       # 相机能力查询
    │   │   │       ├── DateTimeUtils.ets     # 时间格式化
    │   │   │       ├── Logger.ets            # 日志工具
    │   │   │       ├── MediaUtils.ets        # 文件选择和媒体文件校验
    │   │   │       └── PermissionUtil.ets    # 相机、麦克风权限处理
    │   │   ├── entryability/EntryAbility.ets # 应用入口 Ability
    │   │   ├── model                         # UI 状态和设置模型
    │   │   │   ├── CameraDateModel.ets       # 相机录制参数模型
    │   │   │   ├── MediaInfoModel.ets        # 解封装媒体信息面板格式化
    │   │   │   ├── PlaybackInfoModel.ets     # 播放信息显示格式化
    │   │   │   ├── PlayerSettingsModel.ets   # 播放设置解析和 NAPI 参数构建
    │   │   │   └── RecorderSettingsModel.ets # 录制设置解析
    │   │   ├── pages/Index.ets                # 首页、播放和录制入口
    │   │   └── recorder/Recorder.ets          # 相机预览和录制页面
    │   ├── resources                         # 主模块资源
    │   │   ├── base                          # 默认语言和公共资源
    │   │   ├── en_US                         # 美式英文资源
    │   │   └── zh_CN                         # 简体中文资源
    │   └── module.json5                      # 主模块配置
    └── ohosTest/                             # Hypium 自动化测试模块
        ├── ets
        │   ├── test
        │   │   ├── CameraDataModel.test.ets  # 相机参数模型测试
        │   │   ├── CommonConstants.test.ets  # 播放和录制常量测试
        │   │   ├── DateTimeUtils.test.ets    # 时间格式化测试
        │   │   ├── List.test.ets             # 测试套件统一入口
        │   │   ├── MediaUtils.test.ets       # 文件选择和空文件判断测试
        │   │   ├── MediaInfoModel.test.ets   # 媒体信息面板格式化测试
        │   │   ├── PlaybackInfoModel.test.ets # 播放信息格式化测试
        │   │   ├── PlayerSettingsModel.test.ets # 播放设置模型测试
        │   │   └── RecorderSettingsModel.test.ets # 录制设置模型测试
        │   ├── testability
        │   │   ├── TestAbility.ets           # 测试 Ability
        │   │   └── pages/Index.ets            # 测试页面
        │   └── testrunner
        │       └── OpenHarmonyTestRunner.ts   # Hypium 测试运行器
        ├── resources                         # 测试模块资源
        └── module.json5                      # 测试模块配置
```

### 具体实现

#### *整体链路总览*

本示例可以按“UI 选择业务场景 -> ArkTS 侧准备参数/Surface -> Native 侧创建媒体能力对象 -> 多线程搬运输入输出 Buffer -> 图形/音频/文件侧消费”的方式理解。

| 场景 | UI入口 | Native入口 | 主要能力模块 | 数据去向 |
|------|--------|------------|--------------|----------|
| 播放 | `entry/src/main/ets/pages/Index.ets` 中的播放按钮和 `XComponent` | `PlayerNative.cpp`、`Player.cpp` | `Demuxer`、`VideoDecoder`、`AudioDecoder`、`AudioOutputPump`、`BufferRenderer`、`PluginRender` | 视频送到 XComponent 对应的 NativeWindow，音频送到 AudioRenderer |
| 录制 | `Index.ets` 中的录制按钮、`recorder/Recorder.ets` 中的预览页 | `RecorderNative.cpp`、`Recorder.cpp` | `VideoEncoder`、`AudioCapturer`、`AudioEncoder`、`Muxer` | 相机视频流和麦克风音频流封装成 mp4/flv 文件 |
| 图形显示 | 播放页/录制页的 `XComponent` | `PluginManager`、`PluginRender`、`BufferRenderer` | Native XComponent、NativeWindow、NativeBuffer | SurfaceMode 直接由 codec 送显；BufferMode 由应用手动拷贝送显 |
| 解封装 | 播放前打开媒体文件后进入 Native | `Demuxer.cpp` | `OH_AVSource`、`OH_AVDemuxer` | 读取音视频 track 信息并向解码器输入压缩帧 |
| 封装 | 录制前创建媒体库输出文件后进入 Native | `Muxer.cpp` | `OH_AVMuxer` | 写入音视频编码后数据并生成目标媒体文件 |

几个核心对象的分工如下：

- `SampleInfo`：Native 媒体任务参数的组合对象。它按职责拆为 `MediaSourceInfo`、`VideoSampleInfo`、`AudioSampleInfo`、`CodecOptions`、`OutputOptions` 和 `PlaybackCallbackInfo`，分别保存输入源、视频、音频、编解码运行选项、输出选项和播放回调，避免所有调用方依赖一个平铺的大结构。
- `CodecUserData`：codec 回调和工作线程之间共享的上下文，包含输入/输出 Buffer 队列、音频播放/采集缓存、首帧标记、宽高步长等运行期状态。播放侧由 `Player` 使用 `unique_ptr` 独占，传给 C 接口时仅临时使用 `.get()`，避免手工 `new/delete` 造成所有权不清晰。
- `CodecBufferInfo`：对 codec buffer index、`OH_AVBuffer` 指针和 `OH_AVCodecBufferAttr` 的封装，便于在解封装、编解码、送显、封装之间传递。
- `SampleCallback`：异步模式下 codec 的统一回调入口，负责接收 `OnNeedInputBuffer` / `OnNewOutputBuffer` 并放入 `CodecUserData` 的队列。
- `AudioOutputPump`：统一处理音频 async 输出队列和 sync 主动查询，将 PCM 写入 `renderQueue`，并把释放 Buffer、音频时钟统计等动作回调给 `Player`。

Native 构建默认开启以下两个 API 26 能力开关：

- `AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY`：仅作用于 `player`，编译智能流畅解码的帧保留模式、倍速参数和温控参数下发能力。支持该能力的视频在 X1 时使用 FULL；切换到 X2/X3 时，无论是否包含音频轨，都下发 ADAPTIVE 和目标倍速；恢复 X1 时切回 FULL。
- `AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID`：仅作用于 `recorder`，从视频编码输出 Buffer 的参数中读取时域层级 ID。

如需使用不包含相应接口的旧版 Native SDK 构建，可在 CMake 参数中分别设置 `-DAVCODEC_SAMPLE_ENABLE_SMART_FLUENCY=OFF` 或 `-DAVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID=OFF`。

<a id="playback-entry"></a>

#### *播放入口与结构化配置*

UI 层使用 ArkUI 声明式范式组织页面，主页面为 `Index.ets`，录制预览页面为 `Recorder.ets`。页面入口在 `entry/src/main/resources/base/profile/main_pages.json` 中声明：

ArkUI 组件、状态和页面构建方式可参考当前 SDK 随附的 ArkUI 开发指南。

```json
{
  "src": [
    "pages/Index",
    "recorder/Recorder"
  ]
}
```

主页面 `Index.ets` 同时承载播放和录制入口：

- 播放区域使用 `XComponent({ id: 'player', type: XComponentType.SURFACE, libraryname: 'player' })`。`libraryname: 'player'` 会加载 `libplayer.so`，Native 侧在模块初始化时通过 `PluginManager::Export()` 取得 XComponent 对象并注册 Surface 回调。
- 播放设置通过 `TextPickerDialog` 选择解码器类型、运行模式、同步模式和是否dump解码帧。`PlayerSettingsModel` 负责将四列文本完整解析为 Native 数值，并构造结构化 `PlayOptions`；只有全部选项合法时才一次性更新，避免页面出现部分配置生效。dump选项仅在Buffer模式下生效，默认关闭。
- 点击播放后，UI 侧通过文件管理器或图库拿到 uri，再用 `fileIo.openSync()` 获取 fd 和文件大小，最终调用结构化接口 `player.play(options, callback)`。`options` 包含 fd、offset、size、解码器类型、Surface/BufferMode、同步模式、智能流畅能力和 dump 开关，避免位置参数顺序错误。
- 播放完成回调返回 `{ success, reason }`，其中 `reason` 为 `completed`、`stopped` 或 `error`。只有 `error` 会触发文件无效提示，用户主动 Stop 按正常结束处理。
- 播放过程中主按钮切换为“停止”。点击后调用 `player.stop()`，按钮进入“停止中”状态，等待 Native 统一释放资源并触发完成回调后恢复。
- 播放启动成功后，UI 调用 `player.isSmartFluencyAvailable()` 查询本次播放是否可使用智能流畅。设备和 Native SDK 支持该能力，并且当前媒体包含可用视频轨时返回 true，是否包含音频轨不影响该结果。
- 播放期间 UI 每秒调用 `player.getPlaybackInfo()`，在操作区上方显示状态、倍速、当前位置/总时长、音视频轨和智能流畅状态，同时读取 BufferMode 解码输出确认的 HDR Vivid 状态。页面离开或播放完成时会清理定时器和水印状态。
- 状态行右侧提供“信息”入口。点击后调用 `player.getMediaInfo()` 打开可滚动面板，按媒体源、视频轨、音频轨、解码与输出、Source Format 原始信息和各 Track Format 原始信息分区展示，效果类似播放器的详细媒体信息页。视频轨区域会显示 HDR Vivid 相关信息。大段原始字段不会参与每秒轮询，播放完成或开始下一次播放时会清理面板缓存。
- BufferMode 解码输出帧同时携带 `OH_VIDEO_HDR_VIVID` 类型和非空 `OH_HDR_DYNAMIC_METADATA` 后，播放窗口右上角显示浅色半透明 `HDR Vivid` 水印。本轮播放期间确认状态保持有效；普通 SDR、HDR10 或只有封装声明的文件不会触发水印。SurfaceMode 的实际图像 Buffer 由解码器和 Surface 直接轮转，应用侧无法读取其中的逐帧动态元数据，因此当前不显示该水印。
- 播放过程中，长按播放窗口会临时调用 `player.setPlaybackSpeed(2)`，松手恢复 `player.setPlaybackSpeed(1)`；点击“倍速”按钮可选择 1/2/3 倍速。本次播放可使用智能流畅时，X2/X3 提示会额外显示“智能流畅”。
- 播放过程中点击 Flip 按钮会调用 `player.setTransform(transformHint)`，Native 侧再通过 `OH_NativeWindow_NativeWindowHandleOpt(..., SET_TRANSFORM, ...)` 作用到当前显示 window。

播放设置由 `PlayerSettingsModel` 统一解析，最终形成结构化 `PlayOptions`：

```ts
{
  inputFileFd,
  inputFileOffset,
  inputFileSize,
  videoDecoderType,
  videoDecoderRunMode,
  videoDecoderSyncMode,
  isSmartFluencySupported,
  enableVideoDump
}
```

`PlayerNative::Play()` 按字段读取该对象并填充 `SampleInfo`，Native 侧再依次执行 `Player::Init()` 和 `Player::Start()`。这种结构避免了位置参数过多时发生顺序错误，也便于继续增加播放选项。UI 在打开文件后先检查文件大小；Native 初始化失败或播放过程中发生错误时，完成回调返回 `reason: 'error'`，页面恢复按钮并显示媒体文件异常提示。

<a id="recording-entry"></a>

#### *录制入口、页面跳转与交互*

录制入口也在 `Index.ets` 中：

- 点击“设置”后，通过 `RECORDER_INFO` 选择视频编码格式、分辨率、帧率和同步模式。`RecorderSettingsModel` 负责校验四列值，并统一更新 `CameraDataModel`；页面只负责弹窗、相机 profile 能力检查和结果提示。
- `checkIsProfileSupport()` 使用 `camera.getCameraManager()` 查询当前设备是否支持所选的录像 profile。若不支持，会回退到默认 1080P；如果默认配置也不支持，则取相机能力列表中的第一个 video profile。
- 点击录制 mp4/flv 后，UI 侧通过 `photoAccessHelper.createAsset()` 创建媒体库目标文件，再用 `fileIo.open()` 获取输出 fd。
- UI 调用 `recorder.initNative(...)`。Native 侧创建编码器和封装器后，会通过 `OH_NativeWindow_GetSurfaceId()` 返回编码器输入 Surface 的 `surfaceId`。
- 拿到 `surfaceId` 后，主页面通过 `this.getUIContext().getRouter().pushUrl({ url: 'recorder/Recorder', params: this.cameraData })` 跳转到录制页，并把 `CameraDataModel` 作为路由参数传入。

录制页 `Recorder.ets` 的职责是连接相机和两个输出 Surface：

- 页面加载时，`XComponent` 的 `.onLoad()` 会通过 `xComponentController.getXComponentSurfaceId()` 获取预览 SurfaceId。
- `createRecorder()` 创建 CameraManager、CameraInput、VideoSession、预览输出流和录像输出流。
- 预览输出流使用 XComponent 的 SurfaceId，负责在录制页展示实时预览。
- 录像输出流使用 Native 返回的编码器 SurfaceId，负责把相机帧送到 Native 视频编码器。
- 点击开始录制时，先 `encoderVideoOutput.start()` 打开相机录像输出，再调用 `recorder.startNative()` 启动 Native 侧 muxer、video encoder、audio capturer 和 audio encoder。
- 点击停止录制时，页面会等待相机录像输出和 `frameEnd` 完成，再依次等待 `recorder.stopBeginNative()` / `recorder.stopEndNative()` 收尾。Native 侧发送 EOS、等待编码输出结束并释放封装器后，UI 才关闭媒体库输出 fd、释放相机资源并返回主页面，避免文件仍处于写入状态而延迟出现在图库中。

<a id="graphics-output"></a>

#### *图形侧与XComponent送显*

本示例的图形侧由 ArkUI `XComponent` 和 Native 侧 `PluginManager` / `PluginRender` / `BufferRenderer` 共同完成。

播放页的 XComponent 由 `libraryname: 'player'` 绑定到 `libplayer.so`。模块加载后，`PlayerNative.cpp` 调用 `NativeXComponentSample::PluginManager::GetInstance()->Export(env, exports)`，在 `PluginManager::Export()` 中：

1. 通过 `napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, ...)` 获取 ArkUI 传入的 XComponent 对象。
2. 通过 `napi_unwrap()` 得到 `OH_NativeXComponent*`。
3. 通过 `OH_NativeXComponent_GetXComponentId()` 获取组件 id。
4. 将 XComponent 保存到 `PluginManager`，并创建/获取对应的 `PluginRender`。
5. 调用 `PluginRender::RegisterCallback()` 注册 Surface 生命周期回调。

`PluginRender` 关注几个 Native XComponent 回调：

- `OnSurfaceCreatedCB()`：XComponent Surface 创建后触发。这里拿到 `void* window`，转换为 `OHNativeWindow*`，通过 `PluginManager::SetPluginWindow()` 登记为当前窗口，并设置 `OH_SCALING_MODE_SCALE_FIT_V2`。窗口指针只作为框架拥有的非拥有引用保存，PluginManager 不负责释放它。
- `OnSurfaceChangedCB()`：Surface 尺寸或状态变化时触发，本示例记录 offset、width、height，可用于后续适配布局。
- `OnSurfaceDestroyedCB()`：Surface 销毁时触发，通过 `ClearPluginWindow()` 清除当前窗口引用，并通过 `ReleaseRender()` 释放对应的 `PluginRender`。即使回调没有提供 window，也会清理当前引用，避免后续使用悬空 window。
- `DispatchTouchEventCB()`：触摸事件回调，本示例读取触摸工具类型和倾角信息，作为 XComponent 交互能力示例。

播放送显分为 SurfaceMode 和 BufferMode 两条路径。两种模式共用同一套解封装、解码线程、PTS 调度和音画同步逻辑，区别仅在于解码后的图像 Buffer 由谁持有和如何进入 XComponent 对应的 NativeWindow。

<a id="surface-output"></a>

##### SurfaceMode 送显

`Player::CreateVideoDecoder()` 通过 `PluginManager::GetPluginWindow()` 获取 XComponent 窗口并设置 `sampleInfo_.video.window`。`VideoDecoder::Config()` 发现 window 非空后调用 `OH_VideoDecoder_SetSurface()`，实际图像 Buffer 在解码器和 Surface 之间轮转。应用侧输出回调负责依据音画同步结果决定送显或丢帧，再调用 `OH_VideoDecoder_RenderOutputBufferAtTime()`、`OH_VideoDecoder_RenderOutputBuffer()` 或不送显释放 Buffer。

SurfaceMode 避免了应用层像素拷贝，适合常规播放。由于输出回调不携带实际图像 NativeBuffer，应用不能在这条链路中读取逐帧 HDR 动态元数据或直接 Dump 图像内容；这些能力由 BufferMode 提供。

<a id="buffer-output"></a>

##### BufferMode 送显

`Player::CreateVideoDecoder()` 明确将 `sampleInfo_.video.window = nullptr`，不会给解码器配置 Surface。解码完成后应用通过 `OH_AVBuffer_GetAddr()` 取得 YUV/RGBA 数据，`BufferRenderer` 再把图像送到 XComponent 对应的 NativeWindow。BufferMode 与 SurfaceMode 互斥，不能在配置 BufferMode 的同时把 XComponent window 传给解码器。

BufferMode 的手动送显流程如下：

1. `BufferRenderer::Render()` 根据实际解码输出格式，将 `OH_AVPixelFormat` 映射到 `NATIVEBUFFER_PIXEL_FMT_*`。
2. `ConfigureWindow()` 对 XComponent 的 NativeWindow 设置 buffer 几何尺寸、usage、format 和缩放模式。
3. `OH_NativeWindow_NativeWindowRequestBuffer()` 申请一个可写的 `OHNativeWindowBuffer`，同时拿到 fence fd。
4. `OH_NativeBuffer_FromNativeWindowBuffer()` 转成 `OH_NativeBuffer`。
5. 如果有 fence，使用 `OH_NativeBuffer_MapWaitFence()` 等待后 map；否则使用 `OH_NativeBuffer_Map()`。
6. `CopyToWindowBuffer()` 按源 stride、slice height、目标 stride 分平面拷贝 NV12/NV21/YUV420P/RGBA/RGBA1010102 数据。
7. 拷贝完成后 `OH_NativeBuffer_Unmap()`。
8. `HdrMetadataHelper` 从解码输出 `OH_AVBuffer` 获取源 `OH_NativeBuffer`，把色彩空间、`OH_HDR_METADATA_TYPE`、`OH_HDR_STATIC_METADATA` 和 `OH_HDR_DYNAMIC_METADATA` 复制到目标 NativeWindowBuffer。读取源 NativeBuffer 获得的引用会通过 `OH_NativeBuffer_Unreference()` 归还。
9. 使用 `SET_DESIRED_PRESENT_TIMESTAMP` 设置期望显示时间。
10. `OH_NativeWindow_NativeWindowFlushBuffer()` 将 buffer 送回 NativeWindow 显示。
11. 若像素拷贝或 Flush 失败，`NativeWindowBufferGuard` 会调用 `OH_NativeWindow_NativeWindowAbortBuffer()` 归还 buffer；单帧色彩空间或 HDR 元数据写入不被设备支持时只记录一次告警，仍继续显示像素，避免把可选元数据问题扩大为播放失败。

需要特别注意：BufferMode 不能同时给解码器配置 surface。本示例保持该约束，BufferMode 输出帧处理完后始终调用 `OH_VideoDecoder_FreeOutputBuffer(..., false)` 释放给解码器；图形显示由 `BufferRenderer` 走 NativeWindow 图形接口完成。

<a id="hdr-vivid-output"></a>

##### HDR Vivid 检测与送显

BufferMode 能访问解码输出 `OH_AVBuffer` 对应的 `OH_NativeBuffer`，因此可以完成逐帧检测和元数据透传：

1. `HdrMetadataHelper::IsHdrVivid()` 读取 `OH_HDR_METADATA_TYPE`。
2. 类型为 `OH_VIDEO_HDR_VIVID` 时继续读取 `OH_HDR_DYNAMIC_METADATA`，动态元数据非空后把本轮播放标记为已确认。
3. `HdrMetadataHelper::CopyToNativeBuffer()` 将源 Buffer 的 ColorSpace、HDR 类型、静态元数据和动态元数据复制到目标 NativeWindowBuffer。
4. UI 每秒通过 `getPlaybackInfo()` 获取确认状态，在播放窗口右上角显示浅色半透明 `HDR Vivid` 水印；停止、失败、播放完成或页面退出时清理该状态。

水印状态一旦确认会保持到本轮播放结束，避免个别帧暂时不携带动态元数据时频繁闪烁。SurfaceMode 的实际图像 Buffer 由解码器直接交给 Surface，应用无法读取相同的逐帧元数据，所以当前不会显示应用侧确认水印，但不影响系统图形链路正常播放 HDR Vivid 内容。

<a id="buffer-dump"></a>

##### Buffer Dump

Dump 是 BufferMode 的独立可选能力，默认关闭。UI 将 `enableVideoDump` 放入 `PlayOptions`，`Player::DumpOutput()` 仅在 `codecRunMode == BUFFER` 且该开关开启时创建文件，并按解码输出格式写入有效图像区域：

- YUV420P 分别写入 Y、U、V 平面；
- NV12/NV21 写入 Y 平面和交错 UV/VU 平面；
- RGBA/RGBA1010102 按每像素 4 字节写入；
- 每行依据解码器返回的 stride 和 slice height 去除无效填充区域。

文件名包含像素格式、宽高和时间戳，默认保存到 `/data/storage/el2/base/haps/entry/files/`。Dump 和送显消费同一个解码输出 Buffer：应用先按需写文件，再执行 BufferMode 拷贝送显，最后统一调用 `OH_VideoDecoder_FreeOutputBuffer(..., false)` 归还解码 Buffer。关闭 Dump 时不会创建或写入文件。

<a id="demuxer"></a>

#### *解封装*

解封装由 `entry/src/main/cpp/capbilities/demuxer.cpp` 实现，主要用于播放链路。UI 侧把 fd、offset、size 传入 Native 后，`Player::Init()` 创建 `Demuxer`：

```cpp
source_ = OH_AVSource_CreateWithFD(info.source.inputFd,
    info.source.inputFileOffset, info.source.inputFileSize);
demuxer_ = OH_AVDemuxer_CreateWithSource(source_);
```

创建成功后，`Demuxer` 会通过 `OH_AVSource_GetSourceFormat()` 获取媒体源整体信息，并读取 track 数量：

```cpp
OH_AVFormat_GetIntValue(sourceFormat.get(), OH_MD_KEY_TRACK_COUNT, &info.source.trackCount);
```

为完整呈现解封装结果，创建阶段还会调用 `OH_AVFormat_DumpInfo()`，立即复制 Source Format 和每条 Track Format 的键值文本。SDK 返回的字符串生命周期绑定原 `OH_AVFormat`，因此不能直接保存指针；本示例复制到 `MediaSourceInfo` 后再生成只读媒体信息快照。`OH_AVFormat_DumpInfo()` 单次最多返回 1024 字节，面板因此同时提供常用字段的结构化展示，避免关键参数只依赖原始文本。

随后遍历每个 track：

- `OH_AVSource_GetTrackFormat(source_, index)` 获取当前 track 的 `OH_AVFormat`。
- `OH_MD_KEY_TRACK_TYPE` 区分视频轨和音频轨。
- 视频轨调用 `ProcessVideoTrack()`，读取 mime、宽高、帧率、码率、旋转角、profile 和 `OH_MD_KEY_VIDEO_IS_HDR_VIVID` 等信息，并保存 `videoTrackId_`。
- 音频轨调用 `ProcessAudioTrack()`，读取采样格式、声道数、声道布局、采样率、码率、mime、AAC ADTS 标记等信息，并保存 `audioTrackId_`。
- 如果 track 中存在 `OH_MD_KEY_CODEC_CONFIG`，会拷贝到 `SampleInfo::audio.codecConfig`，后续配置音频解码器时作为 codec config 传给 `OH_AudioCodec_Configure()`。

播放输入线程每次拿到解码器输入 buffer 后，会调用：

```cpp
OH_AVDemuxer_ReadSampleBuffer(demuxer_, trackId, buffer);
OH_AVBuffer_GetBufferAttr(buffer, &attr);
```

`ReadSample()` 的输出就是压缩音视频帧和对应的 `OH_AVCodecBufferAttr`。应用随后调用 `OH_AVBuffer_SetBufferAttr()` 和 `OH_*Decoder_PushInputBuffer()` 将该帧送入对应解码器。读到 EOS 时，attr flags 会带有 `AVCODEC_BUFFER_FLAGS_EOS`，输入线程据此结束或在循环播放场景下 seek 到起点继续读取。

<a id="video-decoding"></a>

#### *视频解码*

视频解码由 `VideoDecoder` 封装，创建阶段依据 UI 选择的解码器类型执行不同策略：

- 自动选择：调用 `OH_VideoDecoder_CreateByMime()`，由系统选择可用解码器；
- 硬件解码：通过 `OH_AVCodec_GetCapabilityByCategory(..., HARDWARE)` 查询解码器名称，再调用 `OH_VideoDecoder_CreateByName()`；
- 软件解码：使用 `SOFTWARE` 类别查询并创建软件解码器。

`VideoDecoder::Configure()` 使用解封装结果设置宽高、帧率、像素格式和旋转角。Sync 模式额外配置 `OH_MD_KEY_ENABLE_SYNC_MODE`；SurfaceMode 随后调用 `OH_VideoDecoder_SetSurface()`，BufferMode 则保持 window 为空。配置完成后调用 `OH_VideoDecoder_Prepare()`。

输入线程通过 Demuxer 读取压缩帧并调用 `OH_VideoDecoder_PushInputBuffer()`。输出路径根据 Codec 模式分为两种：

- ASYNC：注册 `OnNeedInputBuffer()` 和 `OnNewOutputBuffer()`，回调只把 Buffer 放入线程安全队列，工作线程再执行解封装输入、音画同步和送显；
- SYNC：输入/输出线程调用 `OH_VideoDecoder_QueryInputBuffer()`、`OH_VideoDecoder_QueryOutputBuffer()` 主动查询，再通过 `GetInputBuffer()`、`GetOutputBuffer()` 取得 Buffer。

两种模式在取得输出 Buffer 后都进入 `ProcessVideoWithoutAudio()` 或 `ProcessVideoWithAudio()`，最终由 `PresentAndReleaseVideoBuffer()` 统一完成 Dump、Surface/BufferMode 送显和解码 Buffer 归还，因此功能行为保持一致。

<a id="audio-playback"></a>

#### *音频解码与播放*

音频解码由 `AudioDecoder`、`AudioOutputPump` 和 `Player` 的音频线程配合完成。整体链路如下：

```text
Demuxer 读取音频压缩帧
        ↓
AudioDecoder 输入 buffer
        ↓
OH_AudioCodec 解码成 PCM
        ↓
AudioOutputPump 将 PCM 放入 renderQueue
        ↓
OH_AudioRenderer_OnWriteData 从 renderQueue 取数据播放
```

`AudioDecoder::Create()` 使用解封装得到的音频 mime 创建解码器：

```cpp
decoder_ = OH_AudioCodec_CreateByMime(codecMime.c_str(), false);
```

`AudioDecoder::Configure()` 根据 `SampleInfo` 配置输出 PCM 格式：

- `OH_MD_KEY_AUDIO_SAMPLE_FORMAT`：本示例设置为 `SAMPLE_S16LE`。
- `OH_MD_KEY_AUD_CHANNEL_COUNT`：声道数。
- `OH_MD_KEY_AUD_SAMPLE_RATE`：采样率。
- `OH_MD_KEY_CHANNEL_LAYOUT`：声道布局。
- `OH_MD_KEY_ENABLE_SYNC_MODE`：同步模式下设置。
- `OH_MD_KEY_CODEC_CONFIG`：如果解封装拿到了 codec config，则写入该字段，AAC 等格式依赖该信息正确解码。

异步模式下，`AudioDecoder::Config()` 注册 `SampleCallback`：

- `OnNeedInputBuffer()` 将输入 buffer index 和 `OH_AVBuffer*` 放入 `inputBufferQueue`。
- `OnNewOutputBuffer()` 将输出 buffer index 和 `OH_AVBuffer*` 放入 `outputBufferQueue`。

同步模式下，不走 codec 回调，线程直接调用 `AudioDecoder::GetInputBuffer()` / `GetOutputBuffer()` 查询 buffer。

播放侧的 `OH_AudioRenderer` 在 `Player::CreateAudioDecoder()` 中创建：

1. `OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_RENDERER)`。
2. 设置采样率、声道数、采样格式、编码类型和 usage。
3. 注册 `SampleCallback::OnRenderWriteData`。
4. `OH_AudioStreamBuilder_GenerateRenderer()` 得到 `audioRenderer_`。

音频输出线程创建一个局部 `AudioOutputPump`。异步模式从 `outputBufferQueue` 取回调送来的 Buffer，同步模式调用 `AudioDecoder::GetOutputBuffer()` 主动查询；两条路径随后复用同一个 Buffer 校验、PCM 入队和错误传播流程。`AudioOutputPump` 不拥有线程、解码器、`CodecUserData` 或 AudioRenderer，也不调用 `StartRelease()`，这些生命周期职责仍由 `Player` 管理。

拿到解码后的 PCM 后，`AudioOutputPump` 会把数据逐字节写入 `audioDecContext_->renderQueue`，再通过回调让 `Player` 释放 codec 输出 Buffer、更新已写采样数和音频 PTS。AudioRenderer 真正需要数据时，会触发 `OnRenderWriteData()`：

```cpp
while (!codecUserData->renderQueue.empty() && index < length) {
    dest[index] = codecUserData->renderQueue.front();
    ++index;
    codecUserData->renderQueue.pop();
}
std::fill(dest + index, dest + length, 0);
```

当队列中的 PCM 不足一次 AudioRenderer 请求长度时，剩余区域填充静音，避免把未写入的旧内存当作音频输出。时钟统计只累计回调实际取出的 PCM：`audioFramesWritten += index / bytesPerFrame`；不足部分填入的静音不计入媒体帧数。队列剩余字节会按采样率、声道数和 16 bit 采样宽度换算为微秒，用于更新当前音频 PTS。

音画同步也依赖 AudioRenderer。视频输出线程调用倍速感知的 `OH_AudioRenderer_GetAudioTimestampInfo()` 获取音频实际播放位置，再结合已写入帧数、硬件待播帧数、当前倍速和单调时钟锚点计算 `waitTimeUs`。视频帧过晚时丢帧，过早时 sleep 等待，以音频播放进度作为主时钟。

智能流畅只改变视频解码器的保帧/丢帧分布，不会修改被保留视频帧的 PTS/DTS，也不会产生一个需要同步给 AudioRenderer 的“动态实际倍速”。AudioRenderer、音频主时钟和视频解码器都使用 UI 下发的同一个目标倍速。初始化时视频解码器使用 FULL；切换到 X2/X3 时，不论媒体是否包含音频轨，都下发 ADAPTIVE 和 `OH_MD_KEY_VIDEO_DECODER_SPEED`；恢复 X1 时切回 FULL。

`OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_RATIO` 只在 UNIFORM 模式下生效。本示例仅在温控告警时切换到 UNIFORM 并下发固定保留比例，正常 X2/X3 播放不配置该参数。ADAPTIVE 会根据目标倍速、运动信息和系统状态自行决定保留帧，不应额外叠加固定 ratio。

<a id="playback-speed"></a>

#### *倍速播放*

播放页提供两种倍速交互：长按 XComponent 时调用 `player.setPlaybackSpeed(2)`，松手调用 `player.setPlaybackSpeed(1)`；倍速菜单可以显式选择 X1、X2 或 X3。NAPI 将倍速传给 `Player::SetSpeed()`，该函数只在 `PLAYING` 状态接受正数倍速。

带音频媒体会调用 `OH_AudioRenderer_SetSpeed()` 改变音频播放速度；随后 `speed` 原子变量保存统一的目标倍速。纯视频没有音频主时钟，`ProcessVideoWithoutAudio()` 使用 `frameInterval / speed` 控制送显间隔；带音频媒体则由音频时钟计算媒体时间差，再除以目标倍速换算为实际等待时间，防止 X2/X3 下仍按 X1 的墙钟时间等待。

倍速修改成功后，如果本次播放支持智能流畅，还会调用 `VideoDecoder::OnUserSpeedChanged()` 同步更新视频解码器保帧策略。UI 的倍速提示和状态栏都显示目标倍速，不把智能流畅内部的保帧决策误当成另一个音频倍速。

<a id="smart-fluency"></a>

#### *智能流畅播放*

智能流畅依赖对应 Native SDK 能力和 `AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY` 编译开关。页面根据系统 API 版本调用 `setSmartFluencyEnabled(true)`，播放器完成视频解码器创建后再通过 `isSmartFluencyAvailable()` 返回本次播放是否实际可用。只有可用时，UI 才在 X2/X3 提示中显示“智能流畅”，状态栏同时显示 `SF`。

模式切换由 `VideoDecoder::OnUserSpeedChanged()` 通过 `OH_VideoDecoder_SetParameter()` 实时下发：

| 场景 | 保帧模式 | 下发参数 |
|---|---|---|
| 初始化或 X1 | `OH_FRAME_RETENTION_MODE_FULL` | 全量输出视频帧 |
| X2/X3 | `OH_FRAME_RETENTION_MODE_ADAPTIVE` | 同时设置 `OH_MD_KEY_VIDEO_DECODER_SPEED` 为目标倍速 |
| 温控过热 | `OH_FRAME_RETENTION_MODE_UNIFORM` | 设置固定 `OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_RATIO` 降低负载 |
| 温度恢复 | 按当前倍速恢复 FULL 或 ADAPTIVE | 重新调用 `OnUserSpeedChanged()` |

ADAPTIVE 只决定哪些高帧率视频帧值得保留，不修改保留帧的原始 PTS。音频和视频仍使用 UI 下发的同一个 X1/X2/X3 目标倍速，带音频媒体继续以 AudioRenderer 为主时钟，因此智能流畅与音画同步可以同时工作。

<a id="video-transform"></a>

#### *画面变换*

播放中的 Flip 按钮提供旋转、水平翻转、垂直翻转及组合变换。UI 把选择项映射为 NativeWindow transform hint，并通过 `player.setTransform()` 调用 `Player::SetTransform()`。Native 先校验播放器处于 `PLAYING`，再取得当前显示 window：SurfaceMode 使用配置给解码器的 window，BufferMode 从 `PluginManager` 读取 XComponent window，最后调用：

```cpp
OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, transformHint);
```

变换作用于显示层，不修改解码后的像素内容、媒体 PTS 或 Dump 文件。连续选择相同 transform 时会直接返回，避免重复下发。

<a id="playback-info"></a>

#### *播放状态与媒体信息*

页面每秒调用一次 `getPlaybackInfo()`，展示播放器状态、目标倍速、当前位置/总时长、当前轨道组合和智能流畅状态。带音频媒体的位置由 AudioRenderer 实际取走的 PCM 更新；纯视频由成功送显的视频 PTS 更新。播放结束、失败或页面退出时停止定时器并清理状态文本和 HDR Vivid 水印。

点击状态栏右侧“信息”后，UI 调用 `getMediaInfo()` 获取初始化阶段冻结的媒体快照。Native 快照包含文件大小、时长、轨道数、视频编码/宽高/帧率/码率/Profile、音频编码/采样率/声道/码率、解码器模式、Dump 开关、Source Format Dump 和每条 Track Format Dump。`MediaInfoModel` 将常用字段格式化为分区行，同时保留原始 Format 文本，便于查看解封装器返回但 UI 未单独建模的字段。

媒体快照和实时播放信息职责分离：大段 Format 文本不会参与每秒轮询；实时查询只读取原子状态，不持有 Codec 回调上下文，也不会影响音画同步和送显线程。

<a id="player-lifecycle"></a>

#### *播放线程与释放生命周期*

播放侧为存在的音频轨和视频轨分别创建输入、输出线程。输入线程只负责向解码器送入压缩帧，输出线程负责消费解码结果；`isAudioDone` 和 `isVideoDone` 只表示对应输出线程已完成，不再由输入线程修改，避免输入 EOS 早于输出 EOS 时提前释放资源。

`Player` 使用显式状态机约束生命周期：

```text
IDLE -> INITIALIZING -> READY -> PLAYING -> STOPPING -> IDLE
```

- `Init()` 只接受 `IDLE`，初始化期间进入 `INITIALIZING`，成功后进入 `READY`。
- `Start()` 只接受 `READY`，音视频线程启动完成后进入 `PLAYING`。
- `Stop()` 只接受 `PLAYING`；重复 Stop 在 `STOPPING` 状态下按幂等成功处理。
- 自然结束、主动 Stop 和错误清理都进入同一条 `STOPPING` 释放路径，资源释放完成后回到 `IDLE`。
- `getState()` 向 ArkTS 返回当前 `PlayerState`，非法状态调用会被拒绝，不再只依赖 `isStarted_` 等布尔量推断生命周期。
- `getPlaybackInfo()` 返回状态、目标倍速、媒体总时长、当前位置、音视频轨存在性和智能流畅可用性。带音频媒体的位置由 AudioRenderer 实际消费 PCM 时更新；纯视频由成功送显的视频 PTS 更新。查询读取原子快照，不持有 codec 上下文，也不参与音画同步或帧调度。
- `getMediaInfo()` 返回初始化阶段冻结的只读快照，包括文件大小、总时长、轨道数量、音视频常用参数、当前解码/输出配置、Source Format Dump 和全部 Track Format Dump。快照使用 `Player` 互斥锁保护，不读取 codec 回调上下文；播放器释放后仍保留到本轮完成回调，UI 会在完成回调中清理显示。

结构化 NAPI 包含 `play(options, callback)`、`stop()`、`getState()`、`getPlaybackInfo()` 和 `getMediaInfo()`。原有九参数 `playNative(...)` 继续保留用于兼容已有调用，但主页面已迁移到结构化接口。

`Player::Start()` 在解码线程启动完成后创建独立的 `ReleaseWorker`。该协调线程等待音频和视频输出均完成；媒体不存在某一轨道时，对应完成标志在启动前直接置为 true。完成条件满足后，协调线程执行以下释放顺序：

1. 将播放状态置为停止，并 `join` 音视频输入、输出线程。
2. 将 `CodecUserData::isDestroyed` 置为 true，使迟到的 codec 和 AudioRenderer 回调立即返回。
3. 释放 AudioRenderer、Demuxer、视频/音频 Decoder、BufferRenderer 和 AudioStreamBuilder。
4. 在 Decoder 已停止回调后清空 Buffer 队列并销毁 `CodecUserData`。
5. 解除 `Player` 内部互斥锁后再通知 ArkTS 播放完成，避免完成回调再次进入播放器时产生锁重入问题。

工作线程不再 `detach`，也不会从音频或视频输出线程内部直接释放播放器，因此不存在输出线程 join 自身的问题。下一次 `Init()` 会先回收已经结束的协调线程，确保上一轮资源完整释放后再创建新任务。音频 `renderQueue` 的写入、消费和水位等待统一由 `outputMutex` 保护，避免使用不同互斥锁读取同一队列造成数据竞争。

主动 Stop 不直接在 NAPI 线程销毁 decoder。`Stop()` 将状态切换为 `STOPPING`、停止工作循环并取消 Buffer 队列等待；各输出线程完成收尾后仍由 `ReleaseWorker` 执行上述释放顺序，避免 Stop 与自然结束并发形成两套资源销毁逻辑。

<a id="camera-recording"></a>

#### *相机采集与录制*

录制由 ArkTS 相机能力和 Native 编码封装能力共同完成。这里有两个 Surface：

- 预览 Surface：录制页 `Recorder.ets` 中 XComponent 的 surfaceId，用于显示相机预览。
- 编码 Surface：Native 视频编码器通过 `OH_VideoEncoder_GetSurface()` 返回的 `OHNativeWindow`，再由 `OH_NativeWindow_GetSurfaceId()` 转成 surfaceId，传给 CameraKit 的 `createVideoOutput()`，用于把相机帧送入编码器。

主页面创建输出文件并初始化 Native：

```text
Index.ets
  createAsset() 创建媒体库视频资源
  fileIo.open() 获取 output fd
  recorder.initNative(...) 传入编码参数和 fd
  Native 返回 encoder surfaceId
  router.pushUrl('recorder/Recorder', params)
```

录制页 `Recorder.ets` 进入后：

1. `XComponent.onLoad()` 通过 `xComponentController.getXComponentSurfaceId()` 获取预览 surfaceId。
2. `camera.getCameraManager()` 获取 CameraManager。
3. `getSupportedCameras()` 选择相机设备。
4. `getSupportedSceneModes()` 确认支持 `NORMAL_VIDEO`。
5. `encoderProfileCameraCheck()` 从 camera videoProfiles 中选择与用户设置匹配的录像 profile。
6. `previewProfileCameraCheck()` 为 XComponent 预览选择 preview profile。
7. `createVideoOutput(encoderProfile, params.surfaceId)` 创建录像输出流，目标是 Native 编码器 Surface。
8. `createPreviewOutput(xComponentPreviewProfile, this.xComponentSurfaceId)` 创建预览输出流，目标是 UI 预览 XComponent。
9. `createCameraInput()` 创建相机输入，并调用 `cameraInput.open()` 打开相机。
10. `createSession(camera.SceneMode.NORMAL_VIDEO)` 创建 `VideoSession`。
11. `beginConfig()` 后依次 `addInput(cameraInput)`、`addOutput(xComponentPreviewOutput)`、`addOutput(encoderVideoOutput)`。
12. `commitConfig()` 提交配置，再调用 `videoSession.start()` 启动预览。

开始录制时：

```text
encoderVideoOutput.start()
recorder.startNative()
```

其中 `encoderVideoOutput.start()` 让 CameraKit 开始向编码 Surface 输出录像帧，`recorder.startNative()` 启动 Native 侧 muxer、video encoder、audio capturer、audio encoder 和对应输出线程。

<a id="recording-stop"></a>

##### 录制停止流程

停止录制时：

1. UI 为 CameraKit 的 `frameEnd` 注册一次停止等待，并调用 `encoderVideoOutput.stop()` 停止相机录像输出。
2. Native `stopBeginNative()` 将 `isStopping_` 置为 true，让音频采集/编码线程停止继续塞新数据。
3. UI 等待 CameraKit 触发 `frameEnd`；如果事件异常缺失，超时保护会继续执行收尾，避免页面和文件长期悬挂。
4. UI 调用并等待 `stopEndNative()`；Native 向 video encoder 和 audio encoder 发送 EOS，等待编码输出线程结束并释放 muxer、encoder 和 capturer。
5. `stopEndNative()` 完成后，UI 关闭媒体库输出 fd，再释放 CameraInput、PreviewOutput、VideoOutput 和 VideoSession。
6. 文件和相机资源全部完成收尾后才返回主页面。停止按钮、系统返回键和页面隐藏共用同一个幂等释放任务，避免重复停止或重复关闭 fd。

录制页还实现了两个图形/相机相关能力：

- HDR Vivid 场景下，根据能力选择 P010 格式，并尝试设置 `BT2020_HLG_LIMIT` 色彩空间。
- 预览页支持双指缩放，通过 `PinchGesture` 调用 `videoSession.setZoomRatio()` 调节相机 zoom。

<a id="video-encoding"></a>

#### *视频编码*

视频编码由 `VideoEncoder` 和 `Recorder` 配合完成。`Recorder::Init()` 根据 UI 选择的 H.264/H.265 mime 创建编码器，`VideoEncoder::Configure()` 再设置宽高、帧率、像素格式、码率模式、码率和 Profile。HDR Vivid 录制还会配置 I 帧间隔、色彩范围、色彩原色、传输特性和矩阵系数。

本示例使用 Surface 输入模式。完成编码器配置后，`OH_VideoEncoder_GetSurface()` 返回输入 `OHNativeWindow`，Native 把对应 SurfaceId 传到 ArkTS；CameraKit 的 `VideoOutput` 以该 SurfaceId 为目标，直接向编码器输入队列生产图像，不需要应用逐帧拷贝相机数据。

编码启动和输出流程如下：

```text
CameraKit VideoOutput
        ↓ Surface
OH_VideoEncoder 编码 H.264/H.265
        ↓
同步查询或异步 OnNewOutputBuffer
        ↓
以第一个同步帧为基准归一化起始 PTS
        ↓
Muxer::WriteSample(videoTrackId, buffer, attr)
        ↓
OH_VideoEncoder_FreeOutputBuffer
```

ASYNC 模式通过 `SampleCallback` 把编码输出 Buffer 放入队列，`VideoEncOutputAsyncThread()` 消费；SYNC 模式由 `VideoEncOutputSyncThread()` 调用 `OH_VideoEncoder_QueryOutputBuffer()` 和 `OH_VideoEncoder_GetOutputBuffer()` 主动查询。两条路径都从第一个同步帧开始归一化 PTS，写入视频轨后及时归还输出 Buffer。

停止时，CameraKit 先停止继续生产相机帧，随后 Native 调用 `OH_VideoEncoder_NotifyEndOfStream()`。输出线程收到带 `AVCODEC_BUFFER_FLAGS_EOS` 的 Buffer 后通知停止流程，最终等待输出线程退出，再释放编码器 Surface 和 `VideoEncoder`。

<a id="audio-encoding"></a>

#### *音频采集与编码*

录制时的音频链路如下：

```text
OH_AudioCapturer 采集 PCM
        ↓
AudioCapturerOnReadData 写入 CodecUserData::cache
        ↓
AudioEncoder 输入线程按 audioMaxInputSize 取 PCM
        ↓
OH_AudioCodec 编码 AAC
        ↓
AudioEncoder 输出线程取编码后 buffer
        ↓
Muxer 写入音频 track
```

`RecorderNative::Init()` 会设置音频默认参数：

- mime：`OH_AVCODEC_MIMETYPE_AUDIO_AAC`
- sample format：`SAMPLE_S16LE`
- sample rate：48000
- channel count：2
- bit rate：32000
- channel layout：`CH_LAYOUT_STEREO`
- `audioMaxInputSize`：按 20ms PCM 数据量计算

`AudioCapturer::AudioCapturerInit()` 创建音频采集器：

1. `OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_CAPTURER)`。
2. 设置采样率、声道数、采样格式、latency mode、encoding type。
3. 注册 `AudioCapturerOnReadData`。
4. `OH_AudioStreamBuilder_GenerateCapturer()` 得到 `audioCapturer_`。

采集回调 `AudioCapturerOnReadData()` 将系统给到的 PCM 数据写入 `CodecUserData::cache`，并通过 `inputCond.notify_all()` 唤醒音频编码输入线程。

音频编码器由 `AudioEncoder` 封装：

- `Create()` 使用 `OH_AudioCodec_CreateByMime(codecMime.c_str(), true)` 创建编码器。
- `Configure()` 设置采样格式、声道数、采样率、码率、声道布局、最大输入大小。
- 异步模式注册 `SampleCallback`；同步模式由线程主动 query buffer。
- 输入线程从 cache 中读取 `audioMaxInputSize` 大小的 PCM，调用 `OH_AVBuffer_SetBufferAttr()` 后 `OH_AudioCodec_PushInputBuffer()`。
- 输出线程拿到编码后的 AAC buffer 后调用 `muxer_->WriteSample(muxer_->GetAudioTrackId(), ...)` 写入封装器。

停止录制时，`AudioEncoder::NotifyEndOfStream()` 会获取一个输入 buffer，设置 `AVCODEC_BUFFER_FLAGS_EOS` 后推给编码器，使输出线程能收到 EOS 并退出。

<a id="muxing"></a>

#### *封装*

封装由 `entry/src/main/cpp/capbilities/muxer.cpp` 实现，用于录制链路。`Recorder::Init()` 在创建视频编码器后创建 `Muxer`：

```cpp
muxer_ = OH_AVMuxer_Create(fd, static_cast<OH_AVOutputFormat>(outputFormat));
```

`outputFormat` 来自 UI：

- `2`：MP4。
- `14`：FLV。

`Muxer::Config()` 会先后添加音频轨和视频轨：

- 音频轨通过 `OH_AVFormat_CreateAudioFormat(sampleInfo.audio.audioCodecMime.data(), sampleRate, channelCount)` 创建 format，并设置 `AAC_PROFILE_LC`。
- 视频轨通过 `OH_AVFormat_CreateVideoFormat(videoMime, width, height)` 创建 format，并设置帧率、宽高、mime。
- HDR Vivid 场景下，还会设置 `OH_MD_KEY_VIDEO_IS_HDR_VIVID`、range、color primaries、transfer、matrix 等色彩信息。
- 非 FLV 输出时，调用 `OH_AVMuxer_SetRotation(muxer_, 90)` 写入旋转元数据，使竖屏录像在播放时按预期方向显示。

`Muxer::Start()` 必须在所有 track 添加完成后调用。录制过程中，视频编码输出线程和音频编码输出线程分别调用：

```cpp
muxer_->WriteSample(muxer_->GetVideoTrackId(), buffer, attr);
muxer_->WriteSample(muxer_->GetAudioTrackId(), buffer, attr);
```

`WriteSample()` 内部会先调用 `OH_AVBuffer_SetBufferAttr(buffer, &attr)`，再调用 `OH_AVMuxer_WriteSampleBuffer()`。由于音频和视频输出线程可能并发写入，本示例使用 `writeMutex_` 保护 muxer 写入，避免多线程同时操作封装器。

停止录制时，编码器输出 EOS 后，`Recorder::Release()` 释放 muxer。封装器释放前会停止写入，最终文件由系统媒体库资源对应的 fd 承载，UI 侧已通过 `photoAccessHelper.createAsset()` 创建了该文件资源。UI 必须等 Native 封装收尾完成后再关闭该 fd；关闭成功代表应用不再写入目标资源，媒体库才能及时确认文件完成并在图库中显示。

#### *视频播放*

- 应用启动，Xcomponent加载， 触发OnSurfaceCreatedCB()， 此时能拿到一个surface，同时调用OH_NativeWindow_NativeWindowSetScalingModeV2接口给window配置一个自适应等比例拉伸原图像尺寸的Key，后续无论播放横屏视频还是竖屏视频，都不用更改XComponent的尺寸。
- 点击播放，选择文件后，能拿到文件fd，fileSize，根据拿到的fd和fileSize创建解封装器。
- 根据解封装器从文件中拿到的文件属性，创建对应的解码器，若走解码器的Surface模式，则要把之前拿到的surface也配置给解码器。
- 调用解码器Start，开始buffer轮转。buffer轮转时，由于buffer数量有上限，需要各个模块及时消费收到的buffer，否则会影响整体速度。
- 解码器Start调用后，首先会触发4次输入回调，里面会给应用OH_AVBuffer和其对应的index。
- 应用需要把待解码的码流，一帧帧填充到输入回调给到应用的OH_AVBuffer里的buffer地址里，然后调用OH_VideoDecoder_PushInputBuffer，传给解码器。
  ```text
  本示例里使用的是解封装器一键填充配置，若码流直送解码器：
  (1) 需要调用OH_AVBuffer_GetAddr获取OH_AVBuffer内buffer的内存地址，以进行之后的拷贝。
  (2) 可以调用OH_AVBuffer_GetCapacity获取OH_AVBuffer内buffer容量大小，避免拷贝越界。
  (3) 必须调用OH_AVBuffer_SetBufferAttr配置实际拷贝到OH_AVBuffer内buffer的实际size，按照规范，pts，offset，flags最好也配置对。
  (4) 给解码器的输入，要保证以下三点，才能正常解码：
        ①当前仅支持传入annexB格式帧，不支持avcc格式帧。
        ②确保buffer size正确传入。
        ③首帧要传XPS信息。（可以pps、sps和I帧同时传，也可以先传pps、sps，再传I帧）
            仅关键帧(I帧)：AVCODEC_BUFFER_FLAGS_SYNC_FRAME
            仅配置帧(pps，sps)：AVCODEC_BUFFER_FLAGS_CODEC_DATA
            是配置帧又是关键帧：AVCODEC_BUFFER_FLAGS_CODEC_DATA|AVCODEC_BUFFER_FLAGS_SYNC_FRAME
            普通帧(P帧):AVCODEC_BUFFER_FLAGS_NONE
  ```
- 待传给解码器解码完成后，会触发输出回调给应用。
  - 若是Surface模式，则输出侧实际的buffer只会在框架、解码器、surface侧轮转，回调给应用的OH_AVBuffer只是个壳子，里面会带一些flag，size等信息，以及应用在输入时配置的pts信息，但由于实际的buffer不会随着OH_AVBuffer回调给用户，所以Surface模式下调用OH_AVBuffer_GetAddr拿不到buffer的地址，不能直接拷贝解码后的buffer数据，如果有这个需求，则需把surface配置成NativeImage的window，调用NativeImage的接口获取。
  - 若是Buffer模式，实际的buffer会通过回调给到应用。由于Buffer模式不能给解码器同时配置surface，本示例会通过OH_AVBuffer_GetAddr获取解码后的yuv/rgba图像内容，拷贝到XComponent对应的NativeWindowBuffer，并同步透传色彩空间、HDR类型及静态/动态元数据后调用NativeWindow图形接口送显；同时也可以选择dump到应用的沙箱目录/data/storage/el2/base/haps/entry/files/下，应用可将此文件提取上来检验效果。dump功能默认关闭，可在播放设置中选择是否启用。
    ```text
    Surface里维护着一个surfaceBuffer队列，供生产者、消费者轮换使用，且生产者和消费者往往不在同一个进程。
      - 生产者的逻辑：
          · RequestBuffer：生产者获取一个空闲的、可以往里填数据的buffer，同时获取出这个buffer对应的releaseFence。当fence等到后，生产者可以往这块buffer里生产数据
          · FlushBuffer：生产者生产完后，将该buffer以及该buffer对应的acquireFence送回给surface。
          · CancelBuffer：生产者没有向该buffer里生产数据，仅做归还。
      - 消费者的逻辑：
          · AcquireBuffer: 消费者获取一个已生产好的buffer，同时获取出这个buffer对应的acquireFence。当fence等到后，消费者可以开始读取这块buffer里的内容。
          · ReleaseBuffer：消费者消费完成后将buffer以及该buffer对应的releaseFence归还给surface。
    ```
- 应用收到解码后的OH_AVBuffer后，需要及时释放归还buffer。Surface模式可调用OH_VideoDecoder_RenderOutputBuffer或OH_VideoDecoder_RenderOutputBufferAtTime送显并释放；Buffer模式处理完共享内存数据后调用OH_VideoDecoder_FreeOutputBuffer释放，本示例的Buffer模式送显由NativeWindow图形接口完成。
  ```text
  用RK3568设备播放，由于调用OH_NativeWindow_NativeWindowSetScalingModeV2接口后，实际未生效，最后显示画面可能会有拉伸，应用可以用另一种方法解决：
  在解封装拿到视频的宽高信息后，回调到UI层，UI层根据这个宽高，更改XComponet的尺寸，达到一样的效果，参考如下代码：
    import display from '@ohos.display'
    private display = display.getDefaultDisplaySync()
    @State xcomponentHeight: number | string | Resource = 1
    @State xcomponentWidth: number | string | Resource = 1
    
    if (data.videoWidth / data.videoHeight > this.display.width / this.display.height) {
      this.xcomponentHeight = (this.display.width * data.videoHeight / data.videoWidth) + 'px';
      this.xcomponentWidth = this.display.width + 'px';
    } else {
      this.xcomponent = this.display.height + 'px';
      this.xcompoentWidth = (this.display.height * data.videoWidth / data.videoHeight) + 'px'
    }
  ```


##### Buffer轮转
一、surface的buffer轮转

轮转方最多有四个：
- us ： hcodec/框架自己
- user : hcodec的调用者
- omx : vendor编解码器

surface: 在解码时，surface指消费者；编码时，surface指生产者

以解码器surface模式的某个输出buffer为例：

一开始是hcodec分配出来————owned by us

然后给到vendor(即us->omx)————owned by omx

vendor填好后还给hcodec(即omx->us)————owned by us

hcodec给到应用(即us->user)————owned by user

app等到音画同步后还给hcodec(即user->us)————owned by us

hcodec flushBuffer给surface， 让消费者消费(即us->surface)————owned by surface

消费者消费完后，hcodec去requestBuffer(即surface->us)————owned by us

给vendor(即us->omx)————owned by omx

其他模式不再赘述，直接看图表

![img_2.png](screenshots/img_2.png)

#### *录制*

- 点击“设置”(可选)，设置相应的规格后，本示例会先校验当前的相机是否支持输出该规格的流，不支持则更改为默认的1080P的流，若1080P的流仍不支持，则更改为相机能输出配置流的第一个配置。
- 点击录制后，确定保存后，本示例会根据用户设置选择的配置(未选择则默认1080P)，首先创建一个该配置对应的编码器，同时创建好封装器，Surface模式下，编码器OH_VideoEncoder_GetSurface接口，会给应用一个OHNativeWindow **window，来接收编码输入。
- 使用这个window，调用OH_NativeWindow_GetSurfaceId接口，能拿到window对应的surface的surfaceId，此surfaceId用做相机的录像流的输出surfaceId。
- 把surfaceId回调到UI层，UI层拿到surfaceId后，携带主页配置的参数信息和surfaceId，路由跳转到录制页面。
- 录制页面构建时，XComponent构建时，会触发.onLoad()方法，此时能拿到Xcomonent对应的surface的surfaceId，此surfaceId用做相机的预览流的输出surfaceId。
- 有了两个surfaceId，和想要的相机配置，就能开始创建相机，开始录像了。
- 参考上文的buffer轮转，本示例在XComponent.onLoad()触发后，建立了一个相机生产，XComponent消费相机预览流，编码器消费相机录像流的生产消费模型，但此时编码器还未开始消费。
- 待用户在录像页面点击“开始录制”后，本示例才会调用编码器的OH_VideoEncoder_Start()方法，开始录像编码。
- 编码Surface，由surface生产端(本例是相机)直接往surface内flush SurfaceBuffer，surface内收到buffer后，编码器自动开始编码。
- 待编码完成后，会触发输出回调给应用，里面会带有每帧编码后的OH_AVBuffer和其对应的index。
- 此时应用可以调用OH_AVBuffer_GetAddr获取OH_AVBuffer内buffer的内存地址，OH_AVBuffer_GetBufferAttr获取编码后buffer的size等参数信息，本例是直接通过封装器，将其写入文件帧。
  ```text
  若使用RK3568相机录制，相机输出RGBA格式流到编码器Surface，实际flush到Surface里的buffer画面异常，导致最后的录像文件，播放起来的效果不对。
  ```

![img_8.png](screenshots/img_8.png)

<a id="av-sync"></a>

### 音画同步

#### 前言

##### 背景和目的

目前手机播放器在输出设备为蓝牙耳机时会出现严重音视频不同步现象，严重影响用户体验。本文旨在指导第三方视频播放应用正确获取并使用音频相关信息来保证音视频同步。

精确的音视频同步是媒体播放的关键性能指标之一。一般来说，在录音设备上同时录制的音频和视频需要在播放设备（例如手机，电视，媒体播放器）上同时播放。为了实现设备上的音视频同步，可以按如下指南操作。

##### 概念定义

| Abbreviations缩略语 | Full spelling 英文全名      | Chinese explanation 中文解释 |
|------------------|:------------------------|:-------------------------|
| PTS              | Presentation Time Stamp | 送显时间戳                    |
| DTS              | Decoding Time Stamp     | 解码时间戳                    |

- DTS（解码时间戳）
  指音视频数据在解码器中开始解码的时间戳。它表示解码器应该从输入数据流中读取和解码的特定时间点。DTS用于控制解码器的解码顺序，确保音视频数据按照正确的顺序解码。
- PTS（显示时间戳）
  指音视频数据在播放时应该显示给用户的时间戳。它表示解码后的音视频数据在播放时应该出现在屏幕上或传递给音视频输出设备的时间点。PTS用于控制音视频的播放顺序和时序，以确保音视频在正确的时间点进行显示或播放。

##### 音画同步原理

音视频数据的最小处理单元称为帧。音频流和视频流都被分割成帧，所有帧都被标记为需要按特定的时间戳显示。音频和视频可以独立下载和解码，但就具有匹配时间戳的音频和视频帧应同时呈现，达到A/V同步的效果。

![img.png](screenshots/img.png)

理论上，因为音频通路存在时延，匹配音频和视频处理，有三种A/V同步解决方案可用；

（1）连续播放音频帧：使用音频播放位置作为主时间参考，并将视频播放位置与其匹配。

（2）使用系统时间作为参考：将音频和视频播放与系统时间匹配。

（3）使用视频播放作为参考：让音频匹配视频。


| 策略名称        | 优点                                                  | 缺点                                                                       |
|-------------|:----------------------------------------------------|:-------------------------------------------------------------------------|
| 连续播放音频帧（推荐） | ①用户肉眼的敏感度较弱，不易察觉视频微小的调整。<br/>②容易实现，因为视频刷新时间的调整相对容易。 | ①如果视频帧率不稳定或延迟渲染大，可能导致视频卡顿或跳帧。                                            |
| 使用系统时间作为参考  | 可以最大限度地保证音频和视频都不发生跳帧行为。                             | ①需要额外依赖系统时钟，增加系统复杂性和维护成本。<br/>②系统时钟的准确性对同步效果影响较大，如果系统时钟不准确，可能导致同步效果大打折扣。 |
| 使用视频播放作为参考  | 音频可以根据视频帧进行调整，减少音频跳帧的情况。                            | ①音频播放可能会出现等待或加速的情况，相较于视频，会对用户的影响更为严重和明显。<br/>②如果视频帧率不稳定，可能导致音频同步困难。      |

第一个选项是唯一一个具有连续音频数据流的选项，没有对音频帧的显示时间、播放速度或持续时间进行任何调整。这些参数的任何调整都很容易被人的耳朵注意到，并导致干扰的音频故障，除非音频被重新采样；但是，重新采样也会改变音调。因此，一般的多媒体应用使用音频播放位置作为主时间参考。以下段落将讨论此解决方案。（其它两个选项不在本文档的范围内）

### 效果展示

#### 场景说明

#### 适用范围

适用于应用中视频播放过程中，由于设备渲染延迟、播放链路异常导致的音画不同步的场景

##### 场景体验指标

音画同步标准

① 为了衡量音画同步的性能，用对应音频和视频帧实际播放时间的差值作为数值指标，数值大于0表示声音提前画面，小于0表示声音落后画面。

② 最大卡顿时长，单帧图像停滞时间超过100ms的，定义为卡顿一次。连续测试5分钟，建议设置为100ms。

③ 平均播放帧率，平均每秒播放帧数，不反映每帧显示时长。

测试基准：一倍速场景

|        | 范围             | 主观体验 |
|--------|:---------------|:-----|
| S标（建议） | [-80ms, 25ms]  | 无法察觉 |
| A标     | [-125ms, 45ms] | 能够察觉 |
| B标     | [-185ms, 90ms] | 能够察觉 |

| 描述   | 应用内播放视频，音画同步指标应满足[-125ms, 45ms]。 |
|------|:---------------------------------|
| 类型   | 规则                               |
| 适用设备 | 手机、折叠屏、平板                        |
| 说明   | 无                                |

#### 场景分析

##### 典型场景及优化方案

**典型场景描述**
应用内播放视频，音画同步指标应满足[-80ms, 25ms].
**场景优化方案**
该解决方案使用：

- 视频同步到音频（主流方案）
- 获取音频渲染进度动态调整视频渲染进度

最终实现音画同步[-80ms,25ms]的效果。


**图2 音画同步示意图**

![img_1.png](screenshots/img_1.png)

#### 场景实现

##### 场景整体介绍

音频和视频的管道必须同时以相同的时间戳呈现每帧数据。音频播放位置用作主时间参考，而视频管道只输出与最新渲染音频匹配的视频帧。对于所有可能的实现，精确计算最后一次呈现的音频时间戳是至关重要的。OS提供API来查询音频管道各个阶段的音频时间戳和延迟。

音频管道通过 `OH_AudioRenderer_GetAudioTimestampInfo()` 查询最新提交到硬件的媒体采样帧位置和对应单调时钟时间。该接口能够适配倍速变化，例如 X2 播放时 `framePosition` 的增长速度约为 X1 的两倍，因此应用不再自行反推跨倍速区间的硬件位置。

##### 接口说明

```cpp
/*
 * Query the time at which a particular frame was presented.
 *
 * @param renderer Reference created by OH_AudioStreamBuilder_GenerateRenderer()
 * @param framePosition Pointer to a variable to receive the position
 * @param timestamp Pointer to a variable to receive the timestamp
 * @return Function result code:
 *         {@link AUDIOSTREAM_SUCCESS} If the execution is successful.
 *         {@link AUDIOSTREAM_ERROR_INVALID_PARAM} Invalid renderer or output pointer.
 *         {@link AUDIOSTREAM_ERROR_ILLEGAL_STATE} Execution status exception.
 */
OH_AudioStream_Result OH_AudioRenderer_GetAudioTimestampInfo(OH_AudioRenderer* renderer,
    int64_t* framePosition, int64_t* timestamp);
```

注意事项：

(1)
`OH_AudioRenderer_Start` 到真正写入硬件有一定延迟，因此启动后需要一段时间才能拿到有效值。音频未发声期间，画面先按当前帧间隔播放，时间戳稳定后再切换为音频主时钟。

(2)`OH_AudioRenderer_GetAudioTimestampInfo` 的 `framePosition` 已适配播放倍速，表示媒体时间线上的硬件提交位置。应用累计的 `audioFramesWritten` 同样使用未除以倍速的媒体采样帧单位，两者可以直接相减。

(3)OH_AudioRenderer_Flush接口执行后，framePosition返回值会重新(从0)开始计算。

(4)`OH_AudioRenderer_GetFramesWritten` 接口在 Flush 时不会清空，不应与 `OH_AudioRenderer_GetAudioTimestampInfo` 的位置混合计算。

(5)音频设备切换时 `framePosition` 可能被重置，而 `timestamp` 仍单调递增。切换后的时间戳恢复稳定之前，视频按现有帧间隔继续送显，避免画面卡住。

(6)系统保证设置倍速后，新写入 AudioRenderer 的采样点按新倍速处理。应用侧以当前目标倍速外推 `timestamp` 到当前单调时钟的媒体时间，但不把解码器 ADAPTIVE 的动态保帧比例当作音频倍速。

##### 关键代码片段

(1)获取音频渲染的位置

```cpp
int64_t framePosition = 0;
int64_t timestamp = 0;
int32_t ret = OH_AudioRenderer_GetAudioTimestampInfo(audioRenderer_, &framePosition, &timestamp);
AVCODEC_SAMPLE_LOGI("VD framePosition: %{public}li, audioTimestamp: %{public}li", framePosition, timestamp);
audioTimeStamp = timestamp;
```

(2)音频启动前暂不做音画同步

- 音频未启动前，timestamp和framePosition返回结果为0，为避免出现卡顿等问题，暂不同步

```cpp
    if (ret != AUDIOSTREAM_SUCCESS || (timestamp == 0) || (framePosition == 0)) {
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
```

(3)根据视频帧pts和音频渲染位置计算延迟waitTimeUs

- audioPlayedTime音频帧期望渲染时间
- videoPlayedTime视频帧期望送显时间

```cpp
int64_t pendingFrames = std::max(audioFramesWritten - framePosition, int64_t { 0 });
int64_t latency = pendingFrames * 1000 * 1000 / sampleInfo_.audio.audioSampleRate;

nowTimeStamp = GetCurrentTime();
int64_t anchorDiff = (nowTimeStamp - audioTimeStamp) / 1000;

int64_t audioPlayedTime = currentAudioPts - latency + anchorDiff * speed;
int64_t videoPlayedTime = bufferInfo.attr.pts;

int64_t mediaWaitTimeUs = videoPlayedTime - audioPlayedTime;
int64_t waitTimeUs = mediaWaitTimeUs / speed;
```

`videoPlayedTime - audioPlayedTime` 是媒体时间差，而线程 sleep 和 `renderAtTime` 使用的是墙钟时间，因此倍速播放时还需要除以当前目标倍速。例如视频在媒体时间线上领先音频 60ms，X3 时真实只需等待约 20ms。

对于 240fps 等超过 RS 最大消费帧率的视频，X1 使用 FULL；带音频或纯视频进入 X2/X3 时都可切到 ADAPTIVE，并同步下发目标倍速。智能流畅可能使相邻输出帧的 PTS 间隔变大，但保留帧的 PTS/DTS 不变，因此应用必须直接按音频主时钟和当前视频 PTS 计算等待时间，不能再把等待时间截断为一个或两个源视频帧间隔。RS 的实际显示帧数和 ADAPTIVE 的动态保帧结果都不参与音频倍速计算。

(4)根据业务延迟做音画同步策略

- [,-40ms) 视频帧较晚，此帧丢掉
- [-40ms,0ms)视频帧直接送显
- [0ms,)视频帧较早，根据业务需要选择现象追帧

```cpp
if (waitTimeUs < WAIT_TIME_US_THRESHOLD_WARNING) {
    dropFrame = true;
    AVCODEC_SAMPLE_LOGI("VD buffer is too late");
} else {
    AVCODEC_SAMPLE_LOGE("VD buffer is too early waitTimeUs:%{public}ld", waitTimeUs);
    if (waitTimeUs > WAIT_TIME_US_THRESHOLD) {
        waitTimeUs = WAIT_TIME_US_THRESHOLD;
    }
}
```

(5)进行音画同步
若视频帧需要等待较长时间，先 sleep 到送显时间附近，再最多提前两个 60Hz VSync 周期调用 `renderAtTime`。这样既不会一次压入过多未来帧，也不会破坏 ADAPTIVE 输出帧的真实 PTS 间隔。

```cpp
const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, RENDER_AHEAD_US);
if (waitTimeUs > RENDER_AHEAD_US) {
    std::this_thread::sleep_for(std::chrono::microseconds(waitTimeUs - RENDER_AHEAD_US));
}
return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame,
    renderLeadUs * NS_PER_US + GetCurrentTime());
```

### 倍速播放方案

#### 当前方案

![img_4.png](screenshots/img_4.png)

Position 表示媒体时间线中的音频帧，一个音频帧由同一采样时刻的各声道采样点组成。例如双声道 S16 数据每帧为 4 字节，48kHz 音频每秒包含 48000 帧。

应用在 AudioRenderer 写回调中累计实际取出的 PCM 帧数 `audioFramesWritten`，并从最新 PCM PTS 中扣除队列剩余时长，得到已提交数据末端的媒体位置。`OH_AudioRenderer_GetAudioTimestampInfo()` 返回倍速感知的 `framePosition` 和单调时钟锚点，两者计算如下：

```text
pendingFrames = max(audioFramesWritten - framePosition, 0)
latencyUs = pendingFrames * 1000000 / sampleRate
anchorDiffUs = (nowNs - timestampNs) / 1000
audioPlayedTimeUs = currentAudioPts - latencyUs + anchorDiffUs * targetSpeed
```

长按窗口和倍速菜单下发的是明确的目标倍速，当前长按为 X2，菜单可选择 X1/X2/X3。智能流畅中的 ADAPTIVE 只按目标倍速、运动信息和系统状态动态选择保留哪些视频帧，并不改变媒体时间线。带音频和纯视频使用同一套模式切换：初始化和 X1 使用 FULL，进入 X2/X3 时更新 `OH_MD_KEY_VIDEO_DECODER_SPEED` 并启用 ADAPTIVE，恢复 X1 时切回 FULL。带音频视频额外以 AudioRenderer 为主时钟，并把媒体时间差除以目标倍速后再调度送显；UI 通过 Native 查询本次播放是否支持该能力，仅在实际可用时显示“X2/X3（智能流畅）”。固定的 `OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_RATIO` 不参与正常倍速播放，只用于 UNIFORM 温控降载。

### 环境配置
#### OpenHarmony
切换OpenHarmony工程，签名后运行，右下角报错：

![img_5.png](screenshots/img_5.png)

将对应字段填入 entry/src/main/syscap.json 中即可

#### HarmonyOS
若切换成HarmonyOS工程，搜索runtimeOS，将OpenHarmony字段改成HarmonyOS，上面的sdkVersion，改成"5.0.0(12)"这样的形式(保留双引号),搜索删除abiFilters字段后的"armeabi-v7a"参数。

### 相关权限

#### [ohos.permission.CAMERA](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioncamera)
#### [ohos.permission.MICROPHONE](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionmicrophone)

### 依赖

XComponent Camera

### 约束与限制

1.本示例仅支持标准系统上运行，支持Phone, RK3568;

2.本示例为Stage模型，仅支持 API26 及以上版本SDK, SDK版本号6.1.0.31及以上版本,镜像版本号支持6.1.0.19及以上版本;

3.本示例需要使用DevEco Studio 6.0 才可编译运行。

### 下载
如需单独下载本工程，执行如下命令：
```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/Media/AVCodec/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
