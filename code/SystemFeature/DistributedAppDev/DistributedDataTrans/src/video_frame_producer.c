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
#include <time.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

#include "video_frame_producer.h"

// 模拟数据的生成者，会生成数据到g_ring中

#define VS_DEFAULT_PRODUCE_FPS   60

typedef struct {
    uint8_t  *buf;
    uint32_t   len;
    uint32_t   seq;
    int64_t    timestamp;
    bool       valid;
} VsFrameSlot;

typedef struct {
    VsFrameSlot  slots[VS_RING_SLOTS];
    uint32_t     head;
    uint32_t     tail;
    uint32_t     count;
    pthread_mutex_t lock;
    pthread_cond_t  notEmpty;
    bool         producerRun;
} VsRing;

static VsRing g_ring;
static pthread_t g_producer;
static bool g_producerStarted = false;
static char g_localUuid[VS_STR_LEN];
static int32_t g_produceIntervalUs = VS_MICROSECONDS_PER_SECOND / VS_DEFAULT_PRODUCE_FPS;

static void RingInit(VsRing *r)
{
    (void)memset_s(r, sizeof(*r), 0, sizeof(*r));
    for (int i = 0; i < VS_RING_SLOTS; i++) {
        r->slots[i].buf = (uint8_t *)malloc(VS_FRAME_SIZE);
        if (r->slots[i].buf != NULL) {
            r->slots[i].len = VS_FRAME_SIZE;
        }
    }
    pthread_mutex_init(&r->lock, NULL);
    pthread_cond_init(&r->notEmpty, NULL);
    r->producerRun = false;
}

static void RingDeinit(VsRing *r)
{
    for (int i = 0; i < VS_RING_SLOTS; i++) {
        if (r->slots[i].buf != NULL) {
            free(r->slots[i].buf);
            r->slots[i].buf = NULL;
        }
    }
    pthread_mutex_destroy(&r->lock);
    pthread_cond_destroy(&r->notEmpty);
}

static bool RingPush(VsRing *r, const uint8_t *data, uint32_t len, uint32_t seq, int64_t ts)
{
    pthread_mutex_lock(&r->lock);
    VsFrameSlot *s = &r->slots[r->head];
    if (s->buf == NULL) {
        pthread_mutex_unlock(&r->lock);
        return false;
    }
    uint32_t copy = len > VS_FRAME_SIZE ? VS_FRAME_SIZE : len;
    (void)memcpy_s(s->buf, VS_FRAME_SIZE, data, copy);
    s->len = copy;
    s->seq = seq;
    s->timestamp = ts;
    s->valid = true;
    r->head = (r->head + 1) % VS_RING_SLOTS;
    if (r->count < VS_RING_SLOTS) {
        r->count++;
    } else {
        r->tail = (r->tail + 1) % VS_RING_SLOTS;
    }
    pthread_cond_signal(&r->notEmpty);
    pthread_mutex_unlock(&r->lock);
    return true;
}

static bool RingPop(VsRing *r, VsFrame *out, int32_t waitMs)
{
    pthread_mutex_lock(&r->lock);
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += waitMs / VS_MS_PER_SEC;
    ts.tv_nsec += (long)(waitMs % VS_MS_PER_SEC) * VS_NS_PER_MS;
    if (ts.tv_nsec >= VS_NS_PER_SEC) {
        ts.tv_sec += 1;
        ts.tv_nsec -= VS_NS_PER_SEC;
    }
    while (r->count == 0) {
        int ret = pthread_cond_timedwait(&r->notEmpty, &r->lock, &ts);
        if (ret != 0) {
            pthread_mutex_unlock(&r->lock);
            return false;
        }
    }
    VsFrameSlot *s = &r->slots[r->tail];
    if (s->buf != NULL && s->valid) {
        out->buf = s->buf;
        out->len = s->len;
        out->seq = s->seq;
        out->timestamp = s->timestamp;
    } else {
        out->buf = NULL;
    }
    s->valid = false;
    r->tail = (r->tail + 1) % VS_RING_SLOTS;
    r->count--;
    pthread_mutex_unlock(&r->lock);
    return out->buf != NULL;
}

static int32_t GenerateFrame(uint8_t *frame, uint32_t len, uint32_t seq)
{
    /* 帧内容格式: frame#<num>:<uuid>，如 "frame#001:uda**hh" */
    char content[VS_FRAME_SIZE];
    int32_t rc = snprintf_s(content, sizeof(content), sizeof(content) - 1,
        "frame#%03u:%s", seq, g_localUuid);
    if (rc < 0) {
        return -1;
    }
    rc = strncpy_s((char *)frame, len, content, strlen(content));
    if (rc != EOK) {
        return -1;
    }
    return 0;
}

static void *ProducerThread(void *arg)
{
    (void)arg;
    uint8_t frame[VS_FRAME_SIZE];
    uint32_t seq = 0;
    while (g_ring.producerRun) {
        if (GenerateFrame(frame, VS_FRAME_SIZE, seq) == 0) {
            struct timespec ts;
            clock_gettime(CLOCK_REALTIME, &ts);
            int64_t nowMs = (int64_t)ts.tv_sec * VS_MS_PER_SEC + ts.tv_nsec / VS_NS_PER_MS;
            RingPush(&g_ring, frame, VS_FRAME_SIZE, seq, nowMs);
            seq++;
        }
        usleep((useconds_t)g_produceIntervalUs);
    }
    return NULL;
}

int32_t VsProducerStart(const char *localUuid, int32_t produceIntervalUs)
{
    if (produceIntervalUs > 0) {
        g_produceIntervalUs = produceIntervalUs;
    }
    if (localUuid != NULL) {
        VsMaskUuid(localUuid, g_localUuid, sizeof(g_localUuid));
    } else {
        (void)strncpy_s(g_localUuid, sizeof(g_localUuid), "unknown", strlen("unknown"));
    }
    RingInit(&g_ring);
    g_ring.producerRun = true;
    int ret = pthread_create(&g_producer, NULL, ProducerThread, NULL);
    if (ret != 0) {
        VS_LOG("创建Producer线程失败: %d", ret);
        g_ring.producerRun = false;
        RingDeinit(&g_ring);
        return -1;
    }
    g_producerStarted = true;
    return 0;
}

void VsProducerStop(void)
{
    if (!g_producerStarted) {
        return;
    }
    g_ring.producerRun = false;
    pthread_join(g_producer, NULL);
    g_producerStarted = false;
    RingDeinit(&g_ring);
}

bool VsProducerGetFrame(VsFrame *frame, int32_t waitMs)
{
    return RingPop(&g_ring, frame, waitMs);
}