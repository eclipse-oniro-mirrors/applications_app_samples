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

// [Start content_embed_server_include_headers]
#include <cstdint>
#include <string>
#include <vector>
#include <unordered_map>
#include <fstream>
#include <hilog/log.h>
#include <AbilityKit/ability_base/want.h>
#include <AbilityKit/ability_runtime/application_context.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include <filemanagement/file_uri/oh_file_uri.h>
#include <multimedia/image_framework/image/image_source_native.h>
// [End content_embed_server_include_headers]

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xF811  // Global domain macro, identifies the business area
#define LOG_TAG "[Sample_OEServerDemo]"   // Global tag macro, identifies the module log tag

constexpr const char* DOC_STREAM_NAME = "aaa";
// OH_AbilityBase_CreateWant stores the char* pointer (no deep copy); the buffer
// supplied via AbilityBase_Element.bundleName must outlive every later use of the
// Want (e.g. ContextStartSelfUIAbility). Keep it on NativeOnDoEdit's stack frame.
constexpr uint32_t BUNDLE_NAME_BUFFER_SIZE = 100;

// [Start content_embed_server_global_variable]
static ContentEmbed_ExtensionInstanceHandle g_instance = nullptr;
// [End content_embed_server_global_variable]

struct ObjectEditState {
    bool isEditing = false;
    bool isModified = false;
};

// OE Extension callbacks (OnCreate/OnObjectAttach/...) and NAPI entry points
// (save/update/start/stop/isObjectAlive) both touch these maps. The ContentEmbed
// runtime serializes extension callbacks, and NAPI calls are dispatched on the
// JS thread; cross-thread access is not expected. If that assumption changes,
// guard both maps with a std::mutex.
static std::unordered_map<std::string, ContentEmbed_ObjectHandle> g_objectByKey;
static std::unordered_map<ContentEmbed_ObjectHandle, ObjectEditState> g_editState;

static ContentEmbed_ErrorCode WriteFileToStream(ContentEmbed_Stream *stream, const std::string &filePath);
static ContentEmbed_ErrorCode OpenOrCreateChildStream(ContentEmbed_Document *document,
                                                      ContentEmbed_Stream **stream);

// Forward declarations: RegisterOnObjectAttachFunc references these before their definitions.
static void NativeOnWriteToDataStream(ContentEmbed_ObjectHandle object);
static void NativeOnGetCapability(ContentEmbed_ObjectHandle object, uint32_t *bitmask);
static void NativeOnDoEdit(ContentEmbed_ObjectHandle object);
static void NativeOnGetSnapshot(ContentEmbed_ObjectHandle object);
static void NativeOnGetEditStatusFunc(ContentEmbed_ObjectHandle object, bool *isEditing, bool *isModified);

// [Start content_embed_server_on_create_destroy]
static void NativeOnCreate(ContentEmbed_ExtensionInstanceHandle instance, AbilityBase_Want *want)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnCreate");
}

static void NativeOnDestroy(ContentEmbed_ExtensionInstanceHandle instance)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnDestroy");
}
// [End content_embed_server_on_create_destroy]

// [Start content_embed_server_on_object_attach_detach]
static void RegisterOnObjectAttachFunc(ContentEmbed_ExtensionInstanceHandle instance, ContentEmbed_ObjectHandle object)
{
    // [StartExclude content_embed_server_on_object_attach_detach]
    std::string objectKey = std::to_string(reinterpret_cast<uintptr_t>(object));
    OH_LOG_INFO(LOG_APP, "enter RegisterOnObjectAttachFunc object %{public}p key:%{public}s",
        object, objectKey.c_str());
    g_objectByKey[objectKey] = object;
    g_editState[object] = ObjectEditState{};
    // [EndExclude content_embed_server_on_object_attach_detach]
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    // 当OE文档是通过文件创建的时候执行该回调函数
    ret = OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(object, NativeOnWriteToDataStream);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // 获取当前OE Extension的能力
    ret = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(object, NativeOnGetCapability);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // OE文档触发编辑操作
    ret = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(object, NativeOnDoEdit);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnDoEditFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // OE文档请求获取快照
    ret = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(object, NativeOnGetSnapshot);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // OE文档查询当前编辑状态
    ret = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(object, NativeOnGetEditStatusFunc);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP,
            "OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc failed, errCode: %{public}d.", ret);
        return;
    }
}

