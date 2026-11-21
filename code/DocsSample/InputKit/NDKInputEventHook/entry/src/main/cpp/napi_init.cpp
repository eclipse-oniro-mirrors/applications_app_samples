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
#include "napi/native_api.h"
#include "multimodalinput/oh_input_manager.h"

std::string g_value = "";
napi_ref g_callback_ref = nullptr;
napi_env g_env = nullptr;
OH_Input_EventHandler* g_handler = nullptr;

napi_value OnChange(napi_env env, napi_callback_info info)
{
    g_env = env;
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 保存 callback 引用
    napi_create_reference(env, args[0], 1, &g_callback_ref);
    return nullptr;
}

void NotifyValueChange(std::string value)
{
    g_value = value;
    if (g_callback_ref == nullptr || g_env == nullptr) {
        return;
    }

    napi_value callback;
    napi_get_reference_value(g_env, g_callback_ref, &callback);

    // callback的输入参数
    napi_value event;
    napi_create_object(g_env, &event);

    napi_value value_js;
    napi_create_string_utf8(g_env, g_value.c_str(), g_value.length(), &value_js);
    napi_set_named_property(g_env, event, "value", value_js);
    napi_value global;
    napi_get_global(g_env, &global);
    napi_call_function(g_env, global, callback, 1, &event, nullptr);
}

// [Start event_handler_create]
// 事件回调的完整实现见“处理输入事件”小节
const OH_Input_Event* OnEvent(OH_Input_EventHandler* handler, const OH_Input_Event* event);

// 定义handler被禁用的回调（例如事件回调处理超时被系统禁用）
void OnDisabled(OH_Input_EventHandler* handler)
{
    // handler已被禁用，输入事件恢复默认分发；如需继续处理，可重新调用OH_Input_EventHandler_Enable启用
    // [StartExclude event_handler_create]
    NotifyValueChange("Event handler disabled (callback timeout), input events resume default dispatch");
    // [EndExclude event_handler_create]
}

static napi_value CreateAndEnableHandler(napi_env env, napi_callback_info info)
{
    // 观测全部四类事件，可按需组合掩码
    OH_Input_EventTypeMask mask = OH_INPUT_EVENT_TYPE_MASK_KEY | OH_INPUT_EVENT_TYPE_MASK_MOUSE |
        OH_INPUT_EVENT_TYPE_MASK_TOUCH | OH_INPUT_EVENT_TYPE_MASK_AXIS;
    OH_Input_EventHandler* handler = nullptr;
    Input_Result ret = OH_Input_EventHandler_Create(mask, OnEvent, OnDisabled, &handler);
    // ...

    // 启用handler，启用后开始接收输入事件
    ret = OH_Input_EventHandler_Enable(handler, true);
    // ...

    // 查询handler是否启用
    bool enabled = false;
    ret = OH_Input_EventHandler_IsEnabled(handler, &enabled);
    // ...

    // 查询handler的事件类型掩码
    OH_Input_EventTypeMask maskOfHandler = 0;
    ret = OH_Input_EventHandler_GetMask(handler, &maskOfHandler);
    // ...
    // [StartExclude event_handler_create]
    g_handler = handler;
    std::string message = "";
    if (ret == INPUT_SUCCESS && enabled) {
        message = "Event handler enabled, observing key/mouse/touch/axis events";
    } else {
        message = "Create or enable event handler failed, return " + std::to_string(ret);
    }
    napi_value result;
    napi_create_string_utf8(env, message.c_str(), message.size(), &result);
    return result;
    // [EndExclude event_handler_create]
}
// [End event_handler_create]

// [Start event_handler_process]
// 按键事件处理：转换为Input_KeyEvent视图读取字段，返回true表示拦截，返回false表示再分发
static bool HandleKeyEvent(const OH_Input_Event* event)
{
    const Input_KeyEvent* keyEvent = nullptr;
    if (OH_Input_Event_AsKeyEvent(event, &keyEvent) == INPUT_SUCCESS && keyEvent != nullptr) {
        int32_t action = OH_Input_GetKeyEventAction(keyEvent);
        int32_t keyCode = OH_Input_GetKeyEventKeyCode(keyEvent);
        int64_t actionTime = OH_Input_GetKeyEventActionTime(keyEvent);
        // [StartExclude event_handler_process]
        NotifyValueChange("Key event: action=" + std::to_string(action) +
            " keyCode=" + std::to_string(keyCode) +
            " actionTime=" + std::to_string(actionTime));
        // [EndExclude event_handler_process]
        // 按业务规则决策：例如拦截某个按键的按下事件，其余再分发
        if (action == KEY_ACTION_DOWN && keyCode == KEYCODE_1) {
            return true; // 拦截该事件
        }
    }
    return false;
}

// 鼠标事件处理：转换为Input_MouseEvent视图读取字段，返回true表示拦截，返回false表示再分发
static bool HandleMouseEvent(const OH_Input_Event* event)
{
    const Input_MouseEvent* mouseEvent = nullptr;
    if (OH_Input_Event_AsMouseEvent(event, &mouseEvent) == INPUT_SUCCESS && mouseEvent != nullptr) {
        int32_t action = OH_Input_GetMouseEventAction(mouseEvent);
        int32_t displayX = OH_Input_GetMouseEventDisplayX(mouseEvent);
        int32_t displayY = OH_Input_GetMouseEventDisplayY(mouseEvent);
        int32_t button = OH_Input_GetMouseEventButton(mouseEvent);
        int64_t actionTime = OH_Input_GetMouseEventActionTime(mouseEvent);
        // ...
        // [StartExclude event_handler_process]
        NotifyValueChange("Mouse event: action=" + std::to_string(action) +
            " displayX=" + std::to_string(displayX) +
            " displayY=" + std::to_string(displayY) +
            " button=" + std::to_string(button) +
            " actionTime=" + std::to_string(actionTime));
        // [EndExclude event_handler_process]
    }
    return false;
}

