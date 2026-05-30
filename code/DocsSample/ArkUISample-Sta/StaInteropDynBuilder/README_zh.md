# 在ArkTS-Sta中使用ArkTS-Dyn的自定义构建函数（@Builder）

## 介绍

本工程帮助开发者更好地理解在ArkTS-Sta中使用ArkTS-Dyn的自定义构建函数（@Builder）的使用场景。该工程中展示的代码详细描述可查如下链接：

[在ArkTS-Sta中使用ArkTS-Dyn的自定义构建函数（@Builder）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-builder.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynBuilder](./screenshots/StaInteropDynBuilder.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaBuilderRef.ets
│   │   │   └── StaBuilderValue.ets
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
static_module/src/
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

1. @Builder按引用传递参数：传递对象字面量，状态变量变化触发@Builder内部UI刷新。

2. @Builder按值传递参数：默认按值传递，状态变量变化不会触发@Builder内部UI刷新。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynBuilder/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
