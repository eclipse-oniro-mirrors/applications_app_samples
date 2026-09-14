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

#include "oh_audio_renderer.h"
#include <cstdint>
#include <hilog/log.h>
#include <unistd.h>
#include <cmath>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_AUDIO_RENDERER"

// Customize the audio interrupt event function
static void OnAudioInterruptEvent(OH_AudioRenderer *audioRenderer, [[maybe_unused]] void *userData,
    OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    OHAudioRenderer::GetInstance().rendererInterruptCallback(
        OHAudioRenderer::GetInstance().rendererInterruptCallbackContext, type, hint);
}

// Custom exception callback functions
static void OnAudioErrorEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer, [[maybe_unused]] void *userData,
    OH_AudioStream_Result error)
{
    OH_LOG_ERROR(LOG_APP, "Audio render error, ret: %{public}d", error);
}

static OH_AudioData_Callback_Result OnAudioRendererWriteDataEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
    void *userData, void *audioData, int32_t audioDataSize)
{
    auto audioFileOprInfo = reinterpret_cast<RendererFileOprInfo *>(userData);
    auto readSize = read(audioFileOprInfo->recordingFd, audioData, audioDataSize);
    audioFileOprInfo->recordingCurrentOffset += audioDataSize;
    if (audioFileOprInfo->recordingCurrentOffset >= audioFileOprInfo->recordingFileSize) {
        audioFileOprInfo->recordingCurrentOffset = audioFileOprInfo->recordingFileSize;
    }
    if ((readSize < 0) || (readSize > audioDataSize)) {
        OH_LOG_ERROR(LOG_APP, "Read audio data error.");
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }
    if (readSize == 0) {
        OH_LOG_INFO(LOG_APP, "Read audio file end.");
        audioFileOprInfo->isReadEnd = true;
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }

    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static uint32_t GetAudioCurrentTime(uint32_t recordingDuration, float currentOffset, uint32_t fileSize)
{
    if (fileSize == 0) {
        return 0;
    }
    uint32_t currentTime = floor((currentOffset / fileSize) * recordingDuration);
    OH_LOG_INFO(LOG_APP,
                "Get audio current time successfully. "
                "recording duration: %{public}d, "
                "currentOffset: %{public}d, "
                "file size: %{public}d, "
                "current time : %{public}d",
                recordingDuration, currentOffset, fileSize, currentTime);
    return currentTime;
}

void OHAudioRenderer::InitRenderer()
{
    if ((audioRenderer_ != nullptr) || (rendererBuilder_ != nullptr) || (audioFileOprInfo_ != nullptr)) {
        Release();
    }
    
    audioFileOprInfo_ = new RendererFileOprInfo();
    // create builder
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&rendererBuilder_, type);
    // set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(rendererBuilder_, samplingRate_);
    OH_AudioStreamBuilder_SetChannelCount(rendererBuilder_, channelCount_);
    OH_AudioStreamBuilder_SetSampleFormat(rendererBuilder_, sampleFormat_);
    if (isLowLatencyMode_) {
        OH_AudioStreamBuilder_SetLatencyMode(rendererBuilder_, AUDIOSTREAM_LATENCY_MODE_FAST);
    } else {
        OH_AudioStreamBuilder_SetLatencyMode(rendererBuilder_, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    }

    (void)OH_AudioStreamBuilder_SetRendererErrorCallback(rendererBuilder_, OnAudioErrorEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererInterruptCallback(rendererBuilder_, OnAudioInterruptEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererWriteDataCallback(rendererBuilder_, OnAudioRendererWriteDataEvent,
                                                             reinterpret_cast<void *>(audioFileOprInfo_));
    // create OH_AudioRenderer
    OH_AudioStreamBuilder_GenerateRenderer(rendererBuilder_, &audioRenderer_);
    return;
}

void OHAudioRenderer::Start()
{
    if (audioRenderer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer_ is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Start(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Play recording failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Play recording successfully.");
}

void OHAudioRenderer::Pause()
{
    if (audioRenderer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer_ is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Pause(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Pause recording failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Pause recording successfully.");
}

void OHAudioRenderer::Stop()
{
    if (audioRenderer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer_ is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Stop(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Stop song failed, ret: %{public}d", ret);
        return;
    }
    ret = OH_AudioRenderer_Flush(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Flush song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Stop recording successfully.");
}

int32_t OHAudioRenderer::GetProgress()
{
    if (audioRenderer_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer_ is null.");
        return 0;
    }
    OH_LOG_INFO(LOG_APP, "Progress is %{public}d", audioFileOprInfo_->recordingCurrentOffset);
    auto progress = GetAudioCurrentTime(audioFileOprInfo_->recordingDuration, audioFileOprInfo_->recordingCurrentOffset,
                                        audioFileOprInfo_->recordingFileSize);
    return progress;
}

void OHAudioRenderer::Release()
{
    if (rendererBuilder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(rendererBuilder_);
        rendererBuilder_ = nullptr;
    }
    if (audioRenderer_ != nullptr) {
        OH_AudioRenderer_Release(audioRenderer_);
        audioRenderer_ = nullptr;
    }
    if (audioFileOprInfo_ != nullptr) {
        delete audioFileOprInfo_;
        audioFileOprInfo_ = nullptr;
    }
    OH_LOG_INFO(LOG_APP, "Release renderer successfully.");
}

void OHAudioRenderer::LoadRecordingInfo(uint32_t recordingFd, uint32_t recordingFileSize,
    uint32_t recordingDuration, uint32_t recordingFileOffset)
{
    if (audioFileOprInfo_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioFileOprInfo is null.");
        return;
    }

    audioFileOprInfo_->recordingFd = recordingFd;
    audioFileOprInfo_->recordingFileSize = recordingFileSize;
    audioFileOprInfo_->recordingDuration = recordingDuration;
    audioFileOprInfo_->recordingFileOffset = recordingFileOffset;
    audioFileOprInfo_->recordingCurrentOffset = 0;
    (void)lseek(audioFileOprInfo_->recordingFd, recordingFileOffset, SEEK_SET);

    OH_LOG_INFO(LOG_APP,
                "OHAudioRenderer Load recording information successfully. "
                "recording fd: %{private}d, "
                "file size: %{public}d, "
                "recording duration: %{public}d. "
                "file offset: %{public}d.",
                recordingFd, recordingFileSize, recordingDuration, recordingFileOffset);
}

void OHAudioRenderer::SetLowLatencyMode(bool latencyMode)
{
    isLowLatencyMode_ = latencyMode;
    OH_LOG_INFO(LOG_APP, "Set LowLatency mode: %{public}d", latencyMode);
}

void OHAudioRenderer::SetRendererParams(uint32_t samplingRate, uint32_t channelCount,
    uint32_t sampleFormat, bool isLowLatencyMode)
{
    samplingRate_ = samplingRate;
    channelCount_ = channelCount;
    sampleFormat_ = static_cast<OH_AudioStream_SampleFormat>(sampleFormat);
    isLowLatencyMode_ = isLowLatencyMode;
    OH_LOG_INFO(LOG_APP,
        "Set renderer params: samplingRate_: %{public}d, channelCount_: %{public}d, isLowLatencyMode_: %{public}d",
        samplingRate_, channelCount_, isLowLatencyMode_);
}

