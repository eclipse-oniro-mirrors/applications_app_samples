## Web组件支持视频沉浸式全屏播放

### 介绍

1. 本示例主要介绍Web组件支持视频沉浸式全屏播放，并实现全屏时自动横竖屏切换。Web组件提供了视频进入全屏和退出全屏的事件功能，应用可通过监听这些事件实现进入和退出沉浸式全屏模式。本示例通过监听全屏事件，在进入全屏时自动切换为横屏，退出全屏时恢复竖屏，达到更好的沉浸式视频播放体验。
2. 本工程主要实现了对以下指南文档中[Web组件支持视频沉浸式全屏播放](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/web/web_full_screen.md)常见问题示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源。


##### 使用说明

1. 使用时需要自行替换前端页面视频链接。
2. 点击播放控件中的全屏按钮，视频进入全屏播放模式，同时系统自动切换为横屏显示。
3. 在横屏全屏模式下，按返回键或点击退出全屏，系统自动恢复为竖屏，回到初始页面。

### 工程目录

```
├── entry
│   └── src
│       └── main
│           ├── ets                                 // ArkTS代码区
│           │   ├── entryability
│           │   │   └── EntryAbility.ets            // 入口类
│           │   ├── entrybackupability
│           │   │   └── EntryBackupAbility.ets      // 备份恢复框架
│           │   └── pages
│           │       └── Index.ets                   // 主页，Web视频全屏播放实现
│           └── resources                           // 应用资源文件
│               ├── base
│               │   ├── element                     // 元素资源
│               │   │   ├── color.json             // 颜色定义
│               │   │   ├── float.json             // 浮点数资源
│               │   │   └── string.json            // 字符串资源
│               │   ├── media                       // 媒体资源
│               │   └── profile                     // 配置文件
│               │       ├── backup_config.json      // 备份配置
│               │       └── main_pages.json         // 页面路由配置
│               ├── dark                            // 深色模式资源
│               │   └── element
│               │       └── color.json              // 深色模式颜色
│               └── rawfile
│                   └── video.html                  // 视频播放HTML页面
```

### 具体实现

* Web组件支持视频沉浸式全屏播放
  * Web组件可通过[onFullScreenEnter](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-basic-components-web-events.md#onfullscreenenter9)和[onFullScreenExit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkweb/arkts-basic-components-web-events.md#onfullscreenexit9)回调监听全屏按键的点击事件。onFullScreenEnter表示Web组件进入全屏模式，onFullScreenExit表示Web组件退出全屏模式。
  * 监听这两个回调函数，拿到状态变化值。开发者可通过window.setPreferredOrientation方法设置屏幕方向，全屏时切换为横屏，退出时恢复竖屏。
  * 通过onBackPress生命周期回调，在全屏状态下拦截返回键，优先退出全屏而非退出应用。

### 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持phone设备类型。
2. 本示例SDK版本为6.1.0(23)，运行时系统为HarmonyOS。
3. 若系统开启了方向锁定功能，自动横竖屏切换可能失效。

### 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb/ArkWebFullScreen > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```