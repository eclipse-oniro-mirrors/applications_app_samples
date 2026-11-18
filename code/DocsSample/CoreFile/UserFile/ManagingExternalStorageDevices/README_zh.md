# 管理外置存储设备

### 介绍

本示例通过订阅卷设备广播事件，实现外置存储设备插拔和挂载状态的监听，不依赖系统卷管理接口，无需申请特殊权限。

- [管理外置存储设备](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/manage-external-storage.md)

### 效果预览

|主页|
|--------------------------------|
|<img src="PageImg\ManagingExternalStorage.jpeg" style="zoom: 33%;" width="400" />|

使用说明:

1. 在主界面，点击 `SubscribeBroadcastEvents` 按钮创建广播订阅者。
2. 点击 `ReceiveBroadcastNotifications` 按钮开始接收卷设备广播。
3. 将 U 盘插入开发板。
4. 在 DevEco 日志中筛选 `Volume mounted`，可看到卷设备 id、状态和路径。

### 工程目录

```
├──entry/src/main
│   ├──ets
│   │   ├──common
│   │   │   └──Logger.ts                    // 日志打印封装
│   │   ├──entryability
│   │   │   └──EntryAbility.ets             // 程序入口
│   │   ├──entrybackupability
│   │   │   └──EntryBackupAbility.ets
│   │   └──pages
│   │       └──Index.ets                    // 主界面
│   └──resources                             // 资源文件目录
└──ohosTest.md                               // 测试说明
```

### 具体实现

* 使用 `commonEventManager.createSubscriber` 创建广播订阅者。
* 订阅以下卷设备事件：
    * `usual.event.data.VOLUME_REMOVED`
    * `usual.event.data.VOLUME_UNMOUNTED`
    * `usual.event.data.VOLUME_MOUNTED`
    * `usual.event.data.VOLUME_BAD_REMOVAL`
    * `usual.event.data.VOLUME_EJECT`
* 使用 `commonEventManager.subscribe` 接收广播。
* 收到 `VOLUME_MOUNTED` 后从广播参数读取 `id`、`volumeState`、`path`，并更新页面状态。

### 相关权限

本示例使用广播事件获取卷设备信息，无需申请特殊权限。

### 依赖

不涉及

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例已适配API 26版本SDK，版本号（26.0.0）。

3.本示例需要使用DevEco Studio （26.0.0）及以上版本才可编译运行。

### 测试

自动化测试说明见 [ohosTest.md](./ohosTest.md)。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/CoreFile/UserFile/ManagingExternalStorageDevices > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
