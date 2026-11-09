# 开发用户文件管理器

### 介绍

本示例主要展示了自行开发文件管理器与开发文件监听，使用[@ohos.file.fs](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-file-fs.md)（fileIo）等，实现了在应用沙箱目录下创建文件、监听目录文件变化的功能。该工程中展示的代码详细描述可查如下链接。

- [开发用户文件管理器](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/dev-user-file-manager.md)

### 效果预览

|主界面|
|--------------------------------|
|<img src="PageImg\DevelopingFileManager1.jpeg" style="zoom:33%;" width="400" />|

| 开发用户文件管理器页面                                       |
| ------------------------------------------------------------ |
| <img src="PageImg\DevelopingFileManager2.jpeg" style="zoom:33%;" width="400" /> |

| 监听设备上下线页面                                           |
| ------------------------------------------------------------ |
| <img src="PageImg\DevelopingFileManager3.jpeg" style="zoom:33%;" width="400" /> |

使用说明:

1. 在主界面，可以选择点击DevelopingFileManagerApplication按钮切换到开发用户文件管理器页面，点击ListeningForDeviceOnline/OfflineStatus按钮切换到监听设备上下线页面。
2. 在开发用户文件管理器页面，点击CreateFile按钮，将在应用沙箱目录下创建一个文件并写入内容，在日志中打印文件路径，在页面文本框输出创建成功消息。
3. 在监听页面，点击RegisterToMonitorTheDevice按钮，应用将监听沙箱目录的文件变化，并自动创建一个演示文件触发监听回调，日志将输出“NotifyType: ”与“NotifyFile:”，并将监听成功的结果输出到页面文本框。点击CancelMonitoringTheDevice按钮将取消监听。

### 工程目录

```
├──entry/src/main
|	├──ets
|	|	├──common
|	|	|	└──Logger.ts 		        				// 日志打印封装类
|	|	├──entryability
|	|	|	└──EntryAbility.ets 						// 程序入口类
|	|	├──entrybackupability
|	|	|	└──EntryBackupAbility.ets   
|	|	├──filemanager
|	|	|	├───pages
|	|	|	|	└──FileManagerApplication.ets 			// 用户文件管理器界面
|	|	|	|	└──ListeningForDeviceOnline.ets 		// 监听设备上下线界面
|	|	└──pages
|	|		└──Index.ets 								// 主界面
|	├──resources										// 资源文件目录
```

### 具体实现

* 开发用户文件管理器：
    * 通过 `getUIContext().getHostContext()` 获取应用上下文，使用 `filesDir` 定位应用沙箱目录。
    * 使用 fileIo 的 `openSync`、`writeSync` 和 `closeSync` 在沙箱目录创建并写入文件；写入异常时通过 `finally` 关闭文件句柄。
    * 创建成功后在页面显示 `CreateDocumentUriSuccess`，并在日志中打印文件路径。
* 开发文件监听：
    * 使用 `fs.createWatcher()` 监听应用沙箱目录，通过 `WATCH_EVENTS` 订阅文件变化事件。
    * 调用 `watcher.start()` 启动监听，并在回调中输出 `NotifyType` 和 `NotifyFile`。
    * 取消监听时调用 `watcher.stop()`；重复注册前先停止并释放旧 watcher。

### 相关权限

本示例仅在应用沙箱目录内操作和监听文件，无需申请特殊权限。

### 依赖

不涉及

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例已适配API 26版本SDK，SDK版本号（API Version 26 Release）。

3.本示例需要使用DevEco Studio （26.0.0 Release）及以上版本才可编译运行。

4.本示例使用应用沙箱目录进行文件操作与监听，无需申请特殊权限。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/CoreFile/UserFile/DevelopingFileManagerApplication > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```