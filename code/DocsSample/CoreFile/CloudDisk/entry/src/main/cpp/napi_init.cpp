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

// ============================================================================
// napi_init.cpp — CloudDisk云盘能力C-API封装（NAPI原生模块）
// ----------------------------------------------------------------------------
// 本文件将OpenHarmony云盘管理C API（oh_cloud_disk_manager.h）封装为
// 可供ArkTS/ETS调用的NAPI接口，供鸿蒙开发者学习云盘能力时参考。
// 涉及的核心能力：
//   同步根管理：注册/注销同步根、激活/去激活、变更订阅、同步状态查询
//   占位符与水合：占位符创建/查询/更新、文件与占位符互转、
//                 水合/去水合、回调表（CallbackTable）与Execute
// ============================================================================

#include "napi/native_api.h"
#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <cerrno>
#include <string>
#include <map>
#include <thread>
#include <atomic>
#include "common/logger_common.h"
#include "common/napi_object_parser.h"
#include "common/utils.h"

// ============================================================================
// 全局状态 — 同步根变更回调（registerSyncFolderChanges使用）
// ----------------------------------------------------------------------------
// C层回调运行在非JS线程，不能直接调用JS回调，需要通过
// napi_threadsafe_function线程安全函数把事件投递回JS主线程执行。
// ============================================================================
static napi_ref g_callbackRef = nullptr;        // JS侧回调函数的引用（registerCallback传入）
static napi_threadsafe_function g_tsFn = nullptr; // 线程安全函数句柄，负责跨线程调用JS回调

// 全局状态 — 保存水合回调（hydratePlaceholder）返回的reqKey，供getCallbackReqKey查询
// reqKey是云端下发的任务标识，Execute时需要原样回传给云端，用于告诉云端"本次回调已处理"。
static std::map<std::string, OH_CloudDisk_DataBuf> g_reqKeyMap;   // 同步根路径 -> reqKey数据（DataBuf）
static std::atomic<uint64_t> g_reqKeyVersion{0}; // 每次回调存入新的reqKey时 +1（ETS侧用它轮询判断"新reqKey是否就绪"）

// 全局状态 — CallbackTable（registerCallbackTable）C层回调保存的数据
// 回调返回后reqHead/reqContext的内存可能被SDK释放，因此需要深拷贝保存，
// 供后续Execute手动执行时使用。
static std::map<std::string, OH_CloudDisk_CallbackReqHead> g_lastReqHeadMap;    // 同步根路径 -> 最近一次回调的请求头
static std::map<std::string, OH_CloudDisk_CallbackContext> g_lastReqContextMap; // 同步根路径 -> 最近一次回调的上下文

// 深拷贝存储的reqContext内容（原内存回调结束后可能失效，这里用静态字符串/结构体持有）
static std::string g_lastFetchDataPathStr;              // FETCH_DATA请求的文件相对路径（字符串缓存）
static OH_CloudDisk_FetchDataRequest g_lastFetchDataReq = {}; // FETCH_DATA请求（缓存filePath与优先级）
static std::string g_lastCancelFetchDataPathStr;        // CANCEL_FETCH_DATA请求的文件路径（字符串缓存）
static CloudDisk_PathInfo g_lastCancelFetchDataPathInfo = {}; // CANCEL_FETCH_DATA请求（缓存路径）
static std::string g_lastDehydratePathStr;              // DEHYDRATE请求的文件路径（字符串缓存）
static OH_CloudDisk_DehydrateInfo g_lastDehydrateInfo = {};   // DEHYDRATE请求（缓存路径与allow授权标志）

// FETCH_DATA自动执行的水合数据文件路径（通过registerCallbackTable第二个参数配置）
static std::string g_fetchFilePath;

// ============================================================================
// 辅助函数定义（从 utils.h / napi_object_parser.h 迁移至此，
// 避免头文件内联函数过长 G.FUD.06；魔法数字 G.CNS.02）
// ============================================================================

const size_t MAX_PATH_LENGTH = 4096;

char* GetStringParam(napi_env env, napi_value value)
{
    size_t length = 0;
    napi_status status = napi_get_value_string_utf8(env, value, nullptr, 0, &length);
    if (status != napi_ok) {
        LOGE("napi_get_value_string_utf8 failed");
        return nullptr;
    }
    char* param = new char[length + 1];
    memset(param, 0, length + 1);
    status = napi_get_value_string_utf8(env, value, param, length + 1, &length);
    if (status != napi_ok) {
        if (param) {
            delete[] param;
        }
        LOGE("napi_get_value_string_utf8 failed");
        return nullptr;
    }
    return param;
}

char* GetStringParam(napi_env env, napi_callback_info info, int32_t index)
{
    size_t argc = index + 1;
    napi_value args[10] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    return GetStringParam(env, args[index]);
}

int64_t GetNumberParam(napi_env env, napi_value value)
{
    int64_t longValue = 0;
    napi_status status = napi_get_value_int64(env, value, &longValue);
    if (status != napi_ok) {
        LOGE("napi_get_value_int64 failed");
        return 0;
    }
    return longValue;
}

int64_t GetNumberParam(napi_env env, napi_callback_info info, int32_t index)
{
    size_t argc = index + 1;
    napi_value args[10] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    return GetNumberParam(env, args[index]);
}

char* CharToHex(char* input)
{
    if (input == nullptr) { return nullptr; }
    const size_t hexCharsPerByte = 2;
    size_t inputLen = strlen(input);
    size_t outputLen = inputLen * hexCharsPerByte + 1;
    char* hexStr = (char*)malloc(outputLen);
    if (hexStr == nullptr) { return nullptr; }
    const char hexTable[] = "0123456789ABCDEF";
    for (size_t i = 0; i < inputLen; i++) {
        unsigned char byte = static_cast<unsigned char>(input[i]);
        const int bitsPerNibble = 4;
        hexStr[i * hexCharsPerByte] = hexTable[byte >> bitsPerNibble];
        hexStr[i * hexCharsPerByte + 1] = hexTable[byte & 0x0F];
    }
    hexStr[outputLen - 1] = '\0';
    return hexStr;
}

// CloudDisk_SyncFolder -> napi_value (JS object)
napi_value ParseNapiSyncFolder(napi_env env, CloudDisk_SyncFolder* syncFolder)
{
    napi_value dataObj;
    napi_create_object(env, &dataObj);

    napi_value pathValue;
    napi_create_string_utf8(env, syncFolder->path.value, NAPI_AUTO_LENGTH, &pathValue);
    napi_set_named_property(env, dataObj, "path", pathValue);

    napi_value stateValue;
    napi_create_int32(env, syncFolder->state, &stateValue);
    napi_set_named_property(env, dataObj, "state", stateValue);

    napi_value displayNameResId;
    napi_create_int32(env, syncFolder->displayNameInfo.displayNameResId, &displayNameResId);
    napi_set_named_property(env, dataObj, "displayNameResId", displayNameResId);

    napi_value displayName;
    napi_create_string_utf8(env, syncFolder->displayNameInfo.customAlias, NAPI_AUTO_LENGTH, &displayName);
    napi_set_named_property(env, dataObj, "displayName", displayName);

    return dataObj;
}

// CloudDisk_ChangesResult -> napi_value (JS object)
napi_value ParseNapiChangesResult(napi_env env, const CloudDisk_ChangesResult* changesResult)
{
    napi_value dataObj;
    napi_create_object(env, &dataObj);

    napi_value nextUsnValue;
    napi_create_uint32(env, static_cast<uint32_t>(changesResult->nextUsn), &nextUsnValue);
    napi_set_named_property(env, dataObj, "nextUsn", nextUsnValue);

    napi_value isEofValue;
    napi_get_boolean(env, changesResult->isEof, &isEofValue);
    napi_set_named_property(env, dataObj, "isEof", isEofValue);

    napi_value changesArray;
    napi_create_array_with_length(env, changesResult->bufferLength, &changesArray);

    for (size_t i = 0; i < changesResult->bufferLength; ++i) {
        const CloudDisk_ChangeData& cData = changesResult->changeDatas[i];
        napi_value jsChangeData;
        napi_create_object(env, &jsChangeData);

        napi_value usnValue;
        napi_create_uint32(env, static_cast<uint32_t>(cData.updateSequenceNumber), &usnValue);
        napi_set_named_property(env, jsChangeData, "updateSequenceNumber", usnValue);

        // fileId (hex)
        napi_value fileIdValue;
        char* fileIdHex = CharToHex(cData.fileId.value);
        napi_create_string_utf8(env, fileIdHex ? fileIdHex : "", NAPI_AUTO_LENGTH, &fileIdValue);
        napi_set_named_property(env, jsChangeData, "fileId", fileIdValue);
        if (fileIdHex) free(fileIdHex);

        // parentFileId (hex)
        napi_value parentFileIdValue;
        char* parentFileIdHex = CharToHex(cData.parentFileId.value);
        napi_create_string_utf8(env, parentFileIdHex ? parentFileIdHex : "", NAPI_AUTO_LENGTH, &parentFileIdValue);
        napi_set_named_property(env, jsChangeData, "parentFileId", parentFileIdValue);
        if (parentFileIdHex) free(parentFileIdHex);

        // relativePath
        napi_value relativePathValue;
        napi_create_string_utf8(env, cData.relativePathInfo.value, cData.relativePathInfo.length, &relativePathValue);
        napi_set_named_property(env, jsChangeData, "relativePath", relativePathValue);

        napi_value opTypeValue;
        napi_create_int32(env, static_cast<int32_t>(cData.operationType), &opTypeValue);
        napi_set_named_property(env, jsChangeData, "operationType", opTypeValue);

        napi_value sizeValue;
        napi_create_uint32(env, static_cast<uint32_t>(cData.size), &sizeValue);
        napi_set_named_property(env, jsChangeData, "size", sizeValue);

        napi_value mtimeValue;
        napi_create_uint32(env, static_cast<uint32_t>(cData.mtime), &mtimeValue);
        napi_set_named_property(env, jsChangeData, "mtime", mtimeValue);

        napi_value timeStampValue;
        napi_create_uint32(env, static_cast<uint32_t>(cData.timeStamp), &timeStampValue);
        napi_set_named_property(env, jsChangeData, "timeStamp", timeStampValue);

        napi_set_element(env, changesArray, i, jsChangeData);
    }

    napi_set_named_property(env, dataObj, "changesData", changesArray);
    return dataObj;
}

// CloudDisk_ResultList -> napi_value (JS object)
napi_value ParseNapiResultList(napi_env env, CloudDisk_ResultList* result)
{
    napi_value jsResult;
    napi_create_object(env, &jsResult);

    napi_value pathValue;
    napi_create_string_utf8(env, result->pathInfo.value, result->pathInfo.length, &pathValue);
    napi_set_named_property(env, jsResult, "path", pathValue);

    napi_value successFlag;
    napi_get_boolean(env, result->isSuccess, &successFlag);
    napi_set_named_property(env, jsResult, "isSuccess", successFlag);

    if (result->isSuccess) {
        napi_value syncState;
        napi_create_int32(env, static_cast<int32_t>(result->syncState), &syncState);
        napi_set_named_property(env, jsResult, "syncState", syncState);
    } else {
        napi_value errorReason;
        napi_create_int32(env, static_cast<int32_t>(result->errorReason), &errorReason);
        napi_set_named_property(env, jsResult, "errorReason", errorReason);
    }

    return jsResult;
}

