# Stage模型卡片

### 简介

本示例展示了Stage模型卡片提供方的创建与使用。
实现效果如下：

![eTSFormExample](screenshots/eTSFormExample.png)

### 相关概念

Ability：Ability是应用所具备能力的抽象，也是应用程序的重要组成部分。Ability是系统调度应用的最小单元，是能够完成一个独立功能的组件。

### 相关权限

不涉及。

### 使用说明

1.部分设备的桌面不支持卡片，可以通过自己的开发卡片使用方，进行卡片的创建、更新和删除等操作。具体参考：[卡片使用方说明](../FormLauncher/README_zh.md)。

2.卡片的样式如下图所示。当卡片更新时，卡片上的温度和时间会产生变化。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例为Stage模型，已适配API version 10，版本号：4.0.5.1。

3.本示例需要使用DevEco Studio 3.1 Canary1 (Build Version: 3.1.0.100, built on November 3, 2022)才可编译运行。