# 阻止系统闲时进入睡眠

### 介绍

本工程主要实现了对指南文档[阻止系统闲时进入睡眠]中示例代码片段的工程化，
主要目标是帮助开发者快速了解如何使用RunningLockType.BACKGROUND_USER_IDLE运行锁，保证在持锁过程中系统不会进入自动睡眠，保证业务正常运行。

### 阻止系统闲时进入睡眠

#### 介绍

1. 当计算机在一段时间内没有检测到用户活动（如键盘或鼠标输入）时，系统会自动尝试进入睡眠，使用RunningLockType.BACKGROUND_USER_IDLE运行锁，保证在持锁过程中系统不会进入自动睡眠，保证业务正常运行。
2. 系统睡眠分为自动睡眠和强制睡眠两种类型：自动睡眠由系统预设条件或用户配置自动触发；强制睡眠由用户或应用直接命令系统立即进入睡眠（如合上PC盖子、主动点击菜单里的睡眠等）。
3. BACKGROUND_USER_IDLE用户闲时任务锁可以阻止系统自动睡眠，但不能阻止系统强制睡眠。因此使用该接口的应用必须监听进入强制睡眠的公共事件，在接收到该公共事件后1s内主动释放掉该锁；是否监听退出强制睡眠的公共事件并重新持有锁，由应用根据具体场景自行决策。

#### 使用说明

1. 点击主界面的按钮触发闲时任务，任务会持有运行锁阻止系统自动睡眠，执行完成后释放锁。
2. 监听到进入强制睡眠公共事件后，应用需在1s内暂停或结束任务并释放锁。
3. 监听到退出强制睡眠公共事件后，由业务自行决策是否继续执行未完成的任务。

### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---entrybackupability
|---|---|---EntryBackupAbility.ets
|---|---pages
|---|---|---Index.ets                        // 首页
|---|---|---UserIdleTask.ets                 // 闲时任务类
|---|---|---CommonEventHelper.ets            // 公共事件工具类
|---|---|---RunningLockUtil.ets              // 运行锁工具类
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets             // 阻止系统闲时进入睡眠相关测试用例
|---|---|---|---List.test.ets                // 测试套执行列表
```

### 具体实现

1. 申请使用运行锁所需的权限：`ohos.permission.RUNNING_LOCK`，在module.json5的requestPermissions中声明。
2. 导入runningLock、commonEventManager、BusinessError模块。
3. 开发公共事件工具类CommonEventHelper，用来创建公共事件监听者以及订阅、取消订阅公共事件，监听进入强制睡眠（COMMON_EVENT_ENTER_FORCE_SLEEP）和退出强制睡眠（COMMON_EVENT_EXIT_FORCE_SLEEP）公共事件。
4. 开发运行锁工具类RunningLockUtil，通过isSupported接口查询当前设备是否支持BACKGROUND_USER_IDLE类型锁，创建运行锁并持有（hold），持锁时长取决于具体业务场景，锁超时自动释放；提供释放锁（unhold）方法。
5. 开发闲时任务类UserIdleTask，初始化时订阅强制睡眠相关公共事件并保存监听者对象；执行任务时先持有运行锁，执行业务逻辑后释放锁；在收到进入强制睡眠事件回调中1s内释放锁，收到退出强制睡眠事件后由业务自行决策是否继续执行任务。
6. 在Index页面按钮点击事件中，创建UserIdleTask实例，调用init()初始化公共事件监听，再调用runUserIdleTask()执行闲时任务。

### 相关权限

使用RunningLockType.BACKGROUND_USER_IDLE运行锁需要申请权限：`ohos.permission.RUNNING_LOCK`，申请流程请参考[申请应用权限](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/determine-application-mode.md)。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例支持API version 23及以上版本的SDK，RunningLockType.BACKGROUND_USER_IDLE类型运行锁所需SDK版本为API版本23及以上。
3. PC设备创建该类型的运行锁无系统应用权限管控，系统应用和非系统应用均可创建以及使用；非PC设备创建和使用该类型的运行锁要求是系统应用，非PC设备且非系统应用使用该类型锁功能不生效。
4. 本示例已支持使DevEco Studio 6.0.0 Release (构建版本：6.0.0.878，构建 2025年12月24日)编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Basic-Services-Kit/powermgr/RunningLock > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
