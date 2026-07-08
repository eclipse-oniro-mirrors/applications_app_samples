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

#include "include/render_thread.h"
#include <algorithm>
#include <GLES2/gl2ext.h>
#include <sys/poll.h>
#include <unistd.h>
#include <cstring>
#include <vector>
#include "multimedia/player_framework/native_avcodec_videobase.h"

namespace NativeXComponentSample {
constexpr char DEMO_NAME[] = "HMOSLiveStream";
constexpr uint32_t LOG_PRINT_DOMAIN = 0xFF00;
const std::string g_texture2dSrc = "#define TEXTURE_2D_SRC 1\n";

ViewportParams ComputeCenteredViewport(int32_t imageWidth, int32_t imageHeight,
                                       int32_t viewWidth, int32_t viewHeight)
{
    float imageAspect = static_cast<float>(imageWidth) / static_cast<float>(imageHeight);
    float viewAspect = static_cast<float>(viewWidth) / static_cast<float>(viewHeight);
    ViewportParams vp;
    if (imageAspect > viewAspect) {
        vp.height = viewHeight;
        vp.width = static_cast<int32_t>(vp.height * imageAspect);
        vp.x = -(vp.width - viewWidth) / CENTER_OFFSET_DIVISOR;
        vp.y = 0;
    } else {
        vp.width = viewWidth;
        vp.height = static_cast<int32_t>(vp.width / imageAspect);
        vp.x = 0;
        vp.y = -(vp.height - viewHeight) / CENTER_OFFSET_DIVISOR;
    }
    return vp;
}
const std::string g_versionGlsl = "#version 300 es\n";
const std::string g_version310Glsl = "#version 310 es\n";
constexpr GLuint RECTANGLE_INDICES[] = {
    0, 1, 2,  // first triangle
    0, 2, 3   // second triangle
};
namespace Detail {
static void CreateGLTex(GLenum target, uint32_t& outTextureId, bool openMipmap = false)
{
    uint32_t textureId = 0;
    glGenTextures(1, &textureId);
    glBindTexture(target, textureId);
    glTexParameteri(target, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(target, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    if (openMipmap) {
        // default: trilinear sammpling
        glTexParameteri(target, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    } else {
        // default: use bilinear sampling
        glTexParameteri(target, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    }
    glBindTexture(target, 0);
    outTextureId = textureId;
}

static void LeftProd(float* lmatrix, float* rmatrix, float* out)
{
    for (int y = 0; y < MAT4_DIM; y++) {
        for (int z = 0; z < MAT4_DIM; z++) {
            float res = 0;
            for (int x = 0; x < MAT4_DIM; x++) {
                res += lmatrix[y * MAT4_DIM + x] * rmatrix[x * MAT4_DIM + z];
            }
            out[y * MAT4_DIM + z] = res;
        }
    }
}

std::string g_vertexShader = R"delimiter(
attribute vec3 position;
attribute vec2 texCoord;
varying vec2 vTexCoord;
uniform mat4 matTransform;

void main()
{
    gl_Position = vec4(position, 1.0);
    vec4 rotatedUV = matTransform * vec4(texCoord, 0.0, 1.0);
    vTexCoord = rotatedUV.xy;
}
)delimiter";

std::string g_fragmentShader = R"delimiter(
#extension GL_EXT_YUV_target : require

#extension GL_OES_EGL_image_external_essl3 : require
precision highp float;
in vec2 vTexCoord;

#if defined(TEXTURE_2D_SRC) && TEXTURE_2D_SRC
uniform sampler2D tex;
#else
// uniform samplerExternalOES tex;
uniform __samplerExternal2DY2YEXT tex;
#endif

layout(yuv) out vec4 outColor;
// out vec4 outColor;

vec3 rgb2yuv_bt2020_limited(vec3 rgb)
{
    vec3 RGB2Y = vec3(0.224951, 0.580575, 0.050779);
    vec3 RGB2U = vec3(-0.122296, -0.315632, 0.437928);
    vec3 RGB2V = vec3(0.437928, -0.402706, -0.035222);
    float outY = dot(RGB2Y, rgb) + 0.062561;
    float outU = dot(RGB2U, rgb) + 0.500489;
    float outV = dot(RGB2V, rgb) + 0.500489;
    vec3 YUV;
    YUV.x = clamp(outY, 0.0, 1.0);
    YUV.y = clamp(outU, 0.0, 1.0);
    YUV.z = clamp(outV, 0.0, 1.0);
    return YUV;
}

void main()
{
    vec4 color = texture(tex, vTexCoord);
#if (defined(TEXTURE_2D_SRC) && TEXTURE_2D_SRC)
    color = vec4(rgb2yuv_bt2020_limited(color.rgb), color.a);
#endif
    outColor = color;
}
)delimiter";

std::string g_fragmentShaderBW = R"delimiter(
#extension GL_OES_EGL_image_external : require
precision mediump float;
varying vec2 vTexCoord;
uniform samplerExternalOES texture;
void main()
{
    vec4 tc = texture2D(texture, vTexCoord);
    float lumR = 0.299;
    float lumG = 0.587;
    float lumB = 0.114;
    float color = tc.r * lumR + tc.g * lumG + tc.b * lumB;
    gl_FragColor = vec4(color, color, color, 1.0);
}
)delimiter";

std::string g_frameFragmentShader = R"delimiter(
#extension GL_OES_EGL_image_external : require
precision highp float;
varying vec2 vTexCoord;

uniform samplerExternalOES texture;
void main()
{
    gl_FragColor = texture2D(texture, vTexCoord);
}
)delimiter";

GLfloat g_vertices[] = {
    // positions       // texture coords
    -1.0f, 1.0f,  0.0f, 0.0f, 0.0f, // top left
    -1.0f, -1.0f, 0.0f, 0.0f, 1.0f, // bottom left
    1.0f, -1.0f, 0.0f, 1.0f, 1.0f, // bottom right
    1.0f, 1.0f,  0.0f, 1.0f, 0.0f  // top right
};

GLuint g_indices[] = {
    0, 1, 2,  // first triangle
    0, 2, 3   // second triangle
};

std::string g_roiVertexShader = R"delimiter(
attribute vec3 position;
void main()
{
    gl_Position = vec4(position, 1.0);
}
)delimiter";

std::string g_roiFragmentShader = R"delimiter(
precision mediump float;
uniform vec4 uColor;
void main()
{
    gl_FragColor = uColor;
}
)delimiter";
} // namespace Detail

