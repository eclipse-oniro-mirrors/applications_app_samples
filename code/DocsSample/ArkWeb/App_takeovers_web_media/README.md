## Web组件托管网页中的媒体播放

### 介绍

1. 本示例主要介绍Web组件托管网页中的媒体播放。通过enableNativeMediaPlayer接口，开启接管网页媒体播放的功能，网页中的视频由应用侧本地播放器（基于AVPlayer实现）接管渲染与播控，用来支持应用增强网页的媒体播放，如画质增强等。
2. 本工程主要实现了对以下指南文档中[托管网页中的媒体播放](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/app-takeovers-web-media.md)示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源。

#### 效果预览

| 网页视频被应用本地播放器接管播放                                                        |
|------------------------------------------------------------------|
| <img src="./screenshots/webTakeOverMediaPlayback.jpeg" width="200;" /> |

##### 使用说明

1. 使用时需要自行替换前端页面视频链接。
2. 启动应用后，网页中的视频由应用侧本地播放器接管，视频画面通过同层渲染绘制在网页中视频原位置。
3. 点击play按钮开始播放，点击pause按钮暂停播放；网页侧的播控操作会经ArkWeb内核下发到本地播放器执行，本地播放器的状态信息也会同步回ArkWeb内核。

### 工程目录

```
├── entry
│   └── src
│       └── main
│           ├── ets                                 // ArkTS代码区
│           │   ├── entryability
│           │   │   └── EntryAbility.ets            // 入口类，保存UIContext供同层渲染使用
│           │   ├── entrybackupability
│           │   │   └── EntryBackupAbility.ets      // 备份恢复框架
│           │   └── pages
│           │       ├── Index.ets                   // 主页
│           │       └── PlayerDemo.ets              // 应用侧代码，视频播放示例
│           └── resources                           // 应用资源文件
```

### 具体实现

* Web组件托管网页中的媒体播放
  * 应用侧通过Web组件[enableNativeMediaPlayer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-basic-components-web-attributes.md#enablenativemediaplayer12)接口开启接管网页媒体播放的功能。
  * 通过[onCreateNativeMediaPlayer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-apis-webview-WebviewController.md#oncreatenativemediaplayer12)注册创建本地播放器的回调函数，网页中有媒体需要播放时，ArkWeb内核触发该回调，应用返回一个实现了[NativeMediaPlayerBridge](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-apis-webview-NativeMediaPlayerBridge.md)接口的本地播放器实例来接管当前的网页媒体资源。
  * 本地播放器基于[AVPlayer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/media/media-kit-intro.md#avplayer)实现，通过XComponent渲染视频画面，并配合NodeController/BuilderNode以[同层渲染](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web-same-layer.md)方式将本地播放器组件绘制到ArkWeb内核提供的Surface上。
  * ArkWeb内核通过NativeMediaPlayerBridge的play、pause、seek、setVolume、setPlaybackRate等接口对本地播放器下发播控命令。
  * 应用通过[NativeMediaPlayerHandler](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-apis-webview-NativeMediaPlayerHandler.md)将本地播放器的状态信息（播放状态、时长、进度、缓冲、视频尺寸、错误等）通知给ArkWeb内核，更新到网页。
  * 通过onNativeEmbedGestureEvent将网页中的触摸事件透传给同层渲染的本地播放器组件，实现play/pause按钮的点击响应。

### 相关权限

[ohos.permission.INTERNET](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/app-takeovers-web-media.md#%E5%AE%8C%E6%95%B4%E7%A4%BA%E4%BE%8B)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行, 支持设备：华为手机。

2. 系统版本：6.1.1 Release及以上。

3. DevEco Studio版本：26.0.0 Release及以上。

4. SDK版本：6.1.1 Release SDK及以上。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo ArkWeb/UsingWebMultimedia > .git/info/sparse-checkout
git remote add origin https://gitee.com/harmonyos_samples/guide-snippets.git
git pull origin master
```
