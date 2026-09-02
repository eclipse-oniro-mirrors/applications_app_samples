# 自由窗口-通过setWindowLimits设置窗口尺寸限制

### 通过setWindowLimits设置窗口尺寸限制介绍

自由窗口是一种允许用户在同一屏幕上以自由大小、自由位置显示的窗口状态，支持拖拽、缩放和分屏组合，从而实现多任务处理。

本示例演示了在应用运行阶段，通过[Window](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md)对象的[setWindowLimits](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#setwindowlimits11)接口动态设置窗口尺寸限制的方法。通过构造[WindowLimits](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#windowlimits11)对象并调用该接口，可将窗口的宽高限制在指定范围内。

### 效果预览

| 主页                                   | 窗口尺寸限制                         |
|--------------------------------------|----------------------------------|
| 主页展示窗口限制设置后的页面内容 | 应用启动后将窗口宽度限制在600px~1500px之间，高度限制在500px~1000px之间 |

使用说明

1. 安装并运行应用，应用在窗口创建完成后自动调用[setWindowLimits](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#setwindowlimits11)设置窗口尺寸限制；

2. 在自由窗口状态下拖拽窗口边缘调整窗口大小，可观察到窗口尺寸只能在限定的范围内调节（宽度600px~1500px，高度500px~1000px）。

### 工程目录

```
SetWindowLimits/
|---entry/src/main/ets/
|   |---entryability
|   |   |---EntryAbility.ets                     // 应用入口，在窗口创建完成后调用setWindowLimits设置窗口尺寸限制
|   |---entrybackupability
|   |   |---EntryBackupAbility.ets               // 备份扩展能力
|   |---pages
|   |   |---Index.ets                            // 示例主页
|---entry/src/main/module.json5                  // 模块配置文件
```

### 具体实现

* 通过setWindowLimits接口设置窗口尺寸限制，可参考[自由窗口开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/windowmanager/freeform-window-overview.md)
  * 在[EntryAbility](entry%2Fsrc%2Fmain%2Fets%2Fentryability%2FEntryAbility.ets)的[onWindowStageCreate](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#onwindowstagecreate)回调中，通过[getMainWindowSync](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#getmainwindowsync9)获取主窗口对象；
  * 构造[WindowLimits](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#windowlimits11)对象，设置`maxWidth`、`maxHeight`、`minWidth`、`minHeight`字段，参考[EntryAbility.ets](entry%2Fsrc%2Fmain%2Fets%2Fentryability%2FEntryAbility.ets)；
  * 调用主窗口对象的[setWindowLimits](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#setwindowlimits11)接口，将窗口宽高限制在指定范围内。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例为Stage模型，支持API11版本及以上SDK，SDK版本号(API Version 24)；
2. 窗口尺寸限制仅在自由窗口（支持自由窗口的设备，如2in1、平板等）状态下生效；
3. 本示例需要使用DevEco Studio 6.0及以上版本才可编译运行；
4. 本示例不涉及系统接口。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code\DocsSample\FreeWindow\SetWindowLimits > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
