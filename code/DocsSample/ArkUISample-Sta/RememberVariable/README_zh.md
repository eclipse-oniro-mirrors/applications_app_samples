# rememberVariable：@Builder内部状态

## 介绍

本工程帮助开发者更好地理解rememberVariable的使用场景。该工程中展示的代码详细描述可查如下链接：

[rememberVariable：@Builder内部状态（ArkTS-Sta）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-remembervariable.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|

## 工程目录

```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets
│   │   └── pages
│   │       ├── Index.ets
│   │       ├── RememberBasicType.ets
│   │       ├── RememberBuiltinType.ets
│   │       ├── RememberInterfaceType.ets
│   │       ├── RememberClassType.ets
│   │       ├── RememberPassVariable.ets
│   │       ├── RememberFunctionType.ets
│   │       └── RememberInitFromState.ets
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
    ├── RememberVariableUnit.test.ets
    └── List.test.ets
```

## 具体实现

1. **@Builder内声明基础类型的状态变量**：展示在@Builder函数内使用rememberVariable声明基础类型（string）状态变量并触发UI更新。
2. **@Builder内声明内置类型的状态变量**：展示在@Builder函数内使用rememberVariable配合UIUtils.makeObserved声明Array类型状态变量。
3. **@Builder内声明interface字面量的状态变量**：展示在@Builder函数内使用rememberVariable配合makeObserved声明interface字面量状态变量。
4. **@Builder内声明class类型的状态变量**：展示在@Builder函数内使用rememberVariable声明@Observed装饰的class类型状态变量。
5. **@Builder内声明状态变量并传递**：展示在@Builder函数中声明的MutableVariable类型状态变量传递给其他@Builder函数，支持同步和UI刷新。
6. **修改函数地址触发UI刷新**：展示使用rememberVariable存储Function类型状态变量，赋值修改后触发UI刷新。
7. **rememberVariable声明的状态变量不能同步数据**：展示在build()内使用rememberVariable封装已有状态变量只能记录初始值，不能同步改动。

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
echo code/DocsSample/ArkUISample-Sta/RememberVariable/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
