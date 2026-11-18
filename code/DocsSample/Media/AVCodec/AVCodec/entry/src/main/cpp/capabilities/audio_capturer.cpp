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
#include "dfx/error/av_codec_sample_error.h"
#include "sample/recorder/diagnostics/RecorderAudioStats.h"

#undef LOG_TAG
#define LOG_TAG "AudioCapturer"

AudioCapturer::~AudioCapturer()
{
    AudioCapturerRelease();
}

static int32_t AudioCapturerOnReadData(OH_AudioCapturer *capturer, void *userData, void *buffer, int32_t bufferLen)
{
    (void)capturer;
    // 回调由音频服务线程触发。只在锁保护下把本次数据复制到缓存，不保存服务提供的buffer地址。
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    if (codecUserData == nullptr || codecUserData->isDestroyed.load()) {
        return 0;
    }
    if (buffer == nullptr || bufferLen <= 0) {
        AVCODEC_SAMPLE_LOGW("Invalid audio capture callback buffer");
        return 0;
    }
    std::unique_lock<std::mutex> lock(codecUserData->inputMutex);
    if (codecUserData->capturePaused) {
        return 0;
    }
    codecUserData->WriteCache(buffer, bufferLen);
    if (codecUserData->recordingAudioStats != nullptr) {
        codecUserData->recordingAudioStats->Capture(bufferLen, codecUserData->remainlen);
    }
    codecUserData->inputCond.notify_all();
    return 0;
}

int32_t AudioCapturer::AudioCapturerInit(const SampleInfo &sampleInfo, CodecUserData *audioEncContext)
{
    // 重复初始化时先释放旧实例，旧回调不再写入新的录制缓存。
    AudioCapturerRelease();

    const int32_t createRet = OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_CAPTURER);
    if (createRet != AUDIOSTREAM_SUCCESS || builder_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create audio capturer builder failed, ret: %{public}d", createRet);
        AudioCapturerRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const auto latencyMode = sampleInfo.audio.audioLatencyMode == AUDIOSTREAM_LATENCY_MODE_FAST ?
        AUDIOSTREAM_LATENCY_MODE_FAST : AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioCapturer_Callbacks callbacks {};
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    // 回调上下文audioEncContext在停止采集和释放Capturer前必须一直有效。
    const bool configured =
        OH_AudioStreamBuilder_SetSamplingRate(builder_, sampleInfo.audio.audioSampleRate) == AUDIOSTREAM_SUCCESS &&
        OH_AudioStreamBuilder_SetChannelCount(builder_, sampleInfo.audio.audioChannelCount) == AUDIOSTREAM_SUCCESS &&
        OH_AudioStreamBuilder_SetSampleFormat(builder_, AUDIOSTREAM_SAMPLE_S16LE) == AUDIOSTREAM_SUCCESS &&
        OH_AudioStreamBuilder_SetLatencyMode(builder_, latencyMode) == AUDIOSTREAM_SUCCESS &&
        OH_AudioStreamBuilder_SetEncodingType(builder_, AUDIOSTREAM_ENCODING_TYPE_RAW) == AUDIOSTREAM_SUCCESS &&
        OH_AudioStreamBuilder_SetCapturerCallback(builder_, callbacks, audioEncContext) == AUDIOSTREAM_SUCCESS;
    if (!configured) {
        AVCODEC_SAMPLE_LOGE("Configure audio capturer builder failed");
        AudioCapturerRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t generateRet = OH_AudioStreamBuilder_GenerateCapturer(builder_, &audioCapturer_);
    if (generateRet != AUDIOSTREAM_SUCCESS || audioCapturer_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Generate audio capturer failed, ret: %{public}d", generateRet);
        AudioCapturerRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

bool AudioCapturer::AudioCapturerStart()
{
    return audioCapturer_ != nullptr && OH_AudioCapturer_Start(audioCapturer_) == AUDIOSTREAM_SUCCESS;
}

void AudioCapturer::AudioCapturerRelease()
{
    if (audioCapturer_ != nullptr) {
        // 先停止并释放Capturer，确认不再派发读数据回调后再销毁Builder。
        OH_AudioCapturer_Stop(audioCapturer_);
        OH_AudioCapturer_Release(audioCapturer_);
        audioCapturer_ = nullptr;
    }
    if (builder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
    }
}