RenderThread::RenderThread()
{
    Start();
}

RenderThread::~RenderThread() noexcept
{
    running_ = false;
    if (thread_.joinable()) {
        thread_.join();
    }
}

bool RenderThread::InitRenderContext()
{
    renderContext_ = std::make_unique<EglRenderContext>();
    return renderContext_->Init();
}

void RenderThread::DestroyRenderContext()
{
    renderContext_.reset();
}

void RenderThread::CleanGLResources()
{
    glDeleteVertexArrays(1, &vertexArrayObject_);
    glDeleteBuffers(1, &vertexBufferObject_);
    glDeleteTextures(1, &inTexId_);
    glDeleteTextures(1, &outTexId_);
    glDeleteVertexArrays(1, &roiVao_);
    glDeleteBuffers(1, &roiVbo_);
    videoShader_.reset();
    imageShader_.reset();
    roiShader_.reset();
}

bool RenderThread::CreateGLResources()
{
    CreateShaders();
    if (!videoShader_->Valid() || !imageShader_->Valid()) {
        return false;
    }

    SetupMainVao();
    CreateTextures();

    roiShader_ = std::make_unique<NativeXComponentSample::ShaderProgram>(
        Detail::g_roiVertexShader, Detail::g_roiFragmentShader);
    if (!roiShader_->Valid()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "ROI shader creation failed.");
        return false;
    }

    SetupRoiVao();

    UpdateImageResource(nullptr, 0, 0, 0);
    return true;
}

void RenderThread::CreateShaders()
{
    videoShader_ = std::make_unique<NativeXComponentSample::ShaderProgram>(g_versionGlsl + Detail::g_vertexShader,
        g_versionGlsl + Detail::g_fragmentShader);
    imageShader_ = std::make_unique<NativeXComponentSample::ShaderProgram>(
        g_versionGlsl + Detail::g_vertexShader, g_versionGlsl + g_texture2dSrc + Detail::g_fragmentShader);
    frameShader_ = std::make_unique<NativeXComponentSample::ShaderProgram>(
        Detail::g_vertexShader, Detail::g_frameFragmentShader);
}

void RenderThread::SetupMainVao()
{
    glGenVertexArrays(1, &vertexArrayObject_);
    glGenBuffers(1, &vertexBufferObject_);

    glBindVertexArray(vertexArrayObject_);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject_);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Detail::g_vertices), Detail::g_vertices, GL_STATIC_DRAW);
    glVertexAttribPointer(POSITION_ATTRIB_INDEX, VERTEX_POSITION_FLOATS, GL_FLOAT, GL_FALSE,
                          VERTEX_STRIDE_FLOATS * sizeof(float), nullptr);
    glEnableVertexAttribArray(POSITION_ATTRIB_INDEX);
    glVertexAttribPointer(TEXCOORD_ATTRIB_INDEX, TEXCOORD_FLOATS, GL_FLOAT, GL_FALSE,
                          VERTEX_STRIDE_FLOATS * sizeof(float),
                          reinterpret_cast<void *>(VERTEX_POSITION_FLOATS * sizeof(float)));
    glEnableVertexAttribArray(TEXCOORD_ATTRIB_INDEX);

    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);
}

void RenderThread::CreateTextures()
{
    if (nativeImageTexId_ == UNINITIALIZED_TEX_ID) {
        Detail::CreateGLTex(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "RenderThread", "nativeImageTexId_:%{public}d",
                     nativeImageTexId_);
    }
    if (noiseImageTexId_ == UNINITIALIZED_TEX_ID) {
        Detail::CreateGLTex(GL_TEXTURE_2D, noiseImageTexId_, true);
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "RenderThread", "noiseImageTexId_:%{public}d",
                     noiseImageTexId_);
    }
    if (outTexId_ == UNINITIALIZED_TEX_ID && inTexId_ == UNINITIALIZED_TEX_ID) {
        Detail::CreateGLTex(GL_TEXTURE_EXTERNAL_OES, inTexId_);
        Detail::CreateGLTex(GL_TEXTURE_EXTERNAL_OES, outTexId_);
        glGenFramebuffers(1, &vertexFrameObject_);
    }
}

void RenderThread::SetupRoiVao()
{
    glGenVertexArrays(1, &roiVao_);
    glGenBuffers(1, &roiVbo_);
    glBindVertexArray(roiVao_);
    glBindBuffer(GL_ARRAY_BUFFER, roiVbo_);
    glBufferData(GL_ARRAY_BUFFER,
                 sizeof(GLfloat) * ROI_QUAD_VERTICES * ROI_VERTEX_FLOATS * ROI_MAX_BORDER_RECTS,
                 nullptr, GL_DYNAMIC_DRAW);
    glVertexAttribPointer(POSITION_ATTRIB_INDEX, ROI_VERTEX_FLOATS, GL_FLOAT, GL_FALSE,
                          ROI_VERTEX_FLOATS * sizeof(float), nullptr);
    glEnableVertexAttribArray(POSITION_ATTRIB_INDEX);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);
}

