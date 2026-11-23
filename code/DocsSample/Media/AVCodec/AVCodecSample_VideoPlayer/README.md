# AVCodecSample_VideoPlayer

English | [简体中文](README_zh.md)

This sample displays the video track of one local file selected in Gallery or File Manager. The home page has one button showing the current playback mode and a **Play** button. The app uses ArkUI for the page, system pickers for file access, and native media APIs for playback. The application ID is `com.samples.avcodecsample_videoplayer`. [App configuration](AppScope/app.json5)

## Run the sample

1. Open the `AVCodecSample_VideoPlayer` directory in DevEco Studio with SDK 26.0.0. Configure debug signing for your device and run the `entry` module.
2. Put a short 8-bit H.264 MP4 on the device. Tap **Choose playback mode** and select a decoder and output combination. The second line of the button shows the selected combination. The default is **Asynchronous mode · Surface mode**.
3. Tap **Play**, choose **Gallery** or **File Manager**, and select the video. Confirm that the picture appears and moves. At the end, **Play** becomes available for another selection.

## Playback modes

| Option | What changes |
|---|---|
| Synchronous | The native worker queries the decoder for input and output buffers. |
| Asynchronous | Decoder callbacks deliver buffer indexes to the native worker. |
| Surface | The decoder uses `OH_VideoDecoder_RenderOutputBufferAtTime` to present frames at their video timestamps. |
| Buffer | The worker reads decoded pixels and copies NV12 or NV21 frames to the native window for display. Use an SDR video for this path. |

Both output modes configure the XComponent window with `OH_SCALING_MODE_SCALE_FIT_V2` to fit the frame within the playback area.

The decoder mode and output mode are independent. [Test steps](ohosTest.md)

## Source layout

| File | Role |
|---|---|
| [Index.ets](entry/src/main/ets/pages/Index.ets) | Holds the selected mode, shows the XComponent, and opens the system picker. |
| [player_napi.cpp](entry/src/main/cpp/player_napi.cpp) | Receives the file descriptor and mode from ArkTS. Schedules playback and returns the result after cleanup. |
| [player.cpp](entry/src/main/cpp/player.cpp) | Demuxes the local file and feeds its video track to the decoder. |
| [video_output.cpp](entry/src/main/cpp/video_output.cpp) | Presents decoded video frames. |

ArkTS opens the selected file and passes its descriptor together with the XComponent surface ID to Native. Native duplicates the file descriptor and creates its own window reference from the surface ID. When playback ends or fails, Native releases the decoder, demuxer, window reference and duplicate descriptor before returning the result. ArkTS closes its own descriptor.

## Permissions and requirements

- Gallery and File Manager grant access to the selected file through their system pickers. [Module configuration](entry/src/main/module.json5)
- Use DevEco Studio with OpenHarmony SDK 26.0.0 and a device that supports the selected decoder and output mode. The first-run MP4 above is suitable for all four mode combinations. [Build profile](build-profile.json5)
- The sample uses the system media and native window libraries. [Native build configuration](entry/src/main/cpp/CMakeLists.txt)

## Download

After the sample is merged into `master`, run these Bash commands from a new, empty directory. Then open `code/DocsSample/Media/AVCodec/AVCodecSample_VideoPlayer` relative to that directory.

```bash
git init
git config core.sparsecheckout true
mkdir -p .git/info
echo code/DocsSample/Media/AVCodec/AVCodecSample_VideoPlayer/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
