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

// [Start injectTouchEvent]
#include "napi/native_api.h"
#include "window_manager/oh_window.h"
#include "multimodalinput/oh_input_manager.h"

const int32_t ARGS_TWO = 2;
const int32_t ARGS_THREE = 3;
const int32_t ARGS_FOUR = 4;
const int32_t ARGS_FIVE = 5;
const int32_t ARGS_SIX = 6;
const int32_t ARGS_SEVEN = 7;
const int32_t ARGS_EIGHT = 8;
const int32_t ARGS_NINE = 9;
const int32_t ARGS_TEN = 10;

static napi_value injectEvent(napi_env env, napi_callback_info info)
{
    size_t argc = ARGS_TEN;
    napi_value args[ARGS_TEN] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    int32_t displayId;
    napi_get_value_int32(env, args[1], &displayId);

    int32_t windowX;
    napi_get_value_int32(env, args[ARGS_TWO], &windowX);

    int32_t windowY;
    napi_get_value_int32(env, args[ARGS_THREE], &windowY);

    int32_t action;
    napi_get_value_int32(env, args[ARGS_FOUR], &action);

    int32_t fingerId;
    napi_get_value_int32(env, args[ARGS_FIVE], &fingerId);

    int32_t displayX;
    napi_get_value_int32(env, args[ARGS_SIX], &displayX);

    int32_t displayY;
    napi_get_value_int32(env, args[ARGS_SEVEN], &displayY);

    int32_t actionTime;
    napi_get_value_int32(env, args[ARGS_EIGHT], &actionTime);

    int32_t TE_WindowId;
    napi_get_value_int32(env, args[ARGS_NINE], &TE_WindowId);
    
    // 构造多模事件touchEvent
    Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, action);
    OH_Input_SetTouchEventFingerId(touchEvent, fingerId);
    OH_Input_SetTouchEventDisplayX(touchEvent, displayX);
    OH_Input_SetTouchEventDisplayY(touchEvent, displayY);
    OH_Input_SetTouchEventActionTime(touchEvent, actionTime);
    OH_Input_SetTouchEventWindowId(touchEvent, TE_WindowId);
    OH_Input_SetTouchEventDisplayId(touchEvent, displayId);

    // 向windowId对应的窗口注入多模触摸事件
    auto res = OH_WindowManager_InjectTouchEvent(windowId, touchEvent, windowX, windowY);

    // 使用完touchEvent后销毁对象
    OH_Input_DestroyTouchEvent(&touchEvent);
    
    napi_value errCode;
    napi_create_int32(env, res, &errCode);
    return errCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"injectEvent", nullptr, injectEvent, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
// [End injectTouchEvent]

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