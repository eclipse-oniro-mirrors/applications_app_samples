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
#include <unistd.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdatomic.h>

#include "video_sample_internal.h"

#define VS_KEY_FRAME_INTERVAL 30

enum {
    VS_FRAME_TYPE_I = 0,
    VS_FRAME_TYPE_P = 1,
};

static atomic_int g_recvFrames = 0;

typedef struct {
    int32_t       socket;
    char          networkId[NETWORK_ID_BUF_LEN];
    TransDataType dataType;
} ListenClient;

static ListenClient g_client;
static ListenState  g_listenState = LISTEN_STATE_START;

static pthread_mutex_t g_listenMutex;
static pthread_cond_t  g_listenCond;

static void (*g_bindShutdownHook)(int32_t socket) = NULL;
/* Bind 端注册的对端名解析函数, 共享接收回调按 socket 解析对端名,
 * 保证 Bind/Listen 两端日志对端显示一致 */
static int32_t (*g_peerNameResolver)(int32_t socket, char *out, uint32_t outLen) = NULL;

/* ========== shared callbacks ========== */

static void OnStream(int32_t socket, const StreamData *data, const StreamData *ext,
    const StreamFrameInfo *param)
{
    atomic_fetch_add(&g_recvFrames, 1);
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    char peerName[VS_DEVICE_NAME_LEN] = {0};
    VsGetPeerNameBySocket(socket, peerName, sizeof(peerName));
    VS_LOG("[RECV-STREAM] 本机=%s <- 对端=%s, socket=%d, frameSeq=%d, total=%d, len=%d, data=%.*s",
        localName[0] != '\0' ? localName : "unknown",
        peerName[0] != '\0' ? peerName : "unknown",
        socket, param != NULL ? param->seqNum : -1, atomic_load(&g_recvFrames),
        data != NULL ? data->bufLen : 0,
        data != NULL ? (int)data->bufLen : 0,
        (data != NULL && data->buf != NULL) ? (const char *)data->buf : "null");
}

static void OnBytes(int32_t socket, const void *data, uint32_t len)
{
    atomic_fetch_add(&g_recvFrames, 1);
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    char peerName[VS_DEVICE_NAME_LEN] = {0};
    VsGetPeerNameBySocket(socket, peerName, sizeof(peerName));
    VS_LOG("[RECV-BYTES] 本机=%s <- 对端=%s, socket=%d, total=%d, len=%d, data=%.*s",
        localName[0] != '\0' ? localName : "unknown",
        peerName[0] != '\0' ? peerName : "unknown",
        socket, atomic_load(&g_recvFrames), len, (int)len,
        data != NULL ? (const char *)data : "null");
}

static void OnMessage(int32_t socket, const void *data, uint32_t len)
{
    atomic_fetch_add(&g_recvFrames, 1);
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    char peerName[VS_DEVICE_NAME_LEN] = {0};
    VsGetPeerNameBySocket(socket, peerName, sizeof(peerName));
    VS_LOG("[RECV-MESSAGE] 本机=%s <- 对端=%s, socket=%d, total=%d, len=%d, data=%.*s",
        localName[0] != '\0' ? localName : "unknown",
        peerName[0] != '\0' ? peerName : "unknown",
        socket, atomic_load(&g_recvFrames), len, (int)len,
        data != NULL ? (const char *)data : "null");
}

static void OnFile(int32_t socket, FileEvent *event)
{
    (void)socket;
    (void)event;
}

/* ========== Listen-specific ========== */

void VsInitListenSync(void)
{
    (void)pthread_mutex_init(&g_listenMutex, NULL);
    (void)pthread_cond_init(&g_listenCond, NULL);
    (void)memset_s(&g_client, sizeof(g_client), 0, sizeof(g_client));
    g_client.socket = -1;
    g_client.dataType = DATA_TYPE_BYTES;
    g_listenState = LISTEN_STATE_START;
}

void VsDeinitListenSync(void)
{
    (void)pthread_cond_destroy(&g_listenCond);
    (void)pthread_mutex_destroy(&g_listenMutex);
}

void VsSetListenState(ListenState state)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    g_listenState = state;
    (void)pthread_cond_broadcast(&g_listenCond);
    (void)pthread_mutex_unlock(&g_listenMutex);
}

ListenState VsGetListenState(void)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    ListenState state = g_listenState;
    (void)pthread_mutex_unlock(&g_listenMutex);
    return state;
}
// Listen线程调用：阻塞直到状态变为 FINISHED
void VsWaitListenExit(void)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    while (g_listenState != LISTEN_STATE_FINISHED) {
        (void)pthread_cond_wait(&g_listenCond, &g_listenMutex);
    }
    (void)pthread_mutex_unlock(&g_listenMutex);
}
// 主线程调用：阻塞直到连接建立(CONNECTED)或失败(FINISHED)
void VsWaitListenConnected(void)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    while (g_listenState == LISTEN_STATE_START || g_listenState == LISTEN_STATE_LISTENING) {
        (void)pthread_cond_wait(&g_listenCond, &g_listenMutex);
    }
    (void)pthread_mutex_unlock(&g_listenMutex);
}

int32_t VsGetClientSocket(void)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    int32_t sock = g_client.socket;
    (void)pthread_mutex_unlock(&g_listenMutex);
    return sock;
}

TransDataType VsGetClientDataType(void)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    TransDataType type = g_client.dataType;
    (void)pthread_mutex_unlock(&g_listenMutex);
    return type;
}

