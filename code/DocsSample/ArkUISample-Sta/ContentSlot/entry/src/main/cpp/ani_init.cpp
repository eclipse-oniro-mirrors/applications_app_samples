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

#include "ani/ani.h"
#include <array>

#include "arkui/native_type.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_interface.h"
#include "hilog/log.h"
// ···
ArkUI_NativeNodeAPI_1 *nodeAPI;
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

struct UserData {
    ArkUI_NodeHandle component = nullptr;
};

// 在Native侧创建一个宽高为480vp*480vp、背景色为0xFFFF0000（红色）的Column组件。对于更详细的节点树创建方法，请参考ArkUI API文档的C API章节。
ArkUI_NodeHandle CreateNodeHandle() {
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item{value, 1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF0000;
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    return column;
}

// ArkTS侧createNativeNode方法在Native侧的具体实现
static void CreateNativeNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
                             ani_object nodeContent) {
    // ani相关处理空指针&数据越界等问题
    if ((env == nullptr) || (nodeContent == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample", "CreateNativeNode failed");
        return;
    }
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    ArkUI_NodeContentHandle nodeContentHandle = nullptr;

    // 将nodeContentHandle_指向ArkTS侧传入的nodeContent
    auto ret = OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, nodeContent, &nodeContentHandle);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample",
                     "CreateNativeNode get NodeContentHandle failed");
    }

    if (nodeAPI != nullptr) {
        if (nodeAPI->createNode != nullptr) {
            ArkUI_NodeHandle component;
            // 创建C侧组件
            component = CreateNodeHandle();
            // 将组件添加到nodeContent管理器中
            OH_ArkUI_NodeContent_AddNode(nodeContentHandle, component);
            // 创建自定义数据，存储C侧组件实例对象的指针
            auto *data = new UserData();
            data->component = component;
            // 将自定义数据保存在NodeContent中
            OH_ArkUI_NodeContent_SetUserData(nodeContentHandle, data);
            // ···
        }
    }
}

// ArkTS侧destroyNativeNode方法在Native侧的具体实现
static void DestroyNativeNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
                              ani_object nodeContent) {
    // ani相关处理空指针&数据越界等问题
    if ((env == nullptr) || (nodeContent == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample", "DestroyNativeNode failed");
        return;
    }
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    ArkUI_NodeContentHandle nodeContentHandle = nullptr;

    // 将nodeContentHandle_指向ArkTS侧传入的nodeContent
    auto ret = OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, nodeContent, &nodeContentHandle);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample",
                     "DestroyNativeNode get NodeContentHandle failed");
    }

    if (nodeAPI != nullptr && nodeAPI->disposeNode != nullptr) {
        void *data = OH_ArkUI_NodeContent_GetUserData(nodeContentHandle);
        if (data != nullptr) {
            auto *userData = reinterpret_cast<UserData *>(data);
            // 将组件从nodeContent管理器中移除
            OH_ArkUI_NodeContent_RemoveNode(nodeContentHandle, userData->component);
            // 销毁C侧组件实例对象的指针
            nodeAPI->disposeNode(userData->component);
            userData->component = nullptr;
            delete userData;
            userData = nullptr;
            OH_ArkUI_NodeContent_SetUserData(nodeContentHandle, nullptr);
            data = nullptr;
        }
    }
}

static ani_status bindCase(ani_vm *vm, const char *clsName) {
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample", "Unsupported ANI_VERSION_1");
        return ANI_INVALID_VERSION;
    }

    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample", "Not found %{public}s", clsName);
        return ANI_INVALID_ARGS;
    }

    const char *createNativeNodeSignature = "C{arkui.NodeContent.NodeContent}:";
    const char *destroyNativeNodeSignature = "C{arkui.NodeContent.NodeContent}:";
    std::array methods = {
        ani_native_function{"createNativeNode", createNativeNodeSignature, reinterpret_cast<void *>(CreateNativeNode)},
        ani_native_function{"destroyNativeNode", destroyNativeNodeSignature,
                            reinterpret_cast<void *>(DestroyNativeNode)},
    };

    if (ANI_OK != env->Class_BindStaticNativeMethods(cls, methods.data(), methods.size())) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample",
                     "Cannot bind native methods to %{public}s", clsName);
        return ANI_INVALID_TYPE;
    };
    return ANI_OK;
}


ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContentSlotSample", "entering libentry.so's ANI_Constructor");
    bindCase(vm, "entry.src.main.ets.pages.Index.NativeMethods");
    *result = ANI_VERSION_1;
    return ANI_OK;
}
