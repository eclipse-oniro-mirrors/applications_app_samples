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

#ifndef CAPTURERAPPLICATION_OH_AUDIO_CAPTURER_H
#define CAPTURERAPPLICATION_OH_AUDIO_CAPTURER_H

#include <cstdint>
#include <ohaudio/native_audiocapturer.h>
#include <ohaudio/native_audiostreambuilder.h>

struct CapturerFileOprInfo {
    uint32_t recordingFd = -1;
    uint32_t recordingCurrentOffset = 0;
};

class OHAudioCapturer {
private:
    OHAudioCapturer() = default;
    OHAudioCapturer(const OHAudioCapturer &) = delete;
    OHAudioCapturer &operator=(const OHAudioCapturer &) = delete;

    // In singleton mode, local static singletons will release memory when the program ends.
    ~OHAudioCapturer() { Release(); }

private:
    OH_AudioStreamBuilder *capturerBuilder_ = nullptr;
    OH_AudioCapturer *audioCapturer_ = nullptr;
    CapturerFileOprInfo *audioFileOprInfo_ = nullptr;
    OH_AudioStream_SourceType sourceType_ = OH_AudioStream_SourceType::AUDIOSTREAM_SOURCE_TYPE_MIC;
    uint32_t samplingRate_ = 48000;
    uint32_t channelCount_ = 2;
    OH_AudioStream_SampleFormat sampleFormat_ = OH_AudioStream_SampleFormat::AUDIOSTREAM_SAMPLE_S16LE;
    bool isLowLatencyMode_ = false;

public:
    void Init();
    void Start();
    void Pause();
    void Stop();
    void Release();
    void LoadRecordingInfo(uint32_t recordingFd);
    void SetCapturerParams(uint32_t sourceType, uint32_t samplingRate, uint32_t channelCount,
        uint32_t sampleFormat, bool isLowLatencyMode);
    void (*capturerInterruptCallback)(void *context,
        OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint) = nullptr;
    void *capturerInterruptCallbackContext = nullptr;
    int32_t secondBufferWalk = 0;

    static OHAudioCapturer &GetInstance()
    {
        static OHAudioCapturer instance;
        return instance;
    }
};

#endif //CAPTURERAPPLICATION_OH_AUDIO_CAPTURER_H