static void RegisterOnObjectDetachFunc(ContentEmbed_ExtensionInstanceHandle instance, ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "enter RegisterOnObjectDetachFunc");
    // [StartExclude content_embed_server_on_object_attach_detach]
    std::string objectKey = std::to_string(reinterpret_cast<uintptr_t>(object));
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectDetachFunc object %{public}p key:%{public}s",
        object, objectKey.c_str());
    g_objectByKey.erase(objectKey);
    g_editState.erase(object);
    // [EndExclude content_embed_server_on_object_attach_detach]
}
// [End content_embed_server_on_object_attach_detach]

// [Start content_embed_server_on_get_snapshot]
static void NativeOnGetSnapshot(ContentEmbed_ObjectHandle object)
{
    // [StartExclude content_embed_server_on_get_snapshot]
    OH_LOG_INFO(LOG_APP, "enter NativeOnGetSnapshot %{public}p", object);
    // [EndExclude content_embed_server_on_get_snapshot]
    std::string objectKey = std::to_string(reinterpret_cast<uintptr_t>(object));
    std::string path = "/data/storage/el2/base/haps/entry/temp/web_snapshot_" + objectKey + ".png";
    // 判断当前是否有UI生成的缩略图
    FILE *srcFile = fopen(path.c_str(), "rb");
    if (!srcFile) {
        OH_LOG_ERROR(LOG_APP, "Open file failed");
        return;
    }
    int fd = fileno(srcFile);
    // 创建ImageSource实例。
    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &source);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_ImageSourceNative_CreateFromFd failed, errCode: %{public}d.", errCode);
        if (fclose(srcFile) != 0) {
            OH_LOG_ERROR(LOG_APP, "NativeOnGetSnapshot fclose failed after CreateFromFd.");
        }
        return;
    }
    // 通过图片解码参数创建PixelMap对象。
    OH_DecodingOptions *ops = nullptr;
    OH_DecodingOptions_Create(&ops);
    // 设置为AUTO会根据图片资源格式解码，如果图片资源为HDR资源则会解码为HDR的pixelmap。
    OH_DecodingOptions_SetDesiredDynamicRange(ops, IMAGE_DYNAMIC_RANGE_AUTO);
    OH_PixelmapNative *resPixMap = nullptr;
    // ops参数支持传入nullptr, 当不需要设置解码参数时，不用创建。
    errCode = OH_ImageSourceNative_CreatePixelmap(source, ops, &resPixMap);
    OH_DecodingOptions_Release(ops);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_ImageSourceNative_CreatePixelmap failed, errCode: %{public}d.", errCode);
        OH_ImageSourceNative_Release(source);
        if (fclose(srcFile) != 0) {
            OH_LOG_ERROR(LOG_APP, "NativeOnGetSnapshot fclose failed after CreatePixelmap.");
        }
        return;
    }
    // 设置快照
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_SetSnapshot(object, resPixMap);
    // 释放ImageSource实例。
    OH_ImageSourceNative_Release(source);
    OH_PixelmapNative_Release(resPixMap);
    if (fclose(srcFile) != 0) {
        OH_LOG_ERROR(LOG_APP, "NativeOnGetSnapshot fclose failed.");
    }
}
// [End content_embed_server_on_get_snapshot]

constexpr const char* TEMP_CACHE_PATH_PREFIX = "/data/storage/el2/base/cache/temp_";
static void SetTempWantUri(AbilityBase_Want *want, const std::string &objectKey)
{
    std::string tempPath = std::string(TEMP_CACHE_PATH_PREFIX) + objectKey + ".aaa";
    char *tempFileUri = nullptr;
    OH_FileUri_GetUriFromPath(tempPath.c_str(), tempPath.size(), &tempFileUri);
    if (tempFileUri != nullptr) {
        OH_AbilityBase_SetWantUri(want, tempFileUri);
        free(tempFileUri);
    } else {
        OH_LOG_ERROR(LOG_APP, "SetTempWantUri GetUriFromPath returned null: %{public}s", tempPath.c_str());
    }
}

