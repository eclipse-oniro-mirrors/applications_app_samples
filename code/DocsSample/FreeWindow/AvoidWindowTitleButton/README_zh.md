# 自由窗口-避让窗口标题栏按钮

### 避让窗口标题栏按钮介绍

自由窗口是一种允许用户在同一屏幕上以自由大小、自由位置显示的窗口状态，支持拖拽、缩放和分屏组合，从而实现多任务处理。每个自由窗口默认会在窗口上方显示窗口标题栏，标题栏左侧显示应用图标，右侧显示三键控制按钮（窗口最大化/还原、窗口最小化和关闭窗口）。

当应用隐藏窗口标题栏后，由于三键控制按钮仍然显示在窗口右上角，页面顶部内容可能与三键按钮区域重叠，导致文字遮挡、点击事件冲突等问题。本示例演示了在隐藏窗口标题栏时，通过获取标题栏三键控制按钮的矩形区域，动态调整页面顶部布局的宽度，实现顶部布局区域对三键控制按钮的避让。

### 效果预览

| 未隐藏标题栏                                | 隐藏标题栏并避让三键                         |
|-------------------------------------------|----------------------------------------|
| 顶部布局区域占满窗口全宽，标题栏正常显示 | 标题栏隐藏后，顶部布局区域自动缩短，避让右上角三键控制按钮 |

使用说明

1. 安装并运行应用，进入示例主页；

2. 点击"hide the title bar and avoid the three buttons."按钮，隐藏窗口标题栏，顶部粉色布局区域的宽度自动缩短至避让三键控制按钮区域，页面内容不与三键按钮重叠；

3. 点击"do not hide the title bar."按钮，恢复显示窗口标题栏，顶部布局区域恢复为全宽显示；

4. 在自由窗口状态下拖拽改变窗口大小，顶部布局区域会随窗口宽度变化动态避让三键控制按钮。

### 工程目录

```
AvoidWindowTitleButton/
|---entry/src/main/ets/
|   |---entryability
|   |   |---EntryAbility.ets                     // 应用入口，加载主页并将windowStage存入AppStorage
|   |---entrybackupability
|   |   |---EntryBackupAbility.ets               // 备份扩展能力
|   |---pages
|   |   |---Index.ets                            // 示例主页，实现标题栏三键控制按钮的避让
|---entry/src/main/module.json5                  // 模块配置文件
```

### 具体实现

* 通过窗口接口实现标题栏三键控制按钮的避让，可参考[自由窗口开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/windowmanager/freeform-window-overview.md)
  * 在[EntryAbility](entry%2Fsrc%2Fmain%2Fets%2Fentryability%2FEntryAbility.ets)中通过[AppStorage.setOrCreate](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/arkts-appstorage.md#setorcreate)将windowStage存入全局存储，供主页获取窗口对象；
  * 调用[setWindowDecorVisible](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#setwindowdecorvisible10)接口隐藏/恢复窗口标题栏，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)；
  * 调用[getTitleButtonRect](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#gettitlebuttonrect10)接口获取标题栏三键控制按钮的矩形区域，结合[getWindowDecorHeight](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#getwindowdecorheight10)接口获取的标题栏高度，动态计算顶部布局区域的宽高，参考[Index.ets](entry%2Fsrc%2Fmain%2Fets%2Fpages%2FIndex.ets)；
  * 通过[on('windowSizeChange')](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-window-kit/js-apis-window.md#onwindowsizechange7)监听窗口尺寸变化，在窗口缩放时动态更新顶部布局区域的宽度，实现持续避让。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例为Stage模型，支持API10版本及以上SDK，SDK版本号(API Version 24)；
2. 标题栏三键控制按钮的避让仅在自由窗口（支持自由窗口的设备，如2in1、平板等）状态下生效；
3. 本示例需要使用DevEco Studio 6.0及以上版本才可编译运行；
4. 本示例不涉及系统接口。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code\DocsSample\FreeWindow\AvoidWindowTitleButton > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
