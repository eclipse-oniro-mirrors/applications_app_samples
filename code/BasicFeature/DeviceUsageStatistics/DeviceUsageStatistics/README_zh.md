#  设备使用信息统计

### 简介

本示例主要展示了设备使用信息情况。实现效果如下：

![](screenshots/devices/main.png)

### 相关概念

设备使用信息统计：本模块提供设备使用信息统计能力。

### 相关权限

应用信息权限：ohos.permission.BUNDLE_ACTIVE_INFO

### 使用说明

1.顶部的数据面板展示了最常用的五个应用的使用时间占比情况。

2.中部的竖向滑动栏展示了每个应用的使用总时长和最后一次使用的时间。

3.底部的横向滑动栏展示了不常用应用列表。

### 约束与限制

1.本示例仅支持在标准系统上运行。

2.本示例涉及使用系统接口：queryBundleStateInfos()，需要手动替换Full SDK才能编译通过，具体操作可参考[替换指南](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/full-sdk-switch-guide.md)。

3.本示例需要使用DevEco Studio 3.0 Beta4 (Build Version： 3.0.0.992， built on July 14， 2022)才可编译运行。

4.本示例所配置的权限为ohos.permission.BUNDLE_ACTIVE_INFO为system_basic级别(相关权限级别可通过[权限定义列表](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/security/permission-list.md)查看)，需要手动配置对应级别的权限签名(具体操作可查看[自动化签名方案](https://docs.openharmony.cn/pages/v3.2Beta/zh-cn/application-dev/security/hapsigntool-overview.md/))。