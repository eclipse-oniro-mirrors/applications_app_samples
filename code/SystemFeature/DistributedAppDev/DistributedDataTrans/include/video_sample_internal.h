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

#ifndef VIDEO_SAMPLE_INTERNAL_H
#define VIDEO_SAMPLE_INTERNAL_H

#include <stdint.h>
#include "socket.h"
#include "softbus_common.h"
#include "trans_type.h"
#include "video_sample_common.h"
#include "video_frame_producer.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    LISTEN_STATE_START = 0,
    LISTEN_STATE_LISTENING,
    LISTEN_STATE_CONNECTED,
    LISTEN_STATE_FINISHED,
} ListenState;

int32_t VsSendFrame(int32_t socket, TransDataType dataType, const VsFrame *frame);
void VsBuildListenListener(ISocketListener *l);
void VsBuildBindListener(ISocketListener *l);
void VsInitListenSync(void);
void VsDeinitListenSync(void);
void VsSetListenState(ListenState state);
ListenState VsGetListenState(void);
void VsWaitListenExit(void);
void VsWaitListenConnected(void);
int32_t VsGetClientSocket(void);
TransDataType VsGetClientDataType(void);
void VsGetClientName(char *out, uint32_t outLen);
void VsRegisterSocketShutdownHook(void (*hook)(int32_t socket));
void VsRegisterPeerNameResolver(int32_t (*resolver)(int32_t socket, char *out, uint32_t outLen));
int32_t VsGetPeerNameBySocket(int32_t socket, char *out, uint32_t outLen);

#ifdef __cplusplus
}
#endif
#endif