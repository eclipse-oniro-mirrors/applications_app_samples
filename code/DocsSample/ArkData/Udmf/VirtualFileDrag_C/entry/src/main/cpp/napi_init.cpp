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
#include "virtual_file_receiver.h"

#include <arkui/native_node_napi.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
#include <napi/native_api.h>
#include <vector>

namespace {
constexpr size_t CONFIG_ARGUMENT_COUNT = 2;
constexpr size_t NODE_ARGUMENT_COUNT = 2;
constexpr float AREA_GAP = 20.0F;
constexpr float DRAG_AREA_HEIGHT = 120.0F;
constexpr float FULL_WIDTH_PERCENT = 1.0F;
ArkUI_NativeNodeAPI_1* g_nodeApi = nullptr;
ArkUI_NodeContentHandle g_content = nullptr;
ArkUI_NodeHandle g_source = nullptr;
ArkUI_NodeHandle g_root = nullptr;
ArkUI_NodeHandle g_drop = nullptr;
ArkUI_NodeHandle g_spacer = nullptr;
napi_env g_env = nullptr;
napi_ref g_uriCallback = nullptr;
OH_UdmfData* g_dragData = nullptr;
bool g_directory = false;
bool g_compressed = false;

void UpdateSourceText()
{
    if (g_nodeApi == nullptr || g_source == nullptr) {
        return;
    }
    ArkUI_AttributeItem text {};
    text.string = g_directory ? "嵌套目录：长按拖出" :
        (g_compressed ? "解压文件：长按拖出" : "文档：长按拖出");
    g_nodeApi->setAttribute(g_source, NODE_TEXT_CONTENT, &text);
}

bool NotifyUris(const std::vector<std::string>& uris)
{
    if (g_env == nullptr || g_uriCallback == nullptr) {
        return false;
    }
    napi_handle_scope scope = nullptr;
    if (napi_open_handle_scope(g_env, &scope) != napi_ok) {
        return false;
    }
    napi_value callback = nullptr;
    napi_value array = nullptr;
    napi_value receiver = nullptr;
    napi_value result = nullptr;
    bool delivered = napi_get_reference_value(g_env, g_uriCallback, &callback) == napi_ok &&
        napi_create_array_with_length(g_env, uris.size(), &array) == napi_ok;
    for (size_t index = 0; delivered && index < uris.size(); ++index) {
        napi_value value = nullptr;
        delivered = napi_create_string_utf8(g_env, uris[index].c_str(), uris[index].size(), &value) == napi_ok &&
            napi_set_element(g_env, array, index, value) == napi_ok;
    }
    if (delivered) {
        napi_get_undefined(g_env, &receiver);
        // 将 URI 数组交给业务回调，读取、复制或打开由业务决定。
        delivered = napi_call_function(g_env, receiver, callback, 1, &array, &result) == napi_ok;
    }
    napi_close_handle_scope(g_env, scope);
    return delivered;
}

// [Start virtual_drag_c_drop_event]
void OnDrop(ArkUI_DragEvent* event)
{
    if (event == nullptr) {
        return;
    }
    std::vector<std::string> uris;
    const bool received = GetDroppedFileUris(event, uris);
    const bool delivered = NotifyUris(uris); // 将 URI 列表交给业务回调。
    OH_ArkUI_DragEvent_SetDragResult(event,
        received && delivered ? ARKUI_DRAG_RESULT_SUCCESSFUL : ARKUI_DRAG_RESULT_FAILED);
}
// [End virtual_drag_c_drop_event]

// [Start virtual_drag_c_start]
void OnNodeEvent(ArkUI_NodeEvent* event)
{
    if (event == nullptr) {
        return;
    }
    const auto type = OH_ArkUI_NodeEvent_GetEventType(event);
    if (type == NODE_ON_DROP) {
        OnDrop(OH_ArkUI_NodeEvent_GetDragEvent(event));
        return;
    }
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

void SetAreaLayout(ArkUI_NodeHandle node, uint32_t color)
{
    ArkUI_NumberValue width[] = {{.f32 = FULL_WIDTH_PERCENT}};
    ArkUI_AttributeItem widthItem {width, 1};
    g_nodeApi->setAttribute(node, NODE_WIDTH_PERCENT, &widthItem);
    ArkUI_NumberValue height[] = {{.f32 = DRAG_AREA_HEIGHT}};
    ArkUI_AttributeItem heightItem {height, 1};
    g_nodeApi->setAttribute(node, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue background[] = {{.u32 = color}};
    ArkUI_AttributeItem backgroundItem {background, 1};
    g_nodeApi->setAttribute(node, NODE_BACKGROUND_COLOR, &backgroundItem);
    ArkUI_NumberValue alignment[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem alignmentItem {alignment, 1};
    g_nodeApi->setAttribute(node, NODE_TEXT_ALIGN, &alignmentItem);
}

// [Start virtual_drag_c_drop_target]
void ConfigureDropTarget()
{
    ArkUI_AttributeItem text {};
    text.string = "拖入文件以获取 URI";
    g_nodeApi->setAttribute(g_drop, NODE_TEXT_CONTENT, &text);
    SetAreaLayout(g_drop, 0xFFDCF2DF);
    const char* types[] = {"general.file-uri"};
    OH_ArkUI_SetNodeAllowedDropDataTypes(g_drop, types, 1);
    g_nodeApi->registerNodeEvent(g_drop, NODE_ON_DROP, 1, nullptr);
    g_nodeApi->addNodeEventReceiver(g_drop, OnNodeEvent);
}
// [End virtual_drag_c_drop_target]

napi_value DestroyNativeNode(napi_env env, napi_callback_info info);

bool CreateDragNodes()
{
    g_root = g_nodeApi->createNode(ARKUI_NODE_COLUMN);
    g_source = g_nodeApi->createNode(ARKUI_NODE_TEXT);
    g_drop = g_nodeApi->createNode(ARKUI_NODE_TEXT);
    g_spacer = g_nodeApi->createNode(ARKUI_NODE_COLUMN);
    if (g_root == nullptr || g_source == nullptr || g_drop == nullptr || g_spacer == nullptr) {
        return false;
    }
    UpdateSourceText();
    SetAreaLayout(g_source, 0xFFD9E8FF);
    g_nodeApi->registerNodeEvent(g_source, NODE_ON_DRAG_START, 1, nullptr);
    g_nodeApi->registerNodeEvent(g_source, NODE_ON_DRAG_END, 1, nullptr);
    g_nodeApi->addNodeEventReceiver(g_source, OnNodeEvent);
    OH_ArkUI_SetNodeDraggable(g_source, true);
    ConfigureDropTarget();
    ArkUI_NumberValue gap[] = {{.f32 = AREA_GAP}};
    ArkUI_AttributeItem gapItem {gap, 1};
    g_nodeApi->setAttribute(g_spacer, NODE_HEIGHT, &gapItem);
    ArkUI_NumberValue width[] = {{.f32 = FULL_WIDTH_PERCENT}};
    ArkUI_AttributeItem widthItem {width, 1};
    g_nodeApi->setAttribute(g_root, NODE_WIDTH_PERCENT, &widthItem);
    g_nodeApi->addChild(g_root, g_source);
    g_nodeApi->addChild(g_root, g_spacer);
    g_nodeApi->addChild(g_root, g_drop);
    return OH_ArkUI_NodeContent_AddNode(g_content, g_root) == 0;
}

napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    if (g_root != nullptr) {
        return nullptr;
    }
    size_t count = NODE_ARGUMENT_COUNT;
    napi_value args[NODE_ARGUMENT_COUNT] {};
    napi_valuetype callbackType = napi_undefined;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != NODE_ARGUMENT_COUNT ||
        OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content) != 0 || g_content == nullptr ||
        napi_typeof(env, args[1], &callbackType) != napi_ok || callbackType != napi_function) {
        napi_throw_type_error(env, nullptr, "createNativeNode expects NodeContent and URI callback");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeApi);
    if (g_nodeApi == nullptr || napi_create_reference(env, args[1], 1, &g_uriCallback) != napi_ok) {
        napi_throw_error(env, nullptr, "Cannot initialize native drag nodes");
        return nullptr;
    }
    g_env = env;
    if (!CreateDragNodes()) {
        DestroyNativeNode(env, nullptr);
        napi_throw_error(env, nullptr, "Cannot create native drag nodes");
    }
    return nullptr;
}

napi_value Configure(napi_env env, napi_callback_info info)
{
    size_t count = CONFIG_ARGUMENT_COUNT;
    napi_value args[CONFIG_ARGUMENT_COUNT] {};
    bool directory = false;
    bool compressed = false;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != CONFIG_ARGUMENT_COUNT ||
        napi_get_value_bool(env, args[0], &directory) != napi_ok ||
        napi_get_value_bool(env, args[1], &compressed) != napi_ok) {
        napi_throw_type_error(env, nullptr, "configure expects two booleans");
        return nullptr;
    }
    g_directory = directory;
    g_compressed = compressed;
    UpdateSourceText();
    return nullptr;
}

