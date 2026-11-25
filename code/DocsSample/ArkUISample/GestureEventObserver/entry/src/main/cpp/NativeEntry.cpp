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
// NativeEntry.cpp

#include <arkui/native_node_napi.h>
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>
#include <hilog/log.h>
#include <napi/native_api.h>

#include "NativeEntry.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "GestureEventObserver"

namespace GestureEventObserver {

namespace {
uint32_t g_observerId = 0;
} // namespace

// [Start interaction_observer]
// 事件回调：json为借用对象，仅在本函数执行期间有效。
static void OnInteractionEvent(const OH_ArkUI_NativeModule_UIJsonWrapper* json, void* userData)
{
    const char* data = OH_ArkUI_NativeModule_UIJsonWrapperGetData(json);
    if (data == nullptr || OH_ArkUI_NativeModule_UIJsonWrapperGetSize(json) == 0) {
        return;
    }
    // 需要留存数据时必须在本回调内拷贝，例如：std::string payload(data, size);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "interaction event: %{public}s", data);
}

// 通过ArkUI_ContextHandle注册交互事件观察者（须在UI线程调用），感知全部9类交互事件。
void RegisterObserverCommand(ArkUI_ContextHandle uiContext)
{
    // 按需组合关注的事件类型，此处以全部事件为例。
    uint32_t eventMask =
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG |
        OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH;

    ArkUI_ErrorCode ret = OH_ArkUI_NativeModule_UIInfoCollectionRegisterInteractionObserver(
        uiContext, eventMask, &g_observerId, OnInteractionEvent, nullptr);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG,
            "register observer failed, error code: %{public}d", static_cast<int>(ret));
    }
}

// 注销交互事件观察者（须在UI线程调用）。
void UnregisterObserverCommand()
{
    OH_ArkUI_NativeModule_UIInfoCollectionUnregisterInteractionObserver(g_observerId);
    g_observerId = 0;
}
// [End interaction_observer]

// ArkTS侧调用入口：入参为UIContext。
napi_value RegisterObserver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        return nullptr;
    }
    ArkUI_ContextHandle uiContext = nullptr;
    OH_ArkUI_GetContextFromNapiValue(env, args[0], &uiContext);
    RegisterObserverCommand(uiContext);
    return nullptr;
}

// ArkTS侧调用入口：注销已注册的观察者。
napi_value UnregisterObserver(napi_env env, napi_callback_info info)
{
    UnregisterObserverCommand();
    return nullptr;
}

} // namespace GestureEventObserver
