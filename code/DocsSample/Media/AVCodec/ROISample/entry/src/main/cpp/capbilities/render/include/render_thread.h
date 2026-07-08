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

#ifndef SAMPLE_OPENGL_RENDER_THREAD_H
#define SAMPLE_OPENGL_RENDER_THREAD_H

#include <functional>
#include <string>
#include <thread>
#include <utility>
#include <vector>
#include "SampleInfo.h"
#include "FrameQueue.h"
#include <string>
#if defined(__ARM_NEON) || defined(__ARM_NEON__)
#include <arm_neon.h>
#endif
#include <native_image/native_image.h>
#include <native_buffer/native_buffer.h>
#include <native_window/external_window.h>
#include <native_vsync/native_vsync.h>
#include <hilog/log.h>

#include "egl_render_context.h"
#include "shader_program.h"

namespace NativeXComponentSample {

constexpr uint32_t UNINITIALIZED_TEX_ID = 9999U;
constexpr int32_t DEFAULT_CAMERA_ROTATION = 270;
constexpr float ROI_BORDER_THICKNESS = 8.0f;
constexpr int32_t ROI_AREA_RATIO_THRESHOLD = 5;
constexpr int32_t ROI_DELTA_QP = -6;
constexpr uint32_t FENCE_POLL_TIMEOUT_MS = 3000;
constexpr float NOISE_SCALE_X = 0.333f;
constexpr float NOISE_SCALE_Y = 0.25f;
constexpr float UV_CENTER_OFFSET = 0.5f;

// ROI rendering geometry constants
constexpr int32_t ROI_QUAD_VERTICES = 6;        // Two triangles per ROI rectangle
constexpr int32_t ROI_VERTEX_FLOATS = 3;        // x, y, z position per vertex
constexpr int32_t ROI_MAX_BORDER_RECTS = 4;     // Top, bottom, left, right sides

// Main vertex format constants
constexpr int32_t VERTEX_STRIDE_FLOATS = 5;     // 3 position + 2 texcoord
constexpr int32_t VERTEX_POSITION_FLOATS = 3;   // x, y, z before texcoord
constexpr int32_t TEXCOORD_ATTRIB_INDEX = 1;    // GL attribute index for texture coords
constexpr int32_t TEXCOORD_FLOATS = 2;          // 2D UV per vertex (u, v)
constexpr int32_t POSITION_ATTRIB_INDEX = 0;    // GL attribute index for position

// NDC coordinate system
constexpr float NDC_RANGE_SIZE = 2.0f;          // Full range from -1.0f to +1.0f
constexpr float NDC_MIN = -1.0f;                // Left/bottom edge of NDC space
constexpr float NDC_MAX = 1.0f;                 // Right/top edge of NDC space

// Viewport centering offset divisor
constexpr int32_t CENTER_OFFSET_DIVISOR = 2;    // Divide excess by 2 to center viewport

// Matrix dimension
constexpr int32_t MAT4_DIM = 4;                 // 4x4 matrix side length

// BT.601 luminance weights for grayscale conversion
constexpr float LUMINANCE_WEIGHT_R = 0.299f;
constexpr float LUMINANCE_WEIGHT_G = 0.587f;
constexpr float LUMINANCE_WEIGHT_B = 0.114f;

// Camera rotation angles (degrees)
constexpr int32_t CAMERA_ROTATION_NONE = 0;
constexpr int32_t CAMERA_ROTATION_HALF_TURN = 180;

// GL color packing shifts (A2R10G10B10 format)
constexpr int32_t A2R10G10B10_ALPHA_SHIFT = 30;
constexpr int32_t A2R10G10B10_BLUE_SHIFT = 20;
constexpr int32_t A2R10G10B10_GREEN_SHIFT = 10;
constexpr uint32_t A2R10G10B10_10BIT_MAX = 1023;  // Max value for 10-bit channel
constexpr uint32_t A2R10G10B10_2BIT_ALPHA_MAX = 3; // Max value for 2-bit alpha

// Matrix and draw constants
constexpr int32_t MAT4_ELEMENT_COUNT = 16;
constexpr int32_t RECTANGLE_INDEX_COUNT = 6;
constexpr int32_t VEC4_COMPONENT_COUNT = 4;

// NativeImage API
constexpr int32_t NATIVE_IMAGE_NEW_TEXTURE_ID = -1;

struct ViewportParams {
    int32_t x;
    int32_t y;
    int32_t width;
    int32_t height;
};

ViewportParams ComputeCenteredViewport(int32_t imageWidth, int32_t imageHeight,
                                       int32_t viewWidth, int32_t viewHeight);

using RenderTask = std::function<void(EglRenderContext &renderContext)>;

class RenderThread {
public:
    RenderThread();
    ~RenderThread() noexcept;
    void UpdateNativeWindow(void *window, uint64_t width, uint64_t height);
    
