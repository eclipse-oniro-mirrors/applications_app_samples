/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <AbilityKit/ability_runtime/ability_runtime_common.h>
#include <AbilityKit/ability_runtime/modular_object_dispatcher.h>
#include <AbilityKit/ability_runtime/modular_object_extension_manager.h>
#include <AbilityKit/ability_runtime/connect_options.h>
#include <IPCKit/ipc_cremote_object.h>
#include <cstdint>

#include "log_helper.h"
#include "test_event_callback_stub.h"

static OHIPCRemoteProxy *g_remoteProxy = NULL;
static int64_t g_connectionId = -1;

static OH_AbilityRuntime_ModObjDispatcherHandle g_ModObjDispatcher = NULL;

static OH_AbilityRuntime_ModObjDispatcher_TypeDescriptorHandle g_TypeDescriptor = NULL;

// 子接口 dispatcher，用于 GetPrimaryCalculator 返回的 ICalculator 代理
static OH_AbilityRuntime_ModObjDispatcherHandle g_CalcDispatcher = NULL;

// ITestEventCallback 回调桩的具体实现：校验 OnConnected/OnDisconnected 回调入参。
// 服务端注册回调后会回调：
//   OnConnected(1, "connected")       // code 1001, 入参 clientId=1, welcome="connected"
//   OnDisconnected("dis connected")   // code 1002, 入参 reason="dis connected"
class TestEventCallbackStubImpl : public OHOS::IPC::TestEventCallbackStub {
public:
    OHOS::IPC::ErrCode OnConnected(int32_t clientId, const std::string &welcome) override
    {
        bool ok = (clientId == 1) && (welcome == "connected");
        OH_LOG_INFO(LOG_APP, "OnConnected clientId=%{public}d welcome=%{public}s verify=%{public}d", clientId,
            welcome.c_str(), ok ? 1 : 0);
        return OH_IPC_SUCCESS;
    }

    OHOS::IPC::ErrCode OnDisconnected(const std::string &reason) override
    {
        bool ok = (reason == "dis connected");
        OH_LOG_INFO(LOG_APP, "OnDisconnected reason=%{public}s verify=%{public}d", reason.c_str(), ok ? 1 : 0);
        return OH_IPC_SUCCESS;
    }
};

// RegisterCallback 注册到服务端的 ITestEventCallback 回调桩实例
static TestEventCallbackStubImpl *g_callbackStub = nullptr;

static void OnConnectCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityBase_Element *element,
    OHIPCRemoteProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "OnConnectCallback");
    g_remoteProxy = proxy;
}

static void OnDisconnectCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityBase_Element *element)
{
    OH_LOG_INFO(LOG_APP, "OnDisconnectCallback");
    g_remoteProxy = NULL;
    OH_AbilityRuntime_ModObjDispatcher_Release(&g_ModObjDispatcher);
    OH_AbilityRuntime_TypeDescriptor_Release(&g_TypeDescriptor);
}

static void OnFailedCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityRuntime_ErrorCode code)
{
    OH_LOG_ERROR(LOG_APP, "OnFailedCallback, code: %{public}d", code);
}

static bool CheckApiErr(AbilityRuntime_ErrorCode err, const char *apiName)
{
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "%{public}s err:%{public}d", apiName, err);
        return false;
    }
    return true;
}

static bool CheckCallResult(AbilityRuntime_ErrorCode err, int32_t methodErrCode, const char *apiName)
{
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "%{public}s err:%{public}d", apiName, err);
        return false;
    }
    if (methodErrCode != 0) {
        OH_LOG_ERROR(LOG_APP, "%{public}s methodErrCode:%{public}d", apiName, methodErrCode);
        return false;
    }
    return true;
}

static napi_value TestConnect(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestConnect");
    // 创建Want
    AbilityBase_Element element = {.bundleName = "com.samples.modularobjectextensionservice",
                                   .moduleName = "entry",
                                   .abilityName = "SampleModularObjectExtAbility"};
    AbilityBase_Want *want = OH_AbilityBase_CreateWant(element);
    if (want == NULL) {
        OH_LOG_ERROR(LOG_APP, "CreateWant failed");
        return nullptr;
    }

    // 创建ConnectOptions并注册回调
    OH_AbilityRuntime_ConnectOptions *options = OH_AbilityRuntime_CreateConnectOptions();
    OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback(options, OnConnectCallback);
    OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback(options, OnDisconnectCallback);
    OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback(options, OnFailedCallback);

    // 发起连接
    int64_t connectionId = -1;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ConnectModularObjectExtensionAbility(want, options, &connectionId);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "ConnectModularObjectExtensionAbility err:%{public}d", err);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "ConnectModularObjectExtensionAbility id:%{public}ld", connectionId);
    // 保存连接ID,用于后续断开连接操作
    g_connectionId = connectionId;
    OH_AbilityBase_DestroyWant(want);
    return nullptr;
}

