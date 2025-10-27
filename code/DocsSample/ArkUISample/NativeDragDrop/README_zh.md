# NativeDragDrop

### 介绍

本示例基于[drag_and_drop.h](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/capi-drag-and-drop-h.md)中的各接口进行构建，以帮助开发者更好地理解拖拽框架C-API的用法。

### 效果预览

| 首页                                 |
|------------------------------------|
| ![](screenshots/device/image1.jpg) |

### 使用说明

1. 在首页可以查看多种拖拽C-API的使用示例，包括通用拖拽、通用异步拖拽、延迟拖拽、主动发起拖拽、主动发起拖拽（异步加载）的示例。

2. 通过自动测试框架可进行测试及维护。

### 工程目录
```
entry/src/main/ets/
|---cpp
|     |---types
|     |---CMakeLists.txt
|     |---common.h
|     |---container.cpp
|     |---container.h
|     |---fifthmodule.h                    // 主动发起拖拽（异步加载）示例代码
|     |---firstmodule.h                    // 通用拖拽示例代码
|     |---forthmodule.h                    // 主动发起拖拽示例代码
|     |---init.cpp
|     |---manager.cpp                       // 各模块示例入口
|     |---manager.h                         // manager头文件
|     |---napi_init.cpp
|     |---secondmodule.h                    // 异步拖拽示例代码
|     |---thirdmodule.h                    // 延迟处理拖拽示例代码
|---ets
|   |---pages
|   |   |---Index.ets                       // 应用主页面
```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，支持API20版本SDK，版本号：6.0.0.41，镜像版本号：OpenHarmony_6.0.0.41。

3.本示例需要使用DevEco Studio 5.0.5 Release (Build Version: 5.0.13.200, built on May 13, 2025)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/NativeDragDrop > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````