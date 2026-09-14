# 自由窗口-通过module.json5配置窗口尺寸限制

### 通过module.json5配置窗口尺寸限制介绍

自由窗口是一种允许用户在同一屏幕上以自由大小、自由位置显示的窗口状态，支持拖拽、缩放和分屏组合，从而实现多任务处理。

本示例演示了通过在[module.json5](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/module-configuration-file.md)配置文件的[abilities](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/module-configuration-file.md#abilities标签)标签下声明`minWindowWidth`、`minWindowHeight`、`maxWindowWidth`、`maxWindowHeight`、`minWindowRatio`、`maxWindowRatio`等字段，静态配置Ability窗口尺寸限制的方法。同时，示例主页还演示了在隐藏窗口标题栏时，如何避让标题栏右侧的三键控制按钮区域，避免页面内容与按钮重叠。

### 效果预览

| 主页                                   | 标题栏避让                             |
|--------------------------------------|-----------------------------------|
| 主页展示顶部布局区域及两个控制按钮 | 点击"隐藏标题栏并避让三键"后，顶部布局区域自动避让标题栏三键控制按钮 |

使用说明

1. 安装并运行应用，进入示例主页；

2. 点击"hide the title bar and avoid the three buttons."按钮，隐藏窗口标题栏，顶部布局区域自动避让标题栏三键控制按钮区域，页面内容不与三键重叠；

3. 点击"do not hide the title bar."按钮，恢复显示窗口标题栏，顶部布局区域恢复为全宽显示。

### 工程目录

```
SetWindowLimitsByModuleJson5/
|---entry/src/main/ets/
|   |---entryability
|   |   |---EntryAbility.ets                     // 应用入口，加载主页并将windowStage存入AppStorage
|   |---entrybackupability
|   |   |---EntryBackupAbility.ets               // 备份扩展能力
|   |---pages
|   |   |---Index.ets                            // 示例主页，演示隐藏标题栏并避让三键控制按钮
|---entry/src/main/module.json5                  // 模块配置文件，静态配置窗口尺寸限制等Ability属性
```

### 具体实现

* 通过module.json5静态配置窗口尺寸限制，可参考[module-configuration-file](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/module-configuration-file.md)
  * 在module.json5的abilities标签下声明`maxWindowRatio`、`minWindowRatio`、`maxWindowWidth`、`minWindowWidth`、`maxWindowHeight`、`minWindowHeight`等字段，配置窗口支持的最大、最小宽高及宽高比，参考[module.json5](entry%2Fsrc%2Fmain%2Fmodule.json5)；
  * 同时可配置`supportWindowMode`（窗口支持模式）、`orientation`（窗口方向）等Ability属性。
* 隐藏标题栏并避让三键控制按钮，可参考[自由窗口开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/windowmanager/freeform-window-overview.md)
  * 调用[setWindowDecorVisible](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#setwindowdecorvisible10)接口隐藏/恢复窗口标题栏，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)；
  * 调用[getWindowDecorHeight](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#getwindowdecorheight10)接口获取标题栏高度，调用[getTitleButtonRect](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#gettitlebuttonrect10)接口获取三键控制按钮区域，动态计算顶部避让区域，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例为Stage模型，支持API10版本及以上SDK，SDK版本号(API Version 24)；
2. 窗口尺寸限制与标题栏避让仅在自由窗口（支持自由窗口的设备，如2in1、平板等）状态下生效；
3. 本示例需要使用DevEco Studio 6.0及以上版本才可编译运行；
4. 本示例不涉及系统接口。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code\DocsSample\FreeWindow\SetWindowLimitsByModuleJson5 > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
