# AVPlayerArkTSAudio

## 介绍

本示例为媒体->Media Kit(媒体服务)->[使用AVPlayer播放音频(ArkTS)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/media/using-avplayer-for-playback.md)的配套示例工程。 

本示例展示了如何使用AVPlayer组件完整地播放一首音乐，实现起播后3s暂停，暂停3s重新播放的效果。

## 效果预览

| 播放效果                                      | 
| -------------------------------------------- | 
<img src="./screenshots/AVPlayerArkTSAudio.jpeg" width="300" />


## 工程目录

```
AVPlayerArkTSAudio
entry/src/main/ets/
└── pages
    └── Index.ets (播放界面)
entry/src/main/resources/
├── base
│   ├── element
│   │   ├── color.json
│   │   ├── float.json
│   │   └── string.json
│   └── media
│       ├── ic_video_play.svg  (播放键图片资源)
│       └── ic_video_pause.svg (暂停键图片资源)
└── rawfile
    └── test_01.mp3 （音频资源）
entry/src/ohosTest/ets/
└── test
    ├── Ability.test.ets (UI测试代码)
    └── List.test.ets (测试套件列表)
```
### 具体实现

1. 使用createAVPlayer创建播放实例。
2. 使用init初始化录屏参数，然后使用startRecording开始录屏。
3. 在开始播放后，可以分别使用stopRecording和release进行停止录屏和释放实例。

## 相关权限

不涉及

## 依赖

不涉及

## 约束和限制

1. 本示例支持标准系统上运行，支持设备：RK3568;

2. 本示例支持API26版本SDK;
   
3. 本示例已支持使DevEco Studio 6.0.94 Release

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Media/AVPlayer-sta/AVPlayerArkTSAudio/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```