    void CreateEncoderSurface(void *window, int32_t width, int32_t height);
    void DeleteEncoderSurface(void);
    void AddBW(void);
    
    // disallow copy and move
    RenderThread(const RenderThread &other) = delete;
    void operator=(const RenderThread &other) = delete;
    RenderThread(RenderThread &&other) = delete;
    void operator=(RenderThread &&other) = delete;
    
    void PostTask(const RenderTask &task);
    
    uint64_t GetNativeImageSurfaceId() const
    {
        std::lock_guard<std::mutex> lock(nativeImageSurfaceIdMutex_);
        return nativeImageSurfaceId_;
    }
    
    OHNativeWindow* GetNativeImageWindow() const
    {
        std::lock_guard<std::mutex> lock(nativeImageSurfaceIdMutex_);
        return nativeImageWindow_;
    }
    
    void SetRenderAngle(bool isVertical)
    {
        isVertical_ = isVertical;
    }

    void ImageDraw(OHNativeWindowBuffer *InBuffer, OHNativeWindowBuffer *OutBuffer, ViewportParams vp);
    void DrawRoiOverlay(OHNativeWindowBuffer *outBuffer, ViewportParams vp, const std::string& roiStr);
    OH_NativeImage *GetNativeImageEncoder();
    void SetCameraFront(bool isCameraFront);
    void UpdateCameraRotation(int rotation);

    // Set ROI toggle state from UI
    void SetIsOpenROI(bool isOpenROI)
    {
        isOpenROI_ = isOpenROI;
    }
    // Set ROI log file fd
    void SetRoiFd(int fd)
    {
        roiFd_ = fd;
    }
    // Set ROI path type
    void SetRoiPathType(RoiPathType type)
    {
        roiPathType_ = type;
    }
    // Set frame queue for Buffer模式
    void SetFrameQueue(FrameQueue *queue)
    {
        frameQueue_ = queue;
    }
    // Set video dimensions for Buffer模式 (no encoder surface to query)
    void SetVideoDimensions(int32_t width, int32_t height)
    {
        encoderWidth = width;
        encoderHeight = height;
    }
    // Set callback for 参数回调配置: pass assembled ROI string with PTS to VideoEncoder
    void SetOnRoiStrAssembled(std::function<void(int64_t, const std::string&)> callback)
    {
        onRoiStrAssembled_ = callback;
    }
private:
    int xcomponentHeight_ = 0;
    int xcomponentWidth_ = 0;
    OHNativeWindow *xcomponentWindows_{nullptr};
    void Start();
    void ThreadMainLoop();
    void DrawScene();
    void UpdateImageResource(void *data, int32_t width, int32_t height, int32_t stride, bool mipmap = true);
    void ConfigSceneMatrix();
    
    std::atomic<bool> running_{false};
    std::thread thread_;
    std::thread::id threadId_;
    
    // Receive Vsync signal from the system to control rendering timing
    bool InitNativeVsync();
    void DestroyNativeVsync();
    OH_NativeVSync *nativeVsync_ = nullptr;
    static void OnVsync(long long timestamp, void *data);
    std::atomic<int> vSyncCnt_{0};
    mutable std::mutex wakeUpMutex_;
    std::condition_variable wakeUpCond_;
    bool wakeUp_ = false;
    mutable std::mutex taskMutex_;
    std::vector<RenderTask> tasks_;
    
    // renderContext initialization and cleanup
    bool InitRenderContext();
    void DestroyRenderContext();
    std::unique_ptr<EglRenderContext> renderContext_;
    
    // Perform resource creation and cleanup on the render thread
    bool CreateGLResources();
    void CreateShaders();
    void SetupMainVao();
    void CreateTextures();
    void SetupRoiVao();
    void CleanGLResources();

