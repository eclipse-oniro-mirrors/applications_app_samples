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

#ifndef CLOUD_DISK_API_26_1_COMPAT_H
#define CLOUD_DISK_API_26_1_COMPAT_H

// 本机 SDK 为 26.0.0，其 oh_cloud_disk_manager.h 尚未包含 26.0.1/26.1.0 新增的
// 占位符、水合、脱水与回调表接口，而开发板系统库 libohclouddiskmanager.so 已导出
// 这些符号。此处按官方头文件（interface_sdk_c / interface_native_header 的
// 26.1.0 声明）补齐缺失的类型与函数声明，使工程可在 26.0.0 SDK 下编译，
// 运行时仍由板端系统库提供实现。升级到含这些接口的 SDK 后可直接删除本文件。

#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"

#include <cstddef>
#include <cstdint>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 占位符文件的元数据信息。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_PlaceholderInfo {
    uint64_t logicalSize;
    uint64_t atimeMs;
    uint64_t mtimeMs;
} OH_CloudDisk_PlaceholderInfo;

/**
 * @brief 与占位符关联的不透明自定义信息。
 * @since 26.1.0
 */
typedef struct OH_CloudDisk_PlaceholderCustomInfo {
    size_t dataLength;
    const uint8_t *data;
} OH_CloudDisk_PlaceholderCustomInfo;

/**
 * @brief 占位符状态的枚举值。
 * @since 26.1.0
 */
typedef enum OH_CloudDisk_PlaceholderState {
    OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE = 0,
    OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED = 1,
    OH_CLOUD_DISK_PLACEHOLDER_STATE_PARTIALLY_HYDRATED = 2,
    OH_CLOUD_DISK_PLACEHOLDER_STATE_FULLY_HYDRATED = 3,
} OH_CloudDisk_PlaceholderState;

/**
 * @brief 占位符回调使用的二进制数据缓冲区。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_DataBuf {
    uint8_t *data;
    uint64_t dataSize;
} OH_CloudDisk_DataBuf;

/**
 * @brief 占位符回调请求类型的枚举值。
 * @since 26.0.1
 */
typedef enum OH_CloudDisk_CallbackType {
    OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA = 0,
    OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA = 1,
    OH_CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE = 2,
} OH_CloudDisk_CallbackType;

/**
 * @brief 占位符水合优先级的枚举值。
 * @since 26.0.1
 */
typedef enum OH_CloudDisk_HydratePriority {
    OH_CLOUD_DISK_HYDRATE_PRIORITY_LOW = 0,
    OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL = 1,
    OH_CLOUD_DISK_HYDRATE_PRIORITY_HIGH = 2,
} OH_CloudDisk_HydratePriority;

/**
 * @brief 占位符回调请求头信息。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_CallbackReqHead {
    CloudDisk_SyncFolderPath syncFolderPath;
    OH_CloudDisk_CallbackType callbackType;
    OH_CloudDisk_DataBuf reqKey;
} OH_CloudDisk_CallbackReqHead;

/**
 * @brief 占位符脱水授权信息。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_DehydrateInfo {
    CloudDisk_PathInfo filePath;
    bool allow;
} OH_CloudDisk_DehydrateInfo;

/**
 * @brief 获取占位符水合所需全部数据的请求信息。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_FetchDataRequest {
    CloudDisk_PathInfo filePath;
    OH_CloudDisk_HydratePriority priority;
} OH_CloudDisk_FetchDataRequest;

/**
 * @brief 占位符回调请求上下文。
 * @since 26.0.1
 */
typedef union OH_CloudDisk_CallbackContext {
    OH_CloudDisk_FetchDataRequest *fetchData;
    CloudDisk_PathInfo *cancelFetchData;
    OH_CloudDisk_DehydrateInfo *dehydrateData;
} OH_CloudDisk_CallbackContext;

/**
 * @brief 获取到的占位符文件数据。
 * @since 26.0.1
 */