void RenderThread::UpdateNativeWindow(void *window, uint64_t width, uint64_t height)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread",
                 "UpdateNativeWindow,window:%{public}p.", window);
    auto nativeWindow = reinterpret_cast<OHNativeWindow *>(window);
    xcomponentWindows_ = nativeWindow;

    int xcomponentHeight = 0;
    int xcomponentWidth = 0;
    OH_NativeWindow_NativeWindowHandleOpt(
        xcomponentWindows_, GET_BUFFER_GEOMETRY, &xcomponentHeight, &xcomponentWidth);
    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread",
                 "xcomponentHeight_:%{public}d, xcomponentWidth_:%{public}d", xcomponentHeight, xcomponentWidth);

    PostTask([this, nativeWindow](EglRenderContext &renderContext) {
        SetupNativeWindowSurface(nativeWindow);
    });
}

void RenderThread::SetupNativeWindowSurface(OHNativeWindow *nativeWindow)
{
    if (nativeWindow_ != nativeWindow) {
        nativeWindow_ = nativeWindow;
        if (eglSurface_ != EGL_NO_SURFACE) {
            renderContext_->DestroyEglSurface(eglSurface_);
            eglSurface_ = EGL_NO_SURFACE;
            CleanGLResources();
        }
    }
    if (nativeWindow_ == nullptr) {
        return;
    }
    // [Start Display_native_window]
    // SDR set BT709
    int32_t ret = OH_NativeWindow_SetColorSpace(nativeWindow_, OH_COLORSPACE_BT709_LIMIT);
    // [End Display_native_window]

    ret = OH_NativeWindow_SetColorSpace(nativeWindow_, OH_COLORSPACE_BT709_LIMIT) |
        OH_NativeWindow_NativeWindowHandleOpt(nativeWindow_, SET_FORMAT, NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "nativeWindow_:%{public}p, ret:%{public}d", nativeWindow_, ret);
    }
    if (eglSurface_ == EGL_NO_SURFACE) {
        eglSurface_ = renderContext_->CreateEglSurface(static_cast<EGLNativeWindowType>(nativeWindow_));
    }
    if (eglSurface_ == EGL_NO_SURFACE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "CreateEglSurface failed.");
        return;
    }
    renderContext_->MakeCurrent(eglSurface_);
    CreateGLResources();
}

void RenderThread::CreateEncoderSurface(void *window, int32_t width, int32_t height)
{
    if (encoderSurface_ != EGL_NO_SURFACE) {
        renderContext_->DestroyEglSurface(encoderSurface_);
        encoderSurface_ = EGL_NO_SURFACE;
    }
    if (renderContext_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "renderContext_ is nullptr");
        return;
    }

    auto nativeWindow = reinterpret_cast<OHNativeWindow *>(window);
    PostTask([this, nativeWindow, width, height](EglRenderContext &renderContext) {
        SetupEncoderWindowSurface(nativeWindow, width, height);
    });
    encoderWidth = width;
    encoderHeight = height;
}

void RenderThread::SetupEncoderWindowSurface(OHNativeWindow *nativeWindow, int32_t width, int32_t height)
{
    if (encoderNativeWindow_ != nativeWindow) {
        if (encoderNativeWindow_ != nullptr) {
            OH_NativeWindow_NativeObjectUnreference(encoderNativeWindow_);
        }
        encoderNativeWindow_ = nativeWindow;
        if (encoderNativeWindow_ != nullptr) {
            OH_NativeWindow_NativeObjectReference(encoderNativeWindow_);
        }

        if (encoderSurface_ != EGL_NO_SURFACE) {
            renderContext_->DestroyEglSurface(encoderSurface_);
            encoderSurface_ = EGL_NO_SURFACE;
        }
    }
    if (encoderNativeWindow_ == nullptr) {
        return;
    }
    // [Start Encode_native_window]
    OH_NativeWindow_NativeWindowHandleOpt(encoderNativeWindow_, SET_BUFFER_GEOMETRY,
        static_cast<int>(width), static_cast<int>(height));
    // [End Encode_native_window]

    // SDR set BT709
    int32_t ret = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT709_LIMIT) |
        OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "encoderNativeWindow_:%{public}p, ret:%{public}d", nativeWindow, ret);
    }
    if (encoderSurface_ == EGL_NO_SURFACE) {
        encoderSurface_ =
            renderContext_->CreateEglSurface(static_cast<EGLNativeWindowType>(encoderNativeWindow_));
    }
    if (encoderSurface_ == EGL_NO_SURFACE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "CreateEglSurface failed.");
    }
}

void RenderThread::DeleteEncoderSurface(void)
{
    renderContext_->DestroyEglSurface(encoderSurface_);
    encoderSurface_ = EGL_NO_SURFACE;
}

void RenderThread::AddBW(void)
{
    PostTask([this](EglRenderContext &renderContext) {
        videoShader_.reset();
        if (isVertexShader) {
            isVertexShader = false;
            videoShader_ =
                std::make_unique<NativeXComponentSample::ShaderProgram>(Detail::g_vertexShader, Detail::g_fragmentShader);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "Shader shader fragmentShader.");
        } else {
            isVertexShader = true;
            videoShader_ =
                std::make_unique<NativeXComponentSample::ShaderProgram>(Detail::g_vertexShader, Detail::g_fragmentShaderBW);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "Shader shader fragmentShaderBW.");
        }
    });
}

void RenderThread::Start()
{
    if (running_) {
        return;
    }

    running_ = true;
    thread_ = std::thread([this]() {
        ThreadMainLoop();
        // Ensure that the creation and destruction of renderContext are executed on the rendering thread
        CleanGLResources();
        DestroyNativeImage();
        if (nativeWindow_ != nullptr) {
            OH_NativeWindow_DestroyNativeWindow(nativeWindow_);
            nativeWindow_ = nullptr;
        }
        if (encoderNativeWindow_ != nullptr) {
            OH_NativeWindow_NativeObjectUnreference(encoderNativeWindow_);
            nativeWindow_ = nullptr;
        }
        DestroyRenderContext();
        running_ = false;
    });
}