// napi_value (JS object {path, state}) -> CloudDisk_FileSyncState
napi_status ConvertToFileSyncState(napi_env env, napi_value jsObj, CloudDisk_FileSyncState* fileSyncState)
{
    napi_status status;

    napi_value pathValue;
    status = napi_get_named_property(env, jsObj, "path", &pathValue);
    if (status != napi_ok) return status;

    size_t strLength;
    status = napi_get_value_string_utf8(env, pathValue, NULL, 0, &strLength);
    if (status != napi_ok) return status;
    if (strLength == 0 || strLength > MAX_PATH_LENGTH) { return napi_invalid_arg; }

    fileSyncState->filePathInfo.value = (char*)malloc(strLength + 1);
    if (!fileSyncState->filePathInfo.value) return napi_generic_failure;

    size_t actualSize;
    status = napi_get_value_string_utf8(env, pathValue, fileSyncState->filePathInfo.value, strLength + 1, &actualSize);
    if (status != napi_ok) {
        free(fileSyncState->filePathInfo.value);
        return status;
    }
    fileSyncState->filePathInfo.length = actualSize;

    napi_value stateValue;
    status = napi_get_named_property(env, jsObj, "state", &stateValue);
    if (status != napi_ok) {
        free(fileSyncState->filePathInfo.value);
        return status;
    }

    int32_t syncState;
    status = napi_get_value_int32(env, stateValue, &syncState);
    if (status != napi_ok) {
        free(fileSyncState->filePathInfo.value);
        return napi_invalid_arg;
    }
    fileSyncState->syncState = (CloudDisk_SyncState)syncState;

    return napi_ok;
}

// napi_value (JS array of {path, state}) -> CloudDisk_FileSyncState[]
napi_status ConvertToFileSyncStates(napi_env env, napi_value jsArray,
                                    CloudDisk_FileSyncState** fileSyncStates, size_t* arraySize)
{
    napi_status status;
    bool isArray;
    status = napi_is_array(env, jsArray, &isArray);
    if (status != napi_ok || !isArray) return napi_array_expected;

    uint32_t length;
    status = napi_get_array_length(env, jsArray, &length);
    if (status != napi_ok || length == 0) return napi_invalid_arg;

    std::vector<CloudDisk_FileSyncState> tempResult;
    for (uint32_t i = 0; i < length; ++i) {
        napi_value element;
        status = napi_get_element(env, jsArray, i, &element);
        if (status != napi_ok) { break; }

        CloudDisk_FileSyncState item = {0};
        status = ConvertToFileSyncState(env, element, &item);
        if (status != napi_ok) {
            for (auto& elem : tempResult) {
                free(elem.filePathInfo.value);
            }
            return status;
        }
        tempResult.push_back(item);
    }

    *fileSyncStates = (CloudDisk_FileSyncState*)malloc(sizeof(CloudDisk_FileSyncState) * tempResult.size());
    if (!*fileSyncStates) return napi_generic_failure;
    memcpy(*fileSyncStates, tempResult.data(), sizeof(CloudDisk_FileSyncState) * tempResult.size());
    *arraySize = tempResult.size();

    return napi_ok;
}

// napi_value (JS string array) -> CloudDisk_PathInfo[]
napi_status ConvertToPathInfos(napi_env env, napi_value jsArray,
                               CloudDisk_PathInfo** pathInfos, size_t* arraySize)
{
    napi_valuetype type;
    napi_typeof(env, jsArray, &type);
    if (type != napi_object) {
        return napi_array_expected;
    }

    uint32_t arrayLength;
    napi_get_array_length(env, jsArray, &arrayLength);

    std::vector<CloudDisk_PathInfo> tempResult;
    for (uint32_t i = 0; i < arrayLength; i++) {
        napi_value element;
        napi_get_element(env, jsArray, i, &element);

        size_t strLength;
        napi_get_value_string_utf8(env, element, NULL, 0, &strLength);
        if (strLength == 0 || strLength > MAX_PATH_LENGTH) { return napi_invalid_arg; }

        char* buffer = (char*)malloc(strLength + 1);
        size_t copied;
        napi_get_value_string_utf8(env, element, buffer, strLength + 1, &copied);
        buffer[strLength] = '\0';

        CloudDisk_PathInfo pathInfo;
        pathInfo.value = buffer;
        pathInfo.length = strLength;
        tempResult.push_back(pathInfo);
    }

    *pathInfos = (CloudDisk_PathInfo*)malloc(sizeof(CloudDisk_PathInfo) * tempResult.size());
    if (!*pathInfos) return napi_generic_failure;
    memcpy(*pathInfos, tempResult.data(), sizeof(CloudDisk_PathInfo) * tempResult.size());
    *arraySize = tempResult.size();
    return napi_ok;
}

// ============================================================================
// 辅助函数：将C字符串构造为CloudDisk_PathInfo（路径信息结构体）
// ============================================================================
static CloudDisk_PathInfo MakePathInfo(char* str)
{
    // value：路径字符串指针；length：字符串长度（不含结束符）
    CloudDisk_PathInfo pathInfo;
    pathInfo.value = str;
    pathInfo.length = str ? strlen(str) : 0;
    return pathInfo;
}

// ============================================================================
// 辅助函数：一次性取出NAPI回调的全部入参
// ============================================================================
static void GetArgs(napi_env env, napi_callback_info info, size_t argc, napi_value* args)
{
    // napi_get_cb_info用于获取JS侧传给原生函数的参数列表
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
}

// ============================================================================
// 1. registerSyncFolder(path: string, displayName: string): number
//    注册同步根目录。同步根是云端与本地文件系统同步的根目录，
//    只有注册过的目录才能使用云盘能力。
//    OH_CloudDisk_RegisterSyncFolder(const CloudDisk_SyncFolder *syncFolder)
// ============================================================================
// [Start register_sync_folder]
static napi_value RegisterSyncFolder(napi_env env, napi_callback_info info)
{
    // 解析JS入参：同步根路径 + 显示名称（均为字符串）
    char* path = GetStringParam(env, info, 0);
    char* displayName = GetStringParam(env, info, 1);
    if (!path || !displayName) {
        // 参数非法时直接返回CLOUD_DISK_INVALID_ARG（无效参数错误码）
        LOGE("RegisterSyncFolder invalid params.");
        delete[] path;
        delete[] displayName;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 构造同步根信息结构体
    CloudDisk_SyncFolder syncFolder = {};
    syncFolder.path = MakePathInfo(path);              // 同步根路径
    syncFolder.state = INACTIVE;                       // 初始状态：未激活（需另行激活才能开始同步）
    syncFolder.displayNameInfo.displayNameResId = 0;   // 系统资源ID名称（0表示不使用）
    syncFolder.displayNameInfo.customAlias = displayName;         // 自定义别名（用户可配置的显示名称）
    syncFolder.displayNameInfo.customAliasLength = strlen(displayName); // 自定义别名长度

    // [StartExclude register_sync_folder]
    LOGW("OH_CloudDisk_RegisterSyncFolder path: %{public}s.", path);
    // [EndExclude register_sync_folder]
    // 调用云盘SDK注册同步根
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_RegisterSyncFolder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_RegisterSyncFolder success.");
    }

    delete[] path;
    delete[] displayName;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End register_sync_folder]

// ============================================================================
// 2. unRegisterSyncFolder(path: string): number
//    注销同步根目录。注销后该目录将不再参与云盘同步。
//    OH_CloudDisk_UnregisterSyncFolder(const CloudDisk_SyncFolderPath syncFolderPath)
// ============================================================================
// [Start unregister_sync_folder]
static napi_value UnregisterSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info, 0);
    if (!path) {
        LOGE("UnregisterSyncFolder path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 构造同步根路径信息
    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude unregister_sync_folder]
    LOGW("OH_CloudDisk_UnregisterSyncFolder path: %{public}s.", path);
    // [EndExclude unregister_sync_folder]
    // 调用云盘SDK注销同步根
    auto ret = OH_CloudDisk_UnregisterSyncFolder(syncFolderPath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UnregisterSyncFolder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UnregisterSyncFolder success.");
    }

    delete[] path;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End unregister_sync_folder]

