# 标准化数据结构 (C/C++)指南文档示例

### 介绍

标准化数据结构主要针对部分标准化数据类型定义了统一的数据内容结构，并明确了对应的描述信息。应用间使用标准化数据结构进行数据交互后，将遵从统一的解析标准，可有效减少适配相关的工作量。一般用于跨应用跨设备间的数据交互，比如拖拽。

本示例展示了如何使用UDMF（统一数据管理框架）的C/C++接口，包括：
- 通过文件后缀名或MIME类型获取UTD（统一类型描述符）的typeId
- 发送和获取统一数据对象
- 延迟发送数据（使用数据提供者模式）
- 处理超链接类型数据

### 效果预览

| 桌面                                |
|-----------------------------------|
| ![image.PNG](screenshots/image.PNG) |

### 使用说明

1. 在主界面，点击getTypeId按钮，通过文件后缀名和MIME类型两种方式获取纯文本类型的UTD的typeId，并在控制台打印获取结果和比较结果。

2. 在主界面，点击sendUnifiedData按钮，演示发送统一数据的基本流程，包括创建UTD对象、销毁资源等操作。

3. 在主界面，点击getUnifiedData按钮，从数据库中获取统一数据对象，解析超链接类型数据并在控制台打印URL和描述信息。

4. 在主界面，点击sendDelayUnifiedData按钮，使用数据提供者模式延迟发送统一数据，在控制台打印生成的key值。

### 工程目录
```
entry/src/
|   |--- main/
|       |---ets/
|           |---entryability/EntryAbility.ets   // 应用启动加载的入口ability
|           |---entrybackupability/EntryBackupAbility.ets  // extensionAbility
|           |---pages/index.ets                 // entry主应用入口页面
|       |---cpp/
|           |---CMakeLists.txt                            // CMake配置文件
|           |---napi_init.cpp                             // Napi模块注册及接口调用实现
|           |---types/libentry/Index.d.ts                  // NAPI接口声明文件
```

### 具体实现

* 本示例主要展示了UDMF C/C++接口的使用方法，源码参考：[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)。

    * 通过两种方式获取UTD的typeId：
        - 通过文件后缀名获取：`OH_Utd_GetTypesByFilenameExtension(".txt", &count)`
        - 通过MIME类型获取：`OH_Utd_GetTypesByMimeType("text/plain", &count)`
    * 演示统一数据的基本发送流程，展示完整的创建、使用、销毁流程。
    * 使用数据提供者模式延迟发送数据。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。

2. 本示例为Stage模型，支持API20版本SDK，版本号：6.0.0.53，镜像版本号：OpenHarmony_6.0.0.53。

3. 本示例需要使用DevEco Studio 6.0.0 Release (Build Version: 6.0.0.858, built on September 5, 2026)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkData/Udmf/UdmfNdkSample > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````