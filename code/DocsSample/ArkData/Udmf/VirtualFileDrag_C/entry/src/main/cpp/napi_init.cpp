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

#include "virtual_file_provider.h"

#include <arkui/native_node_napi.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
#include <napi/native_api.h>

namespace {
ArkUI_NativeNodeAPI_1* g_nodeApi = nullptr;
ArkUI_NodeContentHandle g_content = nullptr;
ArkUI_NodeHandle g_source = nullptr;
OH_UdmfData* g_dragData = nullptr;
bool g_directory = false;
bool g_compressed = false;

// [Start virtual_drag_c_start]
void OnNodeEvent(ArkUI_NodeEvent* event)
{
    if (event == nullptr) {
        return;
    }
    const auto type = OH_ArkUI_NodeEvent_GetEventType(event);
    if (type == NODE_ON_DRAG_END) {
        OH_UdmfData_Destroy(g_dragData);
        g_dragData = nullptr;
        return;
    }
    if (type != NODE_ON_DRAG_START || g_dragData != nullptr) {
        return;
    }
    auto* drag = OH_ArkUI_NodeEvent_GetDragEvent(event);
    auto* data = CreateVirtualDragData(g_directory, g_compressed);
    if (drag == nullptr || data == nullptr) {
        OH_UdmfData_Destroy(data);
        return;
    }
    const int result = OH_ArkUI_DragEvent_SetData(drag, data);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xD004101, "VirtualFileDragC", "SetData result=%{public}d", result);
    // ArkUI 暂存此指针，必须保留到拖拽结束；随后会话中的回调引用由 UDMF 管理。
    if (result == 0) {
        g_dragData = data;
    } else {
        OH_UdmfData_Destroy(data);
    }
}
// [End virtual_drag_c_start]

napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    if (g_source != nullptr) {
        return nullptr;
    }
    size_t count = 1;
    napi_value args[1] {};
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1 ||
        OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content) != 0 || g_content == nullptr) {
        napi_throw_type_error(env, nullptr, "createNativeNode expects NodeContent");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeApi);
    if (g_nodeApi == nullptr) {
        return nullptr;
    }
    g_source = g_nodeApi->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text {};
    text.string = "长按这里拖出文件（C API）";
    g_nodeApi->setAttribute(g_source, NODE_TEXT_CONTENT, &text);
    ArkUI_NumberValue width[] = {{.f32 = 320}};
    ArkUI_AttributeItem widthItem {width, 1};
    g_nodeApi->setAttribute(g_source, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue height[] = {{.f32 = 100}};
    ArkUI_AttributeItem heightItem {height, 1};
    g_nodeApi->setAttribute(g_source, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue color[] = {{.u32 = 0xFFD9E8FF}};
    ArkUI_AttributeItem background {color, 1};
    g_nodeApi->setAttribute(g_source, NODE_BACKGROUND_COLOR, &background);
    g_nodeApi->registerNodeEvent(g_source, NODE_ON_DRAG_START, 1, nullptr);
    g_nodeApi->registerNodeEvent(g_source, NODE_ON_DRAG_END, 1, nullptr);
    g_nodeApi->addNodeEventReceiver(g_source, OnNodeEvent);
    OH_ArkUI_SetNodeDraggable(g_source, true);
    OH_ArkUI_NodeContent_AddNode(g_content, g_source);
    return nullptr;
}

napi_value Configure(napi_env env, napi_callback_info info)
{
    size_t count = 2;
    napi_value args[2] {};
    bool directory = false;
    bool compressed = false;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 2 ||
        napi_get_value_bool(env, args[0], &directory) != napi_ok ||
        napi_get_value_bool(env, args[1], &compressed) != napi_ok) {
        napi_throw_type_error(env, nullptr, "configure expects two booleans");
        return nullptr;
    }
    g_directory = directory;
    g_compressed = compressed;
    return nullptr;
}

napi_value DestroyNativeNode(napi_env env, napi_callback_info info)
{
    if (g_source == nullptr || g_nodeApi == nullptr) {
        return nullptr;
    }
    g_nodeApi->removeNodeEventReceiver(g_source, OnNodeEvent);
    g_nodeApi->unregisterNodeEvent(g_source, NODE_ON_DRAG_START);
    g_nodeApi->unregisterNodeEvent(g_source, NODE_ON_DRAG_END);
    OH_UdmfData_Destroy(g_dragData);
    g_dragData = nullptr;
    OH_ArkUI_NodeContent_RemoveNode(g_content, g_source);
    g_nodeApi->disposeNode(g_source);
    g_source = nullptr;
    g_content = nullptr;
    return nullptr;
}

napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor methods[] = {
        {"createNativeNode", nullptr, CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyNativeNode", nullptr, DestroyNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"configure", nullptr, Configure, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(methods) / sizeof(methods[0]), methods);
    return exports;
}
} // namespace

static napi_module g_module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule()
{
    napi_module_register(&g_module);
}
