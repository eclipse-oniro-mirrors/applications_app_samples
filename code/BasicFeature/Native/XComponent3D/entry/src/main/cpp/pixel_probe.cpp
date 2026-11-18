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

#include "pixel_probe.h"

#include <EGL/egl.h>
#include <GLES3/gl3.h>
#include <hilog/log.h>

namespace PixelProbe
{
    namespace
    {
        constexpr uint32_t PROBE_LOG_DOMAIN = 0xF811;
        constexpr const char *PROBE_LOG_TAG = "[Sample_AppXComponent3D]";

        // 配置属性里各颜色通道的位宽，取值 8 即每个通道 8 位
        constexpr EGLint EGL_CHANNEL_BITS = 8;
        // 创建上下文时申请的 OpenGL ES 版本
        constexpr EGLint PROBE_GLES_VERSION = 3;
        // 颜色通道满量值，缓冲区按 0~255 归一化写入清屏颜色
        constexpr GLfloat CHANNEL_MAX_F = 255.0F;
        // 探针返回码，与 OH_NativeXComponent 的结果码取值保持一致
        constexpr int32_t PROBE_RESULT_OK = 0;
        constexpr int32_t PROBE_RESULT_FAILED = -1;
        constexpr int32_t PROBE_RESULT_BAD_PARAMETER = -2;
        // 单次 glReadPixels 的采样窗口边长，单位为像素
        constexpr GLsizei PROBE_SAMPLE_PIXELS = 1;
        // eglChooseConfig 请求返回的配置个数
        constexpr EGLint PROBE_CONFIG_COUNT = 1;

        struct EglBundle
        {
            EGLDisplay display = EGL_NO_DISPLAY;
            EGLSurface pbuffer = EGL_NO_SURFACE;
            EGLContext context = EGL_NO_CONTEXT;
        };

        void ReleaseEgl(EglBundle &bundle)
        {
            if (bundle.display == EGL_NO_DISPLAY)
            {
                return;
            }
            eglMakeCurrent(bundle.display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
            if (bundle.context != EGL_NO_CONTEXT)
            {
                eglDestroyContext(bundle.display, bundle.context);
                bundle.context = EGL_NO_CONTEXT;
            }
            if (bundle.pbuffer != EGL_NO_SURFACE)
            {
                eglDestroySurface(bundle.display, bundle.pbuffer);
                bundle.pbuffer = EGL_NO_SURFACE;
            }
            eglTerminate(bundle.display);
            eglReleaseThread();
            bundle.display = EGL_NO_DISPLAY;
        }

        bool ChooseProbeConfig(EGLDisplay display, EGLConfig &config)
        {
            const EGLint configAttribs[] = {
                EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
                EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                EGL_RED_SIZE, EGL_CHANNEL_BITS,
                EGL_GREEN_SIZE, EGL_CHANNEL_BITS,
                EGL_BLUE_SIZE, EGL_CHANNEL_BITS,
                EGL_ALPHA_SIZE, EGL_CHANNEL_BITS,
                EGL_NONE};
            EGLint configCount = 0;
            if (eglChooseConfig(display, configAttribs, &config, PROBE_CONFIG_COUNT, &configCount) != EGL_TRUE ||
                configCount < PROBE_CONFIG_COUNT)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG,
                             "pixel probe: eglChooseConfig failed");
                return false;
            }
            return true;
        }

        bool AttachProbeContext(EglBundle &bundle, EGLConfig config)
        {
            const EGLint surfaceAttribs[] = {
                EGL_WIDTH, PROBE_SURFACE_SIZE,
                EGL_HEIGHT, PROBE_SURFACE_SIZE,
                EGL_NONE};
            bundle.pbuffer = eglCreatePbufferSurface(bundle.display, config, surfaceAttribs);
            if (bundle.pbuffer == EGL_NO_SURFACE)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG,
                             "pixel probe: eglCreatePbufferSurface failed");
                return false;
            }

            const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, PROBE_GLES_VERSION, EGL_NONE};
            bundle.context = eglCreateContext(bundle.display, config, EGL_NO_CONTEXT, contextAttribs);
            if (bundle.context == EGL_NO_CONTEXT)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG,
                             "pixel probe: eglCreateContext failed");
                return false;
            }

            if (eglMakeCurrent(bundle.display, bundle.pbuffer, bundle.pbuffer, bundle.context) != EGL_TRUE)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG,
                             "pixel probe: eglMakeCurrent failed");
                return false;
            }
            return true;
        }

        bool PrepareEgl(EglBundle &bundle)
        {
            bundle.display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
            if (bundle.display == EGL_NO_DISPLAY)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG, "pixel probe: no egl display");
                return false;
            }
            EGLint major = 0;
            EGLint minor = 0;
            if (eglInitialize(bundle.display, &major, &minor) != EGL_TRUE)
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG, "pixel probe: eglInitialize failed");
                return false;
            }

            EGLConfig config = nullptr;
            if (!ChooseProbeConfig(bundle.display, config))
            {
                return false;
            }
            return AttachProbeContext(bundle, config);
        }
    } // namespace

    int32_t RenderSolidAndRead(uint8_t red, uint8_t green, uint8_t blue, uint8_t alpha,
                               uint8_t outRgba[PROBE_RGBA_BYTES])
    {
        if (outRgba == nullptr)
        {
            return PROBE_RESULT_BAD_PARAMETER;
        }
        EglBundle bundle;
        if (!PrepareEgl(bundle))
        {
            ReleaseEgl(bundle);
            return PROBE_RESULT_FAILED;
        }

        glViewport(0, 0, PROBE_SURFACE_SIZE, PROBE_SURFACE_SIZE);
        glClearColor(static_cast<GLfloat>(red) / CHANNEL_MAX_F, static_cast<GLfloat>(green) / CHANNEL_MAX_F,
                     static_cast<GLfloat>(blue) / CHANNEL_MAX_F, static_cast<GLfloat>(alpha) / CHANNEL_MAX_F);
        glClear(GL_COLOR_BUFFER_BIT);
        glFinish();

        // 左下角与右上角各取一个像素，用来验证清屏覆盖整个 pbuffer
        glReadPixels(0, 0, PROBE_SAMPLE_PIXELS, PROBE_SAMPLE_PIXELS, GL_RGBA, GL_UNSIGNED_BYTE, outRgba);
        glReadPixels(PROBE_SURFACE_SIZE - PROBE_SAMPLE_PIXELS, PROBE_SURFACE_SIZE - PROBE_SAMPLE_PIXELS,
                     PROBE_SAMPLE_PIXELS, PROBE_SAMPLE_PIXELS, GL_RGBA, GL_UNSIGNED_BYTE,
                     outRgba + PROBE_CHANNEL_BYTES);

        const GLenum glError = glGetError();
        ReleaseEgl(bundle);
        if (glError != GL_NO_ERROR)
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, PROBE_LOG_DOMAIN, PROBE_LOG_TAG,
                         "pixel probe: glError %{public}u", glError);
            return PROBE_RESULT_FAILED;
        }
        return PROBE_RESULT_OK;
    }

    int32_t GetProbeSurfaceSize()
    {
        return PROBE_SURFACE_SIZE;
    }
} // namespace PixelProbe