// ============================================================================
// 3. unRegisterAllSyncFolder(): number
//    注销全部同步根。实现方式：先查询所有同步根，再逐个注销。
//    OH_CloudDisk_GetSyncFolders + OH_CloudDisk_UnregisterSyncFolder
// ============================================================================
static napi_value UnregisterAllSyncFolder(napi_env env, napi_callback_info info)
{
    CloudDisk_SyncFolder* syncFolders = nullptr;
    size_t count = 0;
    // 查询当前已注册的全部同步根（SDK分配内存，返回数组与数量）
    auto ret = OH_CloudDisk_GetSyncFolders(&syncFolders, &count);
    if (ret != CLOUD_DISK_OK) {
        LOGE("UnregisterAllSyncFolder: GetSyncFolders failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("UnregisterAllSyncFolder: GetSyncFolders success, count: %{public}zu.", count);
    }
    if (ret != CLOUD_DISK_OK || count == 0) {
        // 无同步根或查询失败时直接返回
        napi_value result;
        napi_create_int32(env, ret, &result);
        return result;
    }

    // 遍历所有同步根并逐个注销
    for (size_t i = 0; i < count; i++) {
        auto unregRet = OH_CloudDisk_UnregisterSyncFolder(syncFolders[i].path);
        if (unregRet != CLOUD_DISK_OK) {
            // 单个同步根注销失败，记录日志后继续注销其余同步根
            LOGE("UnregisterAllSyncFolder: unregister[%{public}zu] path=%{public}s failed, errorCode: %{public}d.",
                 i, syncFolders[i].path.value, unregRet);
        } else {
            LOGI("UnregisterAllSyncFolder: unregister[%{public}zu] path=%{public}s success.",
                 i, syncFolders[i].path.value);
        }
    }

    napi_value result;
    napi_create_int32(env, CLOUD_DISK_OK, &result);
    return result;
}

// ============================================================================
// 4. activeSyncFolder(path: string): number
//    激活同步根。激活后云盘才会对该目录进行同步（如元数据拉取、占位符下发等）。
//    OH_CloudDisk_ActiveSyncFolder(const CloudDisk_SyncFolderPath syncFolderPath)
// ============================================================================
// [Start active_sync_folder]
static napi_value ActiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info, 0);
    if (!path) {
        LOGE("ActiveSyncFolder path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude active_sync_folder]
    LOGW("OH_CloudDisk_ActiveSyncFolder path: %{public}s.", path);
    // [EndExclude active_sync_folder]
    // 调用云盘SDK激活同步根
    auto ret = OH_CloudDisk_ActiveSyncFolder(syncFolderPath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_ActiveSyncFolder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_ActiveSyncFolder success.");
    }

    delete[] path;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End active_sync_folder]

// ============================================================================
// 5. deactiveSyncFolder(path: string): number
//    去激活同步根。去激活后停止对该目录的同步，但已注册关系保留。
//    OH_CloudDisk_DeactiveSyncFolder(const CloudDisk_SyncFolderPath syncFolderPath)
// ============================================================================
// [Start deactive_sync_folder]
static napi_value DeactiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info, 0);
    if (!path) {
        LOGE("DeactiveSyncFolder path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude deactive_sync_folder]
    LOGW("OH_CloudDisk_DeactiveSyncFolder path: %{public}s.", path);
    // [EndExclude deactive_sync_folder]
    // 调用云盘SDK去激活同步根
    auto ret = OH_CloudDisk_DeactiveSyncFolder(syncFolderPath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_DeactiveSyncFolder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_DeactiveSyncFolder success.");
    }

    delete[] path;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End deactive_sync_folder]

// ============================================================================
// 6. getAllSyncFolder(): SyncFolder[]
//    查询全部已注册的同步根，返回SyncFolder[]（无同步根时返回空数组，而非null）。
//    OH_CloudDisk_GetSyncFolders(CloudDisk_SyncFolder **syncFolders, size_t *count)
// ============================================================================
// [Start get_sync_folders]
static napi_value GetAllSyncFolder(napi_env env, napi_callback_info info)
{
    CloudDisk_SyncFolder* syncFolders = nullptr;
    size_t count = 0;
    // 查询全部同步根（SDK分配内存并返回数组指针与数量）
    auto ret = OH_CloudDisk_GetSyncFolders(&syncFolders, &count);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_GetSyncFolders failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_GetSyncFolders success, count: %{public}zu.", count);
    }
    if (ret != CLOUD_DISK_OK || count == 0) {
        // 无同步根时返回空数组，避免JS侧判空逻辑复杂化
        napi_value emptyArray;
        napi_create_array_with_length(env, 0, &emptyArray);
        return emptyArray;
    }

    // 创建JS数组，并把每个C结构体转换为JS对象放入数组
    napi_value jsArray;
    napi_create_array_with_length(env, count, &jsArray);
    for (size_t i = 0; i < count; i++) {
        napi_value syncFolderValue = ParseNapiSyncFolder(env, &syncFolders[i]);
        napi_set_element(env, jsArray, i, syncFolderValue);
    }
    return jsArray;
}
// [End get_sync_folders]

// ============================================================================
// 7. updateDisplayName(path: string, alias: string): number
//    修改同步根的自定义显示名称（别名）。
//    OH_CloudDisk_UpdateCustomAlias(const CloudDisk_SyncFolderPath syncFolderPath,
//                                   const char *customAlias, size_t customAliasLength)
// ============================================================================
// [Start update_custom_alias]
static napi_value UpdateDisplayName(napi_env env, napi_callback_info info)
{
    // 解析入参：同步根路径 + 新的显示名称
    char* path = GetStringParam(env, info, 0);
    char* alias = GetStringParam(env, info, 1);
    if (!path || !alias) {
        LOGE("UpdateDisplayName invalid params.");
        delete[] path;
        delete[] alias;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude update_custom_alias]
    LOGW("OH_CloudDisk_UpdateCustomAlias path: %{public}s, alias: %{public}s.", path, alias);
    // [EndExclude update_custom_alias]
    // 调用云盘SDK更新别名（需要同时传入别名与长度）
    auto ret = OH_CloudDisk_UpdateCustomAlias(syncFolderPath, alias, strlen(alias));
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UpdateCustomAlias failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UpdateCustomAlias success.");
    }

    delete[] path;
    delete[] alias;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End update_custom_alias]

// ============================================================================
// 线程安全回调 — registerSyncFolderChanges的C层回调
// ----------------------------------------------------------------------------
// 该回调由云盘SDK在内部线程触发，用于上报同步目录内的变更事件。
// 因为回调不在JS主线程，这里仅通过napi_call_threadsafe_function
// 把一条消息投递到JS线程，由CallJs在JS主线程调用注册的JS回调。
// ============================================================================
// [Start on_change_data_callback]
static void OnChangeDataCallback(const CloudDisk_SyncFolderPath syncFolderPath,
                                 const CloudDisk_ChangeData changeDatas[], size_t length)
{
    LOGI("OnChangeDataCallback: path=%{public}s, length=%{public}zu.",
         syncFolderPath.value ? syncFolderPath.value : "(null)", length);
    // 逐条打印变更数据（便于调试观察变更内容）
    for (size_t i = 0; i < length; ++i) {
        auto& data = changeDatas[i];
        LOGI("  change[%{public}zu]: opType=%{public}d, relativePath=%{public}s.",
             i, data.operationType, data.relativePathInfo.value ? data.relativePathInfo.value : "(null)");
    }
    if (g_tsFn) {
        // 通过线程安全函数投递消息到JS线程（new出来的string由CallJs负责释放）
        std::string msg = "CloudDiskChange";
        napi_call_threadsafe_function(g_tsFn, new std::string(msg), napi_tsfn_blocking);
    }
}
// [End on_change_data_callback]

// 线程安全函数回调：在JS主线程执行，负责真正调用JS侧回调函数
static void CallJs(napi_env env, napi_value js_cb, void* context, void* data)
{
    auto msg = reinterpret_cast<std::string*>(data);
    // 取出之前保存的JS回调函数引用
    napi_get_reference_value(env, g_callbackRef, &js_cb);

    // 构造回调参数：字符串消息
    napi_value argv[1];
    napi_create_string_utf8(env, msg->c_str(), NAPI_AUTO_LENGTH, &argv[0]);

    // 调用JS回调函数，参数为 [msg]
    napi_value undefined;
    napi_get_undefined(env, &undefined);
    napi_call_function(env, undefined, js_cb, 1, argv, nullptr);
    delete msg;
}

// ============================================================================
// 8. registerSyncFolderChange(path: string): number
//    订阅同步根的变更事件。变更（新增/删除/修改等）会通过回调上报。
//    OH_CloudDisk_RegisterSyncFolderChanges(const CloudDisk_SyncFolderPath syncFolderPath,
//        void (*callback)(const CloudDisk_SyncFolderPath, const CloudDisk_ChangeData[], size_t))
// ============================================================================
// [Start register_sync_folder_changes]
static napi_value RegisterSyncFolderChange(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info, 0);
    if (!path) {
        LOGE("RegisterSyncFolderChange path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude register_sync_folder_changes]
    LOGW("OH_CloudDisk_RegisterSyncFolderChanges path: %{public}s.", path);
    // [EndExclude register_sync_folder_changes]
    // 注册变更回调（C层回调为OnChangeDataCallback）
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(syncFolderPath, &OnChangeDataCallback);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_RegisterSyncFolderChanges failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_RegisterSyncFolderChanges success.");
    }

    delete[] path;

    napi_value val;
    napi_create_int32(env, ret, &val);
    return val;
}
// [End register_sync_folder_changes]

// ============================================================================
// 9. unRegisterSyncFolderChange(path: string): number
//    取消订阅同步根的变更事件。
//    OH_CloudDisk_UnregisterSyncFolderChanges(const CloudDisk_SyncFolderPath syncFolderPath)
// ============================================================================
// [Start unregister_sync_folder_changes]
static napi_value UnregisterSyncFolderChange(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info, 0);
    if (!path) {
        LOGE("UnregisterSyncFolderChange path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);
    // [StartExclude unregister_sync_folder_changes]
    LOGW("OH_CloudDisk_UnregisterSyncFolderChanges path: %{public}s.", path);
    // [EndExclude unregister_sync_folder_changes]
    // 取消变更订阅
    auto ret = OH_CloudDisk_UnregisterSyncFolderChanges(syncFolderPath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UnregisterSyncFolderChanges failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UnregisterSyncFolderChanges success.");
    }

    delete[] path;

    napi_value val;
    napi_create_int32(env, ret, &val);
    return val;
}
// [End unregister_sync_folder_changes]

// ============================================================================
// 10. getSyncFolderChanges(path: string, usn: number, count: number): ChangesResult
//     增量获取同步根内的变更列表。usn（Update Sequence Number）为增量游标，
//     首次传0全量拉取，之后传上次返回的nextUsn继续增量拉取。
//     OH_CloudDisk_GetSyncFolderChanges(const CloudDisk_SyncFolderPath syncFolderPath,
//         uint64_t startUsn, size_t count, CloudDisk_ChangesResult **changesResult)
// ============================================================================
// [Start get_sync_folder_changes]
static napi_value GetSyncFolderChanges(napi_env env, napi_callback_info info)
{
    // 解析入参：同步根路径、起始usn、拉取条数
    char* path = GetStringParam(env, info, 0);
    int64_t usn = GetNumberParam(env, info, 1);
    int64_t count = GetNumberParam(env, info, 2);
    if (!path) {
        LOGE("GetSyncFolderChanges path is empty.");
        napi_value nullVal;
        napi_get_null(env, &nullVal);
        return nullVal;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);

    // 调用SDK增量获取变更（结果由SDK分配内存，返回结构体指针）
    CloudDisk_ChangesResult* changesResult = nullptr;
    // [StartExclude get_sync_folder_changes]
    LOGW("OH_CloudDisk_GetSyncFolderChanges path: %{public}s, usn: %{public}lld, count: %{public}lld.",
         path, (long long)usn, (long long)count);
    // [EndExclude get_sync_folder_changes]
    auto ret = OH_CloudDisk_GetSyncFolderChanges(syncFolderPath, static_cast<uint64_t>(usn),
        static_cast<size_t>(count), &changesResult);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_GetSyncFolderChanges failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_GetSyncFolderChanges success.");
    }

    delete[] path;

    // 失败或无数据时返回null
    if (ret != CLOUD_DISK_OK || !changesResult) {
        napi_value nullVal;
        napi_get_null(env, &nullVal);
        return nullVal;
    }
    // 把C结构体转换为JS对象（ChangesResult）返回
    return ParseNapiChangesResult(env, changesResult);
}
// [End get_sync_folder_changes]

