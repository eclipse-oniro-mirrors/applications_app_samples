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

#ifndef AUDIOCAPTURER_H
#define AUDIOCAPTURER_H

#include <ohaudio/native_audiocapturer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <ohaudio/native_audiostream_base.h>

#include "sample_info.h"

class AudioCapturer {
public:
    AudioCapturer() = default;
    ~AudioCapturer();

    // 根据录制参数创建采集器，并把采集回调写入 audioEncContext 的缓存队列。
    // 回调上下文 audioEncContext 必须在 AudioCapturerRelease 前保持有效。
    void AudioCapturerInit(SampleInfo& sampleInfo, CodecUserData *audioEncContext);
    void AudioCapturerStart();
    // 先停止并释放采集器，再销毁构建器；销毁后不会再触发采集回调。
    void AudioCapturerRelease();

private:
    // 两个句柄遵循“先释放采集器、后销毁构建器”的生命周期顺序。
    OH_AudioCapturer *audioCapturer_ = nullptr;
    OH_AudioStreamBuilder *builder_ = nullptr;
};

#endif
