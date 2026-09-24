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

#ifndef CLOUDDISKDEMO_CAPI_NAPI_OBJECT_PARSER_H
#define CLOUDDISKDEMO_CAPI_NAPI_OBJECT_PARSER_H

#include "napi/native_api.h"
#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"
#include <cstdint>
#include <vector>
#include "utils.h"

// CloudDisk_SyncFolder -> napi_value (JS object)
napi_value ParseNapiSyncFolder(napi_env env, CloudDisk_SyncFolder* syncFolder);

// CloudDisk_ChangesResult -> napi_value (JS object)
napi_value ParseNapiChangesResult(napi_env env, const CloudDisk_ChangesResult* changesResult);

// CloudDisk_ResultList -> napi_value (JS object)
napi_value ParseNapiResultList(napi_env env, CloudDisk_ResultList* result);

// napi_value (JS object {path, state}) -> CloudDisk_FileSyncState
napi_status ConvertToFileSyncState(napi_env env, napi_value jsObj, CloudDisk_FileSyncState* fileSyncState);

// napi_value (JS array of {path, state}) -> CloudDisk_FileSyncState[]
napi_status ConvertToFileSyncStates(napi_env env, napi_value jsArray,
                                    CloudDisk_FileSyncState** fileSyncStates, size_t* arraySize);

// napi_value (JS string array) -> CloudDisk_PathInfo[]
napi_status ConvertToPathInfos(napi_env env, napi_value jsArray,
                               CloudDisk_PathInfo** pathInfos, size_t* arraySize);

#endif // CLOUDDISKDEMO_CAPI_NAPI_OBJECT_PARSER_H
