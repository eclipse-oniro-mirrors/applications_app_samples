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

#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_napi.h"
#include "arkui/ui_event_injection.h"
#include "arkui/ui_info_collection.h"
#include "multimedia/image_framework/image/pixelmap_native.h"

#include <array>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <map>
#include <memory>
#include <mutex>
#include <new>
#include <string>
#include <utility>
#include <vector>

namespace {

// Maximum command JSON size accepted by this sample (application policy, not a platform limit).
constexpr size_t MAX_COMMAND_BYTES = 64 * 1024;

// Number of boolean collection options applied through a tree request.
constexpr size_t TREE_OPTION_COUNT = 5;

// Argument counts and argument positions of the N-API bridge functions in this file.
constexpr size_t TREE_ARG_COUNT = 2;
constexpr size_t COMMAND_ARG_COUNT = 3;
constexpr size_t CONTEXT_ARG = 0;
constexpr size_t OPTIONS_ARG = 1;
constexpr size_t NODE_ID_ARG = 1;
constexpr size_t COMMAND_ARG = 2;

// Image collection bridge: one request carries 1 to 20 unique node ids.
constexpr size_t IMAGE_ARG_COUNT = 1;
constexpr size_t IMAGE_NODE_IDS_ARG = 0;
constexpr size_t IMAGE_MAX_NODE_COUNT = 20;

// Tree requests are released with the public destroy function of the collection interface.
using Request = std::unique_ptr<OH_ArkUI_NativeModule_UIAgentTreeRequest,
    decltype(&OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy)>;

// Keeps the Node-API environment used by an asynchronous promise alive together with its deferred.
struct PendingOwner {
    napi_env env = nullptr;
};

struct PendingJob {
    std::shared_ptr<PendingOwner> owner;
    napi_deferred deferred = nullptr;
};

std::mutex g_pendingMutex;
std::map<uintptr_t, std::shared_ptr<PendingJob>> g_pendingJobs;
uintptr_t g_nextPendingToken = 0;

// The sample reuses the context handle of its single UI instance instead of obtaining a new
// handle on every call. See the context lifecycle notes in the guide before reusing this
// approach with multiple instances.
std::mutex g_contextMutex;
ArkUI_ContextHandle g_cachedContext = nullptr;

bool Arguments(napi_env env, napi_callback_info info, size_t count, napi_value* args)
{
    size_t argc = count;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc != count) {
        napi_throw_type_error(env, nullptr, "Expected the documented bridge arguments");
        return false;
    }
    return true;
}

bool ReadBool(napi_env env, napi_value options, const char* name, bool& value)
{
    napi_value item = nullptr;
    napi_valuetype type = napi_undefined;
    if (napi_get_named_property(env, options, name, &item) != napi_ok ||
        napi_typeof(env, item, &type) != napi_ok || type != napi_boolean ||
        napi_get_value_bool(env, item, &value) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected a boolean collection option");
        return false;
    }
    return true;
}

bool ReadNodeId(napi_env env, napi_value value, int32_t& nodeId)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_number ||
        napi_get_value_int32(env, value, &nodeId) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected an integer node id");
        return false;
    }
    return true;
}

ArkUI_ContextHandle GetContext(napi_env env, napi_value value)
{
    std::lock_guard<std::mutex> lock(g_contextMutex);
    if (g_cachedContext != nullptr) {
        return g_cachedContext;
    }
    ArkUI_ContextHandle context = nullptr;
    if (OH_ArkUI_GetContextFromNapiValue(env, value, &context) != ARKUI_ERROR_CODE_NO_ERROR ||
        context == nullptr) {
        napi_throw_type_error(env, nullptr, "Cannot obtain the ArkUI context of this UI instance");
        return nullptr;
    }
    g_cachedContext = context;
    return context;
}

napi_value Throw(napi_env env, const char* what, ArkUI_ErrorCode code)
{
    const std::string message = std::string(what) + " failed: " + std::to_string(code);
    napi_throw_error(env, nullptr, message.c_str());
    return nullptr;
}

