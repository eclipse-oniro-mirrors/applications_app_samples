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

// CEProxy implementation: each native ContentEmbed_ExtensionProxy* wrapped as a
// NAPI JS object owned by ArkTS. The file-local g_proxyByHandle map routes the
// four C callbacks (which take no user_data) to the right wrapper.

// [Start content_embed_client_include_headers]
#include <string>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include <hilog/log.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
// [End content_embed_client_include_headers]

#include <unistd.h>
#include <cstring>
#include <mutex>
#include <unordered_map>

#include <filemanagement/fileshare/oh_file_share.h>

#include "common/common.h"
#include "common/napi_object_parser.h"
#include "common/utils.h"
#include "content_embed_proxy.h"

// File extensions and URI scheme used by the client demo.
constexpr const char* OE_FORMAT_FILE_EXT = ".bin";   // OE format file extension
constexpr const char* SNAPSHOT_FILE_EXT = ".png";    // Snapshot image file extension
constexpr const char* FILE_URI_SCHEME = "file://";   // File URI scheme prefix
// Fallback locale for LookupDisplayName (card title lookup in createByOEid);
// the ArkTS query pages use the system locale from AppStorage('locale').
constexpr const char* DEFAULT_LOCALE = "zh-cn";

// Argument counts expected by the NAPI bindings exposed by this module.
// Used for both the napi_value args[] buffer size and the argc lower-bound check.
constexpr size_t SINGLE_PROXY_ARG_COUNT = 1;        // proxy accessor methods (GetName/IsAlive/...)
constexpr size_t QUERY_ALL_ARG_COUNT = 1;           // queryAll(locale)
constexpr size_t QUERY_ARG_COUNT = 2;               // query(oeid, locale)
constexpr size_t CREATE_BY_OEID_ARG_COUNT = 3;      // createByOEid(ctx, oeid, sandboxPath)
constexpr size_t CREATE_FROM_LOCAL_ARG_COUNT = 5;   // createFromLocal(ctx, src, sandbox, fileUri, isLinking?)
constexpr size_t CREATE_FROM_LOCAL_REQUIRED_ARG_COUNT = 3;  // first 3 args are mandatory
constexpr size_t CREATE_FROM_LOCAL_FILEURI_INDEX = 3;       // 0-based index of fileUri arg
constexpr size_t CREATE_FROM_LOCAL_ISLINKING_INDEX = 4;     // 0-based index of isLinking arg
constexpr size_t CREATE_DORMANT_ARG_COUNT = 4;      // createDormant(ctx, name, path, snapshotPath)
constexpr size_t ARG_INDEX_ZERO = 0;
constexpr size_t ARG_INDEX_ONE = 1;
constexpr size_t ARG_INDEX_TWO = 2;
constexpr size_t ARG_INDEX_THREE = 3;

// Argument count passed to the ArkTS on-error callback: (proxy, errCode).
constexpr size_t ON_ERROR_CB_ARG_COUNT = 2;

static std::unordered_map<ContentEmbed_ExtensionProxy*, ContentEmbedProxyWrapper*> g_proxyByHandle;
static std::mutex g_proxyMutex;

// Chunk size for streaming OE document content to a sandbox file during save.
constexpr size_t SANDBOX_WRITE_CHUNK_SIZE = 4096;

// Reads a UTF-8 string argument into `out` and frees the intermediate heap buffer.
// Returns false (without touching out) when the argument is missing or not a string.
static bool TakeStringParam(napi_env env, napi_value v, std::string& out)
{
    char* p = GetStringParam(env, v);
    if (p == nullptr) {
        return false;
    }
    out = p;
    delete[] p;
    return true;
}

static ContentEmbed_ErrorCode WriteDocumentToSandbox(ContentEmbed_Document *document, const char *sandboxPath)
{
    OH_LOG_INFO(LOG_APP, "enter WriteDocumentToSandbox sandboxPath: %{public}s", sandboxPath);
    uint8_t *buffer = new (std::nothrow) uint8_t[SANDBOX_WRITE_CHUNK_SIZE + 1];
    if (buffer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox alloc buffer failed");
        return CE_ERR_NULL_POINTER;
    }
    FILE *file = fopen(sandboxPath, "wb");
    if (file == nullptr) {
        OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox fopen failed: %{public}s", sandboxPath);
        delete[] buffer;
        return CE_ERR_FILE_OPERATION_FAILED;
    }
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    size_t offset = 0;
    size_t actualRead = 0;
    // Read+write loop terminates when Read returns an error or reports zero bytes
    // (end of document). Both conditions are checked explicitly inside the body.
    do {
        ret = OH_ContentEmbed_Document_Read(buffer, SANDBOX_WRITE_CHUNK_SIZE, document, offset, &actualRead);
        if (ret != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox Read failed: %{public}d", ret);
            break;
        }
        if (actualRead == 0) {
            // Normal end-of-document termination.
            break;
        }
        size_t written = fwrite(buffer, 1, actualRead, file);
        if (written != actualRead) {
            OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox short write: written=%{public}zu, actualRead=%{public}zu",
                         written, actualRead);
            ret = CE_ERR_FILE_OPERATION_FAILED;
            break;
        }
        offset += actualRead;
    } while (ret == CE_ERR_OK);
    if (fclose(file) != 0) {
        OH_LOG_ERROR(LOG_APP, "fclose failed.");
        // fclose failure may mean buffered data never reached the disk; do not
        // report success when the persisted file may be incomplete.
        if (ret == CE_ERR_OK) {
            ret = CE_ERR_FILE_OPERATION_FAILED;
        }
    }
    delete[] buffer;
    return ret;
}

static ContentEmbedFormat BuildFormatFromCeFormat(ContentEmbed_Format *&format)
{
    ContentEmbed_ErrorCode ret;
    // Zero-initialized so the %{public}s logs below stay safe (NUL-terminated) when a
    // getter fails and leaves the buffer untouched.
    char oeid[MAX_NAME_LENGTH] = {0};
    ret = OH_ContentEmbed_GetOEidFromFormat(format, oeid);
    OH_LOG_INFO(LOG_APP, "Format_GetOEid ret: %{public}d, oeid: %{public}s", ret, oeid);
    char name[MAX_NAME_LENGTH] = {0};
    char description[MAX_DESCRIPTION_LENGTH] = {0};
    ret = OH_ContentEmbed_GetNameAndDescriptionFromFormat(format, name, description);
    OH_LOG_INFO(LOG_APP, "Format_GetNameAndDescription ret: %{public}d", ret);
    OH_PixelmapNative* pixelMap = nullptr;
    ret = OH_ContentEmbed_GetIconFromFormat(format, &pixelMap);
    OH_LOG_INFO(LOG_APP, "Format_GetIcon ret: %{public}d", ret);
    // Ownership: this pixelmap is transferred to ArkTS by ParseNapi via
    // OH_PixelmapNative_ConvertPixelmapNativeToNapi, so it must NOT be destroyed
    // here. (Contrast: the validation-only copies fetched in QueryAllFormat and
    // QueryFormatByOEid ARE destroyed locally right after their check.)
    ContentEmbedFormat result{oeid, name, description, pixelMap, {}};
    unsigned int extCount = 0;
    char** exts = OH_ContentEmbed_GetFileNameExtensionsFromFormat(format, &extCount);
    OH_LOG_INFO(LOG_APP, "Format_GetFileNameExtensions count: %{public}u", extCount);
    if (exts != nullptr) {
        result.fileExtensions.reserve(extCount);
        for (unsigned int i = 0; i < extCount; i++) {
            if (exts[i] != nullptr) {
                result.fileExtensions.emplace_back(exts[i]);
            }
        }
    }
    return result;
}

