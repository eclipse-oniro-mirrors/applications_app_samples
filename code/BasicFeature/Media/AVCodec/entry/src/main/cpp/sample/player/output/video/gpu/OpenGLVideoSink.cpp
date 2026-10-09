/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "OpenGLVideoSink.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <thread>
#include <utility>

#include "../renderer/HdrMetadataHelper.h"
#include "VideoFrameConverter.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "OpenGLVideoSink"

namespace {
constexpr EGLint COLOR_CHANNEL_BITS = 8;
constexpr EGLint CONFIG_ATTRIBUTES[] = {
    EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
    EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT,
    EGL_RED_SIZE, COLOR_CHANNEL_BITS, EGL_GREEN_SIZE, COLOR_CHANNEL_BITS,
    EGL_BLUE_SIZE, COLOR_CHANNEL_BITS, EGL_ALPHA_SIZE, COLOR_CHANNEL_BITS,
    EGL_NONE
};
constexpr EGLint OPENGL_ES_VERSION = 2;
constexpr EGLint CONTEXT_ATTRIBUTES[] = { EGL_CONTEXT_CLIENT_VERSION, OPENGL_ES_VERSION, EGL_NONE };
constexpr int32_t EGL_SURFACE_CREATE_RETRY_COUNT = 3;
constexpr auto EGL_SURFACE_CREATE_RETRY_DELAY = std::chrono::milliseconds(20);
constexpr auto FRAME_AVAILABLE_WAIT_TIMEOUT = std::chrono::milliseconds(20);
constexpr int32_t DEGREES_PER_TURN = 360;
constexpr int32_t ROTATION_90 = 90;
constexpr int32_t ROTATION_180 = 180;
constexpr int32_t ROTATION_270 = 270;
constexpr GLint TEXTURE_UNIT_INDEX = 0;
constexpr GLint VERTEX_COMPONENT_COUNT = 2;
constexpr GLsizei VERTEX_COUNT = 4;
constexpr int32_t MIN_VIEWPORT_DIMENSION = 1;
constexpr GLfloat OPAQUE_ALPHA = 1.0F;
constexpr size_t TEXTURE_COORDINATE_COUNT = 8;
constexpr size_t TEXTURE_MATRIX_ELEMENT_COUNT = 16;
constexpr char VERTEX_SHADER[] =
    "attribute vec2 aPosition;"
    "attribute vec2 aTexCoord;"
    "uniform mat4 uTextureMatrix;"
    "varying vec2 vTexCoord;"
    "void main() { gl_Position = vec4(aPosition, 0.0, 1.0); "
    "vTexCoord = (uTextureMatrix * vec4(aTexCoord, 0.0, 1.0)).xy; }";
constexpr char FRAGMENT_SHADER[] =
    "precision mediump float;"
    "uniform sampler2D uTexture;"
    "varying vec2 vTexCoord;"
    "void main() { gl_FragColor = texture2D(uTexture, vTexCoord); }";
constexpr char EXTERNAL_FRAGMENT_SHADER[] =
    "#extension GL_OES_EGL_image_external : require\n"
    "precision mediump float;"
    "uniform samplerExternalOES uTexture;"
    "varying vec2 vTexCoord;"
    "void main() { gl_FragColor = texture2D(uTexture, vTexCoord); }";

constexpr GLfloat POSITIONS[] = {
    -1.0F, -1.0F, 1.0F, -1.0F, -1.0F, 1.0F, 1.0F, 1.0F
};
using TextureCoordinates = std::array<GLfloat, TEXTURE_COORDINATE_COUNT>;

constexpr TextureCoordinates NORMALIZED_TEX_COORDS = {
    0.0F, 0.0F, 1.0F, 0.0F, 0.0F, 1.0F, 1.0F, 1.0F
};
constexpr TextureCoordinates FLIPPED_TEX_COORDS = {
    0.0F, 1.0F, 1.0F, 1.0F, 0.0F, 0.0F, 1.0F, 0.0F
};
constexpr TextureCoordinates ROTATE_90_TEX_COORDS = {
    1.0F, 1.0F, 1.0F, 0.0F, 0.0F, 1.0F, 0.0F, 0.0F
};
constexpr TextureCoordinates ROTATE_180_TEX_COORDS = {
    1.0F, 0.0F, 0.0F, 0.0F, 1.0F, 1.0F, 0.0F, 1.0F
};
constexpr TextureCoordinates ROTATE_270_TEX_COORDS = {
    0.0F, 0.0F, 0.0F, 1.0F, 1.0F, 0.0F, 1.0F, 1.0F
};
constexpr GLfloat IDENTITY_MATRIX[] = {
    1.0F, 0.0F, 0.0F, 0.0F,
    0.0F, 1.0F, 0.0F, 0.0F,
    0.0F, 0.0F, 1.0F, 0.0F,
    0.0F, 0.0F, 0.0F, 1.0F
};

int32_t NormalizeRotation(int32_t rotation);

struct Viewport {
    int32_t x = 0;
    int32_t y = 0;
    int32_t width = 0;
    int32_t height = 0;
};

Viewport CalculateViewport(int32_t sourceWidth, int32_t sourceHeight, int32_t rotation,
    int32_t targetWidth, int32_t targetHeight)
{
    if (sourceWidth <= 0 || sourceHeight <= 0 || targetWidth <= 0 || targetHeight <= 0) {
        return {};
    }
    const int32_t normalizedRotation = NormalizeRotation(rotation);
    const bool swapsDimensions = normalizedRotation == ROTATION_90 || normalizedRotation == ROTATION_270;
    const int32_t displayWidth = swapsDimensions ? sourceHeight : sourceWidth;
    const int32_t displayHeight = swapsDimensions ? sourceWidth : sourceHeight;
    const double scale = std::min(static_cast<double>(targetWidth) / displayWidth,
        static_cast<double>(targetHeight) / displayHeight);
    const int32_t viewportWidth = std::max(MIN_VIEWPORT_DIMENSION, static_cast<int32_t>(displayWidth * scale));
    const int32_t viewportHeight = std::max(MIN_VIEWPORT_DIMENSION, static_cast<int32_t>(displayHeight * scale));
    return { (targetWidth - viewportWidth) / VERTEX_COMPONENT_COUNT,
        (targetHeight - viewportHeight) / VERTEX_COMPONENT_COUNT, viewportWidth, viewportHeight };
}

const TextureCoordinates &GetRgbaTextureCoordinates(int32_t rotation)
{
    switch (NormalizeRotation(rotation)) {
        case ROTATION_90:
            return ROTATE_90_TEX_COORDS;
        case ROTATION_180:
            return ROTATE_180_TEX_COORDS;
        case ROTATION_270:
            return ROTATE_270_TEX_COORDS;
        default:
            return FLIPPED_TEX_COORDS;
    }
}

void SetTextureParameters(GLenum target)
{
    glTexParameteri(target, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(target, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(target, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
}

GLuint CompileShader(GLenum type, const char *source)
{
    GLuint shader = glCreateShader(type);
    if (shader == 0) {
        return 0;
    }
    glShaderSource(shader, 1, &source, nullptr);
    glCompileShader(shader);
    GLint compiled = GL_FALSE;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (compiled == GL_TRUE) {
        return shader;
    }
    glDeleteShader(shader);
    return 0;
}

GLuint LinkProgram(GLuint vertex, GLuint fragment)
{
    const GLuint program = glCreateProgram();
    if (program == 0) {
        return 0;
    }
    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);
    GLint linked = GL_FALSE;
    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (linked == GL_TRUE) {
        return program;
    }
    glDeleteProgram(program);
    return 0;
}

struct ShaderProgramResource {
    GLuint program = 0;
    GLuint texture = 0;
    GLint textureLocation = -1;
    GLint positionLocation = -1;
    GLint texCoordLocation = -1;
};

bool ConfigureWindowForGpu(OHNativeWindow *window, int32_t width, int32_t height)
{
    if (window == nullptr || width <= 0 || height <= 0) {
        return false;
    }
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, width, height);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set OpenGL window geometry failed: %{public}d", ret);
        return false;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set OpenGL window format failed: %{public}d", ret);
        return false;
    }
    const uint64_t usage = NATIVEBUFFER_USAGE_HW_RENDER | NATIVEBUFFER_USAGE_HW_TEXTURE;
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_USAGE, usage);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set OpenGL window usage failed: %{public}d", ret);
        return false;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, NATIVEBUFFER_ROTATE_NONE);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Reset OpenGL window transform failed: %{public}d", ret);
        return false;
    }
    return OH_NativeWindow_NativeWindowSetScalingModeV2(window, OH_SCALING_MODE_SCALE_FIT_V2) == 0;
}