napi_value JsonString(napi_env env, const OH_ArkUI_NativeModule_UIJsonWrapper* json)
{
    const char* data = OH_ArkUI_NativeModule_UIJsonWrapperGetData(json);
    if (data == nullptr) {
        napi_throw_error(env, nullptr, "Cannot read the collected JSON payload");
        return nullptr;
    }
    napi_value result = nullptr;
    if (napi_create_string_utf8(env, data, std::strlen(data), &result) != napi_ok) {
        return nullptr;
    }
    return result;
}

bool NumberProperty(napi_env env, napi_value object, const char* name, int32_t value)
{
    napi_value item = nullptr;
    if (napi_create_int32(env, value, &item) != napi_ok) {
        return false;
    }
    return napi_set_named_property(env, object, name, item) == napi_ok;
}

uintptr_t AddPending(napi_env env, napi_value& promise)
{
    napi_deferred deferred = nullptr;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return 0;
    }
    auto job = std::make_shared<PendingJob>();
    job->owner = std::make_shared<PendingOwner>();
    job->owner->env = env;
    job->deferred = deferred;
    std::lock_guard<std::mutex> lock(g_pendingMutex);
    const uintptr_t token = ++g_nextPendingToken;
    g_pendingJobs.emplace(token, std::move(job));
    return token;
}

std::shared_ptr<PendingJob> TakePending(uintptr_t token)
{
    std::lock_guard<std::mutex> lock(g_pendingMutex);
    auto found = g_pendingJobs.find(token);
    if (found == g_pendingJobs.end()) {
        return nullptr;
    }
    auto job = found->second;
    g_pendingJobs.erase(found);
    return job;
}

void Reject(std::shared_ptr<PendingJob>& job, const char* what, int32_t code)
{
    const std::string message = std::string(what) + " failed: " + std::to_string(code);
    napi_value error = nullptr;
    if (napi_create_string_utf8(job->owner->env, message.c_str(), message.size(), &error) == napi_ok) {
        napi_reject_deferred(job->owner->env, job->deferred, error);
    }
}

// Rejected submissions never receive a completion callback, so the promise is rejected here.
void RejectSubmission(uintptr_t token, ArkUI_ErrorCode code)
{
    if (code == ARKUI_ERROR_CODE_NO_ERROR) {
        return;
    }
    auto job = TakePending(token);
    if (job != nullptr) {
        Reject(job, "request submission", code);
    }
}

// [Start ui_tree_create_request]
Request CreateRequest(napi_env env, napi_value options)
{
    Request request(nullptr, OH_ArkUI_NativeModule_UIAgentTreeRequestDestroy);
    bool visible = false;
    std::array<bool, TREE_OPTION_COUNT> flags {};
    const char* names[] = {"filterLayout", "interaction", "accessibility", "visual", "functional"};
    if (!ReadBool(env, options, "visibleOnly", visible)) {
        return request;
    }
    for (size_t index = 0; index < flags.size(); ++index) {
        if (!ReadBool(env, options, names[index], flags[index])) {
            return request;
        }
    }
    OH_ArkUI_NativeModule_UIAgentTreeRequest* raw = nullptr;
    auto code = OH_ArkUI_NativeModule_UIAgentTreeRequestCreate(visible ?
        OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_VISIBLE : OH_ARKUI_NATIVE_MODULE_UI_AGENT_TREE_FULL, &raw);
    request.reset(raw);
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        Throw(env, "tree request", code);
        return request;
    }
    using Setter = ArkUI_ErrorCode (*)(OH_ArkUI_NativeModule_UIAgentTreeRequest*, bool);
    const Setter setters[] = {
        OH_ArkUI_NativeModule_UIAgentTreeRequestSetFilterPureLayoutNodes,
        OH_ArkUI_NativeModule_UIAgentTreeRequestSetInteractionInfo,
        OH_ArkUI_NativeModule_UIAgentTreeRequestSetAccessibilityInfo,
        OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectVisualProperties,
        OH_ArkUI_NativeModule_UIAgentTreeRequestSetCollectFunctionalProperties
    };
    for (size_t index = 0; index < flags.size(); ++index) {
        code = setters[index](request.get(), flags[index]);
        if (code != ARKUI_ERROR_CODE_NO_ERROR) {
            Throw(env, "tree option", code);
            request.reset();
            break;
        }
    }
    return request;
}
// [End ui_tree_create_request]

