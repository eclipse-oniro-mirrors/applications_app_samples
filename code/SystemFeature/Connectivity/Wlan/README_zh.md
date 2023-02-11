# WLAN

### 简介

本示例展示了在eTS中WLAN的基本使用，包括禁用和启用WLAN、WLAN扫描和获取扫描结果、WLAN状态监听、WiFi连接状态监听、获取IP信息、获取国家码、判断设备是否支持WLAN相关特性。实现效果如下：

![password](screenshots/device/password.png)

### 相关概念

WLAN：提供API实现wlan激活、扫描和连接WIFI等功能。

### 相关权限

获取WLAN信息权限：ohos.permission.GET_WIFI_INFO
获取WLAN网络信息权限：ohos.permission.GET_WIFI_INFO_INTERNAL
允许配置WLAN设备权限：ohos.permission.SET_WIFI_INFO
获取WLAN配置信息权限：ohos.permission.GET_WIFI_CONFIG
允许配置WLAN配置权限：ohos.permission.SET_WIFI_CONFIG
允许控制WLAN连接状态权限：ohos.permission.MANAGE_WIFI_CONNECTION
允许应用获取设备模糊位置信息权限：ohos.permission.APPROXIMATELY_LOCATION

### 使用说明

1.启动应用后会判断WLAN是否激活，如果是激活状态，会扫描并展示可用WiFi列表，同时获取已连接WiFi信息并展示。

2.点击界面的Switch开关可以禁用和激活WLAN，界面会监听WLAN状态扫描可用WiFi列表，也会监听WiFi连接状态展示已连接WiFi。

3.点击可用WLAN列表中的WLAN信息，可以连接WiFi，如果是加密类型，会弹窗输入密码后连接。

4.点击首页右上角的**关于**图标，进入关于界面，展示获取的IP信息、国家码和支持WLAN相关特性信息。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例需要使用DevEco Studio 3.0 Beta4 (Build Version: 3.0.0.992, built on July 14, 2022)才可编译运行。

3.本示例需要使用@ohos.wifi系统权限的系统接口。使用Full SDK时需要手动从镜像站点获取，并在DevEco Studio中替换，具体操作可参考[替换指南](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/full-sdk-switch-guide.md)。

4.本示例需要使用ohos.permission.GET_WIFI_INFO_INTERNAL、ohos.permission.MANAGE_WIFI_CONNECTION的权限为system_core级别(相关权限级别可通过[权限定义列表](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/security/permission-list.md)查看)，需要手动配置对应级别的权限签名。