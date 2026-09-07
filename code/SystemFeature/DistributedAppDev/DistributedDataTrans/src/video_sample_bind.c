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

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <pthread.h>

#include "socket.h"
#include "softbus_common.h"

#include "video_sample_bind.h"
#include "video_sample_internal.h"

// 该sample中，一个Bind端可以Bind多个Listen端。NetworkId和对端设备对应。
// Bind端主要有三个线程：
//  Producer:负责模拟数据的生成，有一定频率。
//  Consumer:负责测试数据的Send，有一定频率，每次循环，会将当前的数据按NetworkContext发给每一个注册Bind的对端设备。
//  Main:主线程负责查看当前Bind的情况，可查询NetworkId，注册Bind或关闭Bind。

#define VS_MAX_NETWORKS        8
#define VS_FRAME_WAIT_TIMEOUT_MS 1000

enum {
    VS_BIND_MENU_ADD = 0,
    VS_BIND_MENU_DELETE,
    VS_BIND_MENU_LIST,
    VS_BIND_MENU_ONLINE,
    VS_BIND_MENU_EXIT,
};
// 控制发数据的速度，便于演示
static const VsFrameRateConfig g_frameRateConfigTable[] = {
    { "流畅演示",   4,  2 },
    { "实时画质",  60, 30 },
};
// NetworkContext记录每个Bind的对象
typedef struct {
    char          networkId[NETWORK_ID_BUF_LEN];
    int32_t       socket;
    bool          active;
    int32_t       sentCount;
    int32_t       okCount;
    TransDataType dataType;
} NetworkContext;

static NetworkContext g_networks[VS_MAX_NETWORKS];
static pthread_mutex_t g_networkMutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_t g_consumerThread;
static volatile bool g_consumerRun = false;

static const VsFrameRateConfig *g_frameRateConfig = NULL;

typedef struct {
    int idx;
    int32_t socket;
    TransDataType dataType;
    char networkId[NETWORK_ID_BUF_LEN];
} SendTarget;


static const char *GetDataTypeName(TransDataType type)
{
    switch (type) {
        case DATA_TYPE_MESSAGE:    return "MESSAGE";
        case DATA_TYPE_BYTES:      return "BYTES";
        case DATA_TYPE_RAW_STREAM: return "STREAM";
        default:                   return "UNKNOWN";
    }
}

static void ListNetworks(void)
{
    typedef struct {
        char networkId[NETWORK_ID_BUF_LEN];
        TransDataType dataType;
        int32_t sentCount;
        int32_t okCount;
    } NetSnapshot;
    NetSnapshot snap[VS_MAX_NETWORKS];
    int32_t count = 0;

    pthread_mutex_lock(&g_networkMutex);
    for (int i = 0; i < VS_MAX_NETWORKS; i++) {
        if (g_networks[i].active && count < VS_MAX_NETWORKS) {
            (void)strncpy_s(snap[count].networkId, NETWORK_ID_BUF_LEN,
                g_networks[i].networkId, strlen(g_networks[i].networkId));
            snap[count].dataType = g_networks[i].dataType;
            snap[count].sentCount = g_networks[i].sentCount;
            snap[count].okCount = g_networks[i].okCount;
            count++;
        }
    }
    pthread_mutex_unlock(&g_networkMutex);

    if (count == 0) {
        printf("\n(暂无投屏设备)\n");
        return;
    }
    printf("\n--- 投屏列表 ---\n");
    for (int i = 0; i < count; i++) {
        char name[VS_DEVICE_NAME_LEN] = {0};
        if (VsBuildDeviceName(snap[i].networkId, name, sizeof(name)) != 0) {
            (void)strncpy_s(name, sizeof(name), "(unknown)", strlen("(unknown)"));
        }
        printf("  [%d] %s 类型=%s 已发=%d 成功=%d\n",
            i, name, GetDataTypeName(snap[i].dataType), snap[i].sentCount, snap[i].okCount);
    }
}

static NetworkContext *FindNetworkBySocketLocked(int32_t socket)
{
    for (int i = 0; i < VS_MAX_NETWORKS; i++) {
        if (g_networks[i].active && g_networks[i].socket == socket) {
            return &g_networks[i];
        }
    }
    return NULL;
}

static NetworkContext *FindNetworkByIdLocked(const char *networkId)
{
    for (int i = 0; i < VS_MAX_NETWORKS; i++) {
        if (g_networks[i].active &&
            strncmp(g_networks[i].networkId, networkId, NETWORK_ID_BUF_LEN) == 0) {
            return &g_networks[i];
        }
    }
    return NULL;
}