void RenderThread::OnVsync(long long timestamp, void *data)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread", "OnVsync %{public}llu.", timestamp);
    auto renderThread = static_cast<RenderThread *>(data);
    if (renderThread == nullptr) {
        return;
    }

    renderThread->vSyncCnt_++;
    renderThread->wakeUpCond_.notify_one();
}

bool RenderThread::InitNativeVsync()
{
    nativeVsync_ = OH_NativeVSync_Create(DEMO_NAME, strlen(DEMO_NAME));
    if (nativeVsync_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "Create NativeVSync failed.");
        return false;
    }
    OH_NativeVSync_RequestFrame(nativeVsync_, &RenderThread::OnVsync, this);
    return true;
}

void RenderThread::DestroyNativeVsync()
{
    if (nativeVsync_ != nullptr) {
        OH_NativeVSync_Destroy(nativeVsync_);
        nativeVsync_ = nullptr;
    }
}

void RenderThread::OnNativeImageFrameAvailable(void *data)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread", "OnNativeImageFrameAvailable.");
    auto renderThread = static_cast<RenderThread *>(data);
    if (renderThread == nullptr) {
        return;
    }
    renderThread->availableFrameCnt_++;
    renderThread->wakeUpCond_.notify_one();    
}
// [Start Create_Native_Image]
bool RenderThread::CreateNativeImage()
{
    nativeImage_ = OH_NativeImage_Create(NATIVE_IMAGE_NEW_TEXTURE_ID, GL_TEXTURE_EXTERNAL_OES);
    if (nativeImage_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "OH_NativeImage_Create failed.");
        return false;
    }
    int ret = 0;
    {
        std::lock_guard<std::mutex> lock(nativeImageSurfaceIdMutex_);
        nativeImageWindow_ = OH_NativeImage_AcquireNativeWindow(nativeImage_);
        ret = OH_NativeImage_GetSurfaceId(nativeImage_, &nativeImageSurfaceId_);
    }
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
            "OH_NativeImage_GetSurfaceId failed, ret is %{public}d.", ret);
        return false;
    }

    nativeImageFrameAvailableListener_.context = this;
    nativeImageFrameAvailableListener_.onFrameAvailable = &RenderThread::OnNativeImageFrameAvailable;
    ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage_, nativeImageFrameAvailableListener_);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "OH_NativeImage_SetOnFrameAvailableListener failed, ret is %{public}d.", ret);
        return false;
    }

    return true;
}
// [End Create_Native_Image]

void RenderThread::DestroyNativeImage()
{
    if (nativeImageTexId_ != 0U) {
        glDeleteTextures(1, &nativeImageTexId_);
        nativeImageTexId_ = 0U;
    }

    if (nativeImage_ != nullptr) {
        OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage_);
        OH_NativeImage_Destroy(&nativeImage_);
        nativeImage_ = nullptr;
    }
}

void RenderThread::ThreadMainLoop()
{
    threadId_ = std::this_thread::get_id();
    if (!InitRenderContext()) {
        return;
    }
    if (!CreateNativeImage()) {
        return;
    }
    ConfigSceneMatrix();
    while (running_) {
        {
            OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread", "Waiting for vsync.");
            std::unique_lock<std::mutex> lock(wakeUpMutex_);
            wakeUpCond_.wait(lock, [this]() { return wakeUp_ || availableFrameCnt_ > 0; });
            wakeUp_ = false;
        }

        OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread", "Executing tasks.");
        std::vector<RenderTask> tasks;
        {
            std::lock_guard<std::mutex> lock(taskMutex_);
            tasks.swap(tasks_);
        }
        for (const auto &task : tasks) {
            task(*renderContext_);
        }

        if (availableFrameCnt_ <= 0) {
            continue;
        }
        DrawImage();
        availableFrameCnt_--;
    }
}

void RenderThread::PostTask(const RenderTask &task)
{
    if (!running_) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "RenderThread",
            "PostTask failed: RenderThread is not running");
        return;
    }
    
    {
        std::lock_guard<std::mutex> lock(taskMutex_);
        tasks_.push_back(task);
    }

    if (std::this_thread::get_id() != threadId_) {
        std::lock_guard<std::mutex> lock(wakeUpMutex_);
        wakeUp_ = true;
        wakeUpCond_.notify_one();
    }
}

void RenderThread::ConfigSceneMatrix()
{
    std::array<float, MAT4_ELEMENT_COUNT> translate_matrix = {
        1.0, 0.0, 0.0, UV_CENTER_OFFSET,
        0.0, 1.0, 0.0, UV_CENTER_OFFSET,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
    };
    std::array<float, MAT4_ELEMENT_COUNT> scale_matrix = {
        NOISE_SCALE_X, 0.0, 0.0, 0.0,
        0.0, NOISE_SCALE_Y, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
    };
    std::array<float, MAT4_ELEMENT_COUNT> rotate_matrix = {
        -1.0, 0.0, 0.0, 0.0,
        0.0, -1.0, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
    };
    std::array<float, MAT4_ELEMENT_COUNT> imageMatrixTmp;
    std::array<float, MAT4_ELEMENT_COUNT> imageMatrix;
    Detail::LeftProd(rotate_matrix.data(), scale_matrix.data(), imageMatrixTmp.data());
    Detail::LeftProd(translate_matrix.data(), imageMatrixTmp.data(), imageMatrix.data());
    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread", "isCameraFront_:%{public}d.",
                 isCameraFront_.load());
    drawImageMatrix_ = imageMatrix;
}

void RenderThread::DrawScene()
{
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    videoShader_->Use();
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    videoShader_->SetInt("tex", 0);
    videoShader_->SetMatrix4v("matTransform", drawCameraImageMatrix_.data(), MAT4_ELEMENT_COUNT, false);
    glBindVertexArray(vertexArrayObject_);
    glDrawElements(GL_TRIANGLES, RECTANGLE_INDEX_COUNT, GL_UNSIGNED_INT, RECTANGLE_INDICES);

    imageShader_->Use();
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, noiseImageTexId_);
    imageShader_->SetInt("tex", 0);
    imageShader_->SetMatrix4v("matTransform", drawImageMatrix_.data(), MAT4_ELEMENT_COUNT, true);
    glBindVertexArray(vertexArrayObject_);
    glDrawElements(GL_TRIANGLES, RECTANGLE_INDEX_COUNT, GL_UNSIGNED_INT, RECTANGLE_INDICES);
    glFinish();
}

