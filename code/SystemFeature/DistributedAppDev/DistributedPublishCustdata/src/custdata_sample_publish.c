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
#include "custdata_sample_publish.h"
#include "custdata_sample_trans.h"

enum {
    CD_PUBLISH_MENU_START = 0,
    CD_PUBLISH_MENU_STOP,
    CD_PUBLISH_MENU_PAYLOAD,
    CD_PUBLISH_MENU_STATUS,
    CD_PUBLISH_MENU_EXIT,
};

/* g_payload 仅主线程访问, 无需加锁;
 * g_publishActive 仅主线程访问, 无需加锁 */
static char g_payload[MAX_CAPABILITYDATA_LEN] = {0};
static bool g_publishActive = false;

/* ---- Listen 线程相关 ---- */
static pthread_t g_listenThread;
static volatile bool g_listenRun = false;
static int32_t g_listenSocket = -1;
static pthread_mutex_t g_listenLock = PTHREAD_MUTEX_INITIALIZER;

/* 对端(发现端) devName 与连接 socket, 由 OnListenBind 记录, 收发日志/退出清理复用 */
static pthread_mutex_t g_peerLock = PTHREAD_MUTEX_INITIALIZER;
static char g_peerName[DEVICE_NAME_BUF_LEN] = {0};
static int32_t g_clientSocket = -1;

/* ========== 辅助函数 (单纯业务 / 状态展示 / 输入) ========== */

static void SetDefaultPayload(void)
{
    if (snprintf_s(g_payload, sizeof(g_payload), sizeof(g_payload) - 1, "%s", CD_DEFAULT_PAYLOAD) < 0) {
        CD_LOG("set default payload failed");
    }
}

static bool CheckPayloadLen(void)
{
    size_t len = strlen(g_payload);
    if (len > CD_BDATA_MAX_LEN) {
        CD_LOG("payload len=%zu exceeds coap bData channel max=%d, publish will fail",
            len, CD_BDATA_MAX_LEN);
        return false;
    }
    return true;
}

static void ShowStatus(void)
{
    (void)pthread_mutex_lock(&g_listenLock);
    CD_LOG("publish active=%s, listenRun=%s, listenSocket=%d",
        CdBoolStr(g_publishActive), CdBoolStr(g_listenRun), g_listenSocket);
    (void)pthread_mutex_unlock(&g_listenLock);
    CD_LOG("payload=[%s]", g_payload);
}

static void ChangePayload(void)
{
    char buf[MAX_CAPABILITYDATA_LEN] = {0};
    if (CdGetInputPayload(buf, sizeof(buf), "请输入标识信息 (回车保持当前):") < 0) {
        CD_LOG("读取失败");
        return;
    }
    if (buf[0] == '\0') {
        return;
    }
    if (snprintf_s(g_payload, sizeof(g_payload), sizeof(g_payload) - 1, "%s", buf) < 0) {
        CD_LOG("set payload failed");
        return;
    }
    CD_LOG("payload set: [%s] len=%zu", g_payload, strlen(g_payload));
    CD_LOG("重新Publish后生效");
}

/* ========== 核心调用函数 (回调 / Listen 线程 / Publish) ========== */

static void OnPublishResult(int publishId, PublishResult reason)
{
    (void)publishId;
    (void)reason;
}

static void OnListenBytes(int32_t socket, const void *data, uint32_t len)
{
    if (data == NULL || len == 0) {
        return;
    }
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    (void)pthread_mutex_lock(&g_peerLock);
    char peerName[DEVICE_NAME_BUF_LEN] = {0};
    if (strncpy_s(peerName, sizeof(peerName), g_peerName, strlen(g_peerName)) != EOK) {
        peerName[0] = '\0';
    }
    (void)pthread_mutex_unlock(&g_peerLock);
    CD_LOG("[PUB-LISTEN-RECV] 本机=%s <- 对端=%s, socket=%d, len=%u, data=[%.*s]",
        localName[0] != '\0' ? localName : "unknown",
        peerName[0] != '\0' ? peerName : "unknown",
        socket, len, (int)len, (const char *)data);
}