int32_t NormalizeRotation(int32_t rotation)
{
    int32_t normalized = rotation % DEGREES_PER_TURN;
    if (normalized < 0) {
        normalized += DEGREES_PER_TURN;
    }
    return normalized == ROTATION_90 || normalized == ROTATION_180 || normalized == ROTATION_270 ? normalized : 0;
}

bool IsHdrOrTenBit(const VideoPresentRequest &request)
{
    if (request.sampleInfo.codec.convertHdrVividToBt709) {
        return false;
    }
    const bool hevcTenBit = IsTenBitHevcOutput(request.sampleInfo.video);
    return request.sampleInfo.video.hdrVividContainerSignaled || request.sampleInfo.video.isHDRVivid != 0 ||
        hevcTenBit ||
        request.context.outputPixelFormat == AV_PIXEL_FORMAT_RGBA1010102 ||
        HdrMetadataHelper::IsHdrVivid(request.bufferInfo.buffer);
}

bool RequiresDirectSurfaceHdrPreservation(const SampleInfo &sampleInfo)
{
    if (sampleInfo.codec.convertHdrVividToBt709) {
        return false;
    }
    return sampleInfo.video.hdrVividContainerSignaled || sampleInfo.video.isHDRVivid != 0 ||
        IsTenBitHevcOutput(sampleInfo.video);
}

