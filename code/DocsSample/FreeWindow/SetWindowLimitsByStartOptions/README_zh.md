# 自由窗口-通过StartOptions设置窗口尺寸限制

### 通过StartOptions设置窗口尺寸限制介绍

自由窗口是一种允许用户在同一屏幕上以自由大小、自由位置显示的窗口状态，支持拖拽、缩放和分屏组合，从而实现多任务处理。

本示例演示了通过[startAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-inner-application-uiAbilityContext.md#uiabilitycontextstartability)接口的[StartOptions](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-startOptions.md)参数设置窗口尺寸限制的方法。应用在启动目标Ability时，通过StartOptions携带的`minWindowWidth`、`minWindowHeight`、`maxWindowWidth`、`maxWindowHeight`字段，即可限制目标窗口在自由窗口状态下的最小、最大宽高，从而限定窗口的缩放范围。

### 效果预览

| 主页                                     | 启动后的测试窗口                    |
|----------------------------------------|--------------------------------|
| 主页仅包含一个"启动测试窗口"按钮 | 点击按钮后启动WindowTestAbility，其窗口宽度可调节范围被限制在600vp~1500vp之间，高度可调节范围被限制在500vp~1000vp之间 |

使用说明

1. 安装并运行应用，进入示例主页；

2. 点击"启动测试窗口"按钮，通过[startAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-inner-application-uiAbilityContext.md#uiabilitycontextstartability)接口并携带[StartOptions](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-startOptions.md)参数启动WindowTestAbility；

3. 在启动的目标窗口中，拖拽窗口边缘调整窗口大小，可观察到窗口尺寸只能在限定的范围内调节（宽度600vp~1500vp，高度500vp~1000vp）。

### 工程目录

```
SetWindowLimitsByStartOptions/
|---entry/src/main/ets/
|   |---entryability
|   |   |---EntryAbility.ets                     // 示例应用入口，加载主页
|   |---entrybackupability
|   |   |---EntryBackupAbility.ets               // 备份扩展能力
|   |---pages
|   |   |---Index.ets                            // 示例主页，通过StartOptions启动目标Ability
|   |---windowtestability
|   |   |---WindowTestAbility.ets                // 被启动的目标窗口Ability
|---entry/src/main/module.json5                  // 模块配置文件，注册EntryAbility与WindowTestAbility
```

### 具体实现

* 通过StartOptions设置窗口尺寸限制，可参考[自由窗口开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/windowmanager/freeform-window-overview.md)
  * 在Index.ets中构造[StartOptions](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-startOptions.md)对象，设置`displayId`、`minWindowWidth`、`minWindowHeight`、`maxWindowWidth`、`maxWindowHeight`字段，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)；
  * 调用[UIAbilityContext.startAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-inner-application-uiAbilityContext.md#uiabilitycontextstartability)接口，将StartOptions作为参数传入启动WindowTestAbility，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)；
  * 系统根据StartOptions中的窗口尺寸限制参数创建窗口，将目标窗口的宽高限制在指定范围内。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例为Stage模型，支持API17版本及以上SDK，SDK版本号(API Version 24)；
2. 窗口尺寸限制仅在自由窗口（支持自由窗口的设备，如2in1、平板等）状态下生效；
3. 本示例需要使用DevEco Studio 6.0及以上版本才可编译运行；
4. 本示例不涉及系统接口。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code\DocsSample\FreeWindow\SetWindowLimitsByStartOptions > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
