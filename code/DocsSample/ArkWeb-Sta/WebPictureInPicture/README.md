# Web组件支持画中画

### 介绍

本工程主要实现了对以下指南文档中[Web组件支持画中画](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web-picture-in-picture.md) 示例代码片段的工程化，主要目标是帮助开发者快速了解ArkWeb画中画功能。

## Web组件支持画中画

### 介绍

1. Web组件提供画中画功能支持，应用可利用W3C标准的Picture-in-Picture API在网页中创建浮动窗口以播放视频，使用户在浏览其他网页或与其他应用交互时，可通过该画中画窗口继续观看视频。

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

一、Web组件支持画中画。
1. 创建web组件，利用前端w3c接口创建浮动窗口以播放视频。

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