static AbilityBase_Want* PrepareDoEditWant(ContentEmbed_Document* ceDocument, const std::string& objectKey,
                                           char* bundleNameBuffer, uint32_t bundleNameBufferSize)
{
    char oeid[MAX_OEID_LENGTH];
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Document_GetOEid(ceDocument, oeid);
    OH_LOG_INFO(LOG_APP, "Document_GetOEid ret: %{public}d, oeid: %{public}s", ret, oeid);
    int32_t writeLen = 0;
    AbilityRuntime_ErrorCode abilityCode =
        OH_AbilityRuntime_ApplicationContextGetBundleName(bundleNameBuffer, bundleNameBufferSize, &writeLen);
    if (abilityCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "OnCreate get bundleName failed: %{public}d", abilityCode);
        return nullptr;
    }
    const char* moduleName = "entry";
    const char* abilityName = "EntryAbility";
    AbilityBase_Element element = {
        .bundleName = bundleNameBuffer,
        .moduleName = const_cast<char*>(moduleName),
        .abilityName = const_cast<char*>(abilityName),
    };
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    if (want == nullptr) {
        OH_LOG_ERROR(LOG_APP, "NativeOnDoEdit CreateWant failed");
        return nullptr;
    }
    OH_AbilityBase_SetWantBoolParam(want, "isContentEmbed", true);
    OH_AbilityBase_SetWantCharParam(want, "id", objectKey.c_str());
    OH_AbilityBase_SetWantCharParam(want, "specifiedFlag", objectKey.c_str());
    return want;
}

static bool WriteEmbeddedDocToTemp(ContentEmbed_Stream* childStream, AbilityBase_Want* want,
                                   const std::string& objectKey)
{
    size_t bufferSize = 0;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Stream_GetSize(childStream, &bufferSize);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Stream_GetSize failed, errCode: %{public}d.", ret);
        return false;
    }
    ret = OH_ContentEmbed_Stream_Seek(childStream, 0);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Stream_Seek failed, errCode: %{public}d.", ret);
        return false;
    }
    unsigned char* buffer = nullptr;
    size_t num = 0;
    ret = OH_ContentEmbed_Stream_Read(childStream, &buffer, bufferSize, &num);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Stream_Read failed, errCode: %{public}d.", ret);
        return false;
    }
    std::string tempPath = std::string(TEMP_CACHE_PATH_PREFIX) + objectKey + ".aaa";
    std::ofstream outputFile(tempPath, std::ios::out | std::ios::binary);
    if (outputFile.is_open()) {
        outputFile.write(reinterpret_cast<const char*>(buffer), bufferSize);
        outputFile.close();
        OH_LOG_INFO(LOG_APP, "Write data successful.");
    } else {
        OH_LOG_ERROR(LOG_APP, "Cannot open output file.");
    }
    SetTempWantUri(want, objectKey);
    return true;
}

static void WriteLinkingDocToTemp(ContentEmbed_Document* ceDocument, AbilityBase_Want* want,
                                  const std::string& objectKey)
{
    SetTempWantUri(want, objectKey);
    char nativeFilePath[MAX_PATH_LENGTH] = {0};
    ContentEmbed_ErrorCode pathRet = OH_ContentEmbed_Document_GetNativeFilePath(ceDocument, nativeFilePath);
    if (pathRet != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "GetNativeFilePath failed, errCode: %{public}d.", pathRet);
        return;
    }
    std::string srcPath(nativeFilePath);
    std::ifstream oriFile(srcPath, std::ios::binary);
    if (!oriFile.is_open()) {
        OH_LOG_ERROR(LOG_APP, "linking doc open native file failed: %{public}s", srcPath.c_str());
        return;
    }
    oriFile.seekg(0, std::ios::end);
    size_t fileSize = static_cast<size_t>(oriFile.tellg());
    oriFile.seekg(0, std::ios::beg);
    std::vector<unsigned char> buffer(fileSize);
    oriFile.read(reinterpret_cast<char*>(buffer.data()), fileSize);
    std::string tempPath = std::string(TEMP_CACHE_PATH_PREFIX) + objectKey + ".aaa";
    std::ofstream outputFile(tempPath, std::ios::out | std::ios::binary);
    if (outputFile.is_open()) {
        outputFile.write(reinterpret_cast<const char*>(buffer.data()), fileSize);
        outputFile.close();
        OH_LOG_INFO(LOG_APP, "linking doc write successful: %{public}s", tempPath.c_str());
        OH_AbilityBase_SetWantCharParam(want, "originalFilePath", srcPath.c_str());
    } else {
        OH_LOG_ERROR(LOG_APP, "linking doc cannot open output file.");
    }
}

