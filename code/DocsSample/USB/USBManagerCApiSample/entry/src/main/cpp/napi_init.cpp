/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "BasicServicesKit/ohusb_manager.h"

#include <chrono>
#include <condition_variable>
#include <cstdint>
#include <mutex>
#include <string>
#include <vector>

namespace {

std::mutex g_pipeMutex;
bool g_pipeConnected = false;
OH_UsbManager_UsbPipe g_pipe = {0, 0};

std::mutex g_deviceListMutex;
OH_UsbManager_UsbDevice *g_heldDevices = nullptr;
uint32_t g_heldDeviceCount = 0;

void FreeHeldListLocked(OH_UsbManager_UsbDevice *devices, uint32_t deviceCount)
{
    if (&OH_UsbManager_FreeUsbDeviceList == nullptr) {
        return;
    }
    OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
}

const char *GetErrorName(OH_UsbManager_ErrorCode code)
{
    switch (code) {
        case OH_USBMANAGER_SUCCESS:
            return "SUCCESS";
        case OH_USBMANAGER_ERROR_PERMISSION_DENIED:
            return "PERMISSION_DENIED";
        case OH_USBMANAGER_ERROR_SERVICE_EXCEPTION:
            return "SERVICE_EXCEPTION";
        case OH_USBMANAGER_ERROR_NO_DEVICE:
            return "NO_DEVICE";
        case OH_USBMANAGER_ERROR_NO_MEMORY:
            return "NO_MEMORY";
        case OH_USBMANAGER_ERROR_IO_ERROR:
            return "IO_ERROR";
        case OH_USBMANAGER_ERROR_INVALID_PARAMETER:
            return "INVALID_PARAMETER";
        default:
            return "UNKNOWN";
    }
}

void ThrowUsbError(napi_env env, const char *api, OH_UsbManager_ErrorCode code)
{
    std::string message = std::string(api) + " failed, code=" + std::to_string(static_cast<int32_t>(code)) +
        " (" + GetErrorName(code) + ")";
    napi_value codeValue = nullptr;
    napi_value messageValue = nullptr;
    napi_value error = nullptr;
    napi_create_string_utf8(env, std::to_string(static_cast<int32_t>(code)).c_str(), NAPI_AUTO_LENGTH, &codeValue);
    napi_create_string_utf8(env, message.c_str(), NAPI_AUTO_LENGTH, &messageValue);
    napi_create_error(env, codeValue, messageValue, &error);
    napi_throw(env, error);
}

napi_value CreateStringValue(napi_env env, const char *value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, (value != nullptr) ? value : "", NAPI_AUTO_LENGTH, &result);
    return result;
}

void SetNamedString(napi_env env, napi_value object, const char *key, const char *value)
{
    napi_set_named_property(env, object, key, CreateStringValue(env, value));
}

void SetNamedUint8(napi_env env, napi_value object, const char *key, uint8_t value)
{
    napi_value property = nullptr;
    napi_create_uint32(env, static_cast<uint32_t>(value), &property);
    napi_set_named_property(env, object, key, property);
}

void SetNamedUint16(napi_env env, napi_value object, const char *key, uint16_t value)
{
    napi_value property = nullptr;
    napi_create_uint32(env, static_cast<uint32_t>(value), &property);
    napi_set_named_property(env, object, key, property);
}

void SetNamedUint32(napi_env env, napi_value object, const char *key, uint32_t value)
{
    napi_value property = nullptr;
    napi_create_uint32(env, value, &property);
    napi_set_named_property(env, object, key, property);
}

void SetNamedBool(napi_env env, napi_value object, const char *key, bool value)
{
    napi_value property = nullptr;
    napi_get_boolean(env, value, &property);
    napi_set_named_property(env, object, key, property);
}

napi_value ConvertEndpoint(napi_env env, const OH_UsbManager_UsbEndpoint &endpoint)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedUint8(env, object, "address", endpoint.address);
    SetNamedUint8(env, object, "attributes", endpoint.attributes);
    SetNamedUint8(env, object, "interval", endpoint.interval);
    SetNamedUint16(env, object, "maxPacketSize", endpoint.maxPacketSize);
    SetNamedUint32(env, object, "direction", static_cast<uint32_t>(endpoint.direction));
    SetNamedUint8(env, object, "number", endpoint.number);
    SetNamedUint8(env, object, "type", endpoint.type);
    SetNamedUint8(env, object, "interfaceId", endpoint.interfaceId);
    return object;
}