std::vector<ContentEmbedFormat> formatList;
// [Start content_embed_client_query_all_format]
ContentEmbed_Info* CreateContentEmbedInfoWithCount(
    const std::string &locale, uint32_t& outCount, ContentEmbed_ErrorCode& outErr)
{
    outCount = 0;
    ContentEmbed_Info* info = nullptr;
    // 创建ContentEmbedInfo
    ContentEmbed_ErrorCode err = OH_ContentEmbed_CreateContentEmbedInfo(&info);
    if (err != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateContentEmbedInfo failed, errCode: %{public}d.", err);
        outErr = err;
        return nullptr;
    }
    // 获取locale语言的ContentEmbedInfo信息
    err = OH_ContentEmbed_GetContentEmbedInfo(locale.c_str(), info);
    if (err != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetContentEmbedInfo failed, errCode: %{public}d.", err);
        // 查询失败销毁ContentEmbedInfo对象
        OH_ContentEmbed_DestroyContentEmbedInfo(info);
        outErr = err;
        return nullptr;
    }
    // 获取ContentEmbedInfo对象Format对象数量
    err = OH_ContentEmbed_GetFormatCountFromInfo(info, &outCount);
    if (err != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetFormatCountFromInfo failed, errCode: %{public}d.", err);
        // 查询失败销毁ContentEmbedInfo对象
        OH_ContentEmbed_DestroyContentEmbedInfo(info);
        outErr = err;
        return nullptr;
    }
    outErr = CE_ERR_OK;
    return info;
}

ContentEmbed_ErrorCode QueryAllFormat(const std::string &locale)
{
    uint32_t count = 0;
    ContentEmbed_ErrorCode errCode = CE_ERR_OK;
    ContentEmbed_Info* contentEmbedInfo = CreateContentEmbedInfoWithCount(locale, count, errCode);
    if (contentEmbedInfo == nullptr) {
        return errCode;
    }
    for (uint32_t i = 0; i < count; i++) {
        ContentEmbed_Format* ceFormat = nullptr;
        // 从ContentEmbedInfo对象获取索引为i的ContentEmbed_Format信息
        errCode = OH_ContentEmbed_GetFormatFromInfo(contentEmbedInfo, i, &ceFormat);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetFormatFromInfo failed, errCode: %{public}d.", errCode);
            continue;
        }
        char oeid[MAX_OEID_LENGTH];
        // 获取OEID
        errCode = OH_ContentEmbed_GetOEidFromFormat(ceFormat, oeid);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetOEidFromFormat failed, errCode: %{public}d.", errCode);
            continue;
        }
        char name[MAX_NAME_LENGTH];
        char description[MAX_DESCRIPTION_LENGTH];
        // 获取名称和描述
        errCode = OH_ContentEmbed_GetNameAndDescriptionFromFormat(ceFormat, name, description);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP,
                "OH_ContentEmbed_GetNameAndDescriptionFromFormat failed, errCode: %{public}d.", errCode);
            continue;
        }
        OH_PixelmapNative* pixelMap = nullptr;
        // 获取图标
        errCode = OH_ContentEmbed_GetIconFromFormat(ceFormat, &pixelMap);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetIconFromFormat failed, errCode: %{public}d.", errCode);
            continue;
        }
        // pixelMap 不使用时需要释放掉
        if (pixelMap != nullptr) {
            OH_PixelmapNative_Destroy(&pixelMap);
        }
        unsigned int extensionCount = 0;
        // 获取文件后缀
        char **fileNameExtensions = OH_ContentEmbed_GetFileNameExtensionsFromFormat(ceFormat, &extensionCount);
        if (fileNameExtensions == nullptr) {
            OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetFileNameExtensionsFromFormat failed");
            continue;
        }
        // [StartExclude content_embed_client_query_all_format]
        formatList.emplace_back(BuildFormatFromCeFormat(ceFormat));
        // [EndExclude content_embed_client_query_all_format]
    }
    // 销毁ContentEmbedInfo对象
    OH_ContentEmbed_DestroyContentEmbedInfo(contentEmbedInfo);
    return errCode;
}
// [End content_embed_client_query_all_format]

napi_value content_embed::QueryAll(napi_env env, napi_callback_info info)
{
    size_t argc = QUERY_ALL_ARG_COUNT;
    napi_value args[QUERY_ALL_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string locale;
    if (!TakeStringParam(env, args[ARG_INDEX_ZERO], locale)) {
        return GetResult(env, CE_ERR_PARAM_INVALID);
    }
    formatList.clear();
    ContentEmbed_ErrorCode errCode = QueryAllFormat(locale);
    return GetResult(env, errCode, ParseNapi(env, formatList));
}

// [Start content_embed_client_query_format_by_oeid]
ContentEmbed_Format* QueryFormatByOEid(const std::string &oeid, const std::string &locale,
    ContentEmbed_ErrorCode& outErr)
{
    ContentEmbed_Format* ceFormat = nullptr;
    // 创建ContentEmbed_Format
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateContentEmbedFormat(&ceFormat);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateContentEmbedFormat failed, errCode: %{public}d.", errCode);
        outErr = errCode;
        return nullptr;
    }
    errCode = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid.c_str(), locale.c_str(), ceFormat);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale failed, errCode: %{public}d.", errCode);
        // 查询失败销毁ContentEmbed_Format对象
        OH_ContentEmbed_DestroyContentEmbedFormat(ceFormat);
        outErr = errCode;
        return nullptr;
    }
    char name[MAX_NAME_LENGTH];
    char description[MAX_DESCRIPTION_LENGTH];
    // 获取名称和描述
    errCode = OH_ContentEmbed_GetNameAndDescriptionFromFormat(ceFormat, name, description);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetNameAndDescriptionFromFormat failed, errCode: %{public}d.", errCode);
        OH_ContentEmbed_DestroyContentEmbedFormat(ceFormat);
        outErr = errCode;
        return nullptr;
    }
    OH_PixelmapNative* pixelMap = nullptr;
    // 获取图标
    errCode = OH_ContentEmbed_GetIconFromFormat(ceFormat, &pixelMap);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetIconFromFormat failed, errCode: %{public}d.", errCode);
        OH_ContentEmbed_DestroyContentEmbedFormat(ceFormat);
        outErr = errCode;
        return nullptr;
    }
    if (pixelMap != nullptr) {
        OH_PixelmapNative_Destroy(&pixelMap);
    }
    unsigned int count = 0;
    // 获取文件后缀
    char **fileNameExtensions = OH_ContentEmbed_GetFileNameExtensionsFromFormat(ceFormat, &count);
    if (fileNameExtensions == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_GetFileNameExtensionsFromFormat failed");
        OH_ContentEmbed_DestroyContentEmbedFormat(ceFormat);
        outErr = CE_ERR_NULL_POINTER;
        return nullptr;
    }
    outErr = CE_ERR_OK;
    return ceFormat;
}
// [End content_embed_client_query_format_by_oeid]

