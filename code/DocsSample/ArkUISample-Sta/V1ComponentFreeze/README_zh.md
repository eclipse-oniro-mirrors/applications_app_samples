# V1自定义组件冻结场景

## 介绍

本工程帮助开发者更好地理解V1自定义组件冻结功能的使用场景。该工程中展示的代码详细描述可查如下链接：

[V1自定义组件冻结场景](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-freeze.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 工程目录

```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets
│   │   └── pages
│   │       ├── Index.ets
│   │       ├── FreezePageRouter.ets
│   │       ├── FreezePage2.ets
│   │       ├── FreezeTabContent.ets
│   │       ├── FreezeLazyForEach.ets
│   │       ├── FreezeNavigation.ets
│   │       ├── FreezeReuse.ets
│   │       └── FreezeMixNavTab.ets
│   └── resources
│       ├── base
│       ├── dark
│       └── rawfile
├── ohosTest
│   └── ets/test
│       ├── Ability.test.ets
│       ├── index.test.ets
│       └── List.test.ets
└── test
    ├── V1ComponentFreezeUnitTest.ets
    └── List.test.ets
```

## 具体实现

1. **页面路由冻结**：通过router跳转页面时，非栈顶页面的组件冻结，不响应状态变量变化。
2. **TabContent冻结**：Tabs中非当前显示的TabContent中的自定义组件被冻结。
3. **LazyForEach冻结**：LazyForEach中缓存的自定义组件被冻结，不响应状态变量变化。
4. **Navigation冻结**：不可见的NavDestination中的子自定义组件被冻结。
5. **组件复用冻结**：LazyForEach和组件复用混用场景，复用池中的节点被冻结。
6. **Navigation+TabContent混用**：Navigation和TabContent组合使用时的冻结行为。

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
echo code/DocsSample/ArkUISample-Sta/V1ComponentFreeze/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
