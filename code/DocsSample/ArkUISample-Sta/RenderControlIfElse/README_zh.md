# 条件渲染 (If/Else)指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [If：条件渲染（ArkTS-Sta）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-rendering-control-ifelse-sta.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![IfElse](./screenshots/IfElse.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   |   |   └── EntryAbility.ets                     // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
│   |   |   |   ├── IfElseSample01.ets               // 基础条件渲染
│   |   |   |   ├── IfElseSample02.ets               // 条件渲染切换
│   |   |   |   ├── IfElseSample03.ets               // 保留状态的@Link条件渲染
│   |   |   |   └── IfElseSample04.ets               // 嵌套条件渲染
│   │   │   └── Index.ets                            // 主界面
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

1. 使用If/Else条件语句实现组件的条件渲染；
2. 使用If/Else进行条件嵌套渲染；
3. 通过切换条件来控制组件的显示与隐藏。

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
echo code/DocsSample/ArkUISample-Sta/RenderControlIfElse/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
