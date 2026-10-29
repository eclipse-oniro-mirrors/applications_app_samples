# UIAbility备份恢复

### 介绍
当应用后台运行时，可能由于系统资源管控等原因导致应用关闭、进程退出，应用直接退出可能会导致用户数据丢失。如果应用在UIAbilityContext中启用了UIAbility备份恢复功能，并对临时数据进行保存，则可以在应用退出后的下一次启动时恢复先前的状态和数据（包括应用的页面栈以及onSaveState接口中保存的数据），从而保证用户体验的连贯性。

1.[UIAbility备份恢复](https://gitcode.com/tianlongdevcode/docs_zh/blob/master/zh-cn/application-dev/application-models/ability-recover-guideline.md)

### 效果预览
不涉及

### 使用说明

1）如果应用在UIAbilityContext中启用了UIAbility备份恢复功能，并对临时数据进行保存，则可以在应用退出后的下一次启动时恢复先前的状态和数据；

2）应用正常关闭时，不会触发UIAbility备份流程；

3）UIAbility备份恢复支持多实例，备份数据保存7天，以文件的形式存储在应用的沙箱路径中;

4）备份数据存储在Want中的parameter字段中，由于序列化大小限制，支持的最大数据量为200KB；

5）重启设备不支持还原备份；

6）页面栈恢复示例：首页点击「页面栈恢复示例」进入 RestoreAbility，打开阅读页并模拟翻页/输入草稿，退到后台等待系统回收后，从桌面图标重新启动应用，验证页面栈与阅读进度恢复（注意：验证恢复必须通过桌面图标重新拉起，命令行方式启动应用走冷启动路径，测不到恢复行为）；

### 工程目录
```
UIAbilityLaunchType/
├── AppScope
│   ├── resources
│   ├── app.json5                       // 应用级配置文件
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── RestoreJudge.ets        // 恢复启动判定（版本隔离）
│   │   │   ├── RestoreBlob.ets         // 超限数据落盘引用
│   │   ├── entryability
│   │   │   ├── EntryAbility.ets
│   │   │   ├── RestoreAbility.ets      // 页面栈恢复示例 Ability
│   │   ├── entrybackupability
│   │   │   ├── EntryBackupAbility.ets
│   │   ├── pages
│   │   │   ├── Index.ets               // 首页（入口）
│   │   ├── restore
│   │   │   ├── RestoreIndex.ets        // Navigation 三件套示例首页
│   │   │   ├── ReaderPage.ets          // 断点续读 NavDestination
│   │   │   ├── DeepPage.ets            // 第三层页面（深栈补推演示）
│   │   │   ├── RouterPage.ets          // router 页面恢复示例
│   │   │   ├── AdvertPage.ets          // recoverable:false 排除示例
│   ├── module.json5                    // 模块级配置文件
│   └── resources
├── entry/src/ohosTest
│   ├── ets
│   │   └── test
│   │       ├── Ability.test.ets
│   │       └── List.test.ets
```
### 具体实现

* UIAbility备份恢复接口由UIAbilityContext模块提供，开发者可以通过在UIAbility中通过this.context直接调用。
    * 在应用模块初始化时，在UIAbility的onCreate()回调函数中启用UIAbility的备份恢复功能，源码参考[EntryAbility](/entry/src/main/ets/entryability/EntryAbility.ets)。
    * 开发者需要主动保存数据，调用onSaveState保存数据，以在UIAbility启动时恢复，源码参考[EntryAbility](/entry/src/main/ets/entryability/EntryAbility.ets)。
* 页面栈与数据恢复适配指南示例（[应用状态恢复与页面栈恢复适配指南](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-models/app-restore-adaptation.md)）：
    * 恢复启动判定（版本隔离，不能单独依赖launchReason），源码参考[RestoreJudge](/entry/src/main/ets/common/RestoreJudge.ets)。
    * 方案A（Navigation栈恢复）：Navigation三件套（.id + .recoverable + NavDestination.recoverable）、深栈补推、finishRestore时机，源码参考[RestoreIndex](/entry/src/main/ets/restore/RestoreIndex.ets)。
    * 断点续读页面：数据通道（平时发布AppStorage）、恢复消费（一次性）、空值兜底（防白屏），源码参考[ReaderPage](/entry/src/main/ets/restore/ReaderPage.ets)。
    * 方案C（纯router）：页面默认参与恢复，无需恢复的页面用recoverable:false显式排除，源码参考[RouterPage](/entry/src/main/ets/restore/RouterPage.ets)。
    * 方案D（超限数据落盘引用）：want.parameters只放轻量引用，数据本体写沙箱文件，源码参考[RestoreBlob](/entry/src/main/ets/common/RestoreBlob.ets)、[RestoreAbility](/entry/src/main/ets/entryability/RestoreAbility.ets)。

### 相关权限
不涉及
### 依赖
不涉及
### 约束与限制
1. 本示例仅支持标准系统上运行, 支持设备：RK3568。
2. 本示例为Stage模型，支持API20版本SDK，版本号：6.0.0.47。
3. 本示例需要使用DevEco Studio 6.0.0及以上版本才可编译运行。
### 下载
如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/DocsSample/Ability/UIAbilityRecover > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```