napi_value content_embed::Query(napi_env env, napi_callback_info info)
{
    size_t argc = QUERY_ARG_COUNT;
    napi_value args[QUERY_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string oeid;
    std::string locale;
    if (!TakeStringParam(env, args[ARG_INDEX_ZERO], oeid) ||
        !TakeStringParam(env, args[ARG_INDEX_ONE], locale)) {
        return GetResult(env, CE_ERR_PARAM_INVALID);
    }
    ContentEmbed_ErrorCode errCode = CE_ERR_OK;
    ContentEmbed_Format* ceFormat = QueryFormatByOEid(oeid, locale, errCode);
    if (ceFormat == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Query failed, errCode: %{public}d", errCode);
        return GetResult(env, errCode);
    }
    ContentEmbedFormat format = BuildFormatFromCeFormat(ceFormat);
    OH_ContentEmbed_DestroyContentEmbedFormat(ceFormat);
    return GetResult(env, CE_ERR_OK, ParseNapi(env, format));
}

static void EnterDormant(ContentEmbedProxyWrapper* wrapper);

// ---------------------------------------------------------------------------
// Reference snippets for the development guide ([Start/End content_embed_client_*]
// anchors are extracted by the docs pipeline). They are intentionally NOT called
// at runtime — the live paths use On*Callback + RegisterCallbacks +
// StartExtensionProxy above; these snippets mirror the guide's minimal usage.
// Keep them compiling and warning-free, but do not wire them into the flow.
// ---------------------------------------------------------------------------
// [Start content_embed_client_create_proxy]
constexpr size_t CHUNK_SIZE = 4 * 1024 * 1024;
void ClientCallBack_OnUpdateFunc(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallBack_OnUpdateFunc");
    // 将OE文档数据写入客户端应用文档
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetDocument(proxy, &document);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_GetDocument failed, errCode: %{public}d.", errCode);
        return;
    }
    bool isLinking = false;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Document_IsLinking(document, &isLinking);
    OH_LOG_INFO(LOG_APP, "ret: %{public}d, isLinking: %{public}d", ret, isLinking);
    if (ret == CE_ERR_OK && isLinking) {
        OH_LOG_INFO(LOG_APP, "linking document, No need to save to the sandbox");
        return;
    }
    uint8_t *buffer = new (std::nothrow) uint8_t[CHUNK_SIZE + 1];
    if (!buffer) {
        return;
    }
    size_t offset = 0;
    size_t actualRead = 0;

    do {
        // 读取OE文档内容
        ret = OH_ContentEmbed_Document_Read(buffer, CHUNK_SIZE, document, offset, &actualRead);
        if (ret != CE_ERR_OK || actualRead == 0) {
            break;
        }
        // 自行处理buffer数据流
        // ...
        offset += actualRead;
    } while (ret == CE_ERR_OK && actualRead != 0);
    delete[] buffer;
}

void ClientCallBack_OnErrorFunc(ContentEmbed_ExtensionProxy *proxy, ContentEmbed_ErrorCode error)
{
    OH_LOG_ERROR(LOG_APP, "Enter ClientCallBack_OnErrorFunc, error: %{public}d", error);
}

void ClientCallBack_OnEditingFinishedFunc(ContentEmbed_ExtensionProxy *proxy, bool dataModified)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallBack_OnEditingFinishedFunc, dataModified: %{public}d", dataModified);
    // 编辑完成后，不需要使用时，可销毁客户端OE对象
    OH_ContentEmbed_DestroyExtensionProxy(proxy);
}

void ClientCallBack_OnExtensionStoppedFunc(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallBack_OnExtensionStoppedFunc");
}

// contextPtr: 当前上下文实例
// oeDocument: OE文档
void CreateProxy(void* contextPtr, ContentEmbed_Document *oeDocument)
{
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    // 创建客户端OE对象
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, &proxy, contextPtr);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateExtensionProxy failed, errCode: %{public}d.", errCode);
        return;
    }
    // 注册回调：注册文档更新、错误、编辑结束等回调函数，回调函数注册顺序无要求，但不能遗漏。
    // 注册OE文档更新回调
    errCode = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, ClientCallBack_OnUpdateFunc);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_RegisterOnUpdateFunc failed, errCode: %{public}d.", errCode);
        return;
    }
    // 注册OE文档发生错误回调
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_RegisterOnErrorFunc failed, errCode: %{public}d.", errCode);
        return;
    }
    // 注册OE文档编辑结束回调
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallBack_OnEditingFinishedFunc);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc failed, errCode: %{public}d.", errCode);
        return;
    }
    // 注册Extension实例关闭回调
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallBack_OnExtensionStoppedFunc);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc failed, errCode: %{public}d.", errCode);
        return;
    }
}
// [End content_embed_client_create_proxy]

static void OnUpdateCallback(ContentEmbed_ExtensionProxy* p)
{
    std::lock_guard<std::mutex> lk(g_proxyMutex);
    auto it = g_proxyByHandle.find(p);
    if (it == g_proxyByHandle.end() || !it->second->onUpdateFunc_) {
        return;
    }
    napi_call_threadsafe_function(it->second->onUpdateFunc_, nullptr, napi_tsfn_blocking);
}

static void OnErrorCallback(ContentEmbed_ExtensionProxy* p, ContentEmbed_ErrorCode err)
{
    OH_LOG_ERROR(LOG_APP, "OnError proxy: %{public}p, error: %{public}d", p, err);
    ContentEmbedProxyWrapper* wrapper = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        auto it = g_proxyByHandle.find(p);
        if (it == g_proxyByHandle.end()) {
            return;
        }
        wrapper = it->second;
        if (wrapper->onErrorFunc_) {
            napi_call_threadsafe_function(wrapper->onErrorFunc_,
                reinterpret_cast<void*>(static_cast<uintptr_t>(err)), napi_tsfn_blocking);
        }
    }
    EnterDormant(wrapper);
}

static void OnEditingFinishedCallback(ContentEmbed_ExtensionProxy* p, bool dataModified)
{
    OH_LOG_INFO(LOG_APP, "OnEditingFinished proxy: %{public}p, dataModified: %{public}d", p, dataModified);
    std::lock_guard<std::mutex> lk(g_proxyMutex);
    auto it = g_proxyByHandle.find(p);
    if (it == g_proxyByHandle.end()) {
        return;
    }
    if (dataModified && it->second->onUpdateFunc_) {
        napi_call_threadsafe_function(it->second->onUpdateFunc_, nullptr, napi_tsfn_blocking);
    }
}

