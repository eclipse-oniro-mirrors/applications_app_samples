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

#include <string>
#include "device_api.h"
#include "game_controller_log.h"
#include "game_pad_api.h"
#include "hilog/log.h"
#include "napi/native_api.h"

namespace {
napi_threadsafe_function g_logTsfn = nullptr;

/**
 * @brief Runs on the JS thread. It converts the message to a JS string and
 * invokes the callback registered by the ArkTS side.
 */
void CallJs(napi_env env, napi_value jsCallback, void* context, void* data)
{
    std::string* message = static_cast<std::string*>(data);
    if (env != nullptr && jsCallback != nullptr && message != nullptr) {
        napi_value undefined = nullptr;
        napi_get_undefined(env, &undefined);
        napi_value value = nullptr;
        napi_create_string_utf8(env, message->c_str(), message->size(), &value);
        napi_call_function(env, undefined, jsCallback, 1, &value, nullptr);
    }
    delete message;
}

/**
 * @brief Registers the log callback of the ArkTS side. The callback receives
 * one string parameter and runs on the JS thread.
 */
napi_value OnChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "GameControllerDemoLog", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1, nullptr, nullptr, nullptr,
        CallJs, &g_logTsfn);
    Log::GetInstance()->SetSink([](const std::string& message) {
        if (g_logTsfn == nullptr) {
            return;
        }
        std::string* data = new std::string(message);
        napi_status status = napi_call_threadsafe_function(g_logTsfn, data, napi_tsfn_nonblocking);
        if (status != napi_ok) {
            delete data;
        }
    });
    return nullptr;
}

/**
 * @brief Invokes one monitor API, logs the result to the UI log page and returns the error code.
 */
double InvokeMonitorApi(napi_env env, napi_value (*api)(napi_env, napi_callback_info), napi_callback_info info,
    const std::string& name)
{
    napi_value result = api(env, info);
    double code = -1;
    napi_get_value_double(env, result, &code);
    std::string log = name;
    if (code == 0) {
        log.append(" Success");
    } else {
        log.append(" Failed, errorCode: ").append(std::to_string(static_cast<int>(code)));
    }
    OH_LOG_INFO(LOG_APP, "%{public}s", log.c_str());
    Log::GetInstance()->PrintLog(log);
    return code;
}

/**
 * @brief Keeps the first error code. Returns the current error code if no error has occurred.
 */
double TrackError(double current, double code)
{
    if (current == 0 && code != 0) {
        return code;
    }
    return current;
}

/**
 * @brief Registers all event monitors in sequence: device monitor first, then button
 * monitors and axis monitors. Every result is logged and a single failure does not
 * stop the remaining registrations.
 */
napi_value RegisterAllEventMonitors(napi_env env, napi_callback_info info)
{
    double firstError = 0;
    // The device monitor must be registered before the pad monitors.
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, DeviceApi::RegisterDeviceMonitor, info, "RegisterDeviceMonitor"));
    // Button input monitors.
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftShoulder_RegisterButtonInputMonitor,
        info, "LeftShoulder_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightShoulder_RegisterButtonInputMonitor,
        info, "RightShoulder_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftTrigger_RegisterButtonInputMonitor,
        info, "LeftTrigger_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightTrigger_RegisterButtonInputMonitor,
        info, "RightTrigger_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonMenu_RegisterButtonInputMonitor,
        info, "ButtonMenu_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonHome_RegisterButtonInputMonitor,
        info, "ButtonHome_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonA_RegisterButtonInputMonitor, info, "ButtonA_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonB_RegisterButtonInputMonitor, info, "ButtonB_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonC_RegisterButtonInputMonitor, info, "ButtonC_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonX_RegisterButtonInputMonitor, info, "ButtonX_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonY_RegisterButtonInputMonitor, info, "ButtonY_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_LeftButton_RegisterButtonInputMonitor,
        info, "Dpad_LeftButton_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_RightButton_RegisterButtonInputMonitor,
        info, "Dpad_RightButton_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_UpButton_RegisterButtonInputMonitor,
        info, "Dpad_UpButton_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_DownButton_RegisterButtonInputMonitor,
        info, "Dpad_DownButton_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftThumbstick_RegisterButtonInputMonitor,
        info, "LeftThumbstick_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightThumbstick_RegisterButtonInputMonitor,
        info, "RightThumbstick_RegisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonNonstandard_RegisterButtonInputMonitor,
        info, "ButtonNonstandard_RegisterButtonInputMonitor"));
    // Axis input monitors.
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftTrigger_RegisterAxisInputMonitor,
        info, "LeftTrigger_RegisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightTrigger_RegisterAxisInputMonitor,
        info, "RightTrigger_RegisterAxisInputMonitor"));
    firstError =
        TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_RegisterAxisInputMonitor, info,
        "Dpad_RegisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftThumbstick_RegisterAxisInputMonitor,
        info, "LeftThumbstick_RegisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightThumbstick_RegisterAxisInputMonitor,
        info, "RightThumbstick_RegisterAxisInputMonitor"));
    napi_value result;
    napi_create_double(env, firstError, &result);
    return result;
}