// ============================================================================
// 11. setFileSyncStates(path: string, length: number, states[]): number
//     批量设置文件同步状态（如云端删除标记、本地删除标记等）。
//     OH_CloudDisk_SetFileSyncStates(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_FileSyncState fileSyncStates[], size_t bufferLength,
//         CloudDisk_FailedList **failedLists, size_t *failedCount)
// ============================================================================
// [Start set_file_sync_states]
static napi_value SetFileSyncStates(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    GetArgs(env, info, argc, args);

    // SetFileSyncStates参数索引定义
    enum ArgIndex {
        ARG_SYNC_PATH = 0,
        ARG_LENGTH = 1,
        ARG_STATE_ARRAY = 2,
    };

    // 解析入参：同步根路径、状态数组长度、文件同步状态数组
    char* path = GetStringParam(env, args[ARG_SYNC_PATH]);
    if (!path) {
        LOGE("SetFileSyncStates path is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }
    uint64_t length = static_cast<uint64_t>(GetNumberParam(env, args[ARG_LENGTH]));

    // 把JS数组转换为C结构体数组（内部new内存，用后需free）
    CloudDisk_FileSyncState* fileSyncStates = nullptr;
    size_t arraySize = 0;
    ConvertToFileSyncStates(env, args[ARG_STATE_ARRAY], &fileSyncStates, &arraySize);

    // 批量设置同步状态，失败项会写入failedLists（路径 + 失败原因）
    CloudDisk_FailedList* failedLists = nullptr;
    size_t failedCount = 0;
    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);

    // [StartExclude set_file_sync_states]
    LOGW("OH_CloudDisk_SetFileSyncStates path: %{public}s, length: %{public}llu.", path, (unsigned long long)length);
    // [EndExclude set_file_sync_states]
    auto ret = OH_CloudDisk_SetFileSyncStates(syncFolderPath, fileSyncStates, length, &failedLists, &failedCount);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_SetFileSyncStates failed, errorCode: %{public}d, failedCount: %{public}zu.",
             ret, failedCount);
    } else {
        LOGI("OH_CloudDisk_SetFileSyncStates success, failedCount: %{public}zu.", failedCount);
    }

    // 打印失败项（路径 + 错误原因），便于问题定位
    if (failedCount != 0 && failedLists) {
        for (size_t i = 0; i < failedCount; i++) {
            LOGE("  failed[%{public}zu]: path=%{public}s, reason=%{public}d.",
                 i, failedLists[i].pathInfo.value ? failedLists[i].pathInfo.value : "(null)",
                 failedLists[i].errorReason);
        }
    }

    // 释放转换过程中申请的内存
    if (fileSyncStates) {
        for (size_t i = 0; i < arraySize; i++) {
            free(fileSyncStates[i].filePathInfo.value);
        }
        free(fileSyncStates);
    }
    delete[] path;

    napi_value val;
    napi_create_int32(env, ret, &val);
    return val;
}
// [End set_file_sync_states]

// ============================================================================
// 12. getFileSyncStates(path: string, length: number, paths[]): ResultList[]
//     批量查询文件的同步状态。
//     OH_CloudDisk_GetFileSyncStates(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_PathInfo paths[], size_t bufferLength,
//         CloudDisk_ResultList **resultLists, size_t *resultCount)
// ============================================================================
// [Start get_file_sync_states]
static napi_value GetFileSyncStates(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    GetArgs(env, info, argc, args);

    // GetFileSyncStates参数索引定义
    enum ArgIndex {
        ARG_SYNC_PATH = 0,
        ARG_LENGTH = 1,
        ARG_PATH_ARRAY = 2,
    };

    // 解析入参：同步根路径、路径数量、文件相对路径数组
    char* path = GetStringParam(env, args[ARG_SYNC_PATH]);
    if (!path) {
        LOGE("GetFileSyncStates path is empty.");
        napi_value nullVal;
        napi_get_null(env, &nullVal);
        return nullVal;
    }
    uint64_t length = static_cast<uint64_t>(GetNumberParam(env, args[ARG_LENGTH]));

    // 把JS路径数组转换为C结构体数组（内部new内存，用后需释放）
    CloudDisk_PathInfo* paths = nullptr;
    size_t arraySize = 0;
    ConvertToPathInfos(env, args[ARG_PATH_ARRAY], &paths, &arraySize);

    // 批量查询，返回每个文件的状态结果列表
    CloudDisk_ResultList* resultLists = nullptr;
    size_t resultCount = 0;
    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(path);

    // [StartExclude get_file_sync_states]
    LOGW("OH_CloudDisk_GetFileSyncStates path: %{public}s, length: %{public}llu.", path, (unsigned long long)length);
    // [EndExclude get_file_sync_states]
    auto ret = OH_CloudDisk_GetFileSyncStates(syncFolderPath, paths, length, &resultLists, &resultCount);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_GetFileSyncStates failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_GetFileSyncStates success, resultCount: %{public}zu.", resultCount);
    }

    delete[] path;

    // 失败或无结果时返回null
    if (ret != CLOUD_DISK_OK || resultCount == 0 || !resultLists) {
        napi_value nullVal;
        napi_get_null(env, &nullVal);
        return nullVal;
    }

    // 把每个查询结果转换为JS对象并放入数组返回
    napi_value jsArray;
    napi_create_array_with_length(env, resultCount, &jsArray);
    for (size_t i = 0; i < resultCount; i++) {
        napi_value resultValue = ParseNapiResultList(env, &resultLists[i]);
        napi_set_element(env, jsArray, i, resultValue);
    }

    // 释放转换过程中申请的内存
    if (paths) {
        for (size_t i = 0; i < arraySize; i++) {
            free(paths[i].value);
        }
        free(paths);
    }

    return jsArray;
}
// [End get_file_sync_states]

// ============================================================================
// 13. registerCallback(cb: Function): void
//     注册JS回调函数，用于接收C层线程触发的变更事件。
//     内部使用napi_threadsafe_function实现跨线程回调（线程安全）。
// ============================================================================
static napi_value RegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value js_callback;
    // 获取JS回调函数参数
    napi_get_cb_info(env, info, &argc, &js_callback, nullptr, nullptr);

    // 校验传入参数确实是函数类型
    napi_valuetype valueType = napi_undefined;
    napi_typeof(env, js_callback, &valueType);
    if (valueType != napi_valuetype::napi_function) {
        LOGE("RegisterCallback: not a function.");
        return nullptr;
    }

    // 创建线程安全函数（工作名称用于调试日志标识）
    napi_value workName;
    napi_create_string_utf8(env, "CloudDiskChangeCallback", NAPI_AUTO_LENGTH, &workName);

    // 创建线程安全函数：C层线程调用napi_call_threadsafe_function后，
    // 会切换到JS主线程执行CallJs回调
    napi_create_threadsafe_function(env, nullptr, nullptr, workName, 0, 1, nullptr,
                                    nullptr, nullptr, CallJs, &g_tsFn);

    // 保存JS回调函数的强引用（防止被GC回收）
    napi_create_reference(env, js_callback, 1, &g_callbackRef);
    LOGI("RegisterCallback: registered.");
    return nullptr;
}

// ============================================================================
// 占位符与水合APIs — 占位符 / 水合 / 回调表
// ============================================================================

// ============================================================================
// 14. createPlaceholderFile(syncPath, relativePath, atimeMs, mtimeMs, logicalSize): number
//     创建占位符文件。占位符文件是"只有元数据、没有真实内容"的文件，
//     当用户访问时触发水合（FetchData）从云端拉取真实内容。
//     OH_CloudDisk_CreatePlaceholder(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_PathInfo relativePathInfo,
//         const OH_CloudDisk_PlaceholderInfo placeholderInfo,
//         const OH_CloudDisk_PlaceholderCustomInfo *customInfo)
//     customInfo = NULL（不写自定义信息）
// ============================================================================
// [Start create_placeholder]
static napi_value CreatePlaceholderFile(napi_env env, napi_callback_info info)
{
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    GetArgs(env, info, argc, args);

    // 解析入参：同步根路径 + 相对路径（占位符文件在同步根内的相对位置）
    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("CreatePlaceholderFile invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 解析时间与大小参数
    uint64_t atimeMs = static_cast<uint64_t>(GetNumberParam(env, args[2]));  // 访问时间（毫秒时间戳，映射云端文件访问时间）
    uint64_t mtimeMs = static_cast<uint64_t>(GetNumberParam(env, args[3]));  // 修改时间（毫秒时间戳，映射云端文件修改时间）
    uint64_t logicalSize = static_cast<uint64_t>(GetNumberParam(env, args[4])); // 云端文件逻辑大小（字节）

    // 构造同步根路径与相对路径
    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    // 定义占位符文件信息
    OH_CloudDisk_PlaceholderInfo placeholderInfo = {};
    placeholderInfo.atimeMs = atimeMs;       // 访问时间（毫秒）
    placeholderInfo.mtimeMs = mtimeMs;       // 修改时间（毫秒）
    placeholderInfo.logicalSize = logicalSize; // 逻辑大小（字节）

    // [StartExclude create_placeholder]
    LOGW("OH_CloudDisk_CreatePlaceholder syncPath: %{public}s, relativePath: %{public}s, "
         "atimeMs: %{public}llu, mtimeMs: %{public}llu, logicalSize: %{public}llu.",
         syncPath, relativePath, (unsigned long long)atimeMs, (unsigned long long)mtimeMs,
         (unsigned long long)logicalSize);
    // [EndExclude create_placeholder]
    // 创建占位符文件（customInfo传NULL，表示不写入占位符自定义信息）
    auto ret = OH_CloudDisk_CreatePlaceholder(syncFolderPath, relativePathInfo, placeholderInfo, NULL);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_CreatePlaceholder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_CreatePlaceholder success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End create_placeholder]

// ============================================================================
// 15. isPlaceholderFile(syncPath, relativePath): {code: number, isPlaceholder: boolean}
//     判断指定文件是否为占位符文件。
//     返回对象包含code（错误码）与isPlaceholder（是否为占位符）。
//     OH_CloudDisk_IsPlaceholderFile(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_PathInfo relativePathInfo, bool *isPlaceholder)
// ============================================================================
// [Start is_placeholder_file]
static napi_value IsPlaceholderFile(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        // 参数非法：返回code=CLOUD_DISK_INVALID_ARG, isPlaceholder=false的对象
        LOGE("IsPlaceholderFile invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_object(env, &result);
        napi_value codeVal;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &codeVal);
        napi_set_named_property(env, result, "code", codeVal);
        napi_value boolVal;
        napi_get_boolean(env, false, &boolVal);
        napi_set_named_property(env, result, "isPlaceholder", boolVal);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    // 调用SDK查询是否为占位符（结果写入isPlaceholder）
    bool isPlaceholder = false;
    // [StartExclude is_placeholder_file]
    LOGW("OH_CloudDisk_IsPlaceholderFile syncPath: %{public}s, relativePath: %{public}s.", syncPath, relativePath);
    // [EndExclude is_placeholder_file]
    auto ret = OH_CloudDisk_IsPlaceholderFile(syncFolderPath, relativePathInfo, &isPlaceholder);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_IsPlaceholderFile failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_IsPlaceholderFile success, isPlaceholder: %{public}d.", isPlaceholder);
    }

    delete[] syncPath;
    delete[] relativePath;

    // 构造JS返回对象 { code, isPlaceholder }
    napi_value result;
    napi_create_object(env, &result);
    napi_value codeVal;
    napi_create_int32(env, ret, &codeVal);
    napi_set_named_property(env, result, "code", codeVal);
    napi_value boolVal;
    napi_get_boolean(env, isPlaceholder, &boolVal);
    napi_set_named_property(env, result, "isPlaceholder", boolVal);
    return result;
}
// [End is_placeholder_file]

