# 打印扩展能力指南文档示例

### 介绍

本示例通过使用[打印扩展能力指南文档](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/basic-services/print/printExtensionAbilityGuide.md)中的开发示例，展示在工程中，帮助开发者更好地理解打印扩展能力PrintExtensionAbility的使用。

### 使用说明

1. 在主界面，可以查看应用已成功拉起。

2. 在设备上进入设置-打印机和扫描仪-添加打印机和扫描仪，拉起打印扩展能力。

3. 通过触发相应的动作，验证打印扩展能力的回调是否成功执行。

### 工程目录

```
entry/src/main/ets/
|---entryability
|---entrybackupability
|---pages
|   |---Index.ets                       // 应用主页面
|---PrintExtensionAbility
|   |---MyPrintExtension.ets             // 打印扩展能力实现
entry/src/main/
|---module.json5                         // 模块配置，注册PrintExtensionAbility
entry/src/ohosTest/
|---ets
|   |---test
|       |---printExtension.test.ets     // 测试代码
```

### 具体实现

1、导入模块：在MyPrintExtension.ets文件中导入PrintExtensionAbility模块，该模块提供了打印扩展能力的基础接口。

2、实现PrintExtensionAbility接口：创建MyPrintExtension类继承PrintExtensionAbility，实现onCreate、onDestroy、onStartDiscoverPrinter、onStopDiscoverPrinter、onConnectPrinter、onDisconnectPrinter六个回调方法，分别对应扩展能力的初始化、销毁、打印机发现、停止发现、连接和断开连接场景。

3、注册PrintExtensionAbility：在module.json5配置文件中，将MyPrintExtension注册为extensionAbilities，type标签设置为"print"，srcEntry标签指向MyPrintExtension.ets文件路径。

### 相关权限

1.申请ohos.permission.PRINT允许应用使用打印服务。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，支持API14版本SDK。

3.本示例需要使用DevEco Studio 6.0.1 Beta1及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/print/PrintExtensionAbilityGuide > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````
