# 在ArkTS-Sta中使用ArkTS-Dyn的自定义组件

## 介绍

本工程帮助开发者更好地理解在ArkTS-Sta中使用ArkTS-Dyn的自定义组件的使用场景。该工程中展示的代码详细描述可查如下链接：

[在ArkTS-Sta中使用ArkTS-Dyn的自定义组件](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-component.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynComponent](./screenshots/StaInteropDynComponent.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   └── StaDynComponent.ets
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

1. 在ArkTS-Sta中使用ArkTS-Dyn自定义组件：支持直接使用和嵌套使用ArkTS-Dyn的@Component和@ComponentV2自定义组件。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynComponent/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
