# @BuilderParam装饰器：引用@Builder函数

## 介绍

本工程帮助开发者更好地理解@BuilderParam装饰器的使用场景。该工程中展示的代码详细描述可查如下链接：

[@BuilderParam装饰器：引用@Builder函数](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-builderparam.md)

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
│   │   │   ├── BuilderParamInitMethod.ets
│   │   │   ├── BuilderParamThis.ets
│   │   │   ├── BuilderParamSceneInit.ets
│   │   │   ├── BuilderParamTrailingClosure01.ets
│   │   │   ├── BuilderParamTrailingClosure02.ets
│   │   │   ├── BuilderParamJumpLogic.ets
│   │   │   ├── BuilderParamGlobalLocalInit.ets
│   │   │   ├── BuilderParamInComponentV2.ets
│   │   │   ├── BuilderParamRequirePositive.ets
│   │   │   └── BuilderParamMustBuilderPositive.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 父组件初始化子组件@BuilderParam：使用父组件自定义构建函数初始化子组件@BuilderParam装饰的方法。

2. this的指向：在ArkTS-Sta中，this始终指向定义处的上下文。

3. 参数初始化组件：@BuilderParam装饰的方法为有参数或无参数的形式，必须与指向的@Builder方法类型匹配。

4. 尾随闭包初始化组件示例1：使用尾随闭包对@Component装饰的自定义组件中的@BuilderParam进行初始化。

5. 尾随闭包初始化组件示例2：使用全局或局部@Builder通过尾随闭包的形式对@ComponentV2装饰的自定义组件中的@BuilderParam进行初始化。

6. @BuilderParam隔离跳转逻辑：使用@BuilderParam来隔离跳转逻辑，禁用特定组件的跳转功能。

7. 全局和局部@Builder初始化@BuilderParam：使用@BuilderParam装饰的变量接收父组件通过@Builder传递的内容进行初始化。

8. @ComponentV2中使用@BuilderParam：使用全局或局部@Builder初始化@ComponentV2装饰的自定义组件中的@BuilderParam属性。

9. @Require和@BuilderParam联合使用：@Require装饰的变量必须从外部初始化。

10. @BuilderParam初始化值必须为@Builder：使用全局@Builder装饰的方法为子组件@BuilderParam装饰的变量初始化。

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
echo code/DocsSample/ArkUISample-Sta/BuilderParam/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