static napi_value TestDisconnect(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestDisconnect");
    if (g_connectionId == -1) {
        OH_LOG_ERROR(LOG_APP, "Not connected");
        return nullptr;
    }
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_DisconnectModularObjectExtensionAbility(g_connectionId);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "DisconnectModularObjectExtensionAbility err:%{public}d", err);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "DisconnectModularObjectExtensionAbility success");
    g_connectionId = -1;
    g_remoteProxy = NULL;
    // 连接断开后释放回调桩实例（析构会销毁其内部 OHIPCRemoteStub）
    if (g_callbackStub != nullptr) {
        delete g_callbackStub;
        g_callbackStub = nullptr;
    }
    return nullptr;
}

static napi_value TestCreateMainServiceInstance(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestCreateMainServiceInstance");
    if (g_remoteProxy == NULL) {
        OH_LOG_ERROR(LOG_APP, "Remote proxy is null, not connected");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_createMainServiceInstance]
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_ModObjDispatcher_CreateMainServiceInstance(g_remoteProxy, &g_ModObjDispatcher);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "CreateMainServiceInstance err:%{public}d", err);
        return nullptr;
    }
    // [End modular_object_extension_dispatcher_createMainServiceInstance]
    OH_LOG_INFO(LOG_APP, "CreateMainServiceInstance success");
    return nullptr;
}

static napi_value TestGetTypeDescriptor(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestGetTypeDescriptor");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_hasTypeDescriptor]
    uint32_t hasTypeDescriptor = 0;
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_ModObjDispatcher_HasTypeDescriptor(g_ModObjDispatcher, &hasTypeDescriptor);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR || hasTypeDescriptor == 0) {
        // 查询失败处理
        // 服务端未提供类型库元数据，不支持动态接口
        OH_LOG_ERROR(LOG_APP, "The type library metadata is not available from the remote service err:%{public}d",
            err);
        return nullptr;
    }
    // [End modular_object_extension_dispatcher_hasTypeDescriptor]

    // [Start modular_object_extension_dispatcher_getTypeDescriptor]
    err = OH_AbilityRuntime_ModObjDispatcher_GetTypeDescriptor(g_ModObjDispatcher, &g_TypeDescriptor);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "GetTypeDescriptor err:%{public}d", err);
        return nullptr;
    }
    // [End modular_object_extension_dispatcher_getTypeDescriptor]
    OH_LOG_INFO(LOG_APP, "GetTypeDescriptor success");
    return nullptr;
}

static napi_value TestGetBaseInfo(napi_env env, napi_callback_info info)
{
    if (g_TypeDescriptor == NULL) {
        OH_LOG_ERROR(LOG_APP, "typeDescriptor is null, not created");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "TestGetVersion");
    // [Start modular_object_extension_dispatcher_getVersion]
    char version[256];
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_TypeDescriptor_GetVersion(g_TypeDescriptor, version, sizeof(version));
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "GetVersion err:%{public}d", err);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "Version:%{public}s", version);
    // [End modular_object_extension_dispatcher_getVersion]

    // [Start modular_object_extension_dispatcher_getMainServiceInterfaceName]
    char mainServiceInterfaceName[256];
    err = OH_AbilityRuntime_TypeDescriptor_GetMainServiceInterfaceName(g_TypeDescriptor, mainServiceInterfaceName,
        sizeof(mainServiceInterfaceName));
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "GetMainServiceInterfaceName err:%{public}d", err);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "MainServiceInterfaceName:%{public}s", mainServiceInterfaceName);
    // [End modular_object_extension_dispatcher_getMainServiceInterfaceName]
    return nullptr;
}

static napi_value TestGetStruct(napi_env env, napi_callback_info info)
{
    if (g_TypeDescriptor == NULL) {
        OH_LOG_ERROR(LOG_APP, "typeDescriptor is null, not created");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "TestGetStruct");
    // [Start modular_object_extension_dispatcher_getStructName]
    uint32_t structCount = 0;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_TypeDescriptor_GetStructCount(g_TypeDescriptor, &structCount);
    if (!CheckApiErr(err, "GetStructCount")) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "StructCount:%{public}d", structCount);

    for (uint32_t structIndex = 0; structIndex < structCount; structIndex++) {
        char structName[256];
        err = OH_AbilityRuntime_TypeDescriptor_GetStructName(g_TypeDescriptor, structIndex, structName,
            sizeof(structName));
        if (!CheckApiErr(err, "GetStructName")) {
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "StructName:%{public}s", structName);
        // [StartExclude modular_object_extension_dispatcher_getStructName]
        // [Start modular_object_extension_dispatcher_getStructField]
        // 获取结构体的字段数量，逐个遍历字段名和字段类型
        uint32_t fieldCount = 0;
        err = OH_AbilityRuntime_TypeDescriptor_GetStructFieldCount(g_TypeDescriptor, structName, &fieldCount);
        if (!CheckApiErr(err, "GetStructFieldCount")) {
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "FieldCount:%{public}d", fieldCount);
        // 遍历每个字段，获取字段名和字段类型
        for (uint32_t fieldIndex = 0; fieldIndex < fieldCount; fieldIndex++) {
            char fieldName[256];
            err = OH_AbilityRuntime_TypeDescriptor_GetStructFieldName(g_TypeDescriptor, structName, fieldIndex,
                fieldName, sizeof(fieldName));
            if (!CheckApiErr(err, "GetStructFieldName")) {
                return nullptr;
            }
            OH_LOG_INFO(LOG_APP, "FieldName:%{public}s", fieldName);
            OH_AbilityRuntime_ModObjDispatcher_TypeInfo typeInfo = {
                .vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
            err = OH_AbilityRuntime_TypeDescriptor_GetStructFieldType(g_TypeDescriptor, structName, fieldName,
                &typeInfo);
            if (!CheckApiErr(err, "GetStructFieldType")) {
                return nullptr;
            }
            //...
            OH_AbilityRuntime_ModObjDispatcher_TypeInfoClear(&typeInfo);
        }
        // [End modular_object_extension_dispatcher_getStructField]
        // [EndExclude modular_object_extension_dispatcher_getStructName]
    }
    // [End modular_object_extension_dispatcher_getStructName]
    return nullptr;
}

