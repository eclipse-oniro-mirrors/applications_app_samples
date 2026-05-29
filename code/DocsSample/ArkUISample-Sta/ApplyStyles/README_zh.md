# applyStyles：定义组件重用样式

## 介绍

本工程帮助开发者更好地理解applyStyles的使用场景。该工程中展示的代码详细描述可查如下链接：

[applyStyles：定义组件重用样式（ArkTS-ST）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-apply-styles.md)

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
│   │       └── ApplyStylesFancy.ets
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
    ├── ApplyStylesUnit.test.ets
    └── List.test.ets
```

## 具体实现

1. **组件内Styles方法和全局Styles方法的用法**：展示使用applyStyles方法将多条样式设置提炼成Styles方法，在组件声明位置调用。包括全局定义的Styles方法（function关键字）和组件内定义的Styles方法（通过this访问组件状态变量）。

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
echo code/DocsSample/ArkUISample-Sta/ApplyStyles/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
