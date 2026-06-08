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

#include <array>
#include <hilog/log.h>

#include "ani/ani.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_node.h"
#include "NativeEntry.h"

#include "ContainerPickerCanLoopMaker.h"
#include "ContainerPickerEventsMaker.h"
#include "ContainerPickerIndexMaker.h"
#include "ContainerPickerIndicatorMaker.h"
#include "ContainerPickerMonthMaker.h"
#include "ContainerPickerRegionMaker.h"
#include "ContainerPickerTimeMaker.h"
#include "ContainerPickerTypesMaker.h"

constexpr size_t ARRAY_NATIVE_SIZE = 8;

static void createCanLoopNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerCanLoopMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createEventsNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerEventsMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createIndexNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerIndexMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createIndicatorNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerIndicatorMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createMonthNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerMonthMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createRegionNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerRegionMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createTimePickerNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerTimeMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static void createTypesNode([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    if (OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle) !=0) {
        OH_LOG_ERROR(LOG_APP, "GetNodeContentFromAniValue Error");
        return;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = ContainerPickerTypesMaker::CreateNativeNode();
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
}

static ani_status bindNativeMethods(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        OH_LOG_ERROR(LOG_APP, "Unsupported ANI_VERSION");
        return (ani_status)9;
    }

    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_ERROR(LOG_APP, "Not found '%{public}s'", clsName);
        return (ani_status)2;
    }

    std::array<ani_native_function, ARRAY_NATIVE_SIZE> methods = {{
        ani_native_function{"createCanLoopNode", nullptr, reinterpret_cast<void *>(createCanLoopNode)},
        ani_native_function{"createEventsNode", nullptr, reinterpret_cast<void *>(createEventsNode)},
        ani_native_function{"createIndexNode", nullptr, reinterpret_cast<void *>(createIndexNode)},
        ani_native_function{"createIndicatorNode", nullptr, reinterpret_cast<void *>(createIndicatorNode)},
        ani_native_function{"createMonthNode", nullptr, reinterpret_cast<void *>(createMonthNode)},
        ani_native_function{"createRegionNode", nullptr, reinterpret_cast<void *>(createRegionNode)},
        ani_native_function{"createTimePickerNode", nullptr, reinterpret_cast<void *>(createTimePickerNode)},
        ani_native_function{"createTypesNode", nullptr, reinterpret_cast<void *>(createTypesNode)},
    }};
    
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        OH_LOG_ERROR(LOG_APP, "Cannot bind native methods to '%{public}s'", clsName);
        return (ani_status)3;
    }
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    ani_status status = bindNativeMethods(vm, "entry.src.main.ets.pages.NativeClass.NativeClass");
    *result = ANI_VERSION_1;
    return status;
}
