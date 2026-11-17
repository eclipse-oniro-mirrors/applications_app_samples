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

#include <arkui/native_node_napi.h>
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>
#include <hilog/log.h>
#include <memory>
#include <napi/native_api.h>

namespace {
constexpr unsigned int SAMPLE_DOMAIN = 0xFF00;
constexpr const char *SAMPLE_TAG = "Sample_UIAgentGetPageText";
using JsonOwner = std::unique_ptr<OH_ArkUI_NativeModule_UIJsonWrapper,
    decltype(&OH_ArkUI_NativeModule_UIJsonWrapperDestroy)>;

struct ContextCache {
    napi_ref uiContext = nullptr;
    ArkUI_ContextHandle handle = nullptr;
};

void FinalizeContextCache(napi_env env, void *data, void *)
{
    auto *cache = static_cast<ContextCache *>(data);
    if (cache->uiContext != nullptr) {
        napi_delete_reference(env, cache->uiContext);
    }
    // The public SDK exposes no destructor for ArkUI_ContextHandle. Do not delete an opaque SDK type.
    delete cache;
}

int32_t GetContext(napi_env env, napi_value value, ContextCache &cache, ArkUI_ContextHandle &context)
{
    if (cache.uiContext != nullptr) {
        napi_value previous = nullptr;
        bool same = false;
        if (napi_get_reference_value(env, cache.uiContext, &previous) == napi_ok && previous != nullptr &&
            napi_strict_equals(env, previous, value, &same) == napi_ok && same) {
            context = cache.handle;
            return ARKUI_ERROR_CODE_NO_ERROR;
        }
    }
    int32_t code = OH_ArkUI_GetContextFromNapiValue(env, value, &context);
    if (code != ARKUI_ERROR_CODE_NO_ERROR || context == nullptr) {
        return code != ARKUI_ERROR_CODE_NO_ERROR ? code : ARKUI_ERROR_CODE_UI_CONTEXT_INVALID;
    }
    napi_ref reference = nullptr;
    if (napi_create_reference(env, value, 0, &reference) != napi_ok) {
        return ARKUI_ERROR_CODE_INTERNAL_ERROR;
    }
    if (cache.uiContext != nullptr) {
        napi_delete_reference(env, cache.uiContext);
    }
    cache.uiContext = reference;
    cache.handle = context;
    return ARKUI_ERROR_CODE_NO_ERROR;
}

napi_value ThrowError(napi_env env, int32_t code, const char *message)
{
    napi_value text = nullptr;
    napi_value error = nullptr;
    napi_value errorCode = nullptr;
    if (napi_create_string_utf8(env, message, NAPI_AUTO_LENGTH, &text) != napi_ok ||
        napi_create_error(env, nullptr, text, &error) != napi_ok ||
        napi_create_int32(env, code, &errorCode) != napi_ok ||
        napi_set_named_property(env, error, "code", errorCode) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create the page-text error.");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, SAMPLE_DOMAIN, SAMPLE_TAG, "code=%{public}d: %{public}s", code, message);
    napi_throw(env, error);
    return nullptr;
}

// [Start ui_agent_get_page_text]
napi_value GetPageText(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, &data) != napi_ok || argc != 1 || data == nullptr) {
        return ThrowError(env, ARKUI_ERROR_CODE_PARAM_INVALID, "Pass the current page's UIContext.");
    }
    ArkUI_ContextHandle context = nullptr;
    int32_t code = GetContext(env, argv[0], *static_cast<ContextCache *>(data), context);
    if (code != ARKUI_ERROR_CODE_NO_ERROR || context == nullptr) {
        return ThrowError(env, code != ARKUI_ERROR_CODE_NO_ERROR ? code : ARKUI_ERROR_CODE_UI_CONTEXT_INVALID,
            "Cannot obtain the native UI context.");
    }

    // Call synchronously from an ArkUI event on the UI thread, never from a worker/async task.
    OH_ArkUI_NativeModule_UIJsonWrapper *pageText = nullptr;
    code = OH_ArkUI_NativeModule_UIAgentGetPageText(context, &pageText);
    JsonOwner ownedText(pageText, OH_ArkUI_NativeModule_UIJsonWrapperDestroy);
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        return ThrowError(env, code, "OH_ArkUI_NativeModule_UIAgentGetPageText failed.");
    }
    const char *jsonData = OH_ArkUI_NativeModule_UIJsonWrapperGetData(ownedText.get());
    if (jsonData == nullptr) {
        return ThrowError(env, ARKUI_ERROR_CODE_INTERNAL_ERROR, "The collected JSON is unavailable.");
    }
    uint32_t size = OH_ArkUI_NativeModule_UIJsonWrapperGetSize(ownedText.get());
    napi_value result = nullptr;
    // N-API copies the UTF-8 bytes before the owning wrapper is destroyed on function exit.
    if (napi_create_string_utf8(env, jsonData, size, &result) != napi_ok) {
        return ThrowError(env, ARKUI_ERROR_CODE_INTERNAL_ERROR, "Cannot copy the collected JSON to ArkTS.");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, SAMPLE_DOMAIN, SAMPLE_TAG, "Collection succeeded, bytes=%{public}u", size);
    return result;
}
// [End ui_agent_get_page_text]

napi_value Init(napi_env env, napi_value exports)
{
    auto cache = std::make_unique<ContextCache>();
    napi_value collect = nullptr;
    if (napi_create_function(env, "getPageText", NAPI_AUTO_LENGTH, GetPageText, cache.get(), &collect) != napi_ok ||
        napi_add_finalizer(env, collect, cache.get(), FinalizeContextCache, nullptr, nullptr) != napi_ok) {
        return nullptr;
    }
    cache.release(); // The exported function's finalizer owns the cache, scoped to this N-API environment.
    if (napi_set_named_property(env, exports, "getPageText", collect) != napi_ok) {
        return nullptr;
    }
    return exports;
}
} // namespace

static napi_module pageTextModule = {
    1, 0, nullptr, Init, "pagetext", nullptr, {nullptr}
};

extern "C" __attribute__((constructor)) void RegisterPageTextModule()
{
    napi_module_register(&pageTextModule);
}
