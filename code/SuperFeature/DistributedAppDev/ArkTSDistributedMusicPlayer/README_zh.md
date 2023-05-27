# 分布式音乐播放

### 简介

本示例使用fileIo获取指定音频文件，并通过AudioPlayer完成了音乐的播放完成了基本的音乐播放、暂停、上一曲、下一曲功能；并使用DeviceManager完成了分布式设备列表的显示和分布式能力完成了音乐播放状态的跨设备分享。实现效果如下：

![](./screenshots/device/distributedMusicPlayer.png)

### 相关概念

音频播放：媒体子系统包含了音视频相关媒体业务，通过AudioPlayer实现音频播放的能力。

数据分享：分布式数据管理为应用程序提供不同设备间数据库的分布式协同能力。通过调用分布式数据各个接口，应用程序可将数据保存到分布式数据库中，并可对分布式数据库中的数据进行增/删/改/查等各项操作。

### 相关权限

允许不同设备间的数据交换：ohos.permission.DISTRIBUTED_DATASYNC

允许音乐服务后台拉起音乐页面：ohos.permission.START_ABILITIES_FROM_BACKGROUND

### 使用说明

1.**音乐播放**，点击**播放**、**暂停**、上**一曲**、下**一曲**按钮可以对音乐进行操作。

2.**跨设备分享**，组网并且双端均已授权条件下，点击**分享**按钮，选择设备，拉起对端设备上的音乐，并将本端的播放状态同步到对端上。

3.**跨设备停止分享**，分享成功前提条件下，点击**停止分享**按钮，将对端设备拉起的音乐应用停止退出。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例完整功能必须双端授予允许使用分布式协同能力，否则在只有发起端授权条件下，发起端会弹框提示错误。

3.本示例为stage模型，已适配API version 9版本SDK，版本号：3.2.11.9；

4.本示例需要使用DevEco Studio 3.1 Beta2 (Build Version: 3.1.0.400, built on April 7, 2023)才可编译运行。

5.本示例需要使用@ohos.distributedHardware.deviceManager系统权限的系统接口。使用Full SDK时需要手动从镜像站点获取，并在DevEco Studio中替换，具体操作可参考[替换指南](https://docs.openharmony.cn/pages/v3.2/zh-cn/application-dev/quick-start/full-sdk-switch-guide.md/)。

### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/SuperFeature/DistributedAppDev/ArkTSDistributedMusicPlayer/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
