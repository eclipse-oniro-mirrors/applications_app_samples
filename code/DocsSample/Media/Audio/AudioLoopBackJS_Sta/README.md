# 音频低时延耳返功能示例

## 介绍

本示例基于AudioLoopback能力，实现了音频低时延耳返的创建实例、设置返听音量、设置混响模式、设置均衡器类型、查询返听状态、启用/禁用音频返听等功能，包含了功能调用接口的完整链路。

## 效果预览

**图1**：首页

<img src='screenshots/Index.jpg' width=320>

## 工程结构&模块类型

```
├───entry/src/main/ets
│   ├───entryability
│   │   └───EntryAbility.ets                      // 程序入口。
│   ├───pages
│   │   └───AudioLoopback.ets                     // 音频低时延耳返功能页面。
└───entry/src/main/resources                      // 资源目录。
```

### 具体实现

### 创建音频低时延耳返实例
- 源码参考：[AudioLoopback.ets](entry/src/main/ets/pages/AudioLoopback.ets)
- 使用流程：
  - 点击'Create Audio Loopback Instance'按钮，首先调用`abilityAccessCtrl.requestPermissionsFromUser`申请麦克风权限。
  - 权限获取成功后，调用`audio.getAudioManager().getStreamManager().isAudioLoopbackSupported`查询是否支持音频返听。
  - 若支持，调用`audio.createAudioLoopback`创建音频返听实例。

### 设置音频返听参数
- 源码参考：[AudioLoopback.ets](entry/src/main/ets/pages/AudioLoopback.ets)
- 使用流程：
  - 点击'Set the audio monitor volume'按钮，调用`audioLoopback.setVolume`设置返听音量。
  - 点击'Set the reverb mode'按钮，调用`audioLoopback.setReverbPreset`设置混响模式。
  - 点击'Set the equalizer type'按钮，调用`audioLoopback.setEqualizerPreset`设置均衡器类型。

### 查询音频返听状态
- 源码参考：[AudioLoopback.ets](entry/src/main/ets/pages/AudioLoopback.ets)
- 使用流程：
  - 点击'Query the monitor status'按钮，调用`audioLoopback.getStatus`查询当前返听状态。
  - 点击'Query the reverb mode'按钮，调用`audioLoopback.getReverbPreset`查询当前混响模式。
  - 点击'Query the equalizer type'按钮，调用`audioLoopback.getEqualizerPreset`查询当前均衡器类型。

### 启用/禁用音频返听
- 源码参考：[AudioLoopback.ets](entry/src/main/ets/pages/AudioLoopback.ets)
- 使用流程：
  - 点击'Enable audio monitor'按钮，调用`audioLoopback.onStatusChange`注册状态监听，然后调用`audioLoopback.enable(true)`启用音频返听。
  - 点击'Disable audio monitor'按钮，调用`audioLoopback.enable(false)`禁用音频返听，然后调用`audioLoopback.offStatusChange`取消状态监听。

## 相关权限

音频录制涉及的权限包括：

允许应用使用麦克风：[ohos.permission.MICROPHONE]

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
echo code/DocsSample/Media/Audio/AudioLoopBackJS_Sta/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
