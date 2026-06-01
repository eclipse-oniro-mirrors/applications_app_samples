# 鼠标光标设置（ArkTS）

## 介绍

本工程主要实现了对以下指南文档[鼠标光标开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/input/pointerstyle-guidelines.md)
中示例代码片段的工程化，通过该工程可以设置光标的隐藏和显示，设置光标样式为取色器样式和默认样式。

## 效果预览

| ![](screenshot/pointer.png) |
|-----------------------------|

使用说明：

1. 安装编译生成的hap包,打开应用。
2. 点击对应按键显示和隐藏光标。
3. 点击对应按钮设置光标的样式为取色器样式和默认样式。

## 工程目录

```
ArkTSPointer-Sta
├──entry/src/main
│  ├──ets
│  │  ├──entryability
|  |  ├──entrybackupability
│  │  └──pages
│  │     └──Index.ets               // 示例代码
|  ├──resources
```


### 具体实现

鼠标光标控制提供鼠标光标显示和隐藏、光标样式查询和设置的能力。使用场景例如：用户在全屏观看视频时，开发者可以控制鼠标光标的显示隐藏；当用户执行取色时，开发者可以将鼠标光标样式切换为取色器样式。
在[Index.ets](entry/src/main/ets/pages/Index.ets)文件中，通过点击按钮设置光标的显隐藏、光标的样式等。

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
echo code/DocsSample/InputKit/ArkTSPointer-Sta > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

