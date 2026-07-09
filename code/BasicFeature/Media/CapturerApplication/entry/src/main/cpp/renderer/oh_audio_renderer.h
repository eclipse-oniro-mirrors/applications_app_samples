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

#ifndef CAPTURERAPPLICATION_OH_AUDIO_RENDERER_H
#define CAPTURERAPPLICATION_OH_AUDIO_RENDERER_H

#include <cstdint>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <fstream>

struct RendererFileOprInfo {
    uint32_t recordingFd = -1;
    uint32_t recordingDuration = 0;
    uint32_t recordingFileSize = 0;
    uint32_t recordingFileOffset = 0;
    uint32_t recordingCurrentOffset = 0;
    bool isReadEnd = false;
};

class OHAudioRenderer {
private:
    OHAudioRenderer() = default;
    OHAudioRenderer(const OHAudioRenderer &) = delete;
    OHAudioRenderer &operator=(const OHAudioRenderer &) = delete;

    // In singleton mode, local static singletons will release memory when the program ends.
    ~OHAudioRenderer() { Release(); }

private:
    OH_AudioStreamBuilder *rendererBuilder_ = nullptr;
    OH_AudioRenderer *audioRenderer_ = nullptr;
    RendererFileOprInfo *audioFileOprInfo_ = nullptr;
    std::string recordingFilePath_ = "";
    uint32_t samplingRate_ = 48000;
    uint32_t channelCount_ = 2;
    OH_AudioStream_SampleFormat sampleFormat_ = OH_AudioStream_SampleFormat::AUDIOSTREAM_SAMPLE_S16LE;
    bool isLowLatencyMode_ = false;

public:
    void InitRenderer();
    void Start();
    void Pause();
    void Stop();
    int32_t GetProgress();
    void Release();
    void LoadRecordingInfo(uint32_t recordingFd, uint32_t recordingFileSize,
        uint32_t recordingDuration, uint32_t recordingFileOffset);
    void SetLowLatencyMode(bool latencyMode);
    void SetRendererParams(uint32_t samplingRate, uint32_t channelCount,
        uint32_t sampleFormat, bool isLowLatencyMode);
    void (*rendererInterruptCallback)(void *context,
        OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint) = nullptr;
    void *rendererInterruptCallbackContext = nullptr;
    int32_t secondBufferWalk = 0;

    static OHAudioRenderer &GetInstance()
    {
        static OHAudioRenderer instance;
        return instance;
    }
};

#endif //CAPTURERAPPLICATION_OH_AUDIO_RENDERER_H
