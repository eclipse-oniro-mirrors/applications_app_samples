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

#include "EglWindowContext.h"
#include <GLES2/gl2.h>

namespace AvCodecGraphics {
namespace {
constexpr EGLint CHANNEL_BITS = 8;
constexpr EGLint ES_VERSION = 2;
constexpr int32_t REQUEST_TIMEOUT_MS = 100;
}
bool EglWindowContext::Initialize(OHNativeWindow *window)
{
    if (window == nullptr || context_ != EGL_NO_CONTEXT) { return false; }
    // Bound native dequeue waits; a blocked producer must not prevent task cancellation indefinitely.
    if (OH_NativeWindow_NativeWindowHandleOpt(window, SET_TIMEOUT, REQUEST_TIMEOUT_MS) != 0) { return false; }
    display_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (display_ == EGL_NO_DISPLAY || !eglInitialize(display_, nullptr, nullptr) ||
        !eglBindAPI(EGL_OPENGL_ES_API)) { return false; }
    const EGLint attributes[] = { EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT,
        EGL_RED_SIZE, CHANNEL_BITS, EGL_GREEN_SIZE, CHANNEL_BITS, EGL_BLUE_SIZE, CHANNEL_BITS,
        EGL_ALPHA_SIZE, CHANNEL_BITS, EGL_NONE };
    EGLConfig config = nullptr;
    EGLint count = 0;
    if (!eglChooseConfig(display_, attributes, &config, 1, &count) || count != 1) { return false; }
    const EGLint contextAttributes[] = { EGL_CONTEXT_CLIENT_VERSION, ES_VERSION, EGL_NONE };
    context_ = eglCreateContext(display_, config, EGL_NO_CONTEXT, contextAttributes);
    surface_ = eglCreateWindowSurface(display_, config, reinterpret_cast<EGLNativeWindowType>(window), nullptr);
    return context_ != EGL_NO_CONTEXT && surface_ != EGL_NO_SURFACE &&
        eglMakeCurrent(display_, surface_, surface_, context_) == EGL_TRUE;
}

bool EglWindowContext::Present(int64_t timestampNs)
{
    using PresentationTime = EGLBoolean (*)(EGLDisplay, EGLSurface, int64_t);
    const auto presentation = reinterpret_cast<PresentationTime>(eglGetProcAddress("eglPresentationTimeANDROID"));
    return presentation != nullptr && presentation(display_, surface_, timestampNs) == EGL_TRUE &&
        eglSwapBuffers(display_, surface_) == EGL_TRUE;
}

EglWindowContext::~EglWindowContext()
{
    if (display_ == EGL_NO_DISPLAY) { return; }
    eglMakeCurrent(display_, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    if (surface_ != EGL_NO_SURFACE) { eglDestroySurface(display_, surface_); }
    if (context_ != EGL_NO_CONTEXT) { eglDestroyContext(display_, context_); }
    // EGL_DEFAULT_DISPLAY is process-wide and may also belong to an idle player context.
}
}
