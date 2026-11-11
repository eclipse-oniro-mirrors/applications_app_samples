# 应用程序包常见问题指南文档示例

### 介绍

本示例通过调用[bundleManager.getBundleInfoForSelf](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-bundleManager.md#bundlemanagergetbundleinfoforself)接口，获取应用的签名字段信息。

### 效果预览

| 首页                              |
|---------------------------------|
| ![img.png](screenshots/img.png) |

### 使用说明

1. 使用IDE自动签名，编译运行，在Log中过滤`getBundleInfoForSelf`信息，查看日志打印。

2. 通过自动测试框架可进行测试及维护，在DevEco Studio中右键`entry/src/ohosTest/ets/test`目录运行全部用例。

### 工程目录
```
entry/src/
|   |--- main/
|        |--- module.json5                            // entry模块配置hap类型："type": "entry"
|             |---ets/
|                 |---entryability/EntryAbility.ets   // 应用启动加载的入口ability
|                 |---entrybackupability/EntryBackupAbility.ets  // extensionAbility。
|                 |---pages/GetAppId.ets              // 获取应用唯一标识appId
|                 |---pages/GetAppIdentifier.ets      // 获取应用唯一标识appIdentifier
|                 |---pages/GetFingerprint.ets        // 获取应用签名指纹信息
|                 |---pages/index.ets                 // entry主应用入口页面
|   |--- ohosTest/
|        |--- module.json5                            // 测试模块配置
|        |--- ets/test/List.test.ets                  // 测试套件入口
|        |--- ets/test/Ability.test.ets               // 应用常见问题示例测试用例
```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：tablet（平板或者平板模拟器）。

2.本示例为Stage模型，支持API20版本SDK，版本号：6.0.0.47，镜像版本号：OpenHarmony_6.0.0.47；当前已升级至API 26版本SDK，SDK版本号(API Version 26)，镜像版本号(7.1.0.21)。

3.本示例需要使用DevEco Studio 5.1.1 Release (Build Version: 5.1.1.840, built on September 5, 2025)及以上版本才可编译运行；当前已升级至DevEco Studio 26.0.0 Release及以上版本。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/bmsSample/CommonProblemOfApplication > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````