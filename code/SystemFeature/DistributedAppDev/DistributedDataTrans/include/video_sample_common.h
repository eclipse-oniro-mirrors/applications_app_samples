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

#ifndef VIDEO_SAMPLE_COMMON_H
#define VIDEO_SAMPLE_COMMON_H

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <securec.h>
#include "softbus_bus_center.h"
#include "softbus_common.h"
#include "trans_type.h"

#ifdef __cplusplus
extern "C" {
#endif

#define VS_PKG_NAME     "com.sample.tool"
#define VS_SESSION_NAME "com.sample.video_stream_sample"

#define VS_STR_LEN          32
#define VS_FRAME_SIZE       64
#define VS_RING_SLOTS       32

#define VS_MICROSECONDS_PER_SECOND 1000000
#define VS_MS_PER_SEC              1000
#define VS_NS_PER_MS               1000000L
#define VS_NS_PER_SEC              1000000000L

static inline int32_t VsFpsToIntervalUs(int32_t fps)
{
    return (fps > 0) ? (int32_t)(VS_MICROSECONDS_PER_SECOND / fps) : 0;
}

#define VS_QOS_MAX_LATENCY_US     50000

#define VS_DEVICE_NAME_PREFIX "DEV#"
#define VS_DEVICE_NAME_LEN    20

typedef struct {
    const char *name;
    int32_t produceFps;
    int32_t sendFps;
} VsFrameRateConfig;

typedef struct {
    uint8_t  *buf;
    uint32_t   len;
    uint32_t   seq;
    int64_t    timestamp;
} VsFrame;

int32_t VsGetInputNumber(const char *info);
TransDataType VsSelectDataType(void);
void VsMaskUuid(const char *uuid, char *out, uint32_t outLen);
int32_t VsBuildDeviceName(const char *networkId, char *out, uint32_t outLen);
int32_t VsGetLocalDeviceName(char *out, uint32_t outLen);
void VsPrintLocalDevice(void);
void VsGetLocalUuid(char *uuid, uint32_t len);
int32_t VsPrintOnlineDevices(void);
bool VsSelectOnlineDevice(char *networkId, uint32_t len);

void VsLog(const char *format, ...);

#define VS_LOG(fmt, ...) VsLog(fmt, ##__VA_ARGS__)

#ifdef __cplusplus
}
#endif
#endif