napi_value DestroyNativeNode(napi_env env, napi_callback_info info)
{
    if (g_nodeApi != nullptr) {
        if (g_source != nullptr) {
            g_nodeApi->removeNodeEventReceiver(g_source, OnNodeEvent);
            g_nodeApi->unregisterNodeEvent(g_source, NODE_ON_DRAG_START);
            g_nodeApi->unregisterNodeEvent(g_source, NODE_ON_DRAG_END);
        }
        if (g_drop != nullptr) {
            g_nodeApi->removeNodeEventReceiver(g_drop, OnNodeEvent);
            g_nodeApi->unregisterNodeEvent(g_drop, NODE_ON_DROP);
        }
        for (auto node : {g_source, g_spacer, g_drop}) {
            if (node != nullptr) {
                if (g_root != nullptr) {
                    g_nodeApi->removeChild(g_root, node);
                }
                g_nodeApi->disposeNode(node);
            }
        }
        if (g_root != nullptr) {
            OH_ArkUI_NodeContent_RemoveNode(g_content, g_root);
            g_nodeApi->disposeNode(g_root);
        }
    }
    OH_UdmfData_Destroy(g_dragData);
    if (g_uriCallback != nullptr) {
        napi_delete_reference(env, g_uriCallback);
    }
    g_root = nullptr;
    g_source = nullptr;
    g_drop = nullptr;
    g_spacer = nullptr;
    g_content = nullptr;
    g_dragData = nullptr;
    g_uriCallback = nullptr;
    g_env = nullptr;
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
