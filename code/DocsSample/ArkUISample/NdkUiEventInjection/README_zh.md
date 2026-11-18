# 注入手势命令（NdkUiEventInjection）

本示例对应《注入手势命令》开发指南，展示通过NDK接口向UI实例注入手势命令（点击、滚动、内容切换、返回、按键）的方法。示例通过[OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/capi-ui-event-injection-h.md)接口注入一条点击命令，命令以JSON描述，执行结果通过完成回调返回。

### 使用说明

1. 点击“注入点击命令”按钮，Native侧调用注入接口，向当前UI实例注入一次点击。

2. 注入的点击命令命中“目标组件”时，目标组件的点击回调被触发，页面上的点击次数加一；注入结果会同步打印在日志中。

### 工程目录

```
entry/src/main/
|---cpp
|   |---NativeEntry.cpp                       // 注入命令实现
|   |---NativeEntry.h
|   |---napi_init.cpp                         // 模块注册
|   |---CMakeLists.txt
|---ets
|   |---entryability
|   |       |---EntryAbility.ets
|   |---pages
|   |       |---Index.ets                     // 应用主页面
```

### 具体实现

1. ArkTS侧通过`this.getUIContext()`获取UIContext，调用Native模块注册的`injectClick`接口。

2. Native侧通过[OH_ArkUI_GetContextFromNapiValue](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/capi-native-node-napi-h.md)从入参获取ArkUI_ContextHandle。

3. 通过[OH_ArkUI_NativeModule_UIJsonWrapperCreate](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/capi-ui-json-wrapper-h.md)创建命令对象后，调用[OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/capi-ui-event-injection-h.md)注入命令，执行结果通过完成回调通知。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例涉及的接口从API版本26.1.0开始支持。

2. 本示例仅支持标准系统上运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/NdkUiEventInjection > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```