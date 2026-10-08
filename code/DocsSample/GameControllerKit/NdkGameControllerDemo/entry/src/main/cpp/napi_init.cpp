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

#include <cstdint>
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
void CallJs(napi_env env, napi_value jsCallback, void *context, void *data)
{
    std::string *message = static_cast<std::string *>(data);
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
    napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1, nullptr, nullptr, nullptr, CallJs,
                                    &g_logTsfn);
    Log::GetInstance()->SetSink([](const std::string &message) {
        if (g_logTsfn == nullptr) {
            return;
        }
        std::string *data = new std::string(message);
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
int32_t InvokeMonitorApi(int32_t (*api)(), const std::string &name)
{
    int32_t code = api();
    std::string log = name;
    if (code == 0) {
        log.append(" Success");
    } else {
        log.append(" Failed, errorCode: ").append(std::to_string(code));
    }
    OH_LOG_INFO(LOG_APP, "%{public}s", log.c_str());
    Log::GetInstance()->PrintLog(log);
    return code;
}

/**
 * @brief Keeps the first error code. Returns the current error code if no error has occurred.
 */
int32_t TrackError(int32_t current, int32_t code)
{
    if (current == 0 && code != 0) {
        return code;
    }
    return current;
}

/**
 * @brief A monitor API together with its display name, used by the table-driven helpers.
 */
struct MonitorApiEntry {
    int32_t (*api)();
    const char *name;
};

/**
 * @brief Invokes the monitor APIs of the given table in sequence and keeps the first error
 * code. Every result is logged and a single failure does not stop the remaining calls.
 */
int32_t InvokeMonitorApis(const MonitorApiEntry *entries, size_t count)
{
    int32_t firstError = 0;
    for (size_t i = 0; i < count; ++i) {
        firstError = TrackError(firstError, InvokeMonitorApi(entries[i].api, entries[i].name));
    }
    return firstError;
}

/**
 * @brief Registers all event monitors in sequence: device monitor first, then button
 * monitors and axis monitors. Every result is logged and a single failure does not
 * stop the remaining registrations.
 */
napi_value RegisterAllEventMonitors(napi_env env, napi_callback_info /*info*/)
{
    static const MonitorApiEntry monitors[] = {
        // The device monitor must be registered before the pad monitors.
        {DeviceApi::RegisterDeviceMonitor, "RegisterDeviceMonitor"},
        // Button input monitors.
        {GamePad::LeftShoulderRegisterButtonInputMonitor, "LeftShoulder_RegisterButtonInputMonitor"},
        {GamePad::RightShoulderRegisterButtonInputMonitor, "RightShoulder_RegisterButtonInputMonitor"},
        {GamePad::LeftTriggerRegisterButtonInputMonitor, "LeftTrigger_RegisterButtonInputMonitor"},
        {GamePad::RightTriggerRegisterButtonInputMonitor, "RightTrigger_RegisterButtonInputMonitor"},
        {GamePad::ButtonMenuRegisterButtonInputMonitor, "ButtonMenu_RegisterButtonInputMonitor"},
        {GamePad::ButtonHomeRegisterButtonInputMonitor, "ButtonHome_RegisterButtonInputMonitor"},
        {GamePad::ButtonARegisterButtonInputMonitor, "ButtonA_RegisterButtonInputMonitor"},
        {GamePad::ButtonBRegisterButtonInputMonitor, "ButtonB_RegisterButtonInputMonitor"},
        {GamePad::ButtonCRegisterButtonInputMonitor, "ButtonC_RegisterButtonInputMonitor"},
        {GamePad::ButtonXRegisterButtonInputMonitor, "ButtonX_RegisterButtonInputMonitor"},
        {GamePad::ButtonYRegisterButtonInputMonitor, "ButtonY_RegisterButtonInputMonitor"},
        {GamePad::DpadLeftButtonRegisterButtonInputMonitor, "Dpad_LeftButton_RegisterButtonInputMonitor"},
        {GamePad::DpadRightButtonRegisterButtonInputMonitor, "Dpad_RightButton_RegisterButtonInputMonitor"},
        {GamePad::DpadUpButtonRegisterButtonInputMonitor, "Dpad_UpButton_RegisterButtonInputMonitor"},
        {GamePad::DpadDownButtonRegisterButtonInputMonitor, "Dpad_DownButton_RegisterButtonInputMonitor"},
        {GamePad::LeftThumbstickRegisterButtonInputMonitor, "LeftThumbstick_RegisterButtonInputMonitor"},
        {GamePad::RightThumbstickRegisterButtonInputMonitor, "RightThumbstick_RegisterButtonInputMonitor"},
        {GamePad::ButtonNonstandardRegisterButtonInputMonitor, "ButtonNonstandard_RegisterButtonInputMonitor"},
        // Axis input monitors.
        {GamePad::LeftTriggerRegisterAxisInputMonitor, "LeftTrigger_RegisterAxisInputMonitor"},
        {GamePad::RightTriggerRegisterAxisInputMonitor, "RightTrigger_RegisterAxisInputMonitor"},
        {GamePad::DpadRegisterAxisInputMonitor, "Dpad_RegisterAxisInputMonitor"},
        {GamePad::LeftThumbstickRegisterAxisInputMonitor, "LeftThumbstick_RegisterAxisInputMonitor"},
        {GamePad::RightThumbstickRegisterAxisInputMonitor, "RightThumbstick_RegisterAxisInputMonitor"},
    };
    int32_t firstError = InvokeMonitorApis(monitors, sizeof(monitors) / sizeof(monitors[0]));
    napi_value result;
    napi_create_double(env, firstError, &result);
    return result;
}

/**
 * @brief Unregisters all event monitors in the reverse order of registration: axis
 * monitors, then button monitors, and the device monitor at last.
 */
napi_value UnregisterAllEventMonitors(napi_env env, napi_callback_info /*info*/)
{
    static const MonitorApiEntry monitors[] = {
        // Axis input monitors.
        {GamePad::LeftTriggerUnregisterAxisInputMonitor, "LeftTrigger_UnregisterAxisInputMonitor"},
        {GamePad::RightTriggerUnregisterAxisInputMonitor, "RightTrigger_UnregisterAxisInputMonitor"},
        {GamePad::DpadUnregisterAxisInputMonitor, "Dpad_UnregisterAxisInputMonitor"},
        {GamePad::LeftThumbstickUnregisterAxisInputMonitor, "LeftThumbstick_UnregisterAxisInputMonitor"},
        {GamePad::RightThumbstickUnregisterAxisInputMonitor, "RightThumbstick_UnregisterAxisInputMonitor"},
        // Button input monitors.
        {GamePad::LeftShoulderUnregisterButtonInputMonitor, "LeftShoulder_UnregisterButtonInputMonitor"},
        {GamePad::RightShoulderUnregisterButtonInputMonitor, "RightShoulder_UnregisterButtonInputMonitor"},
        {GamePad::LeftTriggerUnregisterButtonInputMonitor, "LeftTrigger_UnregisterButtonInputMonitor"},
        {GamePad::RightTriggerUnregisterButtonInputMonitor, "RightTrigger_UnregisterButtonInputMonitor"},
        {GamePad::ButtonMenuUnregisterButtonInputMonitor, "ButtonMenu_UnregisterButtonInputMonitor"},
        {GamePad::ButtonHomeUnregisterButtonInputMonitor, "ButtonHome_UnregisterButtonInputMonitor"},
        {GamePad::ButtonAUnregisterButtonInputMonitor, "ButtonA_UnregisterButtonInputMonitor"},
        {GamePad::ButtonBUnregisterButtonInputMonitor, "ButtonB_UnregisterButtonInputMonitor"},
        {GamePad::ButtonCUnregisterButtonInputMonitor, "ButtonC_UnregisterButtonInputMonitor"},
        {GamePad::ButtonXUnregisterButtonInputMonitor, "ButtonX_UnregisterButtonInputMonitor"},
        {GamePad::ButtonYUnregisterButtonInputMonitor, "ButtonY_UnregisterButtonInputMonitor"},
        {GamePad::DpadLeftButtonUnregisterButtonInputMonitor, "Dpad_LeftButton_UnregisterButtonInputMonitor"},
        {GamePad::DpadRightButtonUnregisterButtonInputMonitor, "Dpad_RightButton_UnregisterButtonInputMonitor"},
        {GamePad::DpadUpButtonUnregisterButtonInputMonitor, "Dpad_UpButton_UnregisterButtonInputMonitor"},
        {GamePad::DpadDownButtonUnregisterButtonInputMonitor, "Dpad_DownButton_UnregisterButtonInputMonitor"},
        {GamePad::LeftThumbstickUnregisterButtonInputMonitor, "LeftThumbstick_UnregisterButtonInputMonitor"},
        {GamePad::RightThumbstickUnregisterButtonInputMonitor, "RightThumbstick_UnregisterButtonInputMonitor"},
        {GamePad::ButtonNonstandardUnregisterButtonInputMonitor, "ButtonNonstandard_UnregisterButtonInputMonitor"},
        // The device monitor.
        {DeviceApi::UnregisterDeviceMonitor, "UnregisterDeviceMonitor"},
    };
    int32_t firstError = InvokeMonitorApis(monitors, sizeof(monitors) / sizeof(monitors[0]));
    napi_value result;
    napi_create_double(env, firstError, &result);
    return result;
}

/**
 * @brief Queries all online game devices and prints the results to the UI log page.
 */
napi_value QueryAllDeviceInfos(napi_env env, napi_callback_info /*info*/)
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
        {"onChange", nullptr, OnChange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerAllEventMonitors", nullptr, RegisterAllEventMonitors, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"unregisterAllEventMonitors", nullptr, UnregisterAllEventMonitors, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"queryAllDeviceInfos", nullptr, QueryAllDeviceInfos, nullptr, nullptr, nullptr, napi_default, nullptr},
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
