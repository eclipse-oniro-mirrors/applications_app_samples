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
#include "oh_audio_nav_renderer.h"
#include <hilog/log.h>
#include <cstdint>
#include <unistd.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_NAV_RENDERER"

#define STREAM_USAGE_NAVIGATION AUDIOSTREAM_USAGE_NAVIGATION

static void OnNavInterruptEvent(OH_AudioRenderer *audioRenderer,
    [[maybe_unused]] void *userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    OHAudioNavRenderer::GetInstance().rendererInterruptCallback(
        OHAudioNavRenderer::GetInstance().rendererInterruptCallbackContext, type, hint);
}

static void OnNavErrorEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
    [[maybe_unused]] void *userData,
    OH_AudioStream_Result error)
{
    OH_LOG_ERROR(LOG_APP, "Nav renderer error, ret: %{public}d", error);
}

static OH_AudioData_Callback_Result OnNavWriteDataEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
    void *userData,
    void *audioData,
    int32_t audioDataSize)
{
    auto audioFileOprInfo = reinterpret_cast<NavFileOprInfo *>(userData);
    auto readSize = read(audioFileOprInfo->recordingFd, audioData, audioDataSize);
    audioFileOprInfo->recordingCurrentOffset += audioDataSize;
    if (audioFileOprInfo->recordingCurrentOffset >= audioFileOprInfo->recordingFileSize) {
        audioFileOprInfo->recordingCurrentOffset = audioFileOprInfo->recordingFileSize;
    }
    if ((readSize < 0) || (readSize > audioDataSize)) {
        OH_LOG_ERROR(LOG_APP, "Read nav data error.");
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }
    if (readSize == 0) {
        OH_LOG_INFO(LOG_APP, "Read nav file end.");
        audioFileOprInfo->isReadEnd = true;
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

int32_t NavSessionDeactivatedCallback(OH_AudioSession_DeactivatedEvent event)
{
    switch (event.reason) {
        case DEACTIVATED_LOWER_PRIORITY:
            OH_LOG_INFO(LOG_APP, "Nav AudioSession deactivated: focus lost.");
            return 0;
        case DEACTIVATED_TIMEOUT:
            OH_LOG_INFO(LOG_APP, "Nav AudioSession deactivated: timeout.");
            return 0;
    }
    return 0;
}

void OHAudioNavRenderer::InitRenderer()
{
    if ((audioRenderer_ != nullptr) || (rendererBuilder_ != nullptr) ||
        (audioFileOprInfo_ != nullptr)) {
        Release();
    }

    audioFileOprInfo_ = new NavFileOprInfo();
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&rendererBuilder_, type);

    OH_AudioStreamBuilder_SetSamplingRate(rendererBuilder_, samplingRate_);
    OH_AudioStreamBuilder_SetChannelCount(rendererBuilder_, channelCount_);
    OH_AudioStreamBuilder_SetSampleFormat(rendererBuilder_, sampleFormat_);
    if (isLowLatencyMode_) {
        OH_AudioStreamBuilder_SetLatencyMode(rendererBuilder_, AUDIOSTREAM_LATENCY_MODE_FAST);
    } else {
        OH_AudioStreamBuilder_SetLatencyMode(rendererBuilder_, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    }

    OH_AudioStreamBuilder_SetRendererInfo(rendererBuilder_, STREAM_USAGE_NAVIGATION);

    // INDEPENDENT_MODE: same-app streams trigger focus strategy independently
    OH_AudioStreamBuilder_SetRendererInterruptMode(rendererBuilder_,
        AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);

    (void)OH_AudioStreamBuilder_SetRendererErrorCallback(rendererBuilder_, OnNavErrorEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererInterruptCallback(rendererBuilder_, OnNavInterruptEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererWriteDataCallback(
        rendererBuilder_, OnNavWriteDataEvent,
        reinterpret_cast<void *>(audioFileOprInfo_));

    OH_AudioStreamBuilder_GenerateRenderer(rendererBuilder_, &audioRenderer_);
}

void OHAudioNavRenderer::InitRendererWithDuckSession()
{
    if ((audioRenderer_ != nullptr) || (rendererBuilder_ != nullptr) ||
        (audioFileOprInfo_ != nullptr)) {
        Release();
    }

    // 1. Get AudioSessionManager
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager_);
    if (static_cast<int32_t>(resultManager) != 0) {
        OH_LOG_ERROR(LOG_APP, "Get AudioSessionManager failed, ret: %{public}d", resultManager);
        return;
    }

    // 2. Set scene (must be before activation)
    OH_AudioSessionManager_SetScene(audioSessionManager_, AUDIO_SESSION_SCENE_MEDIA);

    // 3. Activate AudioSession with CONCURRENCY_DUCK_OTHERS strategy (must be before audio stream start)
    OH_AudioSession_Strategy strategy = {CONCURRENCY_DUCK_OTHERS};
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(
        audioSessionManager_, &strategy);
    if (static_cast<int32_t>(resultActivate) != 0) {
        OH_LOG_ERROR(LOG_APP, "Activate AudioSession failed, ret: %{public}d", resultActivate);
        return;
    }
    isDuckSessionActive_ = true;

    // 4. Register deactivated callback
    OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
        audioSessionManager_, NavSessionDeactivatedCallback);

    // 5. Create renderer (same as InitRenderer)
    audioFileOprInfo_ = new NavFileOprInfo();
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&rendererBuilder_, type);
    OH_AudioStreamBuilder_SetSamplingRate(rendererBuilder_, samplingRate_);
    OH_AudioStreamBuilder_SetChannelCount(rendererBuilder_, channelCount_);
    OH_AudioStreamBuilder_SetSampleFormat(rendererBuilder_, sampleFormat_);
    OH_AudioStreamBuilder_SetRendererInfo(rendererBuilder_, STREAM_USAGE_NAVIGATION);
    OH_AudioStreamBuilder_SetRendererInterruptMode(rendererBuilder_,
        AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);
    (void)OH_AudioStreamBuilder_SetRendererErrorCallback(rendererBuilder_, OnNavErrorEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererInterruptCallback(rendererBuilder_, OnNavInterruptEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererWriteDataCallback(
        rendererBuilder_, OnNavWriteDataEvent,
        reinterpret_cast<void *>(audioFileOprInfo_));
    OH_AudioStreamBuilder_GenerateRenderer(rendererBuilder_, &audioRenderer_);
    OH_LOG_INFO(LOG_APP, "Nav renderer with DUCK session initialized.");
}

void OHAudioNavRenderer::Start()
{
    if (audioRenderer_ == nullptr) { return; }
    auto ret = OH_AudioRenderer_Start(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Nav start failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Nav start successfully.");
}

void OHAudioNavRenderer::Stop()
{
    if (audioRenderer_ == nullptr) { return; }
    auto ret = OH_AudioRenderer_Stop(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Nav stop failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Nav stop successfully.");
}

void OHAudioNavRenderer::Release()
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
    OH_LOG_INFO(LOG_APP, "Nav renderer release successfully.");
}

void OHAudioNavRenderer::FinishNavigationWithDuckSession()
{
    if (!isDuckSessionActive_) { return; }
    if (audioSessionManager_ != nullptr) {
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager_, NavSessionDeactivatedCallback);
        OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager_);
    }
    isDuckSessionActive_ = false;
    OH_LOG_INFO(LOG_APP, "Nav DUCK session deactivated.");
}

void OHAudioNavRenderer::LoadNavInfo(uint32_t recordingFd, uint32_t recordingFileSize,
    uint32_t recordingDuration, uint32_t recordingFileOffset)
{
    if (audioFileOprInfo_ == nullptr) { return; }
    audioFileOprInfo_->recordingFd = recordingFd;
    audioFileOprInfo_->recordingFileSize = recordingFileSize;
    audioFileOprInfo_->recordingDuration = recordingDuration;
    audioFileOprInfo_->recordingFileOffset = recordingFileOffset;
    audioFileOprInfo_->recordingCurrentOffset = 0;
    audioFileOprInfo_->isReadEnd = false;
    (void)lseek(audioFileOprInfo_->recordingFd, recordingFileOffset, SEEK_SET);
    OH_LOG_INFO(LOG_APP, "Nav Load info. fd: %{public}d, size: %{public}d, duration: %{public}d.",
                recordingFd, recordingFileSize, recordingDuration);
}

void OHAudioNavRenderer::ResetFileOffset()
{
    if (audioFileOprInfo_ == nullptr) { return; }
    audioFileOprInfo_->recordingCurrentOffset = 0;
    audioFileOprInfo_->isReadEnd = false;
    (void)lseek(audioFileOprInfo_->recordingFd, audioFileOprInfo_->recordingFileOffset, SEEK_SET);
    OH_LOG_INFO(LOG_APP, "Nav file offset reset.");
}

void OHAudioNavRenderer::SetRendererParams(uint32_t samplingRate, uint32_t channelCount,
    uint32_t sampleFormat, bool isLowLatencyMode)
{
    samplingRate_ = samplingRate;
    channelCount_ = channelCount;
    sampleFormat_ = static_cast<OH_AudioStream_SampleFormat>(sampleFormat);
    isLowLatencyMode_ = isLowLatencyMode;
}

int32_t OHAudioNavRenderer::GetProgress()
{
    if (audioRenderer_ == nullptr) { return 0; }
    auto progress = static_cast<int32_t>(
        (static_cast<float>(audioFileOprInfo_->recordingCurrentOffset) /
         audioFileOprInfo_->recordingFileSize) * audioFileOprInfo_->recordingDuration);
    return progress;
}
