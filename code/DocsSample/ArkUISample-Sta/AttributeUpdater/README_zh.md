# 属性更新器 (AttributeUpdater)

## 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [属性更新器 (AttributeUpdater)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-user-defined-extension-attributeUpdater.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![attributeupdater](./screenshots/attributeupdater.png)|

## 工程目录

```
ArkTSUserAttributeUpdater
├── entry/src/main
│   ├── ets
│   │  ├── entryability
|   |  |   ├── EntryAbility.ets                 // 程序入口类 
│   |  └── pages
│   │      ├── AttModifier.ets                  // 通过modifier修改属性界面
│   │      ├── AttributerUpdaterInterface.ets   // AttributerUpdater接口定义
│   │      ├── AttUpdate.ets                    // 通过update更新属性界面
│   │      └── Index.ets                        // 主界面
```

## 具体实现

1. 通过modifier直接修改属性
   组件初始化完成之后，开发者可以通过AttributeUpdater实例的attribute属性方法，获取到属性对象。通过属性对象直接修改属性，会立即触发组件属性的更新。。
2. 通过modifier更新组件的构造参数
   可以通过AttributeUpdater实例的updateConstructorParams方法，直接更新组件的构造参数。

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束和限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，arkTSVersion为1.2。

3.本示例需要使用Sta SDK配套IDE版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/AttributeUpdater/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