bool CreateShaderProgram(const char *fragmentSource, ShaderProgramResource &resource)
{
    const GLuint vertex = CompileShader(GL_VERTEX_SHADER, VERTEX_SHADER);
    const GLuint fragment = CompileShader(GL_FRAGMENT_SHADER, fragmentSource);
    if (vertex == 0 || fragment == 0) {
        if (vertex != 0) {
            glDeleteShader(vertex);
        }
        if (fragment != 0) {
            glDeleteShader(fragment);
        }
        return false;
    }
    resource.program = LinkProgram(vertex, fragment);
    glDeleteShader(vertex);
    glDeleteShader(fragment);
    if (resource.program == 0) {
        return false;
    }
    glGenTextures(1, &resource.texture);
    resource.textureLocation = glGetUniformLocation(resource.program, "uTexture");
    resource.positionLocation = glGetAttribLocation(resource.program, "aPosition");
    resource.texCoordLocation = glGetAttribLocation(resource.program, "aTexCoord");
    if (resource.texture == 0 || resource.textureLocation < 0 || resource.positionLocation < 0 ||
        resource.texCoordLocation < 0) {
        glDeleteTextures(1, &resource.texture);
        resource.texture = 0;
        glDeleteProgram(resource.program);
        resource.program = 0;
        return false;
    }
    return true;
}
}

OpenGLVideoSink::~OpenGLVideoSink()
{
    Reset();
}

bool OpenGLVideoSink::CreateProgram()
{
    ShaderProgramResource resource;
    if (!CreateShaderProgram(FRAGMENT_SHADER, resource)) {
        return false;
    }
    program_ = resource.program;
    texture_ = resource.texture;
    textureLocation_ = resource.textureLocation;
    positionLocation_ = resource.positionLocation;
    texCoordLocation_ = resource.texCoordLocation;
    textureMatrixLocation_ = glGetUniformLocation(program_, "uTextureMatrix");
    return texture_ != 0 && textureLocation_ >= 0 && textureMatrixLocation_ >= 0 && positionLocation_ >= 0 &&
        texCoordLocation_ >= 0;
}

bool OpenGLVideoSink::CreateExternalProgram()
{
    ShaderProgramResource resource;
    if (!CreateShaderProgram(EXTERNAL_FRAGMENT_SHADER, resource)) {
        return false;
    }
    externalProgram_ = resource.program;
    externalTexture_ = resource.texture;
    externalTextureLocation_ = resource.textureLocation;
    externalPositionLocation_ = resource.positionLocation;
    externalTexCoordLocation_ = resource.texCoordLocation;
    externalTextureMatrixLocation_ = glGetUniformLocation(externalProgram_, "uTextureMatrix");
    return externalProgram_ != 0 && externalTextureMatrixLocation_ >= 0 && externalPositionLocation_ >= 0 &&
        externalTexCoordLocation_ >= 0;
}

bool OpenGLVideoSink::PrepareEglContext(const OutputTarget &target)
{
    for (int32_t attempt = 0; attempt < EGL_SURFACE_CREATE_RETRY_COUNT; ++attempt) {
        if (EnsureContext(target)) {
            return true;
        }
        if (attempt + 1 < EGL_SURFACE_CREATE_RETRY_COUNT) {
            std::this_thread::sleep_for(EGL_SURFACE_CREATE_RETRY_DELAY);
        }
    }
    return false;
}

bool OpenGLVideoSink::PrepareNativeImage(int32_t width, int32_t height)
{
    DestroyNativeImage();
    if (!CreateNativeImage(width, height) || !ReleaseCurrentContext()) {
        DestroyNativeImage();
        return false;
    }
    return true;
}

OHNativeWindow *OpenGLVideoSink::PrepareForPlayback(const SampleInfo &sampleInfo)
{
    auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    directSurfaceFallback_ = RequiresDirectSurfaceHdrPreservation(sampleInfo);
    if (directSurfaceFallback_) {
        // NativeImage 外部纹理能提供纹理像素和变换，但不能提供附着在每个解码输出上的 HDR Vivid
        // 动态元数据。将此类码流直接送入 XComponent，可让系统 Surface 路径保留解码器的元数据、
        // 精度和变换，避免 OpenGL 合成呈现为 SDR 效果。
        DestroyNativeImage();
        ReleaseGlResources();
        fallbackOnly_ = false;
        // 直连 Surface 会被 decoder 持续使用。sink 保留租约，直到播放器先销毁 codec 后调用 Reset()。
        directSurfaceWindowLease_ = std::move(windowLease);
        OHNativeWindow *directWindow = directSurfaceWindowLease_.GetWindow();
        surfaceDecoderReady_ = directWindow != nullptr;
        if (surfaceDecoderReady_) {
            AVCODEC_SAMPLE_LOGW("OpenGL HDR/10-bit stream uses direct Surface output to preserve decoder metadata");
        } else {
            AVCODEC_SAMPLE_LOGW("OpenGL HDR/10-bit direct Surface is unavailable");
        }
        return directWindow;
    }
    // 前一次直连 Surface 已在创建下一条流前随 codec 释放，此处可以解除旧引用。
    directSurfaceWindowLease_ = {};
    OHNativeWindow *window = windowLease.GetWindow();
    if (window != nullptr && !HdrMetadataHelper::ResetNativeWindowSdrMetadata(window)) {
        // 色彩元数据只是可选的送显提示。设备即使拒绝该提示，
        // 仍应能够创建普通 8-bit OpenGL 输出 Surface。
        AVCODEC_SAMPLE_LOGW("Reset OpenGL output color metadata to SDR failed");
    }
    int32_t surfaceWidth = windowLease.GetWidth();
    int32_t surfaceHeight = windowLease.GetHeight();
    const int32_t imageWidth = sampleInfo.video.videoWidth;
    const int32_t imageHeight = sampleInfo.video.videoHeight;
    if (surfaceWidth <= 0 || surfaceHeight <= 0) {
        surfaceWidth = imageWidth;
        surfaceHeight = imageHeight;
    }
    const OutputTarget target { window, surfaceWidth, surfaceHeight, windowLease.GetGeneration() };
    const bool contextReady = window != nullptr && imageWidth > 0 && imageHeight > 0 && PrepareEglContext(target);
    if (!contextReady || !PrepareNativeImage(imageWidth, imageHeight)) {
        AVCODEC_SAMPLE_LOGW("OpenGL Surface decoder preparation failed: EGL context unavailable");
        return nullptr;
    }
    surfaceDecoderReady_ = true;
    return decoderWindow_;
}

