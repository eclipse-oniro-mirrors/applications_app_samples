# 托管网页中的媒体播放

### 介绍

本工程主要实现了对以下指南文档中[托管网页中的媒体播放](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/app-takeovers-web-media.md) 示例代码片段的工程化，主要目标是帮助开发者快速使用该功能，通过自己或者第三方播放器接管网页媒体播放，从而改善播放体验。

## 托管网页中的媒体播放

### 介绍

1. Web组件提供了应用接管网页中媒体播放的能力，用来支持应用增强网页的媒体播放，如画质增强等。

### 使用说明

1. 运行demo加载xxx.html网页。
### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---PlayerDemo.ets					// 播放器示例
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

### 具体实现

一、应用开发者可以使用该功能，通过自己或者第三方播放器接管网页媒体播放，从而改善播放体验。
1. 开启接管网页媒体播放。
2. 创建本地播放器，并绘制本地播放器组件。
3. 执行ArkWeb内核发送给本地播放器的播控命令，并将本地播放器的状态信息通知给ArkWeb内核。

### 相关权限

需在配置文件中配置网络访问权限。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例支持API23版本SDK，SDK版本号(API Version 23 Release)。
3. 本示例需要使用DevEco Studio 版本号(7.0.0Release)才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/BackgroundColor > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```