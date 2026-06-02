# V2自定义组件冻结场景

## 介绍

本工程帮助开发者更好地理解V2自定义组件冻结的使用场景。该工程中展示的代码详细描述可查如下链接：

[V2自定义组件冻结场景](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-custom-components-freezeV2.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── FreezePage1.ets
│   │   │   ├── FreezePage2.ets
│   │   │   ├── FreezeTabContent.ets
│   │   │   ├── FreezeNavigation.ets
│   │   │   └── FreezeMixNavigationTab.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 页面路由冻结：当页面1跳转到页面2时，页面1处于inactive状态，状态变量不响应更新。从页面2返回后，页面1恢复active状态，触发@Monitor回调。

2. TabContent冻结：对Tabs中当前不可见的TabContent进行冻结，不会触发组件的更新。切换Tab时，inactive的TabContent恢复active，触发@Monitor回调。

3. Navigation冻结：当NavDestination不可见时，子自定义组件设置成非激活态。返回该页面时，恢复激活态并触发@Monitor回调。

4. Navigation和TabContent混用冻结：当多个冻结条件满足时，只有所有冻结场景都解冻后，组件才会恢复成激活状态。

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
echo code/DocsSample/ArkUISample-Sta/ComponentFreezeV2/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