bool OpenGLVideoSink::CreateNativeImage(int32_t width, int32_t height)
{
    if (externalTexture_ == 0 && !CreateExternalProgram()) {
        AVCODEC_SAMPLE_LOGW("OpenGL Surface decoder preparation failed: external shader unavailable");
        return false;
    }
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, externalTexture_);
    SetTextureParameters(GL_TEXTURE_EXTERNAL_OES);
    nativeImage_ = OH_NativeImage_Create(externalTexture_, GL_TEXTURE_EXTERNAL_OES);
    if (nativeImage_ == nullptr || OH_NativeImage_AttachContext(nativeImage_, externalTexture_) != 0) {
        AVCODEC_SAMPLE_LOGW("OpenGL Surface decoder preparation failed: NativeImage unavailable");
        if (nativeImage_ != nullptr) {
            OH_NativeImage_Destroy(&nativeImage_);
        }
        return false;
    }
    const int32_t ret = OH_ConsumerSurface_SetDefaultSize(nativeImage_, width, height);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set NativeImage size failed: %{public}d", ret);
        DestroyNativeImage();
        return false;
    }
    // 回调只递增原子帧计数并唤醒等待线程，不访问 EGL。
    // NativeImage 更新和绘制仍由送显线程完成，回调线程不绑定 EGL 上下文。
    OH_OnFrameAvailableListener listener { this, &OpenGLVideoSink::OnFrameAvailable };
    if (OH_NativeImage_SetOnFrameAvailableListener(nativeImage_, listener) != 0) {
        AVCODEC_SAMPLE_LOGW("Set NativeImage listener failed");
        DestroyNativeImage();
        return false;
    }
    decoderWindow_ = OH_NativeImage_AcquireNativeWindow(nativeImage_);
    if (decoderWindow_ == nullptr) {
        AVCODEC_SAMPLE_LOGW("Acquire NativeImage producer window failed");
        DestroyNativeImage();
        return false;
    }
    return true;
}

void OpenGLVideoSink::OnFrameAvailable(void *context)
{
    auto *sink = static_cast<OpenGLVideoSink *>(context);
    if (sink == nullptr) {
        return;
    }
    sink->availableFrameCount_.fetch_add(1);
    sink->frameCondition_.notify_one();
}

void OpenGLVideoSink::DestroyNativeImage()
{
    if (nativeImage_ != nullptr) {
        // 先注销回调并解除纹理上下文，再销毁 NativeImage，防止释放后回调访问 sink。
        (void)OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage_);
        (void)OH_NativeImage_DetachContext(nativeImage_);
        OH_NativeImage_Destroy(&nativeImage_);
    }
    decoderWindow_ = nullptr;
    surfaceDecoderReady_ = false;
    availableFrameCount_.store(0);
    if (externalTexture_ != 0) {
        glDeleteTextures(1, &externalTexture_);
        externalTexture_ = 0;
    }
    if (externalProgram_ != 0) {
        glDeleteProgram(externalProgram_);
        externalProgram_ = 0;
    }
    externalTextureLocation_ = -1;
}

bool OpenGLVideoSink::WaitForFrame()
{
    if (availableFrameCount_.load() == 0) {
        std::unique_lock<std::mutex> lock(frameMutex_);
        frameCondition_.wait_for(lock, FRAME_AVAILABLE_WAIT_TIMEOUT, [this]() {
            return availableFrameCount_.load() > 0 || nativeImage_ == nullptr;
        });
    }
    return availableFrameCount_.load() > 0;
}