// [Start ui_tree_sync]
napi_value CollectTree(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    if (!Arguments(env, info, TREE_ARG_COUNT, args)) {
        return nullptr;
    }
    auto request = CreateRequest(env, args[OPTIONS_ARG]);
    if (!request) {
        return nullptr;
    }
    auto context = GetContext(env, args[CONTEXT_ARG]);
    if (!context) {
        return nullptr;
    }
    OH_ArkUI_NativeModule_UIJsonWrapper* json = nullptr;
    auto code = OH_ArkUI_NativeModule_UIAgentGetTreeJson(context, request.get(),
        OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT, &json);
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        return Throw(env, "tree collection", code);
    }
    auto result = JsonString(env, json);
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(json);
    return result;
}
// [End ui_tree_sync]

// [Start ui_tree_complete]
void OnTree(ArkUI_ContextHandle context, uint64_t requestId, ArkUI_ErrorCode code,
    OH_ArkUI_NativeModule_UIJsonWrapper* json, void* userData)
{
    std::unique_ptr<OH_ArkUI_NativeModule_UIJsonWrapper,
        decltype(&OH_ArkUI_NativeModule_UIJsonWrapperDestroy)> owned(json, OH_ArkUI_NativeModule_UIJsonWrapperDestroy);
    auto job = TakePending(reinterpret_cast<uintptr_t>(userData));
    if (!job) {
        return;
    }
    napi_handle_scope scope = nullptr;
    if (napi_open_handle_scope(job->owner->env, &scope) != napi_ok) {
        return;
    }
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        Reject(job, "tree completion", code);
    } else {
        auto value = JsonString(job->owner->env, json);
        if (value) {
            napi_resolve_deferred(job->owner->env, job->deferred, value);
        } else {
            Reject(job, "JSON bridge", -1);
        }
    }
    napi_close_handle_scope(job->owner->env, scope);
}
// [End ui_tree_complete]

// [Start ui_tree_async]
napi_value CollectTreeAsync(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    if (!Arguments(env, info, TREE_ARG_COUNT, args)) {
        return nullptr;
    }
    auto request = CreateRequest(env, args[OPTIONS_ARG]);
    if (!request) {
        return nullptr;
    }
    auto context = GetContext(env, args[CONTEXT_ARG]);
    if (!context) {
        return nullptr;
    }
    napi_value promise = nullptr;
    auto token = AddPending(env, promise);
    if (token) {
        uint64_t requestId = 0;
        auto code = OH_ArkUI_NativeModule_UIAgentGetTreeJsonAsync(context, request.get(),
            OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT, OnTree, reinterpret_cast<void*>(token), &requestId);
        RejectSubmission(token, code);
    }
    return promise;
}
// [End ui_tree_async]

// [Start ui_command_completion]
void OnCommand(OH_ArkUI_NativeModule_UIEventInjection_ResultCode resultCode, void* userData)
{
    auto job = TakePending(reinterpret_cast<uintptr_t>(userData));
    if (!job) {
        return;
    }
    napi_env env = job->owner->env;
    napi_handle_scope scope = nullptr;
    if (napi_open_handle_scope(env, &scope) != napi_ok) {
        return;
    }
    napi_value result = nullptr;
    if (napi_create_object(env, &result) == napi_ok && NumberProperty(env, result, "result", resultCode)) {
        napi_resolve_deferred(env, job->deferred, result);
    } else {
        Reject(job, "command bridge", -1);
    }
    napi_close_handle_scope(env, scope);
}
// [End ui_command_completion]