static void OnExtensionStoppedCallback(ContentEmbed_ExtensionProxy* p)
{
    OH_LOG_INFO(LOG_APP, "OnExtensionStopped proxy: %{public}p", p);
    ContentEmbedProxyWrapper* wrapper = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        auto it = g_proxyByHandle.find(p);
        if (it == g_proxyByHandle.end()) {
            return;
        }
        wrapper = it->second;
        if (wrapper->onUpdateFunc_) {
            napi_call_threadsafe_function(wrapper->onUpdateFunc_, nullptr, napi_tsfn_blocking);
        }
    }
    EnterDormant(wrapper);
}

static void RegisterCallbacks(ContentEmbed_ExtensionProxy* proxy)
{
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    ret = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, OnUpdateCallback);
    OH_LOG_INFO(LOG_APP, "RegisterOnUpdateFunc ret: %{public}d", ret);
    ret = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, OnErrorCallback);
    OH_LOG_INFO(LOG_APP, "RegisterOnErrorFunc ret: %{public}d", ret);
    ret = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, OnEditingFinishedCallback);
    OH_LOG_INFO(LOG_APP, "RegisterOnEditingFinishedFunc ret: %{public}d", ret);
    ret = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, OnExtensionStoppedCallback);
    OH_LOG_INFO(LOG_APP, "RegisterOnExtensionStoppedFunc ret: %{public}d", ret);
}

// [Start content_embed_client_handle_proxy]
static void HandleProxy(ContentEmbed_ExtensionProxy* proxy)
{
    ContentEmbed_ErrorCode errCode = CE_ERR_OK;
    // 启动OE Extension组件
    errCode = OH_ContentEmbed_Proxy_StartWork(proxy);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_StartWork failed, errCode: %{public}d.", errCode);
        return;
    }
    uint32_t bitmask = 0;
    // 查询OE Extension组件能力
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_GetCapability failed, errCode: %{public}d.", errCode);
        return;
    }
    if ((bitmask & CE_CAPABILITY_SUPPORT_DO_EDIT) != 0) {
        // 服务端支持编辑能力时，通知OE服务端编辑OE文档
        errCode = OH_ContentEmbed_Proxy_DoEdit(proxy);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_DoEdit failed, errCode: %{public}d.", errCode);
            return;
        }
    }
    // 主动查询OE文档的编辑状态
    bool isEditing = false;
    bool isModified = false;
    // 查询被嵌入文档编辑状态
    errCode = OH_ContentEmbed_Proxy_GetEditStatus(proxy, &isEditing, &isModified);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Proxy_GetEditStatus failed, errCode: %{public}d.", errCode);
    }
    if ((bitmask & CE_CAPABILITY_SUPPORT_SNAPSHOT) != 0) {
        // 服务端支持获取OE快照能力时，从OE服务端获取OE文档快照
        OH_PixelmapNative* pixelMap = nullptr;
        // 获取OE文档快照
        errCode = OH_ContentEmbed_Proxy_GetSnapshot(proxy, &pixelMap);
        if (errCode == CE_ERR_OK && pixelMap != nullptr) {
            // Caller releases the snapshot reference obtained from GetSnapshot.
            OH_PixelmapNative_Release(pixelMap);
        }
    }
    // 当proxy不需要和服务端交互时
    OH_ContentEmbed_Proxy_StopWork(proxy);
}
// [End content_embed_client_handle_proxy]

ContentEmbed_ErrorCode ContentEmbedProxyWrapper::StartExtensionProxy(
    void* contextPtr, ContentEmbed_Document* doc)
{
    ownedDocument_ = doc;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateExtensionProxy(doc, &proxy_, contextPtr);
    OH_LOG_INFO(LOG_APP, "CreateExtensionProxy ret: %{public}d, proxy: %{public}p", errCode, proxy_);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "CreateExtensionProxy failed: %{public}d", errCode);
        OH_ContentEmbed_DestroyDocument(ownedDocument_);
        ownedDocument_ = nullptr;
        return errCode;
    }
    RegisterCallbacks(proxy_);
    errCode = OH_ContentEmbed_Proxy_StartWork(proxy_);
    OH_LOG_INFO(LOG_APP, "Proxy_StartWork ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Proxy_StartWork failed: %{public}d", errCode);
        OH_ContentEmbed_DestroyExtensionProxy(proxy_);
        proxy_ = nullptr;
        ownedDocument_ = nullptr;
        return errCode;
    }
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        g_proxyByHandle[proxy_] = this;
    }
    return CE_ERR_OK;
}

static void EnterDormant(ContentEmbedProxyWrapper* wrapper)
{
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = wrapper->proxy_;
        if (proxy == nullptr) {
            return;
        }
        g_proxyByHandle.erase(proxy);
        wrapper->proxy_ = nullptr;
        // Release the cached snapshot reference before dormancy (a dormant proxy
        // has no live snapshot). References from OH_ContentEmbed_Proxy_GetSnapshot
        // must be released by the caller, mirroring ReleaseWrapperRefs/RefreshSnapshot.
        if (wrapper->snapShot_ != nullptr) {
            OH_PixelmapNative_Release(wrapper->snapShot_);
            wrapper->snapShot_ = nullptr;
        }
    }
    ContentEmbed_Document* document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetDocument(proxy, &document);
    OH_LOG_INFO(LOG_APP, "EnterDormant GetDocument ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "EnterDormant GetDocument failed: %{public}d", errCode);
    }
    if (errCode == CE_ERR_OK && document != nullptr) {
        WriteDocumentToSandbox(document, wrapper->path_.c_str());
    }
    OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_ContentEmbed_DestroyExtensionProxy(proxy);
    if (wrapper->ownedDocument_ != nullptr) {
        wrapper->ownedDocument_ = nullptr;
    }
}

static ContentEmbedProxyWrapper* UnwrapThis(napi_env env, napi_callback_info info)
{
    napi_value this_arg;
    size_t argc = 0;
    napi_get_cb_info(env, info, &argc, nullptr, &this_arg, nullptr);
    ContentEmbedProxyWrapper* wrapper = nullptr;
    napi_unwrap(env, this_arg, reinterpret_cast<void**>(&wrapper));
    return wrapper;
}

ContentEmbed_ErrorCode ContentEmbedProxyWrapper::DoEditLive()
{
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = this->proxy_;
    }
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_DoEdit(proxy);
    OH_LOG_INFO(LOG_APP, "DoEdit (live) ret: %{public}d", errCode);
    return errCode;
}

