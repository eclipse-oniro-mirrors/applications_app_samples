# ArkTS-Sta使用ArkTS-Dyn @Builder按引用传递参数V2状态管理互操作

## 介绍

本工程帮助开发者更好地理解ArkTS-Sta使用ArkTS-Dyn @Builder按引用传递参数V2状态管理互操作的使用场景。该工程中展示的代码详细描述可查如下链接：

[ArkTS-Sta使用ArkTS-Dyn @Builder按引用传递参数V2状态管理互操作](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-builder-v2.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynBuilderV2](./screenshots/StaInteropDynBuilderV2.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaBuilderV2Ref.ets
│   │   │   ├── StaBuilderV2Param.ets
│   │   │   └── StaBuilderV2Wrapped.ets
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

1. 全局自定义构建函数@Builder按引用传递参数：ArkTS-Sta使用ArkTS-Dyn全局自定义构建函数@Builder按引用传递参数，支持V2状态变量驱动刷新。

2. 自定义组件@BuilderParam成员属性@Builder按引用传递参数：ArkTS-Sta使用ArkTS-Dyn自定义组件@BuilderParam成员属性@Builder按引用传递参数，支持尾随闭包和参数初始化。

3. WrappedBuilder对象@Builder按引用传递参数：ArkTS-Sta使用ArkTS-Dyn WrappedBuilder对象@Builder按引用传递参数，支持V2状态变量驱动刷新。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynBuilderV2/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
