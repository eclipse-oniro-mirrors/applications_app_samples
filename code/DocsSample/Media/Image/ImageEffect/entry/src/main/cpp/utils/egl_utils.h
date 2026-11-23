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

#ifndef IMAGEEFFECT_EGL_UTILS_H
#define IMAGEEFFECT_EGL_UTILS_H

#include <EGL/egl.h>
#include <EGL/eglext.h>

// 纹理输入场景要求应用提供合法的OpenGL上下文环境，该类用于创建离屏渲染所需的EGL上下文。
class EglUtils {
public:
    EglUtils() = default;

    ~EglUtils();

    bool Init();

private:
    void Release();

    EGLDisplay display_ = EGL_NO_DISPLAY;
    EGLContext context_ = EGL_NO_CONTEXT;
    EGLSurface surface_ = EGL_NO_SURFACE;
};

#endif // IMAGEEFFECT_EGL_UTILS_H
