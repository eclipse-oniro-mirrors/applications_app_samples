# 景深组件 (DepthComponent) 指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-depth-components-sys.md)中各场景的开发示例，展示在工程中，帮助开发者更好地理解景深组件及其能力并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [景深组件](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-depth-components-sys.md)。

### 效果预览

| 首页                                 | 2D 图片景深                       | 3D 模型景深                       | 仅设置深度                       |
|------------------------------------|--------------------------------|--------------------------------|--------------------------------|
| ![](screenshots/device/image1.png) | ![](screenshots/device/image2.png) | ![](screenshots/device/image3.png) | ![](screenshots/device/image4.png) |

| NDC 坐标模式                       | 相机裁剪景深                       |
|--------------------------------|--------------------------------|
| ![](screenshots/device/image5.png) | ![](screenshots/device/image6.png) |

### 使用说明

1. 在主界面，点击对应卡片，选择需要参考的景深组件示例。

2. 进入示例界面，查看参考示例。

3. 通过自动测试框架可进行测试及维护。

### 工程目录

```
entry/src/main/ets/
|---entryability
|---pages
|   |---Index.ets                       // 应用主页面
|   |---DepthComponent_2D.ets           // 2D图片背景文字倾斜与遮挡
|   |---DepthComponent_3D.ets           // 3D模型背景文字倾斜与遮挡
|   |---DepthComponent_Depth.ets        // 仅设置深度实现文字遮挡
|   |---DepthComponent_NDC.ets          // 使用NDC坐标实现可控的文字倾斜
|   |---DepthComponent_Crop.ets        // 使用移轴裁剪渲染背景局部
entry/src/ohosTest/ets/test
|   |---DepthComponent2D.test.ets       // 2D图片背景场景示例代码测试代码
|   |---DepthComponent3D.test.ets       // 3D模型背景场景示例代码测试代码
|   |---DepthComponentDepth.test.ets    // 仅设置深度场景示例代码测试代码
|   |---DepthComponentNDC.test.ets      // NDC坐标场景示例代码测试代码
|   |---DepthComponentCrop.test.ets    // 移轴裁剪场景示例代码测试代码
```

### 具体实现

1. 实现文字倾斜与遮挡效果（2D图片背景）：以静态图片作为背景，配合深度图，通过为子组件 Text 配置空间效果（四角 position + occlusionWeight），实现文字视觉倾斜且部分内容被背景遮挡的效果。源码参考[DepthComponent_2D.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkUISample/DepthComponentSample/entry/src/main/ets/pages/DepthComponent_2D.ets)

2. 实现文字倾斜与遮挡效果（3D模型背景）：以 glTF/glb 3D 模型作为背景，模型自带深度信息故无需设置深度图，构造参数可指定色域，相机参数同时影响背景与子组件。源码参考[DepthComponent_3D.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkUISample/DepthComponentSample/entry/src/main/ets/pages/DepthComponent_3D.ets)

3. 仅设置深度实现文字遮挡效果：空间效果 position 采用数值写法，直接给出子组件深度信息，子组件不产生倾斜，仅按深度与背景产生前后遮挡关系。源码参考[DepthComponent_Depth.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkUISample/DepthComponentSample/entry/src/main/ets/pages/DepthComponent_Depth.ets)

4. 使用 NDC 坐标实现可控的文字倾斜：四角 position 的 X、Y 使用归一化设备坐标（NDC_XY_WORLD_Z 模式），直接映射屏幕、不经过透视除法，Z 为世界坐标控制深度，倾斜由 XY 屏幕形状决定，适合需要精确控制屏幕落点的场景。源码参考[DepthComponent_NDC.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkUISample/DepthComponentSample/entry/src/main/ets/pages/DepthComponent_NDC.ets)

5. 使用移轴裁剪渲染背景局部：通过相机可选参数 cameraBufferCrop（移轴裁剪，又称离轴渲染），在不移动、不转动相机的前提下，从背景图中截取一个局部并放大渲染为景深背景。源码参考[DepthComponent_Crop.ets](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/DocsSample/ArkUISample/DepthComponentSample/entry/src/main/ets/pages/DepthComponent_Crop.ets)

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行，景深组件为系统接口，仅对系统应用开放，且仅可在 Stage 模型下使用。支持设备：Mate 70 Pro。

2.本示例为 Stage 模型，支持 API26 版本 full-SDK，版本号：26.0.0，镜像版本号：OpenHarmony_26.0.0 Release。

3.本示例需要使用 DevEco Studio 6.0.0 Release 及以上版本才可编译运行。

4.静态图片背景需配套准备深度图（灰度图），且深度图需与背景图分辨率保持一致；3D 模型背景（glTF/glb）自带深度信息，无需设置深度图。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/DepthComponentSample > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````