napi_value ConvertInterface(napi_env env, const OH_UsbManager_UsbInterface &iface)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedUint8(env, object, "id", iface.id);
    SetNamedUint8(env, object, "protocol", iface.protocol);
    SetNamedUint8(env, object, "clazz", iface.clazz);
    SetNamedUint8(env, object, "subClass", iface.subClass);
    SetNamedUint8(env, object, "alternateSetting", iface.alternateSetting);
    SetNamedString(env, object, "name", iface.name);
    SetNamedUint32(env, object, "endpointCount", iface.endpointCount);
    napi_value endpoints = nullptr;
    napi_create_array_with_length(env, iface.endpointCount, &endpoints);
    if (iface.endpoints != nullptr) {
        for (uint32_t i = 0; i < iface.endpointCount; i++) {
            napi_set_element(env, endpoints, i, ConvertEndpoint(env, iface.endpoints[i]));
        }
    }
    napi_set_named_property(env, object, "endpoints", endpoints);
    return object;
}

napi_value ConvertConfig(napi_env env, const OH_UsbManager_UsbConfig &config)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedUint8(env, object, "id", config.id);
    SetNamedUint8(env, object, "attributes", config.attributes);
    SetNamedUint8(env, object, "maxPower", config.maxPower);
    SetNamedString(env, object, "name", config.name);
    SetNamedBool(env, object, "isRemoteWakeup", config.isRemoteWakeup);
    SetNamedBool(env, object, "isSelfPowered", config.isSelfPowered);
    SetNamedUint32(env, object, "interfaceCount", config.interfaceCount);
    napi_value interfaces = nullptr;
    napi_create_array_with_length(env, config.interfaceCount, &interfaces);
    if (config.interfaces != nullptr) {
        for (uint32_t i = 0; i < config.interfaceCount; i++) {
            napi_set_element(env, interfaces, i, ConvertInterface(env, config.interfaces[i]));
        }
    }
    napi_set_named_property(env, object, "interfaces", interfaces);
    return object;
}

napi_value ConvertDevice(napi_env env, const OH_UsbManager_UsbDevice &device)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedUint8(env, object, "busNum", device.busNum);
    SetNamedUint8(env, object, "devAddress", device.devAddress);
    SetNamedString(env, object, "name", device.name);
    SetNamedString(env, object, "manufacturerName", device.manufacturerName);
    SetNamedString(env, object, "productName", device.productName);
    SetNamedString(env, object, "version", device.version);
    SetNamedUint16(env, object, "vendorId", device.vendorId);
    SetNamedUint16(env, object, "productId", device.productId);
    SetNamedUint8(env, object, "clazz", device.clazz);
    SetNamedUint8(env, object, "subClass", device.subClass);
    SetNamedUint8(env, object, "protocol", device.protocol);
    SetNamedUint32(env, object, "configCount", device.configCount);
    napi_value configs = nullptr;
    napi_create_array_with_length(env, device.configCount, &configs);
    if (device.configs != nullptr) {
        for (uint32_t i = 0; i < device.configCount; i++) {
            napi_set_element(env, configs, i, ConvertConfig(env, device.configs[i]));
        }
    }
    napi_set_named_property(env, object, "configs", configs);
    return object;
}

napi_value GetDeviceList(napi_env env, napi_callback_info info)
{
    (void)info;
    // [Start CApiGetUsbDeviceList]
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    OH_UsbManager_ErrorCode code = OH_UsbManager_GetUsbDeviceList(&devices, &deviceCount);
    if (code != OH_USBMANAGER_SUCCESS) {
        ThrowUsbError(env, "OH_UsbManager_GetUsbDeviceList", code);
        return nullptr;
    }
    // [End CApiGetUsbDeviceList]
    napi_value array = nullptr;
    napi_create_array_with_length(env, deviceCount, &array);
    if (devices != nullptr) {
        for (uint32_t i = 0; i < deviceCount; i++) {
            napi_set_element(env, array, i, ConvertDevice(env, devices[i]));
        }
    }
    {
        std::lock_guard<std::mutex> lock(g_deviceListMutex);
        if (g_heldDevices != nullptr) {
            FreeHeldListLocked(g_heldDevices, g_heldDeviceCount);
        }
        g_heldDevices = devices;
        g_heldDeviceCount = deviceCount;
    }
    return array;
}

napi_value FreeDeviceList(napi_env env, napi_callback_info info)
{
    (void)info;
    // [Start CApiFreeUsbDeviceList]
    OH_UsbManager_UsbDevice *devices = nullptr;
    uint32_t deviceCount = 0;
    bool freed = false;
    {
        std::lock_guard<std::mutex> lock(g_deviceListMutex);
        devices = g_heldDevices;
        deviceCount = g_heldDeviceCount;
        if (devices != nullptr) {
            OH_UsbManager_FreeUsbDeviceList(devices, deviceCount);
            g_heldDevices = nullptr;
            g_heldDeviceCount = 0;
            freed = true;
        }
    }
    // [End CApiFreeUsbDeviceList]
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedBool(env, object, "freed", freed);
    SetNamedUint32(env, object, "deviceCount", deviceCount);
    return object;
}