static NetworkContext *FindFreeSlotLocked(void)
{
    for (int i = 0; i < VS_MAX_NETWORKS; i++) {
        if (!g_networks[i].active) {
            return &g_networks[i];
        }
    }
    return NULL;
}
// 被动Shutdown时的处理hook
static void RemoveNetworkBySocket(int32_t socket)
{
    pthread_mutex_lock(&g_networkMutex);
    NetworkContext *ctx = FindNetworkBySocketLocked(socket);
    if (ctx != NULL) {
        VS_LOG("Remove network: socket=%d, networkId=%s, sent=%d, ok=%d",
            ctx->socket, ctx->networkId, ctx->sentCount, ctx->okCount);
        ctx->active = false;
        (void)memset_s(ctx, sizeof(NetworkContext), 0, sizeof(NetworkContext));
    }
    pthread_mutex_unlock(&g_networkMutex);
}

/* 按 socket 从投屏列表解析对端名, 供共享接收回调打印对端, 保证日志对称 */
static int32_t VsBindResolvePeerName(int32_t socket, char *out, uint32_t outLen)
{
    if (out == NULL || outLen == 0) {
        return -1;
    }
    pthread_mutex_lock(&g_networkMutex);
    NetworkContext *ctx = FindNetworkBySocketLocked(socket);
    if (ctx != NULL && ctx->networkId[0] != '\0') {
        int32_t ret = VsBuildDeviceName(ctx->networkId, out, outLen);
        pthread_mutex_unlock(&g_networkMutex);
        return (ret == 0) ? 0 : -1;
    }
    pthread_mutex_unlock(&g_networkMutex);
    out[0] = '\0';
    return -1;
}

static int32_t StartProducer(void)
{
    if (g_frameRateConfig == NULL) {
        return -1;
    }
    char localUuid[UUID_BUF_LEN] = {0};
    VsGetLocalUuid(localUuid, UUID_BUF_LEN);
    int32_t produceIntervalUs = VsFpsToIntervalUs(g_frameRateConfig->produceFps);
    return VsProducerStart(localUuid, produceIntervalUs);
}

/* ========== Consumer for send ========== */

static int32_t CollectTargets(SendTarget *targets, int32_t max)
{
    int32_t n = 0;
    pthread_mutex_lock(&g_networkMutex);
    for (int i = 0; i < VS_MAX_NETWORKS && n < max; i++) {
        if (g_networks[i].active) {
            targets[n].idx = i;
            targets[n].socket = g_networks[i].socket;
            targets[n].dataType = g_networks[i].dataType;
            (void)strncpy_s(targets[n].networkId, NETWORK_ID_BUF_LEN,
                g_networks[i].networkId, strlen(g_networks[i].networkId));
            n++;
        }
    }
    pthread_mutex_unlock(&g_networkMutex);
    return n;
}

static void UpdateResult(const SendTarget *t, int32_t ret)
{
    pthread_mutex_lock(&g_networkMutex);
    NetworkContext *ctx = &g_networks[t->idx];
    if (ctx->active && ctx->socket == t->socket) {
        ctx->sentCount++;
        if (ret == 0) {
            ctx->okCount++;
        }
    }
    pthread_mutex_unlock(&g_networkMutex);
}

static void SendToTarget(const SendTarget *target, const VsFrame *frame)
{
    int32_t ret = VsSendFrame(target->socket, target->dataType, frame);
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    char peerName[VS_DEVICE_NAME_LEN] = {0};
    if (VsBuildDeviceName(target->networkId, peerName, sizeof(peerName)) != 0) {
        (void)strncpy_s(peerName, sizeof(peerName), "(unknown)", strlen("(unknown)"));
    }
    VS_LOG("[SEND-%s] 本机=%s -> 对端=%s, socket=%d, seq=%u, len=%d, ret=%d, data=%.*s",
        GetDataTypeName(target->dataType),
        localName[0] != '\0' ? localName : "unknown",
        peerName[0] != '\0' ? peerName : "unknown",
        target->socket, frame->seq, frame->len, ret, (int)frame->len,
        frame->buf != NULL ? (const char *)frame->buf : "null");
    UpdateResult(target, ret);
}

