# ModularObjectExtensionDispatcher服务端

### 介绍

本示例展示了[ModularObjectExtensionAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/capi-modular-object-extension-ability-h.md)服务端的开发方法：作为ModularObjectDispatcher客户端的服务端，通过[Taihe工具](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-models/modular-object-extension-ability-taihe.md)生成类型库元数据文件和Proxy/Stub代码，对外提供可被动态查询和调用的接口。

主要演示：

1. 创建并注册ModularObjectExtensionAbility，对外提供跨进程IPC服务。
2. 通过Taihe工具生成类型库元数据和Proxy、Stub，供客户端Dispatcher动态查询接口、方法、参数、枚举、结构体等信息。
3. 实现主服务接口`ITestMainService`（含Add、复杂类型参数方法、注册回调、获取子接口等）、子服务接口`ICalculator`（multiply方法）、回调接口`ITestEventCallback`。

### 效果展示

不涉及UI界面交互。本应用作为服务端运行，等待客户端（ModularObjectExtensionDispatcherClient）连接并通过Dispatcher动态调用方法。

### 工程目录

```
entry/src/main/
├── cpp/
│   ├── moe_ability.cpp        // ModularObjectExtensionAbility入口与生命周期回调
│   ├── log_helper.h           // 日志辅助宏
│   ├── CMakeLists.txt         // CMake构建配置
│   └── TaiHe/
│       ├── itest_main_service.h             // ITestMainService接口定义
│       ├── itest_event_callback.h           // ITestEventCallback回调接口定义
│       ├── icalculator.h                    // ICalculator子接口定义
│       ├── point.h / point.cpp              // Point结构体定义
│       ├── test_main_service_stub.h/cpp     // 主服务Stub
│       ├── test_main_service_stub_impl.h/cpp // 主服务Stub实现
│       ├── test_main_service_proxy.h/cpp    // 主服务Proxy（服务端内部使用）
│       ├── calculator_stub.h/cpp            // ICalculator Stub
│       ├── calculator_stub_impl.h/cpp       // ICalculator Stub实现
│       ├── calculator_proxy.h/cpp           // ICalculator Proxy
│       ├── test_event_callback_stub.h/cpp   // 回调Stub
│       └── test_event_callback_proxy.h/cpp  // 回调Proxy
├── ets/
│   ├── entryability/
│   └── pages/
│       └── Index.ets          // 主界面
├── module.json5               // 模块配置，声明SampleModularObjectExtAbility
└── resources/
```

### 使用说明

1. **配置扩展能力**：在`module.json5`的`extensionAbilities`中声明`type: "modularObject"`类型的扩展能力，通过`srcEntry`指定Native库`libentry.so`。
2. **实现入口函数**：在`OH_AbilityRuntime_OnNativeExtensionCreate`中获取扩展实例，注册`OnCreate`、`OnConnect`、`OnDisconnect`、`OnDestroy`生命周期回调。
3. **创建Stub**：在`OnConnect`回调中创建`TestMainServiceStub`实例，通过`GetRemoteStub()`返回IPC RemoteStub给客户端。
4. **业务实现**：在Stub实现类中实现各方法的具体逻辑，供客户端通过Dispatcher动态调用。

### 具体实现

ModularObjectExtensionAbility的入口注册和生命周期管理在Native模块中实现，源码参考：[moe_ability.cpp](entry/src/main/cpp/moe_ability.cpp)。

- 注册扩展能力：在`OH_AbilityRuntime_OnNativeExtensionCreate`中调用`OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase`获取实例，注册`OnCreate`、`OnConnect`、`OnDisconnect`、`OnDestroy`回调。
- 创建并返回Stub：在`OnConnect`回调中创建`TestMainServiceStubImpl`实例，通过`GetRemoteStub()`返回IPC RemoteStub，接口参考：[modular_object_extension_ability.h](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/capi-modular-object-extension-ability-h.md)。
- 类型库元数据：通过Taihe工具从接口定义文件生成`testmainservice.typelib.json`，供客户端Dispatcher在运行时动态查询接口、方法、参数、结构体、枚举等元数据，源码参考：[testmainservice.typelib.json](entry/src/main/cpp/TaiHe/testmainservice.typelib.json)。
- 主服务接口实现：在`TestMainServiceStubImpl`中实现Add、TestType_Array/Vector/Set/Map/Struct、RegisterCallback、GetPrimaryCalculator等方法，源码参考：[test_main_service_stub_impl.cpp](entry/src/main/cpp/TaiHe/test_main_service_stub_impl.cpp)。
- 子服务接口实现：在`CalculatorStubImpl`中实现ICalculator的multiply方法，源码参考：[calculator_stub_impl.cpp](entry/src/main/cpp/TaiHe/calculator_stub_impl.cpp)。
- 回调接口Proxy：服务端通过`TestEventCallbackProxy`向客户端回调OnConnected/OnDisconnected事件，源码参考：[test_event_callback_proxy.cpp](entry/src/main/cpp/TaiHe/test_event_callback_proxy.cpp)。

各功能在客户端的调用场景（由客户端通过Dispatcher动态调用）：

- 加法运算：客户端通过Dispatcher调用`Add`方法。
- 复杂类型传递：客户端通过Dispatcher调用`TestType_Array`/`Vector`/`Set`/`Map`/`Struct`方法。
- 注册回调：客户端将回调桩传递给服务端的`RegisterCallback`方法，服务端通过Proxy回调事件。
- 获取子接口：客户端调用`GetPrimaryCalculator`获取ICalculator代理，再通过子接口Dispatcher调用`multiply`方法。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 需与客户端应用（ModularObjectExtensionDispatcherClient）配合使用。
2. ModularObjectExtensionAbility仅支持PC/2in1设备。
3. 本示例为Stage模型，支持API 26.0.0版本SDK。
4. 本示例需要使用DevEco Studio 26.0.0 Beta1及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Ability/ModularObjectExtensionDispatcherService/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
