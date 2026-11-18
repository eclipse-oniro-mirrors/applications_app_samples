# ModularObjectExtensionDispatcher客户端

### 介绍

本示例展示了[ModularObjectDispatcher](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/capi-modular-object-dispatcher-h.md)客户端的开发方法：连接服务端ModularObjectExtensionAbility后，通过分发器在运行时动态查询接口元数据（接口、方法、参数、枚举、结构体），并通过MemberID动态调用远端方法，无需在编译期依赖服务端的接口定义。

主要演示：

1. 通过`OH_AbilityRuntime_ConnectModularObjectExtensionAbility`连接服务端。
2. 通过`OH_AbilityRuntime_ModObjDispatcher_CreateMainServiceInstance`创建分发器。
3. 通过TypeDescriptor查询接口、方法、枚举、结构体等元数据。
4. 通过`OH_AbilityRuntime_ModObjDispatcher_CallMethod`动态调用方法，支持int32、数组、向量、集合、映射、结构体等多种参数类型。

### 效果展示

不涉及。

### 工程目录

```
entry/src/main/
├── cpp/
│   ├── napi_init.cpp          // N-API模块注册，导出各测试函数
│   ├── log_helper.h           // 日志辅助宏
│   ├── CMakeLists.txt         // CMake构建配置
│   └── TaiHe/
│       ├── itest_event_callback.h        // ITestEventCallback接口定义
│       ├── test_event_callback_stub.h    // 回调桩声明
│       └── test_event_callback_stub.cpp  // 回调桩实现
├── ets/
│   └── pages/
│       └── Index.ets          // 主界面，提供各测试按钮
├── module.json5               // 模块配置
└── resources/
```

### 使用说明

界面提供以下按钮，按顺序操作：

1. **Connect**：连接服务端ModularObjectExtensionAbility。
2. **CreateMainServiceInstance**：基于连接获取的Proxy创建分发器实例。
3. **GetTypeDescriptor**：判断并获取类型描述符。
4. **GetBaseInfo**：查询类型库版本、主服务接口名称。
5. **GetStruct / GetEnum / GetInterface**：遍历结构体、枚举、接口及其方法元数据。
6. **Add**：动态调用Add方法。
7. **TestTypeArray / Vector / Set / Map / Struct**：传递复杂类型参数调用方法。
8. **RegisterCallback**：注册回调桩到服务端。
9. **GetPrimaryCalculator**：获取子接口代理并调用其方法。
10. **Disconnect**：断开连接。

### 具体实现

连接服务端、创建分发器、查询元数据和动态调用方法的功能接口封装在Native模块中，通过N-API导出供ArkTS调用，源码参考：[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)。

- 连接服务端：使用`OH_AbilityRuntime_ConnectModularObjectExtensionAbility`发起连接，通过`OnConnectCallback`获取`OHIPCRemoteProxy`。
- 创建分发器：使用`OH_AbilityRuntime_ModObjDispatcher_CreateMainServiceInstance`基于Proxy创建分发器实例。
- 判断并获取类型描述符：使用`OH_AbilityRuntime_ModObjDispatcher_HasTypeDescriptor`判断是否支持动态接口，再通过`OH_AbilityRuntime_ModObjDispatcher_GetTypeDescriptor`获取TypeDescriptor句柄。
- 查询元数据：通过TypeDescriptor系列接口查询版本号、主服务接口名称、接口/方法/结构体/枚举等信息，接口参考：[modular_object_dispatcher.h](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/capi-modular-object-dispatcher-h.md)。
- 动态调用方法：使用`OH_AbilityRuntime_ModObjDispatcher_CallMethod`通过MemberID发起调用，参数通过Variant封装，支持int32、数组、向量、集合、映射、结构体、IPC回调桩等类型。
- 注册回调：实现`TestEventCallbackStub`子类，通过`VT_IPC_REMOTE_STUB`类型Variant传递给服务端，源码参考：[test_event_callback_stub.cpp](entry/src/main/cpp/TaiHe/test_event_callback_stub.cpp)。
- 获取子接口：调用`GetPrimaryCalculator`返回IPC代理后，通过`OH_AbilityRuntime_ModObjDispatcher_CreateSubInstance`创建子接口分发器。

### 相关权限

不涉及。

### 依赖

本示例依赖服务端应用ModularObjectExtensionDispatcherService，需先安装并运行服务端应用。

### 约束与限制

1. 需与服务端应用（ModularObjectExtensionDispatcherService）配合使用，服务端需先安装到设备上。
2. ModularObjectExtensionAbility仅支持PC/2in1设备。
3. 本示例为Stage模型，支持API 26.0.0版本SDK。
4. 本示例需要使用DevEco Studio 26.0.0 Beta1及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Ability/ModularObjectExtensionDispatcherClient/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
