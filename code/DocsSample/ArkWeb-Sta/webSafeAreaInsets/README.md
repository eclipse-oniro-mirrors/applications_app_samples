# 网页中安全区域计算和避让适配

## webSafeAreaInsets

### 介绍

1. 本工程主要实现了对指南文档[网页中安全区域计算和避让适配](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/web/web-safe-area-insets.md)中示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源。

### 介绍

1. 本示例主要介绍网页中安全区域计算和避让适配。Web组件提供了利用W3C CSS进行安全区域计算并避让适配的能力，用来支持异形屏幕设备在沉浸式效果下页面的正常显示。此时，网页开发者想对重叠元素进行避让，就可以该能力。ArkWeb内核将持续监测Web组件及系统安全区域的位置与尺寸，依据两者的重叠部分，计算出当前Web组件的安全区域，以及在各个方向上所需避让的具体距离。

### 效果预览

| 主页                                                         |
| ------------------------------------------------------------ |
| <img src="./screenshots/webSafeAreaInsets.png" width="360;" /> |

使用说明

1. 通过expandSafeArea来开启沉浸式效果。Web组件根据实际情况对网页元素进行相应的避让，防止与系统的非安全区域发生重叠遮挡。

### 具体实现

* 使用expandSafeArea设置Web组件自定义扩展安全区域，本次实现设置扩展安全区域类型为系统默认非安全区域(包括状态栏、导航栏)，扩展安全区域边缘为上方区域与下方区域。参考源码：[expandSafeArea.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkWeb/ProcessWebPageCont/entry/src/main/ets/pages/CalcAdjustSafeArea.ets)

## 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---expandSafeArea
|---|---|---setWindowLayoutFullScreen
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```


## 相关权限

[ohos.permission.PRINT](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionprint)

[ohos.permission.INTERNET](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例支持SDK版本号(API Version 26.0.0 Canary)。
3. 本示例需要使用DevEco Studio 版本号(6.0.0.94SP4)才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/WebSafeAreaInsets > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```