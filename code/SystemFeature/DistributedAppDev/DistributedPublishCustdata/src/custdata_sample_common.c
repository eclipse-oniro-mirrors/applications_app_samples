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

#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "custdata_sample_common.h"

#define CD_UUID_MASK_THRESHOLD 8

void CdLog(const char *format, ...)
{
    printf("\n>>>");
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
    printf("\n");
    (void)fflush(stdout);
}

int32_t CdGetInputNumber(const char *info)
{
    int32_t num = 0;
    printf("==>%s", info);
    (void)fflush(stdout);
    int32_t rc = scanf_s("%d", &num);
    if (rc != 1) {
        num = -1;
    }
    int32_t ch = getchar();
    while (ch != '\n' && ch != EOF) {
        ch = getchar();
    }
    return num;
}

int32_t CdGetInputPayload(char *out, uint32_t outLen, const char *info)
{
    if (out == NULL || outLen == 0 || info == NULL) {
        return -1;
    }
    printf("==>%s", info);
    (void)fflush(stdout);
    if (fgets(out, (int)outLen, stdin) == NULL) {
        out[0] = '\0';
        return -1;
    }
    size_t len = strlen(out);
    while (len > 0 && (out[len - 1] == '\n' || out[len - 1] == '\r')) {
        out[len - 1] = '\0';
        len--;
    }
    return (int32_t)len;
}

void CdMaskUuid(const char *uuid, char *out, uint32_t outLen)
{
    if (uuid == NULL || out == NULL || outLen == 0) {
        return;
    }
    out[0] = '\0';
    size_t len = strlen(uuid);
    if (len <= CD_UUID_MASK_THRESHOLD) {
        if (strncpy_s(out, outLen, uuid, len) != EOK) {
            return;
        }
        return;
    }
    if (memcpy_s(out, outLen, uuid, CD_UUID_VISIBLE_LEN) != EOK) {
        return;
    }
    out[CD_UUID_VISIBLE_LEN] = '\0';
    if (strcat_s(out, outLen, "**") != EOK) {
        return;
    }
    if (strncat_s(out, outLen, uuid + len - CD_UUID_VISIBLE_LEN, CD_UUID_VISIBLE_LEN) != EOK) {
        return;
    }
}

int32_t CdBuildDeviceName(const char *networkId, char *out, uint32_t outLen)
{
    if (networkId == NULL || out == NULL || outLen == 0) {
        return SOFTBUS_INVALID_PARAM;
    }
    char udid[UDID_BUF_LEN] = {0};
    int32_t ret = GetNodeKeyInfo(CD_PKG_NAME, networkId, NODE_KEY_UDID,
        (unsigned char *)udid, UDID_BUF_LEN);
    if (ret != SOFTBUS_OK) {
        return ret;
    }
    char masked[CD_MASK_NAME_LEN] = {0};
    CdMaskUuid(udid, masked, sizeof(masked));
    int32_t rc = snprintf_s(out, outLen, outLen - 1, "%s%s", CD_DEVICE_NAME_PREFIX, masked);
    return (rc < 0) ? SOFTBUS_STRCPY_ERR : SOFTBUS_OK;
}

int32_t CdGetLocalDeviceName(char *out, uint32_t outLen)
{
    NodeBasicInfo localInfo;
    (void)memset_s(&localInfo, sizeof(localInfo), 0, sizeof(localInfo));
    if (GetLocalNodeDeviceInfo(CD_PKG_NAME, &localInfo) != SOFTBUS_OK) {
        return SOFTBUS_ERR;
    }
    return CdBuildDeviceName(localInfo.networkId, out, outLen);
}
