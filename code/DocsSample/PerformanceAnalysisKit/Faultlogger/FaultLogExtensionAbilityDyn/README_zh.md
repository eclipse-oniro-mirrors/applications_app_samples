# 应用故障日志扩展能力（FaultLogExtensionAbility）

### 介绍

本示例主要展示了使用FaultLogExtensionAbility（应用故障日志扩展能力）相关的功能。开发者可以通过继承FaultLogExtensionAbility，在应用发生冻屏等故障时，于故障扩展进程中接收并处理故障事件数据，实现故障日志的自定义采集与处理。

FaultLogExtensionAbility是系统提供的故障日志扩展能力基类，应用继承该类后，系统会在应用发生故障（如应用冻屏APP_FREEZE）时，拉起故障扩展进程，并通过HiAppEvent订阅机制将故障事件数据回调给开发者。

该工程中展示的代码详细描述可查看如下链接：

- [使用FaultLogExtensionAbility订阅事件（ArkTS）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/dfx/fault-log-extension-app-events-arkts.md)

#### 使用说明

1. 启动应用后，主界面显示一个"AppInput"按钮。

2. 点击"AppInput"按钮，主线程将执行一段耗时操作（约15秒），模拟应用冻屏场景。

3. 应用冻屏后系统会自动拉起FaultLogExtensionAbility扩展进程，在扩展进程的onFaultReportReady回调中通过HiAppEvent订阅应用冻屏事件。

4. 在DevEco Studio左侧下方导航栏，切换到"Log"窗口，日志过滤选择"No filters"，搜索内容设置为"FaultLogExtension"。此时窗口将显示故障扩展进程中接收到的冻屏事件详细信息，包括：
   - 事件名称、域、类型
   - 故障发生的时间戳、前后台状态
   - 应用版本信息、包名、进程名、进程ID
   - 异常类型与异常原因
   - 主线程未处理消息、同步binder调用信息
   - 全量线程调用栈、内存信息
   - 故障日志文件路径等

5. 若应用正常重启，主进程EntryAbility中的观察者A（EntryAbilityWatcherNormal）会处理相同的冻屏事件，观察者B（EntryAbilityWatcherExtension）通过空处理消耗从沙箱获取的事件，避免事件重复处理。

### 工程目录

```text
entry/src/main/ets/
├─entryability
│  └─EntryAbility.ets                          // 主进程入口Ability，添加HiAppEvent观察者订阅冻屏事件
├─entrybackupability
│  └─EntryBackupAbility.ets                    // 备份扩展能力，用于应用数据备份与恢复
├─faultlogextension
│  └─MyFaultLogExtensionAbility.ets            // 故障日志扩展能力，继承FaultLogExtensionAbility，在扩展进程中接收并处理故障事件
└─pages
   └─Index.ets                                 // 主页面，提供模拟冻屏的按钮
```

### 具体实现

1. 在module.json5中注册MyFaultLogExtensionAbility扩展能力，类型为"faultLog"。

2. MyFaultLogExtensionAbility继承FaultLogExtensionAbility，重写onConnect、onDisconnect、onFaultReportReady三个回调函数。

3. 在onFaultReportReady回调中，通过hiAppEvent.addWatcher添加观察者EntryAbilityWatcherExtension，订阅应用冻屏事件（hiAppEvent.event.APP_FREEZE）。

4. 在观察者的onReceive回调中，遍历事件数据并将冻屏事件的详细信息（时间戳、前后台状态、版本信息、异常原因、线程调用栈、内存信息、故障日志文件等）通过hilog打印输出。

5. 主进程EntryAbility的onCreate中添加两个观察者：观察者A（EntryAbilityWatcherNormal）用于正常重启后处理冻屏事件，观察者B（EntryAbilityWatcherExtension）用于生成过滤规则使故障事件在被处理前保留在应用沙箱内。

6. 主页面Index.ets提供"AppInput"按钮，点击后主线程执行耗时操作模拟冻屏。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例已适配API26版本SDK，版本号：26.0.0，镜像版本号：OpenHarmony7.0.0.26。
3. 本示例需要使用DevEco Studio(6.1.1.268)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/DocsSample/PerformanceAnalysisKit/Faultlogger/FaultLogExtensionAbilityDyn/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
