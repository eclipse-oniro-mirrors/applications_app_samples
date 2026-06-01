# 物理键盘插入检测（ArkTS）

## 介绍

本工程主要实现了对以下指南文档[输入设备开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/input/inputdevice-guidelines.md)中示例代码片段的工程化，通过该工程可以添加对物理键盘插入的检测。

## 效果预览

| ![](screenshot/inputDevice.png) |
|---------------------------------|

使用说明：
1. 安装编译生成的hap包，在生成的应用中点击对应的按钮添加对物理键盘插入的检测。
2. 进行物理键盘热拔插，页面会实时刷新设备的物理键盘连接状态。

## 工程目录

```
ArkTSInputDevice-Sta
├──entry/src/main
│  ├──ets
│  │  ├──entryability
|  |  ├──entrybackupability
│  │  └──pages
│  │     └──Index.ets               // 示例代码
|  ├──resources

```

### 具体实现

输入设备管理提供设备热插拔监听、查询指定设备的键盘类型等能力。使用场景例如：当用户需要输入文本时，输入法会根据当前是否插入了物理键盘来决定是否弹出虚拟键盘，开发者可以通过监听设备热插拔判断是否有物理键盘插入。
在[Index.ets](entry/src/main/ets/pages/Index.ets)文件中，获取设备列表以及监听设备热插拔。

## 相关权限

无。

## 依赖

不涉及。

## 约束和限制

1.本示例仅支持标准系统上运行，支持设备：RK3568;

2.本示例为Stage模型，仅支持API26版本SDK，SDK版本号(API Version 26 Beta)，镜像版本号(7.0Beta);

3.本示例需要使用DevEco Studio 6.0.0 Canary1 (Build Version: 6.0.0.94SP4, built on April 8, 2026)及以上版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/InputKit/ArkTSInputDevice-Sta > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

