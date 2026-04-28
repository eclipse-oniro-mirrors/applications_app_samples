# 获取网页内容高度

## 介绍

本工程主要实现了对以下指南文档中 [获取网页内容高度](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/web/web-getpage-height.md) 示例代码片段的工程化，主要目标是帮助开发者通过调用getPageHeight可获取当前网页内容的实际高度，开发者可以根据具体需求选择合适的方法。

## getPageHeight

### 介绍

1. 本示例主要介绍获取网页内容高度，通过调用getPageHeight可获取当前网页内容的实际高度。

### 效果预览

| 主页                                                    |
| ------------------------------------------------------- |
| <img src="screenshots\getPageHeight.png" width="360;" /> |

使用说明

1. 普通静态网页，可以在onPageEnd等Web组件生命周期回调和Web性能指标回调中通过getPageHeight获取网页内容的高度。

### 具体实现

* 通过调用getPageHeight可获取当前网页内容的实际高度。参考源码：[getPageHeight.ets](./entry/src/main/ets/pages/getPageHeight.ets)

## JSBridgePageHeight

### 介绍

1. 动态网页可以通过JSBridge传递特定回调，通知到应用侧调用。

### 具体实现

* 动态网页可以通过JSBridge传递特定回调，通知到应用侧调用。参考源码：[JSBridgePageHeight.ets](./entry/src/main/ets/pages/JSBridgePageHeight.ets)

### 效果预览

| 主页                                                    |
| ------------------------------------------------------- |
| <img src="screenshots\JSBridgePageHeight.png" width="360;" /> |

使用说明

1. 复杂动态网页使用JSBridge传递特定回调，通知到应用侧调用。

## setTimeoutPageHeight

### 介绍

1. 在无法使用JSBridge的场景下，可以通过添加setTimeout等函数来延迟获取当前页面的高度。具体的延迟时间可以根据网页的复杂度来确定。

### 具体实现

* 在无法使用JSBridge的场景下，可以通过添加setTimeout等函数来延迟获取当前页面的高度。具体的延迟时间可以根据网页的复杂度来确定。参考源码：[setTimeoutPageHeight.ets](./entry/src/main/ets/pages/setTimeoutPageHeight.ets)

### 效果预览

| 主页                                                    |
| ------------------------------------------------------- |
| <img src="screenshots\setTimeoutPageHeight.png" width="360;" /> |

使用说明

1. 在无法使用JSBridge的场景下，可以通过添加setTimeout等函数来延迟获取当前页面的高度。具体的延迟时间可以根据网页的复杂度来确定。

## 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---getPageHeight.ets
|---|---|---JSBridgePageHeight.ets
|---|---|---setTimeoutPageHeight.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

## 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

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
echo code/DocsSample/ArkWeb-Sta/GetWebPageHeight > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```