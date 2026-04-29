# 使用WebNativeMessagingExtensionAbility组件实现浏览器扩展发送消息

### 介绍

本工程主要实现了对以下指南文档中 https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/web/web-native-messaging.md 示例代码片段的工程化，作为发送方浏览器应用，通过WebNativeMessagingExtensionManager连接应用侧的WebNativeMessagingExtensionAbility并发送消息。

### 效果预览

| 效果预览                                |
| --------------------------------------- |
| ![](./screenshots/ExtensionBrowser.png) |

### 使用说明

1. 点击"getManifestData"按钮获取应用extension配置信息。
2. 点击"connect"按钮连接应用侧的WebNativeMessagingExtensionAbility。
3. 点击"disconnect"按钮断开NativeMessaging连接。

### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---entrybackupability
|---|---|---EntryBackupAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页，包含连接和断开逻辑
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

### 相关权限

需要申请以下权限：
- ohos.permission.WEB_NATIVE_MESSAGING：允许浏览器应用拉起WebNativeMessagingExtensionAbility。

### 依赖

不涉及。

### 约束与限制

1. 本示例支持标准系统上运行，支持设备：RK3568、2in1设备、平板（API 24及以上）。
2. 本示例支持API14版本SDK，SDK版本号(API Version 14 Release)。
3. 本示例需要使用DevEco Studio 版本号(5.0.1Release)才可编译运行。
4. 对于API版本21-23，WebNativeMessagingExtensionAbility组件仅支持2in1设备；从API版本24开始，增加支持在平板上使用。
5. 浏览器应用需要申请ACL权限（ohos.permission.WEB_NATIVE_MESSAGING），此权限仅对浏览器类应用开放。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/WebExtension/ExtensionBrowser > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
