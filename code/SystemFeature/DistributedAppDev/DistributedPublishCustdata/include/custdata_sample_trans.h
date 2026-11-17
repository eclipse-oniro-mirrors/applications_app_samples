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

#ifndef CUSTDATA_SAMPLE_TRANS_H
#define CUSTDATA_SAMPLE_TRANS_H

#include <stdbool.h>
#include <stdint.h>

#include <securec.h>

#include "socket.h"
#include "softbus_common.h"

#ifdef __cplusplus
extern "C" {
#endif

#define CD_SESSION_NAME "com.sample.custdata.trans"
#define CD_MAX_DISCOVERED 8
#define CD_TRANS_SEND_BUF (MAX_CAPABILITYDATA_LEN + 64)

/* 将发现的 DeviceInfo 解析为 networkId (按 IP 匹配在线节点) */
int32_t CdResolveNetworkId(const DeviceInfo *device, char *networkId, uint32_t len);

/* Socket 封装 */
int32_t CdSocketCreate(const char *peerNetworkId, TransDataType dataType);
int32_t CdSocketListen(int32_t socket, ISocketListener *listener);
int32_t CdSocketBind(int32_t socket, ISocketListener *listener);
int32_t CdSocketSendBytes(int32_t socket, const void *data, uint32_t len);

#ifdef __cplusplus
}
#endif
#endif