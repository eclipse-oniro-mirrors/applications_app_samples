# ModuleConfigurationFile04

### 介绍

本示例通过配置`app.json5`与`module.json5`，构建一个包含`entry`与`feature`模块的应用工程。`entry`模块通过`atomicService`标签预加载`feature`模块，并通过自动化测试用例校验配置文件的字段与跨模块规则。

包名：`com.example.moduleconfigurationfile04`

### 效果预览
无

### 使用说明

1. 使用同一产品与签名编译 `entry@default` 与 `entry@ohosTest`，并安装两个签名 HAP。

2. 运行 `entry_test` 模块的自动化测试。当前用例不依赖设备安装 feature，feature 配置与跨模块规则通过配置对象进行逻辑校验。

3. 体验完整多模块示例时，可另外编译并安装 `feature@default`。安装与测试命令见 [ohosTest.md](ohosTest.md)。

### 工程目录
```
ModuleConfigurationFile04/
|   |--- AppScope/
|        |---resources/                               // 工程级的资源目录
|        |--- app.json5                               // 应用的全局配置信息
|   |--- entry/src/
|        |--- main/
|             |--- module.json5                       // entry模块配置hap类型："type": "entry"
|             |---ets/
|                 |---entryability/EntryAbility.ets   // 应用启动加载的入口ability
|                 |---pages/Index.ets                 // entry主应用入口页面
|        |--- ohosTest/ets/
|             |---harness/                            // 配置模型、校验器与测试辅助类
|             |---test/                               // Hypium测试用例
|   |--- feature/src/
|        |--- main/
|             |--- module.json5                       // feature模块配置hap类型："type": "feature"
|             |---ets/featureability/FeatureAbility.ets
```

### 具体实现

- 配置模型：`entry/src/ohosTest/ets/harness/ConfigModels.ets`
- app.json5校验：`entry/src/ohosTest/ets/harness/AppConfigValidator.ets`
- module.json5校验：`entry/src/ohosTest/ets/harness/ModuleConfigValidator.ets`
- 跨模块校验：`entry/src/ohosTest/ets/harness/CrossModuleValidator.ets`
- 测试用例入口：`entry/src/ohosTest/ets/test/List.test.ets`

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：tablet（平板或者平板模拟器）。

2.本示例为Stage模型，使用OpenHarmony API 26 SDK，已验证SDK版本号：26.0.0.38。需在local.properties中通过sdk.dir配置本机SDK根目录。

3.本示例需要使用DevEco Studio 5.1.1 Release (Build Version: 5.1.1.840, built on September 5, 2025)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/bmsSample/ModuleConfigurationFile04 > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````
