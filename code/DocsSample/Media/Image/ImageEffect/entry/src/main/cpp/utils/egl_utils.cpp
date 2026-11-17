/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "egl_utils.h"

#include "common_utils.h"

constexpr EGLint EGL_COLOR_BITS = 8;
constexpr EGLint EGL_PBUFFER_WIDTH = 1;
constexpr EGLint EGL_PBUFFER_HEIGHT = 1;
constexpr EGLint EGL_GLES_VERSION = 3;

EglUtils::~EglUtils()
{
    Release();
}

bool EglUtils::Init()
{
    display_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    CHECK_AND_RETURN_RET_LOG(display_ != EGL_NO_DISPLAY, false, "eglGetDisplay fail!");

    EGLint major = 0;
    EGLint minor = 0;
    CHECK_AND_RETURN_RET_LOG(eglInitialize(display_, &major, &minor) == EGL_TRUE, false, "eglInitialize fail!");
    CHECK_AND_RETURN_RET_LOG(eglBindAPI(EGL_OPENGL_ES_API) == EGL_TRUE, false, "eglBindAPI fail!");

    EGLint configAttribs[] = {
        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
        EGL_RED_SIZE, EGL_COLOR_BITS,
        EGL_GREEN_SIZE, EGL_COLOR_BITS,
        EGL_BLUE_SIZE, EGL_COLOR_BITS,
        EGL_ALPHA_SIZE, EGL_COLOR_BITS,
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
        EGL_NONE
    };
    EGLConfig config = nullptr;
    EGLint configCount = 0;
    CHECK_AND_RETURN_RET_LOG(
        eglChooseConfig(display_, configAttribs, &config, 1, &configCount) == EGL_TRUE && configCount > 0, false,
        "eglChooseConfig fail!");

    EGLint surfaceAttribs[] = {EGL_WIDTH, EGL_PBUFFER_WIDTH, EGL_HEIGHT, EGL_PBUFFER_HEIGHT, EGL_NONE};
    surface_ = eglCreatePbufferSurface(display_, config, surfaceAttribs);
    CHECK_AND_RETURN_RET_LOG(surface_ != EGL_NO_SURFACE, false, "eglCreatePbufferSurface fail!");

    EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, EGL_GLES_VERSION, EGL_NONE};
    context_ = eglCreateContext(display_, config, EGL_NO_CONTEXT, contextAttribs);
    CHECK_AND_RETURN_RET_LOG(context_ != EGL_NO_CONTEXT, false, "eglCreateContext fail!");

    CHECK_AND_RETURN_RET_LOG(eglMakeCurrent(display_, surface_, surface_, context_) == EGL_TRUE, false,
                             "eglMakeCurrent fail!");
    return true;
}

void EglUtils::Release()
{
    if (display_ == EGL_NO_DISPLAY) {
        return;
    }
    eglMakeCurrent(display_, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    if (context_ != EGL_NO_CONTEXT) {
        eglDestroyContext(display_, context_);
        context_ = EGL_NO_CONTEXT;
    }
    if (surface_ != EGL_NO_SURFACE) {
        eglDestroySurface(display_, surface_);
        surface_ = EGL_NO_SURFACE;
    }
    eglTerminate(display_);
    display_ = EGL_NO_DISPLAY;
}