static void OnListenBind(int32_t socket, PeerSocketInfo info)
{
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    char peerName[DEVICE_NAME_BUF_LEN] = {0};
    if (info.networkId != NULL &&
        CdBuildDeviceName(info.networkId, peerName, sizeof(peerName)) != SOFTBUS_OK) {
        (void)snprintf_s(peerName, sizeof(peerName), sizeof(peerName) - 1, "%s", "unknown");
    }
    (void)pthread_mutex_lock(&g_peerLock);
    g_clientSocket = socket;
    if (strncpy_s(g_peerName, sizeof(g_peerName), peerName, strlen(peerName)) != EOK) {
        g_peerName[0] = '\0';
    }
    (void)pthread_mutex_unlock(&g_peerLock);
    CD_LOG("[PUB-LISTEN-BIND] 本机=%s, socket=%d, 对端=%s, dataType=%d",
        localName[0] != '\0' ? localName : "unknown",
        socket, peerName[0] != '\0' ? peerName : "unknown", (int)info.dataType);
}

static void OnListenShutdown(int32_t socket, ShutdownReason reason)
{
    (void)pthread_mutex_lock(&g_peerLock);
    if (g_clientSocket == socket) {
        g_clientSocket = -1;
    }
    (void)pthread_mutex_unlock(&g_peerLock);
    CD_LOG("[PUB-LISTEN-SHUTDOWN] socket=%d, reason=%d", socket, (int)reason);
}

/* Listen 线程：发布成功后开启，等待发现端 Bind 并接收数据 */
static void *ListenThreadFunc(void *arg)
{
    (void)arg;
    ISocketListener listener;
    (void)memset_s(&listener, sizeof(listener), 0, sizeof(listener));
    /* Publish 只接收 Bytes 类型数据, 不注册 OnMessage */
    listener.OnBytes = OnListenBytes;
    listener.OnBind = OnListenBind;
    listener.OnShutdown = OnListenShutdown;

    int32_t socket = CdSocketCreate(NULL, DATA_TYPE_BYTES);
    if (socket <= 0) {
        CD_LOG("Listen thread: socket create fail");
        return NULL;
    }
    (void)pthread_mutex_lock(&g_listenLock);
    g_listenSocket = socket;
    (void)pthread_mutex_unlock(&g_listenLock);

    int32_t ret = CdSocketListen(socket, &listener);
    if (ret != SOFTBUS_OK) {
        CD_LOG("Listen thread: Listen fail ret=%d", ret);
        (void)pthread_mutex_lock(&g_listenLock);
        g_listenSocket = -1;
        (void)pthread_mutex_unlock(&g_listenLock);
        return NULL;
    }
    CD_LOG("Listen thread: 正在监听, socket=%d, 等待发现端 Bind...", socket);

    while (g_listenRun) {
        sleep(1);
    }

    CD_LOG("Listen thread: 退出, shutdown listen socket=%d", socket);
    Shutdown(socket);
    (void)pthread_mutex_lock(&g_listenLock);
    if (g_listenSocket == socket) {
        g_listenSocket = -1;
    }
    (void)pthread_mutex_unlock(&g_listenLock);

    /* 同时关闭已建立的连接 socket, 使对端收到 OnShutdown 并清理设备信息 */
    (void)pthread_mutex_lock(&g_peerLock);
    int32_t clientSocket = g_clientSocket;
    g_clientSocket = -1;
    (void)pthread_mutex_unlock(&g_peerLock);
    if (clientSocket > 0) {
        CD_LOG("Listen thread: shutdown client socket=%d", clientSocket);
        Shutdown(clientSocket);
    }
    return NULL;
}

static void CdStopListen(void)
{
    if (!g_listenRun) {
        return;
    }
    g_listenRun = false;
    (void)pthread_join(g_listenThread, NULL);
    CD_LOG("Listen 线程已停止");
}

