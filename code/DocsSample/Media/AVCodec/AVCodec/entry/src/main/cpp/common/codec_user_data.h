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
#include "PcmQueue.h"
#include "AudioPlaybackCallbackContext.h"
#include "sample_config.h"
#include "OperationFailure.h"

class RecorderAudioStats;

struct CodecUserData {
    // 由播放器或录制器持有的配置，CodecUserData仅借用。销毁上下文前必须先停止回调和工作线程。
    SampleInfo *sampleInfo = nullptr;
    bool isDecFirstFrame = false;
    bool isEncFirstFrame = false;

    // 编码输入布局在首个输入Buffer到达时读取，与格式变化回调更新的输出布局分别保存。
    int32_t inputWidthStride = 0;
    int32_t inputHeightStride = 0;
    OH_AVPixelFormat inputPixelFormat = AV_PIXEL_FORMAT_NV12;

    int32_t width = 0;
    int32_t height = 0;
    int32_t widthStride = 0;
    int32_t heightStride = 0;
    // 解码器实际输出格式可能与Configure()请求的格式不同；格式变更回调在codecMutex保护下更新这些字段。
    OH_AVPixelFormat outputPixelFormat = AV_PIXEL_FORMAT_NV12;

    // 保护编解码器输出格式及尺寸，避免格式变更回调与送显线程同时读写。
    std::shared_mutex codecMutex;
    uint32_t inputFrameCount = 0;
    std::mutex inputMutex;
    std::condition_variable inputCond;
    CodecBufferQueue inputBufferQueue;

    std::atomic<uint32_t> outputFrameCount { 0 };
    std::atomic<bool> isFirstVideoSyncFrame{true};
    int64_t firstVideoSyncFramePts = 0;
    std::mutex outputMutex;
    std::condition_variable renderCond;
    CodecBufferQueue outputBufferQueue;
    // 音频解码线程写入、AudioRenderer回调读取，两个方向均须持有outputMutex。
    PcmQueue renderQueue;

    int64_t audioFramesWritten = 0;
    int64_t endPosAudioBufferPts = 0;
    int64_t currentPosAudioBufferPts = 0;

    std::atomic<bool> isDestroyed { false };
    std::atomic<bool> hasError { false };
    // 以下状态均由播放器持有，CodecUserData只保存非拥有指针。
    // 注册音频/codec回调前必须完成赋值，并保证其指向的状态晚于回调注销和工作线程退出才销毁。
    std::atomic<bool> *runningFlag = nullptr;
    std::atomic<bool> *playbackFailure = nullptr;
    // 仅音频播放借用，注册回调前绑定；Player在renderer释放和工作线程退出后销毁。
    AudioPlaybackCallbackContext *audioPlayback = nullptr;

    // 由会话持有，codec注销回调后才销毁。
    OperationFailure *failureDetails = nullptr;
    // Recorder持有；采集回调停止、音频线程退出后才结束统计生命周期。
    RecorderAudioStats *recordingAudioStats = nullptr;
    // 仅录制使用；暂停期间采集回调丢弃PCM，不向缓存追加数据。
    bool capturePaused = false;

    void SignalError()
    {
        // 此方法可由codec或AudioRenderer回调线程调用，只更新原子状态并唤醒等待线程；
        // 不在回调中执行Stop、Destroy等可能阻塞或再次触发回调的codec操作。
        hasError = true;
        if (playbackFailure != nullptr) {
            playbackFailure->store(true);
        }
        if (runningFlag != nullptr) {
            runningFlag->store(false);
        }
        inputBufferQueue.CancelWait();
        outputBufferQueue.CancelWait();
        inputCond.notify_all();
        renderCond.notify_all();
    }
    // [Start buffer_clean]
    void ClearQueue()
    {
        inputBufferQueue.Flush();
        outputBufferQueue.Flush();
    }
    // [End buffer_clean]

    // 必须在持有outputMutex时调用。播放PCM已统一为S16LE，因此可按双字节采样值计算队列时长。
    void UpdateAudioQueueDuration()
    {
        constexpr int64_t usPerSecond = 1'000'000;
        constexpr int32_t s16BytesPerSample = 2;
        if (audioPlayback == nullptr || sampleInfo == nullptr ||
            sampleInfo->audio.audioChannelCount <= 0 || sampleInfo->audio.audioSampleRate <= 0) {
            return;
        }
        const int64_t queuedFrames = static_cast<int64_t>(renderQueue.Size()) /
            sampleInfo->audio.audioChannelCount / s16BytesPerSample;
        audioPlayback->queueDurationUs.store(queuedFrames * usPerSecond / sampleInfo->audio.audioSampleRate);
    }

    // inputMutex保护；采集开始前预分配，回调写入时不扩容、不移动已有PCM。
    PcmQueue captureQueue { 0, 0 };

    void ClearCache()
    {
        captureQueue.Clear();
    }

    size_t CaptureSize() const
    {
        return captureQueue.Size();
    }

    bool WriteCache(void *buffer, int32_t bufferLen)
    {
        return bufferLen > 0 && captureQueue.Write(static_cast<const uint8_t *>(buffer), bufferLen);
    }

    bool ReadCache(void *buffer, int32_t bufferLen)
    {
        if (buffer == nullptr || bufferLen <= 0 || captureQueue.Size() < static_cast<size_t>(bufferLen)) {
            return false;
        }
        return captureQueue.Read(static_cast<uint8_t *>(buffer), bufferLen) == static_cast<size_t>(bufferLen);
    }
};

#endif // AVCODEC_SAMPLE_CODEC_USER_DATA_H