// [Start ui_command_inject_native]
napi_value InjectCommand(napi_env env, napi_callback_info info)
{
    napi_value args[3];
    if (!Arguments(env, info, COMMAND_ARG_COUNT, args)) {
        return nullptr;
    }
    int32_t nodeId = 0;
    if (!ReadNodeId(env, args[NODE_ID_ARG], nodeId)) {
        return nullptr;
    }
    size_t length = 0;
    if (napi_get_value_string_utf8(env, args[COMMAND_ARG], nullptr, 0, &length) != napi_ok ||
        length == 0 || length > MAX_COMMAND_BYTES) {
        napi_throw_range_error(env, nullptr, "Sample command must contain 1 to 65536 UTF-8 bytes");
        return nullptr;
    }
    std::vector<char> bytes(length + 1);
    size_t copied = 0;
    if (napi_get_value_string_utf8(env, args[COMMAND_ARG], bytes.data(), bytes.size(), &copied) != napi_ok) {
        return nullptr;
    }
    auto context = GetContext(env, args[CONTEXT_ARG]);
    if (!context) {
        return nullptr;
    }
    OH_ArkUI_NativeModule_UIJsonWrapper* command = nullptr;
    auto code = OH_ArkUI_NativeModule_UIJsonWrapperCreate(bytes.data(), static_cast<uint32_t>(copied), &command);
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        return Throw(env, "JSON creation", code);
    }

    napi_value promise = nullptr;
    auto token = AddPending(env, promise);
    if (token) {
        code = OH_ArkUI_NativeModule_UIEventInjectCompositeCommand(context, static_cast<uint32_t>(nodeId), command,
            OnCommand, reinterpret_cast<void*>(token));
        RejectSubmission(token, code);
    }
    OH_ArkUI_NativeModule_UIJsonWrapperDestroy(command);
    return promise;
}
// [End ui_command_inject_native]

// Data that must stay valid until the framework reports the accepted image request: the copied node
// ids and the pending promise. The framework hands back one opaque collection per accepted request.
struct ImageRequest {
    napi_env env = nullptr;
    napi_deferred deferred = nullptr;
    std::vector<int32_t> nodeIds;
};

// Reads the unique node ids of one capture request.
bool ReadNodeIds(napi_env env, napi_value value, std::vector<int32_t>& nodeIds)
{
    bool isArray = false;
    uint32_t length = 0;
    if (napi_is_array(env, value, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, value, &length) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected an array of node ids");
        return false;
    }
    if (length == 0 || length > IMAGE_MAX_NODE_COUNT) {
        napi_throw_range_error(env, nullptr, "Request 1 to 20 unique node ids");
        return false;
    }
    nodeIds.reserve(length);
    for (uint32_t index = 0; index < length; ++index) {
        napi_value element = nullptr;
        napi_valuetype type = napi_undefined;
        int32_t nodeId = 0;
        if (napi_get_element(env, value, index, &element) != napi_ok ||
            napi_typeof(env, element, &type) != napi_ok || type != napi_number ||
            napi_get_value_int32(env, element, &nodeId) != napi_ok) {
            napi_throw_type_error(env, nullptr, "Expected integer node ids");
            return false;
        }
        nodeIds.push_back(nodeId);
    }
    return true;
}

// Reads the pixel size of a collected image. Both outputs stay 0 when it cannot be read.
void ReadPixelmapSize(OH_PixelmapNative* pixelmap, uint32_t& width, uint32_t& height)
{
    width = 0;
    height = 0;
    OH_Pixelmap_ImageInfo* info = nullptr;
    if (OH_PixelmapImageInfo_Create(&info) != IMAGE_SUCCESS || info == nullptr) {
        return;
    }
    if (OH_PixelmapNative_GetImageInfo(pixelmap, info) == IMAGE_SUCCESS) {
        (void)OH_PixelmapImageInfo_GetWidth(info, &width);
        (void)OH_PixelmapImageInfo_GetHeight(info, &height);
    }
    OH_PixelmapImageInfo_Release(info);
}

// Builds the ArkTS view of one collection item. The PixelMap value is converted here, while the
// native handle stays owned by this function and is released by its caller.
napi_value ImageItem(napi_env env, int32_t nodeId, ArkUI_ErrorCode takeError, ArkUI_ErrorCode itemError,
    OH_PixelmapNative* pixelmap)
{
    napi_value item = nullptr;
    if (napi_create_object(env, &item) != napi_ok) {
        return nullptr;
    }
    if (!NumberProperty(env, item, "nodeId", nodeId) ||
        !NumberProperty(env, item, "takeError", static_cast<int32_t>(takeError)) ||
        !NumberProperty(env, item, "itemError", static_cast<int32_t>(itemError))) {
        return nullptr;
    }
    if (pixelmap == nullptr) {
        return item;
    }
    uint32_t width = 0;
    uint32_t height = 0;
    ReadPixelmapSize(pixelmap, width, height);
    if (!NumberProperty(env, item, "width", static_cast<int32_t>(width)) ||
        !NumberProperty(env, item, "height", static_cast<int32_t>(height))) {
        return nullptr;
    }
    napi_value image = nullptr;
    if (OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, pixelmap, &image) != IMAGE_SUCCESS ||
        napi_set_named_property(env, item, "pixelMap", image) != napi_ok) {
        return nullptr;
    }
    return item;
}

