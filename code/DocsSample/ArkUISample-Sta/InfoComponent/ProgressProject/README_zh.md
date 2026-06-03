# ArkUI使用文本控件指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/tree/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [进度条 (Progress)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-common-components-progress-indicator.md)。
### 效果预览

| 初始效果             |        进度条更新进度示例页面          | 进度条+5                              |
|------------------------------------|------------------------------------|------------------------------------|
| ![](screenshots/device/image1.png) | ![](screenshots/device/image2.png) | ![](screenshots/device/image3.png) |

### 使用说明

1. 在主界面，查看不同样式进度条。
2. 在主界面点击“更新进度示例”按钮进入进度条更新进度示例页面。
3. 在进度条更新进度示例页面，点击进度条+5的按钮，可见进度增长，当进度满后再点击恢复至0进度。
4. 通过自动测试框架可进行测试及维护。

### 工程目录
```
entry/src/main/ets/
|---entryability          
|---pages
|   |---Index.ets                      // 应用主页面
|   |---ProgressCase1.ets              // 进度条更新进度示例页面
entry/src/ohosTest/
|---ets
|   |---index.test.ets                 // 示例代码测试代码
```

## 具体实现
* 进度条
    * 源码参考：[Index.ets](./entry/src/main/ets/pages/Index.ets)
    * type属性设置不同的ProgressType创建不同样式的进度条组件：线性、环形无刻度、环形有刻度、圆形、胶囊
    * 设置属性value值更新进度条的进度

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
echo code/DocsSample/ArkUISample-Sta/InfoComponent/ProgressProject > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
````