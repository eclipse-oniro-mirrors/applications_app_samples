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

#ifndef ROI_NATIVE_CAMERA_H
#define ROI_NATIVE_CAMERA_H

#include <mutex>
#include <string>
#include <ohcamera/camera_manager.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/preview_output.h>
// [Start roi_native_camera_header]
#include <ohcamera/metadata_output.h>
// [End roi_native_camera_header]

struct NativeCameraConfig {
    std::string surfaceId;
    int32_t width = 0;
    int32_t height = 0;
    int32_t frameRate = 0;
    Camera_Position position = CAMERA_POSITION_FRONT;
    bool isHdr = false;
};

// Each Recorder owns one camera; ArkTS and Native camera paths use the same input surface.
class NativeCamera {
public:
    ~NativeCamera();
    Camera_ErrorCode Start(const NativeCameraConfig &config);
    Camera_ErrorCode Stop();
    int32_t UpdateRotation(int32_t displayRotation, bool isDisplayLocked);
    float GetZoomRatio();
    void SetZoomRatio(float zoom);
    Camera_Position GetPosition();

private:
    Camera_ErrorCode CreateOutputs(const NativeCameraConfig &config);
    Camera_ErrorCode ConfigureSession(bool isHdr);
    Camera_ErrorCode ConfigureFrameRate(int32_t frameRate);
    Camera_ErrorCode EnableInFrameMetadata();
    Camera_ErrorCode ReleaseLocked();

    std::mutex mutex_;
    Camera_Manager *manager_ = nullptr;
    Camera_Device *devices_ = nullptr;
    uint32_t deviceCount_ = 0;
    Camera_OutputCapability *capability_ = nullptr;
    Camera_Input *input_ = nullptr;
    Camera_PreviewOutput *preview_ = nullptr;
    Camera_MetadataOutput *metadataOutput_ = nullptr;
    Camera_CaptureSession *session_ = nullptr;
    Camera_Position position_ = CAMERA_POSITION_FRONT;
    bool started_ = false;
};

#endif // ROI_NATIVE_CAMERA_H
