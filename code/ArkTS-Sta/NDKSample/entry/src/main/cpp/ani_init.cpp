/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "ani/ani.h"
#include <array>
#include <iostream>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

struct AsyncData {
    ArkUI_NodeHandle parent = nullptr;
    ArkUI_NodeHandle child = nullptr;
};

static ani_int GetNodeHandleFromAniValueTest([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_object componentContextObj, ani_object rootSlot)
{
    ArkUI_NodeHandle handle = nullptr;
    OH_ArkUI_NativeModule_GetNodeHandleFromAniValue(env, componentContextObj, &handle);

    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, rootSlot, &contentHandle);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);

    nodeAPI->addChild(column, handle);
    return 0;
}

static ani_int GetContextFromAniValueTest([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_object contextObj, ani_object rootSlot)
{
    ArkUI_ContextHandle context = nullptr;
    OH_ArkUI_NativeModule_GetContextFromAniValue(env, contextObj, &context);

    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, rootSlot, &contentHandle);
    
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    
    OH_ArkUI_RunTaskInScope(context, column, [](void* userData) {
        auto column = static_cast<ArkUI_NodeHandle>(userData);
        ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto child = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content_item = {};
        std::string text = "test Context";
        content_item.string = text.c_str();
        nodeAPI->setAttribute(child, NODE_TEXT_CONTENT, &content_item);
        nodeAPI->addChild(column, child);
    });
    return 0;
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return ANI_ERROR;
    }

    ani_class cls {};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return ANI_ERROR;
    }
    
    std::array methods = {
        ani_native_function {"GetNodeHandleFromAniValueTest",
            nullptr, reinterpret_cast<void *>(GetNodeHandleFromAniValueTest)},
        ani_native_function {"GetContextFromAniValueTest",
            nullptr, reinterpret_cast<void *>(GetContextFromAniValueTest)},
    };

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return ANI_ERROR;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "Lentry/src/main/ets/pages/Index/NativeKit;");
    *result = ANI_VERSION_1;
    return ANI_OK;
}