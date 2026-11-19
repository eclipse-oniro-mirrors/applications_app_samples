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

#include "napi/native_api.h"

#include "common/napi_object_parser.h"
#include "common/utils.h"
#include "content_embed/content_embed_proxy.h"

// [Start content_embed_client_receive_context]
napi_value ReceiveContext(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // 获取ArkTS传递的UIAbilityContext对象
    napi_value contextObj = argv[0];
    void* contextPtr = nullptr;
    napi_ref tmp = nullptr;
    // 创建强引用，引用计数+1，防止ArkTS垃圾回收把这个Context回收掉
    napi_create_reference(env, contextObj, 1, &tmp);
    // 把ArkTS对象解包为C++指针
    napi_status status = napi_unwrap(env, contextObj, &contextPtr);
    if (status != napi_ok || contextPtr == nullptr) {
        // 错误处理
        napi_throw_error(env, nullptr, "Failed to unwrap context");
        return nullptr;
    }
    // 记录contextPtr，后续使用
    // ...
    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        // [StartExclude content_embed_client_receive_context]
        {"queryAll", nullptr, content_embed::QueryAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"query", nullptr, content_embed::Query, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createByOEid", nullptr, content_embed::CreateByOEid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createFromLocal", nullptr, content_embed::CreateFromLocal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createDormant", nullptr, content_embed::CreateDormant, nullptr, nullptr, nullptr, napi_default, nullptr},
        // [EndExclude content_embed_client_receive_context]
        {"receiveContext", nullptr, ReceiveContext, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
// [End content_embed_client_receive_context]

static napi_module g_demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&g_demoModule);
}
