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

#include "oh_audio_capturer.h"
#include <hilog/log.h>
#include <cstdint>
#include <unistd.h>
#include <cmath>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_AUDIO_CAPTURER"

static void OnAudioInterruptEvent(OH_AudioCapturer *audioCapturer, [[maybe_unused]] void *userData,
    OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    OHAudioCapturer::GetInstance().capturerInterruptCallback(
        OHAudioCapturer::GetInstance().capturerInterruptCallbackContext, type, hint);
}

static void OnAudioErrorEvent([[maybe_unused]] OH_AudioCapturer *audioCapturer, [[maybe_unused]] void *userData,
    OH_AudioStream_Result error)
{
    OH_LOG_ERROR(LOG_APP, "Audio capture error, ret: %{public}d", error);
}

static void OnAudioReadData([[maybe_unused]] OH_AudioCapturer* capturer, void* userData,
    void* audioData, int32_t audioDataSize)
{
    auto audioFileOprInfo = reinterpret_cast<CapturerFileOprInfo *>(userData);
    auto writeSize = write(audioFileOprInfo->recordingFd, audioData, audioDataSize);
    if (writeSize < 0) {
        OH_LOG_ERROR(LOG_APP, "Write audio data error.");
        return;
    }
    audioFileOprInfo->recordingCurrentOffset += writeSize;
}

void OHAudioCapturer::Init()
{
    if ((audioCapturer_ != nullptr) || (capturerBuilder_ != nullptr) || (audioFileOprInfo_ != nullptr)) {
        OH_LOG_INFO(LOG_APP, "Previous audio capturer or builder or fileInfo remained and release it.");
        Release();
    }
    
    audioFileOprInfo_ = new CapturerFileOprInfo();
    // create builder
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&capturerBuilder_, type);
    // set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(capturerBuilder_, samplingRate_);
    OH_AudioStreamBuilder_SetChannelCount(capturerBuilder_, channelCount_);
    OH_AudioStreamBuilder_SetSampleFormat(capturerBuilder_, sampleFormat_);
    if (isLowLatencyMode_) {
        OH_AudioStreamBuilder_SetLatencyMode(capturerBuilder_, AUDIOSTREAM_LATENCY_MODE_FAST);
    } else {
        OH_AudioStreamBuilder_SetLatencyMode(capturerBuilder_, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    }
    OH_AudioStreamBuilder_SetCapturerInfo(capturerBuilder_, sourceType_);
    
    // set mute when interrupted
    OH_AudioStreamBuilder_SetCapturerWillMuteWhenInterrupted(capturerBuilder_, true);
    
    (void)OH_AudioStreamBuilder_SetCapturerErrorCallback(capturerBuilder_, OnAudioErrorEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetCapturerInterruptCallback(capturerBuilder_, OnAudioInterruptEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetCapturerReadDataCallback(capturerBuilder_, OnAudioReadData,
                                                            reinterpret_cast<void *>(audioFileOprInfo_));
    // create OH_AudioCapturer
    OH_AudioStreamBuilder_GenerateCapturer(capturerBuilder_, &audioCapturer_);
    return;
}

void OHAudioCapturer::Start()
{
    if (audioCapturer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioCapturer_ is null.");
        return;
    }

    auto ret = OH_AudioCapturer_Start(audioCapturer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Record failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Record successfully.");
}

void OHAudioCapturer::Pause()
{
    if (audioCapturer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioCapturer_ is null.");
        return;
    }

    auto ret = OH_AudioCapturer_Pause(audioCapturer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Pause record failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Pause record successfully.");
}

void OHAudioCapturer::Stop()
{
    if (audioCapturer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioCapturer_ is null.");
        return;
    }

    auto ret = OH_AudioCapturer_Stop(audioCapturer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Stop record failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Stop recording successfully.");
}

void OHAudioCapturer::Release()
{
    if (capturerBuilder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(capturerBuilder_);
        capturerBuilder_ = nullptr;
    }
    if (audioCapturer_ != nullptr) {
        OH_AudioCapturer_Release(audioCapturer_);
        audioCapturer_ = nullptr;
    }
    if (audioFileOprInfo_ != nullptr) {
        delete audioFileOprInfo_;
        audioFileOprInfo_ = nullptr;
    }
    OH_LOG_INFO(LOG_APP, "Release capturer successfully.");
}

void OHAudioCapturer::LoadRecordingInfo(uint32_t recordingFd)
{
    if (audioFileOprInfo_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioFileOprInfo is null.");
        return;
    }
    audioFileOprInfo_->recordingFd = recordingFd;
    audioFileOprInfo_->recordingCurrentOffset = 0;
    OH_LOG_INFO(LOG_APP,
                "OHAudioCapturer Load recording information successfully. "
                "recording fd: %{private}d",
                recordingFd);
}

void OHAudioCapturer::SetCapturerParams(uint32_t sourceType, uint32_t samplingRate,
    uint32_t channelCount, uint32_t sampleFormat, bool isLowLatencyMode)
{
    sourceType_ = static_cast<OH_AudioStream_SourceType>(sourceType);
    samplingRate_ = samplingRate;
    channelCount_ = channelCount;
    sampleFormat_ = static_cast<OH_AudioStream_SampleFormat>(sampleFormat);
    isLowLatencyMode_ = isLowLatencyMode;
    OH_LOG_INFO(LOG_APP,
        "Set capturer params: samplingRate_: %{public}d, channelCount_: %{public}d, isLowLatencyMode_: %{public}d",
        samplingRate_, channelCount_, isLowLatencyMode_);
}