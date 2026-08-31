# AVCodecSample

English | [简体中文](./README_zh.md)

### Introduction

AVCodecSample is an API 26 sample application that demonstrates end-to-end video playback, audio playback, camera recording, encoding, demuxing, muxing, graphics output, and media lifecycle management.

- Playback pipeline: media file -> demuxer -> audio/video decoder -> graphics/audio output.
- Recording pipeline: camera and microphone capture -> audio/video encoder -> MP4 or FLV muxer.

<a id="feature-navigation"></a>

### Feature Overview and Navigation

The sample covers more than the basic codec APIs. It also demonstrates file selection, validation, two video rendering paths, A/V synchronization, variable-speed playback, smart fluency, precise seeking, playback state management, detailed media information, camera recording, and audio/video muxing.

#### Playback Features

| Feature | Behavior in this sample | Details |
|---|---|---|
| File selection and validation | Select media from File Manager or Gallery; empty and invalid files produce recognizable errors | [Playback entry and structured configuration](#playback-entry) |
| Demuxing | Reads source and track information such as duration, bitrate, dimensions, frame rate, profile, and codec configuration | [Demuxing](#demuxer) |
| Decoder selection | Supports automatic, hardware, and software decoder selection | [Video decoding](#video-decoding) |
| Synchronous/asynchronous codec mode | Async mode uses callback queues; sync mode actively queries input and output buffers from worker threads | [Video decoding](#video-decoding) |
| SurfaceMode output | The decoder outputs directly to the XComponent Surface and releases frames at the scheduled render time | [SurfaceMode output](#surface-output) |
| Last-frame behavior on stop | Choose whether SurfaceMode retains the last frame or outputs a blank frame when stopped/destroyed | [SurfaceMode output](#surface-output) |
| BufferMode output | The application obtains decoded buffers, copies them to a NativeWindowBuffer with stride awareness, and submits them through graphics APIs | [BufferMode output](#buffer-output) |
| BufferMode HDR Vivid | Propagates color space and HDR static/dynamic metadata and displays an HDR Vivid watermark after bitstream confirmation | [HDR Vivid detection and output](#hdr-vivid-output) |
| Decoded-frame dump | BufferMode can optionally save decoded frames in the application sandbox; disabled by default | [Buffer dump](#buffer-dump) |
| Audio decoding and playback | Decodes compressed audio to PCM and continuously feeds AudioRenderer | [Audio decoding and playback](#audio-playback) |
| Multi-track audio | Lists audio tracks and restarts playback with the selected container track | [Audio decoding and playback](#audio-playback) |
| Mute | Mutes or restores the configured volume during playback | [Audio decoding and playback](#audio-playback) |
| External SRT subtitles | Selects an `.srt` file and displays the cue matching the playback position | [External subtitles](#subtitle-playback) |
| Press-and-hold speed | Press and hold the playback window for X2; release to return to X1 | [Variable-speed playback](#playback-speed) |
| Speed menu | Select X1, X2, or X3 during playback | [Variable-speed playback](#playback-speed) |
| Smart fluency | Uses ADAPTIVE frame retention at X2/X3 and FULL at X1; thermal events may switch to UNIFORM | [Smart fluency](#smart-fluency) |
| A/V synchronization | Uses the AudioRenderer playback position as the master clock and waits, schedules, or drops video frames | [A/V synchronization](#av-sync) |
| Video transforms | Supports rotation, horizontal/vertical flip, and combined transforms | [Video transforms](#video-transform) |
| Progress and precise seek | Shows current position and duration; resumes decoding from a sync frame and discards output before the requested target | [Playback progress and seek](#playback-seek) |
| Playback controls | Supports pause/resume, 15-second rewind, 15-second forward, and replay while retaining the active decoders and position during pause | [Playback progress and seek](#playback-seek) |
| Playback status | Shows state, requested speed, active tracks, and smart-fluency availability | [Playback and media information](#playback-info) |
| Media details | Shows source, track, decoder, output, and raw Source/Track Format information | [Playback and media information](#playback-info) |
| Stop and cleanup | Handles explicit stop, natural completion, and errors through one state machine and release path | [Playback threads and lifecycle](#player-lifecycle) |

#### Recording Features

| Feature | Behavior in this sample | Details |
|---|---|---|
| Camera preview and page navigation | Initializes the encoder Surface on the home page, passes its SurfaceId to the recording page, and creates preview/recording streams | [Camera capture and recording](#camera-recording) |
| Video encoding | Camera frames are sent directly to the encoder Surface; H.264/H.265, sync/async output, bitrate, bitrate mode, and key-frame interval are configurable | [Video encoding](#video-encoding) |
| Audio capture and encoding | AudioCapturer collects PCM, AudioCodec encodes AAC, and the result is written to the muxer; sample rate, channel count, and AAC bitrate are configurable | [Audio capture and encoding](#audio-encoding) |
| HDR Vivid recording | Selects P010 and the corresponding color space when device capabilities support HDR recording | [Camera capture and recording](#camera-recording) |
| MP4/FLV muxing | Concurrently writes encoded audio and video; MP4 also stores rotation metadata | [Muxing](#muxing) |
| Recording finalization | Waits for CameraKit, encoder EOS, muxer release, and output-fd closure before returning | [Recording stop flow](#recording-stop) |
| Automated and device tests | Hypium covers deterministic logic; device tests cover codecs, output, synchronization, recording, and errors | [Testing](#testing) |

Encoder configuration is capability-driven. B-frames are optional and remain disabled by default; this sample neither queries nor writes `VIDEO_ENCODER_B_FRAME`, so devices that do not expose the optional feature do not emit an unnecessary warning or reject the default recording path.

### Playback Capability Summary

| Media type | Containers | Elementary streams |
|---|---|---|
| Video with optional audio | MP4, MKV, MPEG-TS, and other supported containers | Video: hardware AVC/H.264 and HEVC/H.265; software MPEG-2, MPEG-4, H.263, AVC/H.264. Audio: AAC, MP3, FLAC, Vorbis, AMR-NB/WB, G.711 mu-law, and APE |

For the complete list, see [AVCodec supported formats](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/media/avcodec/avcodec-support-formats.md).

### Recording Capability Summary

| Container | Video codec | Audio codec |
|:---:|:---:|:---:|
| MP4 | HEVC/H.265, AVC/H.264 | AAC, MPEG/MP3 |
| FLV | Depends on the selected profiles supported by the device | Depends on the selected profiles supported by the device |

### Preview

| Playback settings | Source selection | Playback speed | Recording page |
|---|---|---|---|
| ![Playback settings](screenshots/playback-settings.jpeg) | ![Source selection](screenshots/playback-source-picker.jpeg) | ![Playback speed](screenshots/playback-speed.jpeg) | ![Recording page](screenshots/recording-page.jpeg) |

### Usage

Playback does not require camera or microphone permission. Camera and microphone permissions are requested only when the user taps **Record**. The MP4 or FLV container is selected through **Container format** in recording settings; MP4 is the default.

If a permission is denied, the system may prevent the application from showing the same ordinary runtime-permission dialog again. The sample therefore calls `requestPermissionOnSetting()` to open the permission settings dialog and guide the user through granting the missing permission.

Push a media file to File Manager:

```text
hdc file send xx.mp4 storage/media/100/local/files/Docs
```

Push a media file to Gallery and trigger a media scan:

```text
hdc file send xx.mp4 storage/media/100/local/files
hdc shell mediatool send /storage/media/100/local/files/xx.mp4
```

#### Playback

1. Copy an audio-only, video-only, or audio/video file to the device, or record a new file in the sample.
2. Tap **Play**, select File Manager or Gallery, and choose the media file.
3. During playback, press and hold the video window for X2 playback and release for X1, or use the speed menu to select X1/X2/X3.
4. Use the progress slider to preview and seek, the transform control to rotate/flip the output, and the information panel to inspect demuxed metadata.

#### Recording

1. Optionally open recording **Settings** and configure container format, encoder, resolution, frame rate, codec mode, video bitrate, CBR/VBR bitrate mode, key-frame interval, AAC sample rate, channel count, and bitrate.
2. Tap **Record**.
3. Select the output location and tap **Save**.
4. Tap **Start Recording**.
5. Tap **Stop Recording** and wait for the recording page to return after the file has been finalized.

<a id="testing"></a>

### Testing

Automated tests are located in `entry/src/ohosTest/ets/test` and use Hypium to cover deterministic logic, including:

- time and recording-duration formatting;
- file-selection indexes, bounds, and empty-file checks;
- camera defaults and codec/resolution updates;
- complete parsing and invalid-value rejection for playback and recording settings;
- playback state, speed, track, time, and seek-boundary formatting;
- source, audio/video track, decoder, and raw Format panel formatting;
- playback, recording, container, dump, and NativeWindow transform configuration.

In DevEco Studio, select the `entry > ohosTest` target and run the test suite. Demuxing, hardware/software codecs, SurfaceMode/BufferMode output, audio sync/async output, permission dialogs, and camera recording depend on real-device capabilities and are covered by the manual test document: [AVCodecSample Manual Test Cases](./ohosTest.md).

The test HAPs can also be built and run from the command line:

```text
hvigorw --mode module -p product=default -p module=entry@ohosTest assembleHap
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.avcodecsample -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 300000"
```

### Project Structure

```text
AVCodec/
├── README.md                                # English sample guide and implementation notes
├── README_zh.md                             # Chinese sample guide and implementation notes
├── ohosTest.md                              # Manual real-device test cases
└── entry/src/
    ├── main/
    │   ├── cpp                              # Native layer
    │   │   ├── capabilities                 # Media capability wrappers and implementations
    │   │   │   ├── include                  # Codec, muxer, and demuxer interfaces
    │   │   │   ├── audio_capturer.cpp       # Audio capture
    │   │   │   ├── audio_decoder.cpp        # Audio decoding
    │   │   │   ├── audio_encoder.cpp        # Audio encoding
    │   │   │   ├── demuxer.cpp              # Demuxing
    │   │   │   ├── muxer.cpp                # Muxing
    │   │   │   ├── video_decoder.cpp        # Video decoding
    │   │   │   └── video_encoder.cpp        # Video encoding
    │   │   ├── common                       # Shared Native utilities
    │   │   │   ├── dfx                      # Logging and error codes
    │   │   │   ├── codec_buffer.h           # Codec buffer description and thread-safe queue
    │   │   │   ├── codec_user_data.h        # Runtime context shared by callbacks and workers
    │   │   │   ├── sample_callback.cpp      # Codec and AudioRenderer callbacks
    │   │   │   ├── sample_callback.h        # Shared callback declarations
    │   │   │   ├── sample_config.h          # Source, media, codec, and output options
    │   │   │   └── sample_info.h            # Compatibility aggregate for shared media types
    │   │   ├── render                       # XComponent and NativeWindow output
    │   │   │   ├── include                  # Graphics output interfaces
    │   │   │   ├── plugin_manager.cpp       # XComponent/window management
    │   │   │   └── plugin_render.cpp        # Surface lifecycle and interactions
    │   │   ├── sample/
    │   │   │   ├── player/
    │   │   │   │   ├── AudioOutputPump.cpp  # Shared async/sync audio output pump
    │   │   │   │   ├── BufferRenderer.cpp   # BufferMode copy-and-submit output
    │   │   │   │   ├── HdrMetadataHelper.cpp # HDR metadata detection/propagation
    │   │   │   │   ├── Player.cpp           # Playback, sync, seek, and cleanup
    │   │   │   │   ├── PlayerNapiParser.cpp # Playback and seek argument parsing
    │   │   │   │   ├── PlayerNapiParser.h   # NAPI argument parser interface
    │   │   │   │   ├── PlayerNapiSerializer.cpp # Playback/media result serialization
    │   │   │   │   ├── PlayerNapiSerializer.h # NAPI serializer interface
    │   │   │   │   ├── VideoSink.h            # Surface/Buffer video output abstraction
    │   │   │   │   ├── SurfaceVideoSink.h     # Direct Surface presentation
    │   │   │   │   ├── BufferVideoSink.h      # Buffer copy-and-submit presentation
    │   │   │   │   ├── VideoPipeline.h/.cpp   # Video decoder thread lifecycle
    │   │   │   │   ├── AudioPipeline.h        # Audio decoder thread lifecycle
    │   │   │   │   ├── PlayerNative.cpp       # NAPI registration, callbacks, and dispatch
    │   │   │   │   ├── PlaybackClock.cpp/.h # Shared audio playback clock state
    │   │   │   │   ├── AvSyncController.cpp/.h # A/V sync wait/drop decisions
    │   │   │   │   ├── SeekController.cpp/.h # Precise seek frame/PCM trimming
    │   │   │   │   └── PlayerStateMachine.cpp/.h # Legal playback state transitions
    │   │   │   └── recorder/
    │   │   │       ├── Recorder.cpp         # Recording lifecycle and data flow
    │   │   │       └── RecorderNative.cpp   # Recording NAPI entry
    │   │   ├── types                        # ArkTS declarations for Native modules
    │   │   └── CMakeLists.txt               # Native build entry
    │   ├── ets                              # ArkTS UI and application logic
    │   │   ├── common                       # Constants and utilities
    │   │   ├── entryability/EntryAbility.ets
    │   │   ├── model                        # UI state and settings models
    │   │   ├── viewmodel                    # Playback state ViewModel
    │   │   │   └── PlaybackViewModel.ets    # Polling, progress, HDR, and reset state
    │   │   ├── components                   # Reusable UI components
    │   │   │   ├── MediaInfoPanel.ets       # Scrollable media information panel
    │   │   │   └── PlaybackProgressPanel.ets # Status, slider, and seek preview
    │   │   ├── pages/Index.ets              # Home, playback, and recording entry
    │   │   └── recorder/pages/Recorder.ets  # Camera preview and recording page
    │   ├── resources                        # Localized resources
    │   └── module.json5
    └── ohosTest/                            # Hypium test module
        ├── ets/test
        │   ├── CameraDataModel.test.ets     # Camera configuration model tests
        │   ├── CommonConstants.test.ets     # Playback and recording constants tests
        │   ├── DateTimeUtil.test.ets        # Time formatting tests
        │   ├── List.test.ets                # Suite entry
        │   ├── MediaInfoModel.test.ets      # Media information formatting tests
        │   ├── MediaUtils.test.ets          # File selection and empty file tests
        │   ├── PlaybackInfoModel.test.ets   # Playback status and seek formatting tests
        │   ├── PlaybackViewModel.test.ets   # Playback ViewModel state tests
        │   ├── PlayerSettingsModel.test.ets # Playback setting model tests
        │   ├── SubtitleModel.test.ets       # SRT parsing and cue lookup tests
        │   ├── RecorderSettingsModel.test.ets # Recording setting model tests
        │   └── TestCaseLogger.ets           # Case naming and Hilog helper
        ├── ets/testability                  # Test Ability and page
        ├── ets/testrunner                   # OpenHarmony test runner
        ├── resources
        └── module.json5
```

### Implementation

#### End-to-End Architecture

The sample can be understood as: **UI selects a scenario -> ArkTS prepares options and Surfaces -> Native creates media objects -> worker threads move input/output buffers -> graphics, audio, or file consumers receive the result**.

| Scenario | UI entry | Native entry | Main modules | Destination |
|---|---|---|---|---|
| Playback | Play controls and XComponent in `Index.ets` | `PlayerNative.cpp`, `Player.cpp` | `Demuxer`, `VideoDecoder`, `AudioDecoder`, `AudioOutputPump`, `BufferRenderer`, `PluginRender` | Video to XComponent/NativeWindow; PCM to AudioRenderer |
| Recording | Record controls in `Index.ets`; preview in `Recorder.ets` | `RecorderNative.cpp`, `Recorder.cpp` | `VideoEncoder`, `AudioCapturer`, `AudioEncoder`, `Muxer` | Camera video and microphone audio to MP4/FLV |
| Graphics output | XComponents on playback/recording pages | `PluginManager`, `PluginRender`, `BufferRenderer` | Native XComponent, NativeWindow, NativeBuffer | Direct codec output in SurfaceMode; application copy in BufferMode |
| Demuxing | Selected source file | `Demuxer.cpp` | `OH_AVSource`, `OH_AVDemuxer` | Track metadata and compressed samples to decoders |
| Muxing | Media-library output file | `Muxer.cpp` | `OH_AVMuxer` | Encoded audio/video to the destination file |

Core data structures:

- `SampleInfo`, defined in `sample_config.h`, groups source, video, audio, codec, output, and playback-callback options.
- `CodecUserData`, defined in `codec_user_data.h`, is the runtime context shared by codec callbacks and worker threads. `Player` owns playback contexts with `unique_ptr`; C callbacks receive temporary non-owning pointers from `.get()`.
- `CodecBufferInfo` and `CodecBufferQueue`, defined in `codec_buffer.h`, package codec buffer data and provide the thread-safe handoff queue. `sample_info.h` remains as a compatibility aggregate for existing includes.
- `SampleCallback` receives async `OnNeedInputBuffer` and `OnNewOutputBuffer` callbacks and enqueues work in `CodecUserData`.
- `AudioOutputPump` unifies asynchronous queue consumption and synchronous output queries, appends PCM to `renderQueue`, and delegates buffer release and clock accounting to `Player`.

#### Codec Capability Checks and Configuration Feedback

Before writing supported codec parameters to an `OH_AVFormat`, the sample queries the capability of the codec that will actually be used. `OH_AVCodec_GetCapability()` is used for the recommended codec; selecting a hardware or software video decoder uses `OH_AVCodec_GetCapabilityByCategory()` with the matching category. The shared `CodecCapability` module checks video size, size/frame-rate combinations, pixel formats, encoder bitrate mode/range and profile, plus audio sample-rate lists and channel-count ranges.

Capability objects are owned by the framework and are not destroyed by the sample. A failed query or unsupported value stops configuration before the format is submitted and logs the MIME type, direction, category, and offending value. Recording initialization propagates this failure to ArkTS, which tells the user to adjust the codec, resolution, or frame rate. Rotation, sync mode, HDR Vivid metadata, codec configuration bytes, and similar fields have no generic capability query in the Native API; their codec configure return value remains the final check and its error code is logged.

The playback settings expose `OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN`, allowing SurfaceMode to retain the last frame or output a blank frame when stopped or destroyed. `OH_MD_KEY_ENABLE_SYNC_MODE` is controlled by the Sync/Async selection. Smart-fluency retention mode, target speed, and thermal retention ratio remain runtime policies. Low-latency decoding and decoding-order output are possible advanced settings, but require capability checks and separate validation because they affect buffering, frame order, and A/V synchronization.

The current settings sheet now includes three advanced switches: low-latency decoding, output in decoding order, and HDR Vivid to BT.709 conversion. The first two are checked with `OH_AVCapability_IsFeatureSupported()` before configuration and reject unsupported codec/device combinations. The color-space key `OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE=OH_COLORSPACE_BT709_LIMIT` is only sent when the selected media is signaled as HDR Vivid; ordinary media is left unchanged.

Two API 26 capabilities are enabled by default in the Native build:

- `AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY` for playback frame-retention, speed, and thermal parameters.
- `AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID` for reading temporal-layer IDs from encoded video output.

When building with an older Native SDK that does not provide these APIs, disable them with `-DAVCODEC_SAMPLE_ENABLE_SMART_FLUENCY=OFF` or `-DAVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID=OFF`.

<a id="playback-entry"></a>

#### Playback Entry and Structured Configuration

The UI uses ArkUI's declarative programming model. `Index.ets` is the home and playback page, while `Recorder.ets` is the camera preview and recording page. Both are declared in `main_pages.json`:

```json
{
  "src": [
    "pages/Index",
    "recorder/pages/Recorder"
  ]
}
```

The home page provides both playback and recording entry points:

- Playback uses `XComponent({ id: 'player', type: XComponentType.SURFACE, libraryname: 'player' })`. Loading `libplayer.so` lets the Native module unwrap the XComponent and register Surface callbacks through `PluginManager::Export()`.
- Playback settings are displayed in a scrollable ArkUI `bindSheet`. Decoder type, output mode, and codec mode each occupy one row and open a single-column picker. Decoded-frame dump uses a switch. User-facing labels such as **Automatic**, **Hardware decoder**, **Software decoder**, **SurfaceMode direct output**, and **BufferMode copy output** are mapped to the original Native enum values.
- Opening the settings sheet creates a temporary copy of `PlayerSettingsModel`. **Apply** validates and commits the complete configuration, **Cancel** discards the temporary copy, and **Restore Defaults** only resets the temporary values until Apply is selected. Audio volume is available from 0% to 100% and is applied immediately to the active output through `OH_AudioRenderer_SetVolume()`. Audio output latency can be Normal or Low and is applied through `OH_AudioStreamBuilder_SetLatencyMode()` when the next AudioRenderer is created. Low latency reduces output buffering but increases underrun risk.
- After a source is selected, ArkTS opens the URI with `fileIo.openSync()`, records the fd and file size, and calls the structured `player.play(options, callback)` API.
- The completion callback returns `{ success, reason }`, where `reason` is `completed`, `stopped`, or `error`. Only an actual error produces the invalid-media prompt.
- During playback the main button becomes **Stop**. `player.stop()` moves the UI into a stopping state until the shared Native release path invokes the completion callback.
- `player.getPlaybackInfo()` refreshes state, speed, position, duration, tracks, smart-fluency availability, and confirmed BufferMode HDR Vivid state.
- `player.getMediaInfo()` opens a scrollable panel containing source, video track, audio track, decoder/output settings, raw Source Format, and raw Track Format sections.
- When BufferMode output contains both `OH_VIDEO_HDR_VIVID` and non-empty `OH_HDR_DYNAMIC_METADATA`, a translucent **HDR Vivid** watermark is displayed near the upper-right corner of the playback area. SurfaceMode does not expose the actual image buffer to the application, so per-frame dynamic metadata is not inspected on that path.
- Press-and-hold temporarily calls `player.setPlaybackSpeed(2)`. The speed menu can select X1, X2, or X3. When smart fluency is available, X2/X3 is identified as smart-fluency playback.
- Transform controls call `player.setTransform(transformHint)`, which applies `SET_TRANSFORM` to the active NativeWindow.

The structured `PlayOptions` object has the following shape:

```ts
{
  inputFileFd,
  inputFileOffset,
  inputFileSize,
  videoDecoderType,
  videoDecoderRunMode,
  videoDecoderSyncMode,
  isSmartFluencySupported,
  enableVideoDump,
  retainLastFrame,
  enableLowLatency,
  outputInDecodingOrder,
  convertHdrVividToBt709,
  audioVolume,
  enableAudioLowLatency
}
```

Audio playback settings also expose volume (0–100%), applied immediately through `OH_AudioRenderer_SetVolume()`, and Normal/Low output latency, applied with `OH_AudioStreamBuilder_SetLatencyMode()` when the next `AudioRenderer` is created. Low latency reduces buffering but may increase underrun risk. Track-derived sample rate, channel count, channel layout, and sample format are not overridden by the UI.

`PlayerNapiParser` reads named fields and fills `SampleInfo`. `PlayerNative` retains NAPI registration,
completion-callback dispatch, and the calls to `Player::Init()` / `Player::Start()`. `PlayerNapiSerializer` converts
playback results, playback state, and media information into ArkTS objects. This keeps parsing, serialization, and
playback orchestration independent while preserving the existing NAPI contract.

<a id="recording-entry"></a>

#### Recording Entry, Page Navigation, and Interaction

Recording also starts from `Index.ets`:

- A separate scrollable settings sheet, sized to 85% of the screen, groups recording options into Container and output, Video encoding, Audio encoding, and Encoding control. Users select MP4 or FLV, video parameters, AAC sample rate/channel count/bitrate, audio capture latency, video stabilization, and sync/async mode there. `RecorderSettingsModel` validates all temporary values and updates `CameraDataModel` only when **Apply** is selected.
- `checkIsProfileSupport()` queries `camera.getCameraManager()` for the selected video profile. Unsupported settings fall back to 1080p, or to the first device-supported profile if 1080p is unavailable.
- `photoAccessHelper.createAsset()` creates the destination media asset and `fileIo.open()` obtains the output fd.
- `recorder.initNative(...)` creates the encoder and muxer. `OH_NativeWindow_GetSurfaceId()` returns the encoder input SurfaceId.
- The home page navigates with `getUIContext().getRouter().pushUrl()` and passes `CameraDataModel`, including the encoder SurfaceId, to `recorder/pages/Recorder`.

The recording page connects the camera to two Surfaces:

- XComponent `.onLoad()` obtains the preview SurfaceId.
- `createRecorder()` creates CameraManager, CameraInput, VideoSession, preview output, and recording output.
- The preview stream targets the XComponent Surface.
- The recording stream targets the Native encoder Surface.
- Starting recording first enables camera video output and then starts the Native muxer, video encoder, AudioCapturer, and audio encoder.
- Stopping waits for camera output and `frameEnd`, then runs `stopBeginNative()` and `stopEndNative()`. The output fd is closed and the camera is released only after encoder EOS and muxer finalization, preventing delayed Gallery visibility.

<a id="graphics-output"></a>

#### Graphics Output and XComponent

Graphics output is implemented by ArkUI XComponent plus Native `PluginManager`, `PluginRender`, and `BufferRenderer`.

When `libplayer.so` is loaded, `PluginManager::Export()`:

1. Reads `OH_NATIVE_XCOMPONENT_OBJ` from the NAPI exports object.
2. Calls `napi_unwrap()` to obtain `OH_NativeXComponent*`.
3. Reads the component ID with `OH_NativeXComponent_GetXComponentId()`.
4. Stores the framework-owned XComponent as a non-owning pointer and creates the matching `PluginRender`.
5. Registers Surface lifecycle callbacks.

Important callbacks:

- `OnSurfaceCreatedCB()` stores the framework-owned `OHNativeWindow*` as a non-owning reference and configures `OH_SCALING_MODE_SCALE_FIT_V2`.
- `OnSurfaceChangedCB()` records the new offset, width, and height.
- `OnSurfaceDestroyedCB()` clears the window reference and releases the corresponding render wrapper. Framework-owned XComponent and NativeWindow objects are not destroyed by the sample.
- Touch callbacks implement press-and-hold speed changes.

<a id="surface-output"></a>

##### SurfaceMode Output

SurfaceMode passes the current XComponent NativeWindow to `OH_VideoDecoder_SetSurface()`. Decoder output buffers circulate between the codec and Surface; the application receives buffer metadata but not the decoded image address. After A/V scheduling, the sample calls `OH_VideoDecoder_RenderOutputBufferAtTime()` to release the frame for display at the requested monotonic timestamp, or frees it without rendering when the frame must be dropped.

This path minimizes copies and is the preferred normal playback path. It cannot directly dump decoded pixels or inspect per-frame image metadata because the actual image buffer remains in the codec/Surface pipeline.

<a id="buffer-output"></a>

##### BufferMode Output

BufferMode configures the decoder without a Surface. The application obtains the decoded `OH_AVBuffer`, validates its dimensions, pixel format, stride, and slice height, and submits it through `BufferRenderer`:

```text
Decoder output OH_AVBuffer
        ↓
Read valid pixels with decoder stride/slice-height awareness
        ↓
OH_NativeWindow_NativeWindowRequestBuffer
        ↓
Map OH_NativeBuffer / NativeWindowBuffer
        ↓
Copy rows into the destination buffer using destination stride
        ↓
Propagate color space and HDR metadata when available
        ↓
OH_NativeWindow_NativeWindowFlushBuffer
        ↓
OH_VideoDecoder_FreeOutputBuffer
```

The copy is intentionally retained because decoder output ownership and NativeWindow consumer ownership are independent. Reusing the decoder buffer directly would require an attach/detach protocol plus a reliable “display completed” fence before returning it to the decoder. This sample uses a clear copy-and-release model that works for both rendering and optional dump.

`BufferRenderer` requests one destination buffer per frame, copies only valid image rows, flushes it to the window with the scheduled timestamp, and returns the decoder output buffer immediately after submission. Supported layouts include the pixel formats handled by the current decoder configuration, with stride-aware paths for planar/semi-planar YUV and RGBA.

<a id="hdr-vivid-output"></a>

##### HDR Vivid Detection and Output

Container metadata is displayed as reference information, but confirmed playback state comes from decoded BufferMode output. `HdrMetadataHelper` checks the decoded video type and dynamic metadata, then propagates relevant color-space, HDR static metadata, and HDR dynamic metadata to the destination NativeBuffer before it is flushed.

The UI watermark is enabled only after the decoded output confirms HDR Vivid. This prevents ordinary SDR, HDR10, or a container-only declaration from being mislabeled. The confirmed state remains valid for the current playback session and is cleared when playback ends.

<a id="buffer-dump"></a>

##### Buffer Dump

Decoded-frame dump is optional and only applies to BufferMode. When enabled, `Player::DumpOutput()` writes decoded frames into the application sandbox using a file name that includes pixel format, dimensions, and timestamp. Dump and display use the same decoded output, but dump can be disabled independently to avoid storage and I/O overhead.

Frames decoded only as precise-seek preroll are never rendered or dumped.

<a id="demuxer"></a>

#### Demuxing

`Demuxer::Create()` builds `OH_AVSource` and `OH_AVDemuxer` from the selected fd, offset, and size. It reads the source format and each track format, selects audio/video tracks, and fills `SampleInfo` with fields such as:

- duration and file size;
- codec MIME;
- dimensions, frame rate, bitrate, profile, and rotation;
- audio sample format, sample rate, channels, channel layout, and bitrate;
- codec configuration data;
- container HDR Vivid declaration;
- raw source and track Format dumps for the media-information panel.

Compressed samples are read with:

```cpp
OH_AVDemuxer_ReadSampleBuffer(demuxer_, trackId, buffer);
OH_AVBuffer_GetBufferAttr(buffer, &attr);
```

The resulting `OH_AVCodecBufferAttr` and compressed bytes are passed to the matching decoder. EOS is propagated with `AVCODEC_BUFFER_FLAGS_EOS`.

<a id="video-decoding"></a>

#### Video Decoding

The selected decoder MIME and decoder type are used to create and configure `VideoDecoder`. The configuration includes width, height, pixel format, frame rate, codec configuration, run mode, and optional API 26 smart-fluency settings.

- Async mode registers callbacks. Input/output buffer notifications are queued in `CodecUserData`, then consumed by worker threads.
- Sync mode actively queries input/output buffers with bounded timeouts so Stop and Seek do not wait for a multi-second codec timeout.
- SurfaceMode binds the XComponent NativeWindow before the decoder starts.
- BufferMode leaves `sampleInfo.video.window` null and routes decoded pixels to `BufferRenderer`.
- Output release is centralized so rendering, dropping, dump, HDR propagation, playback position, and error handling remain consistent.

SurfaceMode also exposes **Retain last frame on stop**. When enabled, the sample sets `OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN` to `0`, so the last displayed image remains after decoder stop or destroy. When disabled, it sets the key to `1`, so the decoder outputs a blank frame and avoids a stale image. This key is SurfaceMode-only and is not configured in BufferMode.

<a id="audio-playback"></a>

#### Audio Decoding and Playback

The demuxer selects the audio track and `AudioDecoder` decodes it to S16LE PCM. `OH_AudioStreamBuilder` creates an AudioRenderer using the media sample rate and channel count.

`AudioOutputPump` removes duplicated sync/async output logic:

```text
Audio decoder output
        ↓
Precise-seek preparation: keep, drop, or trim PCM
        ↓
Optional debug dump
        ↓
Append PCM bytes to CodecUserData::renderQueue
        ↓
AudioRenderer OnWriteData consumes the queue
        ↓
Update audioFramesWritten and audio PTS clock
        ↓
Release decoder output buffer
```

The output path validates `offset`, `size`, and buffer capacity before reading PCM. Async and sync modes share the same preparation, queue, accounting, and release behavior.

When a file contains multiple audio tracks, `Demuxer` selects the first audio track by default and accepts an explicit container track index through `PlayOptions.audioTrackIndex`. The **Audio track** control lists the tracks exposed by the media-information snapshot. Selecting another track safely stops the current task and starts a new task with that track. Single-track files produce an explanatory toast. **Mute/Unmute** calls `OH_AudioRenderer_SetVolume()` immediately; unmute restores the volume saved in playback settings.

<a id="subtitle-playback"></a>

#### External SRT Subtitles

Subtitles are an optional UI-side feature and do not alter the Native decode pipeline. The **Subtitle** control opens `DocumentViewPicker` with an `.srt` filter. `SubtitleModel.parseSrt()` parses cue time ranges and multiline text, while `PlaybackViewModel` reports the current position every 250 ms and `findSubtitleText()` selects the active cue for the bottom overlay. Empty, invalid, or unreadable files produce separate prompts. Subtitle state is cleared when playback stops or the media changes, and follows the seek-preview position while dragging.

<a id="playback-speed"></a>

#### Variable-Speed Playback

Press-and-hold selects X2 and release restores X1. The speed menu supports X1, X2, and X3. The requested speed is applied to AudioRenderer and is also used when converting a media-time A/V difference into wall-clock waiting time.

For video-only playback, the output interval is scaled by the requested speed. For audio/video playback, AudioRenderer remains the master clock and video scheduling follows the speed-aware audio timestamp.

<a id="smart-fluency"></a>

#### Smart-Fluency Playback

When API 26 smart fluency is supported, video playback uses:

- `FULL` at X1;
- `ADAPTIVE` plus the requested decoder speed at X2/X3;
- `UNIFORM` with a retention ratio only for thermal-load reduction;
- restoration of the speed-based mode after thermal recovery.

ADAPTIVE may dynamically retain fewer frames for high-frame-rate content, but retained frame PTS/DTS values stay on the original media timeline. The application therefore synchronizes each retained video PTS directly against the audio master clock. The dynamic frame-retention result is never treated as an audio speed.

<a id="video-transform"></a>

#### Video Transforms

Transform controls map UI selections to NativeWindow transform hints:

```cpp
OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, transformHint);
```

Transforms affect only the display layer. They do not modify decoded pixels, media PTS, or dump files. Repeatedly selecting the same transform is ignored.

<a id="playback-seek"></a>

#### Playback Progress and Precise Seek

The page displays current position, total duration, and a draggable Slider. It polls `getPlaybackInfo()` every 250 ms. While the user is dragging, periodic updates do not overwrite the preview position.

ArkTS uses a separate file descriptor and `AVImageGenerator.fetchFrameByTime()` to generate a preview thumbnail. The first request is immediate; later requests are throttled to at least 100 ms. If a request is already running, only the newest position is retained and processed next. Native seek is invoked once when the user releases the slider or taps the track.

The playback controls provide pause/resume, 15-second rewind, 15-second forward, and replay. Pause moves Native playback to `PAUSED`; worker loops wait without destroying decoders while `AudioRenderer` is paused. Resume restarts the renderer and wakes the workers. Rewind/forward adjust the current position by 15 seconds and reuse precise `seekTo()`, clamped to `[0, durationUs]`. Replay keeps the selected file and starts a new playback task from 0.

`seekTo()` is accepted in `PLAYING` or `PAUSED`, clamps the target to `[0, durationUs]`, and performs the following sequence:

1. Enter `SEEKING`, pause AudioRenderer, stop codec loops, and wake all queue waits.
2. Join the old input/output threads so no thread can access an old decoder buffer.
3. Mark old callback contexts as destroyed and release AudioRenderer, AudioStreamBuilder, and both decoders.
4. Convert the microsecond target to milliseconds and call `OH_AVDemuxer_SeekToTime(..., SEEK_MODE_PREVIOUS_SYNC)`. Using the previous sync frame guarantees that the decode interval covers the target instead of accidentally selecting a later sync frame.
5. Recreate the required decoders and AudioRenderer, clear PCM queues, reset synchronization clocks, and store the exact requested target.
6. Decode video preroll normally, but immediately return every output frame whose PTS is below the target without rendering or dumping it. Only the first frame at or after the target enters A/V scheduling and display.
7. Drop audio PCM buffers that end before the target. If the target lies inside a PCM buffer, calculate complete sample frames from sample rate, channel count, and two bytes per S16LE sample; then adjust `offset`, `size`, and `pts` so playback starts from the first sample frame at or after the target.
8. Restore requested speed, smart-fluency mode, and thermal policy, then restore the state active before seek.

Audio/video seeks use a first-video-frame gate. After recreation, the AudioRenderer remains stopped and decoded PCM is held until the first video frame at or after the requested target has been presented. The renderer is then started and the requested speed is restored, preventing audio from resuming noticeably before the video.

Recreating decoders instead of simply flushing them avoids stale callback indexes and reapplies codec configuration that may include SPS/PPS or other initialization data. SurfaceMode, BufferMode, sync mode, and async mode all share this precise-seek policy.

If rebuilding fails, playback enters `STOPPING` and reuses the common `ReleaseWorker` path. A successful seek does not play the preroll interval between the previous sync frame and the requested target.

<a id="playback-info"></a>

#### Playback Status and Media Information

The UI polls a small `PlaybackInfo` snapshot containing:

- player state;
- requested playback speed;
- current position and total duration;
- audio/video track presence;
- smart-fluency availability;
- confirmed HDR Vivid state.

Audio/video media uses the AudioRenderer-consumed PCM position. Video-only media uses the PTS of a successfully submitted video frame. Queries read atomic snapshots and do not lock codec callback contexts or participate in frame scheduling.

The larger `MediaInfo` snapshot is frozen during initialization and contains source size, duration, track count, common audio/video fields, decoder and output configuration, Source Format dump, and every Track Format dump. Separating these snapshots keeps large strings out of the 250 ms polling path.

After the refactoring, `Index.ets` remains responsible for page orchestration, file selection, settings, and player callbacks. `PlaybackViewModel` owns the 250 ms playback snapshot polling, position normalization, seek-preview state, HDR Vivid marker, and smart-fluency status. `MediaInfoPanel` renders the sectioned media details, while `PlaybackProgressPanel` renders the status row, slider, drag callbacks, and thumbnail container. New playback fields or layout changes can therefore be added without growing the page's responsibilities.

Native playback policies are separated by purpose. `PlaybackClock` stores the AudioRenderer timestamp, monotonic clock anchor, written sample count, and audio-buffer PTS. `AvSyncController` converts video/audio timing, pending audio frames, and playback speed into a wait/drop decision. `SeekController` drops video frames before the requested target and trims PCM sample frames when the target falls inside an audio buffer. `Player` coordinates these policies with Decoder and Renderer lifecycles, preserving the existing Surface/Buffer, SYNC/ASYNC, and speed behavior.

Video presentation is isolated behind `VideoSink`. `SurfaceVideoSink` uses the decoder's Surface output path and returns the output buffer. `BufferVideoSink` uses `BufferRenderer` to copy decoded pixels into a NativeWindow buffer, propagate HDR/color metadata, and then return the decoder buffer. Both sinks share the existing PTS scheduling, A/V sync, dump, and HDR Vivid bitstream detection logic, so the abstraction does not change SurfaceMode or BufferMode behavior.

`VideoPipeline` and `AudioPipeline` encapsulate input/output thread creation, startup rollback, running-state queries, and joining for their respective decoder paths. They do not own a decoder or select the SYNC/ASYNC algorithm; `Player` still supplies the concrete worker functions. This reduces direct thread bookkeeping in `Player` without changing callback contexts or the `ReleaseWorker` cleanup order.

<a id="player-lifecycle"></a>

#### Playback Threads and Resource Lifecycle

The player uses an explicit state machine:

```text
IDLE -> INITIALIZING -> READY -> PLAYING <-> PAUSED -> STOPPING -> IDLE
                                  |                  ^
                                  v                  |
                                SEEKING -------------+
```

- `Init()` accepts only `IDLE` and enters `INITIALIZING`.
- `Start()` accepts only `READY` and enters `PLAYING` after worker startup.
- `Stop()` accepts `PLAYING` or `PAUSED`; a repeated call while stopping is treated idempotently.
- `pause()` accepts `PLAYING` and `resume()` accepts `PAUSED`; neither destroys the active decoders.
- `seekTo()` accepts `PLAYING` or `PAUSED`, temporarily enters `SEEKING`, and restores the state active before seek or transitions to `STOPPING` on failure.
- Natural EOS, explicit Stop, and errors converge on the same release path.

The structured NAPI surface includes `play(options, callback)`, `stop()`, `pause()`, `resume()`, `seekTo(positionUs)`, `getState()`, `getPlaybackInfo()`, and `getMediaInfo()`. The older positional `playNative(...)` API remains for compatibility, while the page uses the structured API.

`ReleaseWorker` waits until active audio and video outputs are complete. Missing tracks are marked complete before startup. The worker then:

1. stops new work and wakes queue waits;
2. joins input and output threads;
3. marks callback contexts as being destroyed;
4. releases the AudioRenderer and builder;
5. releases video and audio decoders;
6. resets `BufferRenderer`, output files, and runtime state;
7. invokes the ArkTS completion callback outside the player mutex.

Worker threads are joined rather than detached. `CodecUserData` is owned by `unique_ptr`, callback entry points check destruction/running state, and `renderQueue` access is consistently protected by its mutex.

`PlayerStateMachine` defines the only legal transitions: `IDLE -> INITIALIZING -> READY -> PLAYING <-> PAUSED -> STOPPING -> IDLE` and `PLAYING/PAUSED <-> SEEKING`. `Player` is no longer a global singleton. The NAPI module owns one `Player` through environment instance data, and environment cleanup destroys it; every NAPI call resolves the player associated with its current environment.

<a id="camera-recording"></a>

#### Camera Capture and Recording

The recording pipeline uses a camera preview Surface and an encoder input Surface:

```text
CameraInput
   ├── PreviewOutput -> recording-page XComponent
   └── VideoOutput   -> video encoder Surface

Microphone -> AudioCapturer -> AudioEncoder ┐
Camera     -> VideoEncoder                  ├-> Muxer -> MP4/FLV
                                             ┘
```

The selected camera profile is validated before navigation. The preview page creates a `VideoSession`, attaches preview and recording outputs, and starts the session. The **Encoding control** group exposes disabled/auto video stabilization; auto mode queries `VideoSession` support before it is enabled, and an unsupported device does not block recording. Native recording starts only after the user taps **Start Recording**.

For supported HDR recording configurations, the sample selects P010 output and the required color-space/encoder options. Actual availability is device dependent and must be checked against camera and codec capabilities.

The camera and XComponent own their Surface objects. Native code stores non-owning window references where necessary and releases only objects created by the sample itself.

<a id="recording-stop"></a>

##### Recording Stop Flow

Stopping recording is deliberately staged so the media asset is complete before the UI returns:

1. Stop camera video output so no new frame is submitted.
2. Wait for the camera frame-end signal.
3. Notify the video encoder of end of stream.
4. Stop audio capture and push audio EOS.
5. Wait for audio/video encoder output threads to consume EOS.
6. Stop and release the muxer so container indexes and trailers are written.
7. Release encoders and Native resources.
8. Close the media-library output fd.
9. Release camera objects and navigate back to the home page.

Closing the fd before muxer finalization can make Gallery visibility lag for minutes or leave an incomplete file. The current flow closes it only after Native finalization completes.

<a id="video-encoding"></a>

#### Video Encoding

`VideoEncoder` is created from the selected H.264/H.265 MIME and configured with dimensions, frame rate, pixel format, bitrate, CBR/VBR bitrate mode, key-frame interval, and codec mode. The recording settings organize these options under **Video encoding** and provide 10/20/30 Mbps and 100 ms/1 s/2 s presets. Bitrate and bitrate mode are validated through encoder capability query; the encoder validates the key-frame interval when the format is configured. Its input is a Surface returned by `OH_VideoEncoder_GetSurface()`.

CameraKit produces frames directly into that Surface. Encoder output is handled in either callback-driven async mode or active-query sync mode:

```text
Camera -> encoder Surface -> OH_VideoEncoder
        -> encoded OH_AVBuffer
        -> normalize PTS from the first sync frame
        -> Muxer::WriteSample(videoTrackId, buffer, attr)
        -> free encoder output buffer
```

Output starts from the first sync frame so the resulting file begins with a decodable sample. When temporal-layer support is enabled, `OH_AVBuffer_GetParameter()` is used to read `OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_LAYER_ID`. If an older Native SDK does not define the key, disable `AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID` in CMake.

<a id="audio-encoding"></a>

#### Audio Capture and Encoding

`AudioCapturer` is configured for S16LE PCM using the selected sample rate and channel count. The **Audio encoding** group provides 44.1/48 kHz, mono/stereo, 32/64/128 kbps AAC presets and normal/low-latency capture (default: 48 kHz, stereo, 32 kbps, normal latency). Sample rate and channel count are checked against AAC encoder capability; codec configuration remains the final validation for bitrate and parameter combinations. The selected latency mode is passed to `OH_AudioStreamBuilder_SetLatencyMode()`. Captured bytes are accumulated until a codec input buffer can be filled, then submitted to `AudioEncoder` with monotonically increasing PTS.

```text
Microphone
   ↓
AudioCapturer OnReadData
   ↓
PCM queue protected by mutex/condition variable
   ↓
AudioEncoder input worker
   ↓
AAC output (sync query or async callback queue)
   ↓
Muxer::WriteSample(audioTrackId, buffer, attr)
```

Audio and video encoder outputs may arrive concurrently. The muxer wrapper serializes sample writes and starts only after the required tracks have been added.

<a id="muxing"></a>

#### Muxing

`Muxer` wraps `OH_AVMuxer` and owns the container-writing lifecycle:

1. Create the muxer using the output fd and selected container format.
2. Add video and/or audio track formats obtained from encoder output descriptions.
3. Start after all required tracks are available.
4. Serialize `WriteSample()` calls from audio and video output threads.
5. Write rotation metadata for MP4 when required.
6. Stop and destroy the muxer only after encoder EOS has been consumed.

Encoded `OH_AVBuffer` objects remain owned by their encoders. The muxer reads them during `WriteSample()`, after which the application promptly returns each buffer to the encoder.

### Buffer Ownership Summary

Surface and codec buffers have explicit ownership transitions:

- In SurfaceMode decoding, codec output is released to the Surface by `RenderOutputBufferAtTime()` or returned without rendering by `FreeOutputBuffer()`.
- In BufferMode decoding, the application reads shared-memory pixels, copies them to a requested NativeWindowBuffer, flushes that destination buffer, and then frees the decoder output.
- In Surface-input encoding, CameraKit produces buffers and the encoder consumes them automatically.
- Encoded output buffers are read by the muxer and then returned to the encoder.

Applications must never retain a decoder or encoder buffer after it has been returned to the codec. Framework-owned XComponent and NativeWindow pointers are non-owning references and are cleared on Surface destruction.

<a id="av-sync"></a>

### Audio/Video Synchronization

#### Background

Accurate A/V synchronization is a core playback requirement, especially when the audio route introduces additional latency, such as Bluetooth headsets. The sample uses continuously rendered audio as the master timeline and adjusts video because small video timing corrections are less noticeable than audio interruption, resampling, or pitch changes.

| Term | Full name | Meaning |
|---|---|---|
| PTS | Presentation Time Stamp | The media time at which decoded content should be presented |
| DTS | Decoding Time Stamp | The media time controlling decode order |

Audio and video are independently demuxed and decoded, but frames with matching media timestamps should be presented together. Three general clock strategies exist:

| Strategy | Advantages | Disadvantages |
|---|---|---|
| Audio master clock (used here) | Continuous audio; video timing is comparatively easy to adjust | Unstable video output may require drops or visible frame holds |
| System clock | Can avoid adjusting either stream when both pipelines are tightly controlled | Adds clock anchoring complexity and depends on clock accuracy |
| Video master clock | Can preserve video cadence | Audio waits or acceleration are much more noticeable and harder to implement correctly |

#### Audio Clock

The sample queries:

```cpp
OH_AudioStream_Result OH_AudioRenderer_GetAudioTimestampInfo(
    OH_AudioRenderer* renderer, int64_t* framePosition, int64_t* timestamp);
```

`framePosition` is the speed-aware media sample-frame position submitted to audio hardware. `timestamp` is the corresponding monotonic-clock anchor in nanoseconds.

Important behavior:

1. Immediately after `OH_AudioRenderer_Start()`, valid hardware values may not yet be available. Video temporarily follows its nominal interval until both values are non-zero.
2. `framePosition` already reflects playback speed. The sample's `audioFramesWritten` uses the same unscaled media-frame unit, so the two can be directly compared.
3. AudioRenderer Flush resets timestamp frame position to zero.
4. `OH_AudioRenderer_GetFramesWritten()` has different Flush behavior and is not mixed with `GetAudioTimestampInfo()` in the same calculation.
5. Audio-route changes may reset frame position. Video temporarily uses nominal timing until the new audio anchor stabilizes.
6. ADAPTIVE video retention does not change audio speed and is not part of the audio-clock calculation.

The current audio position is estimated as:

```cpp
int64_t pendingFrames = std::max(audioFramesWritten - framePosition, int64_t { 0 });
int64_t latencyUs = pendingFrames * 1000000 / sampleRate;

int64_t anchorDiffUs = (nowNs - timestampNs) / 1000;
int64_t audioPlayedTimeUs = currentAudioPts - latencyUs + anchorDiffUs * targetSpeed;
```

#### Video Scheduling

For each decoded video frame:

```cpp
int64_t mediaWaitTimeUs = videoPts - audioPlayedTimeUs;
int64_t waitTimeUs = mediaWaitTimeUs / targetSpeed;
```

The first subtraction is in media time. Sleeping and `renderAtTime` use wall-clock time, so the difference must be divided by the requested speed. For example, a 60 ms media lead at X3 requires about 20 ms of real waiting.

The scheduling policy is:

- earlier than `-40 ms`: drop the late video frame;
- `[-40 ms, 0)`: render immediately;
- `[0, +∞)`: wait until near the desired display time;
- cap an excessive wait to prevent a damaged timestamp from blocking indefinitely.

When a frame is early, the worker sleeps until it is near the presentation point and submits it at most two 60 Hz VSync periods in advance:

```cpp
const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, AvSyncController::renderAheadUs);
if (waitTimeUs > AvSyncController::renderAheadUs) {
    std::this_thread::sleep_for(std::chrono::microseconds(waitTimeUs - AvSyncController::renderAheadUs));
}
return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame,
    renderLeadUs * NS_PER_US + GetCurrentTime());
```

This avoids queueing too many future frames while preserving the real PTS spacing of frames retained by smart fluency. For 240 fps input, RenderService may consume at up to 120 fps and `renderAtTime` may drop additional frames internally; the application still schedules using the retained frame's original PTS and the audio master clock.

Suggested A/V synchronization targets for X1 playback:

| Grade | Audio-minus-video range | Subjective result |
|---|---:|---|
| S, recommended | `[-80 ms, 25 ms]` | Generally imperceptible |
| A | `[-125 ms, 45 ms]` | May be noticeable |
| B | `[-185 ms, 90 ms]` | Clearly noticeable |

### Variable-Speed Playback Model

An audio frame here means one sample instant across all channels. Stereo S16LE therefore uses four bytes per frame, and 48 kHz audio contains 48,000 such frames per second.

```text
pendingFrames = max(audioFramesWritten - framePosition, 0)
latencyUs = pendingFrames * 1000000 / sampleRate
anchorDiffUs = (nowNs - timestampNs) / 1000
audioPlayedTimeUs = currentAudioPts - latencyUs + anchorDiffUs * targetSpeed
```

The UI always sends an explicit target speed. Smart-fluency ADAPTIVE mode decides which video frames to retain based on speed, motion, and system state, but does not rewrite the media timeline. Normal speed changes do not use a fixed `OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_RATIO`; that ratio is reserved for UNIFORM thermal-load reduction.

### Environment Configuration

#### OpenHarmony

After switching to an OpenHarmony project and signing it, a missing system-capability error may appear. Add the required capability to `entry/src/main/syscap.json`.

![OpenHarmony system-capability error](screenshots/syscap-configuration-error.png)

### Permissions

- [ohos.permission.CAMERA](https://docs.openharmony.cn/pages/v4.1/en/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioncamera)
- [ohos.permission.MICROPHONE](https://docs.openharmony.cn/pages/v4.1/en/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionmicrophone)

### Dependencies

- ArkUI XComponent
- CameraKit
- AVCodec, AVSource/AVDemuxer, AVMuxer
- OHAudio AudioRenderer and AudioCapturer
- NativeWindow and NativeBuffer

### Constraints

1. The sample is intended for standard-system devices, including phones and RK3568-based development devices.
2. It uses the Stage model and targets API 26 or later. The current project expects SDK 6.1.0.31 or later and a compatible system image.
3. DevEco Studio 6.0 or later is recommended for building and running the sample.
4. Hardware codecs, HDR Vivid, smart fluency, camera profiles, and exact pixel formats depend on device capabilities.

### Download

To download only this sample with sparse checkout:

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/Media/AVCodec/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
