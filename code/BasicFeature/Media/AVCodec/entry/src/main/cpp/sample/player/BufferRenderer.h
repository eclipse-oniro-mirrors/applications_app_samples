/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef VIDEO_CODEC_BUFFER_RENDERER_H
#define VIDEO_CODEC_BUFFER_RENDERER_H

#include <cstdint>
#include <native_buffer/native_buffer.h>
#include <native_window/external_window.h>
#include "sample_info.h"

class BufferRenderer {
public:
    bool Render(CodecBufferInfo& bufferInfo, const SampleInfo& sampleInfo,
        const CodecUserData& videoDecContext, int64_t renderTimestamp);
    void Reset();

private:
    struct BufferRenderContext {
        CodecBufferInfo& bufferInfo;
        const uint8_t *srcAddr;
        const SampleInfo& sampleInfo;
        const CodecUserData& videoDecContext;
    };

    bool ConfigureWindow(const SampleInfo& sampleInfo, const CodecUserData& videoDecContext,
        int32_t graphicPixelFormat);
    bool CopyToWindowBuffer(uint8_t *dstAddr, const OH_NativeBuffer_Config& dstConfig,
        const uint8_t *srcAddr, const SampleInfo& sampleInfo, const CodecUserData& videoDecContext);
    bool RequestWindowBuffer(OHNativeWindow *window, OHNativeWindowBuffer *&windowBuffer, int &fenceFd);
    bool CopyToNativeBuffer(OHNativeWindowBuffer *windowBuffer, int &fenceFd,
        const BufferRenderContext& renderContext);
    bool FlushWindowBuffer(OHNativeWindow *window, OHNativeWindowBuffer *windowBuffer, int64_t renderTimestamp);

    bool windowConfigured_ = false;
    int32_t windowWidth_ = 0;
    int32_t windowHeight_ = 0;
    int32_t windowFormat_ = 0;
    OHNativeWindow *window_ = nullptr;
    bool metadataCopyFailureLogged_ = false;
};

#endif // VIDEO_CODEC_BUFFER_RENDERER_H