ContentEmbed_ErrorCode ContentEmbedProxyWrapper::DoEditReactivated()
{
    const std::string sandboxPath = path_;
    // Detect OE-format extension without holding the c_str() pointer (which is invalidated
    // by any later std::string mutation); compare by suffix instead.
    const bool isOEFormat =
        sandboxPath.size() >= strlen(OE_FORMAT_FILE_EXT) &&
        sandboxPath.compare(sandboxPath.size() - strlen(OE_FORMAT_FILE_EXT),
                            strlen(OE_FORMAT_FILE_EXT), OE_FORMAT_FILE_EXT) == 0;
    ContentEmbed_Document* doc = nullptr;
    ContentEmbed_ErrorCode errCode;
    if (isOEFormat) {
        // 基于OE格式文件
        errCode = OH_ContentEmbed_LoadDocumentFromFile(sandboxPath.c_str(), sandboxPath.size(), &doc);
        OH_LOG_INFO(LOG_APP, "LoadDocumentFromFile ret: %{public}d", errCode);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "LoadDocumentFromFile failed: %{public}d", errCode);
        }
    } else {
        errCode = OH_ContentEmbed_CreateDocumentByFile(sandboxPath.c_str(), sandboxPath.size(), false, &doc);
        OH_LOG_INFO(LOG_APP, "CreateDocumentByFile ret: %{public}d", errCode);
        if (errCode != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "CreateDocumentByFile failed: %{public}d", errCode);
        }
    }
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = StartExtensionProxy(contextPtr_, doc);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = this->proxy_;
    }
    errCode = OH_ContentEmbed_Proxy_DoEdit(proxy);
    OH_LOG_INFO(LOG_APP, "DoEdit (reactivated) ret: %{public}d", errCode);
    return errCode;
}

napi_value ContentEmbedProxyWrapper::DoEdit(napi_env env)
{
    if (this == nullptr) {
        napi_value n;
        napi_create_int32(env, -1, &n);
        return n;
    }
    bool isLive;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        isLive = (proxy_ != nullptr);
    }
    ContentEmbed_ErrorCode errCode = isLive ? DoEditLive() : DoEditReactivated();
    if (isLive && errCode != CE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "DoEditLive failed (%{public}d), proxy may be stale, retrying via reactivated", errCode);
        EnterDormant(this);
        errCode = DoEditReactivated();
    }
    if (errCode == CE_ERR_OK) {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        editStarted_ = true;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

ContentEmbed_ErrorCode ContentEmbedProxyWrapper::RefreshSnapshot(ContentEmbed_ExtensionProxy* proxy)
{
    OH_PixelmapNative* pixelMap = nullptr;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Proxy_GetSnapshot(proxy, &pixelMap);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Refresh GetSnapshot failed: %{public}d", ret);
        return ret;
    }
    std::lock_guard<std::mutex> lk(g_proxyMutex);
    if (snapShot_ != nullptr) {
        OH_PixelmapNative_Release(snapShot_);
    }
    snapShot_ = pixelMap;
    return CE_ERR_OK;
}

ContentEmbed_ErrorCode ContentEmbedProxyWrapper::MaybeWriteSandboxIfIdle(ContentEmbed_Document* document)
{
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    bool editStartedLocal = false;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = this->proxy_;
        editStartedLocal = editStarted_;
    }
    if (proxy == nullptr) {
        return CE_ERR_OK;
    }
    bool isEditing = false;
    bool isModified = false;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Proxy_GetEditStatus(proxy, &isEditing, &isModified);
    OH_LOG_INFO(LOG_APP, "GetEditStatus ret: %{public}d, isEditing: %{public}d, isModified: %{public}d",
                ret, isEditing, isModified);
    if (ret != CE_ERR_OK || isEditing || !editStartedLocal) {
        return ret;
    }
    ContentEmbed_ErrorCode writeRet = WriteDocumentToSandbox(document, path_.c_str());
    if (writeRet != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Refresh WriteDocumentToSandbox failed: %{public}d", writeRet);
    }
    return writeRet;
}

napi_value ContentEmbedProxyWrapper::Refresh(napi_env env)
{
    if (this == nullptr) {
        napi_value n;
        napi_create_int32(env, -1, &n);
        return n;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = this->proxy_;
    }
    if (proxy == nullptr) {
        napi_value n;
        napi_create_int32(env, CE_ERR_OK, &n);
        return n;
    }
    ContentEmbed_Document* document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetDocument(proxy, &document);
    OH_LOG_INFO(LOG_APP, "Refresh GetDocument ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Refresh GetDocument failed: %{public}d", errCode);
        EnterDormant(this);
        napi_value n;
        napi_create_int32(env, errCode, &n);
        return n;
    }
    // Snapshot refresh is best-effort (non-fatal); errors are logged inside.
    RefreshSnapshot(proxy);
    ContentEmbed_ErrorCode writeRet = MaybeWriteSandboxIfIdle(document);
    // GetDocument succeeded (errCode == CE_ERR_OK) to reach here. Propagate the
    // sandbox/GetEditStatus result; GetDocument failure already returned above.
    ContentEmbed_ErrorCode finalRet = (writeRet != CE_ERR_OK) ? writeRet : errCode;
    napi_value result;
    napi_create_int32(env, finalRet, &result);
    return result;
}

static napi_value GetName(napi_env env, napi_callback_info info)
{
    auto wrapper = UnwrapThis(env, info);
    napi_value v;
    napi_create_string_utf8(env, wrapper ? wrapper->name_.c_str() : "", NAPI_AUTO_LENGTH, &v);
    return v;
}

static napi_value GetPath(napi_env env, napi_callback_info info)
{
    auto wrapper = UnwrapThis(env, info);
    napi_value v;
    napi_create_string_utf8(env, wrapper ? wrapper->path_.c_str() : "", NAPI_AUTO_LENGTH, &v);
    return v;
}

static napi_value GetSnapshotPath(napi_env env, napi_callback_info info)
{
    auto wrapper = UnwrapThis(env, info);
    napi_value v;
    napi_create_string_utf8(env, wrapper ? wrapper->snapshotPath_.c_str() : "", NAPI_AUTO_LENGTH, &v);
    return v;
}

static napi_value GetSnapshotUri(napi_env env, napi_callback_info info)
{
    auto wrapper = UnwrapThis(env, info);
    napi_value v;
    if (wrapper && !wrapper->snapshotUri_.empty() && access(wrapper->snapshotPath_.c_str(), R_OK) == 0) {
        napi_create_string_utf8(env, wrapper->snapshotUri_.c_str(), NAPI_AUTO_LENGTH, &v);
    } else {
        napi_get_undefined(env, &v);
    }
    return v;
}

napi_value ContentEmbedProxyWrapper::GetSnapshotImage(napi_env env)
{
    OH_PixelmapNative* snap = nullptr;
    if (this != nullptr) {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        snap = snapShot_;
    }
    if (snap == nullptr) {
        napi_value u;
        napi_get_undefined(env, &u);
        return u;
    }
    napi_value image;
    Image_ErrorCode retCode = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, snap, &image);
    if (retCode != Image_ErrorCode::IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ConvertPixelmapNativeToNapi failed: %{public}d", retCode);
        napi_value u;
        napi_get_undefined(env, &u);
        return u;
    }
    return image;
}

static napi_value IsAlive(napi_env env, napi_callback_info info)
{
    auto wrapper = UnwrapThis(env, info);
    bool alive = false;
    if (wrapper) {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        alive = wrapper->proxy_ != nullptr;
    }
    napi_value b;
    napi_get_boolean(env, alive, &b);
    return b;
}

