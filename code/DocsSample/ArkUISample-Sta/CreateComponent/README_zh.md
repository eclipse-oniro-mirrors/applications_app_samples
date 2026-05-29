# @Component装饰器: 自定义组件

## 介绍

本工程帮助开发者更好地理解自定义组件的创建和使用。该工程中展示的代码详细描述可查如下链接：

[@Component装饰器: 自定义组件](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-create-component.md)

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
│   │   │   ├── ComponentBasicUsage.ets
│   │   │   ├── EntryDecorator.ets
│   │   │   ├── ComponentParams.ets
│   │   │   ├── BuildFunction.ets
│   │   │   ├── BuildVariableDeclaration.ets
│   │   │   ├── BuildLogPrint.ets
│   │   │   ├── BuildSwitchCase.ets
│   │   │   ├── BuildLocalScope.ets
│   │   │   ├── BuildExpression.ets
│   │   │   ├── BuildNotRecommended.ets
│   │   │   ├── ComponentStyle.ets
│   │   │   └── ComponentExtend.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 自定义组件基本用法：展示@Component装饰的自定义组件HelloComponent的创建和在父组件ParentComponent中的重用。

2. @Entry装饰器：展示@Entry装饰器的参数配置，包括routeName、storage、useSharedStorage。

3. 自定义组件参数规定：展示创建自定义组件实例时初始化成员变量的方式。

4. build()函数：展示build()函数的根节点规则，@Entry组件的根节点必须为容器组件。

5. build()中变量声明：展示在build()根节点中进行变量声明。

6. build()中日志打印：展示在build()根节点中通过hilog打印日志。

7. switch/case结构：展示在build()函数中使用switch/case结构实现条件渲染。

8. 本地作用域：展示在build()中创建本地作用域。

9. 表达式：展示在build()中使用三元表达式实现条件渲染。

10. 不建议用法：展示在build()中执行复杂计算逻辑的不推荐用法。

11. 自定义组件通用样式：展示通过"."链式调用为自定义组件设置通用样式。

12. 支持自定义组件扩展：展示重写通用属性方法，使用super关键字调用基类方法。

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
echo code/DocsSample/ArkUISample-Sta/CreateComponent/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