bool GetDeviceNameArg(napi_env env, napi_callback_info info, std::string &deviceName)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "deviceName (string) is required");
        return false;
    }
    napi_valuetype type = napi_undefined;
    napi_typeof(env, args[0], &type);
    if (type != napi_string) {
        napi_throw_type_error(env, nullptr, "deviceName must be a string");
        return false;
    }
    size_t length = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &length);
    std::vector<char> buffer(length + 1, '\0');
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &length);
    deviceName.assign(buffer.data());
    return true;
}

napi_value HasPermission(napi_env env, napi_callback_info info)
{
    // [Start CApiHasPermission]
    std::string deviceName;
    if (!GetDeviceNameArg(env, info, deviceName)) {
        return nullptr;
    }
    bool result = false;
    OH_UsbManager_ErrorCode code = OH_UsbManager_HasPermission(deviceName.c_str(), &result);
    if (code != OH_USBMANAGER_SUCCESS) {
        ThrowUsbError(env, "OH_UsbManager_HasPermission", code);
        return nullptr;
    }
    // [End CApiHasPermission]
    napi_value value = nullptr;
    napi_get_boolean(env, result, &value);
    return value;
}

struct RequestPermissionContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::mutex mutex;
    std::condition_variable condition;
    bool completed = false;
    bool timedOut = false;
    OH_UsbManager_ErrorCode apiCode = OH_USBMANAGER_SUCCESS;
    OH_UsbManager_ErrorCode callbackCode = OH_USBMANAGER_SUCCESS;
    bool granted = false;
    std::string deviceName;
};

void OnPermissionCallback(OH_UsbManager_ErrorCode errorCode, bool result, void *userContext)
{
    // [Start CApiRequestPermissionCallBack]
    if (userContext == nullptr) {
        return;
    }
    RequestPermissionContext *context = static_cast<RequestPermissionContext *>(userContext);
    {
        std::lock_guard<std::mutex> lock(context->mutex);
        context->callbackCode = errorCode;
        context->granted = result;
        context->completed = true;
    }
    // [end CApiRequestPermissionCallBack]
    context->condition.notify_all();
}

void RejectDeferred(napi_env env, napi_deferred deferred, const std::string &code, const std::string &message)
{
    napi_value codeValue = nullptr;
    napi_value messageValue = nullptr;
    napi_value error = nullptr;
    napi_create_string_utf8(env, code.c_str(), NAPI_AUTO_LENGTH, &codeValue);
    napi_create_string_utf8(env, message.c_str(), NAPI_AUTO_LENGTH, &messageValue);
    napi_create_error(env, codeValue, messageValue, &error);
    napi_reject_deferred(env, deferred, error);
}

void RequestPermissionExecute(napi_env env, void *data)
{
    (void)env;
    // [Start CApiRequestPermission]
    RequestPermissionContext *context = static_cast<RequestPermissionContext *>(data);
    OH_UsbManager_ErrorCode code =
        OH_UsbManager_RequestPermission(context->deviceName.c_str(), OnPermissionCallback, context);
    std::unique_lock<std::mutex> lock(context->mutex);
    if (code != OH_USBMANAGER_SUCCESS) {
        context->apiCode = code;
        context->completed = true;
        return;
    }
    // [End CApiRequestPermission]
    if (!context->completed) {
        bool done = context->condition.wait_for(lock, std::chrono::seconds(180),
            [context] { return context->completed; });
        if (!done) {
            context->timedOut = true;
            context->completed = true;
        }
    }
}

void RequestPermissionComplete(napi_env env, napi_status status, void *data)
{
    (void)status;
    RequestPermissionContext *context = static_cast<RequestPermissionContext *>(data);
    if (context->timedOut) {
        RejectDeferred(env, context->deferred, "TIMEOUT",
            "OH_UsbManager_RequestPermission timed out after 180s");
    } else if (context->apiCode != OH_USBMANAGER_SUCCESS) {
        std::string message = std::string("OH_UsbManager_RequestPermission failed, code=") +
            std::to_string(static_cast<int32_t>(context->apiCode)) + " (" + GetErrorName(context->apiCode) + ")";
        RejectDeferred(env, context->deferred, std::to_string(static_cast<int32_t>(context->apiCode)), message);
    } else if (context->callbackCode != OH_USBMANAGER_SUCCESS) {
        std::string message = std::string("PermissionCallback reported error, code=") +
            std::to_string(static_cast<int32_t>(context->callbackCode)) + " (" +
            GetErrorName(context->callbackCode) + ")";
        RejectDeferred(env, context->deferred, std::to_string(static_cast<int32_t>(context->callbackCode)),
            message);
    } else {
        napi_value granted = nullptr;
        napi_get_boolean(env, context->granted, &granted);
        napi_resolve_deferred(env, context->deferred, granted);
    }
    napi_delete_async_work(env, context->work);
    delete context;
}

