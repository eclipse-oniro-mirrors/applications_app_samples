# ArkUI资源互通指南文档示例

### 介绍

本示例展示了ArkUI中资源互通、UI信息获取及导航的使用方法。主要包含资源跨模块互通、UI单位转换以及Navigation导航等能力。该工程中展示的代码详细描述可查如下链接：

1. [Navigation](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-navigation.md)。
2. [NavDestination](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-navdestination.md)。
3. [UIContext](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-arkui-uiContext.md)。
4. [资源管理](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md)。

### 效果预览

| 首页                                 |
|------------------------------------|
| ![](./screenshots/screenshots.PNG) |

### 使用说明

1. 在主界面，可以点击对应卡片，选择需要参考的示例。

2. 进入示例界面，查看参考示例。

3. 通过自动测试框架可进行测试及维护。

### 工程目录
```
|-- AppScope
|   |-- app.json5
|   |-- resources
|       |-- base
|           |-- element
|           |   |-- string.json
|           |-- media
|               |-- background.png
|               |-- foreground.png
|               |-- layered_image.json
|-- build-profile.json5
|-- code-linter.json5
|-- entry
|   |-- build-profile.json5
|   |-- hvigorfile.ts
|   |-- obfuscation-rules.txt
|   |-- oh-package-lock.json5
|   |-- oh-package.json5
|   |-- src
|       |-- main
|       |   |-- ets
|       |   |   |-- entryability
|       |   |   |   |-- EntryAbility.ets
|       |   |   |-- pages
|       |   |       |-- Index.ets
|       |   |       |-- NavigationPage.ets
|       |   |       |-- ResInterop.ets
|       |   |       |-- UIInformation.ets
|       |   |-- module.json5
|       |   |-- resources
|       |       |-- base
|       |       |   |-- element
|       |       |   |   |-- color.json
|       |       |   |   |-- float.json
|       |       |   |   |-- string.json
|       |       |   |-- media
|       |       |   |   |-- background.png
|       |       |   |   |-- foreground.png
|       |       |   |   |-- layered_image.json
|       |       |   |   |-- startIcon.png
|       |       |   |-- profile
|       |       |       |-- main_pages.json
|       |       |-- dark
|       |       |   |-- element
|       |       |       |-- color.json
|       |       |-- rawfile
|       |-- mock
|       |   |-- mock-config.json5
|       |-- ohosTest
|       |   |-- ets
|       |   |   |-- test
|       |   |       |-- Ability.test.ets
|       |   |       |-- List.test.ets
|       |   |-- module.json5
|       |-- test
|           |-- List.test.ets
|           |-- LocalUnit.test.ets
|-- hvigor
|   |-- hvigor-config.json5
|-- hvigorfile.ts
|-- library
|   |-- BuildProfile.ets
|   |-- Index.ets
|   |-- build-profile.json5
|   |-- consumer-rules.txt
|   |-- hvigorfile.ts
|   |-- obfuscation-rules.txt
|   |-- oh-package.json5
|   |-- src
|       |-- main
|       |   |-- ets
|       |   |   |-- components
|       |   |       |-- MainPage.ets
|       |   |-- module.json5
|       |   |-- resources
|       |       |-- base
|       |           |-- element
|       |               |-- float.json
|       |               |-- string.json
|       |-- ohosTest
|       |   |-- ets
|       |   |   |-- test
|       |   |       |-- Ability.test.ets
|       |   |       |-- List.test.ets
|       |   |-- module.json5
|       |-- test
|           |-- List.test.ets
|           |-- LocalUnit.test.ets
|-- oh-package.json5
|-- ohosTest.md
```

### 具体实现

1. **资源互通（ResInterop.ets）**：使用`$r()`引用应用资源（字符串、颜色），通过library模块的`createResource()`函数创建资源，并使用`transfer.transferStatic()`将资源在不同模块间传递。

2. **UI信息获取（UIInformation.ets）**：通过`getUIContext()`获取UI上下文，调用`px2lpx()`、`lpx2px()`、`px2fp()`、`fp2px()`、`px2vp()`、`vp2px()`等接口实现像素、逻辑像素、字号、虚拟像素之间的单位转换。

3. **导航（NavigationPage.ets）**：使用`NavPathStack`管理导航栈，通过`NavPathInfo`定义页面路由信息，结合`Navigation`和`NavDestination`组件实现页面导航，并集成library模块的`PageOne`组件作为导航目标页面。

4. **库模块（library）**：导出`createResource()`函数用于创建跨模块资源，导出`PageOne`组件用于导航目标页面，实现entry模块与library模块之间的资源共享和组件复用。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，支持SDK版本26.0.0，镜像版本号：OpenHarmony_26.0.0。

3.本示例需要使用DevEco Studio 6.0.0 Canary1及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/ResourceInterop > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````
