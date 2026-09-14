/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef AVCODEC_SAMPLE_CODEC_USER_DATA_H
#define AVCODEC_SAMPLE_CODEC_USER_DATA_H

#include <algorithm>
#include <atomic>
#include <condition_variable>
#include <mutex>
#include <queue>
#include <shared_mutex>
#include <vector>
#include "codec_buffer.h"
#include "sample_config.h"

struct CodecUserData {
    SampleInfo *sampleInfo = nullptr;
    bool isDecFirstFrame = false;
    bool isEncFirstFrame = false;

    int32_t width = 0;
    int32_t height = 0;
    int32_t widthStride = 0;
    int32_t heightStride = 0;

    std::shared_mutex codecMutex;
    uint32_t inputFrameCount = 0;
    std::mutex inputMutex;
    std::condition_variable inputCond;
    CodecBufferQueue inputBufferQueue;

    uint32_t outputFrameCount = 0;
    std::mutex outputMutex;
    std::condition_variable renderCond;
    CodecBufferQueue outputBufferQueue;
    std::queue<unsigned char> renderQueue;

    int64_t audioFramesWritten = 0;
    int64_t endPosAudioBufferPts = 0;
    int64_t currentPosAudioBufferPts = 0;

    std::atomic<bool> isDestroyed { false };
    std::atomic<bool> hasError { false };
    std::atomic<bool> *runningFlag = nullptr;
    std::atomic<int64_t> *playbackPositionUs = nullptr;

    void ClearQueue()
    {
        inputBufferQueue.Flush();
        outputBufferQueue.Flush();
    }

    std::vector<char> cache;
    int32_t remainlen = 0;

    void ClearCache()
    {
        cache.clear();
        remainlen = 0;
    }

    void WriteCache(void *buffer, int32_t bufferLen)
    {
        if (buffer == nullptr || bufferLen <= 0) {
            return;
        }
        if (bufferLen + remainlen > cache.size()) {
            cache.resize(remainlen + bufferLen);
        }
        const auto *source = static_cast<const char *>(buffer);
        std::copy_n(source, bufferLen, cache.data() + remainlen);
        remainlen += bufferLen;
    }

    bool ReadCache(void *buffer, int32_t bufferLen)
    {
        if (buffer == nullptr || bufferLen <= 0 || remainlen < bufferLen) {
            return false;
        }
        auto *destination = static_cast<char *>(buffer);
        std::copy_n(cache.data(), bufferLen, destination);
        remainlen -= bufferLen;
        if (remainlen > 0) {
            std::move(cache.begin() + bufferLen, cache.begin() + bufferLen + remainlen, cache.begin());
        }
        return true;
    }
};

#endif // AVCODEC_SAMPLE_CODEC_USER_DATA_H
