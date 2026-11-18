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
#include <pthread.h>

#include "socket.h"
#include "softbus_common.h"

#include "video_sample_listen.h"
#include "video_sample_internal.h"

// Listen端有两个线程：
//  Listen线程:负责Socket/Listen/等待退出/Shutdown。
//  Main(主线程):负责菜单交互,可主动Send或退出。
// 四个状态:START->LISTENING->CONNECTED->FINISHED

enum {
    VS_LISTEN_SEND_BUF_LEN = 32,
};

enum {
    VS_LISTEN_MENU_SEND = 0,
    VS_LISTEN_MENU_STATUS,
    VS_LISTEN_MENU_EXIT,
};

static pthread_t g_listenThread;

typedef struct {
    TransDataType dataType;
} ListenThreadArg;

static int32_t VsListenSocket(TransDataType dataType)
{
    SocketInfo info;
    (void)memset_s(&info, sizeof(info), 0, sizeof(info));
    info.name = VS_SESSION_NAME;
    info.peerName = VS_SESSION_NAME;
    info.pkgName = VS_PKG_NAME;
    info.dataType = dataType;

    int32_t socket = Socket(info);
    if (socket <= 0) {
        VS_LOG("Socket() failed, ret = %d", socket);
        return socket;
    }
    VS_LOG("Socket() create succ, socket = %d", socket);
    return socket;
}

static bool VsListenListen(const int32_t socket)
{
    ISocketListener listener;
    (void)memset_s(&listener, sizeof(listener), 0, sizeof(listener));
    VsBuildListenListener(&listener);
    QosTV qos[1] = { { .qos = QOS_TYPE_MAX_LATENCY, .value = VS_QOS_MAX_LATENCY_US } };

    int32_t ret = Listen(socket, qos, 1, &listener);
    if (ret != 0) {
        VS_LOG("Listen failed, ret = %d", ret);
        Shutdown(socket);
        return false;
    }
    return true;
}

static void VsListenWait(const int32_t socket)
{
    VsWaitListenExit();
    Shutdown(socket);
}

/*
 * Listen端流程
 * 1. 创建Socket:需要配置SocketInfo:dataType、sessionName
 * 2. 开始Listen:注册Listener回调函数,后续通过回调函数处理
 * 3. Listen端也可以Send给Bind端:通过菜单主动SendBytes/SendMessage等
 * 4. 等待退出后通过Shutdown关闭监听Socket
 */
static void *ListenThreadFunc(void *arg)
{
    ListenThreadArg *threadArg = (ListenThreadArg *)arg;
    TransDataType dataType = threadArg->dataType;

    int32_t socket = VsListenSocket(dataType);
    if (socket <= 0 || !VsListenListen(socket)) {
        VsSetListenState(LISTEN_STATE_FINISHED);
        return NULL;
    }

    VS_LOG("监听 socket=%d, 等待投屏请求...", socket);
    VsSetListenState(LISTEN_STATE_LISTENING);

    VsListenWait(socket);
    VS_LOG("投屏已结束");
    return NULL;
}

static void VsPrintListenMenu(void)
{
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    printf("\n===== 接收菜单 (本机: %s) =====\n",
        localName[0] != '\0' ? localName : "unknown");
    printf("  0 - 发送数据\n");
    printf("  1 - 查看状态\n");
    printf("  2 - 退出\n");
    printf("=================================\n");
}

static void VsListenSendData(void)
{
    if (VsGetListenState() != LISTEN_STATE_CONNECTED) {
        VS_LOG("当前未连接,无法发送");
        return;
    }
    int32_t socket = VsGetClientSocket();
    if (socket <= 0) {
        VS_LOG("socket无效");
        return;
    }
    static int32_t sendSeq = 0;
    char buf[VS_LISTEN_SEND_BUF_LEN];
    int32_t len = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1,
        "listenSend_%d", sendSeq++);
    if (len <= 0) {
        return;
    }
    VsFrame frame = {
        .buf = (uint8_t *)buf,
        .len = (uint32_t)len,
        .seq = (uint32_t)sendSeq,
        .timestamp = 0,
    };
    TransDataType dataType = VsGetClientDataType();
    int32_t ret = VsSendFrame(socket, dataType, &frame);
    VS_LOG("[Listen] 发送 ret=%d, dataType=%d", ret, (int32_t)dataType);
}

static void VsListenPrintStatus(void)
{
    switch (VsGetListenState()) {
        case LISTEN_STATE_FINISHED:
            VS_LOG("状态: 监听已结束,请关闭用例");
            break;
        case LISTEN_STATE_START:
            VS_LOG("状态: 正在启动监听...");
            break;
        case LISTEN_STATE_LISTENING:
            VS_LOG("状态: 等待投屏连接...");
            break;
        case LISTEN_STATE_CONNECTED: {
            char name[VS_DEVICE_NAME_LEN] = {0};
            VsGetClientName(name, sizeof(name));
            VS_LOG("状态: 投屏中, 对端=%s", name[0] != '\0' ? name : "unknown");
            break;
        }
        default:
            break;
    }
}

static void VsListenExit(void)
{
    if (VsGetListenState() != LISTEN_STATE_CONNECTED) {
        return;
    }
    int32_t sock = VsGetClientSocket();
    if (sock > 0) {
        Shutdown(sock);
    }
    VsSetListenState(LISTEN_STATE_FINISHED);
}

static void VsHandleListenChoice(int32_t choice, bool *running)
{
    switch (choice) {
        case VS_LISTEN_MENU_SEND:
            VsListenSendData();
            break;
        case VS_LISTEN_MENU_STATUS:
            VsListenPrintStatus();
            break;
        case VS_LISTEN_MENU_EXIT:
            VsListenExit();
            *running = false;
            break;
        default:
            printf("无效输入: %d\n", choice);
            break;
    }
}

void VsMenuListen(void)
{
    VsInitListenSync();

    TransDataType dataType = VsSelectDataType();
    // Start Listen线程：Begin to Listen
    ListenThreadArg arg = { .dataType = dataType };
    int ret = pthread_create(&g_listenThread, NULL, ListenThreadFunc, &arg);
    if (ret != 0) {
        VS_LOG("创建Listen线程失败: %d", ret);
        VsDeinitListenSync();
        return;
    }
    // wait Connected
    VsWaitListenConnected();
    if (VsGetListenState() == LISTEN_STATE_FINISHED) {
        VS_LOG("监听启动失败或已结束");
        pthread_join(g_listenThread, NULL);
        VsDeinitListenSync();
        return;
    }
    // Listen进入到Connected之后再进入Menu
    bool running = true;
    while (running) {
        if (VsGetListenState() == LISTEN_STATE_FINISHED) {
            break;
        }
        VsPrintListenMenu();
        VsHandleListenChoice(VsGetInputNumber("请选择:"), &running);
    }

    pthread_join(g_listenThread, NULL);
    VsDeinitListenSync();
}