typedef struct OH_CloudDisk_FetchData {
    uint64_t offset;
    uint64_t size;
    uint64_t totalSize;
    OH_CloudDisk_DataBuf data;
    bool isComplete;
} OH_CloudDisk_FetchData;

/**
 * @brief 占位符回调响应数据。
 * @since 26.0.1
 */
typedef union OH_CloudDisk_CallbackResponse {
    OH_CloudDisk_FetchData *fetchData;
} OH_CloudDisk_CallbackResponse;

CloudDisk_ErrorCode OH_CloudDisk_CreatePlaceholder(const CloudDisk_SyncFolderPath syncFolderPath,
                                                   const CloudDisk_PathInfo relativePathInfo,
                                                   const OH_CloudDisk_PlaceholderInfo placeholderInfo,
                                                   const OH_CloudDisk_PlaceholderCustomInfo *customInfo);

CloudDisk_ErrorCode OH_CloudDisk_IsPlaceholderFile(const CloudDisk_SyncFolderPath syncFolderPath,
                                                   const CloudDisk_PathInfo relativePathInfo,
                                                   bool *isPlaceholder);

CloudDisk_ErrorCode OH_CloudDisk_GetPlaceholderState(const CloudDisk_SyncFolderPath syncFolderPath,
                                                     const CloudDisk_PathInfo relativePathInfo,
                                                     OH_CloudDisk_PlaceholderState *state);

CloudDisk_ErrorCode OH_CloudDisk_ConvertPlaceholderToFile(const CloudDisk_SyncFolderPath syncFolderPath,
                                                          const CloudDisk_PathInfo relativePathInfo);

CloudDisk_ErrorCode OH_CloudDisk_MarkFileAsPlaceholder(const CloudDisk_SyncFolderPath syncFolderPath,
                                                       const CloudDisk_PathInfo relativePathInfo);

CloudDisk_ErrorCode OH_CloudDisk_UnmarkPlaceholderFile(const CloudDisk_SyncFolderPath syncFolderPath,
                                                       const CloudDisk_PathInfo relativePathInfo);

CloudDisk_ErrorCode OH_CloudDisk_UpdatePlaceholder(const CloudDisk_SyncFolderPath syncFolderPath,
                                                   const CloudDisk_PathInfo relativePathInfo,
                                                   const OH_CloudDisk_PlaceholderInfo placeholderInfo,
                                                   const OH_CloudDisk_PlaceholderCustomInfo *customInfo);

CloudDisk_ErrorCode OH_CloudDisk_GetPlaceholderCustomInfo(const CloudDisk_SyncFolderPath syncFolderPath,
                                                          const CloudDisk_PathInfo relativePathInfo,
                                                          uint8_t *dataBuf,
                                                          size_t *inOutDataLength);

CloudDisk_ErrorCode OH_CloudDisk_HydratePlaceholder(const CloudDisk_SyncFolderPath *syncFolderPath,
                                                    const CloudDisk_PathInfo *filePath,
                                                    OH_CloudDisk_CallbackType type,
                                                    OH_CloudDisk_HydratePriority priority);

CloudDisk_ErrorCode OH_CloudDisk_Execute(const OH_CloudDisk_CallbackReqHead reqHead,
                                         OH_CloudDisk_CallbackContext reqContext,
                                         OH_CloudDisk_CallbackResponse rsp);

CloudDisk_ErrorCode OH_CloudDisk_DehydrateFile(const CloudDisk_SyncFolderPath *syncFolderPath,
                                               const CloudDisk_PathInfo *filePath);

CloudDisk_ErrorCode OH_CloudDisk_RegisterCallbackTable(
    const CloudDisk_SyncFolderPath syncFolderPath,
    void (*callback)(const OH_CloudDisk_CallbackReqHead reqHead, OH_CloudDisk_CallbackContext reqContext));

CloudDisk_ErrorCode OH_CloudDisk_UnregisterCallbackTable(const CloudDisk_SyncFolderPath syncFolderPath);

#ifdef __cplusplus
};
#endif

#endif // CLOUD_DISK_API_26_1_COMPAT_H
