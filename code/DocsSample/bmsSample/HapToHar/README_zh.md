# HAP转HAR指导指南文档示例

### 介绍

本示例通过相关设置配置变更，将HAP转化成HAR包

### 效果预览
不涉及。

### 使用说明

1. 选择entry模块，编译，构建，产物中生成只有.har包文件。

2. 通过自动测试框架可进行测试及维护。

### 工程目录
```
AppScope/
|   |---resources/                                    // 工程级的资源目录
|   |--- app.json5                                    // 应用的全局配置信息
entry/src/
|   |--- main/
|        |--- module.json5                            // entry模块配置文件
|             |---ets/
|                 |---entryability/EntryAbility.ets   // 应用启动加载的入口ability
|                 |---entrybackupability/EntryBackupAbility.ets  // extensionAbility。
|                 |---pages/index.ets                 // entry主应用入口页面
```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例在标准系统上运行，`entry` 模块编译为 HAR 时支持 tablet、2in1，`application` 主模块支持 default 设备。

2.本示例为Stage模型，最低兼容API 20版本，使用API 26版本SDK编译。

3.本示例需要使用DevEco Studio 6.1.1 Release及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/bmsSample/HapToHar > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````