static bool AcquireDoEditResources(ContentEmbed_ObjectHandle object, const std::string& objectKey,
                                   ContentEmbed_Document** doc, ContentEmbed_ExtensionContextHandle* ctx,
                                   AbilityBase_Want** want, char* bundleNameBuffer,
                                   uint32_t bundleNameBufferSize)
{
    *doc = nullptr;
    *ctx = nullptr;
    *want = nullptr;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_GetContentEmbedDocument(object, doc);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_GetContentEmbedDocument failed, errCode: %{public}d.", ret);
        return false;
    }
    ret = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instance, ctx);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_GetContentEmbedContext failed, errCode: %{public}d.", ret);
        return false;
    }
    *want = PrepareDoEditWant(*doc, objectKey, bundleNameBuffer, bundleNameBufferSize);
    return *want != nullptr;
}

// [Start content_embed_server_on_do_edit]
static void NativeOnDoEdit(ContentEmbed_ObjectHandle object)
{
    // [StartExclude content_embed_server_on_do_edit]
    OH_LOG_INFO(LOG_APP, "enter NativeOnDoEdit object %{public}p", object);
    std::string objectKey = std::to_string(reinterpret_cast<uintptr_t>(object));
    char bundleNameBuffer[BUNDLE_NAME_BUFFER_SIZE] = {};
    // [EndExclude content_embed_server_on_do_edit]
    ContentEmbed_Document* ceDocument = nullptr;
    ContentEmbed_ExtensionContextHandle context = nullptr;
    AbilityBase_Want* want = nullptr;
    // 获取ceDocument、context、设置want
    // [StartExclude content_embed_server_on_do_edit]
    if (!AcquireDoEditResources(object, objectKey, &ceDocument, &context, &want,
                                 bundleNameBuffer, BUNDLE_NAME_BUFFER_SIZE)) {
        return;
    }
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    ContentEmbed_Storage* rootStorage = nullptr;
    ret = OH_ContentEmbed_Document_GetRootStorage(ceDocument, &rootStorage);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Document_GetRootStorage failed, errCode: %{public}d.", ret);
        OH_AbilityBase_DestroyWant(want);
        return;
    }
    ContentEmbed_Stream* childStream = nullptr;
    ret = OH_ContentEmbed_Storage_GetStream(rootStorage, DOC_STREAM_NAME, &childStream);
    if (ret == CE_ERR_OK) {
        if (!WriteEmbeddedDocToTemp(childStream, want, objectKey)) {
            OH_AbilityBase_DestroyWant(want);
            OH_ContentEmbed_DestroyStream(childStream);
            OH_ContentEmbed_DestroyStorage(rootStorage);
            return;
        }
    } else {
        WriteLinkingDocToTemp(ceDocument, want, objectKey);
    }
    // [EndExclude content_embed_server_on_do_edit]
    // 启动UIAbility 对文档进行编辑操作
    ret = OH_ContentEmbed_Extension_ContextStartSelfUIAbility(context, want);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_ContextStartSelfUIAbility failed, errCode: %{public}d.", ret);
        OH_AbilityBase_DestroyWant(want);
        OH_ContentEmbed_DestroyStorage(rootStorage);
        if (childStream != nullptr) {
            OH_ContentEmbed_DestroyStream(childStream);
        }
        return;
    }
    OH_AbilityBase_DestroyWant(want);
    OH_ContentEmbed_DestroyStorage(rootStorage);
    if (childStream != nullptr) {
        OH_ContentEmbed_DestroyStream(childStream);
    }
    // [StartExclude content_embed_server_on_do_edit]
    g_editState[object].isEditing = true;
    OH_LOG_INFO(LOG_APP, "ContextStartSelfUIAbility ret: %{public}d", ret);
    // [EndExclude content_embed_server_on_do_edit]
}
// [End content_embed_server_on_do_edit]

// [Start content_embed_server_on_get_capability]
static void NativeOnGetCapability(ContentEmbed_ObjectHandle object, uint32_t *bitmask)
{
    if (!bitmask) {
        OH_LOG_ERROR(LOG_APP, "bitmask is null");
        return;
    }
    *bitmask = CE_CAPABILITY_SUPPORT_SNAPSHOT | CE_CAPABILITY_SUPPORT_DO_EDIT;
}
// [End content_embed_server_on_get_capability]