// [Start ndk_image_take_item]
// Runs once per accepted request on the UI thread: takes every item, converts it and releases the
// collection before returning.
void OnImages(ArkUI_ErrorCode overallError, OH_ArkUI_NativeModule_ImageCollection* collection, void* userData)
{
    auto* request = static_cast<ImageRequest*>(userData);
    if (request == nullptr) {
        // No owner left for this result: the collection still has to be destroyed to release the images.
        OH_ArkUI_NativeModule_ImageCollectionDestroy(collection);
        return;
    }
    napi_env env = request->env;
    napi_handle_scope scope = nullptr;
    if (napi_open_handle_scope(env, &scope) != napi_ok) {
        OH_ArkUI_NativeModule_ImageCollectionDestroy(collection);
        delete request;
        return;
    }
    napi_value result = nullptr;
    napi_value items = nullptr;
    bool built = napi_create_object(env, &result) == napi_ok &&
        napi_create_array(env, &items) == napi_ok;
    if (built) {
        uint32_t count = 0;
        for (int32_t nodeId : request->nodeIds) {
            OH_PixelmapNative* pixelmap = nullptr;
            // A null collection means the request produced no result at all, so no item can be taken.
            ArkUI_ErrorCode itemError = collection == nullptr ? overallError : ARKUI_ERROR_CODE_NO_ERROR;
            const ArkUI_ErrorCode takeError = collection == nullptr ? overallError :
                OH_ArkUI_NativeModule_ImageCollectionTakeItemByNodeId(collection, nodeId, &pixelmap, &itemError);
            napi_value item = ImageItem(env, nodeId, takeError, itemError, pixelmap);
            if (pixelmap != nullptr) {
                // The take call moved the ownership here, and the conversion above is finished.
                OH_PixelmapNative_Destroy(&pixelmap);
            }
            if (item != nullptr) {
                napi_set_element(env, items, count, item);
                count += 1;
            }
        }
        built = NumberProperty(env, result, "submitError", 0) &&
            NumberProperty(env, result, "overallError", static_cast<int32_t>(overallError)) &&
            napi_set_named_property(env, result, "items", items) == napi_ok;
    }
    if (built) {
        napi_resolve_deferred(env, request->deferred, result);
    } else {
        napi_value error = nullptr;
        if (napi_create_string_utf8(env, "image result bridge failed", NAPI_AUTO_LENGTH, &error) == napi_ok) {
            napi_reject_deferred(env, request->deferred, error);
        }
    }
    OH_ArkUI_NativeModule_ImageCollectionDestroy(collection);
    napi_close_handle_scope(env, scope);
    delete request;
}
// [End ndk_image_take_item]

// [Start ndk_image_anchor]
// The capture interface needs the ArkUI context of the target page, and a node declared in ArkTS does
// not expose one. The page therefore hosts a small native node through a NodeContent, and the sample
// resolves the context from that node.
ArkUI_NodeHandle g_imageAnchor = nullptr;
ArkUI_NodeContentHandle g_imageContent = nullptr;

bool AttachImageAnchor(napi_env env, ArkUI_NodeContentHandle content)
{
    if (g_imageAnchor != nullptr) {
        return true;
    }
    ArkUI_NativeNodeAPI_1* api = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, api);
    if (api == nullptr) {
        napi_throw_error(env, nullptr, "Cannot obtain the ArkUI node API");
        return false;
    }
    g_imageAnchor = api->createNode(ARKUI_NODE_COLUMN);
    if (g_imageAnchor == nullptr || OH_ArkUI_NodeContent_AddNode(content, g_imageAnchor) != 0) {
        napi_throw_error(env, nullptr, "Cannot host the capture anchor node");
        return false;
    }
    g_imageContent = content;
    return true;
}