napi_value RequestPermission(napi_env env, napi_callback_info info)
{
    std::string deviceName;
    if (!GetDeviceNameArg(env, info, deviceName)) {
        return nullptr;
    }
    napi_value promise = nullptr;
    RequestPermissionContext *context = new RequestPermissionContext();
    context->deviceName = deviceName;
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "OH_UsbManager_RequestPermission", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_promise(env, &context->deferred, &promise);
    napi_create_async_work(env, nullptr, resourceName, RequestPermissionExecute, RequestPermissionComplete,
        context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

napi_value ConnectDevice(napi_env env, napi_callback_info info)
{
    constexpr size_t argCount = 2;
    size_t argc = argCount;
    napi_value args[argCount] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < argCount) {
        napi_throw_type_error(env, nullptr, "busNum and devAddress (number) are required");
        return nullptr;
    }
    // [Start CApiConnectDevice]
    uint32_t busNum = 0;
    uint32_t devAddress = 0;
    napi_get_value_uint32(env, args[0], &busNum);
    napi_get_value_uint32(env, args[1], &devAddress);

    OH_UsbManager_UsbDevice device = {0};
    device.busNum = static_cast<uint8_t>(busNum);
    device.devAddress = static_cast<uint8_t>(devAddress);
    OH_UsbManager_UsbPipe pipe = {0};
    OH_UsbManager_ErrorCode code = OH_UsbManager_ConnectDevice(&device, &pipe);
    if (code != OH_USBMANAGER_SUCCESS) {
        ThrowUsbError(env, "OH_UsbManager_ConnectDevice", code);
        return nullptr;
    }
    // [End CApiConnectDevice]
    {
        std::lock_guard<std::mutex> lock(g_pipeMutex);
        g_pipe = pipe;
        g_pipeConnected = true;
    }
    napi_value object = nullptr;
    napi_create_object(env, &object);
    SetNamedUint8(env, object, "busNum", pipe.busNum);
    SetNamedUint8(env, object, "devAddress", pipe.devAddress);
    return object;
}

napi_value GetFileDescriptor(napi_env env, napi_callback_info info)
{
    // [Start CApiGetFileDescriptor]
    (void)info;
    OH_UsbManager_UsbPipe pipe = {0};
    {
        std::lock_guard<std::mutex> lock(g_pipeMutex);
        if (!g_pipeConnected) {
            napi_throw_error(env, nullptr, "pipe is not open, call connectDevice first");
            return nullptr;
        }
        pipe = g_pipe;
    }
    int32_t fd = -1;
    OH_UsbManager_ErrorCode code = OH_UsbManager_GetFileDescriptor(&pipe, &fd);
    if (code != OH_USBMANAGER_SUCCESS) {
        ThrowUsbError(env, "OH_UsbManager_GetFileDescriptor", code);
        return nullptr;
    }
    // [End CApiGetFileDescriptor]
    napi_value value = nullptr;
    napi_create_int32(env, fd, &value);
    return value;
}

napi_value ClosePipe(napi_env env, napi_callback_info info)
{
    // [Start CApiClosePipe]
    (void)info;
    OH_UsbManager_UsbPipe pipe = {0};
    {
        std::lock_guard<std::mutex> lock(g_pipeMutex);
        if (!g_pipeConnected) {
            napi_throw_error(env, nullptr, "pipe is not open, call connectDevice first");
            return nullptr;
        }
        pipe = g_pipe;
    }
    OH_UsbManager_ErrorCode code = OH_UsbManager_ClosePipe(&pipe);
    if (code != OH_USBMANAGER_SUCCESS) {
        ThrowUsbError(env, "OH_UsbManager_ClosePipe", code);
        return nullptr;
    }
    // [End CApiClosePipe]
    {
        std::lock_guard<std::mutex> lock(g_pipeMutex);
        g_pipeConnected = false;
        g_pipe = {0};
    }
    napi_value value = nullptr;
    napi_get_boolean(env, true, &value);
    return value;
}

napi_value IsPipeConnected(napi_env env, napi_callback_info info)
{
    (void)info;
    std::lock_guard<std::mutex> lock(g_pipeMutex);
    napi_value value = nullptr;
    napi_get_boolean(env, g_pipeConnected, &value);
    return value;
}

} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getDeviceList", nullptr, GetDeviceList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freeDeviceList", nullptr, FreeDeviceList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasPermission", nullptr, HasPermission, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestPermission", nullptr, RequestPermission, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"connectDevice", nullptr, ConnectDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFileDescriptor", nullptr, GetFileDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closePipe", nullptr, ClosePipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isPipeConnected", nullptr, IsPipeConnected, nullptr, nullptr, nullptr, napi_default, nullptr},
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