static napi_value TestGetEnum(napi_env env, napi_callback_info info)
{
    if (g_TypeDescriptor == NULL) {
        OH_LOG_ERROR(LOG_APP, "typeDescriptor is null, not created");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "TestGetEnum");
    // [Start modular_object_extension_dispatcher_getEnumName]
    uint32_t enumCount = 0;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_TypeDescriptor_GetEnumCount(g_TypeDescriptor, &enumCount);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "GetEnumCount err:%{public}d", err);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "EnumCount:%{public}d", enumCount);

    for (uint32_t enumIndex = 0; enumIndex < enumCount; enumIndex++) {
        char enumName[256];
        err = OH_AbilityRuntime_TypeDescriptor_GetEnumName(g_TypeDescriptor, enumIndex, enumName, sizeof(enumName));
        if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_ERROR(LOG_APP, "GetEnumName err:%{public}d", err);
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "EnumName:%{public}s", enumName);

        // [StartExclude modular_object_extension_dispatcher_getEnumName]
        // [Start modular_object_extension_dispatcher_getEnumValue]
        // 遍历枚举的所有枚举值名称和对应的枚举值
        uint32_t valueCount = 0;
        err = OH_AbilityRuntime_TypeDescriptor_GetEnumValueCount(g_TypeDescriptor, enumName, &valueCount);
        if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_ERROR(LOG_APP, "GetEnumValueCount err:%{public}d", err);
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "valueCount:%{public}d", valueCount);
        for (uint32_t valueIndex = 0; valueIndex < valueCount; valueIndex++) {
            char valueName[256];
            err = OH_AbilityRuntime_TypeDescriptor_GetEnumValueName(g_TypeDescriptor, enumName, valueIndex, valueName,
                sizeof(valueName));
            if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
                OH_LOG_ERROR(LOG_APP, "GetEnumValueName err:%{public}d", err);
                return nullptr;
            }
            OH_LOG_INFO(LOG_APP, "ValueName:%{public}s", valueName);

            int32_t value = 0;
            err = OH_AbilityRuntime_TypeDescriptor_GetEnumValue(g_TypeDescriptor, enumName, valueName, &value);
            if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
                OH_LOG_ERROR(LOG_APP, "GetEnumValue err:%{public}d", err);
                return nullptr;
            }
            OH_LOG_INFO(LOG_APP, "value:%{public}d", value);
        }
        // [End modular_object_extension_dispatcher_getEnumValue]
        // [EndExclude modular_object_extension_dispatcher_getEnumName]
    }
    // [End modular_object_extension_dispatcher_getEnumName]
    return nullptr;
}

