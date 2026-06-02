# Function-with-Receiver：定义扩展组件样式

## 介绍

本工程帮助开发者更好地理解Function-with-Receiver的使用场景。该工程中展示的代码详细描述可查如下链接：

[Function-with-Receiver：定义扩展组件样式](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management/arkts-function-with-receiver.md)

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
│   │   │   ├── ReceiverParam.ets
│   │   │   ├── ReceiverChain.ets
│   │   │   ├── ReceiverEvent.ets
│   │   │   ├── ReceiverState.ets
│   │   │   ├── ReceiverScenarioBefore.ets
│   │   │   └── ReceiverScenarioAfter.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. Function-with-Receiver支持参数：开发者可以在调用时传递参数，调用遵循TS方法传值调用。

2. 链式调用Function-with-Receiver：Function-with-Receiver的返回值声明为this，可以用于链式调用。

3. 参数为function作为Event事件句柄：Function-with-Receiver方法的参数可以为function，作为Event事件的句柄。

4. 参数为状态变量：Function-with-Receiver的参数可以为状态变量，当状态变量改变时，UI可以正常的被刷新渲染。

5. 使用场景(不使用Function-with-Receiver)：展示不使用样式复用时代码的冗余。

6. 使用场景(使用Function-with-Receiver)：将样式组合复用，使得代码更加简洁，增强可读性。

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
echo code/DocsSample/ArkUISample-Sta/FunctionWithReceiver/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
