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
    * 权限配置和导入模块。 申请ohos.permission.FILE_ACCESS_MANAGER和ohos.permission.GET_BUNDLE_INFO_PRIVILEGED权限，参见[申请应用权限](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/security/AccessToken/determine-application-mode.md)。
    * 导入依赖模块。
    * 创建一个文件访问助手对象，然后使用该对象获取根目录迭代器，并遍历所有根目录信息。
    * 使用listfile接口遍历下一级所有文件（目录）的迭代器对象；通过scanfile过滤指定目录，获取满足条件的迭代器对象。
    * 定义目标目录的 URI 和文件的显示名称，然后使用 [createFile](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-fileAccess-sys.md#createfile)方法创建文件。
* 开发监听设备上下线：
    * 权限配置和导入模块。
    * 导入依赖模块。
    * 根据[DEVICES_URI](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-fileAccess-sys.md#常量)，传入方法registerObserver()中，能监听设备上下线状态。传入方法unregisterObserver()中，能取消监听设备上线，下线状态。

### 相关权限

[ohos.permission.FILE_ACCESS_MANAGER](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionfile_access_manager)

[ohos.permission.GET_BUNDLE_INFO_PRIVILEGED](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionget_bundle_info_privileged)

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