# 状态管理动静态对比示例（Dyn）

## 介绍

本工程帮助开发者更好地理解ArkTS动态模式下的状态管理使用场景，包括Monitor触发机制和globalConnect接口。该工程中展示的代码详细描述可查如下链接：

[ArkTS状态管理动静态对比](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-state-management-dynamic-static-compare.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![首页](./screenshots/index.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── MonitorTriggerDyn.ets
│   │   │   └── GlobalConnectDyn.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. Monitor触发机制（Dyn）：展示在动态模式下使用UIUtils.addMonitor监听@Trace装饰的属性变化。

2. globalConnect接口（Dyn）：展示在动态模式下使用PersistenceV2.globalConnect实现持久化数据管理。

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
echo code/DocsSample/ArkUISample-Sta/DynCompare/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
