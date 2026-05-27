# ArkUI使用文本控件指南文档示例

### 介绍

在工程中包含各场景的开发示例，可帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：
本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [富文本 (RichEditor)](https://gitCode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-common-components-richeditor.md)。

### 效果预览

| 首页                                 | 显示组件目录                           | 示例                              |
|------------------------------------|----------------------------------|---------------------------------|
| ![](screenshots/device/image1.png) | ![](screenshots/device/image2.png) | ![](screenshots/device/image3.png) |

### 使用说明

1. 在主界面，可以点击对应卡片，选择需要参考的组件示例。

2. 在组件目录选择详细的示例参考。

3. 进入示例界面，查看参考示例。

4. 通过自动测试框架可进行测试及维护。

### 工程目录

```
entry/src/main/ets/
|---entryability
|---pages
|   |---richEditor                                   // 富文本
|   |       |---AddBuilderDecoratorContent.ets
|   |       |---AddEvent.ets
|   |       |---AddImageContent.ets
|   |       |---AddSymbolSpanContent.ets
|   |       |---AddTextContent.ets
|   |       |---BackplaneHighlighting.ets
|   |       |---CreateRichEditor.ets
|   |       |---DisableSystemServiceMenu.ets
|   |       |---GetGraphicInfoInComponent.ets
|   |       |---index.ets
|   |       |---SetAttributes.ets
|   |       |---SetUserPresetTextStyles.ets
|---pages
|   |---Index.ets                                    // 应用主页面
```

## 具体实现
富文本(RichEditor), 源码参考[richEditor](entry/src/main/ets/pages/richEditor)
* 创建RichEditor组件：开发者可以创建使用属性字符串和不使用属性字符串构建的RichEditor组件
* 设置属性：设置自定义选择菜单、输入框光标、手柄颜色、提示文本、最大行数、最大长度、装饰线、对齐方式、间距等
* 添加事件：添加多场景回调，如初始化完成、光标移动、完成输入、复制粘贴等场景
* 设置用户预设的文本样式：通过setTypingStyle设置用户预设的文本样式
* 设置组件内的内容选中时部分背板高亮：通过setSelection设置组件内的内容选中时部分背板高亮
* 添加文本内容：通过addTextSpan添加文本内容
* 添加图片内容：通过addImageSpan添加图片内容
* 添加@Builder装饰器修饰的内容：通过addBuilderSpan添加@Builder装饰器修饰的内容
* 添加SymbolSpan内容：通过addSymbolSpan添加Symbol内容。此接口可用于特殊符号添加与展示，例如在编辑学术论文时，此接口可用于添加各种数学符号
* 获取组件内图文信息：通过getSpans获取组件内所有图文内容的信息，包括图文的内容、id、样式、位置等信息。获取内容位置信息后，可对指定范围内容进行样式的更新
* 禁用系统服务菜单：文字被选中时弹出的菜单不包含系统菜单

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

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/TextComponent > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
````