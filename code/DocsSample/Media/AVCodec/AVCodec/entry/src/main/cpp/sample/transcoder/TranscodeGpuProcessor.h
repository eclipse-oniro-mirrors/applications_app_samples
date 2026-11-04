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

#ifndef AVCODEC_TRANSCODE_GPU_PROCESSOR_H
#define AVCODEC_TRANSCODE_GPU_PROCESSOR_H
#include <atomic>
#include <GLES2/gl2.h>
#include <native_image/native_image.h>
#include "../../common/graphics/EglWindowContext.h"
#include "TranscodeFrameProcessor.h"

// Independent of player VideoSink. All GL calls stay on the Native transcode worker.
class TranscodeGpuProcessor {
public:
    ~TranscodeGpuProcessor();
    bool Initialize(OHNativeWindow *encoder, int32_t width, int32_t height,
        int32_t targetWidth, int32_t targetHeight, int32_t resizeMode, bool grayscale, int32_t filter);
    OHNativeWindow *DecoderWindow() const { return window_; }
    bool Available() const { return available_.load() > 0; }
    bool Draw(int64_t timestampUs);
private:
    static void OnFrame(void *context);
    bool CreateImage(int32_t width, int32_t height);
    bool DrawTexture();
    AvCodecGraphics::EglWindowContext egl_;
    OH_NativeImage *image_ = nullptr;
    OHNativeWindow *window_ = nullptr; // Borrowed from NativeImage.
    GLuint texture_ = 0;
    GLuint program_ = 0;
    TranscodeFrames::Geometry geometry_;
    int32_t width_ = 0;
    int32_t height_ = 0;
    int32_t targetWidth_ = 0;
    int32_t targetHeight_ = 0;
    bool grayscale_ = false;
    std::atomic<uint32_t> available_ { 0 };
};
#endif
