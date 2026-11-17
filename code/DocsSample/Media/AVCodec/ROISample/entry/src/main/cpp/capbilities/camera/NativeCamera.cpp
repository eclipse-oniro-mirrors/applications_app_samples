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

#include "NativeCamera.h"
#include <algorithm>
#include <cmath>
#include <vector>
#include "SampleLog.h"

#undef LOG_TAG
#define LOG_TAG "RoiNativeCamera"

NativeCamera::~NativeCamera()
{
    Stop();
}

Camera_ErrorCode NativeCamera::Start(const NativeCameraConfig &config)
{
    std::lock_guard<std::mutex> lock(mutex_);
    ReleaseLocked();
    if (config.surfaceId.empty() || config.width <= 0 || config.height <= 0 || config.frameRate <= 0) {
        return CAMERA_INVALID_ARGUMENT;
    }
    Camera_ErrorCode ret = CreateOutputs(config);
    if (ret == CAMERA_OK) {
        ret = ConfigureSession(config.isHdr);
    }
    if (ret == CAMERA_OK) {
        ret = ConfigureFrameRate(config.frameRate);
    }
    // Query and enable only after CommitConfig, before starting the session.
    if (ret == CAMERA_OK && metadataOutput_ != nullptr) {
        ret = EnableInFrameMetadata();
    }
    if (ret == CAMERA_OK) {
        bool focusSupported = false;
        Camera_ErrorCode focusRet = OH_CaptureSession_IsFocusModeSupported(
            session_, FOCUS_MODE_CONTINUOUS_AUTO, &focusSupported);
        if (focusRet == CAMERA_OK && focusSupported) {
            OH_CaptureSession_SetFocusMode(session_, FOCUS_MODE_CONTINUOUS_AUTO);
        }
        ret = OH_CaptureSession_Start(session_);
    }
    if (ret != CAMERA_OK) {
        SAMPLE_LOGE("Start Native camera failed, code: %{public}d", ret);
        ReleaseLocked();
        return ret;
    }
    started_ = true;
    SAMPLE_LOGI("Native camera started, position: %{public}d", position_);
    return CAMERA_OK;
}