using TsfnDispatch = void (*)(napi_env, napi_value, void*, void*);
static napi_status CreateThreadsafeFunction(napi_env env, const char* name,
    ContentEmbedProxyWrapper* wrapper, napi_threadsafe_function* existingTsfn,
    napi_ref* existingRef, TsfnDispatch dispatch)
{
    napi_value workName;
    napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &workName);
    if (*existingTsfn != nullptr) {
        napi_release_threadsafe_function(*existingTsfn, napi_tsfn_abort);
        *existingTsfn = nullptr;
    }
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, workName, 0, 1, nullptr,
        [](napi_env, void*, void*) {},
        wrapper,
        dispatch,
        existingTsfn);
    if (*existingRef != nullptr) {
        napi_delete_reference(env, *existingRef);
    }
    return status;
}

napi_value ContentEmbedProxyWrapper::SetOnUpdate(napi_env env, napi_value cb, napi_value thisArg)
{
    std::lock_guard<std::mutex> lk(g_proxyMutex);
    if (selfRef_ != nullptr) {
        napi_delete_reference(env, selfRef_);
    }
    napi_create_reference(env, thisArg, 0, &selfRef_);
    CreateThreadsafeFunction(env, "CEProxyOnUpdate", this, &onUpdateFunc_, &onUpdateRef_,
        [](napi_env env, napi_value /*js_cb*/, void* context, void* /*data*/) {
            auto wrapper = static_cast<ContentEmbedProxyWrapper*>(context);
            napi_value jsProxy;
            napi_get_reference_value(env, wrapper->selfRef_, &jsProxy);
            napi_valuetype vt = napi_undefined;
            if (jsProxy == nullptr ||
                (napi_typeof(env, jsProxy, &vt) == napi_ok && vt == napi_undefined)) {
                return;
            }
            napi_value cb;
            napi_get_reference_value(env, wrapper->onUpdateRef_, &cb);
            if (cb == nullptr) {
                return;
            }
            napi_value undefined;
            napi_get_undefined(env, &undefined);
            napi_call_function(env, undefined, cb, 1, &jsProxy, nullptr);
        });
    napi_create_reference(env, cb, 1, &onUpdateRef_);
    return nullptr;
}

napi_value ContentEmbedProxyWrapper::SetOnError(napi_env env, napi_value cb, napi_value thisArg)
{
    std::lock_guard<std::mutex> lk(g_proxyMutex);
    if (selfRef_ != nullptr) {
        napi_delete_reference(env, selfRef_);
    }
    napi_create_reference(env, thisArg, 0, &selfRef_);
    CreateThreadsafeFunction(env, "CEProxyOnError", this, &onErrorFunc_, &onErrorRef_,
        [](napi_env env, napi_value /*js_cb*/, void* context, void* data) {
            auto wrapper = static_cast<ContentEmbedProxyWrapper*>(context);
            napi_value jsProxy;
            napi_get_reference_value(env, wrapper->selfRef_, &jsProxy);
            napi_valuetype vt = napi_undefined;
            if (jsProxy == nullptr ||
                (napi_typeof(env, jsProxy, &vt) == napi_ok && vt == napi_undefined)) {
                return;
            }
            napi_value cb;
            napi_get_reference_value(env, wrapper->onErrorRef_, &cb);
            if (cb == nullptr) {
                return;
            }
            int32_t err = static_cast<int32_t>(reinterpret_cast<uintptr_t>(data));
            napi_value errVal;
            napi_create_int32(env, err, &errVal);
            // A local array avoids the C99 compound-literal extension that is
            // not standard C++.
            napi_value args[ON_ERROR_CB_ARG_COUNT] = {jsProxy, errVal};
            napi_value undefined;
            napi_get_undefined(env, &undefined);
            napi_call_function(env, undefined, cb, ON_ERROR_CB_ARG_COUNT, args, nullptr);
        });
    napi_create_reference(env, cb, 1, &onErrorRef_);
    return nullptr;
}

static void ReleaseWrapperRefs(napi_env env, ContentEmbedProxyWrapper* wrapper)
{
    if (wrapper->onUpdateFunc_) {
        napi_release_threadsafe_function(wrapper->onUpdateFunc_, napi_tsfn_abort);
        wrapper->onUpdateFunc_ = nullptr;
    }
    if (wrapper->onErrorFunc_) {
        napi_release_threadsafe_function(wrapper->onErrorFunc_, napi_tsfn_abort);
        wrapper->onErrorFunc_ = nullptr;
    }
    if (wrapper->onUpdateRef_) {
        napi_delete_reference(env, wrapper->onUpdateRef_);
        wrapper->onUpdateRef_ = nullptr;
    }
    if (wrapper->onErrorRef_) {
        napi_delete_reference(env, wrapper->onErrorRef_);
        wrapper->onErrorRef_ = nullptr;
    }
    if (wrapper->selfRef_) {
        napi_delete_reference(env, wrapper->selfRef_);
        wrapper->selfRef_ = nullptr;
    }
    if (wrapper->snapShot_) {
        OH_PixelmapNative_Release(wrapper->snapShot_);
        wrapper->snapShot_ = nullptr;
    }
}

napi_value ContentEmbedProxyWrapper::Destroy(napi_env env)
{
    destroyed_ = true;
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        proxy = this->proxy_;
        if (proxy != nullptr) {
            g_proxyByHandle.erase(proxy);
            this->proxy_ = nullptr;
        }
        // snapShot_ (if any) is released by ReleaseWrapperRefs below; do NOT null it
        // here first, otherwise the release branch is skipped and the pixelmap leaks.
        ReleaseWrapperRefs(env, this);
    }
    if (proxy != nullptr) {
        OH_ContentEmbed_Proxy_StopWork(proxy);
        OH_ContentEmbed_DestroyExtensionProxy(proxy);
    }
    if (ownedDocument_ != nullptr) {
        // NOT a leak: DestroyExtensionProxy already freed the document (it deletes
        // proxy->ceDocument internally, see commit 6571477). Only clear the pointer.
        ownedDocument_ = nullptr;
    }
    OH_LOG_INFO(LOG_APP, "CEProxy destroyed: %{public}p", this);
    return nullptr;
}

static void Finalizer(napi_env env, void* data, void* /*hint*/)
{
    auto wrapper = static_cast<ContentEmbedProxyWrapper*>(data);
    if (wrapper == nullptr) {
        return;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_proxyMutex);
        if (!wrapper->destroyed_ && wrapper->proxy_) {
            OH_LOG_WARN(LOG_APP, "proxy %{public}p finalized without explicit destroy - fallback cleanup",
                        wrapper->proxy_);
            proxy = wrapper->proxy_;
            g_proxyByHandle.erase(proxy);
            wrapper->proxy_ = nullptr;
        }
        ReleaseWrapperRefs(env, wrapper);
    }
    if (proxy != nullptr) {
        OH_ContentEmbed_Proxy_StopWork(proxy);
        OH_ContentEmbed_DestroyExtensionProxy(proxy);
    }
    if (wrapper->ownedDocument_ != nullptr) {
        // NOT a leak: DestroyExtensionProxy already freed the document (it deletes
        // proxy->ceDocument internally, see commit 6571477). Only clear the pointer.
        wrapper->ownedDocument_ = nullptr;
    }
    delete wrapper;
}

