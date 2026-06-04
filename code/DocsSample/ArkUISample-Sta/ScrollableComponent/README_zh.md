# ArkUI使用滚动类指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [创建懒加载布局 (LazyColumnLayout/LazyVGridLayout/LazyVWaterFlowLayout)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-layout-development-create-lazy-layout.md)。

### 效果预览

| 首页                               |
|----------------------------------|
| ![](screenshots/device/home.png) |

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
|   |---lazyLayout                          //懒加载布局
|   |       |---Index.ets
|   |       |---LazyColumnLayoutNestedLazyLayout.ets
|   |       |---LazyColumnLayoutSample.ets
|   |       |---LazyVGridLayoutSample.ets
|   |       |---LazyVWaterFlowLayoutSample.ets
|   |       |---ListNestedLazyLayout.ets
|---pages
|   |---Index.ets                           // 应用主页面
```

## 具体实现

1. 懒加载布局（LazyColumnLayout/LazyVGridLayout/LazyVWaterFlowLayout）：在Scroll或List内使用LazyVGridLayout、LazyVWaterFlowLayout、LazyColumnLayout三种懒加载布局容器，配置columnsTemplate、rowsGap、columnsGap、space、alignItems等布局属性，支持多种布局容器混合组合使用，各容器使用独立LazyForEach数据源，通过onVisibleIndexesChange回调实现触底加载更多数据。

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
echo code/DocsSample/ArkUISample-Sta/ScrollableComponent > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
````
