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

#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "custdata_sample_common.h"
#include "custdata_sample_refresh.h"
#include "custdata_sample_trans.h"

enum {
    CD_REFRESH_MENU_START = 0,
    CD_REFRESH_MENU_STOP,
    CD_REFRESH_MENU_PAYLOAD,
    CD_REFRESH_MENU_BIND,
    CD_REFRESH_MENU_SEND,
    CD_REFRESH_MENU_STATUS,
    CD_REFRESH_MENU_EXIT,
};

static pthread_mutex_t g_refreshLock = PTHREAD_MUTEX_INITIALIZER;
static char g_expectedPayload[MAX_CAPABILITYDATA_LEN] = {0};
static bool g_refreshActive = false;

/* ---- 发现的设备列表 (custData 匹配) ---- */
typedef struct {
    bool active;
    char devId[DISC_MAX_DEVICE_ID_LEN];
    char networkId[NETWORK_ID_BUF_LEN];
    char ip[IP_STR_MAX_LEN];
    char deviceName[DEVICE_NAME_BUF_LEN];
    int32_t socket;
    int32_t sentCount;
    int32_t okCount;
} CdDiscoveredDevice;

static CdDiscoveredDevice g_discovered[CD_MAX_DISCOVERED];
static pthread_mutex_t g_deviceLock = PTHREAD_MUTEX_INITIALIZER;

/* ========== 辅助函数 (单纯业务 / 表操作 / 状态展示) ========== */

static CdDiscoveredDevice *FindDiscoveredByDevIdLocked(const char *devId)
{
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (g_discovered[i].active && strcmp(g_discovered[i].devId, devId) == 0) {
            return &g_discovered[i];
        }
    }
    return NULL;
}

static CdDiscoveredDevice *FindFreeSlotLocked(void)
{
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (!g_discovered[i].active) {
            return &g_discovered[i];
        }
    }
    return NULL;
}