// [Start modular_object_extension_dispatcher_getMethodReturnType]
static void QueryMethodReturnType(const char *interfaceName, const char *methodName)
{
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo returnTypeInfo = {
        .vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_TypeDescriptor_GetMethodReturnType(g_TypeDescriptor, interfaceName, methodName,
            &returnTypeInfo);
    if (!CheckApiErr(err, "GetMethodReturnType")) {
        return;
    }
    //...
    OH_AbilityRuntime_ModObjDispatcher_TypeInfoClear(&returnTypeInfo);
}
// [End modular_object_extension_dispatcher_getMethodReturnType]

// [Start modular_object_extension_dispatcher_getMethodParam]
static void QueryMethodParamInfo(const char *interfaceName, const char *methodName)
{
    // 获取方法的参数数量，逐个遍历参数名和参数类型
    uint32_t paramCount = 0;
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_TypeDescriptor_GetMethodParamCount(g_TypeDescriptor, interfaceName, methodName,
            &paramCount);
    if (!CheckApiErr(err, "GetMethodParamCount")) {
        return;
    }
    OH_LOG_INFO(LOG_APP, "MethodParamCount:%{public}d", paramCount);

    // 遍历每个参数，获取参数名和参数类型
    for (uint32_t paramIndex = 0; paramIndex < paramCount; paramIndex++) {
        char methodParamName[256];
        err = OH_AbilityRuntime_TypeDescriptor_GetMethodParamName(
            g_TypeDescriptor, interfaceName, methodName, paramIndex, methodParamName, sizeof(methodParamName));
        if (!CheckApiErr(err, "GetMethodParamName")) {
            return;
        }
        OH_LOG_INFO(LOG_APP, "GetMethodParamName:%{public}s", methodParamName);

        OH_AbilityRuntime_ModObjDispatcher_TypeInfo paramTypeInfo = {
            .vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        err = OH_AbilityRuntime_TypeDescriptor_GetMethodParamType(g_TypeDescriptor, interfaceName, methodName,
            paramIndex, &paramTypeInfo);
        if (!CheckApiErr(err, "GetMethodParamType")) {
            return;
        }
        //...
        OH_AbilityRuntime_ModObjDispatcher_TypeInfoClear(&paramTypeInfo);
    }
}
// [End modular_object_extension_dispatcher_getMethodParam]

// [Start modular_object_extension_dispatcher_getMethod]
static void QueryMethodMetadata(const char *interfaceName)
{
    // 获取接口下的方法数量，逐个遍历方法名并解析对应的MemberID
    uint32_t methodCount = 0;
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_TypeDescriptor_GetMethodCount(g_TypeDescriptor, interfaceName, &methodCount);
    if (!CheckApiErr(err, "GetMethodCount")) {
        return;
    }
    OH_LOG_INFO(LOG_APP, "MethodCount:%{public}d", methodCount);
    // 遍历每个方法，获取方法名和MemberID
    for (uint32_t methodIndex = 0; methodIndex < methodCount; methodIndex++) {
        char methodName[256];
        err = OH_AbilityRuntime_TypeDescriptor_GetMethodName(g_TypeDescriptor, interfaceName, methodIndex,
            methodName, sizeof(methodName));
        if (!CheckApiErr(err, "GetMethodName")) {
            return;
        }
        OH_LOG_INFO(LOG_APP, "MethodName:%{public}s", methodName);

        uint32_t memId = 0;
        err = OH_AbilityRuntime_TypeDescriptor_GetMethodMemberId(g_TypeDescriptor, interfaceName, methodName,
            &memId);
        if (!CheckApiErr(err, "GetMethodMemberId")) {
            return;
        }
        OH_LOG_INFO(LOG_APP, "MethodMemberId:%{public}d", memId);

        // [StartExclude modular_object_extension_dispatcher_getMethod]
        QueryMethodReturnType(interfaceName, methodName);
        QueryMethodParamInfo(interfaceName, methodName);
        // [EndExclude modular_object_extension_dispatcher_getMethod]
    }
}
// [End modular_object_extension_dispatcher_getMethod]

static napi_value TestGetInterface(napi_env env, napi_callback_info info)
{
    if (g_TypeDescriptor == NULL) {
        OH_LOG_ERROR(LOG_APP, "typeDescriptor is null, not created");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "TestGetInterface");
    // [Start modular_object_extension_dispatcher_getInterface]
    uint32_t interfaceCount = 0;
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_TypeDescriptor_GetInterfaceCount(g_TypeDescriptor, &interfaceCount);
    if (!CheckApiErr(err, "GetInterfaceCount")) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "InterfaceCount:%{public}d", interfaceCount);

    for (uint32_t interfaceIndex = 0; interfaceIndex < interfaceCount; interfaceIndex++) {
        char interfaceName[256];
        err = OH_AbilityRuntime_TypeDescriptor_GetInterfaceName(g_TypeDescriptor, interfaceIndex, interfaceName,
            sizeof(interfaceName));
        if (!CheckApiErr(err, "GetInterfaceName")) {
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "InterfaceName:%{public}s", interfaceName);

        // [StartExclude modular_object_extension_dispatcher_getInterface]
        QueryMethodMetadata(interfaceName);
        // [EndExclude modular_object_extension_dispatcher_getInterface]
    }
    // [End modular_object_extension_dispatcher_getInterface]
    return nullptr;
}

static napi_value TestAdd(napi_env env, napi_callback_info info)
{
    // [Start modular_object_extension_dispatcher_callMethod]
    // 构造参数
    OH_AbilityRuntime_ModObjDispatcher_Variant params[2] = {
        {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32, .u.i32Val = 10},
        {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32, .u.i32Val = 20},
    };

    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = params, .cArgs = 2};

    // 调用方法，memberId 17 为 Add 方法对应的 MemberID，可通过 OH_AbilityRuntime_TypeDescriptor_GetMethodMemberId 获取
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 17;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID,
        &inputParams, &result, &methodErrCode);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        // 框架级错误：IPC通信失败、参数类型不匹配等
        OH_LOG_ERROR(LOG_APP, "add err:%{public}d", err);
        return nullptr;
    }
    if (methodErrCode != 0) {
        // 方法级错误：远端方法执行返回的业务错误码
        OH_LOG_ERROR(LOG_APP, "methodErrCode:%{public}d", methodErrCode);
        return nullptr;
    }
    // result.u.i32Val 为返回值（30）
    int32_t addResult = result.u.i32Val;
    OH_LOG_INFO(LOG_APP, "addResult :%{public}d", addResult);
    // 简单类型不需要清理
    // [End modular_object_extension_dispatcher_callMethod]

    return nullptr;
}

