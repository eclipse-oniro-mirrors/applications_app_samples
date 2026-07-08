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

#ifndef HMOS_LIVESTREAM_CODECINFO_H
#define HMOS_LIVESTREAM_CODECINFO_H

#include <condition_variable>
#include <queue>
#include <algorithm>
#include "AudioBgmQueue.h"
#include "SampleInfo.h"
#include "FrameQueue.h"

// Frame data for Buffer模式
struct FrameData {
    std::vector<uint8_t> pixels;
    std::string roiStr;
};

struct CodecBufferInfo {
    uint32_t bufferIndex = 0;
    uintptr_t *buffer = nullptr;
    uint8_t *bufferAddr = nullptr;
    OH_AVCodecBufferAttr attr = {0, 0, 0, AVCODEC_BUFFER_FLAGS_NONE};

    explicit CodecBufferInfo(uint8_t *addr) : bufferAddr(addr){};
    CodecBufferInfo(uint8_t *addr, int32_t bufferSize)
        : bufferAddr(addr), attr({0, bufferSize, 0, AVCODEC_BUFFER_FLAGS_NONE}){};
    CodecBufferInfo(uint32_t argBufferIndex, OH_AVBuffer *argBuffer)
        : bufferIndex(argBufferIndex), buffer(reinterpret_cast<uintptr_t *>(argBuffer))
    {
        OH_AVBuffer_GetBufferAttr(argBuffer, &attr);
    };
};

struct CodecUserData {
public:
    SampleInfo *sampleInfo = nullptr;
    RoiPathType roiPathType = ROI_PATH_NATIVEBUFFER;
    FrameQueue *frameQueue = nullptr;

    uint32_t inputFrameCount = 0;
    std::mutex inputMutex;
    std::condition_variable inputCond;
    std::queue<CodecBufferInfo> inputBufferInfoQueue;

    uint32_t outputFrameCount = 0;
    std::mutex outputMutex;
    std::condition_variable outputCond;
    std::mutex renderMutex;
    std::condition_variable renderCond;
    std::queue<CodecBufferInfo> outputBufferInfoQueue;

    std::queue<unsigned char> renderQueue;
    AudioBgmQueue* decodedBgmQueue;

    // Create cache
    std::vector<char> cache;
    int32_t remainlen = 0;

    void ClearCache()
    {
        cache.clear();
        remainlen = 0;
    }

    void WriteCache(void *buffer, int32_t bufferLen)
    {
        if (bufferLen + remainlen > cache.size()) {
            cache.resize(remainlen + bufferLen);
        }
        std::copy(static_cast<const char *>(buffer),
                  static_cast<const char *>(buffer) + bufferLen,
                  cache.data() + remainlen);
        remainlen += bufferLen;
    }

    bool ReadCache(void *buffer, int32_t bufferLen)
    {
        if (remainlen < bufferLen) {
            return false;
        }
        std::copy(cache.data(), cache.data() + bufferLen,
                  static_cast<char *>(buffer));
        remainlen = remainlen - bufferLen;
        if (remainlen > 0) {
            std::copy(cache.data() + bufferLen,
                  cache.data() + bufferLen + remainlen,
                  cache.data());
        }
        return true;
    }
};

#endif // HMOS_LIVESTREAM_CODECINFO_H