bool OpenGLVideoSink::DrawExternalImage(int32_t width, int32_t height, int32_t rotation)
{
    if (nativeImage_ == nullptr || externalProgram_ == 0 || externalTexture_ == 0) {
        return false;
    }
    if (!WaitForFrame()) {
        return true;
    }
    const int32_t updateRet = OH_NativeImage_UpdateSurfaceImage(nativeImage_);
    if (updateRet != 0) {
        AVCODEC_SAMPLE_LOGW("Update OpenGL NativeImage failed, ret: %{public}d", updateRet);
        return false;
    }
    availableFrameCount_.fetch_sub(1);
    std::array<float, TEXTURE_MATRIX_ELEMENT_COUNT> textureMatrix = {};
    const int32_t matrixRet = OH_NativeImage_GetTransformMatrixV2(nativeImage_, textureMatrix.data());
    if (matrixRet != 0) {
        AVCODEC_SAMPLE_LOGW("Get OpenGL NativeImage transform matrix failed, ret: %{public}d", matrixRet);
        return false;
    }
    if (!ConfigureViewport(width, height, rotation)) {
        return false;
    }
    glClearColor(0.0F, 0.0F, 0.0F, OPAQUE_ALPHA);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(externalProgram_);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, externalTexture_);
    glUniform1i(externalTextureLocation_, TEXTURE_UNIT_INDEX);
    glUniformMatrix4fv(externalTextureMatrixLocation_, 1, GL_FALSE, textureMatrix.data());
    // UpdateSurfaceImage() 后 NativeImage 返回完整的生产者变换，其中包含 codec 输出的裁剪、方向和
    // OpenGL 纹理原点转换。若再次把容器旋转应用到这些坐标，横屏帧会多转 180 度，竖屏内容也会横置。
    // 因此此处保持 NativeImage 的标准坐标，容器旋转只用于上方计算信箱显示区域。
    glEnableVertexAttribArray(externalPositionLocation_);
    glEnableVertexAttribArray(externalTexCoordLocation_);
    glVertexAttribPointer(externalPositionLocation_, VERTEX_COMPONENT_COUNT, GL_FLOAT, GL_FALSE, 0, POSITIONS);
    glVertexAttribPointer(externalTexCoordLocation_, VERTEX_COMPONENT_COUNT, GL_FLOAT, GL_FALSE, 0,
        NORMALIZED_TEX_COORDS.data());
    glDrawArrays(GL_TRIANGLE_STRIP, 0, VERTEX_COUNT);
    glDisableVertexAttribArray(externalPositionLocation_);
    glDisableVertexAttribArray(externalTexCoordLocation_);
    const GLenum glError = glGetError();
    if (glError != GL_NO_ERROR) {
        AVCODEC_SAMPLE_LOGW("Draw OpenGL NativeImage failed: %{public}x", static_cast<uint32_t>(glError));
        return false;
    }
    if (eglSwapBuffers(display_, surface_) != EGL_TRUE) {
        AVCODEC_SAMPLE_LOGW("Swap OpenGL NativeImage frame failed: %{public}x",
            static_cast<uint32_t>(eglGetError()));
        return false;
    }
    return true;
}

bool OpenGLVideoSink::ConfigureViewport(int32_t width, int32_t height, int32_t rotation)
{
    const Viewport viewport = CalculateViewport(width, height, rotation, width_, height_);
    if (viewport.width <= 0 || viewport.height <= 0) {
        return false;
    }
    glViewport(viewport.x, viewport.y, viewport.width, viewport.height);
    return true;
}

bool OpenGLVideoSink::PresentSurface(const VideoPresentRequest &request)
{
    // Surface 解码模式下，FreeOutputBuffer(..., true, ...) 将帧交给 NativeImage 生产者队列。
    // 调用后不能再访问该 codec Buffer，图像到达由 OnFrameAvailable 通知。
    const int32_t freeRet = request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, request.render,
        request.renderTimestamp);
    if (freeRet != AVCODEC_SAMPLE_ERR_OK || !request.render) {
        (void)ReleaseCurrentContext();
        return freeRet == AVCODEC_SAMPLE_ERR_OK;
    }
    if (eglMakeCurrent(display_, surface_, surface_, context_) != EGL_TRUE) {
        AVCODEC_SAMPLE_LOGW("Bind OpenGL presentation context failed: %{public}x",
            static_cast<uint32_t>(eglGetError()));
        return false;
    }
    const int32_t width = request.context.width > 0 ? request.context.width : request.sampleInfo.video.videoWidth;
    const int32_t height = request.context.height > 0 ? request.context.height : request.sampleInfo.video.videoHeight;
    const bool presented = DrawExternalImage(width, height, request.sampleInfo.video.rotation);
    // codec 回调可能由不同的 FFRT 工作线程分发。不能把 EGL 绑定到恰好渲染了上一帧的工作线程。
    return ReleaseCurrentContext() && presented;
}

bool OpenGLVideoSink::ReleaseCurrentContext()
{
    if (display_ == EGL_NO_DISPLAY || context_ == EGL_NO_CONTEXT || eglGetCurrentContext() != context_) {
        return true;
    }
    if (eglMakeCurrent(display_, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT) == EGL_TRUE) {
        return true;
    }
    AVCODEC_SAMPLE_LOGW("Release OpenGL context failed: %{public}x", static_cast<uint32_t>(eglGetError()));
    return false;
}

