# 在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态V2

## 介绍

本工程帮助开发者更好地理解在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态V2的使用场景。该工程中展示的代码详细描述可查如下链接：

[在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-storages-v2.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或文本，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynStoragesV2](./screenshots/StaInteropDynStoragesV2.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaDynStorageV2App.ets
│   │   │   └── StaDynStorageV2Persistence.ets
│   └── resources
│       ├── ...
├─── ...
dynamic_module/src/
├── main
│   ├── ets
│   │   ├── components
│   │   │   ├── AppStorageV2Page.ets
│   │   │   └── PersistenceV2Page.ets
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

1. AppStorageV2互操作：在ArkTS-Sta主模块中调用AppStorageV2接口操作ArkTS-Dyn模块创建的数据，并通过enableCompatibleObservedV2ForDynamic使ArkTS-Sta @Trace属性在ArkTS-Dyn中可观测。

2. PersistenceV2封装接口交互：ArkTS-Sta和ArkTS-Dyn的PersistenceV2不直接互操作，通过ArkTS-Dyn模块导出的封装接口进行connect、save、remove、keys和数据修改操作。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynStoragesV2/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```