static void *ConsumerThread(void *arg)
{
    (void)arg;
    VsFrame frame;
    while (g_consumerRun) {
        if (VsProducerGetFrame(&frame, VS_FRAME_WAIT_TIMEOUT_MS)) {
            SendTarget targets[VS_MAX_NETWORKS];
            int32_t n = CollectTargets(targets, VS_MAX_NETWORKS);
            for (int i = 0; i < n; i++) {
                SendToTarget(&targets[i], &frame);
            }
        }
        if (g_frameRateConfig != NULL && g_frameRateConfig->sendFps > 0) {
            usleep((useconds_t)VsFpsToIntervalUs(g_frameRateConfig->sendFps));
        }
    }
    return NULL;
}

/* ========== Consumer for send END ========== */

static bool VsBindInit(void)
{
    // Producer模拟frame数据的生成
    if (StartProducer() != 0) {
        VS_LOG("创建Producer线程失败,退出投屏");
        return false;
    }
    // 注册hook，关闭一个Bind时处理回调函数
    VsRegisterSocketShutdownHook(RemoveNetworkBySocket);
    // 注册对端名解析, 使共享接收回调在 Bind 端正确显示对端设备的信息
    VsRegisterPeerNameResolver(VsBindResolvePeerName);
    // Consumer负责调用Send函数发数据给Listen端
    g_consumerRun = true;
    int ret = pthread_create(&g_consumerThread, NULL, ConsumerThread, NULL);
    if (ret != 0) {
        VS_LOG("创建Consumer线程失败: %d", ret);
        g_consumerRun = false;
        VsRegisterSocketShutdownHook(NULL);
        VsProducerStop();
        return false;
    }
    return true;
}

static void VsBindDeInit(void)
{
    g_consumerRun = false;
    pthread_join(g_consumerThread, NULL);
    VsRegisterSocketShutdownHook(NULL);
    VsProducerStop();
}

static int32_t VsBindSocket(const char *peerNetworkId, TransDataType dataType)
{
    SocketInfo info;
    (void)memset_s(&info, sizeof(info), 0, sizeof(info));
    info.name = VS_SESSION_NAME;
    info.peerName = VS_SESSION_NAME;
    info.pkgName = VS_PKG_NAME;
    info.peerNetworkId = (char *)peerNetworkId;
    info.dataType = dataType;

    int32_t socket = Socket(info);
    if (socket <= 0) {
        VS_LOG("Socket() failed, ret = %d", socket);
        return socket;
    }
    VS_LOG("Socket() create succ, socket = %d", socket);
    return socket;
}

/*
 * Bind失败可能原因
 * 1. 对端尚未监听。
 * 2. 对端OnNegotiate时拒绝。
 * 3. 链路创建失败。
 */
static bool VsBindBind(int32_t socket)
{
    ISocketListener listener;
    (void)memset_s(&listener, sizeof(listener), 0, sizeof(listener));
    VsBuildBindListener(&listener);
    QosTV qos[1] = { { .qos = QOS_TYPE_MAX_LATENCY, .value = VS_QOS_MAX_LATENCY_US } };

    int32_t bindRet = Bind(socket, qos, 1, &listener);
    VS_LOG("Bind ret=%d", bindRet);
    return bindRet == 0;
}

// Bind端流程
// 1. 创建Socket:需要配置SocketInfo:dataType、peerNetWorkId、sessionName...
// 2. 开始Bind:注册Listener回调函数，后续通过回调函数处理，需要Listen端先Listen，并同意Bind。
// 3. 开始Send:Bind成功之后就进行Send了。
// 4. Shutdown:本端主动Shutdown，对端Shutdown通过OnShutdown回调处理
static bool VsAddBindInner(const char *networkId, TransDataType dataType, int32_t *outSocket)
{
    int32_t socket = VsBindSocket(networkId, dataType);
    if (socket <= 0) {
        return false;
    }
    if (!VsBindBind(socket)) {
        Shutdown(socket);
        return false;
    }
    *outSocket = socket;
    return true;
}

