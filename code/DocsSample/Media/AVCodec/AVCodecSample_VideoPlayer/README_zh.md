# AVCodecSample_VideoPlayer

[English](README.md) | 简体中文

## 介绍

本示例使用 ArkUI 和 AVCodec Native 接口播放本地文件的视频轨。首页提供「选择播放模式」和「播放」两个按钮。选好解码方式和送显方式后，可以从图库或文件管理中选片。应用包名为 `com.samples.avcodecsample_videoplayer`。[应用配置](AppScope/app.json5)

首次运行可用默认的「异步模式 · Surface模式」播放一段短的 8 位 H.264 MP4。确认画面正常播放，片尾结束后「播放」按钮恢复可用。

## 效果预览

| 选择视频来源 |
| --- |
| ![真机上的 VideoPlayer 视频来源弹窗，显示图库和文件管理两个选项](screenshots/video-source.jpg) |

## 使用说明

1. 在 DevEco Studio 中打开 `AVCodecSample_VideoPlayer` 工程，为设备配置调试签名并运行 `entry` 模块。
2. 在设备的图库或文件管理中准备一段短的 8 位 H.264 MP4。
3. 点击「选择播放模式」，从四种组合中选择一项。当前组合显示在按钮第二行。
4. 点击「播放」，选择「图库」或「文件管理」，再选择视频。选片后开始播放。视频结束后，可以切换模式或再次选片。

| 解码方式 | Surface模式 | buffer模式 |
| --- | --- | --- |
| 同步模式 | 同步模式 · Surface模式 | 同步模式 · buffer模式 |
| 异步模式 | 异步模式 · Surface模式（默认） | 异步模式 · buffer模式 |

可用同一段视频对比四种组合。[测试步骤](ohosTest.md)

## 工程目录

```text
AVCodecSample_VideoPlayer/
├── AppScope/                            # 应用配置和资源
├── entry/src/
│   ├── main/
│   │   ├── cpp/
│   │   │   ├── types/libentry/           # Native模块的ArkTS接口声明
│   │   │   ├── player_napi.cpp           # 播放任务与文件描述符管理
│   │   │   ├── player.cpp                # 解封装、解码和播放时序
│   │   │   ├── video_output.cpp          # 将解码后的像素拷贝到输出窗口
│   │   │   └── CMakeLists.txt
│   │   ├── ets/
│   │   │   ├── entryability/             # Stage模型入口
│   │   │   └── pages/Index.ets           # 模式选择、文件选择器和XComponent
│   │   ├── resources/                   # 界面文字和配色
│   │   └── module.json5
│   └── ohosTest/                        # 首页设备测试
├── screenshots/                         # 应用真机截图
└── ohosTest.md                           # 测试步骤
```

## 具体实现

1. **选择视频。** 页面使用 `@kit.MediaLibraryKit` 的 `PhotoViewPicker` 从图库选片，使用 `@kit.CoreFileKit` 的 `DocumentViewPicker` 从文件管理选片。ArkTS 以只读方式打开选中的 URI，将文件描述符、文件大小、播放模式和 XComponent 的 Surface ID 传给 Native。[Index.ets](entry/src/main/ets/pages/Index.ets)
2. **启动解码。** N-API 桥接层复制文件描述符，把播放任务交给工作线程。工作线程通过 `OH_AVSource` 和 `OH_AVDemuxer` 选择视频轨，并按视频轨的 MIME 类型创建解码器。同步模式下，工作线程主动查询 Buffer 索引。异步模式下，解码器通过回调把索引交给工作线程。[player_napi.cpp](entry/src/main/cpp/player_napi.cpp) · [player.cpp](entry/src/main/cpp/player.cpp)
3. **送显。** Surface模式使用 `OH_VideoDecoder_RenderOutputBufferAtTime` 按视频时间戳安排送显。buffer模式将解码后的 NV12 或 NV21 帧拷贝到 NativeWindow。两种模式都使用 `OH_SCALING_MODE_SCALE_FIT_V2` 保持画面比例。[player.cpp](entry/src/main/cpp/player.cpp) · [video_output.cpp](entry/src/main/cpp/video_output.cpp)
4. **释放资源。** XComponent 销毁时发出取消请求。播放结束、失败或取消后，Native 先释放解码器、解封装器、媒体源、窗口引用和复制的文件描述符，再返回结果。ArkTS 关闭原文件描述符。页面仍打开时，两个按钮恢复可用。[player_napi.cpp](entry/src/main/cpp/player_napi.cpp) · [Index.ets](entry/src/main/ets/pages/Index.ets)

## 相关权限

图库和文件管理通过系统选择器授予所选文件的访问权，应用模块无额外权限声明。[模块配置](entry/src/main/module.json5)

## 约束与限制

- 应用采用 Stage 模型，面向支持 OpenHarmony SDK 26.0.0 所用接口的标准系统设备和平板。编译请使用支持该 SDK 的 DevEco Studio，例如 26.0.0.851。[构建配置](build-profile.json5) · [模块配置](entry/src/main/module.json5)
- 系统解封装器须能识别输入容器，设备解码器须支持视频的编码规格及所选模式。验证 buffer模式时请使用 8 位 SDR 视频，此模式接收 NV12 和 NV21 解码帧。
- 示例一次从头到尾播放一个本地视频轨。两个按钮分别用于选择模式和开始播放。Native 模块依赖系统媒体与窗口库。[Native 构建配置](entry/src/main/cpp/CMakeLists.txt)

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
