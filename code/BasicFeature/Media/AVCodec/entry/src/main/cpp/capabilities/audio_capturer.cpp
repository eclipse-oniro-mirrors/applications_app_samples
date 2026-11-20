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

#include "audio_capturer.h"
#include "sample_callback.h"
#include "av_codec_sample_log.h"


AudioCapturer::~AudioCapturer()
{
    AudioCapturerRelease();
}

static int32_t AudioCapturerOnReadData(OH_AudioCapturer *capturer, void *userData, void *buffer, int32_t bufferLen)
{
    (void)capturer;
    // 回调由音频服务线程触发。只在锁保护下把本次数据复制到缓存，不保存服务提供的 buffer 地址。
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    if (codecUserData == nullptr || codecUserData->isDestroyed.load()) {
        return 0;
    }
    if (buffer == nullptr || bufferLen <= 0) {
        AVCODEC_SAMPLE_LOGW("Invalid audio capture callback buffer");
        return 0;
    }
    std::unique_lock<std::mutex> lock(codecUserData->inputMutex);
    codecUserData->WriteCache(buffer, bufferLen);
    codecUserData->inputCond.notify_all();
    return 0;
}

void AudioCapturer::AudioCapturerInit(SampleInfo &sampleInfo, CodecUserData *audioEncContext)
{
    // 重复初始化时先释放旧实例，旧回调不再写入新的录制缓存。
    AudioCapturerRelease();

    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder_, type);
    OH_AudioStreamBuilder_SetSamplingRate(builder_, sampleInfo.audio.audioSampleRate);
    OH_AudioStreamBuilder_SetChannelCount(builder_, sampleInfo.audio.audioChannelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder_, AUDIOSTREAM_SAMPLE_S16LE);
    const auto latencyMode = sampleInfo.audio.audioLatencyMode == AUDIOSTREAM_LATENCY_MODE_FAST ?
        AUDIOSTREAM_LATENCY_MODE_FAST : AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioStreamBuilder_SetLatencyMode(builder_, latencyMode);
    OH_AudioStreamBuilder_SetEncodingType(builder_, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    // 回调上下文 audioEncContext 在停止采集和释放 Capturer 前必须一直有效。
    OH_AudioStreamBuilder_SetCapturerCallback(builder_, callbacks, audioEncContext);
    OH_AudioStreamBuilder_GenerateCapturer(builder_, &audioCapturer_);
}

void AudioCapturer::AudioCapturerStart()
{
    if (audioCapturer_ != nullptr) {
        OH_AudioCapturer_Start(audioCapturer_);
    }
}

void AudioCapturer::AudioCapturerRelease()
{
    if (audioCapturer_ != nullptr) {
        // 先停止并释放 Capturer，确认不再派发读数据回调后再销毁 Builder。
        OH_AudioCapturer_Stop(audioCapturer_);
        OH_AudioCapturer_Release(audioCapturer_);
        audioCapturer_ = nullptr;
    }
    if (builder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
    }
}