    // DrawImage() decomposed helper functions
    std::string ExtractRoiFromBuffer(OHNativeWindowBuffer *InBuffer);
    std::string AssembleRoiString(const std::string &currentRoiStr);
    void LogRoiData(const std::string &currentRoiStr, const std::string &assembledRoiStr);
    bool PollFence(int32_t fenceFd);
    void PushFrameToBufferQueue(OHNativeWindowBuffer *InBuffer, const std::string &assembledRoiStr);
    void WriteRoiToEncoderBuffer(OHNativeWindowBuffer *OutBufferEncoder, const std::string &assembledRoiStr);

    // DrawImage() further decomposed helpers
    bool AcquireInputBuffer(OHNativeWindowBuffer **outBuffer, int32_t *outFenceFd);
    bool RequestOutputBuffers(OHNativeWindowBuffer **outPreviewBuffer, OHNativeWindowBuffer **outEncoderBuffer);
    std::pair<ViewportParams, ViewportParams> ComputeDrawViewports();
    void FlushAndCleanup(OHNativeWindowBuffer *InBuffer, int32_t fenceFd1,
                          OHNativeWindowBuffer *OutBuffer, OHNativeWindowBuffer *OutBufferEncoder);

    // Setup native window/encoder surfaces on the render thread
    void SetupNativeWindowSurface(OHNativeWindow *nativeWindow);
    void SetupEncoderWindowSurface(OHNativeWindow *nativeWindow, int32_t width, int32_t height);

    OHNativeWindow *nativeWindow_ = nullptr;
    EGLSurface eglSurface_ = EGL_NO_SURFACE;
    OHNativeWindow *encoderNativeWindow_ = nullptr;
    
    bool CreateNativeImage();
    void DestroyNativeImage();
    void DrawImage();
    void DrawRoiQuad(float x1, float x2, float y1, float y2);
    void DrawRoiRects(const std::vector<OH_AVFormat*> &parsedFormats, uint32_t actualCount,
                      float lrThickNdc, float tbThickNdc, ViewportParams vp);
    static void OnNativeImageFrameAvailable(void *data);
    OH_OnFrameAvailableListener nativeImageFrameAvailableListener_{};
    OH_NativeImage *nativeImage_ = nullptr;
    GLuint nativeImageTexId_ = UNINITIALIZED_TEX_ID;
    mutable std::mutex nativeImageSurfaceIdMutex_;
    uint64_t nativeImageSurfaceId_ = 0;
    OHNativeWindow *nativeImageWindow_ = nullptr;
    std::atomic<int> availableFrameCnt_{0};
    std::unique_ptr<NativeXComponentSample::ShaderProgram> videoShader_;
    std::unique_ptr<NativeXComponentSample::ShaderProgram> imageShader_;
    std::unique_ptr<NativeXComponentSample::ShaderProgram> frameShader_;
    std::unique_ptr<NativeXComponentSample::ShaderProgram> roiShader_;

    GLuint vertexArrayObject_ = 0;
    GLuint vertexBufferObject_ = 0;
    GLuint vertexFrameObject_ = 0;
    GLuint roiVao_ = 0;
    GLuint roiVbo_ = 0;
    
    EGLSurface encoderSurface_ = EGL_NO_SURFACE;
    int32_t encoderWidth = 0;
    int32_t encoderHeight = 0;
    
    bool isVertical_ = true;
    bool isVertexShader = false;

    // image
    GLuint noiseImageTexId_ = UNINITIALIZED_TEX_ID;
    GLuint inTexId_ = UNINITIALIZED_TEX_ID;
    GLuint outTexId_ = UNINITIALIZED_TEX_ID;
    std::atomic<bool> isCameraFront_ = false;
    std::atomic<int> cameraRotation_{DEFAULT_CAMERA_ROTATION};
    std::array<float, MAT4_ELEMENT_COUNT> drawCameraImageMatrix_;
    std::array<float, MAT4_ELEMENT_COUNT> drawImageMatrix_;
    OH_NativeBuffer *imageBuffer_ = nullptr;
    std::atomic<bool> isOpenROI_{true};
    int roiFd_ = -1;
    RoiPathType roiPathType_ = ROI_PATH_NATIVEBUFFER;
    FrameQueue *frameQueue_ = nullptr;
    std::function<void(int64_t, const std::string&)> onRoiStrAssembled_;
    struct {
        uint32_t *data = nullptr;
        uint32_t width = 0;
        uint32_t height = 0;
        uint32_t stride = 0;
        bool changed = true;
    } noiseImage_;
};
} // namespace NativeXComponentSample

#endif // SAMPLE_OPENGL_RENDER_THREAD_H
