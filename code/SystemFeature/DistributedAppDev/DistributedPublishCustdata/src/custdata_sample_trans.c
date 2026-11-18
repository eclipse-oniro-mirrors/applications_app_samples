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

#include <string.h>

#include "custdata_sample_common.h"
#include "custdata_sample_trans.h"

#define CD_QOS_MAX_LATENCY_US 50000
#define CD_TRANS_IP_MATCH_LEN IP_STR_MAX_LEN

static bool CdMatchIp(const DeviceInfo *device, const char *nodeIp)
{
    if (device == NULL || nodeIp == NULL) {
        return false;
    }
    for (unsigned int i = 0; i < device->addrNum && i < CONNECTION_ADDR_MAX; i++) {
        if (device->addr[i].type == CONNECTION_ADDR_WLAN ||
            device->addr[i].type == CONNECTION_ADDR_ETH) {
            if (strncmp(device->addr[i].info.ip.ip, nodeIp, CD_TRANS_IP_MATCH_LEN) == 0) {
                return true;
            }
        }
    }
    return false;
}

int32_t CdResolveNetworkId(const DeviceInfo *device, char *networkId, uint32_t len)
{
    if (device == NULL || networkId == NULL || len == 0) {
        return SOFTBUS_INVALID_PARAM;
    }
    int32_t nodeNum = 0;
    NodeBasicInfo *nodeInfo = NULL;
    int32_t ret = GetAllNodeDeviceInfo(CD_PKG_NAME, &nodeInfo, &nodeNum);
    if (ret != SOFTBUS_OK) {
        CD_LOG("CdResolveNetworkId GetAllNodeDeviceInfo fail ret=%d", ret);
        return ret;
    }
    for (int32_t i = 0; i < nodeNum; i++) {
        char nodeIp[CD_TRANS_IP_MATCH_LEN] = {0};
        if (GetNodeKeyInfo(CD_PKG_NAME, nodeInfo[i].networkId, NODE_KEY_IP_ADDRESS,
            (unsigned char *)nodeIp, sizeof(nodeIp)) != SOFTBUS_OK) {
            continue;
        }
        if (CdMatchIp(device, nodeIp)) {
            (void)strncpy_s(networkId, len, nodeInfo[i].networkId, strlen(nodeInfo[i].networkId));
            FreeNodeInfo(nodeInfo);
            return SOFTBUS_OK;
        }
    }
    FreeNodeInfo(nodeInfo);
    CD_LOG("CdResolveNetworkId no online node matches device ip");
    return SOFTBUS_NOT_FIND;
}

int32_t CdSocketCreate(const char *peerNetworkId, TransDataType dataType)
{
    SocketInfo info;
    (void)memset_s(&info, sizeof(info), 0, sizeof(info));
    info.name = CD_SESSION_NAME;
    info.peerName = CD_SESSION_NAME;
    info.pkgName = CD_PKG_NAME;
    info.peerNetworkId = (char *)peerNetworkId;
    info.dataType = dataType;

    int32_t socket = Socket(info);
    if (socket <= 0) {
        CD_LOG("CdSocketCreate Socket() fail ret=%d", socket);
        return socket;
    }
    return socket;
}

int32_t CdSocketListen(int32_t socket, ISocketListener *listener)
{
    if (listener == NULL) {
        return SOFTBUS_INVALID_PARAM;
    }
    QosTV qos[1] = { { .qos = QOS_TYPE_MAX_LATENCY, .value = CD_QOS_MAX_LATENCY_US } };
    int32_t ret = Listen(socket, qos, 1, listener);
    if (ret != SOFTBUS_OK) {
        CD_LOG("CdSocketListen Listen() fail socket=%d ret=%d", socket, ret);
        Shutdown(socket);
    }
    return ret;
}

int32_t CdSocketBind(int32_t socket, ISocketListener *listener)
{
    if (listener == NULL) {
        return SOFTBUS_INVALID_PARAM;
    }
    QosTV qos[1] = { { .qos = QOS_TYPE_MAX_LATENCY, .value = CD_QOS_MAX_LATENCY_US } };
    int32_t ret = Bind(socket, qos, 1, listener);
    if (ret != SOFTBUS_OK) {
        CD_LOG("CdSocketBind Bind() fail socket=%d ret=%d", socket, ret);
        Shutdown(socket);
    }
    return ret;
}

int32_t CdSocketSendBytes(int32_t socket, const void *data, uint32_t len)
{
    if (data == NULL || len == 0) {
        return SOFTBUS_INVALID_PARAM;
    }
    return SendBytes(socket, data, len);
}