// TestType_Array：memberId 19，参数 matrix 为 array<array<i32,5>,5>，返回同类型二维数组
// [Start modular_object_extension_dispatcher_callTypeArray_build]
static OH_AbilityRuntime_ModObjDispatcher_ArrayHandle BuildMatrixArray(uint32_t arrSize)
{
    // 构造嵌套数组类型信息：内层 array<i32,size>，外层 array<inner,size>
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo elemType = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo innerType = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_ARRAY};
    innerType.u.arrayType.pElementType = &elemType;
    innerType.u.arrayType.size = arrSize;

    // 创建外层数组，逐行创建内层数组、填充元素后设入外层
    OH_AbilityRuntime_ModObjDispatcher_ArrayHandle matrixArray = NULL;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_ArrayCreate(&innerType, arrSize, &matrixArray);
    if (!CheckApiErr(err, "ArrayCreate outer")) {
        return NULL;
    }
    for (uint32_t i = 0; i < arrSize; i++) {
        OH_AbilityRuntime_ModObjDispatcher_ArrayHandle rowArray = NULL;
        err = OH_AbilityRuntime_ModObjDispatcher_ArrayCreate(&elemType, arrSize, &rowArray);
        if (!CheckApiErr(err, "ArrayCreate inner")) {
            OH_AbilityRuntime_ModObjDispatcher_ArrayRelease(&matrixArray);
            return NULL;
        }
        for (uint32_t j = 0; j < arrSize; j++) {
            // 填充内层数组元素
            OH_AbilityRuntime_ModObjDispatcher_Variant cell = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
            uint32_t multiply = 10;
            cell.u.i32Val = static_cast<int32_t>(i * multiply + j);
            OH_AbilityRuntime_ModObjDispatcher_ArraySet(rowArray, j, &cell);
        }
        // 将内层数组设入外层对应位置
        OH_AbilityRuntime_ModObjDispatcher_Variant rowVar = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_ARRAY};
        rowVar.u.parrayVal = rowArray;
        OH_AbilityRuntime_ModObjDispatcher_ArraySet(matrixArray, i, &rowVar);
        OH_AbilityRuntime_ModObjDispatcher_ArrayRelease(&rowArray);
    }
    return matrixArray;
}
// [End modular_object_extension_dispatcher_callTypeArray_build]

// [Start modular_object_extension_dispatcher_callTypeArray_parse]
static void ParseArrayResult(OH_AbilityRuntime_ModObjDispatcher_Variant *result)
{
    // 校验返回类型，嵌套遍历二维数组读取每个元素
    if (result->vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_ARRAY || result->u.parrayVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "TestType_Array result type unexpected");
        return;
    }
    // 逐行遍历，每行再逐列读取元素值
    uint32_t rowCount = 0;
    OH_AbilityRuntime_ModObjDispatcher_ArrayGetSize(result->u.parrayVal, &rowCount);
    for (uint32_t i = 0; i < rowCount; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant rowVar = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        OH_AbilityRuntime_ModObjDispatcher_ArrayGet(result->u.parrayVal, i, &rowVar);
        uint32_t colCount = 0;
        if (rowVar.u.parrayVal != NULL) {
            OH_AbilityRuntime_ModObjDispatcher_ArrayGetSize(rowVar.u.parrayVal, &colCount);
            for (uint32_t j = 0; j < colCount; j++) {
                OH_AbilityRuntime_ModObjDispatcher_Variant cell = {
                    .vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
                OH_AbilityRuntime_ModObjDispatcher_ArrayGet(rowVar.u.parrayVal, j, &cell);
                OH_LOG_INFO(LOG_APP, "array[%{public}u][%{public}u]=%{public}d", i, j, cell.u.i32Val);
            }
        }
        OH_AbilityRuntime_ModObjDispatcher_VariantClear(&rowVar);
    }
}
// [End modular_object_extension_dispatcher_callTypeArray_parse]

static napi_value TestTestTypeArray(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestTestTypeArray");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_callTypeArray]
    uint32_t arrSize = 5;
    OH_AbilityRuntime_ModObjDispatcher_ArrayHandle matrixArray = BuildMatrixArray(arrSize);
    if (matrixArray == NULL) {
        return nullptr;
    }
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_ARRAY};
    param.u.parrayVal = matrixArray;
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 19;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID,
        &inputParams, &result, &methodErrCode);
    OH_AbilityRuntime_ModObjDispatcher_ArrayRelease(&matrixArray);
    if (!CheckCallResult(err, methodErrCode, "TestType_Array")) {
        return nullptr;
    }
    ParseArrayResult(&result);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    // [End modular_object_extension_dispatcher_callTypeArray]
    return nullptr;
}

