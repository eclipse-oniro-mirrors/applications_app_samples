/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "OpenGLVideoSink.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <thread>

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
        // NativeImage external textures expose texture pixels and transforms, but not the HDR
        // Vivid dynamic metadata attached to every decoder output.  Routing this stream to the
        // XComponent directly keeps the decoder's metadata, precision and transform in the
        // system Surface path instead of presenting an SDR-looking GL composition.
        DestroyNativeImage();
        ReleaseGlResources();
        fallbackOnly_ = false;
        OHNativeWindow *directWindow = windowLease.GetWindow();
        surfaceDecoderReady_ = directWindow != nullptr;
        if (surfaceDecoderReady_) {
            AVCODEC_SAMPLE_LOGW("OpenGL HDR/10-bit stream uses direct Surface output to preserve decoder metadata");
        } else {
            AVCODEC_SAMPLE_LOGW("OpenGL HDR/10-bit direct Surface is unavailable");
        }
        return directWindow;
    }
    OHNativeWindow *window = windowLease.GetWindow();
    if (window != nullptr && !HdrMetadataHelper::ResetNativeWindowSdrMetadata(window)) {
        // Color metadata is an optional presentation hint.  A device that rejects it must still
        // be able to create the normal 8-bit OpenGL output Surface.
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
    // NativeImage returns the complete producer transform after UpdateSurfaceImage(), including
    // the codec output's crop, orientation and the OpenGL texture-origin conversion.  Applying
    // the container rotation to these coordinates again rotates a landscape frame by 180 degrees
    // and turns portrait content sideways.  Keep the standard NativeImage coordinates and use
    // rotation only above when calculating the letterbox viewport.
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
    // Codec callbacks can be dispatched by different FFRT workers.  Do not pin EGL to the worker
    // that happened to render the preceding frame.
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
    if (!ConfigureWindowForGpu(target.window, target.width, target.height)) {
        return false;
    }
    ReleaseGlResources();
    return CreateContextResources(target);
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
    // Keep the old EGL Surface alive until the new target is fully usable.  The decoder continues
    // producing into NativeImage, so tearing down all GL resources here would orphan that producer.
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
    surface_ = replacement;
    window_ = target.window;
    windowGeneration_ = target.generation;
    UpdateSurfaceExtent(target.width, target.height);
    if (previous != EGL_NO_SURFACE) {
        eglDestroySurface(display_, previous);
    }
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
    // ArkUI can issue OnSurfaceChanged when the XComponent is resized as controls appear or hide.  The
    // NativeWindow is still the same object in that case, and the existing EGL window Surface tracks the
    // new geometry.  Refresh the cached extent instead of dropping every decoder output frame forever.
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
        // EGL and BufferRenderer cannot both produce into the same XComponent window.
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
        // The XComponent can be destroyed while the codec output callback is still draining.
        // Do not touch EGL or retain the codec buffer after the target Surface disappears.
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
        return;
    }
    if (surface_ != EGL_NO_SURFACE && context_ != EGL_NO_CONTEXT) {
        (void)eglMakeCurrent(display_, surface_, surface_, context_);
    }
    ReleaseShaderPrograms();
    ReleaseEglObjects();
    ResetGlState();
}

void OpenGLVideoSink::Reset()
{
    DestroyNativeImage();
    ReleaseGlResources();
    fallbackOnly_ = false;
    directSurfaceFallback_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
}
