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
#include "include/VideoEncoder.h"
#include <cstdio>
#include <vector>

namespace {
constexpr int32_t ENCODE_SQR_FACTOR = 25;
constexpr int32_t ENCODE_MAX_BITRATE = 30 * 1024 * 1024;
constexpr int32_t ENCODE_CQ_QUALITY = 100;
constexpr int32_t ENCODE_QP_MAX = 4;
constexpr int32_t ENCODE_QP_MIN = 0;
}

#undef LOG_TAG
#define LOG_TAG "VideoEncoder"

// [Start roi_encode_parameter_callback]
static void OnNeedInputParameter(OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData)
{
    auto *roiUserData = static_cast<VideoEncoder::CodecUserRoi *>(userData);
    if (!roiUserData || !roiUserData->roiQueue) {
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    std::string roiStr = roiUserData->roiQueue->Pop();
    OH_AVFormat_SetStringValue(parameter, OH_MD_KEY_VIDEO_ENCODER_ROI_PARAMS, roiStr.c_str());
    if (!roiStr.empty()) {
        SAMPLE_LOGI("ROI configured (parameter callback path): %{public}s", roiStr.c_str());
    }
    OH_VideoEncoder_PushInputParameter(codec, index);
}
// [End roi_encode_parameter_callback]

VideoEncoder::~VideoEncoder()
{
    Release();
}

int32_t VideoEncoder::Create(const std::string &videoCodecMime)
{
    encoder_ = OH_VideoEncoder_CreateByMime(videoCodecMime.c_str());
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Create failed");
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Config(SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Encoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    roiPathType_ = sampleInfo.videoInfo.roiPathType;
    width_ = sampleInfo.videoInfo.videoWidth;
    height_ = sampleInfo.videoInfo.videoHeight;

    // [Start roi_register_parameter_callback]
    // 参数回调配置：在Configure之前注册参数回调
    if (roiPathType_ == ROI_PATH_METADATA_CALLBACK) {
        userData_ = std::make_unique<CodecUserRoi>();
        if (userData_) {
            userData_->vencoder = this;
            userData_->roiQueue = &roiQueue_;
        }
        int32_t ret = OH_VideoEncoder_RegisterParameterCallback(encoder_, OnNeedInputParameter, userData_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR,
                                 "OH_VideoEncoder_RegisterParameterCallback failed, ret: %{public}d", ret);
        SAMPLE_LOGI("参数回调配置: ROI parameter callback registered.");
    }
    // [End roi_register_parameter_callback]

    int32_t ret = Configure(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == SAMPLE_ERR_OK, SAMPLE_ERR_ERROR, "Configure failed");

    // Surface模式: Get Surface for NativeBuffer元数据配置 and 参数回调配置
    if (roiPathType_ == ROI_PATH_NATIVEBUFFER || roiPathType_ == ROI_PATH_METADATA_CALLBACK) {
        ret = GetSurface(sampleInfo);
        CHECK_AND_RETURN_RET_LOG(ret == SAMPLE_ERR_OK, SAMPLE_ERR_ERROR, "Get surface failed");
    }
    // Buffer模式: no Surface needed

    ret = SetCallback(codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == SAMPLE_ERR_OK, SAMPLE_ERR_ERROR,
                             "Set callback failed, ret: %{public}d", ret);

    ret = OH_VideoEncoder_Prepare(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Prepare failed, ret: %{public}d", ret);

    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Start()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Encoder is null");
    int ret = OH_VideoEncoder_Start(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::FreeOutputBuffer(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Encoder is null");
    int32_t ret = OH_VideoEncoder_FreeOutputBuffer(encoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Free output data failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::NotifyEndOfStream()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Encoder is null");
    int32_t ret = OH_VideoEncoder_NotifyEndOfStream(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Notify end of stream failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Stop()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, SAMPLE_ERR_ERROR, "Encoder is null");
    int ret = OH_VideoEncoder_Flush(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);
    ret = OH_VideoEncoder_Stop(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Release()
{
    if (encoder_ != nullptr) {
        OH_VideoEncoder_Destroy(encoder_);
        encoder_ = nullptr;
    }
    return SAMPLE_ERR_OK;
}

// [Start roi_parameter_callback_queue_storage]
// 参数回调配置：将ROI条目按PTS推入RoiQueue
void VideoEncoder::PushRoiEntry(int64_t pts, const std::string &roiStr)
{
    roiQueue_.Push(pts, roiStr);
}

// 参数回调配置：ROI关闭时清空RoiQueue
void VideoEncoder::ClearRoiQueue()
{
    roiQueue_.Clear();
}
// [End roi_parameter_callback_queue_storage]

int32_t VideoEncoder::SetCallback(CodecUserData *codecUserData)
{
    codecUserData->roiPathType = roiPathType_;
    int32_t ret =
        OH_VideoEncoder_RegisterCallback(encoder_,
                                         {CodecCallback::OnCodecError, CodecCallback::OnCodecFormatChange,
                                          CodecCallback::OnNeedInputBuffer, CodecCallback::OnNewOutputBuffer},
                                         codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Configure(const SampleInfo &sampleInfo)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, SAMPLE_ERR_ERROR, "AVFormat create failed");

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.videoInfo.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.videoInfo.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.videoInfo.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.videoInfo.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, sampleInfo.videoInfo.bitrateMode);
    if (sampleInfo.videoInfo.bitrateMode == BITRATE_MODE_SQR) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_SQR_FACTOR, ENCODE_SQR_FACTOR);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_BITRATE, ENCODE_MAX_BITRATE);
    } else if (sampleInfo.videoInfo.bitrateMode == BITRATE_MODE_CQ) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, ENCODE_CQ_QUALITY);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, ENCODE_QP_MAX);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, ENCODE_QP_MIN);
    } else {
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, sampleInfo.videoInfo.bitrate);
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, sampleInfo.videoInfo.hevcProfile);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, sampleInfo.videoInfo.iFrameInterval);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, sampleInfo.videoInfo.rangFlag);
    if (sampleInfo.videoInfo.isHDRVivid) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, sampleInfo.videoInfo.primary);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, sampleInfo.videoInfo.transfer);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, sampleInfo.videoInfo.matrix);
    }
    SAMPLE_LOGI("====== VideoEncoder config (path %{public}d) ======", roiPathType_);
    SAMPLE_LOGI("%{public}d*%{public}d, %{public}.1ffps", sampleInfo.videoInfo.videoWidth,
                sampleInfo.videoInfo.videoHeight, sampleInfo.videoInfo.frameRate);

    int32_t ret = OH_VideoEncoder_Configure(encoder_, format);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}

int32_t VideoEncoder::GetSurface(SampleInfo &sampleInfo)
{
    int32_t ret = OH_VideoEncoder_GetSurface(encoder_, &sampleInfo.videoInfo.window);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && sampleInfo.videoInfo.window, SAMPLE_ERR_ERROR,
                             "Get surface failed, ret: %{public}d", ret);
    return SAMPLE_ERR_OK;
}