// TestType_Vector：memberId 21，参数为 vector<i32>，返回 vector<i32>
static napi_value TestTestTypeVector(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestTestTypeVector");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_callTypeVector]
    // 创建 vector<i32> 并添加元素
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo elemType = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    OH_AbilityRuntime_ModObjDispatcher_VectorHandle vec = NULL;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_VectorCreate(&elemType, &vec);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "VectorCreate err:%{public}d", err);
        return nullptr;
    }
    // 添加元素到向量
    int32_t arrSize = 5;
    for (int32_t i = 1; i <= arrSize; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant v = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
        v.u.i32Val = i;
        OH_AbilityRuntime_ModObjDispatcher_VectorAdd(vec, &v);
    }
    // 组装参数并调用方法
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_VECTOR};
    param.u.pvectorVal = vec;
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 21;
    err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID, &inputParams, &result,
        &methodErrCode);
    OH_AbilityRuntime_ModObjDispatcher_VectorRelease(&vec);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "TestType_Vector err:%{public}d", err);
        return nullptr;
    }
    if (methodErrCode != 0) {
        OH_LOG_ERROR(LOG_APP, "TestType_Vector methodErrCode:%{public}d", methodErrCode);
        return nullptr;
    }
    // 解析返回的 vector
    if (result.vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_VECTOR || result.u.pvectorVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "TestType_Vector result type unexpected");
        return nullptr;
    }
    uint32_t size = 0;
    OH_AbilityRuntime_ModObjDispatcher_VectorGetSize(result.u.pvectorVal, &size);
    for (uint32_t i = 0; i < size; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant v = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        OH_AbilityRuntime_ModObjDispatcher_VectorGet(result.u.pvectorVal, i, &v);
        OH_LOG_INFO(LOG_APP, "vector[%{public}u]=%{public}d", i, v.u.i32Val);
    }
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    // [End modular_object_extension_dispatcher_callTypeVector]
    return nullptr;
}

// TestType_Set：memberId 23，参数为 set<i32>，返回 set<i32>
static napi_value TestTestTypeSet(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestTestTypeSet");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_callTypeSet]
    // 创建 set<i32> 并添加元素
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo elemType = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    OH_AbilityRuntime_ModObjDispatcher_SetHandle set = NULL;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_SetCreate(&elemType, &set);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetCreate err:%{public}d", err);
        return nullptr;
    }
    // 添加元素到集合
    int32_t values[] = {11, 22, 33};
    for (int32_t v : values) {
        OH_AbilityRuntime_ModObjDispatcher_Variant item = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
        item.u.i32Val = v;
        OH_AbilityRuntime_ModObjDispatcher_SetAdd(set, &item);
    }
    // 组装参数并调用方法
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_SET};
    param.u.psetVal = set;
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 23;
    err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID, &inputParams, &result,
        &methodErrCode);
    OH_AbilityRuntime_ModObjDispatcher_SetRelease(&set);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "TestType_Set err:%{public}d", err);
        return nullptr;
    }
    if (methodErrCode != 0) {
        OH_LOG_ERROR(LOG_APP, "TestType_Set methodErrCode:%{public}d", methodErrCode);
        return nullptr;
    }
    // 解析返回的 set
    if (result.vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_SET || result.u.psetVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "TestType_Set result type unexpected");
        return nullptr;
    }
    uint32_t size = 0;
    OH_AbilityRuntime_ModObjDispatcher_SetGetSize(result.u.psetVal, &size);
    for (uint32_t i = 0; i < size; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant v = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        OH_AbilityRuntime_ModObjDispatcher_SetGetAt(result.u.psetVal, i, &v);
        OH_LOG_INFO(LOG_APP, "set[%{public}u]=%{public}d", i, v.u.i32Val);
    }
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    // [End modular_object_extension_dispatcher_callTypeSet]
    return nullptr;
}

// TestType_Map：memberId 25，参数为 map<String,i32>，返回 map<String,i32>
// [Start modular_object_extension_dispatcher_callTypeMap_fill]
static void FillMapEntries(OH_AbilityRuntime_ModObjDispatcher_MapHandle map)
{
    const char *keys[] = {"cn", "us", "jp"};
    int32_t values[] = {86, 1, 81};
    const int32_t length = sizeof(values) / sizeof(values[0]);
    for (int32_t i = 0; i < length; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant key = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_STRING};
        key.u.bstrVal = strdup(keys[i]);
        OH_AbilityRuntime_ModObjDispatcher_Variant val = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
        val.u.i32Val = values[i];
        OH_AbilityRuntime_ModObjDispatcher_MapPut(map, &key, &val);
        free(key.u.bstrVal);
    }
}
// [End modular_object_extension_dispatcher_callTypeMap_fill]

// [Start modular_object_extension_dispatcher_callTypeMap_parse]
static void ParseMapResult(OH_AbilityRuntime_ModObjDispatcher_Variant *result)
{
    if (result->vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_MAP || result->u.pmapVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "TestType_Map result type unexpected");
        return;
    }
    uint32_t size = 0;
    OH_AbilityRuntime_ModObjDispatcher_MapGetSize(result->u.pmapVal, &size);
    OH_LOG_INFO(LOG_APP, "result map size:%{public}u", size);
    for (uint32_t i = 0; i < size; i++) {
        OH_AbilityRuntime_ModObjDispatcher_Variant k = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        OH_AbilityRuntime_ModObjDispatcher_Variant v = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
        OH_AbilityRuntime_ModObjDispatcher_MapGetKeyAt(result->u.pmapVal, i, &k);
        OH_AbilityRuntime_ModObjDispatcher_MapGetValueAt(result->u.pmapVal, i, &v);
        OH_LOG_INFO(LOG_APP, "map[%{public}s]=%{public}d", (k.u.bstrVal != NULL) ? k.u.bstrVal : "(null)", v.u.i32Val);
        OH_AbilityRuntime_ModObjDispatcher_VariantClear(&k);
    }
}
// [End modular_object_extension_dispatcher_callTypeMap_parse]