// 触摸事件处理：转换为Input_TouchEvent视图读取字段，返回true表示拦截，返回false表示再分发
static bool HandleTouchEvent(const OH_Input_Event* event)
{
    const Input_TouchEvent* touchEvent = nullptr;
    if (OH_Input_Event_AsTouchEvent(event, &touchEvent) == INPUT_SUCCESS && touchEvent != nullptr) {
        int32_t action = OH_Input_GetTouchEventAction(touchEvent);
        int32_t fingerId = OH_Input_GetTouchEventFingerId(touchEvent);
        int32_t displayX = OH_Input_GetTouchEventDisplayX(touchEvent);
        int32_t displayY = OH_Input_GetTouchEventDisplayY(touchEvent);
        int64_t actionTime = OH_Input_GetTouchEventActionTime(touchEvent);
        // ...
        // [StartExclude event_handler_process]
        NotifyValueChange("Touch event: action=" + std::to_string(action) +
            " fingerId=" + std::to_string(fingerId) +
            " displayX=" + std::to_string(displayX) +
            " displayY=" + std::to_string(displayY) +
            " actionTime=" + std::to_string(actionTime));
        // [EndExclude event_handler_process]
    }
    return false;
}

// 轴事件处理：转换为Input_AxisEvent视图读取字段，返回true表示拦截，返回false表示再分发
static bool HandleAxisEvent(const OH_Input_Event* event)
{
    const Input_AxisEvent* axisEvent = nullptr;
    if (OH_Input_Event_AsAxisEvent(event, &axisEvent) == INPUT_SUCCESS && axisEvent != nullptr) {
        InputEvent_AxisAction action = AXIS_ACTION_CANCEL;
        InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_SCROLL;
        InputEvent_SourceType sourceType = SOURCE_TYPE_MOUSE;
        OH_Input_GetAxisEventAction(axisEvent, &action);
        OH_Input_GetAxisEventType(axisEvent, &axisEventType);
        OH_Input_GetAxisEventSourceType(axisEvent, &sourceType);
        if (axisEventType == AXIS_EVENT_TYPE_SCROLL) {
            double scrollValue = 0.0;
            OH_Input_GetAxisEventAxisValue(axisEvent, AXIS_TYPE_SCROLL_VERTICAL, &scrollValue);
            // ...
        }
        // ...
        // [StartExclude event_handler_process]
        NotifyValueChange("Axis event: action=" + std::to_string(action) +
            " axisEventType=" + std::to_string(axisEventType) +
            " sourceType=" + std::to_string(sourceType));
        // [EndExclude event_handler_process]
    }
    return false;
}

// 事件回调：先获取事件类型，再分发给对应类型的事件处理函数决策
const OH_Input_Event* OnEvent(OH_Input_EventHandler* handler, const OH_Input_Event* event)
{
    OH_Input_EventType type = OH_INPUT_EVENT_KEY;
    if (OH_Input_Event_GetType(event, &type) != INPUT_SUCCESS) {
        return event; // 获取事件类型失败时默认再分发，避免影响正常输入
    }
    bool intercepted = false; // 是否拦截当前事件
    switch (type) {
        case OH_INPUT_EVENT_KEY: // 按键事件
            intercepted = HandleKeyEvent(event);
            break;
        case OH_INPUT_EVENT_MOUSE: // 鼠标事件
            intercepted = HandleMouseEvent(event);
            break;
        case OH_INPUT_EVENT_TOUCH: // 触摸事件
            intercepted = HandleTouchEvent(event);
            break;
        case OH_INPUT_EVENT_AXIS: // 轴事件
            intercepted = HandleAxisEvent(event);
            break;
        default:
            break;
    }
    return intercepted ? nullptr : event; // 返回nullptr表示拦截，返回原事件表示再分发
}
// [End event_handler_process]

// [Start event_handler_destroy]
static napi_value DisableAndDestroyHandler(napi_env env, napi_callback_info info)
{
    // g_handler为“创建并启用输入事件handler”中创建的handler对象
    Input_Result ret = OH_Input_EventHandler_Enable(g_handler, false); // 禁用handler，事件恢复默认分发
    // ...
    OH_Input_EventHandler_Destroy(g_handler); // 销毁handler并释放资源
    // ...
    // [StartExclude event_handler_destroy]
    g_handler = nullptr;
    std::string message = "";
    if (ret == INPUT_SUCCESS) {
        message = "Event handler disabled and destroyed";
    } else {
        message = "Disable or destroy event handler failed, return " + std::to_string(ret);
    }
    napi_value result;
    napi_create_string_utf8(env, message.c_str(), message.size(), &result);
    return result;
    // [EndExclude event_handler_destroy]
}
// [End event_handler_destroy]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "onChange", nullptr, OnChange, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createAndEnableHandler", nullptr, CreateAndEnableHandler, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "disableAndDestroyHandler", nullptr, DisableAndDestroyHandler, nullptr, nullptr, nullptr,
            napi_default, nullptr },
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
