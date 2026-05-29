# wrapBuilder：封装全局@Builder

## 介绍

本工程帮助开发者更好地理解wrapBuilder的使用场景。该工程中展示的代码详细描述可查如下链接：

[wrapBuilder：封装全局@Builder](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-static-wrapBuilder.md)

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
│   │   │   ├── WrapBuilderVariable.ets
│   │   │   ├── WrapBuilderForEach.ets
│   │   │   ├── WrapBuilderReference.ets
│   │   │   └── WrapBuilderDynamicSwitch.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. @Builder方法赋值给变量：使用wrapBuilder封装@Builder函数，再将返回值赋值给变量，解决@Builder方法赋值给变量后无法使用的问题。

2. @Builder方法赋值给变量在UI语法中使用：使用wrapBuilder封装@Builder函数列表，配合ForEach进行不同@Builder函数的渲染。

3. 引用传递：按引用传递参数时，传递的状态变量的改变会引起@Builder方法内的UI刷新。

4. 动态切换：使用wrapBuilder封装全局@Builder，实现全局@Builder的动态切换。

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
echo code/DocsSample/ArkUISample-Sta/WrapBuilder/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
