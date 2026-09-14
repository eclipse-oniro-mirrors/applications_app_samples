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

#include "oh_audio_playing.h"
#include <cstdint>
#include <hilog/log.h>
#include <node_api.h>
#include <unistd.h>
#include <cmath>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_AUDIO_PLAYING"
static const uint32_t SAMPLE_RATE = 16000;
static const uint32_t CHANNEL_COUNT = 2;
static const uint32_t BITS_PER_SAMPLE = 16;
static const uint32_t BITS_PER_BYTE = 8;

// Customize the audio interrupt event function
static void OnAudioInterruptEvent(OH_AudioRenderer *audioRenderer, [[maybe_unused]] void *userData,
                                  OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    if ((type == AUDIOSTREAM_INTERRUPT_SHARE) && (hint == AUDIOSTREAM_INTERRUPT_HINT_RESUME)) {
        OH_LOG_INFO(LOG_APP, "PlayState is play.");
        OHAudioPlayer::GetInstance().PlayStatusCallback(OHAudioPlayer::GetInstance().playStatusCallbackContext,
                                                        PlayStatus::PLAY);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_PAUSE || hint == AUDIOSTREAM_INTERRUPT_HINT_STOP) {
        OH_LOG_INFO(LOG_APP, "PlayState is pause.");
        OHAudioPlayer::GetInstance().PlayStatusCallback(OHAudioPlayer::GetInstance().playStatusCallbackContext,
                                                        PlayStatus::PAUSE);
    }
}

// Custom exception callback functions
static void OnAudioErrorEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer, [[maybe_unused]] void *userData,
                              OH_AudioStream_Result error)
{
    OH_LOG_ERROR(LOG_APP, "Audio render error, ret: %{public}d", error);
}

// [Start OnAudioRendererWriteDataEvent]
// Custom data write function
static OH_AudioData_Callback_Result OnAudioRendererWriteDataEvent([[maybe_unused]] OH_AudioRenderer *audioRenderer,
                                                                  void *userData,
                                                                  void *audioData,
                                                                  int32_t audioDataSize)
{
    auto audioFileOprInfo = reinterpret_cast<AudioFileOprInfo *>(userData);

    // 计算剩余待读取字节数
    int64_t remaining = audioFileOprInfo->pcmFileSize - audioFileOprInfo->pcmCurrentOffset;

    // 文件已读完，处理循环或结束
    if (remaining <= 0) {
        if (audioFileOprInfo->isNeedLoop) {
            // 重置文件指针和偏移，从头开始
            if (lseek(audioFileOprInfo->pcmFd, 0, SEEK_SET) == -1) {
                OH_LOG_ERROR(LOG_APP, "lseek failed on loop");
                return AUDIO_DATA_CALLBACK_RESULT_INVALID;
            }
            audioFileOprInfo->pcmCurrentOffset = 0;
            remaining = audioFileOprInfo->pcmFileSize;
        } else {
            OH_LOG_INFO(LOG_APP, "Playback finished, no loop.");
            return AUDIO_DATA_CALLBACK_RESULT_INVALID;
        }
    }

    // 计算本次实际要读取的字节数（不超过缓冲区大小和剩余字节）
    int32_t bytesToRead = (remaining < audioDataSize) ? static_cast<int32_t>(remaining) : audioDataSize;
    ssize_t bytesRead = read(audioFileOprInfo->pcmFd, audioData, bytesToRead);
    if (bytesRead < 0) {
        OH_LOG_ERROR(LOG_APP, "read error: %{public}s");
        return AUDIO_DATA_CALLBACK_RESULT_INVALID;
    }

    // 更新已读偏移量
    audioFileOprInfo->pcmCurrentOffset += bytesRead;

    // 关键：若未填满缓冲区，剩余部分必须清零，否则会有杂音
    if (bytesRead < audioDataSize) {
        errno_t ret = memset_s(static_cast<uint8_t*>(audioData) + bytesRead,
                               audioDataSize - bytesRead,
                               0,
                               audioDataSize - bytesRead);
        if (ret != 0) {
            OH_LOG_ERROR(LOG_APP, "memset_s failed, ret: %{public}d", ret);
            return AUDIO_DATA_CALLBACK_RESULT_INVALID;
        }
    }

    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}
// [End OnAudioRendererWriteDataEvent]

// [Start GetAudioFileOffset]
// Get audio file offset value by seek timeStamp
static uint32_t GetAudioFileOffset(uint32_t songDuration, float targetTimeStamp, uint32_t fileSize)
{
    uint32_t fileOffset = 0;
    if (songDuration != 0) {
        fileOffset = floor((targetTimeStamp / songDuration) * fileSize);
    } else {
        fileOffset = 0;
    }
    uint32_t frameOffset = fileOffset - fileOffset % OHAudioPlayer::GetInstance().secondBufferWalk;
    OH_LOG_INFO(LOG_APP,
                "file offset: %{public}d,"
                "frame offset: %{public}d",
                fileOffset, frameOffset);
    return frameOffset;
}
// [End GetAudioFileOffset]