// Removes the anchor node from the page content and disposes it.
void DetachImageAnchor()
{
    if (g_imageAnchor == nullptr) {
        return;
    }
    if (g_imageContent != nullptr) {
        (void)OH_ArkUI_NodeContent_RemoveNode(g_imageContent, g_imageAnchor);
    }
    ArkUI_NativeNodeAPI_1* api = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, api);
    if (api != nullptr) {
        api->disposeNode(g_imageAnchor);
    }
    g_imageAnchor = nullptr;
    g_imageContent = nullptr;
}
// [End ndk_image_anchor]

// [Start ndk_image_context]
ArkUI_ContextHandle GetImageContext(napi_env env)
{
    if (g_imageAnchor == nullptr) {
        napi_throw_error(env, nullptr, "The capture anchor node is not attached");
        return nullptr;
    }
    auto context = OH_ArkUI_GetContextByNode(g_imageAnchor);
    if (context == nullptr) {
        napi_throw_error(env, nullptr, "Cannot get the capture context from the anchor node");
    }
    return context;
}
// [End ndk_image_context]

// [Start ndk_image_collect]
// Bridge entry for the page: collectImages(nodeIds). The returned promise resolves with the
// submission result and every collection item.
napi_value CollectImages(napi_env env, napi_callback_info info)
{
    napi_value args[IMAGE_ARG_COUNT];
    if (!Arguments(env, info, IMAGE_ARG_COUNT, args)) {
        return nullptr;
    }
    auto context = GetImageContext(env);
    if (!context) {
        return nullptr;
    }
    std::vector<int32_t> nodeIds;
    if (!ReadNodeIds(env, args[IMAGE_NODE_IDS_ARG], nodeIds)) {
        return nullptr;
    }
    napi_value promise = nullptr;
    auto* request = new (std::nothrow) ImageRequest();
    if (request == nullptr || napi_create_promise(env, &request->deferred, &promise) != napi_ok) {
        delete request;
        napi_throw_error(env, nullptr, "Cannot create the image collection promise");
        return nullptr;
    }
    request->env = env;
    request->nodeIds = nodeIds;
    // The framework copies the ids before this call returns, so the request owns its own copy and the
    // caller may release the array immediately.
    const auto code = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, request->nodeIds.data(),
        static_cast<uint32_t>(request->nodeIds.size()), OnImages, request);
    if (code != ARKUI_ERROR_CODE_NO_ERROR) {
        // The request was rejected: no callback will arrive, so report the submission code and finish.
        napi_value rejected = nullptr;
        napi_value empty = nullptr;
        if (napi_create_object(env, &rejected) == napi_ok && napi_create_array(env, &empty) == napi_ok) {
            NumberProperty(env, rejected, "submitError", static_cast<int32_t>(code));
            NumberProperty(env, rejected, "overallError", static_cast<int32_t>(code));
            napi_set_named_property(env, rejected, "items", empty);
            napi_resolve_deferred(env, request->deferred, rejected);
        }
        delete request;
    }
    return promise;
}
// [End ndk_image_collect]

// [Start ndk_image_anchor_bridge]
napi_value AttachImageAnchorBridge(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    if (!Arguments(env, info, 1, args)) {
        return nullptr;
    }
    ArkUI_NodeContentHandle content = nullptr;
    if (OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &content) != 0 || content == nullptr) {
        napi_throw_error(env, nullptr, "Cannot obtain the NodeContent of this page");
        return nullptr;
    }
    (void)AttachImageAnchor(env, content);
    return nullptr;
}
// [End ndk_image_anchor_bridge]

napi_value DetachImageAnchorBridge(napi_env env, napi_callback_info info)
{
    DetachImageAnchor();
    return nullptr;
}

napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"attachImageAnchor", nullptr, AttachImageAnchorBridge, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"collectImages", nullptr, CollectImages, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"collectTree", nullptr, CollectTree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"collectTreeAsync", nullptr, CollectTreeAsync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"detachImageAnchor", nullptr, DetachImageAnchorBridge, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"injectCommand", nullptr, InjectCommand, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        return nullptr;
    }
    return exports;
}

} // namespace

static napi_module g_uiInfoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterUiInfoModule(void)
{
    napi_module_register(&g_uiInfoModule);
}
