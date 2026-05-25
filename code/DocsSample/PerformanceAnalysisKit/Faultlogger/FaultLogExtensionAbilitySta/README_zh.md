# FaultLogExtensionAbility开发指导

### 介绍

本示例展示了如何使用FaultLogExtensionAbility在独立进程中订阅应用故障事件。FaultLogExtensionAbility是一种ExtensionAbility，用于在独立进程中监听和处理应用的故障事件，能够在应用主进程发生崩溃或冻屏等故障时，及时获取故障信息进行上报和分析。

本示例主要演示以下功能：
- 继承FaultLogExtensionAbility实现自定义故障日志扩展能力
- 在onFaultReportReady回调中订阅应用冻屏事件
- 在主进程和Extension进程中分别添加观察者监听故障事件
- 通过模拟长时间阻塞操作触发应用冻屏事件

### 效果预览

本示例运行后，点击页面按钮会触发15秒的阻塞操作，导致应用冻屏。系统会自动检测冻屏事件并通知FaultLogExtensionAbility。

### 使用说明

#### 1. 应用冻屏事件监听

1. 将编译好的hap包推送到设备上安装。

2. 在DevEco Studio底部的"HiLog"窗口中，选择设备并启动应用，然后在搜索框中输入"testTag"过滤日志。

3. 点击应用页面的"AppInput"按钮，等待约15秒触发冻屏事件。

4. 等待约30分钟后，系统会自动拉起FaultLogExtensionAbility进程，日志中将输出类似如下信息（表示成功监听到故障事件）：

```text
FaultLogExtensionAbility onConnect
FaultLogExtensionAbility onFaultReportReady
HiAppEvent onReceive: domain=OS
HiAppEvent eventName=APP_FREEZE
HiAppEvent eventInfo.domain=OS
HiAppEvent eventInfo.name=APP_FREEZE
HiAppEvent eventInfo.eventType=1
```

### 工程目录

```
entry/src/main/
├── ets
│   ├── entryability/
│   │   └── EntryAbility.ets              // 应用入口，添加故障事件观察者
│   ├── faultlogextension/
│   │   └── MyFaultLogExtensionAbility.ets // 故障日志扩展能力实现
│   └── pages/
│       └── Index.ets                      // 主页面，包含触发冻屏的按钮
└── module.json5                           // 模块配置，注册FaultLogExtensionAbility
```

### 具体实现

#### 1. 注册FaultLogExtensionAbility

在module.json5中注册extensionAbilities：

```json
"extensionAbilities": [
  {
    "name": "MyFaultLogExtensionAbility",
    "srcEntry": "./ets/faultlogextension/MyFaultLogExtensionAbility.ets",
    "type": "faultLog"
  }
]
```

#### 2. 实现FaultLogExtensionAbility

继承FaultLogExtensionAbility类并重写关键回调函数：

- **onConnect()**：Extension连接时回调，在此可以进行初始化操作
- **onDisconnect()**：Extension断开连接时回调
- **onFaultReportReady()**：故障报告准备就绪时回调，在此订阅故障事件

在onFaultReportReady回调中使用hiAppEvent.addWatcher()订阅系统故障事件：

```typescript
hiAppEvent.addWatcher({
  name: "EntryAbilityWatcherExtension",
  appEventFilters: [
    {
      domain: hiAppEvent.domain.OS,
      names: [hiAppEvent.event.APP_FREEZE]
    }
  ],
  onReceive: (domain, appEventGroups) => {
    // 处理故障事件
  }
});
```

#### 3. 主进程监听故障事件

在EntryAbility的onCreate中也添加观察者，实现主进程和FaultLogExtensionAbility进程双重监听：

```typescript
hiAppEvent.addWatcher({
  name: "EntryAbilityWatcherNormal",
  appEventFilters: [
    {
      domain: hiAppEvent.domain.OS,
      names: [hiAppEvent.event.APP_FREEZE]
    }
  ],
  onReceive: (domain, appEventGroups) => {
    // 处理故障事件
  }
});
```

#### 4. 触发冻屏事件

Index页面提供按钮，点击后执行15秒阻塞操作，触发应用冻屏：

```typescript
Button("AppInput")
  .onClick(() => {
    let t = Date.now();
    while (Date.now() - t <= 15000) {}
  })
```

### 相关权限

不涉及。

### 依赖

- 需要设备支持FaultLogExtensionAbility特性
- 需要设备支持hiAppEvent事件订阅功能

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、RK3588等；
2. 本示例已适配API 23版本SDK；
3. FaultLogExtensionAbility运行在独立进程中，与主进程隔离；
4. 订阅的故障事件需要系统支持，不同版本可能存在差异。

### 参考资料

- [FaultLogExtensionAbility开发指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fault-log-extension-app-events-arkts)
- [HiAppEvent事件订阅](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hiappevent-watcher-arkts)
- [应用故障分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fault-log-extension-arkts)

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/PerformanceAnalysisKit/Faultlogger/FaultLogExtensionAbilitySta/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
