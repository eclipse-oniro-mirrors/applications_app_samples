# 空气质量

### 简介

本示例使用JS实现了一个简单空气质量应用，使用折行显示能力显示空气质量信息，使用柱形图展示历史记录。实现效果如下：

![](screenshots/device/main.png)

### 相关概念

chart：图表组件，用于呈现线形图、柱状图、量规图界面。

### 相关权限

不涉及。

### 使用说明

1.点击桌面应用图标，启动应用。

2.在首页展示空气质量信息，左右滑动可以切换城市。

3.点击历史记录可以跳转到历史记录页面，此界面用柱形图展示历史记录。

### 约束与限制

1.本示例支持在标准系统上运行。

2.本示例需要使用DevEco Studio 3.0 Beta3 (Build Version: 3.0.0.901, built on May 30, 2022)才可编译运行。

3.如果安装本示例报错为error：install sign info inconsistent，则有可能本应用被设置为系统预置应用，已安装在系统中，此时需使用命令进行替换安装，并在替换安装后对设备进行重启操作，具体命令如下：

hdc shell mount -o rw,remount /

hdc file send ./entry-default-signed.hap /system/app/ohos.samples.airquality/Airquality_Demo.hap

hdc shell  reboot

等设备重启后即可完成应用的替换安装，无需其他操作。