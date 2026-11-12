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

#include "TranscodeGpuProcessor.h"
#include <array>
#include <limits>
#include <GLES2/gl2ext.h>
#include <native_buffer/native_buffer.h>
#include "../../../../../common/graphics/GlProgram.h"

namespace {
constexpr int32_t COMPONENTS = 2;
constexpr int32_t VERTICES = 4;
constexpr int32_t MATRIX_ELEMENTS = 16;
constexpr int64_t NS_PER_US = 1000;
constexpr char VERTEX[] =
    "attribute vec2 position; attribute vec2 coordinate; uniform mat4 matrix; uniform vec4 crop;"
    "varying vec2 uv; void main(){ gl_Position=vec4(position,0.0,1.0);"
    "uv=(matrix*vec4(crop.xy+coordinate*crop.zw,0.0,1.0)).xy; }";
constexpr char FRAGMENT[] =
    "#extension GL_OES_EGL_image_external : require\n"
    "precision mediump float; uniform samplerExternalOES source; uniform float grayscale;"
    "varying vec2 uv; void main(){ vec4 c=texture2D(source,uv);"
    "float y=dot(c.rgb,vec3(0.2126,0.7152,0.0722));"
    "gl_FragColor=vec4(mix(c.rgb,vec3(y),grayscale),1.0); }";
constexpr GLfloat POSITIONS[] = { -1, -1, 1, -1, -1, 1, 1, 1 };
constexpr GLfloat COORDINATES[] = { 0, 0, 1, 0, 0, 1, 1, 1 };
}

bool TranscodeGpuProcessor::Initialize(OHNativeWindow *encoder, int32_t width, int32_t height,
    int32_t targetWidth, int32_t targetHeight, int32_t resizeMode, bool grayscale, int32_t filter)
{
    TranscodeFrames::Layout input { width, height, width, height };
    TranscodeFrames::Layout output { targetWidth, targetHeight, targetWidth, targetHeight };
    uint64_t usage = 0;
    if (encoder == nullptr ||
        OH_NativeWindow_NativeWindowHandleOpt(encoder, GET_USAGE, &usage) != 0 ||
        OH_NativeWindow_NativeWindowHandleOpt(encoder, SET_USAGE, usage | NATIVEBUFFER_USAGE_HW_RENDER) != 0 ||
        filter < 0 || filter > static_cast<int32_t>(TranscodeFrames::Filter::BILINEAR) ||
        !TranscodeFrames::PlanGeometry(input, output,
            static_cast<TranscodeFrames::ResizeMode>(resizeMode), geometry_) ||
        OH_NativeWindow_NativeWindowHandleOpt(encoder, SET_BUFFER_GEOMETRY, targetWidth, targetHeight) != 0 ||
        OH_NativeWindow_NativeWindowHandleOpt(encoder, SET_FORMAT, NATIVEBUFFER_PIXEL_FMT_RGBA_8888) != 0 ||
        OH_NativeWindow_SetColorSpace(encoder, OH_COLORSPACE_BT709_FULL) != 0 ||
        !egl_.Initialize(encoder)) { return false; }
    width_ = width;
    height_ = height;
    targetWidth_ = targetWidth;
    targetHeight_ = targetHeight;
    grayscale_ = grayscale;
    program_ = AvCodecGraphics::CreateProgram(VERTEX, FRAGMENT);
    if (program_ == 0) { return false; }
    glGenTextures(1, &texture_);
    if (texture_ == 0) { return false; }
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, texture_);
    const GLint sampling = filter == 0 ? GL_NEAREST : GL_LINEAR;
    glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_MIN_FILTER, sampling);
    glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_MAG_FILTER, sampling);
    glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    return CreateImage(width, height);
}

bool TranscodeGpuProcessor::CreateImage(int32_t width, int32_t height)
{
    image_ = OH_NativeImage_Create(texture_, GL_TEXTURE_EXTERNAL_OES);
    if (image_ == nullptr || OH_NativeImage_AttachContext(image_, texture_) != 0 ||
        OH_ConsumerSurface_SetDefaultSize(image_, width, height) != 0) { return false; }
    const OH_OnFrameAvailableListener listener { this, &TranscodeGpuProcessor::OnFrame };
    if (OH_NativeImage_SetOnFrameAvailableListener(image_, listener) != 0) { return false; }
    window_ = OH_NativeImage_AcquireNativeWindow(image_);
    return window_ != nullptr && glGetError() == GL_NO_ERROR;
}

void TranscodeGpuProcessor::OnFrame(void *context)
{
    // No GL work or codec operations on the callback thread.
    static_cast<TranscodeGpuProcessor *>(context)->available_.fetch_add(1);
}

bool TranscodeGpuProcessor::DrawTexture()
{
    std::array<GLfloat, MATRIX_ELEMENTS> matrix {};
    if (OH_NativeImage_GetTransformMatrixV2(image_, matrix.data()) != 0) { return false; }
    glViewport(0, 0, targetWidth_, targetHeight_);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    glViewport(geometry_.contentLeft, targetHeight_ - geometry_.contentTop - geometry_.contentHeight,
        geometry_.contentWidth, geometry_.contentHeight);
    glUseProgram(program_);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, texture_);
    glUniform1i(glGetUniformLocation(program_, "source"), 0);
    glUniform1f(glGetUniformLocation(program_, "grayscale"), grayscale_ ? 1 : 0);
    glUniformMatrix4fv(glGetUniformLocation(program_, "matrix"), 1, GL_FALSE, matrix.data());
    glUniform4f(glGetUniformLocation(program_, "crop"), static_cast<float>(geometry_.cropLeft) / width_,
        static_cast<float>(geometry_.cropTop) / height_, static_cast<float>(geometry_.cropWidth) / width_,
        static_cast<float>(geometry_.cropHeight) / height_);
    const GLint position = glGetAttribLocation(program_, "position");
    const GLint coordinate = glGetAttribLocation(program_, "coordinate");
    if (position < 0 || coordinate < 0) { return false; }
    glEnableVertexAttribArray(position);
    glEnableVertexAttribArray(coordinate);
    glVertexAttribPointer(position, COMPONENTS, GL_FLOAT, GL_FALSE, 0, POSITIONS);
    glVertexAttribPointer(coordinate, COMPONENTS, GL_FLOAT, GL_FALSE, 0, COORDINATES);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, VERTICES);
    glDisableVertexAttribArray(position);
    glDisableVertexAttribArray(coordinate);
    return glGetError() == GL_NO_ERROR;
}

bool TranscodeGpuProcessor::Draw(int64_t timestampUs)
{
    if (!Available() || timestampUs < 0 || timestampUs > std::numeric_limits<int64_t>::max() / NS_PER_US ||
        OH_NativeImage_UpdateSurfaceImage(image_) != 0) { return false; }
    available_.fetch_sub(1);
    return DrawTexture() && egl_.Present(timestampUs * NS_PER_US);
}

TranscodeGpuProcessor::~TranscodeGpuProcessor()
{
    // Decoder is stopped/destroyed first; keep the listener context alive through NativeImage destruction.
    if (image_ != nullptr) {
        (void)OH_NativeImage_UnsetOnFrameAvailableListener(image_);
        glFinish();
        (void)OH_NativeImage_DetachContext(image_);
        OH_NativeImage_Destroy(&image_);
    }
    if (texture_ != 0) { glDeleteTextures(1, &texture_); }
    if (program_ != 0) { glDeleteProgram(program_); }
}
