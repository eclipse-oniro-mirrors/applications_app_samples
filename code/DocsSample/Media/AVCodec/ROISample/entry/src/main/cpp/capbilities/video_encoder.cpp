/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "video_encoder.h"
#include "multimedia/player_framework/native_avcodec_videobase.h"

#undef LOG_TAG
#define LOG_TAG "VideoEncoder"

namespace {

int32_t ToGraphicPixelFormat(int32_t avPixelFormat, bool isHDRVivid)
{
    if (isHDRVivid) {
        return NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;
    }
    switch (avPixelFormat) {
        case AV_PIXEL_FORMAT_RGBA:
            return NATIVEBUFFER_PIXEL_FMT_RGBA_8888;
        case AV_PIXEL_FORMAT_YUVI420:
            return NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P;
        case AV_PIXEL_FORMAT_NV21:
            return NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
        default:
            return NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
    }
}
} // namespace

VideoEncoder::~VideoEncoder()
{
    Release();
}

int32_t VideoEncoder::Create(const std::string &videoCodecMime)
{
    encoder_ = OH_VideoEncoder_CreateByMime(videoCodecMime.c_str());
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Config(SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    int32_t ret = Configure(sampleInfo, codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Configure failed");

    codecUserData->videoEncoder = this;

    ret = GetSurface(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Get surface failed");

    if (!sampleInfo.codecSyncMode) {
        ret = SetCallback(codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set callback failed, ret: %{public}d", ret);
    }

    ret = OH_VideoEncoder_Prepare(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Prepare failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}

bool VideoEncoder::GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    std::shared_lock<std::shared_mutex> lock(codecMutex);

    int32_t ret = OH_VideoEncoder_QueryOutputBuffer(encoder_, &info.bufferIndex, timeoutUs);
    switch (ret) {
        case AV_ERR_OK: {
            OH_AVBuffer *buffer = OH_VideoEncoder_GetOutputBuffer(encoder_, info.bufferIndex);
            CHECK_AND_RETURN_RET_LOG(buffer != nullptr, false, "Output buffer is null.");
            OH_AVErrCode getBufferRet = OH_AVBuffer_GetBufferAttr(buffer, &info.attr);
            CHECK_AND_RETURN_RET_LOG(getBufferRet == AV_ERR_OK, false, "Get buffer attr error.");
            info.buffer = buffer;
            return true;
        }
        case AV_ERR_TRY_AGAIN_LATER: {
            AVCODEC_SAMPLE_LOGE("Get output buffer timeout.");
            return false;
        }
        case AV_ERR_STREAM_CHANGED: {
            int32_t width = 0;
            int32_t height = 0;
            auto format =
                std::shared_ptr<OH_AVFormat>(OH_VideoEncoder_GetOutputDescription(encoder_), OH_AVFormat_Destroy);
            CHECK_AND_BREAK_LOG(format != nullptr, "Format is nullptr.");
            bool getIntRet = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_WIDTH, &width) &&
                             OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_HEIGHT, &height);
            CHECK_AND_BREAK_LOG(getIntRet, "Encoder get int value failed.");
            AVCODEC_SAMPLE_LOGI("Stream Changed. Width: %{public}i, height: %{public}i", width, height);
            return GetOutputBuffer(info, timeoutUs);
        }
        default: {
            return false;
        }
    }
    return false;
}

int32_t VideoEncoder::Start()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int ret = OH_VideoEncoder_Start(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::PushInputBuffer(CodecBufferInfo &info)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int32_t ret = OH_AVBuffer_SetBufferAttr(info.buffer, &info.attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set avbuffer attr failed");
    ret = OH_VideoEncoder_PushInputBuffer(encoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Push input data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::FreeOutputBuffer(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_VideoEncoder_FreeOutputBuffer(encoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Free output data failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::NotifyEndOfStream()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_VideoEncoder_NotifyEndOfStream(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Notify end of stream failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Stop()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int ret = OH_VideoEncoder_Flush(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);

    ret = OH_VideoEncoder_Stop(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Release()
{
    if (encoder_ != nullptr) {
        OH_VideoEncoder_Destroy(encoder_);
        encoder_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::SetCallback(CodecUserData *codecUserData)
{
    int32_t ret = OH_VideoEncoder_RegisterCallback(encoder_,
    {SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
        SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer},
        codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Configure(const SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, sampleInfo.bitrateMode);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, sampleInfo.bitrate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, sampleInfo.hevcProfile);
    if (sampleInfo.codecSyncMode) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, sampleInfo.codecSyncMode);
    }
    if (sampleInfo.isHDRVivid) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, sampleInfo.iFrameInterval);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, sampleInfo.rangFlag);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, sampleInfo.primary);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, sampleInfo.transfer);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, sampleInfo.matrix);
    }
    AVCODEC_SAMPLE_LOGI("====== VideoEncoder config ======");
    AVCODEC_SAMPLE_LOGI("%{public}d*%{public}d, %{public}.1ffps",
        sampleInfo.videoWidth, sampleInfo.videoHeight, sampleInfo.frameRate);
    AVCODEC_SAMPLE_LOGI("BitRate Mode: %{public}d, BitRate: %{public}" PRId64 "kbps",
        sampleInfo.bitrateMode, sampleInfo.bitrate / 1024);
    AVCODEC_SAMPLE_LOGI("====== VideoEncoder config ======");

    if (sampleInfo.isROIEnabled && codecUserData != nullptr) {
        int32_t ret = OH_VideoEncoder_RegisterParameterCallback(encoder_,
            OnNeedInputParameter, codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
            "Register parameter callback failed, ret: %{public}d", ret);
        AVCODEC_SAMPLE_LOGI("ROI parameter callback registered");
    }

    int ret = OH_VideoEncoder_Configure(encoder_, format);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::GetSurface(SampleInfo &sampleInfo)
{
    int32_t ret = OH_VideoEncoder_GetSurface(encoder_, &sampleInfo.window);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && sampleInfo.window, AVCODEC_SAMPLE_ERR_ERROR,
        "Get surface failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::ProcessROI(OH_NativeBuffer *nativeBuffer)
{
    CHECK_AND_RETURN_RET_LOG(nativeBuffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "nativeBuffer is null");
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "encoder is null");

    int32_t roiSize = 0;
    uint8_t *roiMetadata = nullptr;
    int32_t ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer,
        OH_NativeBuffer_MetadataKey::OH_REGION_OF_INTEREST_METADATA, &roiSize, &roiMetadata);
    if (ret != 0 || roiMetadata == nullptr || roiSize <= 0) {
        AVCODEC_SAMPLE_LOGI("No ROI metadata in this frame");
        return AVCODEC_SAMPLE_ERR_OK;
    }

    char *roiStr = reinterpret_cast<char *>(roiMetadata);
    AVCODEC_SAMPLE_LOGI("ROI string from buffer: %{public}s", roiStr);

    uint32_t roiCount = 0;
    OH_VideoMetadata_GetRoiCount(roiStr, &roiCount);
    CHECK_AND_RETURN_RET_LOG(roiCount > 0, AVCODEC_SAMPLE_ERR_OK, "ROI count is 0");

    OH_AVFormat **formats = new OH_AVFormat *[roiCount];
    uint32_t outCount = 0;
    OH_AVErrCode err = OH_VideoMetadata_ParseRoiString(roiStr, formats, roiCount, &outCount);
    CHECK_AND_RETURN_RET_LOG(err == AV_ERR_OK && outCount > 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Parse ROI string failed");

    for (uint32_t i = 0; i < outCount; i++) {
        OH_AVFormat_SetIntValue(formats[i], OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, -6);
    }

    char *newRoiStr = nullptr;
    for (uint32_t i = 0; i < outCount; i++) {
        OH_VideoMetadata_AppendRoiString(&newRoiStr, formats[i]);
    }
    AVCODEC_SAMPLE_LOGI("New ROI string: %{public}s", newRoiStr);

    OH_AVFormat *roiFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(roiFormat, OH_MD_KEY_VIDEO_ENCODER_ROI_PARAMS, newRoiStr);
    OH_VideoEncoder_SetParameter(encoder_, roiFormat);
    OH_AVFormat_Destroy(roiFormat);

    free(newRoiStr);
    newRoiStr = nullptr;
    for (uint32_t i = 0; i < outCount; i++) {
        OH_AVFormat_Destroy(formats[i]);
    }
    delete[] formats;

    return AVCODEC_SAMPLE_ERR_OK;
}

void VideoEncoder::OnNeedInputParameter(OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData)
{
    if (userData == nullptr || parameter == nullptr) {
        if (parameter != nullptr) {
            OH_VideoEncoder_PushInputParameter(codec, index);
        }
        return;
    }
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    if (codecUserData->sampleInfo == nullptr || !codecUserData->sampleInfo->isROIEnabled
        || codecUserData->sampleInfo->window == nullptr) {
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    float matrix[16] = {0};
    int32_t ret = OH_NativeWindow_GetLastFlushedBufferV2(codecUserData->sampleInfo->window,
        &nativeWindowBuffer, &fenceFd, matrix);
    if (ret != 0 || nativeWindowBuffer == nullptr) {
        AVCODEC_SAMPLE_LOGI("No flushed buffer for ROI");
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
        
    }

    OH_NativeBuffer *nativeBuffer = nullptr;
    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &nativeBuffer);
    if (ret != 0 || nativeBuffer == nullptr) {
        AVCODEC_SAMPLE_LOGE("OH_NativeBuffer_FromNativeWindowBuffer failed");
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    int32_t roiSize = 0;
    uint8_t *roiMetadata = nullptr;
    ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer,
        OH_NativeBuffer_MetadataKey::OH_REGION_OF_INTEREST_METADATA, &roiSize, &roiMetadata);
    if (ret != 0 || roiMetadata == nullptr || roiSize <= 0) {
        AVCODEC_SAMPLE_LOGI("No ROI metadata in this frame");
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    char *roiStr = reinterpret_cast<char *>(roiMetadata);
    AVCODEC_SAMPLE_LOGI("ROI string from buffer: %{public}s", roiStr);

    uint32_t roiCount = 0;
    OH_VideoMetadata_GetRoiCount(roiStr, &roiCount);
    if (roiCount == 0) {
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    OH_AVFormat **formats = new OH_AVFormat *[roiCount];
    uint32_t outCount = 0;
    OH_AVErrCode err = OH_VideoMetadata_ParseRoiString(roiStr, formats, roiCount, &outCount);
    if (err != AV_ERR_OK || outCount == 0) {
        delete[] formats;
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }

    for (uint32_t i = 0; i < outCount; i++) {
        OH_AVFormat_SetIntValue(formats[i], OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, -6);
    }

    char *newRoiStr = nullptr;
    for (uint32_t i = 0; i < outCount; i++) {
        OH_VideoMetadata_AppendRoiString(&newRoiStr, formats[i]);
    }
    AVCODEC_SAMPLE_LOGI("New ROI string: %{public}s", newRoiStr);

    OH_AVFormat_SetStringValue(parameter, OH_MD_KEY_VIDEO_ENCODER_ROI_PARAMS, newRoiStr);

    free(newRoiStr);
    for (uint32_t i = 0; i < outCount; i++) {
        OH_AVFormat_Destroy(formats[i]);
    }
    delete[] formats;

    OH_VideoEncoder_PushInputParameter(codec, index);
}

