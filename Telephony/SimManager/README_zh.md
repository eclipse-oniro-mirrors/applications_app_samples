# SIM卡管理

### 简介

本示例展示了电话服务中SIM卡相关功能，包含SIM卡的服务提供商、ISO国家码、归属PLMN号信息，以及默认语音卡功能。效果图如下：
![](screenshots/devices/main.png)

### 相关概念

- [SIM](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis/js-apis-sim.md)：SIM卡相关功能。

### 相关权限

电话权限：ohos.permission.GET_TELEPHONY_STATE


### 使用说明

1.若SIM卡槽1插入SIM卡则SIM卡1区域显示为蓝色，否则默认为白色。

2.点击SIM卡1区域，弹窗显示SIM卡1的相关信息，再次点击面板消失。

3.默认拨号的SIM卡其按钮背景色为浅灰色，目前只展示默认拨号的SIM卡，更改默认拨号卡功能暂不支持。

4.呼叫转移界面功能暂不支持，故点击按钮无实际操作。

### 约束与限制

1.本示例暂不支持双卡功能。

2.本示例仅支持在标准系统上运行。

3.本示例需要使用DevEco Studio 3.0 Beta3 (Build Version: 3.0.0.901, built on May 30, 2022)才可编译运行。
