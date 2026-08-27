# 后台加载任务

### 介绍

本示例使用[@ohos.backgroundLoader](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md) 接口，实现了注册后台加载任务、注销后台加载任务、完成后台加载任务、查询后台加载任务信息的功能。

### 效果预览

|首页                             |
|---------------------------------------|
|![image](screenshots/device/index.png)|

使用说明

1. 进入应用首页；
2. 点击"Register Task"按钮，在弹出的对话框中输入abilityName和taskId，点击OK注册后台加载任务；
3. 点击"Get Task Info"按钮，在弹出的对话框中输入taskId，点击OK查询后台加载任务信息；
4. 点击"Finish Task"按钮，在弹出的对话框中输入abilityName和taskId，点击OK完成后台加载任务；
5. 点击"Unegister Task"按钮，在弹出的对话框中输入abilityName和taskId，点击OK注销后台加载任务；

### 工程目录
```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                 // 入口Ability，注册ON_START/ON_STOP回调
|---entrybackupability
|   |---EntryBackupAbility.ets           // 备份恢复扩展Ability
|---pages
|   |---Index.ets                        // 首页，提供注册/查询/完成/注销任务按钮
```

### 具体实现

* 该示例使用[registerTask](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md#backgroundloaderregistertask12)方法注册后台加载任务，使用[unregisterTask](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md#backgroundloaderunregistertask12)方法注销后台加载任务。
* 该示例使用[finishTask](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md#backgroundloaderfinishtask12)方法完成后台加载任务，使用[getTaskInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md#backgroundloadergettaskinfo12)方法查询后台加载任务信息。
* 该示例通过[callee.on](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md#uiabilitycallee)监听backgroundLoader.ON_START和backgroundLoader.ON_STOP事件，在任务启动和停止时执行相应回调。
* 源码链接：[EntryAbility.ets](entry/src/main/ets/entryability/EntryAbility.ets)，[Index.ets](entry/src/main/ets/pages/Index.ets)。
* 接口参考：[@ohos.backgroundTaskManager](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-backgroundtasks-kit/js-apis-backgroundTaskManager.md)。

### 相关权限

不涉及

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行,支持设备：RK3568；

2.本示例已适配API version 20版本SDK，版本号：6.0 Release；

3.本示例需要使用DevEco Studio 版本号(6.0 Release)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/DocsSample/BackGroundTasksKit/BackgroundLoader/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master

```
