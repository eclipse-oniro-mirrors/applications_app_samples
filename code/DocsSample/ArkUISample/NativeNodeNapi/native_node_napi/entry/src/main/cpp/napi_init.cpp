/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

#include <hilog/log.h>
#include "manager.h"

EXTERN_C_START
napi_property_descriptor desc[] = {
    {"createNativeNaviNode", nullptr, Manager::CreateNativeNaviNode, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"createNativeAccessibilityNode", nullptr, Manager::CreateNativeAccessibilityNode, nullptr, nullptr, nullptr,
        napi_default, nullptr},
    {"createNativeEmbeddedComponentNode", nullptr, Manager::CreateNativeEmbeddedComponentNode, nullptr, nullptr,
        nullptr, napi_default, nullptr},
    // 参考Navigation新增其他createNative方法和Context类
    {"createAnimationCenter", nullptr, createAnimationCenter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createAnimationOpacity", nullptr, createAnimationOpacity,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createAnimationTranslate", nullptr, createAnimationTranslate,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createAnimationFit", nullptr, createAnimationFit,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createAnimationGeometry", nullptr, createAnimationGeometry,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsScale", nullptr, createVisualEffectsScale,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsBlur", nullptr, createVisualEffectsBlur,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsShape", nullptr, createVisualEffectsShape,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsShadow", nullptr, createVisualEffectsShadow,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsSepia", nullptr, createVisualEffectsSepia,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsMask", nullptr, createVisualEffectsMask,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsCont", nullptr, createVisualEffectsCont,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsAngle", nullptr, createVisualEffectsAngle,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsStyle", nullptr, createVisualEffectsStyle,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"createVisualEffectsGroup", nullptr, createVisualEffectsGroup,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"destroyNativeRoot", nullptr, DestroyNativeRoot, nullptr, nullptr, nullptr, napi_default, nullptr},
    { "processDrawable", nullptr, Manager::ProcessDrawable, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "processDrawable2", nullptr, Manager::ProcessDrawable2, nullptr, nullptr, nullptr, napi_default, nullptr },
};

static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
