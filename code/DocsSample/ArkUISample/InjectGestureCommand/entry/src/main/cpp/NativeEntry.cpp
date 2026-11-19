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
// NativeEntry.cpp

#include <sstream>
#include <string>

#include <arkui/native_node_napi.h>
#include <arkui/ui_event_injection.h>
#include <arkui/ui_json_wrapper.h>
#include <napi/native_api.h>

#include "NativeEntry.h"

namespace NativeEntry {

namespace {
constexpr uint32_t INJECT_ARG_INDEX_CONTEXT = 0;
constexpr uint32_t INJECT_ARG_INDEX_X = 1;
constexpr uint32_t INJECT_ARG_INDEX_Y = 2;
constexpr size_t INJECT_ARG_COUNT = 3;
} // namespace

// 定义完成回调：命令执行完成后回调一次，result为执行结果。
static void OnInjectionResult(OH_ArkUI_NativeModule_UIEventInjection_ResultCode result, void* userData)
{
    int* finished = static_cast<int*>(userData);
    if (finished != nullptr) {
        *finished = 1;
    }
}

// 通过ArkUI_ContextHandle在指定坐标（相对窗口的物理像素）注入一次点击手势命令。
void InjectClickCommand(ArkUI_ContextHandle uiContext, double x, double y)
{
    // 构造命令JSON并创建命令对象。
    std::ostringstream oss;
    oss << R"({"schemaVersion":1,"cmd":{"type":"click","mode":"auto",)"
        << R"("action_info":{"coordinates":{"x1":)" << x << R"(,"y1":)" << y << R"(}}})";
    std::string json = oss.str();
    OH_ArkUI_NativeModule_UIJsonWrapper* command = nullptr;
    ArkUI_ErrorCode ret = OH_ArkUI_NativeModule_UIJsonWrapperCreate(
        json.c_str(), static_cast<uint32_t>(json.length()), &command);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR || command == nullptr) {
        return; // JSON不合法或内存分配失败。
    }

    // 注入命令。
    int finished = 0;
    ret = OH_ArkUI_NativeModule_UIEventInjectRelaxedInteraction(uiContext, command, OnInjectionResult, &finished);

    // JSON在接口返回前已被复制，返回后可立即销毁命令对象。
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        return; // 请求被拒绝，不会触发回调。
    }
}

// ArkTS侧调用入口：入参为UIContext、目标坐标x、目标坐标y（相对窗口的物理像素）。
napi_value InjectClick(napi_env env, napi_callback_info info)
{
    size_t argc = INJECT_ARG_COUNT;
    napi_value args[INJECT_ARG_COUNT] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    ArkUI_ContextHandle uiContext = nullptr;
    OH_ArkUI_GetContextFromNapiValue(env, args[INJECT_ARG_INDEX_CONTEXT], &uiContext);

    double x = 0.0;
    double y = 0.0;
    napi_get_value_double(env, args[INJECT_ARG_INDEX_X], &x);
    napi_get_value_double(env, args[INJECT_ARG_INDEX_Y], &y);

    InjectClickCommand(uiContext, x, y);
    return nullptr;
}

} // namespace NativeEntry