# 显示图片（Image）

### 介绍

本示例为开发指南中图片组件开发章节示例代码的完整工程。该工程展示了如何在应用底层创建图片组件，加载并展示多种来源的图像资源，同时实现多样化的图像调整与显示效果，帮助开发者快速掌握高性能图片展示功能的实现方法。
本工程配套的开发指南文档，详细描述了相关的开发流程与核心代码，可查阅如下链接：[显示图片 (Image)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/ndk-image-component.md)。

### 效果图预览

![imageCapiExample](entry/src/main/ets/common/imageCapiExample.png)

### 使用说明

1.  启动应用，点击界面上的 **"Show Native UI"** 按钮，配置好的图片会立即显示在应用界面中。
2.  界面将以垂直布局依次展示三张图片，从上到下按预设顺序排列，呈现清晰的上下堆叠效果。
3.  点击 **"Hide Native UI"** 按钮，界面上展示的图片会随之隐藏，实现 Native UI 组件的动态控制。
  
### 工程目录
```
.
|—— cpp
|    |—— ani_init.cpp                    // ANI 入口：绑定 C++ native 方法到 TS 类
|    |—— NativeEntry.h                   // Native入口定义（单例 + 节点管理）
|    |—— ImageExample.h                  // 图片示例定义
|    |—— ImageExample.cpp                // 图片示例实现
|    |—— CMakeLists.txt                  // CMake配置
|
|—— ets
|    |—— pages
|         |—— Index.ets                  // 应用启动页，加载承载Native的容器
|
|—— resources
|    |—— rawfile
|         |—— clouds.jpg                 // 图片资源文件
|         |—— cloud.svg                  // 图片资源文件
|         |—— sky.png                    // 图片资源文件
```
### 具体实现
以下示例展示了如何创建一个包含多种图片属性的完整UI界面
#### 在ArkTS页面上声明占位组件
在ArkTS页面上声明用于Native页面挂载的占位组件，并在页面创建时通知Native侧创建图片界面，[源码参考](entry/src/main/ets/pages/Index.ets)。
#### 提供NAPI桥接方法
1、声明Native模块的ArkTS接口，[源码参考](entry/src/main/cpp/types/libentry/Index.d.ts)。

2、在NAPI层实现与Native侧的桥接，使ArkTS层能够调用Native代码创建和管理图片组件，[源码参考](entry/src/main/cpp/ani_init.cpp)。
#### 通过 ANI 桥接 C++ 与 ArkTS
1、在 ArkTS 中声明 `native` 方法，[源码参考](entry/src/main/ets/pages/Index.ets)。

2、在 `ANI_Constructor` 入口中通过 `FindClass` + `Class_BindNativeMethods` 将 C++ native 方法与 ArkTS 类绑定，[源码参考](entry/src/main/cpp/ani_init.cpp)。
#### 实现Native入口
使用 `NativeEntry` 单例管理 `NodeContent` 和根节点的添加/移除，[源码参考](entry/src/main/cpp/NativeEntry.h)。
#### 显示并设置图片
实现Image组件的具体功能，创建包含多个Image组件的示例界面，演示图片源设置、缩放类型、插值效果、填充颜色、占位图等属性的配置方法，[源码参考](entry/src/main/cpp/ImageExample.cpp)，[头文件参考](entry/src/main/cpp/ImageExample.h)。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.  本示例仅支持标准系统上运行。
2.  本示例支持API版本 **API Version 23 Beta5**，SDK版本号：**OpenHarmony SDK Ohos_sdk_public 6.1.1.35**。
3.  本示例需要使用DevEco Studio **DevEco Studio 6.0.2 Release** 及以上版本才可编译运行。
   
### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-sta/ImageCAPIGuild > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```