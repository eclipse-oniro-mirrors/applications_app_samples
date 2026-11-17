/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef AVCODEC_SAMPLE_CALLBACK_H
#define AVCODEC_SAMPLE_CALLBACK_H

#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include "sample_info.h"

// 音视频接口以静态函数形式回调，userData 必须是调用方持有的 CodecUserData。
// 释放顺序应为：先标记 isDestroyed，再停止并销毁 codec/AudioRenderer、等待工作线程退出，最后释放 userData；
// 回调只借用该指针，不负责 delete。
class SampleCallback {
public:
    static int32_t OnRenderWriteData(OH_AudioRenderer *renderer, void *userData, void *buffer, int32_t length);
    static int32_t OnRenderStreamEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Event event);
    static int32_t OnRenderInterruptEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioInterrupt_ForceType type,
                               OH_AudioInterrupt_Hint hint);
    static void OnRenderInterrupt(OH_AudioRenderer *renderer, void *userData, OH_AudioInterrupt_ForceType type,
        OH_AudioInterrupt_Hint hint);
    static int32_t OnRenderError(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Result error);

    static void OnCodecError(OH_AVCodec *codec, int32_t errorCode, void *userData);
    static void OnCodecFormatChange(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
    static void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData);
    static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData);
};

#endif
