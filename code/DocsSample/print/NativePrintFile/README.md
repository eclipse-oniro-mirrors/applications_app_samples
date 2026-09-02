# 使用场景

## 介绍
本示例通过使用[文件打印指南文档](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/basic-services/print)中C/C++场景的开发示例，展示在工程中，帮助开发者更好地理解打印模块代码合理使用。该工程中展示的代码详细描述可查如下链接：

1. [文件打印（C/C++）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/basic-services/print/native-print-file.md)。

### 使用说明

1. 在主界面，可以点击按钮拉起系统打印预览界面下发打印任务。

2. 也可以点击按钮通过打印接口直接下发打印任务。

3. 页面展示到屏幕时自动初始化打印服务，页面离开屏幕时自动释放打印服务资源。

## 工程目录

```
entry/src/main
 │── cpp
 │   ├── types
 │       ├── libentry
 │           ├── Index.d.ts
 │           ├── oh-package.json5
 │   ├── CMakeLists.txt            // 添加动态链接库
 │   ├── napi_init.cpp             // 开发步骤示例代码
 │── ets
 │   ├── entryability
 │   ├── entrybackupability
 │   ├── pages
 │       ├── Index.ets             // UI页面
 ├── resources
 │   └── module.json5              // 声明所需的权限

```

### 具体实现

1、引用C/C++头文件：在C++源码napi_init.cpp中引入BasicServicesKit/ohprint.h头文件，使用OH_Print_*系列C/C++接口实现打印能力，同时引入hilog/log.h用于日志输出。

2、CMake配置：在CMakeLists.txt中配置构建选项，链接打印服务、NAPI桥接及日志相关的系统动态库，确保C/C++接口可正常调用。

3、打印服务生命周期绑定：在页面aboutToAppear时调用OH_Print_Init初始化打印服务，并通过OH_Print_RegisterPrinterChangeListener和OH_Print_StartPrinterDiscovery订阅设备状态变更和发现事件；在aboutToDisappear时先调用OH_Print_UnregisterPrinterChangeListener和OH_Print_StopPrinterDiscovery取消订阅，再调用OH_Print_Release释放打印客户端资源。

4、拉起系统打印预览界面：通过OH_Print_StartPrintByNative接口拉起系统打印预览界面，设置OnStartLayoutWriteCb文件写入回调（将沙箱内文件数据写入系统提供的fd）和OnJobStateChangedCb任务状态变更回调，用户可在预览界面修改打印参数后点击"开始打印"下发任务。

5、直接下发打印任务：通过OH_Print_QueryPrinterList获取已添加打印机列表，使用OH_Print_QueryPrinterInfo查询打印机属性，以打印机默认参数构造Print_PrintJob结构体，调用OH_Print_StartPrintJob直接下发打印任务，使用完后及时释放打印机属性和列表资源。

## 相关权限

1.申请ohos.permission.PRINT允许应用使用打印服务。

## 依赖

不涉及。

## 约束与限制

1. 本示例支持标准系统上运行，支持设备：RK3568，Phone;

2. 本示例支持API21版本SDK，版本号：6.0.1.246;

3. 本示例需要使用DevEco Studio 6.0.1 Beta1及以上版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/print/NativePrintFile > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
