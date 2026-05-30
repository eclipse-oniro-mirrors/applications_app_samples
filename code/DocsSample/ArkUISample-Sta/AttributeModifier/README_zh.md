# 属性修改器 (AttributeModifier)指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [属性修改器 (AttributeModifier)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-user-defined-extension-attributeModifier.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![attributemodifier](./screenshots/attributemodifier.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
|   |   |   └── EntryAbility.ets                     // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
|   |   |   |   ├── AttributeModifierSample01.ets    // 按钮主题切换与多态样式
|   |   |   |   ├── AttributeModifierSample02.ets    // 按钮主题切换与多态样式
|   |   |   |   ├── AttributeModifierSample03.ets    // 按钮主题切换与多态样式
|   |   |   |   └── AttributeModifierSample04.ets    // 按钮主题切换与多态样式
│   │   │   ├── AttributeModifierInterface.ets      // AttributeModifier接口定义
│   │   │   └── Index.ets                           // 主界面
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

一、AttributeModifierSample01（基础属性修改器）
1. 自定义实现AttributeModifier接口，通过@Observed装饰器使其支持状态观察；
2. 定义成员变量控制主题切换，在applyNormalAttribute中根据状态设置不同样式；
3. 通过@State装饰器创建Modifier对象，状态改变时自动触发UI刷新。

二、AttributeModifierSample02（属性覆盖场景）
1. 在组件上先通过链式调用设置属性，再应用attributeModifier；
2. Modifier中设置的属性值会覆盖之前通过链式调用设置的属性值；
3. 适用于需要全局统一样式又允许局部定制的场景。

三、AttributeModifierSample03（多Modifier叠加）
1. 在一个组件上同时应用多个AttributeModifier；
2. 每个Modifier独立控制不同的属性，互不干扰；
3. 通过修改不同Modifier的状态值实现多维度样式切换。

四、AttributeModifierSample04（多态样式）
1. 实现applyNormalAttribute和applyPressedAttribute方法分别设置正常态和按压态样式；
2. 通过monitoredStates方法声明需要监听的状态类型；
3. 在按压交互时自动切换对应的样式，无需手动处理状态变化。

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
echo code/DocsSample/ArkUISample-Sta/AttributeModifier/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
