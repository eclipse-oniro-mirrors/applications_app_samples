# Web组件支持视频沉浸式全屏播放

### 介绍

本工程主要实现了对以下指南文档中[Web组件支持视频沉浸式全屏播放](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web_full_screen.md) 示例代码片段的工程化，主要目标是帮助开发者快速了解ArkWeb支持视频沉浸式全屏播放。

## Web组件支持视频沉浸式全屏播放

### 介绍

1. Web组件提供了视频进入全屏和退出全屏的事件功能，应用可通过监听这些事件实现进入和退出沉浸式全屏模式。

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
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

### 具体实现

一、Web组件支持视频沉浸式全屏播放。
1. 创建web组件，监听进入全屏与退出全屏事件。

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