void VsGetClientName(char *out, uint32_t outLen)
{
    char networkId[NETWORK_ID_BUF_LEN] = {0};
    (void)pthread_mutex_lock(&g_listenMutex);
    if (g_client.networkId[0] != '\0') {
        (void)strncpy_s(networkId, sizeof(networkId),
            g_client.networkId, strlen(g_client.networkId));
    }
    (void)pthread_mutex_unlock(&g_listenMutex);

    if (networkId[0] != '\0') {
        (void)VsBuildDeviceName(networkId, out, outLen);
    } else {
        out[0] = '\0';
    }
}

void VsRegisterPeerNameResolver(int32_t (*resolver)(int32_t socket, char *out, uint32_t outLen))
{
    g_peerNameResolver = resolver;
}

int32_t VsGetPeerNameBySocket(int32_t socket, char *out, uint32_t outLen)
{
    if (g_peerNameResolver != NULL) {
        return g_peerNameResolver(socket, out, outLen);
    }
    VsGetClientName(out, outLen); /* Listen 端默认取 g_client */
    return (out[0] != '\0') ? 0 : -1;
}

static void OnBind(int32_t socket, PeerSocketInfo info)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    g_client.socket = socket;
    g_client.dataType = info.dataType;
    if (info.networkId != NULL) {
        (void)strncpy_s(g_client.networkId, sizeof(g_client.networkId),
            info.networkId, strlen(info.networkId));
    }
    (void)pthread_mutex_unlock(&g_listenMutex);

    VsSetListenState(LISTEN_STATE_CONNECTED);
    VS_LOG("OnBind socket=%d, dataType=%d", socket, (int32_t)info.dataType);
}

static bool ListenOnNegotiate(int32_t socket, PeerSocketInfo info)
{
    (void)pthread_mutex_lock(&g_listenMutex);
    bool alreadyOnline = (g_listenState == LISTEN_STATE_CONNECTED);
    (void)pthread_mutex_unlock(&g_listenMutex);
    if (alreadyOnline) {
        VS_LOG("[Listen] 已有投屏连接,自动拒绝新请求");
        return false;
    }

    char peerName[VS_DEVICE_NAME_LEN] = {0};
    if (info.networkId != NULL) {
        (void)VsBuildDeviceName(info.networkId, peerName, sizeof(peerName));
    }
    VS_LOG("[Listen] 收到投屏请求: socket=%d, 设备=%s, pkgName=%s",
        socket,
        peerName[0] != '\0' ? peerName : (info.name != NULL ? info.name : "null"),
        info.pkgName != NULL ? info.pkgName : "null");
    // 此时主线程在VsWaitListenConnected中等待,不读取stdin,可安全独占输入
    int32_t choice = VsGetInputNumber("是否接受？(1=接受, 0=拒绝):");
    return (choice == 1);
}

static void ListenOnShutdown(int32_t socket, ShutdownReason reason)
{
    VS_LOG("[Listen] OnShutdown socket=%d, reason=%d", socket, (int32_t)reason);
    (void)pthread_mutex_lock(&g_listenMutex);
    (void)memset_s(&g_client, sizeof(g_client), 0, sizeof(g_client));
    g_client.socket = -1;
    (void)pthread_mutex_unlock(&g_listenMutex);

    VsSetListenState(LISTEN_STATE_FINISHED);
}

/* ========== Bind-specific ========== */

void VsRegisterSocketShutdownHook(void (*hook)(int32_t socket))
{
    g_bindShutdownHook = hook;
}

static void BindOnShutdown(int32_t socket, ShutdownReason reason)
{
    VS_LOG("[Bind] OnShutdown socket=%d, reason=%d", socket, (int32_t)reason);
    if (g_bindShutdownHook != NULL) {
        g_bindShutdownHook(socket);
    }
}

/* ========== public listener builders ========== */

static void VsBuildBaseListener(ISocketListener *l)
{
    l->OnBytes = OnBytes;
    l->OnMessage = OnMessage;
    l->OnStream = OnStream;
    l->OnFile = OnFile;
}

void VsBuildListenListener(ISocketListener *l)
{
    if (l == NULL) {
        return;
    }
    VsBuildBaseListener(l);
    l->OnBind = OnBind;
    l->OnShutdown = ListenOnShutdown;
    l->OnNegotiate = ListenOnNegotiate;
}

void VsBuildBindListener(ISocketListener *l)
{
    if (l == NULL) {
        return;
    }
    VsBuildBaseListener(l);
    l->OnShutdown = BindOnShutdown;
}

/* ========== public sender ========== */

int32_t VsSendFrame(int32_t socket, TransDataType dataType, const VsFrame *frame)
{
    if (frame == NULL) {
        return -1;
    }
    switch (dataType) {
        case DATA_TYPE_MESSAGE:
            return SendMessage(socket, frame->buf, frame->len);
        case DATA_TYPE_BYTES:
            return SendBytes(socket, frame->buf, frame->len);
        case DATA_TYPE_RAW_STREAM: {
            StreamData data = { .buf = (char *)frame->buf, .bufLen = (int)frame->len };
            StreamData ext = { 0 };
            StreamFrameInfo frameInfo;
            (void)memset_s(&frameInfo, sizeof(frameInfo), 0, sizeof(frameInfo));
            frameInfo.seqNum = (int32_t)frame->seq;
            frameInfo.timeStamp = frame->timestamp;
            frameInfo.frameType = (frame->seq % VS_KEY_FRAME_INTERVAL == 0) ? VS_FRAME_TYPE_I : VS_FRAME_TYPE_P;
            return SendStream(socket, &data, &ext, &frameInfo);
        }
        default:
            return SendBytes(socket, frame->buf, frame->len);
    }
}

