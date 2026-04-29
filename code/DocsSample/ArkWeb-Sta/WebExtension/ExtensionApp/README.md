# 使用WebNativeMessagingExtensionAbility组件实现应用接收消息

### 介绍

本工程主要实现了对以下指南文档中 https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/web/web-native-messaging.md 示例代码片段的工程化，作为接收方应用，通过WebNativeMessagingExtensionAbility组件接收浏览器扩展发送的消息并回复。

### 效果预览

| 日志效果                                |
| --------------------------------------- |
| ![](./screenshots/ExtensionApp.png) |

### 使用说明

1. 此应用作为接收方，无页面展示，运行时通过系统日志输出相关信息。
2. 浏览器扩展通过runtime.connectNative连接后，应用会接收消息并回复"pong"。

### 工程目录

```
entry/src/main/
|---ets
|---|---MyWebNativeMessageExtAbility
|---|---|---MyWebNativeMessageExtAbility.ets	// WebNativeMessagingExtensionAbility实现
|---|---entryability
|---|---|---EntryAbility.ets
|---|---entrybackupability
|---|---|---EntryBackupAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

### 相关权限

无需特殊权限。

### 依赖

不涉及。

### 约束与限制

1. 本示例支持标准系统上运行，支持设备：RK3568、2in1设备、平板（API 24及以上）。
2. 本示例支持API14版本SDK，SDK版本号(API Version 14 Release)。
3. 本示例需要使用DevEco Studio 版本号(5.0.1Release)才可编译运行。
4. WebNativeMessagingExtensionAbility组件内不支持调用Window相关API。
5. WebNativeMessagingExtensionAbility仅支持拉起本应用的UIAbility，不支持拉起其他应用UIAbility或者其他类型ExtensionAbility。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/WebExtension/ExtensionApp > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
