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
#include "oh_audio_music_renderer.h"
#include <hilog/log.h>
#include <cstdint>
#include <unistd.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_MUSIC_RENDERER"

#define STREAM_USAGE_MUSIC AUDIOSTREAM_USAGE_MUSIC

static void OnMusicInterruptEvent(OH_AudioRenderer *audioRenderer,
    [[maybe_unused]] void *userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    OHAudioMusicRenderer::GetInstance().rendererInterruptCallback(
        OHAudioMusicRenderer::GetInstance().rendererInterruptCallbackContext, type, hint);
}

static void OnMusicErrorEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
    [[maybe_unused]] void *userData,
    OH_AudioStream_Result error)
{
    OH_LOG_ERROR(LOG_APP, "Music renderer error, ret: %{public}d", error);
}

static OH_AudioData_Callback_Result OnMusicWriteDataEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
    void *userData,
    void *audioData,
    int32_t audioDataSize)
{
    auto audioFileOprInfo = reinterpret_cast<MusicFileOprInfo *>(userData);
    auto readSize = read(audioFileOprInfo->recordingFd, audioData, audioDataSize);
    audioFileOprInfo->recordingCurrentOffset += audioDataSize;
    if (audioFileOprInfo->recordingCurrentOffset >= audioFileOprInfo->recordingFileSize) {
        audioFileOprInfo->recordingCurrentOffset = audioFileOprInfo->recordingFileSize;
    }
    if ((readSize < 0) || (readSize > audioDataSize)) {
        OH_LOG_ERROR(LOG_APP, "Read music data error.");
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }
    if (readSize == 0) {
        OH_LOG_INFO(LOG_APP, "Read music file end.");
        audioFileOprInfo->isReadEnd = true;
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

void OHAudioMusicRenderer::InitRenderer()
{
    if ((audioRenderer_ != nullptr) || (rendererBuilder_ != nullptr) ||
        (audioFileOprInfo_ != nullptr)) {
        Release();
    }

    audioFileOprInfo_ = new MusicFileOprInfo();
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

    OH_AudioStreamBuilder_SetRendererInfo(rendererBuilder_, STREAM_USAGE_MUSIC);

    // INDEPENDENT_MODE: same-app streams trigger focus strategy independently
    OH_AudioStreamBuilder_SetRendererInterruptMode(rendererBuilder_,
        AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);

    (void)OH_AudioStreamBuilder_SetRendererErrorCallback(rendererBuilder_, OnMusicErrorEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererInterruptCallback(rendererBuilder_, OnMusicInterruptEvent, nullptr);
    (void)OH_AudioStreamBuilder_SetRendererWriteDataCallback(
        rendererBuilder_, OnMusicWriteDataEvent,
        reinterpret_cast<void *>(audioFileOprInfo_));

    OH_AudioStreamBuilder_GenerateRenderer(rendererBuilder_, &audioRenderer_);
}

void OHAudioMusicRenderer::Start()
{
    if (audioRenderer_ == nullptr) { return; }
    auto ret = OH_AudioRenderer_Start(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Music start failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Music start successfully.");
}

void OHAudioMusicRenderer::Pause()
{
    if (audioRenderer_ == nullptr) { return; }
    auto ret = OH_AudioRenderer_Pause(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Music pause failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Music pause successfully.");
}

void OHAudioMusicRenderer::Stop()
{
    if (audioRenderer_ == nullptr) { return; }
    auto ret = OH_AudioRenderer_Stop(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Music stop failed, ret: %{public}d", ret);
        return;
    }
    ret = OH_AudioRenderer_Flush(audioRenderer_);
    OH_LOG_INFO(LOG_APP, "Music stop successfully.");
}

void OHAudioMusicRenderer::Release()
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
    OH_LOG_INFO(LOG_APP, "Music renderer release successfully.");
}

void OHAudioMusicRenderer::LoadMusicInfo(uint32_t recordingFd, uint32_t recordingFileSize,
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
    OH_LOG_INFO(LOG_APP, "Music Load info. fd: %{public}d, size: %{public}d, duration: %{public}d.",
                recordingFd, recordingFileSize, recordingDuration);
}

void OHAudioMusicRenderer::ResetFileOffset()
{
    if (audioFileOprInfo_ == nullptr) { return; }
    audioFileOprInfo_->recordingCurrentOffset = 0;
    audioFileOprInfo_->isReadEnd = false;
    (void)lseek(audioFileOprInfo_->recordingFd, audioFileOprInfo_->recordingFileOffset, SEEK_SET);
    OH_LOG_INFO(LOG_APP, "Music file offset reset.");
}

void OHAudioMusicRenderer::SetRendererParams(uint32_t samplingRate, uint32_t channelCount,
    uint32_t sampleFormat, bool isLowLatencyMode)
{
    samplingRate_ = samplingRate;
    channelCount_ = channelCount;
    sampleFormat_ = static_cast<OH_AudioStream_SampleFormat>(sampleFormat);
    isLowLatencyMode_ = isLowLatencyMode;
}

int32_t OHAudioMusicRenderer::GetProgress()
{
    if (audioRenderer_ == nullptr) { return 0; }
    auto progress = static_cast<int32_t>(
        (static_cast<float>(audioFileOprInfo_->recordingCurrentOffset) /
         audioFileOprInfo_->recordingFileSize) * audioFileOprInfo_->recordingDuration);
    return progress;
}