bool OpenGLVideoSink::EnsureContext(const OutputTarget &target)
{
    if (target.window == nullptr || target.width <= 0 || target.height <= 0) {
        return false;
    }
    if (display_ != EGL_NO_DISPLAY && window_ == target.window && windowGeneration_ == target.generation) {
        return BindExistingContext(target.width, target.height);
    }
    auto targetLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!targetLease || targetLease.GetWindow() != target.window || targetLease.GetGeneration() != target.generation) {
        return false;
    }
    if (!ConfigureWindowForGpu(target.window, target.width, target.height)) {
        return false;
    }
    ReleaseGlResources();
    if (!CreateContextResources(target)) {
        return false;
    }
    // EGL Window Surface 创建完成后才交接窗口租约；之后每帧只使用受该租约保护的 window_。
    outputWindowLease_ = std::move(targetLease);
    return true;
}

bool OpenGLVideoSink::BindExistingContext(int32_t width, int32_t height)
{
    if (eglMakeCurrent(display_, surface_, surface_, context_) != EGL_TRUE) {
        return false;
    }
    EGLint surfaceWidth = 0;
    EGLint surfaceHeight = 0;
    (void)eglQuerySurface(display_, surface_, EGL_WIDTH, &surfaceWidth);
    (void)eglQuerySurface(display_, surface_, EGL_HEIGHT, &surfaceHeight);
    width_ = surfaceWidth > 0 ? surfaceWidth : width_;
    height_ = surfaceHeight > 0 ? surfaceHeight : height_;
    frameWidth_ = width;
    frameHeight_ = height;
    return true;
}

bool OpenGLVideoSink::CreateEglWindowSurface(OHNativeWindow *window)
{
    surface_ = eglCreateWindowSurface(display_, config_, reinterpret_cast<EGLNativeWindowType>(window), nullptr);
    if (surface_ != EGL_NO_SURFACE) {
        return true;
    }
    AVCODEC_SAMPLE_LOGE("Create EGL window Surface failed: %{public}x", static_cast<uint32_t>(eglGetError()));
    return false;
}

bool OpenGLVideoSink::CreateEglContext()
{
    context_ = eglCreateContext(display_, config_, EGL_NO_CONTEXT, CONTEXT_ATTRIBUTES);
    if (context_ == EGL_NO_CONTEXT) {
        AVCODEC_SAMPLE_LOGE("Create EGL context failed: %{public}x", static_cast<uint32_t>(eglGetError()));
        return false;
    }
    if (eglMakeCurrent(display_, surface_, surface_, context_) == EGL_TRUE) {
        return true;
    }
    AVCODEC_SAMPLE_LOGE("Bind EGL context failed: %{public}x", static_cast<uint32_t>(eglGetError()));
    return false;
}

void OpenGLVideoSink::UpdateSurfaceExtent(int32_t fallbackWidth, int32_t fallbackHeight)
{
    EGLint surfaceWidth = 0;
    EGLint surfaceHeight = 0;
    (void)eglQuerySurface(display_, surface_, EGL_WIDTH, &surfaceWidth);
    (void)eglQuerySurface(display_, surface_, EGL_HEIGHT, &surfaceHeight);
    width_ = surfaceWidth > 0 ? surfaceWidth : fallbackWidth;
    height_ = surfaceHeight > 0 ? surfaceHeight : fallbackHeight;
}

bool OpenGLVideoSink::CreateContextResources(const OutputTarget &target)
{
    display_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (display_ == EGL_NO_DISPLAY || eglInitialize(display_, nullptr, nullptr) != EGL_TRUE) {
        AVCODEC_SAMPLE_LOGE("Initialize EGL display failed");
        ReleaseGlResources();
        return false;
    }
    EGLint configCount = 0;
    if (eglChooseConfig(display_, CONFIG_ATTRIBUTES, &config_, 1, &configCount) != EGL_TRUE || configCount == 0) {
        AVCODEC_SAMPLE_LOGE("Choose EGL config failed");
        ReleaseGlResources();
        return false;
    }
    if (eglBindAPI(EGL_OPENGL_ES_API) != EGL_TRUE) {
        AVCODEC_SAMPLE_LOGE("Bind OpenGL ES API failed");
        ReleaseGlResources();
        return false;
    }
    if (!CreateEglWindowSurface(target.window) || !CreateEglContext()) {
        ReleaseGlResources();
        return false;
    }
    if (!CreateProgram()) {
        AVCODEC_SAMPLE_LOGE("Create OpenGL shader program failed");
        ReleaseGlResources();
        return false;
    }
    eglSwapInterval(display_, 0);
    window_ = target.window;
    windowGeneration_ = target.generation;
    frameWidth_ = target.width;
    frameHeight_ = target.height;
    UpdateSurfaceExtent(target.width, target.height);
    return true;
}