// [Start InitPlayer]
void OHAudioPlayer::InitPlayer()
{
    // Check the residual status of the previous player
    if ((audioRenderer != nullptr) || (rendererBuilder != nullptr) || (audioFileOprInfo != nullptr)) {
        OH_LOG_INFO(LOG_APP, "Previous audio player or builder or fileInfo remained and release it.");
        ReleasePlayer();
    }

    // Create stream builder
    OH_AudioStream_Type streamType = AUDIOSTREAM_TYPE_RENDERER;
    auto ret = OH_AudioStreamBuilder_Create(&rendererBuilder, streamType);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Create stream builder failed, ret: %{public}d", ret);
        return;
    }

    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Set latencyMode failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Set latencyMode success, ret: %{public}d", ret);

    // New audioFileOprInfo instance
    audioFileOprInfo = new AudioFileOprInfo();

    // [Start SecondBufferWalk]
    // Configure audio parameters
    // Set audio sample rate
    (void)OH_AudioStreamBuilder_SetSamplingRate(rendererBuilder, SAMPLE_RATE);
    // Set audio channel count
    (void)OH_AudioStreamBuilder_SetChannelCount(rendererBuilder, 1);
    // Set audio sample format
    (void)OH_AudioStreamBuilder_SetSampleFormat(rendererBuilder, AUDIOSTREAM_SAMPLE_S16LE);
    // [StartExclude SecondBufferWalk]
    // Set audio encode type
    (void)OH_AudioStreamBuilder_SetEncodingType(rendererBuilder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    // Set audio render info
    (void)OH_AudioStreamBuilder_SetRendererInfo(rendererBuilder, AUDIOSTREAM_USAGE_NAVIGATION);
    // [EndExclude SecondBufferWalk]
    secondBufferWalk = (SAMPLE_RATE * CHANNEL_COUNT * BITS_PER_SAMPLE) / BITS_PER_BYTE;
    // [End SecondBufferWalk]
    // Configure audio callback
    // Set audio interrupt callback
    (void)OH_AudioStreamBuilder_SetRendererInterruptCallback(rendererBuilder, OnAudioInterruptEvent, nullptr);
    // Set audio render error callback
    (void)OH_AudioStreamBuilder_SetRendererErrorCallback(rendererBuilder, OnAudioErrorEvent, nullptr);
    // Set audio render write data callback
    (void)OH_AudioStreamBuilder_SetRendererWriteDataCallback(rendererBuilder, OnAudioRendererWriteDataEvent,
                                                             reinterpret_cast<void *>(audioFileOprInfo));

    ret = OH_AudioStreamBuilder_GenerateRenderer(rendererBuilder, &audioRenderer);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Create audio renderer failed, ret: %{public}d", ret);
        ReleasePlayer();
    }
    OH_LOG_INFO(LOG_APP, "Init player successfully.");
}
// [End InitPlayer]

// [Start LoadSongInfo]
void OHAudioPlayer::LoadPcmInfo(uint32_t pcmFd, uint32_t pcmFileSize, uint32_t pcmDuration, uint32_t pcmFileOffset)
{
    if (audioFileOprInfo == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioFileOprInfo is null.");
        return;
    }

    audioFileOprInfo->pcmFd = pcmFd;
    audioFileOprInfo->pcmFileSize = pcmFileSize;
    audioFileOprInfo->pcmDuration = pcmDuration;
    audioFileOprInfo->pcmFileOffset = pcmFileOffset;
    audioFileOprInfo->pcmCurrentOffset = 0;
    (void)lseek(audioFileOprInfo->pcmFd, pcmFileOffset, SEEK_SET);

    OH_LOG_INFO(LOG_APP,
                "Load song information successfully. "
                "Song fd: %{public}d, "
                "file size: %{public}d, "
                "Song duration: %{public}d."
                "file offset: %{public}d.",
                pcmFd, pcmFileSize, pcmDuration, pcmFileOffset);
}
// [End LoadSongInfo]

// [Start PlaySong]
void OHAudioPlayer::PlayPcm()
{
    if (audioRenderer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Start(audioRenderer);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Play song failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Play song successfully.");
}
// [End PlaySong]

// [Start PauseSong]
void OHAudioPlayer::PausePcm()
{
    if (audioRenderer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Pause(audioRenderer);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Pause song failed, ret: %{public}d", ret);
        return;
    }

    OH_LOG_INFO(LOG_APP, "Pause song successfully.");
}
// [End PauseSong]

// [Start StopSong]
void OHAudioPlayer::StopPcm()
{
    if (audioRenderer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The audioRenderer is null.");
        return;
    }

    auto ret = OH_AudioRenderer_Stop(audioRenderer);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Stop song failed, ret: %{public}d", ret);
        return;
    }
    ret = OH_AudioRenderer_Flush(audioRenderer);
    if (ret != AUDIOSTREAM_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Flush song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Stop song successfully.");
}
// [End StopSong]


// [Start ReleasePlayer]
void OHAudioPlayer::ReleasePlayer()
{
    if (rendererBuilder != nullptr) {
        OH_AudioStreamBuilder_Destroy(rendererBuilder);
        rendererBuilder = nullptr;
    }

    if (audioRenderer != nullptr) {
        OH_AudioRenderer_Release(audioRenderer);
        audioRenderer = nullptr;
    }

    if (audioFileOprInfo != nullptr) {
        delete audioFileOprInfo;
        audioFileOprInfo = nullptr;
    }

    OH_LOG_INFO(LOG_APP, "Release player successfully.");
}
// [End ReleasePlayer]
