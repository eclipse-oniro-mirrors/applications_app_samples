/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start location_capi_include]
#include "napi/native_api.h"
#include "LocationKit/oh_location.h"
#include "LocationKit/oh_location_type.h"
#include "hilog/log.h"
#include <cstdlib>
#include <string>
// [End location_capi_include]
#include <cstdio>
#include <algorithm>
#include <iomanip>
#include <sstream>

// Threadsafe function used to pass each reported location to the ArkTS page
// as a JSON string, so that native results can be shown in the UI.
static napi_threadsafe_function g_tsfn = nullptr;

// Forward declaration of the sample-only callback registration interface.
static napi_value SetNativeCallback(napi_env env, napi_callback_info info);

// [Start location_capi_is_enabled]
std::string GetErrorMsgFromErrorCode(int errorCode)
{
    switch (errorCode) {
        case LOCATION_PERMISSION_DENIED:
            return "Permission verification failed. The application does not have the permission"
                " required to call the API.";
        case LOCATION_INVALID_PARAM:
            return "Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; "
                "2. Incorrect parameter types; 3. Parameter verification failed.";
        case LOCATION_NOT_SUPPORTED:
            return "Capability not supported. Failed to call this API due to limited device capabilities.";
        case LOCATION_SERVICE_UNAVAILABLE:
            return "The location service is unavailable.";
        case LOCATION_SWITCH_OFF:
            return "The location switch is off.";
        default:
            return "Unknown error. error code: " + std::to_string(errorCode);
    }
}

static napi_value OhLocationIsEnabled(napi_env env, napi_callback_info info)
{
    bool isEnabled = false;
    int resultCode = OH_Location_IsLocatingEnabled(&isEnabled);
    napi_value result = nullptr;
    if (resultCode != LOCATION_SUCCESS) {
        std::string errorMsg = GetErrorMsgFromErrorCode(resultCode);
        napi_throw_error(env, std::to_string(resultCode).c_str(), errorMsg.c_str());
        napi_get_undefined(env, &result);
        return result;
    }
    napi_get_boolean(env, isEnabled, &result);
    return result;
}
// [End location_capi_is_enabled]

// Called on the JS thread for every location report. `data` is a heap-allocated
// JSON string describing the location; it is freed after the call.
static void CallJsReportLocation(napi_env env, napi_value jsCallback, void *context, void *data)
{
    if (env != nullptr && jsCallback != nullptr && data != nullptr) {
        napi_value undefined = nullptr;
        napi_value jsData = nullptr;
        napi_get_undefined(env, &undefined);
        napi_create_string_utf8(env, (const char *)data, NAPI_AUTO_LENGTH, &jsData);
        napi_call_function(env, undefined, jsCallback, 1, &jsData, nullptr);
    }
    free(data);
}

// Fractional digits kept when serializing location fields to JSON.
constexpr int JSON_FLOAT_PRECISION = 6;

// Serialize the reported location into a JSON string for the ArkTS page.
static char *BuildLocationJson(const Location_BasicInfo *baseInfo, const char *additionalInfo)
{
    std::ostringstream oss;
    oss << std::fixed << std::setprecision(JSON_FLOAT_PRECISION)
        << "{\"latitude\":" << baseInfo->latitude
        << ",\"longitude\":" << baseInfo->longitude
        << ",\"altitude\":" << baseInfo->altitude
        << ",\"accuracy\":" << baseInfo->accuracy
        << ",\"speed\":" << baseInfo->speed
        << ",\"direction\":" << baseInfo->direction
        << ",\"timeSinceBoot\":" << (long long)baseInfo->timeSinceBoot
        << ",\"additionalInfo\":\"" << (additionalInfo == nullptr ? "" : additionalInfo) << "\"}";
    const std::string &text = oss.str();
    char *json = static_cast<char *>(malloc(text.size() + 1));
    if (json == nullptr) {
        return nullptr;
    }
    std::copy(text.begin(), text.end(), json);
    return json;
}

// [Start location_capi_locating]
// 定义一个请求参数
struct Location_RequestConfig *g_requestConfig = nullptr;
void *g_mydata = nullptr;

