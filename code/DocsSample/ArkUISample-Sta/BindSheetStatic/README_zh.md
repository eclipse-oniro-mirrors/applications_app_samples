# ArkUI使用模态组件指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/tree/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [全模态转场](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-universal-attributes-modal-transition.md)。
2. [半模态转场](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-universal-attributes-sheet-transition.md)。
3. [模态转场](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-modal-transition.md)。
4. [绑定全模态页面](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-contentcover-page.md)。

### 效果预览

| 首页                                 |
|------------------------------------|
| ![](screenshots/device/image1.png) |

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
|   |---bindContentCover                       // 全模态转场 
|   |   |---template6
|   |   |   |---BindContentCoverDemo.ets
|   |---bindSheet                      // 半模态转场
|   |   |---template10
|   |   |   |---SheetDemo.ets
|   |   |---template11
|   |   |   |---OnWillDismiss_Dismiss.ets
|   |   |---template12
|   |   |   |---SheetTransitionExample.ets
|---pages
|   |---Index.ets                       // 应用主页面
```

### 具体实现

1. 绑定半模态页面：

    * 基础半模态页面（带生命周期监听）。源码参考[SheetDemo.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/ArkUISample-Sta/BindSheetStatic/entry/src/main/ets/pages/bindSheet/template10/SheetDemo.ets)

    * 嵌套滚动 + 二次确认关闭（防误关）。源码参考[OnWillDismiss_Dismiss.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/ArkUISample-Sta/BindSheetStatic/entry/src/main/ets/pages/bindSheet/template11/OnWillDismiss_Dismiss.ets)

    * 避让中轴。源码参考[SheetTransitionExample.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/ArkUISample-Sta/BindSheetStatic/entry/src/main/ets/pages/bindSheet/template12/SheetTransitionExample.ets)

2. 绑定全模态页面：

    * 使用bindContentCover构建全屏模态转场效果。源码参考[BindContentCoverDemo.ets](https://gitcode.com/openharmony/applications_app_samples/blob/OpenHarmony_feature_sta_20260331/code/DocsSample/ArkUISample-Sta/BindSheetStatic/entry/src/main/ets/pages/bindContentCover/template6/BindContentCoverDemo.ets)

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
echo code/DocsSample/ArkUISample-Sta/BindSheetStatic > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
````