void RenderThread::UpdateImageResource(void* data, int32_t width, int32_t height, int32_t stride, bool mipmap)
{
    glBindTexture(GL_TEXTURE_2D, noiseImageTexId_);
    if (!data) {
        constexpr uint32_t w = 32;
        constexpr uint32_t h = 32;
        constexpr uint32_t r = 720;
        constexpr uint32_t g = A2R10G10B10_10BIT_MAX;
        constexpr uint32_t b = 0;
        constexpr uint32_t a = A2R10G10B10_2BIT_ALPHA_MAX;
        constexpr uint32_t mockColor = (a << A2R10G10B10_ALPHA_SHIFT) |
            (b << A2R10G10B10_BLUE_SHIFT) | (g << A2R10G10B10_GREEN_SHIFT) | r;
        std::vector<uint32_t> data(w * h, mockColor);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB10_A2, w, h, 0, GL_RGBA,
                     GL_UNSIGNED_INT_2_10_10_10_REV_EXT, data.data());
    } else {
        glPixelStorei(GL_UNPACK_ROW_LENGTH, static_cast<int32_t>(stride / sizeof(uint32_t)));
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB10_A2, width, height, 0,
            GL_RGBA, GL_UNSIGNED_INT_2_10_10_10_REV_EXT, data);
        glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    }
    if (mipmap) {
        glGenerateMipmap(GL_TEXTURE_2D);
    }
    glBindTexture(GL_TEXTURE_2D, 0);
}

void RenderThread::ImageDraw(OHNativeWindowBuffer *InBuffer, OHNativeWindowBuffer *OutBuffer, ViewportParams vp)
{
    EGLImageKHR imgIn = renderContext_->CreateEGLImage(InBuffer);
    EGLImageKHR imgOut = renderContext_->CreateEGLImage(OutBuffer);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, inTexId_);
    renderContext_->EGLImageTargetTexture2DOES(imgIn);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, GL_NONE);
    glBindFramebuffer(GL_FRAMEBUFFER, vertexFrameObject_);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, outTexId_);
    renderContext_->EGLImageTargetTexture2DOES(imgOut);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_EXTERNAL_OES, outTexId_, 0);
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread", "glCheckFramebufferStatus failed");
        return;
    }
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, GL_NONE);

    OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_PRINT_DOMAIN, "RenderThread",
                 "DrawImagefhm. vp %{public}d %{public}d %{public}d %{public}d",
                 vp.x, vp.y, vp.width, vp.height);
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    glViewport(vp.x, vp.y, vp.width, vp.height);
    frameShader_->Use();
    frameShader_->SetMatrix4v("matTransform", drawCameraImageMatrix_.data(), MAT4_ELEMENT_COUNT, false);
    glBindVertexArray(vertexArrayObject_);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, inTexId_);
    glDrawElements(GL_TRIANGLES, RECTANGLE_INDEX_COUNT, GL_UNSIGNED_INT, Detail::g_indices);
    
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, 0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);
    glUseProgram(0);
    glFinish();
    renderContext_->DeleteEGLImage(imgIn);
    renderContext_->DeleteEGLImage(imgOut);
}

// [Start roi_overlay_drawing]
void RenderThread::DrawRoiOverlay(OHNativeWindowBuffer *outBuffer, ViewportParams vp, const std::string& roiStr)
{
    if (roiStr.empty() || !roiShader_ || !roiShader_->Valid()) {
        return;
    }

    // Parse ROI string
    uint32_t roiCount = 0;
    OH_AVErrCode ret = OH_VideoMetadata_GetRoiCount(roiStr.c_str(), &roiCount);
    if (ret != AV_ERR_OK || roiCount == 0) {
        return;
    }

    constexpr uint32_t MAX_ROI_CAPACITY = 8;
    std::vector<OH_AVFormat*> parsedFormats(std::min(roiCount, MAX_ROI_CAPACITY), nullptr);
    uint32_t actualCount = 0;
    ret = OH_VideoMetadata_ParseRoiString(roiStr.c_str(), parsedFormats.data(),
        std::min(roiCount, MAX_ROI_CAPACITY), &actualCount);
    if (ret != AV_ERR_OK || actualCount == 0) {
        return;
    }

    // Create EGLImage for outBuffer and set up FBO (draw on top of existing content)
    EGLImageKHR imgOut = renderContext_->CreateEGLImage(outBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, vertexFrameObject_);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, outTexId_);
    renderContext_->EGLImageTargetTexture2DOES(imgOut);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_EXTERNAL_OES, outTexId_, 0);
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "DrawRoiOverlay FBO status check failed");
        for (uint32_t i = 0; i < actualCount; i++) {
            if (parsedFormats[i]) {
                OH_AVFormat_Destroy(parsedFormats[i]);
            }
        }
        renderContext_->DeleteEGLImage(imgOut);
        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        return;
    }

    // Use passed viewport (center-aligned aspect ratio)
    glViewport(vp.x, vp.y, vp.width, vp.height);

    roiShader_->Use();
    glBindVertexArray(roiVao_);
    glBindBuffer(GL_ARRAY_BUFFER, roiVbo_);

    // Compute border thickness based on viewport to ensure equal pixel width on all sides
    float desiredPixelThickness = ROI_BORDER_THICKNESS;
    float lrThickNdc = desiredPixelThickness / static_cast<float>(vp.width);
    float tbThickNdc = NDC_RANGE_SIZE * desiredPixelThickness / static_cast<float>(vp.height);

    // Compute image dimensions for NDC conversion (ROI coords are relative to image frame)
    int32_t encWidth = 0;
    int32_t encHeight = 0;
    if (encoderNativeWindow_ != nullptr) {
        OH_NativeWindow_NativeWindowHandleOpt(encoderNativeWindow_, GET_BUFFER_GEOMETRY, &encHeight, &encWidth);
    } else {
        encWidth = encoderWidth;
        encHeight = encoderHeight;
    }
    int32_t imageWidth = encWidth;
    int32_t imageHeight = encHeight;
    int imageRotation = cameraRotation_;
    if (imageRotation == CAMERA_ROTATION_NONE || imageRotation == CAMERA_ROTATION_HALF_TURN) {
        imageWidth = encHeight;
        imageHeight = encWidth;
    }
    ViewportParams imageVp{0, 0, imageWidth, imageHeight};

    DrawRoiRects(parsedFormats, actualCount, lrThickNdc, tbThickNdc, imageVp);

    glFinish();
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    renderContext_->DeleteEGLImage(imgOut);
}
// [End roi_overlay_drawing]

