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
    // 由播放器或录制器持有的配置，CodecUserData 仅借用。销毁上下文前必须先停止回调和工作线程。
    SampleInfo *sampleInfo = nullptr;
    bool isDecFirstFrame = false;
    bool isEncFirstFrame = false;

    int32_t width = 0;
    int32_t height = 0;
    int32_t widthStride = 0;
    int32_t heightStride = 0;
    // 解码器实际输出格式可能与 Configure() 请求的格式不同；格式变更回调在 codecMutex 保护下更新这些字段。
    OH_AVPixelFormat outputPixelFormat = AV_PIXEL_FORMAT_NV12;

    // 保护编解码器输出格式及尺寸，避免格式变更回调与送显线程同时读写。
    std::shared_mutex codecMutex;
    uint32_t inputFrameCount = 0;
    std::mutex inputMutex;
    std::condition_variable inputCond;
    CodecBufferQueue inputBufferQueue;

    uint32_t outputFrameCount = 0;
    std::mutex outputMutex;
    std::condition_variable renderCond;
    CodecBufferQueue outputBufferQueue;
    // 音频解码线程写入、AudioRenderer 回调读取，两个方向均须持有 outputMutex。
    std::queue<unsigned char> renderQueue;

    int64_t audioFramesWritten = 0;
    int64_t endPosAudioBufferPts = 0;
    int64_t currentPosAudioBufferPts = 0;

    std::atomic<bool> isDestroyed { false };
    std::atomic<bool> hasError { false };
    // 以下状态均由播放器持有，CodecUserData 只保存非拥有指针。
    // 注册音频/codec 回调前必须完成赋值，并保证其指向的状态晚于回调注销和工作线程退出才销毁。
    std::atomic<bool> *runningFlag = nullptr;
    std::atomic<bool> *playbackFailure = nullptr;
    // AudioRenderer 中断回调共享的播放状态。
    std::atomic<bool> *pausedFlag = nullptr;
    std::atomic<bool> *audioInterrupted = nullptr;
    std::atomic<bool> *audioResumePending = nullptr;
    std::atomic<uint64_t> *audioInterruptCount = nullptr;
    std::atomic<int32_t> *audioInterruptHint = nullptr;
    std::atomic<float> *audioVolume = nullptr;
    std::atomic<bool> *audioDucked = nullptr;
    std::condition_variable *pauseCond = nullptr;
    std::atomic<uint64_t> *audioUnderruns = nullptr;
    std::atomic<int64_t> *audioQueueDurationUs = nullptr;
    std::atomic<int64_t> *playbackPositionUs = nullptr;

    void SignalError()
    {
        // 此方法可由 codec 或 AudioRenderer 回调线程调用，只更新原子状态并唤醒等待线程；
        // 不在回调中执行 Stop、Destroy 等可能阻塞或再次触发回调的 codec 操作。
        hasError = true;
        if (playbackFailure != nullptr) {
            playbackFailure->store(true);
        }
        if (runningFlag != nullptr) {
            runningFlag->store(false);
        }
        inputBufferQueue.CancelWait();
        outputBufferQueue.CancelWait();
        renderCond.notify_all();
    }
    // [Start buffer_clearn]
    void ClearQueue()
    {
        inputBufferQueue.Flush();
        outputBufferQueue.Flush();
    }
    // [End buffer_clearn]

    // 必须在持有 outputMutex 时调用。播放 PCM 已统一为 S16LE，因此可按双字节采样值计算队列时长。
    void UpdateAudioQueueDuration()
    {
        constexpr int64_t usPerSecond = 1'000'000;
        constexpr int32_t s16BytesPerSample = 2;
        if (audioQueueDurationUs == nullptr || sampleInfo == nullptr ||
            sampleInfo->audio.audioChannelCount <= 0 || sampleInfo->audio.audioSampleRate <= 0) {
            return;
        }
        const int64_t queuedFrames = static_cast<int64_t>(renderQueue.size()) /
            sampleInfo->audio.audioChannelCount / s16BytesPerSample;
        audioQueueDurationUs->store(queuedFrames * usPerSecond / sampleInfo->audio.audioSampleRate);
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
        // 只在本次调用内读取调用方提供的地址，将数据复制到 cache；不保存外部裸指针。
        const auto *source = static_cast<const char *>(buffer);
        std::copy_n(source, bufferLen, cache.data() + remainlen);
        remainlen += bufferLen;
    }

    bool ReadCache(void *buffer, int32_t bufferLen)
    {
        if (buffer == nullptr || bufferLen <= 0 || remainlen < bufferLen) {
            return false;
        }
        // 目标地址由 AudioRenderer 回调提供，仅在回调期间有效，复制完成后不保留该地址。
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
