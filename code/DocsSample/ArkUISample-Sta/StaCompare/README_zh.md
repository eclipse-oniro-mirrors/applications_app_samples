# StaCompare：静态模式对比示例

## 介绍

本工程帮助开发者更好地理解静态模式（Sta）下各接口的使用场景。该工程中展示的代码详细描述可查如下链接：

- [静态无需mutableBuilder](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-no-mutable-builder.md)
- [Monitor触发机制(Sta)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-monitor-trigger.md)
- [globalConnect接口(Sta)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-global-connect.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── StaticNoMutableBuilder.ets
│   │   │   ├── MonitorTriggerSta.ets
│   │   │   └── GlobalConnectSta.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 静态无需mutableBuilder：在静态模式下，通过条件判断直接切换@Builder，无需使用mutableBuilder。

2. Monitor触发机制(Sta)：展示在静态模式下Monitor的触发机制，包括构造函数中和aboutToAppear中的触发差异。

3. globalConnect接口(Sta)：展示从动态模式迁移到静态模式时globalConnect接口的使用变更，包括类型注册和构造器管理。

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
echo code/DocsSample/ArkUISample-Sta/StaCompare/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
