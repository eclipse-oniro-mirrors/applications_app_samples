# ArkUI指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/ui)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [按钮 (Button)开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-common-components-button.md)。
2. [单选框 (Radio)开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-common-components-radio-button.md)。
3. [切换按钮 (Toggle)开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-common-components-switch.md)。
### 效果预览

| 首页                                 | 按钮组件目录                             | 创建按钮场景示例                           |
|------------------------------------|------------------------------------|------------------------------------|
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
|     |---button
|     |      |---ButtionCase1.ets                       // 按钮创建示例代码
|     |      |---ButtionCase2.ets                       // 按钮创建示例代码
|     |      |---CreateButton.ets                       // 按钮创建示例代码
|     |      |---ButtonCustomStyle.ets                  // 按钮自定义示例代码
|     |      |---FloatingButton.ets                       // 按钮悬浮场景示例代码
|     |      |---HoverButtonExample.ets                 // 按钮悬浮场景示例代码
|     |      |---Index.ets                           // 第二层级目录
|     |      |---SetButtonType.ets                       // 按钮类型设置示例代码
|     |      |---SubmitForm.ets                       // 按钮注册场景示例代码
|     |---radio
|     |      |---RadioButton.ets                         // 2个单选框场景示例代码
|     |      |---RadioSample.ets                         // 单选框场景示例代码
|     |      |---Index.ets                           // 第二层级目录
|     |---toggle
|     |      |---CreateToggle.ets                       // 切换按钮创建示例代码
|     |      |---ToggleCustomStyle.ets              // 切换按钮自定义示例代码
|     |      |---ToggleCaseExample.ets                       // 切换按钮场景示例代码
|     |      |---Index.ets                           // 第二层级目录
|---pages
|   |---Index.ets                       // 应用主页面
entry/src/ohosTest/
|---ets
|   |---index.test.ets                       // 示例代码测试代码
```
## 具体实现
Button是按钮组件，通常用于响应用户的点击操作，其类型包括胶囊按钮、圆形按钮、普通按钮、圆角矩形按钮。Button作为容器使用时可以通过添加子组件实现包含文字、图片等元素的按钮

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，支持API18版本SDK，版本号：5.1.0.56，镜像版本号：OpenHarmony_5.1.0.56。

3.本示例需要使用DevEco Studio NEXT Developer Preview2 (Build Version: 5.0.5.306， built on December 12, 2024)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/ChooseComponent > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````