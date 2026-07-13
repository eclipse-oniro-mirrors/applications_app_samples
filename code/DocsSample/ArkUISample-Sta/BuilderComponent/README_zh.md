# @Builder装饰器：自定义组件

## 介绍

本工程帮助开发者更好地理解@Builder装饰器的使用场景。该工程中展示的代码详细描述可查如下链接：

[@Builder装饰器：自定义组件](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-builder.md)

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
│   │   │   ├── BuilderPrivate.ets
│   │   │   ├── BuilderGlobal.ets
│   │   │   ├── BuilderMakeBinding.ets
│   │   │   ├── BuilderByReference.ets
│   │   │   ├── BuilderByValue.ets
│   │   │   ├── BuilderInCustomComponent.ets
│   │   │   ├── BuilderGlobalScene.ets
│   │   │   ├── BuilderDecoratorRefresh.ets
│   │   │   ├── BuilderAsCustomBuilder.ets
│   │   │   ├── BuilderNested.ets
│   │   │   ├── BuilderCombinedV2.ets
│   │   │   ├── BuilderCombinedLocal.ets
│   │   │   ├── BuilderAcrossComponents.ets
│   │   │   ├── BuilderVariable.ets
│   │   │   ├── BuilderGeneric.ets
│   │   │   ├── BuilderStateRefresh.ets
│   │   │   ├── BuilderOneParam.ets
│   │   │   ├── BuilderComponentV2Refresh.ets
│   │   │   ├── BuilderModifyParamPositive.ets
│   │   │   └── BuilderComponentParam.ets
│   │   │   ├── BuilderMutableBindingNoSetter.ets
│   │   │   ├── BuilderChangeVariableRight.ets
│   │   │   └── BuilderCallInWatch.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 私有自定义构建函数：使用@Builder装饰组件内的私有构建函数，支持有参数和无参数两种形式。

2. 全局自定义构建函数：使用@Builder装饰全局构建函数，在自定义组件中直接调用。

3. 按引用传递参数（UIUtils.makeBinding）：使用UIUtils.makeBinding传入Binding和MutableBinding类型参数，支持@Builder内组件UI刷新。

4. 引用传递参数：使用interface类型按引用传递参数给@Builder，支持UI刷新。

5. 值传递参数：使用基础类型按值传递参数给@Builder，不支持更新UI。

6. 自定义组件中使用@Builder：在自定义组件中定义和使用@Builder函数，通过装饰器变量触发UI刷新。

7. 全局@Builder使用场景：展示全局@Builder函数在复杂参数场景下的使用，包括嵌套对象和数组。

8. 装饰器变量触发UI刷新：使用@State装饰器变量传递给@Builder函数，触发UI刷新。

9. @Builder作为CustomBuilder类型：将@Builder函数作为CustomBuilder类型用于swipeAction等场景。

10. 嵌套@Builder函数：在@Builder函数中嵌套调用其他@Builder函数和自定义组件。

11. @Builder与V2装饰器联合使用：结合@ObservedV2、@Trace、@Param等V2装饰器使用@Builder。

12. @Builder与@Local联合使用：使用@Local装饰器变量与@Builder函数配合，通过引用传递实现UI刷新。

13. 跨组件复用@Builder：在多个可复用组件中共享同一个全局@Builder函数。

14. 使用变量封装@Builder：将@Builder函数存储在变量和数组中，动态调用。

15. @Builder泛型：使用泛型类型定义@Builder函数，支持不同数据类型的渲染。

16. @Builder状态刷新：使用UIUtils.makeBinding传递复杂对象，结合@ObservedV2/@Trace实现状态刷新。

17. 单参数@Builder：正确使用单个参数的@Builder函数。

18. @ComponentV2中@Builder刷新：在@ComponentV2装饰的组件中使用@Builder，结合@Local和@Trace实现UI刷新。

19. 正确修改@Builder参数：使用引用传递方式正确修改@Builder参数以触发UI刷新。

20. 自定义组件拆分参数：将复杂对象拆分为简单类型参数传递给子组件，实现按引用传递触发UI刷新。

21. MutableBinding参数无SetterCallback：使用UIUtils.makeBinding构造MutableBinding时，必须传递SetterCallback以支持@Builder函数内修改参数值。

22. 正确修改变量值：使用MutableBinding在@Builder装饰的函数中修改参数值，必须传递SetterCallback避免运行时错误。

23. @Watch中不调用@Builder：不在@Watch回调函数中使用@Builder函数，而是在build方法中正确使用@Builder。

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
echo code/DocsSample/ArkUISample-Sta/BuilderComponent/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
