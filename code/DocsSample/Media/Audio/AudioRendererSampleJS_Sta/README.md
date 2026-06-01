# 音频渲染功能示例

## 介绍

本示例基于AudioRenderer能力，实现了音频渲染的初始化、开始播放、暂停播放、停止播放、释放资源、音量管理、空间音频查询与订阅、播放状态监听、音频流信息获取等功能，包含了功能调用接口的完整链路。

## 效果预览

**图1**：首页

<img src='screenshots/Index.jpg' width=320>

## 工程结构&模块类型

```
├───entry/src/main/ets
│   ├───entryability
│   │   └───EntryAbility.ets                      // 程序入口。
│   ├───pages
│   │   └───renderer.ets                          // 音频渲染功能页面。
└───entry/src/main/resources                      // 资源目录。
```

### 具体实现

### 音频渲染
- 源码参考：[renderer.ets](entry/src/main/ets/pages/renderer.ets)
- 使用流程：
  - 点击'Init'按钮，调用`audio.createAudioRenderer`创建音频渲染对象，并设置写入数据回调`onWriteData`。
  - 点击'Start Play'按钮，调用`audioRenderer.start`开始播放。
  - 点击'Pause Play'按钮，调用`audioRenderer.pause`暂停播放。
  - 点击'Stop Play'按钮，调用`audioRenderer.stop`停止播放。
  - 点击'Release'按钮，调用`audioRenderer.release`释放资源。

### 音量管理
- 源码参考：[renderer.ets](entry/src/main/ets/pages/renderer.ets)
- 使用流程：
  - 点击'Get Stream Volume'按钮，调用`audioVolumeManager.getVolumeByStream`获取指定音频流的音量。
  - 点击'Set App Volume'按钮，调用`audioVolumeManager.setAppVolumePercentage`设置应用音量。
  - 点击'Set Stream Volume'按钮，调用`audioRenderer.setVolume`设置音频流音量。

### 空间音频
- 源码参考：[renderer.ets](entry/src/main/ets/pages/renderer.ets)
- 使用流程：
  - 点击'Spatial Audio Supported'按钮，调用`audioRoutingManager.getDevicesSync`查询是否支持空间音频。
  - 点击'Query Spatial Audio Status'按钮，调用`audioSpatializationManager.isSpatializationEnabledForCurrentDevice`查询空间音频开关状态。
  - 点击'Subscribe Status Event'按钮，调用`audioSpatializationManager.onSpatializationEnabledChangeForCurrentDevice`订阅空间音频开关状态变化。
  - 点击'Unsubscribe'按钮，调用`audioSpatializationManager.offSpatializationEnabledChangeForCurrentDevice`取消订阅。

### 状态监听
- 源码参考：[renderer.ets](entry/src/main/ets/pages/renderer.ets)
- 使用流程：
  - 点击'Check Play State'按钮，调用`audioRenderer.state`查询当前播放状态。
  - 点击'Get All Stream Info'按钮，调用`audioStreamManager.getCurrentAudioRendererInfoArray`获取所有流信息。

## 相关权限

不涉及。

## 模块依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568;

2.本示例仅支持API26版本SDK，SDK版本号(API Version 26 Beta)，镜像版本号(7.0Beta);

3.本示例需要使用DevEco Studio 6.0.0 Canary1 (Build Version: 6.0.0.94SP4, built on April 8, 2026)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Media/Audio/AudioRendererSampleJS_Sta/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