// 定义一个回调函数用来接收位置信息
void reportLocation(Location_Info* location, void* userData)
{
    Location_BasicInfo baseInfo = OH_LocationInfo_GetBasicInfo(location);
    char additionalInfo[1024] = "";
    Location_ResultCode result = OH_LocationInfo_GetAdditionalInfo(location, additionalInfo, sizeof(additionalInfo));
    if (g_mydata == userData) {
        OH_LOG_INFO(LOG_APP, "userData is g_mydata");
    }
    // [StartExclude location_capi_locating]
    OH_LOG_INFO(LOG_APP, "reportLocation: latitude=%{public}f, longitude=%{public}f",
        baseInfo.latitude, baseInfo.longitude);
    if (g_tsfn != nullptr) {
        char *json = BuildLocationJson(&baseInfo, additionalInfo);
        if (json != nullptr) {
            napi_call_threadsafe_function(g_tsfn, json, napi_tsfn_nonblocking);
        }
    }
    // [EndExclude location_capi_locating]
    return;
}

// 订阅位置信息
static napi_value OhLocationStartLocating(napi_env env, napi_callback_info info)
{
    if (g_requestConfig == nullptr) {
        g_requestConfig = OH_Location_CreateRequestConfig();
    }
    OH_LocationRequestConfig_SetUseScene(g_requestConfig, LOCATION_USE_SCENE_NAVIGATION);
    OH_LocationRequestConfig_SetInterval(g_requestConfig, 1);
    // g_mydata:用户自定义任意类型，触发reportLocation回调时会传回该字段，用于区分是否为携带mydata字段的位置请求回调
    g_mydata = static_cast<void *>(malloc(sizeof("g_mydata")));
    napi_value result = nullptr;
    if (g_mydata == nullptr) {
        int errCode = LOCATION_INVALID_PARAM;
        std::string errorMsg = GetErrorMsgFromErrorCode(errCode);
        napi_throw_error(env, std::to_string(errCode).c_str(), errorMsg.c_str());
        napi_get_undefined(env, &result);
        return result;
    }

    OH_LocationRequestConfig_SetCallback(g_requestConfig, reportLocation, g_mydata);
    int resultCode = OH_Location_StartLocating(g_requestConfig);
    if (resultCode != LOCATION_SUCCESS) {
        std::string errorMsg = GetErrorMsgFromErrorCode(resultCode);
        napi_throw_error(env, std::to_string(resultCode).c_str(), errorMsg.c_str());
        napi_get_undefined(env, &result);
        return result;
    }
    napi_create_int32(env, resultCode, &result);
    return result;
}

// 取消订阅位置信息， g_requestConfig要和订阅时传入的对象保持一致
static napi_value OhLocationStopLocating(napi_env env, napi_callback_info info)
{
    int32_t resultCode = OH_Location_StopLocating(g_requestConfig);
    if (g_requestConfig != nullptr) {
        OH_Location_DestroyRequestConfig(g_requestConfig);
        g_requestConfig = nullptr;
    }
    if (g_mydata != nullptr) {
        free(g_mydata);
        g_mydata = nullptr;
    }
    napi_value result = nullptr;
    if (resultCode != LOCATION_SUCCESS) {
        std::string errorMsg = GetErrorMsgFromErrorCode(resultCode);
        napi_throw_error(env, std::to_string(resultCode).c_str(), errorMsg.c_str());
        napi_get_undefined(env, &result);
        return result;
    }
    napi_create_int32(env, resultCode, &result);
    return result;
}
// [End location_capi_locating]

// 在Init函数中补充接口。
// [Start location_capi_interface]
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ohLocationIsEnabled", nullptr, OhLocationIsEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ohLocationStartLocating", nullptr, OhLocationStartLocating, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ohLocationStopLocating", nullptr, OhLocationStopLocating, nullptr, nullptr, nullptr, napi_default, nullptr},
        // [StartExclude location_capi_interface]
        {"setNativeCallback", nullptr, SetNativeCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        // [EndExclude location_capi_interface]
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
// [End location_capi_interface]

// Register an ArkTS callback for UI display. Sample-only bridge on top of the
// guideline interfaces.
static napi_value SetNativeCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_error(env, nullptr, "setNativeCallback requires one callback argument");
        return nullptr;
    }
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "locationReportCallback", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1,
        nullptr, nullptr, nullptr, CallJsReportLocation, &g_tsfn);
    return nullptr;
}

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
