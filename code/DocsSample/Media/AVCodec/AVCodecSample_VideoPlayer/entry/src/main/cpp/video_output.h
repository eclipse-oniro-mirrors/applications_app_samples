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

#ifndef AVCODEC_SAMPLE_VIDEO_OUTPUT_H
#define AVCODEC_SAMPLE_VIDEO_OUTPUT_H

#include <multimedia/player_framework/native_avbuffer.h>
#include <native_window/external_window.h>

class BufferOutput {
public:
    explicit BufferOutput(OHNativeWindow *window, int32_t rotation) : window_(window), rotation_(rotation) {}

    bool Configure(OH_AVFormat *format);
    bool Present(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr &attr) const;

private:
    bool CopyFrame(OHNativeWindowBuffer *target, const uint8_t *source) const;

    OHNativeWindow *window_;
    int32_t rotation_;
    int32_t width_ = 0;
    int32_t height_ = 0;
    int32_t stride_ = 0;
    int32_t sliceHeight_ = 0;
    int32_t windowFormat_ = 0;
};

#endif