static napi_value TestTestTypeMap(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestTestTypeMap");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_callTypeMap]
    // 创建 map<String,i32>，填充键值对后调用方法
    OH_AbilityRuntime_ModObjDispatcher_TypeInfo valType = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    OH_AbilityRuntime_ModObjDispatcher_MapHandle map = NULL;
    AbilityRuntime_ErrorCode err =
        OH_AbilityRuntime_ModObjDispatcher_MapCreate(OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_STRING, &valType, &map);
    if (!CheckApiErr(err, "MapCreate")) {
        return nullptr;
    }
    FillMapEntries(map);
    // 组装参数并调用方法
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_MAP};
    param.u.pmapVal = map;
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 25;
    err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID, &inputParams, &result,
        &methodErrCode);
    OH_AbilityRuntime_ModObjDispatcher_MapRelease(&map);
    if (!CheckCallResult(err, methodErrCode, "TestType_Map")) {
        return nullptr;
    }
    ParseMapResult(&result);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    // [End modular_object_extension_dispatcher_callTypeMap]
    return nullptr;
}

// TestType_Struct：memberId 29，入参为 Point a, i32 idx, i32 idy，返回 Point（出参 b 作为返回值）
// [Start modular_object_extension_dispatcher_callTypeStruct_create]
static OH_AbilityRuntime_ModObjDispatcher_StructHandle CreatePointStruct(int32_t x, int32_t y)
{
    OH_AbilityRuntime_ModObjDispatcher_StructHandle handle = NULL;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_StructCreate("Point", &handle);
    if (!CheckApiErr(err, "StructCreate")) {
        return NULL;
    }
    OH_AbilityRuntime_ModObjDispatcher_Variant vx = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    vx.u.i32Val = x;
    OH_AbilityRuntime_ModObjDispatcher_Variant vy = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    vy.u.i32Val = y;
    OH_AbilityRuntime_ModObjDispatcher_StructSetField(handle, "x", &vx);
    OH_AbilityRuntime_ModObjDispatcher_StructSetField(handle, "y", &vy);
    return handle;
}
// [End modular_object_extension_dispatcher_callTypeStruct_create]

// [Start modular_object_extension_dispatcher_callTypeStruct_parse]
static void ParseStructResult(OH_AbilityRuntime_ModObjDispatcher_Variant *result)
{
    if (result->vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_STRUCT || result->u.pstructVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "TestType_Struct result type unexpected, vt:%{public}d", result->vt);
        return;
    }
    OH_AbilityRuntime_ModObjDispatcher_Variant outX = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    OH_AbilityRuntime_ModObjDispatcher_Variant outY = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    OH_AbilityRuntime_ModObjDispatcher_StructGetField(result->u.pstructVal, "x", &outX);
    OH_AbilityRuntime_ModObjDispatcher_StructGetField(result->u.pstructVal, "y", &outY);
    OH_LOG_INFO(LOG_APP, "Point b: x=%{public}d, y=%{public}d", outX.u.i32Val, outY.u.i32Val);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&outX);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&outY);
}
// [End modular_object_extension_dispatcher_callTypeStruct_parse]

static napi_value TestTestTypeStruct(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestTestTypeStruct");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // [Start modular_object_extension_dispatcher_callTypeStruct]
    // 创建 Point 结构体入参，组装参数后调用方法
    OH_AbilityRuntime_ModObjDispatcher_StructHandle structA = CreatePointStruct(10, 20);
    if (structA == NULL) {
        return nullptr;
    }
    int32_t idx = 5;
    int32_t idy = 8;
    // 组装入参：结构体 a、idx、idy
    OH_AbilityRuntime_ModObjDispatcher_Variant params[3] = {
        {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_STRUCT, .u.pstructVal = structA},
        {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32, .u.i32Val = idx},
        {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32, .u.i32Val = idy},
    };

    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = params, .cArgs = 3};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 29;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID,
        &inputParams, &result, &methodErrCode);
    OH_AbilityRuntime_ModObjDispatcher_StructRelease(&structA);
    if (!CheckCallResult(err, methodErrCode, "TestType_Struct")) {
        return nullptr;
    }
    ParseStructResult(&result);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    // [End modular_object_extension_dispatcher_callTypeStruct]
    return nullptr;
}