void RenderThread::DrawRoiRects(const std::vector<OH_AVFormat*> &parsedFormats, uint32_t actualCount,
                                float lrThickNdc, float tbThickNdc, ViewportParams vp)
{
    int32_t frameArea = vp.width * vp.height;
    for (uint32_t i = 0; i < actualCount; i++) {
        if (!parsedFormats[i]) {
            continue;
        }

        int32_t left = 0;
        int32_t top = 0;
        int32_t right = 0;
        int32_t bottom = 0;
        OH_AVFormat_GetIntValue(parsedFormats[i], OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, &left);
        OH_AVFormat_GetIntValue(parsedFormats[i], OH_MD_KEY_VIDEO_METADATA_ROI_TOP, &top);
        OH_AVFormat_GetIntValue(parsedFormats[i], OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, &right);
        OH_AVFormat_GetIntValue(parsedFormats[i], OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, &bottom);

        // Determine color: area > 1/5 of frame → red, else → green
        int32_t roiArea = (right - left) * (bottom - top);
        bool isLarge = (roiArea * ROI_AREA_RATIO_THRESHOLD > frameArea);
        float color[VEC4_COMPONENT_COUNT] = { isLarge ? 1.0f : 0.0f, isLarge ? 0.0f : 1.0f, 0.0f, 1.0f };
        roiShader_->SetFloat4v("uColor", color, VEC4_COMPONENT_COUNT);

        // Convert pixel coordinates to NDC
        float ndcXLeft = NDC_RANGE_SIZE * left / static_cast<float>(vp.width) + NDC_MIN;
        float ndcXRight = NDC_RANGE_SIZE * right / static_cast<float>(vp.width) + NDC_MIN;
        float ndcYLow = NDC_RANGE_SIZE * top / static_cast<float>(vp.height) + NDC_MIN;
        float ndcYHigh = NDC_RANGE_SIZE * bottom / static_cast<float>(vp.height) + NDC_MIN;

        DrawRoiQuad(ndcXLeft - lrThickNdc, ndcXRight + lrThickNdc, ndcYHigh, ndcYHigh + tbThickNdc);
        DrawRoiQuad(ndcXLeft - lrThickNdc, ndcXRight + lrThickNdc, ndcYLow - tbThickNdc, ndcYLow);
        DrawRoiQuad(ndcXLeft - lrThickNdc, ndcXLeft + lrThickNdc, ndcYLow - tbThickNdc, ndcYHigh + tbThickNdc);
        DrawRoiQuad(ndcXRight - lrThickNdc, ndcXRight + lrThickNdc, ndcYLow - tbThickNdc, ndcYHigh + tbThickNdc);

        OH_AVFormat_Destroy(parsedFormats[i]);
    }
}

// [Start roi_quad_drawing]
void RenderThread::DrawRoiQuad(float x1, float x2, float y1, float y2)
{
    GLfloat vertices[] = {
        x1, y1, 0.0f,
        x2, y1, 0.0f,
        x1, y2, 0.0f,
        x1, y2, 0.0f,
        x2, y1, 0.0f,
        x2, y2, 0.0f,
    };
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(vertices), vertices);
    glDrawArrays(GL_TRIANGLES, 0, ROI_QUAD_VERTICES);
}
// [End roi_quad_drawing]

std::string RenderThread::ExtractRoiFromBuffer(OHNativeWindowBuffer *InBuffer)
{
    // [Start roi_buffer_roi_extraction]
    OH_NativeBuffer *nativeBuffer = nullptr;
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(InBuffer, &nativeBuffer);
    if (ret == 0 && nativeBuffer != nullptr) {
        int32_t roiSize = 0;
        uint8_t *roiData = nullptr;
        ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer,
            OH_NativeBuffer_MetadataKey::OH_REGION_OF_INTEREST_METADATA, &roiSize, &roiData);
        if (ret == 0 && roiData != nullptr && roiSize > 0) {
            return std::string(reinterpret_cast<char*>(roiData), roiSize);
        }
    }
    // [End roi_buffer_roi_extraction]
    return "";
}

std::string RenderThread::AssembleRoiString(const std::string &currentRoiStr)
{
    // [Start roi_buffer_roi_assembly]
    if (currentRoiStr.empty()) {
        return "";
    }
    uint32_t roiCount = 0;
    OH_AVErrCode roiRet = OH_VideoMetadata_GetRoiCount(currentRoiStr.c_str(), &roiCount);
    if (roiRet != AV_ERR_OK || roiCount == 0) {
        return "";
    }
    std::vector<OH_AVFormat*> parsedFormats(roiCount, nullptr);
    uint32_t actualCount = 0;
    roiRet = OH_VideoMetadata_ParseRoiString(currentRoiStr.c_str(), parsedFormats.data(),
                                             roiCount, &actualCount);
    if (roiRet != AV_ERR_OK || actualCount == 0) {
        return "";
    }
    char *assembledStr = nullptr;
    for (uint32_t i = 0; i < actualCount; i++) {
        if (parsedFormats[i] != nullptr) {
            OH_AVFormat_SetIntValue(parsedFormats[i], OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP,
                ROI_DELTA_QP);
            OH_VideoMetadata_AppendRoiString(&assembledStr, parsedFormats[i]);
            OH_AVFormat_Destroy(parsedFormats[i]);
            parsedFormats[i] = nullptr;
        }
    }
    std::string result;
    if (assembledStr != nullptr) {
        result = std::string(assembledStr);
        free(assembledStr);
    }
    // [End roi_buffer_roi_assembly]
    return result;
}

