/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_OPENGL_VIDEO_SINK_H
#define AVCODEC_SAMPLE_OPENGL_VIDEO_SINK_H

#include <EGL/egl.h>
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>
#include <condition_variable>
#include <atomic>
#include <cstdint>
#include <mutex>
#include <vector>

#include "../sink/BufferVideoSink.h"
#include "native_image/native_image.h"

class OpenGLVideoSink final : public VideoSink {
public:
    OpenGLVideoSink() = default;
    ~OpenGLVideoSink() override;

    int32_t Present(const VideoPresentRequest &request) override;
    void BeginPlayback() override;
    OHNativeWindow *PrepareForPlayback(const SampleInfo &sampleInfo) override;
    bool UsesSurfaceDecoder() const override
    {
        return surfaceDecoderReady_;
    }
    void Reset() override;

private:
    struct OutputTarget {
        OHNativeWindow *window = nullptr;
        int32_t width = 0;
        int32_t height = 0;
        uint64_t generation = 0;
    };

    bool EnsureContext(const OutputTarget &target);
    bool BindExistingContext(int32_t width, int32_t height);
    bool CreateContextResources(const OutputTarget &target);
    bool RefreshOutputSurface(const OutputTarget &target);
    bool RebindOutputSurface(const OutputTarget &target);
    bool CreateProgram();
    bool CreateExternalProgram();
    bool UploadAndDraw(const std::vector<uint8_t> &rgba, int32_t width, int32_t height, int32_t rotation);
    bool DrawExternalImage(int32_t width, int32_t height, int32_t rotation);
    bool PresentSurface(const VideoPresentRequest &request);
    int32_t PresentBufferFrame(const VideoPresentRequest &request, const OutputTarget &target);
    bool CreateNativeImage(int32_t width, int32_t height);
    bool PrepareEglContext(const OutputTarget &target);
    bool PrepareNativeImage(int32_t width, int32_t height);
    bool ReleaseCurrentContext();
    bool ConfigureViewport(int32_t width, int32_t height, int32_t rotation);
    bool WaitForFrame();
    bool CreateEglWindowSurface(OHNativeWindow *window);
    bool CreateEglContext();
    void UpdateSurfaceExtent(int32_t fallbackWidth, int32_t fallbackHeight);
    void DestroyNativeImage();
    static void OnFrameAvailable(void *context);
    void ReleaseShaderPrograms();
    void ReleaseEglObjects();
    void ResetGlState();
    void ReleaseGlResources();

    EGLDisplay display_ = EGL_NO_DISPLAY;
    EGLConfig config_ = nullptr;
    EGLSurface surface_ = EGL_NO_SURFACE;
    EGLContext context_ = EGL_NO_CONTEXT;
    GLuint program_ = 0;
    GLuint texture_ = 0;
    GLuint externalTexture_ = 0;
    GLuint externalProgram_ = 0;
    GLint textureLocation_ = -1;
    GLint textureMatrixLocation_ = -1;
    GLint externalTextureLocation_ = -1;
    GLint externalTextureMatrixLocation_ = -1;
    GLint positionLocation_ = -1;
    GLint texCoordLocation_ = -1;
    GLint externalPositionLocation_ = -1;
    GLint externalTexCoordLocation_ = -1;
    int32_t textureWidth_ = 0;
    int32_t textureHeight_ = 0;
    OHNativeWindow *window_ = nullptr;
    uint64_t windowGeneration_ = 0;
    int32_t width_ = 0;
    int32_t height_ = 0;
    int32_t frameWidth_ = 0;
    int32_t frameHeight_ = 0;
    bool fallbackOnly_ = false;
    // HDR Vivid and other 10-bit streams use the decoder's XComponent Surface directly.  An
    // external OpenGL texture does not expose the per-frame HDR metadata required to compose
    // HDR Vivid faithfully.
    bool directSurfaceFallback_ = false;
    bool surfaceDecoderReady_ = false;
    OH_NativeImage *nativeImage_ = nullptr;
    OHNativeWindow *decoderWindow_ = nullptr;
    std::atomic<uint32_t> availableFrameCount_ { 0 };
    std::mutex frameMutex_;
    std::condition_variable frameCondition_;
    BufferVideoSink fallback_;
    std::vector<uint8_t> rgbaCache_;
};

#endif // AVCODEC_SAMPLE_OPENGL_VIDEO_SINK_H
