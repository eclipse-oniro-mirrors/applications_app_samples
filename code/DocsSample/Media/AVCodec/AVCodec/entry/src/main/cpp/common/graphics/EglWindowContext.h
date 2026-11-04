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

#ifndef AVCODEC_EGL_WINDOW_CONTEXT_H
#define AVCODEC_EGL_WINDOW_CONTEXT_H
#include <EGL/egl.h>
#include <native_window/external_window.h>

namespace AvCodecGraphics {
// Create/use/destroy on the owning worker. The NativeWindow outlives this object.
class EglWindowContext {
public:
    EglWindowContext() = default;
    EglWindowContext(const EglWindowContext &) = delete;
    EglWindowContext &operator=(const EglWindowContext &) = delete;
    ~EglWindowContext();
    bool Initialize(OHNativeWindow *window);
    bool Present(int64_t timestampNs);
private:
    EGLDisplay display_ = EGL_NO_DISPLAY;
    EGLSurface surface_ = EGL_NO_SURFACE;
    EGLContext context_ = EGL_NO_CONTEXT;
};
}
#endif