static int32_t StartListen(void)
{
    if (g_listenRun) {
        CD_LOG("Listen already running");
        return SOFTBUS_OK;
    }
    g_listenRun = true;
    int ret = pthread_create(&g_listenThread, NULL, ListenThreadFunc, NULL);
    if (ret != 0) {
        CD_LOG("创建 Listen 线程失败: %d", ret);
        g_listenRun = false;
        return SOFTBUS_ERR;
    }
    return SOFTBUS_OK;
}
// PublishLNN需要设置PublishInfo和Callback
// 新增custdata就是通过capabilityData来传入
static int32_t StartPublish(void)
{
    if (g_publishActive) {
        CD_LOG("publish already active");
        return SOFTBUS_OK;
    }

    if (!CheckPayloadLen()) {
        return SOFTBUS_INVALID_PARAM;
    }

    IPublishCb publishCb = {
        .OnPublishResult = OnPublishResult,
    };
    PublishInfo info = {
        .publishId = CD_PUBLISH_ID,
        .mode = DISCOVER_MODE_PASSIVE,
        .medium = COAP,
        .freq = MID,
        .capability = CD_CAPABILITY,
        .capabilityData = (unsigned char *)g_payload,
        .dataLen = (unsigned int)strlen(g_payload),
        .ranging = false,
    };
    CD_LOG("PublishLNN payloadLen=%u payload=[%s]", info.dataLen, (const char *)info.capabilityData);
    int32_t ret = PublishLNN(CD_PKG_NAME, &info, &publishCb);
    if (ret != SOFTBUS_OK) {
        CD_LOG("PublishLNN fail ret=%d", ret);
        return ret;
    }
    g_publishActive = true;

    /* 发布成功后启动 Listen 线程等待发现端 Bind */
    if (StartListen() != SOFTBUS_OK) {
        CD_LOG("start listen fail");
    }
    return SOFTBUS_OK;
}

static int32_t StopPublish(void)
{
    if (!g_publishActive) {
        CD_LOG("publish is not active");
        return SOFTBUS_OK;
    }

    /* 先停 Listen 线程 */
    CdStopListen();

    int32_t ret = StopPublishLNN(CD_PKG_NAME, CD_PUBLISH_ID);
    CD_LOG("StopPublishLNN ret=%d", ret);
    if (ret == SOFTBUS_OK) {
        g_publishActive = false;
    }
    return ret;
}

/* ========== 菜单 (最下方) ========== */

static void PrintPublishMenu(void)
{
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    printf("\n===== 等待被发现 (本机: %s) =====\n",
        localName[0] != '\0' ? localName : "unknown");
    printf("  0 - 发布设备（允许被发现）\n");
    printf("  1 - 停止发布\n");
    printf("  2 - 设置标识信息\n");
    printf("  3 - 查看当前状态\n");
    printf("  4 - 退出\n");
    printf("=======================================\n");
}

void CdMenuPublish(void)
{
    SetDefaultPayload();

    bool running = true;
    while (running) {
        PrintPublishMenu();
        int32_t choice = CdGetInputNumber("请选择:");
        switch (choice) {
            case CD_PUBLISH_MENU_START:
                if (StartPublish() != SOFTBUS_OK) {
                    CD_LOG("start publish failed");
                }
                break;
            case CD_PUBLISH_MENU_STOP:
                (void)StopPublish();
                break;
            case CD_PUBLISH_MENU_PAYLOAD:
                ChangePayload();
                break;
            case CD_PUBLISH_MENU_STATUS:
                ShowStatus();
                break;
            case CD_PUBLISH_MENU_EXIT:
                (void)StopPublish();
                CD_LOG("再见");
                exit(0);
                break;
            default:
                printf("无效输入: %d\n", choice);
                break;
        }
    }
    CD_LOG("publish menu exit");
}