static napi_value SetOnUpdateCb(napi_env env, napi_callback_info info)
{
    size_t argc = SINGLE_PROXY_ARG_COUNT;
    napi_value args[SINGLE_PROXY_ARG_COUNT] = {nullptr};
    napi_value thisArg = nullptr;
    napi_get_cb_info(env, info, &argc, args, &thisArg, nullptr);
    auto wrapper = UnwrapThis(env, info);
    if (wrapper == nullptr || argc < SINGLE_PROXY_ARG_COUNT) {
        return nullptr;
    }
    napi_valuetype vt = napi_undefined;
    napi_typeof(env, args[0], &vt);
    if (vt != napi_function) {
        return nullptr;
    }
    return wrapper->SetOnUpdate(env, args[0], thisArg);
}

static napi_value SetOnErrorCb(napi_env env, napi_callback_info info)
{
    size_t argc = SINGLE_PROXY_ARG_COUNT;
    napi_value args[SINGLE_PROXY_ARG_COUNT] = {nullptr};
    napi_value thisArg = nullptr;
    napi_get_cb_info(env, info, &argc, args, &thisArg, nullptr);
    auto wrapper = UnwrapThis(env, info);
    if (wrapper == nullptr || argc < SINGLE_PROXY_ARG_COUNT) {
        return nullptr;
    }
    napi_valuetype vt = napi_undefined;
    napi_typeof(env, args[0], &vt);
    if (vt != napi_function) {
        return nullptr;
    }
    return wrapper->SetOnError(env, args[0], thisArg);
}

static napi_value BuildProxyObject(napi_env env, ContentEmbedProxyWrapper* wrapper)
{
    napi_value obj;
    napi_create_object(env, &obj);

    auto bindFn = [env, &obj](const char* name, napi_callback cb) {
        napi_value fn;
        napi_create_function(env, name, NAPI_AUTO_LENGTH, cb, nullptr, &fn);
        napi_set_named_property(env, obj, name, fn);
    };
    bindFn("doEdit", [](napi_env env, napi_callback_info info) -> napi_value {
        auto wrapper = UnwrapThis(env, info);
        return wrapper ? wrapper->DoEdit(env) : nullptr;
    });
    bindFn("refresh", [](napi_env env, napi_callback_info info) -> napi_value {
        auto wrapper = UnwrapThis(env, info);
        return wrapper ? wrapper->Refresh(env) : nullptr;
    });
    bindFn("getSnapshot", [](napi_env env, napi_callback_info info) -> napi_value {
        auto wrapper = UnwrapThis(env, info);
        return wrapper ? wrapper->GetSnapshotImage(env) : nullptr;
    });
    bindFn("getSnapshotUri", GetSnapshotUri);
    bindFn("getName", GetName);
    bindFn("getPath", GetPath);
    bindFn("getSnapshotPath", GetSnapshotPath);
    bindFn("isAlive", IsAlive);
    bindFn("setOnUpdate", SetOnUpdateCb);
    bindFn("setOnError", SetOnErrorCb);
    bindFn("destroy", [](napi_env env, napi_callback_info info) -> napi_value {
        auto wrapper = UnwrapThis(env, info);
        return wrapper ? wrapper->Destroy(env) : nullptr;
    });

    napi_wrap(env, obj, wrapper, Finalizer, nullptr, nullptr);
    return obj;
}

static void* UnwrapContext(napi_env env, napi_value ctxVal)
{
    void* contextPtr = nullptr;
    napi_unwrap(env, ctxVal, &contextPtr);
    return contextPtr;
}

static void InitSnapshotUri(ContentEmbedProxyWrapper* wrapper)
{
    if (!wrapper->snapshotPath_.empty()) {
        wrapper->snapshotUri_ = std::string(FILE_URI_SCHEME) + wrapper->snapshotPath_;
    }
}

static std::string SnapshotPathFromBin(const std::string& binPath)
{
    std::string sp = binPath;
    size_t dot = sp.find_last_of('.');
    if (dot != std::string::npos) {
        sp.replace(dot, std::string::npos, SNAPSHOT_FILE_EXT);
    } else {
        sp += SNAPSHOT_FILE_EXT;
    }
    return sp;
}

static std::string LookupDisplayName(const std::string& oeid)
{
    std::string displayName = oeid;
    ContentEmbed_Format* format = nullptr;
    ContentEmbed_ErrorCode fmtErr = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    if (fmtErr != CE_ERR_OK || format == nullptr) {
        return displayName;
    }
    fmtErr = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid.c_str(), DEFAULT_LOCALE, format);
    if (fmtErr == CE_ERR_OK) {
        // Zero-initialized so `displayName = name` stays NUL-terminated even when
        // the getter fails and leaves the buffers untouched (getter contract gives
        // no NUL-termination guarantee on failure).
        char name[MAX_NAME_LENGTH] = {0};
        char description[MAX_DESCRIPTION_LENGTH] = {0};
        if (OH_ContentEmbed_GetNameAndDescriptionFromFormat(format, name, description) == CE_ERR_OK) {
            displayName = name;
        }
    }
    OH_ContentEmbed_DestroyContentEmbedFormat(format);
    return displayName;
}

napi_value content_embed::CreateByOEid(napi_env env, napi_callback_info info)
{
    size_t argc = CREATE_BY_OEID_ARG_COUNT;
    napi_value args[CREATE_BY_OEID_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < CREATE_BY_OEID_ARG_COUNT) {
        return GetResult(env, -1);
    }
    void* contextPtr = UnwrapContext(env, args[0]);
    std::string oeid;
    std::string sandboxPath;
    if (!TakeStringParam(env, args[ARG_INDEX_ONE], oeid) || !TakeStringParam(env, args[ARG_INDEX_TWO], sandboxPath)) {
        return GetResult(env, -1);
    }
    ContentEmbed_Document* doc = nullptr;
    // 基于OEID创建OE文件
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid.c_str(), &doc);
    OH_LOG_INFO(LOG_APP, "CreateDocumentByOEid ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateDocumentByOEid failed, errCode: %{public}d.", errCode);
        return GetResult(env, errCode);
    }
    std::string displayName = LookupDisplayName(oeid);
    auto wrapper = new ContentEmbedProxyWrapper();
    wrapper->contextPtr_ = contextPtr;
    wrapper->path_ = sandboxPath;
    wrapper->name_ = displayName;
    wrapper->snapshotPath_ = SnapshotPathFromBin(sandboxPath);
    InitSnapshotUri(wrapper);

    errCode = wrapper->StartExtensionProxy(contextPtr, doc);
    if (errCode != CE_ERR_OK) {
        delete wrapper;
        return GetResult(env, errCode);
    }
    return GetResult(env, CE_ERR_OK, BuildProxyObject(env, wrapper));
}

