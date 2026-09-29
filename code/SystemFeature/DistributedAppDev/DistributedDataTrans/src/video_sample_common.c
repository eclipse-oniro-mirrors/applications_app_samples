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

#include "video_sample_common.h"

#define VS_UUID_VISIBLE_LEN     4
#define VS_UUID_MASK_THRESHOLD  8

void VsLog(const char *format, ...)
{
    printf("\n>>>");
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
    printf("\n");
    (void)fflush(stdout);
}

int32_t VsGetInputNumber(const char *info)
{
    int32_t num = 0;
    printf("==>%s", info);
    (void)fflush(stdout);
    (void)fflush(stdin);
    int32_t rc = scanf_s("%d", &num);
    if (rc != 1) {
        num = -1;
    }
    return num;
}

enum {
    VS_DATA_MENU_MESSAGE = 1,
    VS_DATA_MENU_BYTES,
    VS_DATA_MENU_STREAM,
};

TransDataType VsSelectDataType(void)
{
    printf("选择传输方式:\n");
    printf("  1 - 消息 (MESSAGE, 低延迟小包)\n");
    printf("  2 - 字节流 (BYTES, 通用)\n");
    printf("  3 - 视频流 (RAW_STREAM, 持续帧)\n");
    int32_t choice = VsGetInputNumber("请选择:");
    switch (choice) {
        case VS_DATA_MENU_MESSAGE:
            return DATA_TYPE_MESSAGE;
        case VS_DATA_MENU_BYTES:
            return DATA_TYPE_BYTES;
        case VS_DATA_MENU_STREAM:
            return DATA_TYPE_RAW_STREAM;
        default:
            printf("输入无效，默认使用字节流\n");
            return DATA_TYPE_BYTES;
    }
}

void VsMaskUuid(const char *uuid, char *out, uint32_t outLen)
{
    if (uuid == NULL || out == NULL || outLen == 0) {
        return;
    }
    out[0] = '\0';
    size_t len = strlen(uuid);
    if (len <= VS_UUID_MASK_THRESHOLD) {
        int32_t rc = strncpy_s(out, outLen, uuid, len);
        if (rc != EOK) {
            return;
        }
        return;
    }
    int32_t rc = memcpy_s(out, outLen, uuid, VS_UUID_VISIBLE_LEN);
    if (rc != EOK) {
        return;
    }
    out[VS_UUID_VISIBLE_LEN] = '\0';
    rc = strcat_s(out, outLen, "**");
    if (rc != EOK) {
        return;
    }
    rc = strncat_s(out, outLen, uuid + len - VS_UUID_VISIBLE_LEN, VS_UUID_VISIBLE_LEN);
    if (rc != EOK) {
        return;
    }
}

int32_t VsBuildDeviceName(const char *networkId, char *out, uint32_t outLen)
{
    if (networkId == NULL || out == NULL || outLen == 0) {
        return -1;
    }
    char uuid[UUID_BUF_LEN] = {0};
    int32_t ret = GetNodeKeyInfo(VS_PKG_NAME, networkId, NODE_KEY_UUID,
        (unsigned char *)uuid, UUID_BUF_LEN);
    if (ret != 0) {
        return ret;
    }
    char masked[VS_STR_LEN] = {0};
    VsMaskUuid(uuid, masked, sizeof(masked));
    int32_t rc = snprintf_s(out, outLen, outLen - 1, "%s%s", VS_DEVICE_NAME_PREFIX, masked);
    return (rc < 0) ? -1 : 0;
}

int32_t VsGetLocalDeviceName(char *out, uint32_t outLen)
{
    NodeBasicInfo localInfo;
    (void)memset_s(&localInfo, sizeof(localInfo), 0, sizeof(localInfo));
    if (GetLocalNodeDeviceInfo(VS_PKG_NAME, &localInfo) != 0) {
        return -1;
    }
    return VsBuildDeviceName(localInfo.networkId, out, outLen);
}

void VsPrintLocalDevice(void)
{
    char name[VS_DEVICE_NAME_LEN] = {0};
    if (VsGetLocalDeviceName(name, sizeof(name)) != 0) {
        VS_LOG("获取本机设备名失败");
        return;
    }
    VS_LOG("本机设备: %s", name);
}

void VsGetLocalUuid(char *uuid, uint32_t len)
{
    NodeBasicInfo localInfo;
    (void)memset_s(&localInfo, sizeof(localInfo), 0, sizeof(localInfo));
    uuid[0] = '\0';
    if (GetLocalNodeDeviceInfo(VS_PKG_NAME, &localInfo) != 0) {
        return;
    }
    (void)GetNodeKeyInfo(VS_PKG_NAME, localInfo.networkId, NODE_KEY_UUID,
        (unsigned char *)uuid, len);
}

int32_t VsPrintOnlineDevices(void)
{
    int32_t num = 0;
    NodeBasicInfo *info = NULL;
    if (GetAllNodeDeviceInfo(VS_PKG_NAME, &info, &num) != 0) {
        VS_LOG("获取在线设备失败");
        return 0;
    }
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    printf("\n--- 设备列表 ---\n");
    if (localName[0] != '\0') {
        printf("本机: %s\n", localName);
    }
    if (num == 0) {
        printf("对端设备: (无)\n");
    } else {
        printf("对端设备:\n");
        for (int32_t i = 0; i < num; i++) {
            char name[VS_DEVICE_NAME_LEN] = {0};
            if (VsBuildDeviceName(info[i].networkId, name, sizeof(name)) == 0) {
                printf("  [%d] %s\n", i, name);
            } else {
                printf("  [%d] %s\n", i, info[i].deviceName);
            }
        }
    }
    FreeNodeInfo(info);
    return num;
}

bool VsSelectOnlineDevice(char *networkId, uint32_t len)
{
    int32_t num = 0;
    NodeBasicInfo *info = NULL;
    if (GetAllNodeDeviceInfo(VS_PKG_NAME, &info, &num) != 0 || num <= 0) {
        VS_LOG("无在线设备");
        if (info != NULL) {
            FreeNodeInfo(info);
        }
        return false;
    }
    for (int32_t i = 0; i < num; i++) {
        char name[VS_DEVICE_NAME_LEN] = {0};
        if (VsBuildDeviceName(info[i].networkId, name, sizeof(name)) == 0) {
            printf("  [%d] %s\n", i, name);
        } else {
            printf("  [%d] %s\n", i, info[i].deviceName);
        }
    }
    int32_t idx = VsGetInputNumber("选择设备编号:");
    if (idx < 0 || idx >= num) {
        VS_LOG("无效编号: %d", idx);
        FreeNodeInfo(info);
        return false;
    }
    if (strncpy_s(networkId, len, info[idx].networkId, strlen(info[idx].networkId)) != 0) {
        FreeNodeInfo(info);
        return false;
    }
    FreeNodeInfo(info);
    return true;
}