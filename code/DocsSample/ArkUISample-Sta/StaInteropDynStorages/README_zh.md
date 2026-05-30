# 在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态

## 介绍

本工程帮助开发者更好地理解在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态的使用场景。该工程中展示的代码详细描述可查如下链接：

[在ArkTS-Sta中使用ArkTS-Dyn管理应用拥有的状态](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-sta-interop-dyn-storages.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynStorages](./screenshots/StaInteropDynStorages.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaDynStorageLsp.ets
│   │   │   ├── StaDynStorageLsl.ets
│   │   │   ├── StaDynStorageSp.ets
│   │   │   ├── StaDynStorageSl.ets
│   │   │   ├── StaDynStorageApp.ets
│   │   │   ├── StaDynStoragePersist.ets
│   │   │   └── StaDynStorageEnv.ets
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

1. @LocalStorageProp交互：ArkTS-Dyn自定义组件通过@LocalStorageProp与ArkTS-Sta的LocalStorage数据进行单向数据同步。

2. @LocalStorageLink交互：ArkTS-Dyn自定义组件通过@LocalStorageLink与ArkTS-Sta的LocalStorage数据进行双向数据同步。

3. @StorageProp交互：ArkTS-Dyn自定义组件通过@StorageProp和ArkTS-Sta的AppStorage数据进行单向数据同步。

4. @StorageLink交互：ArkTS-Dyn自定义组件通过@StorageLink和ArkTS-Sta的AppStorage数据进行双向数据同步。

5. AppStorage接口交互：通过ArkTS-Dyn的AppStorage接口操作ArkTS-Sta的AppStorage数据。

6. PersistentStorage交互：ArkTS-Dyn使用ArkTS-Sta PersistentStorage中的数据。

7. Environment交互：ArkTS-Dyn使用ArkTS-Sta Environment中的数据。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynStorages/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
