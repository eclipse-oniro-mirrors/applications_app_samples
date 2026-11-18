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
#ifndef OH_AUDIO_MUSIC_RENDERER_H
#define OH_AUDIO_MUSIC_RENDERER_H

#include <cstdint>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostreambuilder.h>

struct MusicFileOprInfo {
    int32_t recordingFd = 0;
    int32_t recordingFileSize = 0;
    int32_t recordingDuration = 0;
    int32_t recordingFileOffset = 0;
    int32_t recordingCurrentOffset = 0;
    bool isReadEnd = false;
};

constexpr uint32_t DEFAULT_MUSIC_SAMPLING_RATE = 44100;
constexpr uint32_t DEFAULT_MUSIC_CHANNEL_COUNT = 2;

class OHAudioMusicRenderer {
public:
    static OHAudioMusicRenderer &GetInstance()
    {
        static OHAudioMusicRenderer instance;
        return instance;
    }

    void InitRenderer();
    void Start();
    void Pause();
    void Stop();
    void Release();
    void LoadMusicInfo(uint32_t recordingFd, uint32_t recordingFileSize,
        uint32_t recordingDuration, uint32_t recordingFileOffset);
    void ResetFileOffset();
    void SetRendererParams(uint32_t samplingRate, uint32_t channelCount,
        uint32_t sampleFormat, bool isLowLatencyMode);
    int32_t GetProgress();

    void (*rendererInterruptCallback)(void *context, OH_AudioInterrupt_ForceType type,
        OH_AudioInterrupt_Hint hint) = nullptr;
    void *rendererInterruptCallbackContext = nullptr;

private:
    OHAudioMusicRenderer() = default;
    ~OHAudioMusicRenderer() { Release(); }

    OH_AudioRenderer *audioRenderer_ = nullptr;
    OH_AudioStreamBuilder *rendererBuilder_ = nullptr;
    MusicFileOprInfo *audioFileOprInfo_ = nullptr;

    uint32_t samplingRate_ = DEFAULT_MUSIC_SAMPLING_RATE;
    uint32_t channelCount_ = DEFAULT_MUSIC_CHANNEL_COUNT;
    OH_AudioStream_SampleFormat sampleFormat_ = AUDIOSTREAM_SAMPLE_S16LE;
    bool isLowLatencyMode_ = false;
};

#endif