Camera_ErrorCode NativeCamera::CreateOutputs(const NativeCameraConfig &config)
{
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&manager_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get camera manager failed");
    ret = OH_CameraManager_GetSupportedCameras(manager_, &devices_, &deviceCount_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get cameras failed");
    CHECK_AND_RETURN_RET_LOG(devices_ != nullptr && deviceCount_ > 0, CAMERA_SERVICE_FATAL_ERROR, "No camera device");
    Camera_Device *device = &devices_[0];
    for (uint32_t i = 0; i < deviceCount_; ++i) {
        if (devices_[i].cameraPosition == config.position) {
            device = &devices_[i];
            break;
        }
    }
    position_ = device->cameraPosition;
    ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        manager_, device, NORMAL_VIDEO, &capability_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get camera capability failed");
    CHECK_AND_RETURN_RET_LOG(capability_ != nullptr, CAMERA_SERVICE_FATAL_ERROR, "Camera capability is null");
    Camera_Format format = config.isHdr ? CAMERA_FORMAT_YCBCR_P010 : CAMERA_FORMAT_YUV_420_SP;
    Camera_Profile *profile = nullptr;
    for (uint32_t i = 0; capability_->previewProfiles != nullptr && i < capability_->previewProfilesSize; ++i) {
        Camera_Profile *candidate = capability_->previewProfiles[i];
        if (candidate != nullptr && candidate->format == format && candidate->size.width == config.width &&
            candidate->size.height == config.height) {
            profile = candidate;
            break;
        }
    }
    CHECK_AND_RETURN_RET_LOG(profile != nullptr, CAMERA_INVALID_ARGUMENT, "Requested preview profile is unsupported");
    // Feed the existing NativeImage surface, keeping all three ROI encoding paths unchanged.
    ret = OH_CameraManager_CreatePreviewOutput(manager_, profile, config.surfaceId.c_str(), &preview_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Create preview output failed");
    ret = OH_CameraManager_CreateCameraInput(manager_, device, &input_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Create camera input failed");
    ret = OH_CameraInput_Open(input_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Open camera input failed");

    std::vector<Camera_MetadataObjectType> types;
    for (uint32_t i = 0; capability_->supportedMetadataObjectTypes != nullptr &&
        i < capability_->metadataProfilesSize; ++i) {
        if (capability_->supportedMetadataObjectTypes[i] != nullptr) {
            types.push_back(*capability_->supportedMetadataObjectTypes[i]);
        }
    }
    if (types.empty()) {
        SAMPLE_LOGW("No supported metadata object type; camera ROI is unavailable.");
        return CAMERA_OK;
    }
    ret = OH_CameraManager_CreateMetadataOutputWithObjectTypes(manager_, types.data(), types.size(), &metadataOutput_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Create metadata output failed");
    return CAMERA_OK;
}

Camera_ErrorCode NativeCamera::ConfigureSession(bool isHdr)
{
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(manager_, &session_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Create capture session failed");
    ret = OH_CaptureSession_SetSessionMode(session_, NORMAL_VIDEO);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Set session mode failed");
    ret = OH_CaptureSession_BeginConfig(session_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Begin config failed");
    ret = OH_CaptureSession_AddInput(session_, input_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Add input failed");
    ret = OH_CaptureSession_AddPreviewOutput(session_, preview_);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Add preview output failed");
    if (metadataOutput_ != nullptr) {
        ret = OH_CaptureSession_AddMetadataOutput(session_, metadataOutput_);
        CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Add metadata output failed");
    }
    OH_NativeBuffer_ColorSpace *spaces = nullptr;
    uint32_t size = 0;
    ret = OH_CaptureSession_GetSupportedColorSpaces(session_, &spaces, &size);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get color spaces failed");
    auto colorSpace = isHdr ? OH_COLORSPACE_BT2020_HLG_LIMIT : OH_COLORSPACE_BT709_LIMIT;
    bool supported = false;
    for (uint32_t i = 0; spaces != nullptr && i < size; ++i) {
        supported = supported || spaces[i] == colorSpace;
    }
    if (spaces != nullptr) {
        OH_CaptureSession_DeleteColorSpaces(session_, spaces);
    }
    CHECK_AND_RETURN_RET_LOG(supported, CAMERA_INVALID_ARGUMENT, "Requested color space is unsupported");
    ret = OH_CaptureSession_SetActiveColorSpace(session_, colorSpace);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Set color space failed");
    return OH_CaptureSession_CommitConfig(session_);
}

Camera_ErrorCode NativeCamera::ConfigureFrameRate(int32_t frameRate)
{
    Camera_FrameRateRange *ranges = nullptr;
    uint32_t size = 0;
    Camera_ErrorCode ret = OH_PreviewOutput_GetSupportedFrameRates(preview_, &ranges, &size);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get preview frame rates failed");
    bool supported = false;
    for (uint32_t i = 0; ranges != nullptr && i < size; ++i) {
        supported = supported || (frameRate >= ranges[i].min && frameRate <= ranges[i].max);
    }
    if (ranges != nullptr) {
        OH_PreviewOutput_DeleteFrameRates(preview_, ranges);
    }
    CHECK_AND_RETURN_RET_LOG(supported, CAMERA_INVALID_ARGUMENT, "Requested frame rate is unsupported");
    ret = OH_PreviewOutput_SetFrameRate(preview_, frameRate, frameRate);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Set preview frame rate failed");
    Camera_FrameRateRange active{};
    ret = OH_PreviewOutput_GetActiveFrameRate(preview_, &active);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, ret, "Get active frame rate failed");
    CHECK_AND_RETURN_RET_LOG(active.min == frameRate && active.max == frameRate, CAMERA_SERVICE_FATAL_ERROR,
        "Active preview frame rate differs from requested frame rate");
    return CAMERA_OK;
}

// [Start roi_enable_in_frame_metadata_native]
Camera_ErrorCode NativeCamera::EnableInFrameMetadata()
{
    if (OH_MetadataOutput_IsInFrameMetadataForEncoderSupported(metadataOutput_)) {
        Camera_ErrorCode ret = OH_MetadataOutput_SetInFrameMetadataForEncoderEnabled(metadataOutput_, true);
        if (ret != CAMERA_OK) {
            SAMPLE_LOGE("Enable in-frame metadata for encoder failed, code: %{public}d", ret);
            return ret;
        }
    } else {
        SAMPLE_LOGW("In-frame metadata for encoder is not supported; camera ROI is unavailable.");
    }
    return CAMERA_OK;
}
// [End roi_enable_in_frame_metadata_native]

Camera_ErrorCode NativeCamera::Stop()
{
    std::lock_guard<std::mutex> lock(mutex_);
    return ReleaseLocked();
}

Camera_ErrorCode NativeCamera::ReleaseLocked()
{
    Camera_ErrorCode result = CAMERA_OK;
    auto check = [&result](Camera_ErrorCode ret, const char *operation) {
        if (ret != CAMERA_OK) {
            SAMPLE_LOGE("%{public}s failed, code: %{public}d", operation, ret);
            if (result == CAMERA_OK) {
                result = ret;
            }
        }
    };
    if (session_ != nullptr) {
        if (started_) {
            check(OH_CaptureSession_Stop(session_), "Stop session");
        }
        check(OH_CaptureSession_Release(session_), "Release session");
        session_ = nullptr;
    }
    started_ = false;
    if (metadataOutput_ != nullptr) {
        check(OH_MetadataOutput_Release(metadataOutput_), "Release metadata output");
        metadataOutput_ = nullptr;
    }
    if (preview_ != nullptr) {
        check(OH_PreviewOutput_Release(preview_), "Release preview output");
        preview_ = nullptr;
    }
    if (input_ != nullptr) {
        // Close and Release are alternative APIs, do not call both on the same input.
        check(OH_CameraInput_Release(input_), "Release camera input");
        input_ = nullptr;
    }
    if (capability_ != nullptr) {
        check(OH_CameraManager_DeleteSupportedCameraOutputCapability(manager_, capability_), "Delete capability");
        capability_ = nullptr;
    }
    if (devices_ != nullptr) {
        check(OH_CameraManager_DeleteSupportedCameras(manager_, devices_, deviceCount_), "Delete cameras");
        devices_ = nullptr;
        deviceCount_ = 0;
    }
    if (manager_ != nullptr) {
        check(OH_Camera_DeleteCameraManager(manager_), "Delete camera manager");
        manager_ = nullptr;
    }
    return result;
}

int32_t NativeCamera::UpdateRotation(int32_t displayRotation, bool isDisplayLocked)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (!started_) {
        return -1;
    }
    Camera_ImageRotation rotation = CAMERA_IMAGE_ROTATION_0;
    Camera_ErrorCode ret = OH_PreviewOutput_GetPreviewRotation(preview_, displayRotation, &rotation);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, -1, "Get preview rotation failed");
    ret = OH_PreviewOutput_SetPreviewRotation(preview_, rotation, isDisplayLocked);
    CHECK_AND_RETURN_RET_LOG(ret == CAMERA_OK, -1, "Set preview rotation failed");
    return rotation;
}

float NativeCamera::GetZoomRatio()
{
    std::lock_guard<std::mutex> lock(mutex_);
    float zoom = 1.0f;
    if (started_) {
        OH_CaptureSession_GetZoomRatio(session_, &zoom);
    }
    return zoom;
}

void NativeCamera::SetZoomRatio(float zoom)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (!started_ || !std::isfinite(zoom)) {
        return;
    }
    float minZoom = 1.0f;
    float maxZoom = 1.0f;
    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatioRange(session_, &minZoom, &maxZoom);
    CHECK_AND_RETURN_LOG(ret == CAMERA_OK, "Get zoom range failed");
    ret = OH_CaptureSession_SetZoomRatio(session_, std::clamp(zoom, minZoom, maxZoom));
    CHECK_AND_RETURN_LOG(ret == CAMERA_OK, "Set zoom ratio failed");
}

Camera_Position NativeCamera::GetPosition()
{
    std::lock_guard<std::mutex> lock(mutex_);
    return position_;
}