// [Start content_embed_server_on_get_edit_status]
static void NativeOnGetEditStatusFunc(ContentEmbed_ObjectHandle object, bool *isEditing, bool *isModified)
{
    if (!isEditing || !isModified) {
        OH_LOG_ERROR(LOG_APP, "param is null");
        return;
    }
    // 若文档未处于编辑态
    *isEditing = false;
    *isModified = false;
    // [StartExclude content_embed_server_on_get_edit_status]
    *isEditing = g_editState[object].isEditing;
    *isModified = g_editState[object].isModified;
    OH_LOG_INFO(LOG_APP, "NativeOnGetEditStatusFunc %{public}p isEditing:%{public}d, isModified:%{public}d",
                object, *isEditing, *isModified);
    // [EndExclude content_embed_server_on_get_edit_status]
}
// [End content_embed_server_on_get_edit_status]

// [Start content_embed_server_on_write_to_data_stream]
// 获取名字为aaa的流
constexpr const char* DOCUMENT_STREAM_NAME = "aaa";
static ContentEmbed_ErrorCode OpenOrCreateChildStream(ContentEmbed_Document *document,
                                                      ContentEmbed_Stream **stream)
{
    ContentEmbed_Storage *rootStorage = nullptr;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    if (ret != CE_ERR_OK || rootStorage == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OpenOrCreateChildStream GetRootStorage failed: %{public}d", ret);
        return ret;
    }
    ret = OH_ContentEmbed_Storage_GetStream(rootStorage, DOCUMENT_STREAM_NAME, stream);
    if (ret != CE_ERR_OK) {
        ret = OH_ContentEmbed_Storage_CreateStream(rootStorage, DOCUMENT_STREAM_NAME, stream);
    }
    OH_ContentEmbed_DestroyStorage(rootStorage);
    if (ret != CE_ERR_OK || *stream == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OpenOrCreateChildStream open/create stream failed: %{public}d", ret);
        if (*stream != nullptr) {
            OH_ContentEmbed_DestroyStream(*stream);
            *stream = nullptr;
        }
        return ret;
    }
    return CE_ERR_OK;
}

static ContentEmbed_ErrorCode WriteFileToStream(ContentEmbed_Stream *stream, const std::string &filePath)
{
    std::ifstream oriFile(filePath, std::ios::binary);
    if (!oriFile) {
        OH_LOG_ERROR(LOG_APP, "WriteFileToStream open file failed: %{public}s", filePath.c_str());
        return CE_ERR_FILE_OPERATION_FAILED;
    }
    oriFile.seekg(0, std::ios::end);
    size_t oriFileSize = static_cast<size_t>(oriFile.tellg());
    oriFile.seekg(0, std::ios::beg);
    std::vector<unsigned char> buffer(oriFileSize);
    oriFile.read(reinterpret_cast<char *>(buffer.data()), static_cast<std::streamsize>(oriFileSize));
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Stream_Seek(stream, 0);
    OH_LOG_INFO(LOG_APP, "WriteFileToStream Seek ret: %{public}d", ret);
    size_t num = 0;
    ret = OH_ContentEmbed_Stream_Write(stream, buffer.data(), oriFileSize, &num);
    OH_LOG_INFO(LOG_APP, "WriteFileToStream Write ret: %{public}d, num: %{public}zu", ret, num);
    return ret;
}

static void NativeOnWriteToDataStream(ContentEmbed_ObjectHandle object)
{
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    ContentEmbed_Document* ceDocument = nullptr;
    // 获取OE文档
    ret = OH_ContentEmbed_Extension_GetContentEmbedDocument(object, &ceDocument);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_GetContentEmbedDocument ret: %{public}d", ret);
        return;
    }
    ContentEmbed_Stream* destStream = nullptr;
    ret = OpenOrCreateChildStream(ceDocument, &destStream);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OpenOrCreateChildStream failed: %{public}d", ret);
        return;
    }
    // 获取本地文件路径
    char nativeFilePath[MAX_PATH_LENGTH] = {0};
    ret = OH_ContentEmbed_Document_GetNativeFilePath(ceDocument, nativeFilePath);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Document_GetNativeFilePath ret: %{public}d", ret);
        OH_ContentEmbed_DestroyStream(destStream);
        return;
    }
    // 读取本地文件，往OE文档写数据
    ret = WriteFileToStream(destStream, nativeFilePath);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "WriteFileToStream ret: %{public}d", ret);
        OH_ContentEmbed_DestroyStream(destStream);
        return;
    }
    // 刷新OE文档
    ret = OH_ContentEmbed_Document_Flush(ceDocument);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Document_Flush ret: %{public}d", ret);
        OH_ContentEmbed_DestroyStream(destStream);
        return;
    }
    OH_LOG_INFO(LOG_APP, "enter NativeOnWriteToDataStream %{public}p", object);
    OH_ContentEmbed_DestroyStream(destStream);
}
// [End content_embed_server_on_write_to_data_stream]

