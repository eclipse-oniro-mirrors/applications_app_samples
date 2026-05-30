# 在ArkTS-Sta中使用ArkTS-Dyn管理组件拥有的状态

## 介绍

本工程帮助开发者更好地理解在ArkTS-Sta中使用ArkTS-Dyn管理组件拥有的状态（V1）的使用场景。该工程中展示的代码详细描述可查如下链接：

[在ArkTS-Sta中使用ArkTS-Dyn管理组件拥有的状态](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-statemanagement-v1.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynStatemanagementV1](./screenshots/StaInteropDynStatemanagementV1.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaDynStateV1State.ets
│   │   │   ├── StaDynStateV1Prop.ets
│   │   │   ├── StaDynStateV1Link.ets
│   │   │   └── StaDynStateV1Provide.ets
│   └── resources
│       ├── ...
├─── ...
dynamic_module/src/
├── main
│   ├── ets
│   │   ├── components
│   │   │   └── MainPage.ets
│   │   └── module.json5
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. @State交互：ArkTS-Sta使用ArkTS-Dyn的@State成员属性，支持初始化子组件的@State。

2. @Prop交互：ArkTS-Sta使用ArkTS-Dyn的@Prop成员属性，建立单向同步机制。

3. @Link交互：ArkTS-Sta使用ArkTS-Dyn的@Link成员属性，建立双向同步机制。

4. @Provide/@Consume交互：ArkTS-Sta使用ArkTS-Dyn的@Provide/@Consume，支持祖先与子孙组件的双向数据同步。

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1.本示例已适配API version 23及以上版本SDK。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/StaInteropDynStatemanagementV1/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