// ============================================================================
// 16. updatePlaceholder(syncPath, relativePath, atimeMs, mtimeMs, logicalSize): number
//     更新占位符文件的元数据（时间戳、逻辑大小）。
//     OH_CloudDisk_UpdatePlaceholder(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_PathInfo relativePathInfo,
//         const OH_CloudDisk_PlaceholderInfo placeholderInfo,
//         const OH_CloudDisk_PlaceholderCustomInfo *customInfo)
//     customInfo = NULL
// ============================================================================
// [Start update_placeholder]
static napi_value UpdatePlaceholder(napi_env env, napi_callback_info info)
{
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("UpdatePlaceholder invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 解析需要更新的时间与大小
    uint64_t atimeMs = static_cast<uint64_t>(GetNumberParam(env, args[2]));
    uint64_t mtimeMs = static_cast<uint64_t>(GetNumberParam(env, args[3]));
    uint64_t logicalSize = static_cast<uint64_t>(GetNumberParam(env, args[4]));

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    // 构造新的占位符元数据
    OH_CloudDisk_PlaceholderInfo placeholderInfo = {};
    placeholderInfo.atimeMs = atimeMs;       // 访问时间（毫秒）
    placeholderInfo.mtimeMs = mtimeMs;       // 修改时间（毫秒）
    placeholderInfo.logicalSize = logicalSize; // 逻辑大小（字节）

    // [StartExclude update_placeholder]
    LOGW("OH_CloudDisk_UpdatePlaceholder syncPath: %{public}s, relativePath: %{public}s.",
         syncPath, relativePath);
    // [EndExclude update_placeholder]
    // 更新占位符元数据
    auto ret = OH_CloudDisk_UpdatePlaceholder(syncFolderPath, relativePathInfo, placeholderInfo, NULL);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UpdatePlaceholder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UpdatePlaceholder success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End update_placeholder]

// ============================================================================
// 17. convertPlaceholderToFile(syncPath, relativePath): number
//     将占位符文件转换为普通文件（本地已有完整内容，不再需要水合）。
//     OH_CloudDisk_ConvertPlaceholderToFile(const CloudDisk_SyncFolderPath syncFolderPath,
//         const CloudDisk_PathInfo relativePathInfo)
// ============================================================================
// [Start convert_placeholder_to_file]
static napi_value ConvertPlaceholderToFile(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("ConvertPlaceholderToFile invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    // [StartExclude convert_placeholder_to_file]
    LOGW("OH_CloudDisk_ConvertPlaceholderToFile syncPath: %{public}s, relativePath: %{public}s.",
         syncPath, relativePath);
    // [EndExclude convert_placeholder_to_file]
    // 占位符转普通文件
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(syncFolderPath, relativePathInfo);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_ConvertPlaceholderToFile failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_ConvertPlaceholderToFile success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End convert_placeholder_to_file]

// ============================================================================
// 18a. markFileAsPlaceholder(syncPath, relativePath): number
//      将普通文件标记为占位符文件（本地文件变为"无内容"状态，按需水合）。
//      OH_CloudDisk_MarkFileAsPlaceholder(const CloudDisk_SyncFolderPath,
//          const CloudDisk_PathInfo)
// ============================================================================
static napi_value MarkFileAsPlaceholder(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("MarkFileAsPlaceholder invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    LOGW("OH_CloudDisk_MarkFileAsPlaceholder syncPath: %{public}s, relativePath: %{public}s.", syncPath, relativePath);
    // 普通文件标记为占位符
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(syncFolderPath, relativePathInfo);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_MarkFileAsPlaceholder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_MarkFileAsPlaceholder success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

// ============================================================================
// 18b. unmarkPlaceholderFile(syncPath, relativePath): number
//      取消占位符标记（恢复为普通文件）。
//      OH_CloudDisk_UnmarkPlaceholderFile(const CloudDisk_SyncFolderPath,
//          const CloudDisk_PathInfo)
// ============================================================================
static napi_value UnmarkPlaceholderFile(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("UnmarkPlaceholderFile invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    LOGW("OH_CloudDisk_UnmarkPlaceholderFile syncPath: %{public}s, relativePath: %{public}s.", syncPath, relativePath);
    // 取消占位符标记
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(syncFolderPath, relativePathInfo);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UnmarkPlaceholderFile failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UnmarkPlaceholderFile success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

// ============================================================================
// 18c. getPlaceholderCustomInfo(syncPath, relativePath): {code, dataLength, data}
//      读取占位符自定义信息（创建占位符时写入的云端文件标识等业务数据，上限4 KiB）。
//      OH_CloudDisk_GetPlaceholderCustomInfo(const CloudDisk_SyncFolderPath,
//          const CloudDisk_PathInfo, uint8_t *dataBuf, size_t *inOutDataLength)
// ============================================================================
static napi_value BuildCustomInfoResult(napi_env env, CloudDisk_ErrorCode ret,
                                        size_t dataLength, uint8_t* dataBuf)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value codeVal;
    napi_create_int32(env, ret, &codeVal);
    napi_set_named_property(env, resultObj, "code", codeVal);
    napi_value lenVal;
    napi_create_int32(env, (int32_t)dataLength, &lenVal);
    napi_set_named_property(env, resultObj, "dataLength", lenVal);

    if (ret == CLOUD_DISK_OK && dataLength > 0) {
        napi_value dataVal;
        napi_create_string_utf8(env, reinterpret_cast<char *>(dataBuf), dataLength, &dataVal);
        napi_set_named_property(env, resultObj, "data", dataVal);
    } else {
        napi_value dataVal;
        napi_create_string_utf8(env, "", 0, &dataVal);
        napi_set_named_property(env, resultObj, "data", dataVal);
    }
    return resultObj;
}

static napi_value GetPlaceholderCustomInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("GetPlaceholderCustomInfo invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo relativePathInfo = MakePathInfo(relativePath);

    // 分配自定义信息读取缓冲区（上限4096字节 = 4 KiB）
    size_t dataLength = 4096;
    uint8_t *dataBuf = (uint8_t *)malloc(dataLength);
    if (!dataBuf) {
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    LOGW("OH_CloudDisk_GetPlaceholderCustomInfo syncPath: %{public}s, relativePath: %{public}s.",
         syncPath, relativePath);
    // 读取自定义信息（dataLength为in/out参数，返回时携带实际读取长度）
    CloudDisk_ErrorCode ret =
        OH_CloudDisk_GetPlaceholderCustomInfo(syncFolderPath, relativePathInfo, dataBuf, &dataLength);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_GetPlaceholderCustomInfo failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_GetPlaceholderCustomInfo success, dataLength: %{public}zu.", dataLength);
    }

    napi_value resultObj = BuildCustomInfoResult(env, ret, dataLength, dataBuf);
    free(dataBuf);
    delete[] syncPath;
    delete[] relativePath;
    return resultObj;
}

// ============================================================================
// 19. dehydrateFile(syncPath, relativePath): number
//     去水合：将本地有真实内容的文件"瘦身"为只有元数据的占位符文件，
//     释放本地存储空间（内容仍保存在云端）。
//     OH_CloudDisk_DehydrateFile(const CloudDisk_SyncFolderPath *syncFolderPath,
//         const CloudDisk_PathInfo *filePath)
//     注意：本接口的参数是指针！
// ============================================================================
// [Start dehydrate_file]
static napi_value DehydrateFile(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    if (!syncPath || !relativePath) {
        LOGE("DehydrateFile invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo filePath = MakePathInfo(relativePath);

    // [StartExclude dehydrate_file]
    LOGW("OH_CloudDisk_DehydrateFile syncPath: %{public}s, relativePath: %{public}s.", syncPath, relativePath);
    // [EndExclude dehydrate_file]
    // 去水合（注意这里传的是结构体指针，与其它接口传值不同）
    auto ret = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_DehydrateFile failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_DehydrateFile success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End dehydrate_file]

// ============================================================================
// 19. hydratePlaceholder(syncPath, relativePath, callbackType): number
//     水合：把占位符文件的真实内容从云端拉取到本地。
//     水合是"异步 + 回调表"模式：SDK会通过之前注册的CallbackTable回调
//     通知应用"请提供文件内容"，应用随后调用Execute回传内容。
//     OH_CloudDisk_HydratePlaceholder(const CloudDisk_SyncFolderPath *syncFolderPath,
//         const CloudDisk_PathInfo *filePath,
//         OH_CloudDisk_CallbackType type,
//         OH_CloudDisk_HydratePriority priority)
//     注意：syncFolderPath和filePath是指针！
//     priority = CLOUD_DISK_HYDRATE_PRIORITY_NORMAL（普通优先级）
//     reqKey会在回调中保存，供后续Execute使用
// ============================================================================
// [Start hydrate_placeholder]
static napi_value HydratePlaceholder(napi_env env, napi_callback_info info)
{
    LOGI("HydratePlaceholder start.");
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    GetArgs(env, info, argc, args);

    // 解析入参：同步根路径 + 相对路径 + 回调类型
    char* syncPath = GetStringParam(env, args[0]);
    char* relativePath = GetStringParam(env, args[1]);
    LOGI("HydratePlaceholder syncPath: %{public}s, relativePath: %{public}s.", syncPath, relativePath);
    if (!syncPath || !relativePath) {
        LOGE("HydratePlaceholder invalid params.");
        delete[] syncPath;
        delete[] relativePath;
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 回调类型：FETCH_DATA(取数据)/CANCEL_FETCH_DATA(取消取数据)/DEHYDRATE(去水合) 等
    int64_t callbackType = GetNumberParam(env, args[2]);

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);
    CloudDisk_PathInfo filePath = MakePathInfo(relativePath);

    // [StartExclude hydrate_placeholder]
    LOGW("OH_CloudDisk_HydratePlaceholder syncPath: %{public}s, relativePath: %{public}s, callbackType: %{public}lld.",
         syncPath, relativePath, (long long)callbackType);
    // [EndExclude hydrate_placeholder]
    // 发起水合请求（异步，结果通过回调表回调返回）
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePath,
        static_cast<OH_CloudDisk_CallbackType>(callbackType),
        CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_HydratePlaceholder failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_HydratePlaceholder success.");
    }

    delete[] syncPath;
    delete[] relativePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End hydrate_placeholder]

// ============================================================================
// 深拷贝辅助函数 — 用于线程安全的FETCH_DATA处理
// ----------------------------------------------------------------------------
// 回调表回调（OnCallbackTableCallback）运行在SDK内部线程，且回调结束后
// reqHead/reqContext指向的内存可能被释放。因此需要深拷贝到堆上，
// 供后续Execute手动执行时安全读取。
// ============================================================================

// 深拷贝请求头：复制syncFolderPath与reqKey（均为DataBuf，需逐字节拷贝）
static OH_CloudDisk_CallbackReqHead *DeepCopyReqHead(const OH_CloudDisk_CallbackReqHead &reqHead)
{
    OH_CloudDisk_CallbackReqHead *copy = new OH_CloudDisk_CallbackReqHead();
    copy->callbackType = reqHead.callbackType; // 回调类型

    // 深拷贝同步根路径
    if (reqHead.syncFolderPath.value && reqHead.syncFolderPath.length > 0) {
        char *buf = new char[reqHead.syncFolderPath.length + 1];
        memcpy(buf, reqHead.syncFolderPath.value, reqHead.syncFolderPath.length);
        buf[reqHead.syncFolderPath.length] = '\0';
        copy->syncFolderPath.value = buf;
        copy->syncFolderPath.length = reqHead.syncFolderPath.length;
    } else {
        copy->syncFolderPath.value = nullptr;
        copy->syncFolderPath.length = 0;
    }

    // 深拷贝reqKey（云端下发的任务标识，Execute时需原样回传）
    if (reqHead.reqKey.data && reqHead.reqKey.dataSize > 0) {
        uint8_t *buf = new uint8_t[reqHead.reqKey.dataSize];
        memcpy(buf, reqHead.reqKey.data, reqHead.reqKey.dataSize);
        copy->reqKey.data = buf;
        copy->reqKey.dataSize = reqHead.reqKey.dataSize;
    } else {
        copy->reqKey.data = nullptr;
        copy->reqKey.dataSize = 0;
    }

    return copy;
}

// 深拷贝FETCH_DATA请求上下文：复制文件路径与优先级
static OH_CloudDisk_CallbackContext *DeepCopyFetchContext(const OH_CloudDisk_CallbackContext &ctx)
{
    OH_CloudDisk_FetchDataRequest *fetchData = new OH_CloudDisk_FetchDataRequest();
    fetchData->priority = ctx.fetchData->priority; // 水合优先级

    // 深拷贝需要拉取内容的文件相对路径
    if (ctx.fetchData->filePath.value && ctx.fetchData->filePath.length > 0) {
        char *buf = new char[ctx.fetchData->filePath.length + 1];
        memcpy(buf, ctx.fetchData->filePath.value, ctx.fetchData->filePath.length);
        buf[ctx.fetchData->filePath.length] = '\0';
        fetchData->filePath.value = buf;
        fetchData->filePath.length = ctx.fetchData->filePath.length;
    } else {
        fetchData->filePath.value = nullptr;
        fetchData->filePath.length = 0;
    }

    OH_CloudDisk_CallbackContext *copy = new OH_CloudDisk_CallbackContext();
    copy->fetchData = fetchData;
    return copy;
}

// 释放深拷贝的请求头（逆序释放所有成员）
static void FreeHeapReqHead(OH_CloudDisk_CallbackReqHead *p)
{
    if (!p) { return; }
    delete[] p->syncFolderPath.value;
    delete[] p->reqKey.data;
    delete p;
}

// 释放深拷贝的FETCH_DATA上下文
static void FreeHeapFetchContext(OH_CloudDisk_CallbackContext *p)
{
    if (!p) { return; }
    if (p->fetchData) {
        delete[] p->fetchData->filePath.value;
        delete p->fetchData;
    }
    delete p;
}

// ============================================================================
// 辅助函数：根据回调类型深拷贝请求上下文到全局静态缓存
// ----------------------------------------------------------------------------
// 回调结束后原reqContext内存可能失效，这里把FETCH_DATA / CANCEL_FETCH_DATA /
// DEHYDRATE（含FETCH_RANGE_DATA）三类上下文拷贝到全局静态字符串/结构体中，
// 供后续Execute手动执行时安全读取。
// ============================================================================
static OH_CloudDisk_CallbackContext CopyCallbackContext(const OH_CloudDisk_CallbackReqHead &reqHead,
                                                        OH_CloudDisk_CallbackContext &reqContext)
{
    OH_CloudDisk_CallbackContext copiedContext = {};
    if (reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA && reqContext.fetchData) {
        // FETCH_DATA：云端需要占位符文件的真实内容，应用需通过Execute回传
        g_lastFetchDataPathStr =
            std::string(reqContext.fetchData->filePath.value, reqContext.fetchData->filePath.length);
        g_lastFetchDataReq.filePath.value = const_cast<char *>(g_lastFetchDataPathStr.c_str());
        g_lastFetchDataReq.filePath.length = g_lastFetchDataPathStr.length();
        g_lastFetchDataReq.priority = reqContext.fetchData->priority; // 水合优先级
        copiedContext.fetchData = &g_lastFetchDataReq;
        LOGI("  FETCH_DATA: filePath=%{public}s, priority=%{public}d.",
             g_lastFetchDataPathStr.c_str(), reqContext.fetchData->priority);
    } else if (reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA && reqContext.cancelFetchData) {
        // CANCEL_FETCH_DATA：取消某个文件的水合（云端通知，应用无需回传数据）
        g_lastCancelFetchDataPathStr =
            std::string(reqContext.cancelFetchData->value, reqContext.cancelFetchData->length);
        g_lastCancelFetchDataPathInfo.value = const_cast<char *>(g_lastCancelFetchDataPathStr.c_str());
        g_lastCancelFetchDataPathInfo.length = g_lastCancelFetchDataPathStr.length();
        copiedContext.cancelFetchData = &g_lastCancelFetchDataPathInfo;
        LOGI("  CANCEL_FETCH_DATA: filePath=%{public}s.", g_lastCancelFetchDataPathStr.c_str());
    } else if ((reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE ||
                reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_RANGE_DATA) && reqContext.dehydrateData) {
        // DEHYDRATE / FETCH_RANGE_DATA：去水合授权 / 分段取数
        g_lastDehydratePathStr =
            std::string(reqContext.dehydrateData->filePath.value, reqContext.dehydrateData->filePath.length);
        g_lastDehydrateInfo.filePath.value = const_cast<char *>(g_lastDehydratePathStr.c_str());
        g_lastDehydrateInfo.filePath.length = g_lastDehydratePathStr.length();
        // 自动授权去水合（allow=true，允许SDK删除本地真实内容）
        reqContext.dehydrateData->allow = true;
        g_lastDehydrateInfo.allow = true;
        copiedContext.dehydrateData = &g_lastDehydrateInfo;
        LOGI("  DEHYDRATE: filePath=%{public}s, allow=true (auto-authorized).", g_lastDehydratePathStr.c_str());
    }
    return copiedContext;
}

// ============================================================================
// CallbackTable C层回调 — registerCallbackTable的回调入口
// ----------------------------------------------------------------------------
// 这是"回调表"机制的核心：SDK在水合/去水合等操作需要应用介入时调用此回调，
// 应用在此回调中拿到reqHead（含reqKey）与reqContext（请求上下文），
// 然后通过Execute把数据（如文件内容）回传给SDK。
// 自动水合：注册回调表时若填写了"水合数据文件"，回调到达后自动读取该文件
// 内容并分块Execute回传（与参考工程clouddiskdemo逻辑一致）。
// g_fetchFilePath为空时不自动执行，走上方手动模式。
static constexpr size_t MAX_FETCH_CHUNK_SIZE = 128 * 1024; // 128KB

// 辅助函数：读取文件内容到缓冲区
static bool ReadFileContent(const std::string &fullPath, uint8_t *&outBuf, size_t &outLen)
{
    FILE *fp = fopen(fullPath.c_str(), "rb");
    if (!fp) {
        LOGE("AutoHydrate: failed to open file, errno=%{public}d", errno);
        return false;
    }

    if (fseek(fp, 0, SEEK_END) != 0) {
        LOGE("AutoHydrate: fseek END failed.");
        fclose(fp);
        return false;
    }
    long fileSize = ftell(fp);
    if (fseek(fp, 0, SEEK_SET) != 0) {
        LOGE("AutoHydrate: fseek SET failed.");
        fclose(fp);
        return false;
    }

    outBuf = nullptr;
    outLen = 0;
    if (fileSize > 0) {
        outBuf = (uint8_t *)malloc(fileSize);
        if (outBuf) {
            outLen = fread(outBuf, 1, fileSize, fp);
        }
    }
    if (fclose(fp) != 0) {
        LOGE("AutoHydrate: fclose failed.");
    }
    LOGI("AutoHydrate: fileSize=%{public}ld, contentLen=%{public}zu", fileSize, outLen);
    return true;
}

// 辅助函数：分块Execute回传文件内容
static void ExecuteChunkedData(const OH_CloudDisk_CallbackReqHead *reqHead,
    const OH_CloudDisk_CallbackContext *reqContext,
    uint8_t *buf, size_t contentLen)
{
    size_t offset = 0;
    while (offset < contentLen) {
        size_t remaining = contentLen - offset;
        size_t chunkSize = (remaining > MAX_FETCH_CHUNK_SIZE) ? MAX_FETCH_CHUNK_SIZE : remaining;
        bool isLast = (offset + chunkSize >= contentLen);

        OH_CloudDisk_FetchData fetchData = {};
        fetchData.offset = offset;
        fetchData.size = chunkSize;
        fetchData.totalSize = contentLen;
        fetchData.data.data = buf + offset;
        fetchData.data.dataSize = chunkSize;
        fetchData.isComplete = isLast;

        OH_CloudDisk_CallbackResponse rsp = {};
        rsp.fetchData = &fetchData;

        LOGI("AutoHydrate: Execute chunk offset=%{public}zu, chunkSize=%{public}zu, "
             "isComplete=%{public}d", offset, chunkSize, (int)isLast);
        CloudDisk_ErrorCode execRet = OH_CloudDisk_Execute(*reqHead, *reqContext, rsp);
        LOGI("AutoHydrate: Execute ret: %{public}d", execRet);

        if (execRet != CLOUD_DISK_OK) {
            LOGE("AutoHydrate: Execute failed at offset=%{public}zu.", offset);
            break;
        }
        offset += chunkSize;
    }
}

// 辅助函数：在线程中读取水合数据文件并分块Execute回传
static void AutoHydrateFetchData(OH_CloudDisk_CallbackReqHead *heapReqHead,
    OH_CloudDisk_CallbackContext *heapContext)
{
    LOGI("AutoHydrate: syncFolder=%{public}s, file=%{public}s, fetchFilePath=%{public}s",
         heapReqHead->syncFolderPath.value, heapContext->fetchData->filePath.value,
         g_fetchFilePath.c_str());
    if (g_fetchFilePath.empty()) {
        return;
    }

    uint8_t *buf = nullptr;
    size_t contentLen = 0;
    if (!ReadFileContent(g_fetchFilePath, buf, contentLen)) {
        return;
    }

    ExecuteChunkedData(heapReqHead, heapContext, buf, contentLen);

    if (buf) {
        free(buf);
    }
}

// ============================================================================
// [Start on_callback_table_callback]
static void OnCallbackTableCallback(const OH_CloudDisk_CallbackReqHead reqHead,
                                    OH_CloudDisk_CallbackContext reqContext)
{
    LOGI("OnCallbackTableCallback: callbackType=%{public}d.", reqHead.callbackType);

    // 以同步根路径为key保存请求头（供后续查询）
    std::string syncPathKey(reqHead.syncFolderPath.value, reqHead.syncFolderPath.length);
    g_lastReqHeadMap[syncPathKey] = reqHead;

    // 保存reqKey到全局map（getCallbackReqKey从中读取），
    // 同时递增版本号，供ETS侧轮询判断"新的reqKey是否已就绪"
    uint64_t reqKeyU64 = 0;
    if (reqHead.reqKey.data != nullptr && reqHead.reqKey.dataSize > 0) {
        // 深拷贝reqKey数据（回调结束后原内存可能被释放）
        uint8_t* keyData = new uint8_t[reqHead.reqKey.dataSize];
        memcpy(keyData, reqHead.reqKey.data, reqHead.reqKey.dataSize);

        OH_CloudDisk_DataBuf storedKey = {};
        storedKey.data = keyData;
        storedKey.dataSize = reqHead.reqKey.dataSize;
        g_reqKeyMap[syncPathKey] = storedKey;
        g_reqKeyVersion.fetch_add(1, std::memory_order_release);

        // 把reqKey字节序转换为uint64便于日志查看（小端序）
        const size_t uint64Size = sizeof(uint64_t);
        if (reqHead.reqKey.dataSize >= uint64Size) {
            for (size_t i = 0; i < uint64Size; ++i) {
                reqKeyU64 |= static_cast<uint64_t>(reqHead.reqKey.data[i]) << (i * uint64Size);
            }
        }
        LOGI("OnCallbackTableCallback: stored reqKey for path=%{public}s, dataSize=%{public}llu, "
             "reqKeyU64=%{public}llu.",
             syncPathKey.c_str(), (unsigned long long)reqHead.reqKey.dataSize, (unsigned long long)reqKeyU64);
    }

    // 根据回调类型深拷贝请求上下文（原内存回调结束后可能失效）
    OH_CloudDisk_CallbackContext copiedContext = CopyCallbackContext(reqHead, reqContext);

    // 保存深拷贝后的上下文
    g_lastReqContextMap[syncPathKey] = copiedContext;

    // 手动模式：仅保存reqKey与上下文，由UI手动触发Execute。
    if (reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA && reqContext.fetchData) {
        LOGI("OnCallbackTableCallback: FETCH_DATA stored for manual execute, "
             "syncFolder: %{public}s, file: %{public}s.",
             reqHead.syncFolderPath.value, reqContext.fetchData->filePath.value);
    }

    // 自动水合：注册回调表时若填写了"水合数据文件"，回调到达后自动读取该文件
    // 内容并分块Execute回传。g_fetchFilePath为空时不自动执行，走上方手动模式。
    if (reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA && reqContext.fetchData) {
        OH_CloudDisk_CallbackReqHead *heapReqHead = DeepCopyReqHead(reqHead);
        OH_CloudDisk_CallbackContext *heapContext = DeepCopyFetchContext(copiedContext);
        std::thread([heapReqHead, heapContext]() {
            AutoHydrateFetchData(heapReqHead, heapContext);
            FreeHeapReqHead(heapReqHead);
            FreeHeapFetchContext(heapContext);
        }).detach();
    }
}
// [End on_callback_table_callback]

// ============================================================================
// 20. registerCallbackTable(syncPath): number
//     注册回调表。注册后，水合/去水合等需要应用介入的操作会通过回调表
//     通知应用（回调函数OnCallbackTableCallback）。
//     OH_CloudDisk_RegisterCallbackTable(const CloudDisk_SyncFolderPath syncFolderPath,
//         void (*callback)(const OH_CloudDisk_CallbackReqHead, OH_CloudDisk_CallbackContext))
// ============================================================================
// [Start register_callback_table]
static napi_value RegisterCallbackTable(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    if (!syncPath) {
        LOGE("RegisterCallbackTable syncPath is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 可选第二参数：水合数据文件名（用于FETCH_DATA自动执行）
    char* fetchFileName = GetStringParam(env, args[1]);
    if (fetchFileName && fetchFileName[0] != '\0') {
        g_fetchFilePath = std::string("/data/storage/el2/base/haps/entry/files/") + std::string(fetchFileName);
        LOGI("RegisterCallbackTable: fetchFilePath=%{public}s.", g_fetchFilePath.c_str());
        delete[] fetchFileName;
    } else {
        // 不填（nullptr）或空字符串：清空残留路径，关闭自动执行，避免残留旧值导致重复Execute
        if (fetchFileName) {
            delete[] fetchFileName;
        }
        g_fetchFilePath.clear();
        LOGW("RegisterCallbackTable: fetchFilePath cleared, auto-execute disabled.");
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);

    // [StartExclude register_callback_table]
    LOGW("OH_CloudDisk_RegisterCallbackTable syncPath: %{public}s.", syncPath);
    // [EndExclude register_callback_table]
    // 注册回调表（回调函数为OnCallbackTableCallback）
    auto ret = OH_CloudDisk_RegisterCallbackTable(syncFolderPath, &OnCallbackTableCallback);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_RegisterCallbackTable failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_RegisterCallbackTable success.");
    }

    delete[] syncPath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End register_callback_table]

// ============================================================================
// 21. unregisterCallbackTable(syncPath): number
//     注销回调表。注销后该同步根不再接收回调表回调。
//     OH_CloudDisk_UnregisterCallbackTable(const CloudDisk_SyncFolderPath syncFolderPath)
// ============================================================================
// [Start unregister_callback_table]
static napi_value UnregisterCallbackTable(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    GetArgs(env, info, argc, args);

    char* syncPath = GetStringParam(env, args[0]);
    if (!syncPath) {
        LOGE("UnregisterCallbackTable syncPath is empty.");
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    CloudDisk_SyncFolderPath syncFolderPath = MakePathInfo(syncPath);

    // [StartExclude unregister_callback_table]
    LOGW("OH_CloudDisk_UnregisterCallbackTable syncPath: %{public}s.", syncPath);
    // [EndExclude unregister_callback_table]
    // 注销回调表
    auto ret = OH_CloudDisk_UnregisterCallbackTable(syncFolderPath);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_UnregisterCallbackTable failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_UnregisterCallbackTable success.");
    }

    delete[] syncPath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End unregister_callback_table]

// ============================================================================
// Execute上下文结构体 — 聚合Execute所需的全部入参与局部结构体
// ----------------------------------------------------------------------------
// 把分散的参数与需要跨OH_CloudDisk_Execute调用的局部结构体集中存放，
// 既降低BuildReqContext等辅助函数的参数个数，也保证这些结构体的
// 生命周期覆盖后续OH_CloudDisk_Execute调用。
// ============================================================================
struct ExecuteContext {
    int64_t callbackType;       // 回调类型
    int64_t reqKeyInt;          // 回调中保存的任务标识（uint64_t以int64透传）
    char* syncPath;             // 同步根路径
    char* filePath;             // 文件相对路径
    napi_value fileContentVal;  // 文件内容（JS字符串）
    uint64_t offset;            // 数据偏移（分段取数用）
    uint64_t size;              // 本次回传的数据长度
    bool isComplete;            // 是否为最后一块数据
    uint64_t totalSize;         // 文件总大小（字节）
    uint8_t* contentBytes;      // 文件内容字节缓冲区
    size_t contentLen;          // 文件内容字节长度
    OH_CloudDisk_FetchDataRequest fetchDataReq;  // 取数据请求
    CloudDisk_PathInfo cancelFetchPath;           // 取消取数据路径
    OH_CloudDisk_RangeInfo rangeInfo;             // 分段取数信息
    OH_CloudDisk_DehydrateInfo dehydrateInfo;     // 去水合信息
};

// ============================================================================
// 辅助函数：根据回调类型构造请求上下文（BuildReqContext）
// ----------------------------------------------------------------------------
// reqContext中的指针指向ExecuteContext中的成员（fetchDataReq等），
// 调用方需保证ExecuteContext的生命周期覆盖后续OH_CloudDisk_Execute调用。
// ============================================================================
static void BuildReqContext(OH_CloudDisk_CallbackContext &reqContext,
                            const OH_CloudDisk_CallbackReqHead &reqHead, ExecuteContext &ctx)
{
    switch (reqHead.callbackType) {
        case CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA:
            // 取数据：指定需要回传内容的文件
            ctx.fetchDataReq.filePath = MakePathInfo(ctx.filePath);
            ctx.fetchDataReq.priority = CLOUD_DISK_HYDRATE_PRIORITY_NORMAL; // 水合优先级：普通
            reqContext.fetchData = &ctx.fetchDataReq;
            break;
        case CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA:
            // 取消取数据：指定取消水合的文件
            ctx.cancelFetchPath = MakePathInfo(ctx.filePath);
            reqContext.cancelFetchData = &ctx.cancelFetchPath;
            break;
        case CLOUD_DISK_CALLBACK_TYPE_FETCH_RANGE_DATA:
            // 分段取数：指定文件、偏移、长度与本次数据
            ctx.rangeInfo.filePath = MakePathInfo(ctx.filePath);
            ctx.rangeInfo.offset = ctx.offset;          // 本次数据在文件中的起始偏移
            ctx.rangeInfo.size = ctx.size;              // 本次数据长度
            ctx.rangeInfo.data.data = ctx.contentBytes; // 本次回传的数据
            ctx.rangeInfo.data.dataSize = ctx.contentLen;
            reqContext.fetchRangeData = &ctx.rangeInfo;
            break;
        case CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE:
            // 去水合：allow表示是否允许云端删除本地真实内容（这里复用isComplete参数）
            ctx.dehydrateInfo.filePath = MakePathInfo(ctx.filePath);
            ctx.dehydrateInfo.allow = ctx.isComplete;
            reqContext.dehydrateData = &ctx.dehydrateInfo;
            break;
        default:
            break;
    }
}

// 辅助函数：解析Execute的全部入参到ExecuteContext
// 返回false表示入参非法（syncPath/filePath为空，已在内部释放），调用方据此返回错误码。
static bool ParseExecuteArgs(napi_env env, napi_callback_info info, ExecuteContext &ctx)
{
    size_t argc = 9;
    napi_value args[9] = {nullptr};
    GetArgs(env, info, argc, args);

    // Execute参数索引定义
    enum ArgIndex {
        ARG_CALLBACK_TYPE = 0,
        ARG_REQ_KEY = 1,
        ARG_SYNC_PATH = 2,
        ARG_FILE_PATH = 3,
        ARG_FILE_CONTENT = 4,
        ARG_OFFSET = 5,
        ARG_SIZE = 6,
        ARG_IS_COMPLETE = 7,
        ARG_TOTAL_SIZE = 8,
    };

    // 解析入参：回调类型、reqKey（回调中保存的任务标识）、同步根路径、文件路径
    ctx.callbackType = GetNumberParam(env, args[ARG_CALLBACK_TYPE]);
    ctx.reqKeyInt = GetNumberParam(env, args[ARG_REQ_KEY]);
    ctx.syncPath = GetStringParam(env, args[ARG_SYNC_PATH]);
    ctx.filePath = GetStringParam(env, args[ARG_FILE_PATH]);

    // fileContent以字符串形式传入（ETS侧传字符串，而非ArrayBuffer）
    ctx.fileContentVal = args[ARG_FILE_CONTENT];
    ctx.offset = static_cast<uint64_t>(GetNumberParam(env, args[ARG_OFFSET]));  // 数据偏移（分段取数用）
    ctx.size = static_cast<uint64_t>(GetNumberParam(env, args[ARG_SIZE]));    // 本次回传的数据长度
    ctx.isComplete = false;
    napi_get_value_bool(env, args[ARG_IS_COMPLETE], &ctx.isComplete); // 是否为最后一块数据
    ctx.totalSize = static_cast<uint64_t>(GetNumberParam(env, args[ARG_TOTAL_SIZE])); // 文件总大小（字节）

    if (!ctx.syncPath || !ctx.filePath) {
        LOGE("Execute invalid params.");
        delete[] ctx.syncPath;
        delete[] ctx.filePath;
        return false;
    }
    return true;
}

// 辅助函数：构造请求头（回调类型 + 同步根路径 + reqKey）
// reqKeyData由本函数分配，调用方负责在Execute完成后delete[]释放。
static void BuildReqHead(OH_CloudDisk_CallbackReqHead &reqHead, int64_t callbackType,
                         char* syncPath, int64_t reqKeyInt, uint8_t* &reqKeyData)
{
    reqHead.syncFolderPath = MakePathInfo(syncPath);
    reqHead.callbackType = static_cast<OH_CloudDisk_CallbackType>(callbackType);
    // 把uint64_t类型的reqKey序列化为DataBuf（小端字节序，与回调时一致）
    reqKeyData = new uint8_t[sizeof(uint64_t)];
    memcpy(reqKeyData, &reqKeyInt, sizeof(uint64_t));
    reqHead.reqKey.data = reqKeyData;
    reqHead.reqKey.dataSize = sizeof(uint64_t);
}

// 辅助函数：构造回调响应（FETCH_DATA / FETCH_RANGE_DATA类型需要回传文件数据）
static void BuildCallbackResponse(OH_CloudDisk_CallbackResponse &rsp,
                                  OH_CloudDisk_FetchData &fetchDataRsp,
                                  const OH_CloudDisk_CallbackReqHead &reqHead,
                                  const ExecuteContext &ctx)
{
    if (reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA ||
        reqHead.callbackType == CLOUD_DISK_CALLBACK_TYPE_FETCH_RANGE_DATA) {
        fetchDataRsp.offset = ctx.offset;             // 数据起始偏移
        fetchDataRsp.size = ctx.size;                 // 本次数据长度
        fetchDataRsp.totalSize = ctx.totalSize;       // 文件总大小
        fetchDataRsp.data.data = ctx.contentBytes;    // 文件内容数据
        fetchDataRsp.data.dataSize = ctx.contentLen;  // 内容数据长度
        fetchDataRsp.isComplete = ctx.isComplete;     // 是否为最后一块
        rsp.fetchData = &fetchDataRsp;
    }
}

// ============================================================================
// 22. execute(callbackType, reqKey, syncPath, filePath, fileContent, offset, size, isComplete, totalSize): number
//     执行回调响应：把应用准备好的数据（如文件内容）回传给云盘SDK。
//     这是水合流程的"最后一环"：
//       1) hydratePlaceholder发起水合 -> 2) 回调表通知应用提供内容
//       -> 3) 应用调用Execute回传内容 -> 4) 云端把内容写入本地文件
//     OH_CloudDisk_Execute(const OH_CloudDisk_CallbackReqHead reqHead,
//         OH_CloudDisk_CallbackContext reqContext,
//         OH_CloudDisk_CallbackResponse rsp)
// ============================================================================
// [Start execute]
static napi_value Execute(napi_env env, napi_callback_info info)
{
    ExecuteContext ctx = {};
    if (!ParseExecuteArgs(env, info, ctx)) {
        napi_value result;
        napi_create_int32(env, CLOUD_DISK_INVALID_ARG, &result);
        return result;
    }

    // 构造请求头：回调类型 + 同步根路径 + reqKey
    uint8_t* reqKeyData = nullptr;
    OH_CloudDisk_CallbackReqHead reqHead = {};
    BuildReqHead(reqHead, ctx.callbackType, ctx.syncPath, ctx.reqKeyInt, reqKeyData);

    // 把JS字符串内容转为字节缓冲区（先查长度，再拷贝）
    ctx.contentLen = 0;
    napi_get_value_string_utf8(env, ctx.fileContentVal, nullptr, 0, &ctx.contentLen);
    char* contentBuf = new char[ctx.contentLen + 1];
    memset(contentBuf, 0, ctx.contentLen + 1);
    napi_get_value_string_utf8(env, ctx.fileContentVal, contentBuf, ctx.contentLen + 1, &ctx.contentLen);
    ctx.contentBytes = reinterpret_cast<uint8_t*>(contentBuf);
    LOGI("Execute: fileContent len=%{public}zu, content=%{public}s.", ctx.contentLen, contentBuf);

    // 根据回调类型构造请求上下文（ExecuteContext成员生命周期覆盖Execute调用）
    OH_CloudDisk_CallbackContext reqContext = {};
    BuildReqContext(reqContext, reqHead, ctx);

    // 构造回调响应：FETCH_DATA / FETCH_RANGE_DATA类型需要回传文件数据
    OH_CloudDisk_CallbackResponse rsp = {};
    OH_CloudDisk_FetchData fetchDataRsp = {};
    BuildCallbackResponse(rsp, fetchDataRsp, reqHead, ctx);

    // [StartExclude execute]
    LOGW("OH_CloudDisk_Execute callbackType: %{public}lld, syncPath: %{public}s, filePath: %{public}s.",
         (long long)ctx.callbackType, ctx.syncPath, ctx.filePath);
    // [EndExclude execute]
    // 执行回调响应，把内容回传给云盘SDK
    auto ret = OH_CloudDisk_Execute(reqHead, reqContext, rsp);
    if (ret != CLOUD_DISK_OK) {
        LOGE("OH_CloudDisk_Execute failed, errorCode: %{public}d.", ret);
    } else {
        LOGI("OH_CloudDisk_Execute success.");
    }

    // 释放本函数内申请的内存
    delete[] reqKeyData;
    delete[] contentBuf;
    delete[] ctx.syncPath;
    delete[] ctx.filePath;

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End execute]

// ============================================================================
// 23. getCallbackReqKey(): number
//     获取最近一次回调保存的reqKey（uint64_t以double返回）。
//     ETS侧在"水合"成功后读取它，作为Execute的参数之一回传云端。
// ============================================================================
static napi_value GetCallbackReqKey(napi_env env, napi_callback_info info)
{
    // 从map中读取最近保存的reqKey
    if (g_reqKeyMap.empty()) {
        LOGW("GetCallbackReqKey: no reqKey stored.");
        napi_value result;
        napi_create_double(env, 0.0, &result);
        return result;
    }

    // 取第一个保存的reqKey，从字节流还原为uint64_t
    auto it = g_reqKeyMap.begin();
    uint64_t reqKeyInt = 0;
    if (it->second.data != nullptr && it->second.dataSize >= sizeof(uint64_t)) {
        memcpy(&reqKeyInt, it->second.data, sizeof(uint64_t));
    }
    LOGI("GetCallbackReqKey: returning reqKey=%{public}llu, version=%{public}llu.",
         (unsigned long long)reqKeyInt, (unsigned long long)g_reqKeyVersion.load(std::memory_order_acquire));

    napi_value result;
    napi_create_double(env, (double)reqKeyInt, &result);
    return result;
}

// ============================================================================
// 24. getCallbackReqKeyVersion(): number
//     获取reqKey版本号。每次回调保存新的reqKey时版本号 +1。
//     ETS侧用它轮询判断"水合回调的reqKey是否已经就绪"，
//     从而避免在回调尚未到达时读取到旧的reqKey。
// ============================================================================
static napi_value GetCallbackReqKeyVersion(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_double(env, (double)g_reqKeyVersion.load(std::memory_order_acquire), &result);
    return result;
}

// ============================================================================
// 模块初始化 — 注册全部NAPI方法
// ----------------------------------------------------------------------------
// 每个方法通过napi_property_descriptor注册到exports，
// ETS侧import后即可通过cloudDisk.xxx调用。
// ============================================================================
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        // ---- 同步根管理 ----
        {"registerSyncFolder", nullptr, RegisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unRegisterSyncFolder", nullptr, UnregisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unRegisterAllSyncFolder", nullptr, UnregisterAllSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"activeSyncFolder", nullptr, ActiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deactiveSyncFolder", nullptr, DeactiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAllSyncFolder", nullptr, GetAllSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateDisplayName", nullptr, UpdateDisplayName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerSyncFolderChange", nullptr, RegisterSyncFolderChange,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unRegisterSyncFolderChange", nullptr, UnregisterSyncFolderChange,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSyncFolderChanges", nullptr, GetSyncFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setFileSyncStates", nullptr, SetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFileSyncStates", nullptr, GetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCallback", nullptr, RegisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        // ---- 占位符 / 水合 / 回调表 ----
        {"createPlaceholderFile", nullptr, CreatePlaceholderFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isPlaceholderFile", nullptr, IsPlaceholderFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updatePlaceholder", nullptr, UpdatePlaceholder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"convertPlaceholderToFile", nullptr, ConvertPlaceholderToFile,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"markFileAsPlaceholder", nullptr, MarkFileAsPlaceholder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unmarkPlaceholderFile", nullptr, UnmarkPlaceholderFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPlaceholderCustomInfo", nullptr, GetPlaceholderCustomInfo,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dehydrateFile", nullptr, DehydrateFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hydratePlaceholder", nullptr, HydratePlaceholder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCallbackTable", nullptr, RegisterCallbackTable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unregisterCallbackTable", nullptr, UnregisterCallbackTable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execute", nullptr, Execute, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCallbackReqKey", nullptr, GetCallbackReqKey, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCallbackReqKeyVersion", nullptr, GetCallbackReqKeyVersion,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    // 一次性注册全部方法到模块导出对象
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

// 定义NAPI模块（模块名 "entry"，ETS侧通过import引入）
static napi_module demoModule = {
    .nm_version = 1,        // NAPI模块版本
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init, // 模块注册函数（初始化时被调用）
    .nm_modname = "entry",    // 模块名称，须与工程模块名一致
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

// 模块构造器：动态库加载时自动注册该NAPI模块
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