bool OpenGLVideoSink::RebindOutputSurface(const OutputTarget &target)
{
    if (display_ == EGL_NO_DISPLAY || context_ == EGL_NO_CONTEXT || target.window == nullptr || target.width <= 0 ||
        target.height <= 0 || !ConfigureWindowForGpu(target.window, target.width, target.height)) {
        return false;
    }
    auto targetLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!targetLease || targetLease.GetWindow() != target.window || targetLease.GetGeneration() != target.generation) {
        return false;
    }
    // 新目标完全可用前保留旧 EGL Surface。解码器仍在向 NativeImage 生产数据，
    // 此处销毁全部 GL 资源会使该生产者失去消费者。
    EGLSurface replacement = eglCreateWindowSurface(display_, config_,
        reinterpret_cast<EGLNativeWindowType>(target.window), nullptr);
    if (replacement == EGL_NO_SURFACE) {
        AVCODEC_SAMPLE_LOGW("Create replacement EGL window Surface failed: %{public}x",
            static_cast<uint32_t>(eglGetError()));
        return false;
    }
    if (eglMakeCurrent(display_, replacement, replacement, context_) != EGL_TRUE) {
        AVCODEC_SAMPLE_LOGW("Bind replacement EGL window Surface failed: %{public}x",
            static_cast<uint32_t>(eglGetError()));
        eglDestroySurface(display_, replacement);
        return false;
    }
    EGLSurface previous = surface_;
    // previousLease 必须覆盖旧 EGL Surface 的销毁，避免先解除旧窗口引用再销毁其 Surface。
    auto previousLease = std::move(outputWindowLease_);
    surface_ = replacement;
    window_ = target.window;
    windowGeneration_ = target.generation;
    UpdateSurfaceExtent(target.width, target.height);
    if (previous != EGL_NO_SURFACE) {
        eglDestroySurface(display_, previous);
    }
    outputWindowLease_ = std::move(targetLease);
    AVCODEC_SAMPLE_LOGI("OpenGL output window rebound, generation: %{public}llu, size: %{public}d x %{public}d",
        static_cast<unsigned long long>(windowGeneration_), width_, height_);
    return true;
}

bool OpenGLVideoSink::RefreshOutputSurface(const OutputTarget &target)
{
    if (display_ == EGL_NO_DISPLAY || surface_ == EGL_NO_SURFACE || context_ == EGL_NO_CONTEXT ||
        target.window == nullptr) {
        return false;
    }
    if (window_ != target.window) {
        return RebindOutputSurface(target);
    }
    if (windowGeneration_ == target.generation) {
        return true;
    }
    // 控制栏显示或隐藏导致 XComponent 改变大小时，ArkUI 可能触发 OnSurfaceChanged。此时 NativeWindow
    // 仍是同一对象，已有 EGL 窗口 Surface 会跟随新尺寸；只刷新缓存尺寸，不能持续丢弃所有解码输出帧。
    if (eglMakeCurrent(display_, surface_, surface_, context_) != EGL_TRUE) {
        return false;
    }
    UpdateSurfaceExtent(target.width, target.height);
    windowGeneration_ = target.generation;
    AVCODEC_SAMPLE_LOGI("OpenGL output Surface refreshed, generation: %{public}llu, size: %{public}d x %{public}d",
        static_cast<unsigned long long>(windowGeneration_), width_, height_);
    return true;
}

bool OpenGLVideoSink::UploadAndDraw(const std::vector<uint8_t> &rgba, int32_t width, int32_t height,
    int32_t rotation)
{
    if (program_ == 0 || texture_ == 0 || rgba.empty()) {
        return false;
    }
    if (!ConfigureViewport(width, height, rotation)) {
        return false;
    }
    glClearColor(0.0F, 0.0F, 0.0F, OPAQUE_ALPHA);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(program_);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, texture_);
    SetTextureParameters(GL_TEXTURE_2D);
    if (textureWidth_ != width || textureHeight_ != height) {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
        textureWidth_ = width;
        textureHeight_ = height;
    }
    glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, rgba.data());
    glUniform1i(textureLocation_, TEXTURE_UNIT_INDEX);
    glUniformMatrix4fv(textureMatrixLocation_, 1, GL_FALSE, IDENTITY_MATRIX);
    const TextureCoordinates &texCoords = GetRgbaTextureCoordinates(rotation);
    glEnableVertexAttribArray(positionLocation_);
    glEnableVertexAttribArray(texCoordLocation_);
    glVertexAttribPointer(positionLocation_, VERTEX_COMPONENT_COUNT, GL_FLOAT, GL_FALSE, 0, POSITIONS);
    glVertexAttribPointer(texCoordLocation_, VERTEX_COMPONENT_COUNT, GL_FLOAT, GL_FALSE, 0, texCoords.data());
    glDrawArrays(GL_TRIANGLE_STRIP, 0, VERTEX_COUNT);
    glDisableVertexAttribArray(positionLocation_);
    glDisableVertexAttribArray(texCoordLocation_);
    return eglSwapBuffers(display_, surface_) == EGL_TRUE;
}

