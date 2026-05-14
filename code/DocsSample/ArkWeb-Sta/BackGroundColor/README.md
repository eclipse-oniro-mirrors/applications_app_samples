# ArkWeb进程

### 介绍

本工程主要实现了对以下指南文档中[优化跳转至新Web组件过程中的页面闪烁现象](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web-router-flash-optimization.md) 示例代码片段的工程化，主要目标是帮助开发者快速了解ArkWeb进程和如何设置与网页背景色相同的Web组件的背景色，避免视觉闪烁。

## 优化跳转至新Web组件过程中的页面闪烁现象

### 介绍

1. 应用可以通过设置与网页背景色相同的Web组件的背景色，避免视觉闪烁，提升用户体验。例如，将Web组件的背景色设置为白色。
   在类似情况下，如果Web组件的默认背景色为白色，而网页背景色为灰色，导航到新的Web页面时可能会出现白色闪烁。同理，将Web组件的背景色设置为灰色可以解决此问题。

### 效果预览
![img_1.png](screenshots/img_1.png)

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

一、优化跳转至新Web组件过程中的页面闪烁现象
1. 创建Web组件时设置其背景色，以匹配即将加载的网页背景色，从而避免在导航栏隐藏和网页加载过程中出现颜色闪烁。
2. 设置Web组件的背景色为灰色（Color.Gray）。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例支持API22版本SDK，SDK版本号(API Version 22 Release)。
3. 本示例需要使用DevEco Studio 版本号(6.0.0Release)才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/BackgroundColor > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```