namespace {
ContentEmbed_ErrorCode PersistAndActivatePickerUri(const std::string &fileUri)
{
    if (fileUri.empty()) {
        OH_LOG_ERROR(LOG_APP, "PersistAndActivatePickerUri: empty uri");
        return CE_ERR_PARAM_INVALID;
    }
    FileShare_PolicyInfo policy;
    // operationMode is a bit field: READ_MODE (1<<0) | WRITE_MODE (1<<1) = 3.
    policy.uri = const_cast<char *>(fileUri.c_str());
    policy.length = static_cast<unsigned int>(fileUri.size());
    policy.operationMode = FileShare_OperationMode::READ_MODE | FileShare_OperationMode::WRITE_MODE;

    FileShare_PolicyErrorResult *result = nullptr;
    unsigned int resultNum = 0;
    auto ret = OH_FileShare_PersistPermission(&policy, 1, &result, &resultNum);
    OH_LOG_INFO(LOG_APP, "OH_FileShare_PersistPermission ret: %{public}d, resultNum: %{public}u", ret, resultNum);
    if (ret != 0) {
        for (unsigned int i = 0; i < resultNum; i++) {
            OH_LOG_ERROR(LOG_APP, "persist fail uri: %{public}s code: %{public}d msg: %{public}s",
                result[i].uri, result[i].code, result[i].message);
        }
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
        return CE_ERR_FILE_OPERATION_FAILED;
    }
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    result = nullptr;
    resultNum = 0;

    // ActivatePermission must be called after PersistPermission for the grant to take
    // effect in the current process; persist alone leaves it unloaded.
    ret = OH_FileShare_ActivatePermission(&policy, 1, &result, &resultNum);
    OH_LOG_INFO(LOG_APP, "OH_FileShare_ActivatePermission ret: %{public}d, resultNum: %{public}u", ret, resultNum);
    if (ret != 0) {
        for (unsigned int i = 0; i < resultNum; i++) {
            OH_LOG_ERROR(LOG_APP, "activate fail uri: %{public}s code: %{public}d msg: %{public}s",
                result[i].uri, result[i].code, result[i].message);
        }
        OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
        return CE_ERR_FILE_OPERATION_FAILED;
    }
    OH_FileShare_ReleasePolicyErrorResult(result, resultNum);
    return CE_ERR_OK;
}

// Parse the (ctx, srcPath, sandboxPath, fileUri?, isLinking?) args of CreateFromLocal.
// Returns true on success. fileUri is left empty when only 3 args are passed; isLinking
// defaults to false when fewer than 5 args are passed.
bool ParseCreateFromLocalArgs(napi_env env, napi_callback_info info, void* &contextPtr,
    std::string &srcPath, std::string &sandboxPath, std::string &fileUri, bool &isLinking)
{
    size_t argc = CREATE_FROM_LOCAL_ARG_COUNT;
    napi_value args[CREATE_FROM_LOCAL_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < CREATE_FROM_LOCAL_REQUIRED_ARG_COUNT) {
        return false;
    }
    contextPtr = UnwrapContext(env, args[0]);
    if (!TakeStringParam(env, args[ARG_INDEX_ONE], srcPath) ||
        !TakeStringParam(env, args[ARG_INDEX_TWO], sandboxPath)) {
        return false;
    }
    if (argc > CREATE_FROM_LOCAL_FILEURI_INDEX &&
        !TakeStringParam(env, args[CREATE_FROM_LOCAL_FILEURI_INDEX], fileUri)) {
        return false;
    }
    isLinking = false;
    if (argc > CREATE_FROM_LOCAL_ISLINKING_INDEX) {
        napi_get_value_bool(env, args[CREATE_FROM_LOCAL_ISLINKING_INDEX], &isLinking);
    }
    return true;
}
} // namespace

napi_value content_embed::CreateFromLocal(napi_env env, napi_callback_info info)
{
    void* contextPtr = nullptr;
    std::string srcPath;
    std::string sandboxPath;
    std::string fileUri;
    bool isLinking = false;
    if (!ParseCreateFromLocalArgs(env, info, contextPtr, srcPath, sandboxPath, fileUri, isLinking)) {
        return GetResult(env, -1);
    }

    if (access(srcPath.c_str(), R_OK | W_OK)) {
        return GetResult(env, CE_ERR_FILE_OPERATION_FAILED);
    }
    // Linking mode: the SA's CheckClientFileValid checks that nativeFileUri (derived
    // from srcPath) passes CheckUriAuthorization.
    if (isLinking) {
        ContentEmbed_ErrorCode persistErr = PersistAndActivatePickerUri(fileUri);
        if (persistErr != CE_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "PersistAndActivatePickerUri failed: %{public}d", persistErr);
            return GetResult(env, persistErr);
        }
    }
    // 基于文件创建OE文档
    // 是否以链接形式创建OE文档，当isLinking为true时，表示以链接方式创建OE文档；当isLinking为false时，表示以嵌入方式创建OE文档。
    ContentEmbed_Document* doc = nullptr;
    ContentEmbed_ErrorCode errCode =
        OH_ContentEmbed_CreateDocumentByFile(srcPath.c_str(), srcPath.size(), isLinking, &doc);
    OH_LOG_INFO(LOG_APP, "CreateDocumentByFile ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "CreateDocumentByFile failed: %{public}d", errCode);
        return GetResult(env, errCode);
    }
    auto wrapper = new ContentEmbedProxyWrapper();
    wrapper->contextPtr_ = contextPtr;
    wrapper->path_ = sandboxPath;
    size_t slash = srcPath.find_last_of('/');
    wrapper->name_ = (slash != std::string::npos) ? srcPath.substr(slash + 1) : srcPath;
    wrapper->snapshotPath_ = SnapshotPathFromBin(sandboxPath);
    InitSnapshotUri(wrapper);

    errCode = wrapper->StartExtensionProxy(contextPtr, doc);
    if (errCode != CE_ERR_OK) {
        delete wrapper;
        return GetResult(env, errCode);
    }
    return GetResult(env, CE_ERR_OK, BuildProxyObject(env, wrapper));
}

napi_value content_embed::CreateDormant(napi_env env, napi_callback_info info)
{
    size_t argc = CREATE_DORMANT_ARG_COUNT;
    napi_value args[CREATE_DORMANT_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < CREATE_DORMANT_ARG_COUNT) {
        return GetResult(env, -1);
    }
    void* contextPtr = UnwrapContext(env, args[0]);
    std::string name;
    std::string path;
    std::string snapshotPath;
    if (!TakeStringParam(env, args[ARG_INDEX_ONE], name) ||
        !TakeStringParam(env, args[ARG_INDEX_TWO], path) ||
        !TakeStringParam(env, args[ARG_INDEX_THREE], snapshotPath)) {
        return GetResult(env, -1);
    }

    auto wrapper = new ContentEmbedProxyWrapper();
    wrapper->contextPtr_ = contextPtr;
    wrapper->name_ = name;
    wrapper->path_ = path;
    if (!snapshotPath.empty() && snapshotPath[0] == '/') {
        wrapper->snapshotPath_ = snapshotPath;
    } else {
        size_t slash = wrapper->path_.find_last_of('/');
        std::string dir = (slash != std::string::npos) ? wrapper->path_.substr(0, slash) : "";
        wrapper->snapshotPath_ = dir + "/" + snapshotPath;
    }
    InitSnapshotUri(wrapper);
    return GetResult(env, CE_ERR_OK, BuildProxyObject(env, wrapper));
}
