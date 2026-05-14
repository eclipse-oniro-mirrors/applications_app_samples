# SoundPoolArkTS

## 介绍

本示例为媒体->Media Kit(媒体服务)->[使用SoundPool播放短音频(ArkTS)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/media/media/using-soundpool-for-playback.md)的配套示例工程。 

本示例展示了如何使用SoundPool进行低时延播放。

## 效果预览

| 预览                                      | 
| -------------------------------------------- | 
<img src="./screenshots/SoundPoolArkTS.png" width="300" />


## 使用说明
1. 安装编译生成的hap包，并打开应用；
2. 点击播放RawFile按钮，进行低时延播放；

## 工程目录

```
SoundPoolArkTS
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
│
└── rawfile
    └── test.ogg (音频资源)
entry/src/ohosTest/ets/
└── test
    ├── Ability.test.ets (UI测试代码)
    └── List.test.ets (测试套件列表)
```

## 具体实现

1. 首先调用createSoundPool方法创建SoundPool实例。
2. 随后调用on('loadComplete')、on('playFinished')、on('error')等方法，注册各类回调事件。
3. 调用load方法进行音频资源加载。
4. 配置播放参数PlayParameters（包括循环次数、播放速率、声道音量、优先级）。
5. 在收到loadComplete回调通知后，方可调用play接口播放指定音频资源。
6. 调用setLoop、setPriority、setVolume方法可重新设置循环次数、优先级、音量参数。
7. 调用stop方法终止指定流的播放。
8. 调用unload方法卸载音频资源。
9. 调用off('loadComplete')、off('playFinished')以及off('error')方法注销注册过的监听回调。
10. 调用release方法释放SoundPool实例。

## 相关权限

不涉及

## 依赖

不涉及

## 约束和限制

1. 本示例支持标准系统上运行，支持设备：RK3568;

2. 本示例支持API20版本SDK，版本号：6.0.0.34;
   
3. 本示例已支持使DevEco Studio 5.0.3 Release (构建版本：5.0.9.300，构建 2025年3月13日)编译运行

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Media/SoundPool/SoundPoolArkTS/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```