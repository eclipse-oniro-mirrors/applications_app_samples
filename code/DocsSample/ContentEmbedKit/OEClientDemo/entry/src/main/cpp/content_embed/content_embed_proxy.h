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

// CEProxy: each native ContentEmbed_ExtensionProxy* wrapped as a NAPI JS object
// owned by ArkTS. Replaces the centralized ContentEmbedManager.

#ifndef OECLIENTDEMO_CONTENT_EMBED_PROXY_H
#define OECLIENTDEMO_CONTENT_EMBED_PROXY_H

#include <string>

#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#include "napi/native_api.h"

class ContentEmbedProxyWrapper {
public:
    ContentEmbed_ExtensionProxy* proxy_ = nullptr;   // null when dormant
    void* contextPtr_ = nullptr;                     // UIAbilityContext, stable for ability lifetime

    // metadata (survives dormancy)
    std::string name_;
    std::string path_;           // absolute sandbox .bin path (WriteDocumentToSandbox dest)
    std::string snapshotPath_;   // absolute sandbox .png path
    std::string snapshotUri_;    // "file://..." URI of snapshotPath_ (cached for getSnapshotUri)

    // snapshot (live only; null when dormant)
    OH_PixelmapNative* snapShot_ = nullptr;

    // ArkTS callbacks (preserved across dormancy so reactivation keeps them)
    napi_threadsafe_function onUpdateFunc_ = nullptr;
    napi_ref onUpdateRef_ = nullptr;          // strong ref to the ArkTS cb
    napi_threadsafe_function onErrorFunc_ = nullptr;
    napi_ref onErrorRef_ = nullptr;

    napi_ref selfRef_ = nullptr;              // WEAK (refcount 0) ref to the JS CEProxy object

    bool destroyed_ = false;
    // Set true the first time DoEdit is called. Refresh() only writes sandbox
    // + goes dormant when editStarted_ && !isEditing, so an initial refresh()
    // (to fetch the first thumbnail before any edit) does not tear down a
    // freshly-created live proxy.
    bool editStarted_ = false;

    // Document created by the client (CreateDocumentByOEid/ByFile/LoadFromFile).
    // Ownership: OH_ContentEmbed_CreateExtensionProxy stores this document in the
    // proxy (proxy->ceDocument) and OH_ContentEmbed_DestroyExtensionProxy deletes
    // it internally. Teardown paths therefore only clear the pointer after the
    // proxy is destroyed (destroying it again would double-free, see commit 6571477);
    // only the CreateExtensionProxy-failure path (no proxy was created) destroys
    // the document here via OH_ContentEmbed_DestroyDocument.
    ContentEmbed_Document* ownedDocument_ = nullptr;

    // ---- member methods (shims in the .cpp call these via UnwrapThis) ----
    napi_value DoEdit(napi_env env);
    napi_value Refresh(napi_env env);
    napi_value GetSnapshotImage(napi_env env);
    napi_value Destroy(napi_env env);
    napi_value SetOnUpdate(napi_env env, napi_value cb, napi_value thisArg);
    napi_value SetOnError(napi_env env, napi_value cb, napi_value thisArg);

    // Called by the factory free functions (CreateByOEid/CreateFromLocal) after
    // constructing the wrapper and the document it will own.
    ContentEmbed_ErrorCode StartExtensionProxy(void* contextPtr, ContentEmbed_Document* doc);

    ContentEmbedProxyWrapper() = default;
    ~ContentEmbedProxyWrapper() = default;
    ContentEmbedProxyWrapper(const ContentEmbedProxyWrapper&) = delete;
    ContentEmbedProxyWrapper& operator=(const ContentEmbedProxyWrapper&) = delete;
    ContentEmbedProxyWrapper(ContentEmbedProxyWrapper&&) = delete;
    ContentEmbedProxyWrapper& operator=(ContentEmbedProxyWrapper&&) = delete;

private:
    ContentEmbed_ErrorCode DoEditLive();
    ContentEmbed_ErrorCode DoEditReactivated();
    ContentEmbed_ErrorCode RefreshSnapshot(ContentEmbed_ExtensionProxy* proxy);
    ContentEmbed_ErrorCode MaybeWriteSandboxIfIdle(ContentEmbed_Document* document);
};

namespace content_embed {

// Stateless query bindings (module exports)
napi_value QueryAll(napi_env env, napi_callback_info info);
napi_value Query(napi_env env, napi_callback_info info);

// Factory bindings (module exports) — each returns a CEProxy JS object
napi_value CreateByOEid(napi_env env, napi_callback_info info);
napi_value CreateFromLocal(napi_env env, napi_callback_info info);
napi_value CreateDormant(napi_env env, napi_callback_info info);

} // namespace content_embed

#endif //OECLIENTDEMO_CONTENT_EMBED_PROXY_H