/**
 * @brief Unregisters all event monitors in the reverse order of registration: axis
 * monitors, then button monitors, and the device monitor at last.
 */
napi_value UnregisterAllEventMonitors(napi_env env, napi_callback_info info)
{
    double firstError = 0;
    // Axis input monitors.
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftTrigger_UnregisterAxisInputMonitor,
        info, "LeftTrigger_UnregisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightTrigger_UnregisterAxisInputMonitor,
        info, "RightTrigger_UnregisterAxisInputMonitor"));
    firstError =
        TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_UnregisterAxisInputMonitor, info,
        "Dpad_UnregisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftThumbstick_UnregisterAxisInputMonitor,
        info, "LeftThumbstick_UnregisterAxisInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightThumbstick_UnregisterAxisInputMonitor,
        info, "RightThumbstick_UnregisterAxisInputMonitor"));
    // Button input monitors.
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftShoulder_UnregisterButtonInputMonitor,
        info, "LeftShoulder_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightShoulder_UnregisterButtonInputMonitor,
        info, "RightShoulder_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftTrigger_UnregisterButtonInputMonitor,
        info, "LeftTrigger_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightTrigger_UnregisterButtonInputMonitor,
        info, "RightTrigger_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonMenu_UnregisterButtonInputMonitor,
        info, "ButtonMenu_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonHome_UnregisterButtonInputMonitor,
        info, "ButtonHome_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonA_UnregisterButtonInputMonitor,
        info, "ButtonA_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonB_UnregisterButtonInputMonitor,
        info, "ButtonB_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonC_UnregisterButtonInputMonitor,
        info, "ButtonC_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonX_UnregisterButtonInputMonitor,
        info, "ButtonX_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::ButtonY_UnregisterButtonInputMonitor,
        info, "ButtonY_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_LeftButton_UnregisterButtonInputMonitor,
        info, "Dpad_LeftButton_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_RightButton_UnregisterButtonInputMonitor,
        info, "Dpad_RightButton_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_UpButton_UnregisterButtonInputMonitor,
        info, "Dpad_UpButton_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::Dpad_DownButton_UnregisterButtonInputMonitor,
        info, "Dpad_DownButton_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::LeftThumbstick_UnregisterButtonInputMonitor,
        info, "LeftThumbstick_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError, InvokeMonitorApi(env, GamePad::RightThumbstick_UnregisterButtonInputMonitor,
        info, "RightThumbstick_UnregisterButtonInputMonitor"));
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, GamePad::ButtonNonstandard_UnregisterButtonInputMonitor, info,
        "ButtonNonstandard_UnregisterButtonInputMonitor"));
    // The device monitor.
    firstError = TrackError(firstError,
        InvokeMonitorApi(env, DeviceApi::UnregisterDeviceMonitor, info, "UnregisterDeviceMonitor"));
    napi_value result;
    napi_create_double(env, firstError, &result);
    return result;
}

/**
 * @brief Queries all online game devices and prints the results to the UI log page.
 */
napi_value QueryAllDeviceInfos(napi_env env, napi_callback_info info)
{
    napi_value result;
    GameController_ErrorCode errorCode = DeviceApi::DoQueryAllDeviceInfos();
    napi_create_double(env, errorCode, &result);
    return result;
}
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "onChange", nullptr, OnChange, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerAllEventMonitors", nullptr, RegisterAllEventMonitors, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "unregisterAllEventMonitors", nullptr, UnregisterAllEventMonitors, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "queryAllDeviceInfos", nullptr, QueryAllDeviceInfos, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