// VsAddBindInner为Bind主要逻辑
// 创建NetworkContext和Bind逻辑本身无关。
static void VsAddBindMenu(void)
{
    char networkId[NETWORK_ID_BUF_LEN];
    if (!VsSelectOnlineDevice(networkId, NETWORK_ID_BUF_LEN)) {
        return;
    }
    TransDataType dataType = VsSelectDataType();

    pthread_mutex_lock(&g_networkMutex);
    if (FindNetworkByIdLocked(networkId) != NULL) {
        VS_LOG("该设备已在投屏列表中");
        pthread_mutex_unlock(&g_networkMutex);
        return;
    }
    NetworkContext *ctx = FindFreeSlotLocked();
    if (ctx == NULL) {
        VS_LOG("投屏列表已满 (最多 %d 台)", VS_MAX_NETWORKS);
        pthread_mutex_unlock(&g_networkMutex);
        return;
    }
    pthread_mutex_unlock(&g_networkMutex);

    int32_t socket = -1;
    if (!VsAddBindInner(networkId, dataType, &socket)) {
        VS_LOG("投屏失败: 类型=%s", GetDataTypeName(dataType));
        return;
    }

    pthread_mutex_lock(&g_networkMutex);
    (void)strncpy_s(ctx->networkId, NETWORK_ID_BUF_LEN, networkId, strlen(networkId));
    ctx->socket = socket;
    ctx->active = true;
    ctx->sentCount = 0;
    ctx->okCount = 0;
    ctx->dataType = dataType;
    VS_LOG("投屏成功: socket=%d, 类型=%s",
        ctx->socket, GetDataTypeName(ctx->dataType));
    pthread_mutex_unlock(&g_networkMutex);
}

// 关闭Bind，只需要Shutdown对应的socket即可。
// 清理NetworkContext和Bind逻辑本身无关。
static void VsDeleteBindMenu(void)
{
    ListNetworks();
    int32_t idx = VsGetInputNumber("选择要断开的设备编号:");

    pthread_mutex_lock(&g_networkMutex);
    int32_t count = 0;
    NetworkContext *ctx = NULL;
    for (int i = 0; i < VS_MAX_NETWORKS; i++) {
        if (g_networks[i].active) {
            if (count == idx) {
                ctx = &g_networks[i];
                break;
            }
            count++;
        }
    }
    if (ctx == NULL) {
        VS_LOG("无效编号: %d", idx);
        pthread_mutex_unlock(&g_networkMutex);
        return;
    }

    int32_t socket = ctx->socket;
    char networkId[NETWORK_ID_BUF_LEN] = {0};
    (void)strncpy_s(networkId, sizeof(networkId), ctx->networkId, strlen(ctx->networkId));
    TransDataType dataType = ctx->dataType;
    int32_t sentCount = ctx->sentCount;
    int32_t okCount = ctx->okCount;
    (void)memset_s(ctx, sizeof(NetworkContext), 0, sizeof(NetworkContext));
    pthread_mutex_unlock(&g_networkMutex);

    char name[VS_DEVICE_NAME_LEN] = {0};
    VsBuildDeviceName(networkId, name, sizeof(name));
    VS_LOG("断开投屏: 设备=%s, 类型=%s, 已发=%d, 成功=%d",
        name, GetDataTypeName(dataType), sentCount, okCount);

    Shutdown(socket);
}

void VsMenuBind(void)
{
    VsPrintLocalDevice();
    g_frameRateConfig = &g_frameRateConfigTable[0];
    VS_LOG("帧率已固定为: %s (生成 %dfps, 发送 %dfps)",
        g_frameRateConfig->name, g_frameRateConfig->produceFps, g_frameRateConfig->sendFps);
    if (!VsBindInit()) {
        return;
    }

    bool running = true;
    while (running) {
        char localName[VS_DEVICE_NAME_LEN] = {0};
        VsGetLocalDeviceName(localName, sizeof(localName));
        printf("\n===== 投屏菜单 (本机: %s) =====\n",
            localName[0] != '\0' ? localName : "unknown");
        printf("  0 - 投屏到新设备\n");
        printf("  1 - 断开投屏\n");
        printf("  2 - 查看投屏列表\n");
        printf("  3 - 查看在线设备\n");
        printf("  4 - 退出投屏\n");
        printf("================================\n");

        int32_t choice = VsGetInputNumber("请选择:");
        switch (choice) {
            case VS_BIND_MENU_ADD:
                VsAddBindMenu();
                break;
            case VS_BIND_MENU_DELETE:
                VsDeleteBindMenu();
                break;
            case VS_BIND_MENU_LIST:
                ListNetworks();
                break;
            case VS_BIND_MENU_ONLINE:
                VsPrintOnlineDevices();
                break;
            case VS_BIND_MENU_EXIT:
                running = false;
                break;
            default:
                printf("无效输入: %d\n", choice);
                break;
        }
    }
    VsBindDeInit();
}