static void AddDiscovered(const DeviceInfo *device)
{
    (void)pthread_mutex_lock(&g_deviceLock);
    CdDiscoveredDevice *item = FindDiscoveredByDevIdLocked(device->devId);
    if (item == NULL) {
        item = FindFreeSlotLocked();
        if (item == NULL) {
            (void)pthread_mutex_unlock(&g_deviceLock);
            CD_LOG("discovered list full, drop device");
            return;
        }
        (void)memset_s(item, sizeof(*item), 0, sizeof(*item));
        item->active = true;
        item->socket = -1;
        (void)strncpy_s(item->devId, sizeof(item->devId), device->devId, strlen(device->devId));
        for (unsigned int i = 0; i < device->addrNum && i < CONNECTION_ADDR_MAX; i++) {
            if (device->addr[i].type == CONNECTION_ADDR_WLAN ||
                device->addr[i].type == CONNECTION_ADDR_ETH) {
                (void)strncpy_s(item->ip, sizeof(item->ip),
                    device->addr[i].info.ip.ip, strlen(device->addr[i].info.ip.ip));
                break;
            }
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

/* 按 devId 从表中移除设备（含关闭已建立的 Bind socket） */
static void RemoveDiscoveredByDevId(const char *devId)
{
    int32_t sockets[CD_MAX_DISCOVERED];
    int32_t sockCount = 0;
    (void)pthread_mutex_lock(&g_deviceLock);
    CdDiscoveredDevice *item = FindDiscoveredByDevIdLocked(devId);
    if (item != NULL) {
        if (item->socket > 0) {
            sockets[sockCount++] = item->socket;
        }
        (void)memset_s(item, sizeof(*item), 0, sizeof(*item));
        item->socket = -1;
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
    for (int32_t i = 0; i < sockCount; i++) {
        Shutdown(sockets[i]);
    }
}

/* 清空整个发现设备表: 期望 custdata 变化后旧设备必然全不匹配, 直接清表即可 */
static void ClearDiscovered(void)
{
    int32_t sockets[CD_MAX_DISCOVERED];
    int32_t sockCount = 0;
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (g_discovered[i].active) {
            if (g_discovered[i].socket > 0) {
                sockets[sockCount++] = g_discovered[i].socket;
            }
            (void)memset_s(&g_discovered[i], sizeof(g_discovered[i]), 0, sizeof(g_discovered[i]));
            g_discovered[i].socket = -1;
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
    for (int32_t i = 0; i < sockCount; i++) {
        Shutdown(sockets[i]);
    }
}

static void ListDiscovered(void)
{
    (void)pthread_mutex_lock(&g_deviceLock);
    int32_t count = 0;
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (!g_discovered[i].active) {
            continue;
        }
    char masked[CD_MASK_NAME_LEN] = {0};
        CdMaskUuid(g_discovered[i].devId, masked, sizeof(masked));
        const char *devName = g_discovered[i].deviceName[0] != '\0' ?
            g_discovered[i].deviceName : (masked[0] != '\0' ? masked : "unknown");
        printf("  [%d] 设备=%s IP=%s 状态=%s 已发消息=%d 成功=%d\n",
            i, devName,
            g_discovered[i].ip[0] != '\0' ? g_discovered[i].ip : "-",
            g_discovered[i].socket > 0 ? "已连接" : "未连接",
            g_discovered[i].sentCount, g_discovered[i].okCount);
        count++;
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
    if (count == 0) {
        printf("(还没有找到符合条件的设备)\n");
    }
}

static void SetDefaultPayload(void)
{
    (void)pthread_mutex_lock(&g_refreshLock);
    if (snprintf_s(g_expectedPayload, sizeof(g_expectedPayload),
        sizeof(g_expectedPayload) - 1, "%s", CD_DEFAULT_PAYLOAD) < 0) {
        CD_LOG("set default payload failed");
    }
    (void)pthread_mutex_unlock(&g_refreshLock);
}

/* 单设备: 解析 networkId 并生成 deviceName (udid 掩码), 使查看列表时尽早显示正确设备名 */
static void ResolveDiscoveredDevice(const DeviceInfo *device)
{
    if (device == NULL) {
        return;
    }
    DeviceInfo tmp;
    (void)memset_s(&tmp, sizeof(tmp), 0, sizeof(tmp));
    (void)strncpy_s(tmp.devId, sizeof(tmp.devId), device->devId, strlen(device->devId));
    for (unsigned int i = 0; i < device->addrNum && i < CONNECTION_ADDR_MAX; i++) {
        if (device->addr[i].type == CONNECTION_ADDR_WLAN ||
            device->addr[i].type == CONNECTION_ADDR_ETH) {
            tmp.addrNum = 1;
            tmp.addr[0].type = device->addr[i].type;
            (void)strncpy_s(tmp.addr[0].info.ip.ip, sizeof(tmp.addr[0].info.ip.ip),
                device->addr[i].info.ip.ip, strlen(device->addr[i].info.ip.ip));
            break;
        }
    }
    char networkId[NETWORK_ID_BUF_LEN] = {0};
    if (CdResolveNetworkId(&tmp, networkId, sizeof(networkId)) != SOFTBUS_OK) {
        return;
    }
    char name[DEVICE_NAME_BUF_LEN] = {0};
    (void)CdBuildDeviceName(networkId, name, sizeof(name));
    (void)pthread_mutex_lock(&g_deviceLock);
    CdDiscoveredDevice *item = FindDiscoveredByDevIdLocked(device->devId);
    if (item != NULL) {
        (void)strncpy_s(item->networkId, sizeof(item->networkId), networkId, strlen(networkId));
        if (name[0] != '\0') {
            (void)strncpy_s(item->deviceName, sizeof(item->deviceName), name, strlen(name));
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

/* 尝试为列表中的所有设备解析 networkId */
static void ResolveAllNetworkIds(void)
{
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        /* 卫语句: 仅处理已发现且尚未解析 networkId 的设备 */
        if (!g_discovered[i].active || g_discovered[i].networkId[0] != '\0') {
            continue;
        }
        DeviceInfo tmp;
        (void)memset_s(&tmp, sizeof(tmp), 0, sizeof(tmp));
        (void)strncpy_s(tmp.devId, sizeof(tmp.devId),
            g_discovered[i].devId, strlen(g_discovered[i].devId));
        if (g_discovered[i].ip[0] != '\0') {
            tmp.addrNum = 1;
            tmp.addr[0].type = CONNECTION_ADDR_WLAN;
            (void)strncpy_s(tmp.addr[0].info.ip.ip, sizeof(tmp.addr[0].info.ip.ip),
                g_discovered[i].ip, strlen(g_discovered[i].ip));
        }
        (void)pthread_mutex_unlock(&g_deviceLock);

        /* 解析走 IPC, 解锁后执行, 只依赖栈上拷贝的 tmp */
        char networkId[NETWORK_ID_BUF_LEN] = {0};
        char name[DEVICE_NAME_BUF_LEN] = {0};
        if (CdResolveNetworkId(&tmp, networkId, sizeof(networkId)) == SOFTBUS_OK) {
            (void)CdBuildDeviceName(networkId, name, sizeof(name));
        }

        (void)pthread_mutex_lock(&g_deviceLock);
        if (networkId[0] != '\0' && g_discovered[i].active) {
            (void)strncpy_s(g_discovered[i].networkId, sizeof(g_discovered[i].networkId),
                networkId, strlen(networkId));
            if (name[0] != '\0') {
                (void)strncpy_s(g_discovered[i].deviceName, sizeof(g_discovered[i].deviceName),
                    name, strlen(name));
            }
            CD_LOG("resolved networkId for discovered[%d]", i);
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

/* ========== 核心调用函数 (回调 / Bind / Send / Publish) ========== */

static void OnDeviceFound(const DeviceInfo *device)
{
    if (device == NULL) {
        return;
    }
        char masked[CD_MASK_NAME_LEN] = {0};
    if (device->devId[0] != '\0') {
        CdMaskUuid(device->devId, masked, sizeof(masked));
    }
    CD_LOG("OnDeviceFound devName=%s devType=%d devId=%s custData=[%s]",
        device->devName != NULL ? device->devName : "null",
        (int)device->devType, masked[0] != '\0' ? masked : "unknown",
        device->custData);
    if (device->custData[0] == '\0') {
        CD_LOG("custData empty, check DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA on both sides");
        return;
    }
    (void)pthread_mutex_lock(&g_refreshLock);
    bool matched = false;
    if (strcmp(device->custData, g_expectedPayload) == 0) {
        CD_LOG("custData match expected payload, add to discovered list");
        matched = true;
        AddDiscovered(device);
    } else {
        CD_LOG("custData mismatch, other device with custData, keep waiting");
        /* 该设备此前若已在表中（旧 custData 匹配过），现在不匹配则从表中移除 */
        RemoveDiscoveredByDevId(device->devId);
    }
    (void)pthread_mutex_unlock(&g_refreshLock);
    if (matched) {
        /* 尽早解析 networkId 并生成 udid 掩码 devName, 查看列表时即显示正确设备名 */
        ResolveDiscoveredDevice(device);
    }
}

static void OnDiscoverResult(int32_t refreshId, RefreshResult reason)
{
    (void)refreshId;
    CD_LOG("OnDiscoverResult reason=%d", (int)reason);
}

static void OnBindSocket(int32_t socket, PeerSocketInfo info)
{
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (g_discovered[i].active && g_discovered[i].socket == socket) {
            char peerName[DEVICE_NAME_BUF_LEN] = {0};
            if (info.networkId != NULL &&
                CdBuildDeviceName(info.networkId, peerName, sizeof(peerName)) == SOFTBUS_OK) {
                CD_LOG("[REF-BIND-OK] socket=%d, 对端=%s", socket, peerName);
            } else {
                CD_LOG("[REF-BIND-OK] socket=%d", socket);
            }
            break;
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

static void OnBindShutdown(int32_t socket, ShutdownReason reason)
{
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (g_discovered[i].active && g_discovered[i].socket == socket) {
            /* 对端主动停止(如 StopPublish)或连接断开, 从发现表中移除该设备 */
            CD_LOG("[REF-BIND-SHUTDOWN] socket=%d, reason=%d, 对端已停止, 移除设备", socket, (int)reason);
            (void)memset_s(&g_discovered[i], sizeof(g_discovered[i]), 0, sizeof(g_discovered[i]));
            g_discovered[i].socket = -1;
            break;
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

static void BuildBindListener(ISocketListener *listener)
{
    if (listener == NULL) {
        return;
    }
    (void)memset_s(listener, sizeof(*listener), 0, sizeof(*listener));
    /* Refresh 只发送不接收, 不注册 OnBytes/OnMessage */
    listener->OnBind = OnBindSocket;
    listener->OnShutdown = OnBindShutdown;
}

/* 对发现的设备主动 Bind: 成功返回 socket(>0), 失败返回负错误码。
 * 只依赖传入的 networkId, 不持表内 item 指针, 避免解锁后裸操作共享数据。 */
static int32_t BindOneDevice(const char *networkId)
{
    if (networkId == NULL || networkId[0] == '\0') {
        CD_LOG("BindOneDevice: networkId empty, resolve first");
        return SOFTBUS_NOT_FIND;
    }
    ISocketListener listener;
    BuildBindListener(&listener);
    int32_t socket = CdSocketCreate(networkId, DATA_TYPE_BYTES);
    if (socket <= 0) {
        return socket;
    }
    int32_t ret = CdSocketBind(socket, &listener);
    if (ret != SOFTBUS_OK) {
        return ret;
    }
    return socket;
}

/* 对所有已解析 networkId 且未绑定的设备主动 Bind */
static void BindAllDiscovered(void)
{
    ResolveAllNetworkIds();
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        /* 卫语句: 仅处理已发现且当前未连接(无有效 socket)的设备 */
        if (!g_discovered[i].active || g_discovered[i].socket > 0) {
            continue;
        }
        char networkId[NETWORK_ID_BUF_LEN] = {0};
        (void)strncpy_s(networkId, sizeof(networkId), g_discovered[i].networkId,
            strlen(g_discovered[i].networkId));
        (void)pthread_mutex_unlock(&g_deviceLock);

        /* Bind 为同步阻塞调用, 解锁后仅依赖栈上拷贝的 networkId, 不再访问共享表 */
        int32_t ret = BindOneDevice(networkId);

        (void)pthread_mutex_lock(&g_deviceLock);
        if (ret > 0 && g_discovered[i].active) {
            g_discovered[i].socket = ret;
            CD_LOG("Bind 成功: discovered[%d], socket=%d", i, ret);
        } else {
            CD_LOG("Bind 失败: discovered[%d] ret=%d", i, ret);
        }
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
}

/* 向所有已绑定设备发送数据 */
static void SendToAllBound(void)
{
    char buf[CD_TRANS_SEND_BUF] = {0};
    static int32_t sendSeq = 0;
    (void)pthread_mutex_lock(&g_refreshLock);
    int32_t len = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "hello,第%d条消息(特征:%s)",
        sendSeq++, g_expectedPayload);
    (void)pthread_mutex_unlock(&g_refreshLock);
    if (len <= 0) {
        return;
    }

    int32_t sent = 0;
    int32_t ok = 0;
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    (void)pthread_mutex_lock(&g_deviceLock);
    for (int32_t i = 0; i < CD_MAX_DISCOVERED; i++) {
        if (!g_discovered[i].active || g_discovered[i].socket < 0) {
            continue;
        }
        int32_t socket = g_discovered[i].socket;
        char peerName[DEVICE_NAME_BUF_LEN] = {0};
        (void)strncpy_s(peerName, sizeof(peerName), g_discovered[i].deviceName,
            strlen(g_discovered[i].deviceName));
        (void)pthread_mutex_unlock(&g_deviceLock);
        int32_t ret = CdSocketSendBytes(socket, buf, (uint32_t)len);
        (void)pthread_mutex_lock(&g_deviceLock);
        g_discovered[i].sentCount++;
        if (ret == SOFTBUS_OK) {
            g_discovered[i].okCount++;
            ok++;
        }
        sent++;
        CD_LOG("[SEND] 本机=%s -> 对端=%s, socket=%d, len=%d, ret=%d, data=[%s]",
            localName[0] != '\0' ? localName : "unknown",
            peerName[0] != '\0' ? peerName : "unknown",
            socket, len, ret, buf);
    }
    (void)pthread_mutex_unlock(&g_deviceLock);
    CD_LOG("Send 到 %d 个已绑定设备, 成功 %d", sent, ok);
}

static void ShowStatus(void)
{
    (void)pthread_mutex_lock(&g_refreshLock);
    CD_LOG("寻找状态: active=%s, 要找的特征=[%s]",
        CdBoolStr(g_refreshActive), g_expectedPayload);
    (void)pthread_mutex_unlock(&g_refreshLock);
    ListDiscovered();
}

static void ChangePayload(void)
{
    char buf[MAX_CAPABILITYDATA_LEN] = {0};
    if (CdGetInputPayload(buf, sizeof(buf), "请输入要找的设备特征 (回车保持当前):") < 0) {
        CD_LOG("读取失败");
        return;
    }
    if (buf[0] == '\0') {
        return;
    }
    (void)pthread_mutex_lock(&g_refreshLock);
    bool changed = (strcmp(g_expectedPayload, buf) != 0);
    if (changed) {
        (void)snprintf_s(g_expectedPayload, sizeof(g_expectedPayload),
            sizeof(g_expectedPayload) - 1, "%s", buf);
    }
    (void)pthread_mutex_unlock(&g_refreshLock);
    CD_LOG("expected payload set: [%s] len=%zu", g_expectedPayload, strlen(g_expectedPayload));
    if (changed) {
        ClearDiscovered();
    }
}

// RefreshLNN主要是配置好SubscibeInfo和Callback.
// 最终通过OnDeviceFound上报设备发现,进行处理。
// 不能重复RefreshLNN。一次RefreshLNN必须搭配一次StopRefreshLNN
static int32_t StartRefresh(void)
{
    if (g_refreshActive) {
        CD_LOG("refresh already active");
        return SOFTBUS_OK;
    }

    IRefreshCallback refreshCb = {
        .OnDeviceFound = OnDeviceFound,
        .OnDiscoverResult = OnDiscoverResult,
    };
    /* RefreshLNN 不携带期望 custdata: 该值不参与发现链路, custdata 过滤由 OnDeviceFound 回调完成. */
    SubscribeInfo info = {
        .subscribeId = CD_SUBSCRIBE_ID,
        .mode = DISCOVER_MODE_ACTIVE,
        .medium = COAP,
        .freq = MID,
        .isSameAccount = false,
        .isWakeRemote = false,
        .capability = CD_CAPABILITY,
        .capabilityData = NULL,
        .dataLen = 0,
    };
    CD_LOG("RefreshLNN start, capability=[%s]", info.capability);
    int32_t ret = RefreshLNN(CD_PKG_NAME, &info, &refreshCb);
    if (ret != SOFTBUS_OK) {
        CD_LOG("RefreshLNN fail ret=%d", ret);
        return ret;
    }
    g_refreshActive = true;
    return SOFTBUS_OK;
}

// 只要有PkgName和SubscirbeId,就能Stop对应的Refresh。
static int32_t StopRefresh(void)
{
    if (!g_refreshActive) {
        CD_LOG("refresh is not active");
        return SOFTBUS_OK;
    }

    int32_t ret = StopRefreshLNN(CD_PKG_NAME, CD_SUBSCRIBE_ID);
    CD_LOG("StopRefreshLNN ret=%d", ret);
    if (ret == SOFTBUS_OK) {
        g_refreshActive = false;
    }

    /* 停止发现后清空设备表(含关闭已建立的 Bind socket) */
    ClearDiscovered();
    return ret;
}

/* ========== 菜单 (最下方) ========== */

static void PrintRefreshMenu(void)
{
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    printf("\n===== 发现附近的设备 (本机: %s) =====\n",
        localName[0] != '\0' ? localName : "unknown");
    printf("  0 - 开始寻找设备\n");
    printf("  1 - 停止寻找\n");
    printf("  2 - 设置要找的设备特征\n");
    printf("  3 - 连接所有找到的设备\n");
    printf("  4 - 给已连接的设备发消息\n");
    printf("  5 - 查看当前状态\n");
    printf("  6 - 退出\n");
    printf("=======================================\n");
}

void CdMenuRefresh(void)
{
    SetDefaultPayload();

    bool running = true;
    while (running) {
        PrintRefreshMenu();
        int32_t choice = CdGetInputNumber("请选择:");
        switch (choice) {
            case CD_REFRESH_MENU_START:
                if (StartRefresh() != SOFTBUS_OK) {
                    CD_LOG("start refresh failed");
                }
                break;
            case CD_REFRESH_MENU_STOP:
                (void)StopRefresh();
                break;
            case CD_REFRESH_MENU_PAYLOAD:
                ChangePayload();
                break;
            case CD_REFRESH_MENU_BIND:
                BindAllDiscovered();
                break;
            case CD_REFRESH_MENU_SEND:
                SendToAllBound();
                break;
            case CD_REFRESH_MENU_STATUS:
                ShowStatus();
                break;
            case CD_REFRESH_MENU_EXIT:
                (void)StopRefresh();
                CD_LOG("再见");
                exit(0);
                break;
            default:
                printf("无效输入: %d\n", choice);
                break;
        }
    }
    CD_LOG("refresh menu exit");
}