// ---- NAPI entry points: UIAbility reaches back here to drive a live OE object ----
static ContentEmbed_ObjectHandle FindHandle(const std::string &objectKey)
{
    auto it = g_objectByKey.find(objectKey);
    if (it == g_objectByKey.end()) {
        OH_LOG_ERROR(LOG_APP, "FindHandle not found key:%{public}s", objectKey.c_str());
        return nullptr;
    }
    return it->second;
}

static ContentEmbed_ErrorCode FlushDocumentToStream(ContentEmbed_ObjectHandle handle, const std::string &objectKey)
{
    OH_LOG_INFO(LOG_APP, "enter FlushDocumentToStream key:%{public}s", objectKey.c_str());
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_GetContentEmbedDocument(handle, &document);
    OH_LOG_INFO(LOG_APP, "GetContentEmbedDocument ret: %{public}d", ret);
    ContentEmbed_Stream *childStream = nullptr;
    ret = OpenOrCreateChildStream(document, &childStream);
    if (ret != CE_ERR_OK || childStream == nullptr) {
        return ret;
    }
    std::string srcPath = "/data/storage/el2/base/cache/temp_" + objectKey + ".aaa";
    WriteFileToStream(childStream, srcPath);
    OH_ContentEmbed_DestroyStream(childStream);
    ret = OH_ContentEmbed_Document_Flush(document);
    OH_LOG_INFO(LOG_APP, "Document_Flush ret: %{public}d", ret);
    return ret;
}

static bool IsLinkingDocument(ContentEmbed_ObjectHandle handle)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_GetContentEmbedDocument(handle, &document);
    if (ret != CE_ERR_OK || document == nullptr) {
        return false;
    }
    bool isLinking = false;
    OH_ContentEmbed_Document_IsLinking(document, &isLinking);
    OH_LOG_INFO(LOG_APP, "IsLinkingDocument ret: %{public}d, isLinking: %{public}d", ret, isLinking);
    return isLinking;
}

extern "C" int32_t NAPI_DocumentSave(const char *id)
{
    OH_LOG_INFO(LOG_APP, "NAPI_DocumentSave id:%{public}s", id ? id : "(null)");
    if (id == nullptr) {
        OH_LOG_ERROR(LOG_APP, "NAPI_DocumentSave id is nullptr");
        return CE_ERR_PARAM_INVALID;
    }
    std::string objectKey(id);
    ContentEmbed_ObjectHandle handle = FindHandle(objectKey);
    if (handle == nullptr) {
        return CE_ERR_PARAM_INVALID;
    }
    // 链接式文档无嵌入 stream，FlushDocumentToStream 会失败并误报保存错误；其源
    // 文件已由 UIAbility 的 handleSaveFile 直接落回，此处只需通知客户端更新。
    if (!IsLinkingDocument(handle)) {
        ContentEmbed_ErrorCode ret = FlushDocumentToStream(handle, objectKey);
        if (ret != CE_ERR_OK) {
            return ret;
        }
    }
    auto ret = OH_ContentEmbed_Extension_CallbackToOnUpdate(handle);
    OH_LOG_INFO(LOG_APP, "CallbackToOnUpdate ret: %{public}d", ret);
    ret = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(handle, true);
    OH_LOG_INFO(LOG_APP, "CallbackToOnEditingFinished ret: %{public}d", ret);
    g_editState[handle].isModified = true;
    return ret;
}

extern "C" int32_t NAPI_DocumentUpdate(const char *id)
{
    OH_LOG_INFO(LOG_APP, "NAPI_DocumentUpdate id:%{public}s", id ? id : "(null)");
    if (id == nullptr) {
        OH_LOG_ERROR(LOG_APP, "NAPI_DocumentUpdate id is nullptr");
        return CE_ERR_PARAM_INVALID;
    }
    std::string objectKey(id);
    ContentEmbed_ObjectHandle handle = FindHandle(objectKey);
    if (handle == nullptr) {
        return CE_ERR_PARAM_INVALID;
    }
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_CallbackToOnUpdate(handle);
    g_editState[handle].isModified = true;
    OH_LOG_INFO(LOG_APP, "CallbackToOnUpdate ret: %{public}d", ret);
    return CE_ERR_OK;
}