int32_t OpenGLVideoSink::PresentBufferFrame(const VideoPresentRequest &request, const OutputTarget &target)
{
    if (!request.render) {
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }
    if (fallbackOnly_) {
        return fallback_.Present(request);
    }
    if (IsHdrOrTenBit(request)) {
        // EGL 与 BufferRenderer 不能同时向同一个 XComponent 窗口生产内容。
        fallbackOnly_ = true;
        ReleaseGlResources();
        return fallback_.Present(request);
    }
    const int32_t frameWidth = request.context.width > 0 ? request.context.width : request.sampleInfo.video.videoWidth;
    const int32_t frameHeight = request.context.height > 0 ? request.context.height :
        request.sampleInfo.video.videoHeight;
    const OutputTarget contextTarget { target.window, frameWidth, frameHeight, target.generation };
    if (!EnsureContext(contextTarget)) {
        AVCODEC_SAMPLE_LOGW("OpenGL presentation context is unavailable, use BufferRenderer fallback");
        fallbackOnly_ = true;
        ReleaseGlResources();
        return fallback_.Present(request);
    }
    const VideoFrameConverter::FrameScaleRequest scaleRequest { { frameWidth, frameHeight }, { width_, height_ },
        request.sampleInfo.video.rotation };
    const VideoFrameConverter::FrameSize uploadSize = VideoFrameConverter::GetScaledFrameSize(scaleRequest);
    const bool rendered = VideoFrameConverter::ToRgbaScaled(request.bufferInfo, request.sampleInfo, request.context,
        uploadSize, rgbaCache_) && UploadAndDraw(rgbaCache_, uploadSize.width, uploadSize.height,
        request.sampleInfo.video.rotation);
    const bool contextReleased = ReleaseCurrentContext();
    if (!rendered || !contextReleased) {
        AVCODEC_SAMPLE_LOGW("OpenGL presentation unavailable, use BufferRenderer fallback");
        fallbackOnly_ = true;
        ReleaseGlResources();
        const int32_t fallbackRet = fallback_.Present(request);
        if (fallbackRet != AVCODEC_SAMPLE_ERR_OK) {
            return fallbackRet;
        }
        return AVCODEC_SAMPLE_ERR_OK;
    }
    return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
}

int32_t OpenGLVideoSink::Present(const VideoPresentRequest &request)
{
    if (directSurfaceFallback_) {
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, request.render,
            request.renderTimestamp);
    }
    auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!windowLease) {
        // codec 输出回调尚在清空时，XComponent 可能已销毁。
        // 目标 Surface 消失后不能再访问 EGL，也不能继续持有 codec Buffer。
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }
    const OutputTarget target { windowLease.GetWindow(), windowLease.GetWidth(), windowLease.GetHeight(),
        windowLease.GetGeneration() };
    if (!surfaceDecoderReady_) {
        return PresentBufferFrame(request, target);
    }
    if (!RefreshOutputSurface(target)) {
        AVCODEC_SAMPLE_LOGW("OpenGL target Surface is unavailable before presentation, discard decoded frame");
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }
    return PresentSurface(request) ? AVCODEC_SAMPLE_ERR_OK : AVCODEC_SAMPLE_ERR_ERROR;
}

void OpenGLVideoSink::BeginPlayback()
{
    DestroyNativeImage();
    ReleaseGlResources();
    directSurfaceWindowLease_ = {};
    fallbackOnly_ = false;
    directSurfaceFallback_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
}

void OpenGLVideoSink::ReleaseShaderPrograms()
{
    if (texture_ != 0) {
        glDeleteTextures(1, &texture_);
        texture_ = 0;
        textureWidth_ = 0;
        textureHeight_ = 0;
    }
    if (externalTexture_ != 0) {
        glDeleteTextures(1, &externalTexture_);
        externalTexture_ = 0;
    }
    textureLocation_ = -1;
    textureMatrixLocation_ = -1;
    externalTextureLocation_ = -1;
    externalTextureMatrixLocation_ = -1;
    externalPositionLocation_ = -1;
    externalTexCoordLocation_ = -1;
    positionLocation_ = -1;
    texCoordLocation_ = -1;
    if (program_ != 0) {
        glDeleteProgram(program_);
        program_ = 0;
    }
    if (externalProgram_ != 0) {
        glDeleteProgram(externalProgram_);
        externalProgram_ = 0;
    }
}

void OpenGLVideoSink::ReleaseEglObjects()
{
    (void)eglMakeCurrent(display_, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    if (surface_ != EGL_NO_SURFACE) {
        eglDestroySurface(display_, surface_);
        surface_ = EGL_NO_SURFACE;
    }
    if (context_ != EGL_NO_CONTEXT) {
        eglDestroyContext(display_, context_);
        context_ = EGL_NO_CONTEXT;
    }
    eglTerminate(display_);
    display_ = EGL_NO_DISPLAY;
}

void OpenGLVideoSink::ResetGlState()
{
    config_ = nullptr;
    window_ = nullptr;
    windowGeneration_ = 0;
    width_ = 0;
    height_ = 0;
    frameWidth_ = 0;
    frameHeight_ = 0;
}

void OpenGLVideoSink::ReleaseGlResources()
{
    if (display_ == EGL_NO_DISPLAY) {
        outputWindowLease_ = {};
        ResetGlState();
        return;
    }
    if (surface_ != EGL_NO_SURFACE && context_ != EGL_NO_CONTEXT) {
        (void)eglMakeCurrent(display_, surface_, surface_, context_);
    }
    ReleaseShaderPrograms();
    ReleaseEglObjects();
    ResetGlState();
    // EGL Surface 已全部销毁，窗口不再被 OpenGL 使用。
    outputWindowLease_ = {};
}

void OpenGLVideoSink::Reset()
{
    DestroyNativeImage();
    ReleaseGlResources();
    directSurfaceWindowLease_ = {};
    fallbackOnly_ = false;
    directSurfaceFallback_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
}
