# 按键音打断音视频示例

本示例展示了输入法按键音打断外部音视频播放的场景，并提供了使用 STREAM_USAGE_NOTIFICATION + setIndependentAudioSessionStrategy(CONCURRENCY_MIX_WITH_OTHERS) 的解决方案。

使用了 Audio Kit 的 [AudioKit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-audio-kit/Readme-CN.md) 中的 AudioRenderer 接口。

## 效果预览

![主界面](screenshots/index.png)

## 使用说明

1. 在主界面，可以看到两个按钮：默认场景（红色）和解决方案（绿色）。
2. 先在设备上打开外部音乐或视频播放器（如系统音乐播放器），开始播放音乐。
3. 点击"默认场景"按钮，播放按键音。外部音乐会被 STOP 打断，且不恢复。
4. 重新打开外部音乐播放器，开始播放音乐。
5. 点击"解决方案"按钮，播放按键音。外部音乐继续播放，按键音与音乐同时播放，互不影响。
6. 两个按钮均可连续快速点击，模拟输入法按键操作。

## 工程目录

```
entry/src/main/ets/
|---common
|   |---constants
|   |   |---AudioConstants.ets             // 音频参数常量
|   |---controllers
|   |   |---KeyboardSoundController.ets     // 按键音控制器（默认场景 + 解决方案）
|   |---utils
|   |   |---Logger.ets                     // 日志工具类
|---entryability
|   |   |---EntryAbility.ets               // 入口 Ability
|---entrybackupability
|   |   |---EntryBackupAbility.ets          // 备份 Ability
|---pages
|   |   |---Index.ets                      // 主页面
```

## 具体实现

按键音控制逻辑封装在 KeyboardSoundController.ets 中，包含两个控制器：

* DefaultKeyboardController：默认场景，使用 STREAM_USAGE_MUSIC 流类型。与外部音视频默认焦点策略为 STOP，外部播放被打断后不恢复。源码参考：[KeyboardSoundController.ets](entry/src/main/ets/common/controllers/KeyboardSoundController.ets)
    * 使用 AudioRenderer 创建 STREAM_USAGE_MUSIC 流。
    * 每次点击异步执行 start、等待、stop 完整流程。
    * 通过 playToken 机制支持快速重复点击。

* SolutionKeyboardController：解决方案，使用 NOTIFICATION 流类型 + MIX 策略。源码参考：[KeyboardSoundController.ets](entry/src/main/ets/common/controllers/KeyboardSoundController.ets)
    * 使用 AudioRenderer 创建 STREAM_USAGE_NOTIFICATION 流，将默认策略从 STOP 降为 DUCK。
    * 播放前调用 setIndependentAudioSessionStrategy 设置 MIX 策略，实现完全并发。
    * 切换到默认场景时调用 resetStrategy 重置为 DEFAULT 策略。

## 相关权限

本示例仅涉及音频播放，无需特殊权限。

## 依赖

无

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：phone。
2. 本示例支持 API 24 版本 SDK，SDK 版本号：6.1.1.125。
3. 本示例需要使用 DevEco Studio 才可编译运行。
4. 测试时需要在外部打开音乐或视频播放器，才能观察到打断和并发的效果差异。

## 下载

如需单独下载本工程，执行如下命令：
```text
git init
git config core.sparsecheckout true
echo audio/AudioKeyboardSoundSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
