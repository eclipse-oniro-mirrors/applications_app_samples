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

// entry/src/main/cpp/ani_init.cpp
#include "ani/ani.h"
#include "arkui/native_node_ani.h"
#include "NativeEntry.h"
#include "ImageExample.h"
#include <array>

static ani_int createNativeRoot([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_object content)
{
    ArkUI_NodeContentHandle contentHandle;
    int32_t ret = OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, content, &contentHandle);
    if (ret != 0) {
        return -1;
    }
    NativeModule::NativeEntry::GetInstance()->SetContentHandle(contentHandle);
    auto root = CreateImageExample();
    if (root == nullptr) {
        return -1;
    }
    NativeModule::NativeEntry::GetInstance()->SetRootNode(root);
    return 0;
}

static ani_int destroyNativeRoot([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    NativeModule::NativeEntry::GetInstance()->DisposeRootNode();
    return 0;
}

static ani_status bindNativeMethods(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        return (ani_status)9;
    }

    ani_class cls {};
    ani_status findStatus = env->FindClass(clsName, &cls);
    if (ANI_OK != findStatus) {
        return (ani_status)2;
    }

    std::array<ani_native_function, 2> methods = {{
        ani_native_function {"createNativeRoot", nullptr, reinterpret_cast<void *>(createNativeRoot)},
        ani_native_function {"destroyNativeRoot", nullptr, reinterpret_cast<void *>(destroyNativeRoot)},
    }};

    ani_status bindStatus = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    if (ANI_OK != bindStatus) {
        return (ani_status)3;
    }
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    ani_status status = bindNativeMethods(vm, "entry.src.main.ets.pages.Index.NativeClass");
    *result = ANI_VERSION_1;
    return ANI_OK;
}