void RenderThread::LogRoiData(const std::string &currentRoiStr, const std::string &assembledRoiStr)
{
    // ROI extraction logging
    if (!currentRoiStr.empty()) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RenderThread",
                     "ROI extracted from buffer: %{public}s", currentRoiStr.c_str());
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RenderThread", "No ROI metadata in buffer");
        if (roiFd_ >= 0) { write(roiFd_, "\n", 1); }
    }

    // ROI file logging (not in guide scope)
    if (roiFd_ >= 0) {
        if (!assembledRoiStr.empty()) {
            std::string line = assembledRoiStr + "\n";
            write(roiFd_, line.c_str(), line.size());
        } else {
            write(roiFd_, "\n", 1);
        }
    }
}

bool RenderThread::PollFence(int32_t fenceFd)
{
    if (fenceFd == -1) {
        return true;
    }
    int32_t retCode = -1;
    uint32_t timeout = FENCE_POLL_TIMEOUT_MS;
    struct pollfd pollfds = {0};
    pollfds.fd = fenceFd;
    pollfds.events = POLLIN;
    do {
        retCode = poll(&pollfds, 1, timeout);
    } while (retCode == -1 && (errno == EINTR || errno == EAGAIN));
    close(fenceFd);
    return (retCode >= 0);
}

void RenderThread::PushFrameToBufferQueue(OHNativeWindowBuffer *InBuffer, const std::string &assembledRoiStr)
{
    // [Start roi_buffer_pixel_read]
    // Buffer模式：从相机帧读取像素数据并推入帧队列
    BufferHandle *bufferHandle = OH_NativeWindow_GetBufferHandleFromNative(InBuffer);
    if (bufferHandle == nullptr) {
        return;
    }
    OH_NativeBuffer *cameraNativeBuffer = nullptr;
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(InBuffer, &cameraNativeBuffer);
    if (ret != 0 || cameraNativeBuffer == nullptr) {
        return;
    }
    void *virAddr = nullptr;
    ret = OH_NativeBuffer_Map(cameraNativeBuffer, &virAddr);
    if (ret != 0 || virAddr == nullptr) {
        return;
    }
    int32_t frameWidth = bufferHandle->width;
    int32_t frameHeight = bufferHandle->height;
    int32_t stride = bufferHandle->stride;
    int32_t frameSize = stride * frameHeight;
    FrameItem frameItem;
    frameItem.width = frameWidth;
    frameItem.height = frameHeight;
    frameItem.roiStr = assembledRoiStr;
    frameItem.pixels.resize(frameSize);
    std::copy(static_cast<uint8_t *>(virAddr),
              static_cast<uint8_t *>(virAddr) + frameSize,
              frameItem.pixels.data());
    frameQueue_->push(frameItem);
    OH_NativeBuffer_Unmap(cameraNativeBuffer);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RenderThread",
                 "Buffer模式: pushed frame to queue, size: %{public}d, ROI: %{public}s",
                 frameSize, assembledRoiStr.c_str());
    // [End roi_buffer_pixel_read]
}

void RenderThread::WriteRoiToEncoderBuffer(OHNativeWindowBuffer *OutBufferEncoder, const std::string &assembledRoiStr)
{
    // [Start roi_nativebuffer_metadata_config]
    OH_NativeBuffer *encoderNativeBuffer = nullptr;
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(OutBufferEncoder, &encoderNativeBuffer);
    if (ret == 0 && encoderNativeBuffer != nullptr) {
        int32_t roiStrSize = static_cast<int32_t>(assembledRoiStr.size());
        ret = OH_NativeBuffer_SetMetadataValue(encoderNativeBuffer,
            OH_NativeBuffer_MetadataKey::OH_REGION_OF_INTEREST_METADATA,
            roiStrSize, reinterpret_cast<uint8_t*>(const_cast<char*>(assembledRoiStr.data())));
        if (ret != 0) {
            OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "RenderThread",
                         "OH_NativeBuffer_SetMetadataValue failed, ret: %{public}d", ret);
        } else {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RenderThread",
                         "ROI metadata written to encoder buffer: %{public}s", assembledRoiStr.c_str());
        }
    }
    // [End roi_nativebuffer_metadata_config]
}

bool RenderThread::AcquireInputBuffer(OHNativeWindowBuffer **outBuffer, int32_t *outFenceFd)
{
    if (eglSurface_ == EGL_NO_SURFACE) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "RenderThread", "eglSurface_ is EGL_NO_SURFACE");
        return false;
    }

    int32_t ret = OH_NativeImage_AcquireNativeWindowBuffer(nativeImage_, outBuffer, outFenceFd);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "OH_NativeImage_AcquireNativeWindowBuffer failed, ret: %{public}d", ret);
        return false;
    }

    ret = OH_NativeWindow_NativeObjectReference(*outBuffer);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "OH_NativeWindow_NativeObjectReference failed, ret: %{public}d", ret);
        return false;
    }

    if (OH_NativeImage_GetTransformMatrixV2(nativeImage_, drawCameraImageMatrix_.data())) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN,
                     "RenderThread", "OH_NativeImage_GetTransformMatrix failed!");
        return false;
    }
    return true;
}