// RegisterCallback：memberId 31，参数为 ITestEventCallback 回调桩，返回 void
// 直接复用从服务侧拷贝的 TestEventCallbackStub，回调派发与接口令牌校验由 stub 完成，
// 子类 TestEventCallbackStubImpl 负责校验 OnConnected/OnDisconnected 的入参。
static napi_value TestRegisterCallback(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestRegisterCallback");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    // 复用已存在的回调桩实例，避免重复注册导致内存泄漏
    if (g_callbackStub == nullptr) {
        g_callbackStub = new TestEventCallbackStubImpl();
    }
    if (g_callbackStub == nullptr) {
        OH_LOG_ERROR(LOG_APP, "TestEventCallbackStubImpl new failed");
        return nullptr;
    }
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_IPC_REMOTE_STUB};
    param.u.premoteStubVal = g_callbackStub->GetRemoteStub();
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 31;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_ModObjDispatcher, memID,
        &inputParams, &result, &methodErrCode);
    if (err != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "RegisterCallback err:%{public}d", err);
        return nullptr;
    }
    if (methodErrCode != 0) {
        OH_LOG_ERROR(LOG_APP, "RegisterCallback methodErrCode:%{public}d", methodErrCode);
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "RegisterCallback success");
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    return nullptr;
}

// GetPrimaryCalculator：memberId 33，参数为 userId(i32)，返回 ICalculator 接口代理
static void CallMultiply(int32_t a, int32_t b)
{
    OH_AbilityRuntime_ModObjDispatcher_Variant multParams[2];
    multParams[0].vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32;
    multParams[0].u.i32Val = a;
    multParams[1].vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32;
    multParams[1].u.i32Val = b;
    OH_AbilityRuntime_ModObjDispatcher_InputParams multInput = {.rgvarg = multParams, .cArgs = 2};
    OH_AbilityRuntime_ModObjDispatcher_Variant multResult = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t multMethodErr = 0;
    uint32_t memIDMultiply = 7;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(g_CalcDispatcher, memIDMultiply,
        &multInput, &multResult, &multMethodErr);
    if (!CheckCallResult(err, multMethodErr, "multiply")) {
        return;
    }
    OH_LOG_INFO(LOG_APP, "multiply result :%{public}d", multResult.u.i32Val);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&multResult);
}

static napi_value TestGetPrimaryCalculator(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestGetPrimaryCalculator");
    if (g_ModObjDispatcher == NULL) {
        OH_LOG_ERROR(LOG_APP, "dispatcher is null, not created");
        return nullptr;
    }
    OH_AbilityRuntime_ModObjDispatcher_Variant param = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_I32};
    int32_t userId = 1001;
    param.u.i32Val = userId;
    OH_AbilityRuntime_ModObjDispatcher_InputParams inputParams = {.rgvarg = &param, .cArgs = 1};
    OH_AbilityRuntime_ModObjDispatcher_Variant result = {.vt = OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_EMPTY};
    int32_t methodErrCode = 0;
    uint32_t memID = 33;
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_ModObjDispatcher_CallMethod(
        g_ModObjDispatcher, memID, &inputParams, &result, &methodErrCode);
    if (!CheckCallResult(err, methodErrCode, "GetPrimaryCalculator")) {
        return nullptr;
    }
    // 返回值为 ICalculator 接口代理
    if (result.vt != OH_ABILITY_RUNTIME_MOD_OBJ_DISPATCHER_VT_IPC_REMOTE_PROXY || result.u.premoteProxyVal == NULL) {
        OH_LOG_ERROR(LOG_APP, "GetPrimaryCalculator result type unexpected, vt:%{public}d", result.vt);
        OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
        return nullptr;
    }
    OHIPCRemoteProxy *calcProxy = result.u.premoteProxyVal;
    // 基于返回的代理创建子接口 dispatcher，用于调用 ICalculator 的方法
    if (g_CalcDispatcher != NULL) {
        OH_AbilityRuntime_ModObjDispatcher_Release(&g_CalcDispatcher);
    }
    err = OH_AbilityRuntime_ModObjDispatcher_CreateSubInstance(g_ModObjDispatcher, calcProxy, &g_CalcDispatcher);
    OH_AbilityRuntime_ModObjDispatcher_VariantClear(&result);
    if (!CheckApiErr(err, "CreateSubInstance")) {
        return nullptr;
    }
    // 调用 ICalculator::multiply（memberId 7），参数 a=6, b=7
    CallMultiply(6, 7);
    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testConnect", nullptr, TestConnect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testDisconnect", nullptr, TestDisconnect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCreateMainServiceInstance", nullptr, TestCreateMainServiceInstance, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testGetTypeDescriptor", nullptr, TestGetTypeDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetBaseInfo", nullptr, TestGetBaseInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetStruct", nullptr, TestGetStruct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetEnum", nullptr, TestGetEnum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetInterface", nullptr, TestGetInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAdd", nullptr, TestAdd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testTestTypeArray", nullptr, TestTestTypeArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testTestTypeVector", nullptr, TestTestTypeVector, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testTestTypeSet", nullptr, TestTestTypeSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testTestTypeMap", nullptr, TestTestTypeMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testTestTypeStruct", nullptr, TestTestTypeStruct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testRegisterCallback", nullptr, TestRegisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetPrimaryCalculator", nullptr, TestGetPrimaryCalculator, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