extern "C" int32_t NAPI_DocumentStart(const char *id)
{
    OH_LOG_INFO(LOG_APP, "NAPI_DocumentStart id:%{public}s", id ? id : "(null)");
    if (id == nullptr) {
        OH_LOG_ERROR(LOG_APP, "NAPI_DocumentStart id is nullptr");
        return CE_ERR_PARAM_INVALID;
    }
    std::string objectKey(id);
    ContentEmbed_ObjectHandle handle = FindHandle(objectKey);
    if (handle == nullptr) {
        return CE_ERR_PARAM_INVALID;
    }
    g_editState[handle].isEditing = true;
    return CE_ERR_OK;
}

extern "C" int32_t NAPI_DocumentStop(const char *id)
{
    OH_LOG_INFO(LOG_APP, "NAPI_DocumentStop id:%{public}s", id ? id : "(null)");
    if (id == nullptr) {
        OH_LOG_ERROR(LOG_APP, "NAPI_DocumentStop id is nullptr");
        return CE_ERR_PARAM_INVALID;
    }
    std::string objectKey(id);
    ContentEmbed_ObjectHandle handle = FindHandle(objectKey);
    if (handle == nullptr) {
        return CE_ERR_PARAM_INVALID;
    }
    // 与 NAPI_DocumentSave 一致：链接式文档无嵌入 stream，跳过 FlushDocumentToStream
    // 避免 35300005 误报。源文件已由 UIAbility 直接落回，直接通知编辑结束即可。
    if (!IsLinkingDocument(handle)) {
        FlushDocumentToStream(handle, objectKey);
    }
    auto ret = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(handle, true);
    OH_LOG_INFO(LOG_APP, "CallbackToOnEditingFinished handle:%{public}p ret:%{public}d", handle, ret);
    g_editState[handle].isEditing = false;
    return CE_ERR_OK;
}

// UIAbility 轮询本接口检测对应 OE 对象是否仍然存活。客户端销毁 proxy 会触发
// RegisterOnObjectDetachFunc，该回调从 g_objectByKey 移除 objectKey，此后
// NAPI_IsObjectAlive 返回 0（已 detach）。UIAbility 据此自行 terminateSelfAbility，
// 使 UIAbility 生命周期与 OE 对象绑定，避免客户端关掉 proxy 后服务端 UIAbility
// 残留、进而顶住服务端进程无法退出。
extern "C" int32_t NAPI_IsObjectAlive(const char *id)
{
    if (id == nullptr) {
        return 0;
    }
    std::string objectKey(id);
    return FindHandle(objectKey) != nullptr ? 1 : 0;
}

// [Start content_embed_server_register_extension_callback]
extern "C" void OH_AbilityRuntime_OnNativeExtensionCreate(AbilityRuntime_ExtensionInstance *instance,
                                                          const char *abilityName)
{
    if (instance == nullptr) {
        OH_LOG_ERROR(LOG_APP, "instance is null");
        return;
    }

    ContentEmbed_ExtensionInstanceHandle ceExtensionInstance;
    // 获取OE Extension实例
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_GetExtensionInstance(instance, &ceExtensionInstance);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_GetExtensionInstance failed, errCode: %{public}d.", ret);
        return;
    }
    // 给全局变量赋值
    g_instance = ceExtensionInstance;
    // 注册OE Extension创建函数回调
    ret = OH_ContentEmbed_Extension_RegisterOnCreateFunc(ceExtensionInstance, NativeOnCreate);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnCreateFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // 注册OE Extension销毁函数回调
    ret = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(ceExtensionInstance, NativeOnDestroy);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnDestroyFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // 注册服务端OE对象绑定回调
    ret = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(ceExtensionInstance, RegisterOnObjectAttachFunc);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc failed, errCode: %{public}d.", ret);
        return;
    }
    // 注册服务端OE对象解绑回调
    ret = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(ceExtensionInstance, RegisterOnObjectDetachFunc);
    if (ret != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc failed, errCode: %{public}d.", ret);
        return;
    }
}
// [End content_embed_server_register_extension_callback]