bool RenderThread::RequestOutputBuffers(OHNativeWindowBuffer **outPreviewBuffer,
                                         OHNativeWindowBuffer **outEncoderBuffer)
{
    int32_t fenceFd2 = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow_, outPreviewBuffer, &fenceFd2);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "OH_NativeWindow_NativeWindowRequestBuffer for preview failed, ret: %{public}d", ret);
        return false;
    }
    PollFence(fenceFd2);

    *outEncoderBuffer = nullptr;
    if (roiPathType_ == ROI_PATH_NATIVEBUFFER || roiPathType_ == ROI_PATH_METADATA_CALLBACK) {
        int32_t fenceFd3 = -1;
        ret = OH_NativeWindow_NativeWindowRequestBuffer(encoderNativeWindow_, outEncoderBuffer, &fenceFd3);
        if (ret != 0) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                         "OH_NativeWindow_NativeWindowRequestBuffer for encoder failed, ret: %{public}d", ret);
            return false;
        }
        PollFence(fenceFd3);
    }
    return true;
}

std::pair<ViewportParams, ViewportParams> RenderThread::ComputeDrawViewports()
{
    int viewWidth = 0;
    int viewHeight = 0;
    if (encoderNativeWindow_ != nullptr) {
        OH_NativeWindow_NativeWindowHandleOpt(encoderNativeWindow_, GET_BUFFER_GEOMETRY, &viewHeight, &viewWidth);
    } else {
        viewWidth = encoderWidth;
        viewHeight = encoderHeight;
    }
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(xcomponentWindows_, GET_BUFFER_GEOMETRY,
        &xcomponentHeight_, &xcomponentWidth_);
    if (ret != 0 || xcomponentHeight_ == 0 || xcomponentWidth_ == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RenderThread",
                     "OH_NativeWindow_NativeWindowHandleOpt get Xcomponent size failed!");
    }

    int imageRotation = cameraRotation_;
    ViewportParams previewVp;
    ViewportParams encoderVp;
    if (imageRotation == CAMERA_ROTATION_NONE || imageRotation == CAMERA_ROTATION_HALF_TURN) {
        previewVp = ComputeCenteredViewport(viewHeight, viewWidth, xcomponentWidth_, xcomponentHeight_);
        encoderVp = ComputeCenteredViewport(viewHeight, viewWidth, viewWidth, viewHeight);
    } else {
        previewVp = ComputeCenteredViewport(viewWidth, viewHeight, xcomponentWidth_, xcomponentHeight_);
        encoderVp = ComputeCenteredViewport(viewWidth, viewHeight, viewWidth, viewHeight);
    }
    return {previewVp, encoderVp};
}

void RenderThread::FlushAndCleanup(OHNativeWindowBuffer *InBuffer, int32_t fenceFd1,
                                    OHNativeWindowBuffer *OutBuffer, OHNativeWindowBuffer *OutBufferEncoder)
{
    OH_NativeWindow_NativeObjectUnreference(InBuffer);
    OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage_, InBuffer, fenceFd1);

    Region region{nullptr, 0};
    int acquireFenceFd = -1;
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow_, OutBuffer, acquireFenceFd, region);
    if (OutBufferEncoder != nullptr) {
        OH_NativeWindow_NativeWindowFlushBuffer(encoderNativeWindow_, OutBufferEncoder, acquireFenceFd, region);
    }
}

void RenderThread::DrawImage()
{
    OHNativeWindowBuffer *InBuffer = nullptr;
    int32_t fenceFd1 = -1;
    if (!AcquireInputBuffer(&InBuffer, &fenceFd1)) {
        return;
    }

    std::string currentRoiStr;
    std::string assembledRoiStr;
    if (isOpenROI_) {
        currentRoiStr = ExtractRoiFromBuffer(InBuffer);
        assembledRoiStr = AssembleRoiString(currentRoiStr);
        LogRoiData(currentRoiStr, assembledRoiStr);
    }

    // [Start roi_parameter_callback_str_passing]
    int64_t pts = OH_NativeImage_GetTimestamp(nativeImage_);
    if (roiPathType_ == ROI_PATH_METADATA_CALLBACK && onRoiStrAssembled_) {
        onRoiStrAssembled_(pts, assembledRoiStr);
    }
    // [End roi_parameter_callback_str_passing]

    OHNativeWindowBuffer *OutBuffer = nullptr;
    OHNativeWindowBuffer *OutBufferEncoder = nullptr;
    if (!RequestOutputBuffers(&OutBuffer, &OutBufferEncoder)) {
        return;
    }

    // [Start roi_render_flow]
    auto [previewVp, encoderVp] = ComputeDrawViewports();
    ImageDraw(InBuffer, OutBuffer, previewVp);
    if (isOpenROI_) {
        DrawRoiOverlay(OutBuffer, previewVp, currentRoiStr);
    }
    if (OutBufferEncoder != nullptr) {
        ImageDraw(InBuffer, OutBufferEncoder, encoderVp);
    }
    // [End roi_render_flow]

    if (roiPathType_ == ROI_PATH_BUFFER_MODE && frameQueue_ != nullptr) {
        PushFrameToBufferQueue(InBuffer, assembledRoiStr);
    }
    if (roiPathType_ == ROI_PATH_NATIVEBUFFER && isOpenROI_ &&
        !assembledRoiStr.empty() && OutBufferEncoder != nullptr) {
        WriteRoiToEncoderBuffer(OutBufferEncoder, assembledRoiStr);
    }

    FlushAndCleanup(InBuffer, fenceFd1, OutBuffer, OutBufferEncoder);
}

OH_NativeImage *RenderThread::GetNativeImageEncoder()
{
    return nativeImage_;
}

void RenderThread::SetCameraFront(bool isCameraFront)
{
    isCameraFront_ = isCameraFront;
}

void RenderThread::UpdateCameraRotation(int rotation)
{
    cameraRotation_ = rotation;
}
} // namespace NativeXComponentSample
