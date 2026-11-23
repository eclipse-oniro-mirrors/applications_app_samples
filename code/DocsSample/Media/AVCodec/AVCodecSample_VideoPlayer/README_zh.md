# AVCodecSample_VideoPlayer

[English](README.md) | 简体中文

这个示例一次播放一个本地文件的视频轨。首页有两个按钮，分别显示当前播放模式和「播放」。页面使用 ArkUI，选片使用系统图库或文件管理选择器，播放由 Native 媒体接口完成。应用包名为 `com.samples.avcodecsample_videoplayer`。[应用配置](AppScope/app.json5)

## 运行示例

1. 使用带 SDK 26.0.0 的 DevEco Studio 打开 `AVCodecSample_VideoPlayer` 目录，为设备配置调试签名并运行 `entry` 模块。
2. 在设备上准备一段 8 位 H.264 MP4。点击「选择播放模式」，在弹窗里选择解码和送显的组合。当前组合显示在按钮第二行，默认为「异步模式 · Surface模式」。
3. 点击「播放」，从图库或文件管理选择视频。确认画面正常播放。视频自然播完后，可再次点击「播放」选择文件。

## 播放模式

| 选项 | 处理方式 |
|---|---|
| 同步模式 | Native 工作线程主动查询解码器的输入和输出 Buffer。 |
| 异步模式 | 解码器通过回调将 Buffer 索引交给 Native 工作线程。 |
| Surface模式 | 解码器通过 `OH_VideoDecoder_RenderOutputBufferAtTime` 按视频时间戳送显。 |
| buffer模式 | 工作线程读取解码像素，将 NV12 或 NV21 帧拷贝到 NativeWindow 送显。此路径使用 SDR 视频。 |

两种送显模式都将 XComponent 窗口配置为 `OH_SCALING_MODE_SCALE_FIT_V2`，使画面按比例适应播放区域。

解码模式和送显方式独立选择。[测试步骤](ohosTest.md)

## 源码结构

| 文件 | 职责 |
|---|---|
| [Index.ets](entry/src/main/ets/pages/Index.ets) | 保存当前模式，承载 XComponent 并打开系统选择器。 |
| [player_napi.cpp](entry/src/main/cpp/player_napi.cpp) | 接收 ArkTS 传入的文件描述符和模式，调度播放，收尾后返回结果。 |
| [player.cpp](entry/src/main/cpp/player.cpp) | 解封装本地文件并解码视频轨。 |
| [video_output.cpp](entry/src/main/cpp/video_output.cpp) | 送显解码后的视频帧。 |

ArkTS 打开所选文件，将文件描述符和 XComponent 的 Surface ID 交给 Native。Native 复制文件描述符，并根据 Surface ID 创建窗口引用。播放结束或失败时，Native 释放解码器和解封装器，归还窗口引用并关闭复制的描述符，再返回播放结果。ArkTS 关闭原描述符。

## 权限与运行要求

- 图库和文件管理通过系统选择器授予所选文件的访问权限。[模块配置](entry/src/main/module.json5)
- 使用支持 OpenHarmony SDK 26.0.0 的 DevEco Studio，以及支持选定解码和送显模式的设备。上面推荐的 MP4 可用于验证四种模式组合。[构建配置](build-profile.json5)
- 示例依赖系统媒体和 NativeWindow 库。[Native 构建配置](entry/src/main/cpp/CMakeLists.txt)

## 下载

示例合入 `master` 后，在新建的空目录中运行以下 Bash 命令。检出后，从该目录打开 `code/DocsSample/Media/AVCodec/AVCodecSample_VideoPlayer`。

```bash
git init
git config core.sparsecheckout true
mkdir -p .git/info
echo code/DocsSample/Media/AVCodec/AVCodecSample_VideoPlayer/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
