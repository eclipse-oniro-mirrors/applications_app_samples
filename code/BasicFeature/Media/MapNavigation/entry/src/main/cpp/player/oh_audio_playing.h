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

#ifndef OHAUDIO_PLAY_PCM_OH_AUDIO_PLAYING_H
#define OHAUDIO_PLAY_PCM_OH_AUDIO_PLAYING_H

#include <cstdint>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <uv.h>
#include <js_native_api.h>
#include <js_native_api_types.h>

enum PlayStatus { PLAY = 1, PAUSE = 2 };

struct AudioFileOprInfo {
    uint32_t pcmFd = -1;
    uint32_t pcmDuration = 0;
    uint32_t pcmFileSize = 0;
    uint32_t pcmFileOffset = 0;
    uint32_t pcmCurrentOffset = 0;
    bool isReadEnd = false;
    bool isNeedLoop = false;
};

class OHAudioPlayer {
private:
    OHAudioPlayer() = default;
    OHAudioPlayer(const OHAudioPlayer &) = delete;            // Forbid copying construction
    OHAudioPlayer &operator=(const OHAudioPlayer &) = delete; // Forbid assignment construction

    // In singleton mode, local static singletons will release memory when the program ends.
    ~OHAudioPlayer() { ReleasePlayer(); }

private:
    OH_AudioStreamBuilder *rendererBuilder = nullptr;
    OH_AudioRenderer *audioRenderer = nullptr;
    AudioFileOprInfo *audioFileOprInfo = nullptr;

public:
    void InitPlayer();
    void LoadPcmInfo(uint32_t pcmFd, uint32_t pcmFileSize, uint32_t pcmDuration, uint32_t pcmFileOffset);
    void PlayPcm();
    void PausePcm();
    void StopPcm();
    void ReleasePlayer();
    void (*PlayStatusCallback)(void *context, PlayStatus playStatus) = nullptr;
    void *PlayStatusCallbackContext = nullptr;
    int32_t secondBufferWalk = 0;

    static OHAudioPlayer &GetInstance() {
        static OHAudioPlayer instance;
        return instance;
    }
};

#endif // OHAUDIO_PLAY_PCM_OH_AUDIO_PLAYING_H
