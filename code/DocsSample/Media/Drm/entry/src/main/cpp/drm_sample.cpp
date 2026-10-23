/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start drm_import_header]
// [StartExclude drm_import_header]
#include "drm_sample.h"

// [EndExclude drm_import_header]
#include <cstring>
#include <multimedia/drm_framework/native_drm_common.h>
#include <multimedia/drm_framework/native_drm_err.h>
#include <multimedia/drm_framework/native_mediakeysession.h>
#include <multimedia/drm_framework/native_mediakeysystem.h>
// [End drm_import_header]

namespace {
constexpr char LOG_SEP = '\n';
constexpr int32_t MAX_DRM_PROVISION_BUF_SIZE = 24576;   // 24576: (2 * 12 * 1024)
constexpr int32_t MAX_DRM_MEDIA_KEY_RESPONSE_BUF_SIZE = 24576;

void AppendResult(std::string &log, const char *step, Drm_ErrCode ret)
{
    log += step;
    log += (ret == DRM_ERR_OK) ? "成功" : "失败";
    log += "，错误码：" + std::to_string(static_cast<int>(ret)) + LOG_SEP;
}

void AppendInfo(std::string &log, const std::string &info)
{
    log += info + LOG_SEP;
}

// MediaKeySystem事件回调，监听设备证书请求等事件。
// [Start drm_setMediaKeySystemCallback]
static Drm_ErrCode SystemCallBackWithObj(MediaKeySystem *mediaKeySystem, DRM_EventType eventType,
    uint8_t *info, int32_t infoLen, char *extra)
{
    if (eventType == EVENT_PROVISION_REQUIRED) {
        // 设备DRM证书请求和处理。
    }
    return DRM_ERR_OK;
}
// [End drm_setMediaKeySystemCallback]

// MediaKeySession事件回调，监听密钥请求、密钥变更等事件。
// [Start drm_setMediaKeySessionCallback]
static Drm_ErrCode SessionEventCallBackWithObj(MediaKeySession *mediaKeySession, DRM_EventType eventType,
    uint8_t *info, int32_t infoLen, char *extra)
{
    if (eventType == EVENT_KEY_REQUIRED) {
        // 媒体密钥请求与处理。
    }
    return DRM_ERR_OK;
}

static Drm_ErrCode SessionKeyChangeCallBackWithObj(MediaKeySession *mediaKeySession, DRM_KeysInfo *keysInfo,
    bool hasNewGoodKeys)
{
    return DRM_ERR_OK;
}
// [End drm_setMediaKeySessionCallback]

// 生成媒体密钥请求、处理媒体密钥响应、恢复离线媒体密钥、检查媒体密钥状态。
void ProcessMediaKeyFlow(MediaKeySession *mediaKeySession, std::string &log)
{
    Drm_ErrCode ret = DRM_ERR_OK;
    // 生成媒体密钥请求。
    // [Start drm_generateMediaKeyRequest]
    DRM_MediaKeyRequest mediaKeyRequest;
    DRM_MediaKeyRequestInfo info;
    // initData对应媒体流中的PSSH数据，请按实际数据传入。
    unsigned char initData[512] = {0x00};
    memset(&info, 0, sizeof(DRM_MediaKeyRequestInfo));
    info.initDataLen = sizeof(initData);
    info.type = MEDIA_KEY_TYPE_ONLINE; // MEDIA_KEY_TYPE_ONLINE：在线媒体密钥请求；MEDIA_KEY_TYPE_OFFLINE：离线媒体密钥请求。
    memcpy(info.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(info.initData, initData, sizeof(initData));
    memcpy(info.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(info.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    info.optionsCount = 1;
    ret = OH_MediaKeySession_GenerateMediaKeyRequest(mediaKeySession, &info, &mediaKeyRequest);
    // [StartExclude drm_generateMediaKeyRequest]
    AppendResult(log, "OH_MediaKeySession_GenerateMediaKeyRequest", ret);
    // [EndExclude drm_generateMediaKeyRequest]
    // [End drm_generateMediaKeyRequest]
    // 处理媒体密钥响应。
    // [Start drm_processMediaKeyResponse]
    // 应用通过网络请求DRM服务获取媒体密钥响应mediaKeyResponse，请按实际数据传入。
    unsigned char mediaKeyId[128] = {0x00};
    int32_t mediaKeyIdLen = 128;
    unsigned char mediaKeyResponse[MAX_DRM_MEDIA_KEY_RESPONSE_BUF_SIZE] = {0x00};
    int32_t mediaKeyResponseLen = MAX_DRM_MEDIA_KEY_RESPONSE_BUF_SIZE;
    ret = OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession, mediaKeyResponse,
        mediaKeyResponseLen, mediaKeyId, &mediaKeyIdLen);
    // [StartExclude drm_processMediaKeyResponse]
    AppendResult(log, "OH_MediaKeySession_ProcessMediaKeyResponse", ret);
    // [EndExclude drm_processMediaKeyResponse]
    // [End drm_processMediaKeyResponse]
    // 恢复离线媒体密钥到当前会话。
    // [Start drm_restoreOfflineMediaKeys]
    ret = OH_MediaKeySession_RestoreOfflineMediaKeys(mediaKeySession, mediaKeyId, mediaKeyIdLen);
    // [StartExclude drm_restoreOfflineMediaKeys]
    AppendResult(log, "OH_MediaKeySession_RestoreOfflineMediaKeys", ret);
    // [EndExclude drm_restoreOfflineMediaKeys]
    // [End drm_restoreOfflineMediaKeys]
    // 检查当前会话的媒体密钥状态。
    // [Start drm_checkMediaKeyStatus]
    DRM_MediaKeyStatus mediaKeyStatus = {0};
    ret = OH_MediaKeySession_CheckMediaKeyStatus(mediaKeySession, &mediaKeyStatus);
    // [StartExclude drm_checkMediaKeyStatus]
    AppendResult(log, "OH_MediaKeySession_CheckMediaKeyStatus", ret);
    AppendInfo(log, "密钥状态条数：" + std::to_string(static_cast<int>(mediaKeyStatus.statusCount)));
    // [EndExclude drm_checkMediaKeyStatus]
    // [End drm_checkMediaKeyStatus]
}
} // namespace

bool IsMediaKeySystemSupported(const char *name)
{
    // 查询设备是否支持指定的DRM解决方案。
    return OH_MediaKeySystem_IsSupported(name);
}

// 演示MediaKeySystem的完整使用流程：创建、查询内容保护级别与证书状态、生成设备DRM证书请求与响应、
// 获取统计信息、离线媒体密钥管理、销毁。
std::string MediaKeySystemFlow(const char *name)
{
    std::string log;
    MediaKeySystem *mediaKeySystem = nullptr;

    // 1. 创建MediaKeySystem实例。
    // [Start drm_createMediaKeySystem]
    Drm_ErrCode ret = OH_MediaKeySystem_Create(name, &mediaKeySystem);
    if (ret != DRM_ERR_OK || mediaKeySystem == nullptr) {
        // [StartExclude drm_createMediaKeySystem]
        AppendResult(log, "OH_MediaKeySystem_Create", ret);
        // [EndExclude drm_createMediaKeySystem]
        return log;
    }
    // [StartExclude drm_createMediaKeySystem]
    AppendResult(log, "OH_MediaKeySystem_Create", ret);
    // [EndExclude drm_createMediaKeySystem]
    // [End drm_createMediaKeySystem]

    // 2. （可选）设置MediaKeySystem事件监听回调。
    // [Start drm_bindMediaKeySystemCallback]
    ret = OH_MediaKeySystem_SetCallback(mediaKeySystem, SystemCallBackWithObj);
    // [StartExclude drm_bindMediaKeySystemCallback]
    AppendResult(log, "OH_MediaKeySystem_SetCallback", ret);
    // [EndExclude drm_bindMediaKeySystemCallback]
    // [End drm_bindMediaKeySystemCallback]

    // 3. 获取设备DRM证书状态。
    // [Start drm_getCertificateStatus]
    DRM_CertificateStatus certStatus = CERT_STATUS_NOT_PROVISIONED;
    ret = OH_MediaKeySystem_GetCertificateStatus(mediaKeySystem, &certStatus);
    // [StartExclude drm_getCertificateStatus]
    AppendResult(log, "OH_MediaKeySystem_GetCertificateStatus", ret);
    AppendInfo(log, "设备DRM证书状态：" + std::to_string(static_cast<int>(certStatus)));
    // [EndExclude drm_getCertificateStatus]
    // [End drm_getCertificateStatus]

    // 4. （可选）生成设备DRM证书请求与处理设备DRM证书响应。
    // [Start drm_generateKeySystemRequest]
    unsigned char request[MAX_DRM_PROVISION_BUF_SIZE] = {0x00};
    int32_t requestLen = MAX_DRM_PROVISION_BUF_SIZE;
    char defaultUrl[2048] = {0x00};
    int32_t defaultUrlLen = 2048;
    ret = OH_MediaKeySystem_GenerateKeySystemRequest(mediaKeySystem, request, &requestLen, defaultUrl, defaultUrlLen);
    // [StartExclude drm_generateKeySystemRequest]
    AppendResult(log, "OH_MediaKeySystem_GenerateKeySystemRequest", ret);
    // [EndExclude drm_generateKeySystemRequest]
    // [End drm_generateKeySystemRequest]
    // [Start drm_processKeySystemResponse]
    // 应用通过网络请求将设备DRM证书请求传到DRM服务获取响应keySystemResponse，请按实际数据传入。
    unsigned char keySystemResponse[MAX_DRM_PROVISION_BUF_SIZE] = {0x00};
    ret = OH_MediaKeySystem_ProcessKeySystemResponse(mediaKeySystem, keySystemResponse, sizeof(keySystemResponse));
    // [StartExclude drm_processKeySystemResponse]
    AppendResult(log, "OH_MediaKeySystem_ProcessKeySystemResponse", ret);
    // [EndExclude drm_processKeySystemResponse]
    // [End drm_processKeySystemResponse]

    // 5. 获取设备支持的最大内容保护级别。
    // [Start drm_getMaxContentProtectionLevel]
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    ret = OH_MediaKeySystem_GetMaxContentProtectionLevel(mediaKeySystem, &level);
    // [StartExclude drm_getMaxContentProtectionLevel]
    AppendResult(log, "OH_MediaKeySystem_GetMaxContentProtectionLevel", ret);
    AppendInfo(log, "最大内容保护级别：" + std::to_string(static_cast<int>(level)));
    // [EndExclude drm_getMaxContentProtectionLevel]
    // [End drm_getMaxContentProtectionLevel]

    // 6. 获取统计信息。
    DRM_Statistics statistics = {0};
    ret = OH_MediaKeySystem_GetStatistics(mediaKeySystem, &statistics);
    AppendResult(log, "OH_MediaKeySystem_GetStatistics", ret);
    AppendInfo(log, "统计信息条数：" + std::to_string(static_cast<int>(statistics.statisticsCount)));

    // 7. （可选）获取离线媒体密钥标识列表、状态与清除离线媒体密钥。
    // [Start drm_offlineMediaKeyManagement]
    DRM_OfflineMediakeyIdArray offlineMediaKeyIds;
    ret = OH_MediaKeySystem_GetOfflineMediaKeyIds(mediaKeySystem, &offlineMediaKeyIds);
    // [StartExclude drm_offlineMediaKeyManagement]
    AppendResult(log, "OH_MediaKeySystem_GetOfflineMediaKeyIds", ret);
    // [EndExclude drm_offlineMediaKeyManagement]
    if (ret == DRM_ERR_OK && offlineMediaKeyIds.idsCount > 0) {
        DRM_OfflineMediaKeyStatus offlineStatus = OFFLINE_MEDIA_KEY_STATUS_UNKNOWN;
        ret = OH_MediaKeySystem_GetOfflineMediaKeyStatus(mediaKeySystem, offlineMediaKeyIds.ids[0],
            offlineMediaKeyIds.idsLen[0], &offlineStatus);
        // [StartExclude drm_offlineMediaKeyManagement]
        AppendResult(log, "OH_MediaKeySystem_GetOfflineMediaKeyStatus", ret);
        // [EndExclude drm_offlineMediaKeyManagement]
        ret = OH_MediaKeySystem_ClearOfflineMediaKeys(mediaKeySystem, offlineMediaKeyIds.ids[0],
            offlineMediaKeyIds.idsLen[0]);
        // [StartExclude drm_offlineMediaKeyManagement]
        AppendResult(log, "OH_MediaKeySystem_ClearOfflineMediaKeys", ret);
        // [EndExclude drm_offlineMediaKeyManagement]
    }
    // [End drm_offlineMediaKeyManagement]

    // 8. 销毁MediaKeySystem实例。
    // [Start drm_destroyMediaKeySystem]
    ret = OH_MediaKeySystem_Destroy(mediaKeySystem);
    // [StartExclude drm_destroyMediaKeySystem]
    AppendResult(log, "OH_MediaKeySystem_Destroy", ret);
    // [EndExclude drm_destroyMediaKeySystem]
    // [End drm_destroyMediaKeySystem]
    return log;
}

// 演示MediaKeySession的完整使用流程：创建会话、设置回调、生成媒体密钥请求、处理媒体密钥响应、
// 恢复离线媒体密钥、检查密钥状态、清除密钥、销毁。
std::string MediaKeySessionFlow(const char *name, const char *mimeType)
{
    std::string log;
    MediaKeySystem *mediaKeySystem = nullptr;
    MediaKeySession *mediaKeySession = nullptr;

    // 1. 创建MediaKeySystem实例。
    Drm_ErrCode ret = OH_MediaKeySystem_Create(name, &mediaKeySystem);
    AppendResult(log, "OH_MediaKeySystem_Create", ret);
    if (ret != DRM_ERR_OK) {
        return log;
    }

    // 2. 创建MediaKeySession实例。
    // [Start drm_createMediaKeySession]
    DRM_ContentProtectionLevel securityLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    ret = OH_MediaKeySystem_CreateMediaKeySession(mediaKeySystem, &securityLevel, &mediaKeySession);
    // [StartExclude drm_createMediaKeySession]
    AppendResult(log, "OH_MediaKeySystem_CreateMediaKeySession", ret);
    // [EndExclude drm_createMediaKeySession]
    // [End drm_createMediaKeySession]
    if (ret != DRM_ERR_OK || mediaKeySession == nullptr) {
        OH_MediaKeySystem_Destroy(mediaKeySystem);
        return log;
    }

    // 3. （可选）设置MediaKeySession事件监听回调。
    // [Start drm_bindMediaKeySessionCallback]
    OH_MediaKeySession_Callback sessionCallback = { SessionEventCallBackWithObj, SessionKeyChangeCallBackWithObj };
    ret = OH_MediaKeySession_SetCallback(mediaKeySession, &sessionCallback);
    // [StartExclude drm_bindMediaKeySessionCallback]
    AppendResult(log, "OH_MediaKeySession_SetCallback", ret);
    // [EndExclude drm_bindMediaKeySessionCallback]
    // [End drm_bindMediaKeySessionCallback]

    // 4. 查询指定媒体类型是否需要安全解码。
    // [Start drm_requireSecureDecoderModule]
    bool requireSecureDecoder = false;
    ret = OH_MediaKeySession_RequireSecureDecoderModule(mediaKeySession, mimeType, &requireSecureDecoder);
    // [StartExclude drm_requireSecureDecoderModule]
    AppendResult(log, "OH_MediaKeySession_RequireSecureDecoderModule", ret);
    AppendInfo(log, std::string("是否需要安全解码：") + (requireSecureDecoder ? "是" : "否"));
    // [EndExclude drm_requireSecureDecoderModule]
    // [End drm_requireSecureDecoderModule]

    // 5-8. 生成媒体密钥请求、处理媒体密钥响应、恢复离线媒体密钥、检查媒体密钥状态。
    ProcessMediaKeyFlow(mediaKeySession, log);

    // 9. 清除当前会话的媒体密钥。
    ret = OH_MediaKeySession_ClearMediaKeys(mediaKeySession);
    AppendResult(log, "OH_MediaKeySession_ClearMediaKeys", ret);

    // 10. 销毁MediaKeySession与MediaKeySystem实例。
    // [Start drm_destroyMediaKeySession]
    ret = OH_MediaKeySession_Destroy(mediaKeySession);
    // [StartExclude drm_destroyMediaKeySession]
    AppendResult(log, "OH_MediaKeySession_Destroy", ret);
    // [EndExclude drm_destroyMediaKeySession]
    // [End drm_destroyMediaKeySession]
    // [Start drm_destroyMediaKeySystem2]
    ret = OH_MediaKeySystem_Destroy(mediaKeySystem);
    // [StartExclude drm_destroyMediaKeySystem2]
    AppendResult(log, "OH_MediaKeySystem_Destroy", ret);
    // [EndExclude drm_destroyMediaKeySystem2]
    // [End drm_destroyMediaKeySystem2]
    return log;
}

// 获取设备支持的DRM解决方案名称和唯一标识的列表。
std::string GetMediaKeySystemsFlow()
{
    std::string log;
    // [Start drm_getMediaKeySystems]
    uint32_t count = 3; // count是当前设备实际支持的DRM插件的个数，用户根据实际情况设置。
    DRM_MediaKeySystemDescription descriptions[3];
    memset(descriptions, 0, sizeof(descriptions));
    Drm_ErrCode ret = OH_MediaKeySystem_GetMediaKeySystems(descriptions, &count);
    // [StartExclude drm_getMediaKeySystems]
    AppendResult(log, "OH_MediaKeySystem_GetMediaKeySystems", ret);
    // [EndExclude drm_getMediaKeySystems]
    // [End drm_getMediaKeySystems]
    AppendInfo(log, "支持DRM解决方案数量：" + std::to_string(count));
    return log;
}

// 查询设备是否支持对应的DRM解决方案、媒体类型、内容保护级别。
std::string IsSupported3Flow(const char *name, const char *mimeType)
{
    std::string log;
    // [Start drm_isSupported3]
    bool isSupported = OH_MediaKeySystem_IsSupported3(name, mimeType, CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
    // [StartExclude drm_isSupported3]
    AppendInfo(log, std::string("是否支持：") + (isSupported ? "是" : "否"));
    // [EndExclude drm_isSupported3]
    // [End drm_isSupported3]
    return log;
}
