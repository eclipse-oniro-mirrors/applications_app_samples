# 绘制修改器 (DrawModifier)指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [自定义绘制修改器 (DrawModifier)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-user-defined-extension-drawModifier.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![drawmodifier](./screenshots/drawmodifier.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   |   |   └── EntryAbility.ets                         // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
│   |   |   |   ├── DrawForeground.ets                   // 自定义前景绘制
│   |   |   |   └── DrawFrontDrawContentDrawBehind.ets   // 自定义前后景与内容绘制
│   │   │   └── DrawModifierInterface.ets                // DrawModifier接口定义
│   │   │   └── Index.ets                                // 主界面
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

1. 继承DrawModifier类，重写drawForeground方法实现自定义前景绘制；
2. 重写drawBehind、drawContent、drawFront方法分别实现背景、内容和前景绘制；
3. 通过drawModifier接口将自定义绘制附加到组件上。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，arkTSVersion为1.2。

3.本示例需要使用Sta SDK配套IDE版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/DrawModifier/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
