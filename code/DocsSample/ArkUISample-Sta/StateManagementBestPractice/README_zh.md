# 状态管理优秀实践（ArkTS-Sta）

## 介绍

本工程帮助开发者更好地理解状态管理优秀实践的使用场景。该工程中展示的代码详细描述可查如下链接：

[状态管理优秀实践](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-state-management-best-practices.md)

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
│   │       ├── ForceUpdateCounterexample.ets
│   │       ├── ForceUpdatePositiveCase.ets
│   │       ├── PreciseControlCounterexamples.ets
│   │       ├── PreciseControlPositiveCases.ets
│   │       ├── ObjectControlCounterexample.ets
│   │       ├── ObjectControlPositiveCase.ets
│   │       ├── LoopStateInefficient.ets
│   │       ├── LoopStateOptimized.ets
│   │       ├── CalculationDirectState.ets
│   │       └── CalculationTempVariable.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 不使用状态变量强行更新非状态变量关联组件：应将需要触发UI更新的变量用@Local装饰，而不是通过其他状态变量来强制更新。

2. 精准控制状态变量关联的组件数：将多个同级组件相同的状态属性绑定到父组件上，减少刷新组件数量。

3. 合理控制对象类型状态变量关联的组件数量：使用@ObservedV2和@Trace装饰器实现属性级别的精准刷新，避免冗余渲染。

4. 避免在for、while等循环逻辑中频繁读取状态变量：在循环外预先读取状态变量值到局部变量中。

5. 使用临时变量替换状态变量进行多次操作：通过临时变量完成计算，最后一次性赋值给状态变量。

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
echo code/DocsSample/ArkUISample-Sta/StateManagementBestPractice/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
