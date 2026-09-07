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

#ifndef CUSTDATA_SAMPLE_COMMON_H
#define CUSTDATA_SAMPLE_COMMON_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include <securec.h>

#include "softbus_bus_center.h"
#include "softbus_common.h"
#include "softbus_error_code.h"

#ifdef __cplusplus
extern "C" {
#endif

#define CD_PKG_NAME         "com.sample.tool"
#define CD_CAPABILITY       "ddmpCapability"
#define CD_PUBLISH_ID       1001
#define CD_SUBSCRIBE_ID     2001
#define CD_DEFAULT_PAYLOAD  "dsoftbus_custdata_sample_0123456789abcdef"
#define CD_BDATA_MAX_LEN     284
#define CD_UUID_VISIBLE_LEN  4
#define CD_MASK_NAME_LEN     32
#define CD_DEVICE_NAME_PREFIX "DEV#"
#define CD_TRUE_STR          "YES"
#define CD_FALSE_STR         "NO"

static inline const char *CdBoolStr(const bool exp)
{
    return (exp) ? CD_TRUE_STR : CD_FALSE_STR;
}

/* 日志统一用 CdLog 输出, 以 "\n>>>" 包裹, 便于在刷屏日志中定位 */
void CdLog(const char *format, ...);

#define CD_LOG(fmt, ...) CdLog(fmt, ##__VA_ARGS__)

/* 输入辅助: 读取一个整数 (失败返回 -1) */
int32_t CdGetInputNumber(const char *info);

/* 输入辅助: 读取一行字符串作为 payload (可含空格) */
int32_t CdGetInputPayload(char *out, uint32_t outLen, const char *info);

void CdMaskUuid(const char *uuid, char *out, uint32_t outLen);
int32_t CdBuildDeviceName(const char *networkId, char *out, uint32_t outLen);
int32_t CdGetLocalDeviceName(char *out, uint32_t outLen);

#ifdef __cplusplus
}
#endif
#endif