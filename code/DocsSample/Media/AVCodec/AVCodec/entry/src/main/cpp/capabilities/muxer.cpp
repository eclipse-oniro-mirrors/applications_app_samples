/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "muxer.h"
// [Start Muxer::Include]
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <fcntl.h>
// [End Muxer::Include]
#include <vector>

#undef LOG_TAG
#define LOG_TAG "Muxer"

namespace {
constexpr int32_t VERTICAL_ANGLE = 90;
constexpr int32_t HORIZONTAL_ANGLE = 0;
constexpr int32_t AUD_CHANNEL_COUNT = 2;
constexpr float KEY_ALTITUDE = 44.4;
constexpr float KEY_LATITUDE = 39.9;
constexpr int32_t KEY_WIDTH = 1280;
constexpr int32_t KEY_HEIGHT = 720;
constexpr float KEY_LONGITUDE = 116.3;
constexpr int32_t AUD_SAMPLE_RATE = 44100;
constexpr float OPENHARMONY_TEST_FLOAT = 1.024;
constexpr int32_t OPENHARMONY_TEST_INT = 1024;
}

Muxer::~Muxer()
{
    Release();
}

// [Start Muxer::Create]
int32_t Muxer::Create(int32_t fd, int32_t outputFormat)
{
    outputFormat_ = outputFormat;
    muxer_ = OH_AVMuxer_Create(fd, static_cast<OH_AVOutputFormat>(outputFormat));
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer create failed, fd: %{public}d", fd);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::Create]

int32_t Muxer::Config(SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    if (sampleInfo.audio.enabled) {
        ret = AddAudioTrack(sampleInfo);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Add audio track failed");
    }

    ret = AddVideoTrack(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Add video track failed");

    return SetRotation();
}

// [Start Muxer::SetRotation]
int32_t Muxer::SetRotation()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    // flv不支持旋转元数据。
    if (outputFormat_ == AV_OUTPUT_FORMAT_FLV) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    // 由于相机的profile只有1920×1080，没有1080×1920，所以得往文件中封装一个90度的角度信息，后续播放才会是竖屏显示。
    int32_t ret = OH_AVMuxer_SetRotation(muxer_, VERTICAL_ANGLE);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Set rotation failed, ret: %{public}d", ret);
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::SetRotation]

int32_t Muxer::SetFileLevelData()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::SetFileLevelData]
    OH_AVFormat *format = OH_AVFormat_Create(); // 使用OH_AVFormat_Create创建format。

    // 设置已定义的key。
    // 从API version 14开始支持设置创建时间（使用ISO 8601标准的时间格式且为UTC时间）。
    OH_AVFormat_SetStringValue(format, OH_MD_KEY_CREATION_TIME, "2024-12-28T00:00:00.000000Z");
    OH_AVFormat_SetStringValue(format, OH_MD_KEY_COMMENT, "comment test"); // 从API version 20开始支持设置备注。值类型为string。
    // 从API version 20开始支持moov box位于mdat box前。默认值为0，设置1代表moov box位于mdat box前。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    // 从API version 24开始支持设置纬度，值类型为float，范围为[-90.0, 90.0]。当需要设置地理位置信息时，纬度和经度是必选的，不能仅设置一种。
    OH_AVFormat_SetFloatValue(format, OH_MD_KEY_LATITUDE, KEY_LATITUDE);
    // 从API version 24开始支持设置经度，值类型为float，范围为[-180.0, 180.0]。当需要设置地理位置信息时，纬度和经度是必选的，不能仅设置一种。
    OH_AVFormat_SetFloatValue(format, OH_MD_KEY_LONGITUDE, KEY_LONGITUDE);
    // 从API version 24开始支持设置海拔，值类型为float，设置地理位置信息时海拔是可选的。
    OH_AVFormat_SetFloatValue(format, OH_MD_KEY_ALTITUDE, KEY_ALTITUDE);

    // 设置用户自定义key（需要com.openharmony.开头）。
    OH_AVFormat_SetIntValue(format, "com.openharmony.testInt", OPENHARMONY_TEST_INT); // 值类型为int32_t。
    OH_AVFormat_SetFloatValue(format, "com.openharmony.testFloat", OPENHARMONY_TEST_FLOAT); // 值类型为float。
    OH_AVFormat_SetStringValue(format, "com.openharmony.testString", "string test"); // 值类型为string，长度不超过256个字符。
    uint8_t testData[] = {1, 2, 3};
    // 从API version 20开始支持值类型为uint8_t*。
    OH_AVFormat_SetBuffer(format, "com.openharmony.testBuffer", testData, sizeof(testData));

    int ret = OH_AVMuxer_SetFormat(muxer_, format); // 设置封装的format。
    if (ret != AV_ERR_OK) {
        // 设置format失败，未找到有效待写入的key数据。
        AVCODEC_SAMPLE_LOGW("Set format failed, ret: %{public}d", ret);
    }
    OH_AVFormat_Destroy(format); // 销毁。
    // [End Muxer::SetFileLevelData]
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Muxer::AddAudioTrackByCreate()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::AddAudioTrackByCreate]
    int audioTrackId = -1;
    uint8_t *buffer = nullptr; // 编码config data，如果没有可以不传。
    size_t size = 0;  // 编码config data的长度，根据实际情况配置。
    OH_AVFormat *formatAudio = OH_AVFormat_Create(); // 使用OH_AVFormat_Create创建format，这里以封装44100Hz采样率、2声道的AAC-LC音频为例。
    CHECK_AND_RETURN_RET_LOG(formatAudio != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create audio format failed");
    OH_AVFormat_SetStringValue(formatAudio, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC); // 必填。
    OH_AVFormat_SetIntValue(formatAudio, OH_MD_KEY_AUD_SAMPLE_RATE, AUD_SAMPLE_RATE); // 必填。
    OH_AVFormat_SetIntValue(formatAudio, OH_MD_KEY_AUD_CHANNEL_COUNT, AUD_CHANNEL_COUNT); // 必填。
    OH_AVFormat_SetIntValue(formatAudio, OH_MD_KEY_PROFILE, AAC_PROFILE_LC); // 选填。
    if (buffer != nullptr && size > 0) {
        OH_AVFormat_SetBuffer(formatAudio, OH_MD_KEY_CODEC_CONFIG, buffer, size); // 选填。
    }

    int ret = OH_AVMuxer_AddTrack(muxer_, &audioTrackId, formatAudio);
    OH_AVFormat_Destroy(formatAudio); // 销毁。
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && audioTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add audio track failed, ret: %{public}d", ret);
    // [End Muxer::AddAudioTrackByCreate]

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Muxer::AddAudioTrack]
int32_t Muxer::AddAudioTrack(SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    // 添加音频轨：用OH_AVFormat_CreateAudioFormat创建format，这里以封装AAC音频为例。
    OH_AVFormat *formatAudio = OH_AVFormat_CreateAudioFormat(sampleInfo.audio.audioCodecMime.data(),
        sampleInfo.audio.audioSampleRate, sampleInfo.audio.audioChannelCount);
    CHECK_AND_RETURN_RET_LOG(formatAudio != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create audio format failed");
    // 设置音频profile，选填。
    OH_AVFormat_SetIntValue(formatAudio, OH_MD_KEY_PROFILE, AAC_PROFILE_LC);
    int32_t ret = OH_AVMuxer_AddTrack(muxer_, &audioTrackId_, formatAudio);
    OH_AVFormat_Destroy(formatAudio);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && audioTrackId_ >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add audio track failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::AddAudioTrack]

int32_t Muxer::AddVideoTrackByCreate()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::AddVideoTrackByCreate]
    int videoTrackId = -1;
    uint8_t *buffer = nullptr; // 编码config data，如果没有可以不传。
    size_t size = 0;  // 编码config data的长度，根据实际情况配置。
    OH_AVFormat *formatVideo = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(formatVideo != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create video format failed");
    OH_AVFormat_SetStringValue(formatVideo, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_VIDEO_AVC); // 必填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_WIDTH, KEY_WIDTH); // 必填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_HEIGHT, KEY_HEIGHT); // 必填。
    if (buffer != nullptr && size > 0) {
        OH_AVFormat_SetBuffer(formatVideo, OH_MD_KEY_CODEC_CONFIG, buffer, size); // 选填。
    }
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // 色彩信息，选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
        OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // 色彩信息，选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_MATRIX_COEFFICIENTS,
        OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // 色彩信息，选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_RANGE_FLAG, 1); // 色彩信息，选填。值为0代表limited range，值为1代表full range。

    int ret = OH_AVMuxer_AddTrack(muxer_, &videoTrackId, formatVideo);
    OH_AVFormat_Destroy(formatVideo); // 销毁。
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && videoTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add video track failed, ret: %{public}d", ret);
    // [End Muxer::AddVideoTrackByCreate]
    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Muxer::AddVideoTrack]
int32_t Muxer::AddVideoTrack(SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    // 添加视频轨：用OH_AVFormat_CreateVideoFormat创建format。
    int32_t encodedWidth = sampleInfo.video.videoWidth;
    int32_t encodedHeight = sampleInfo.video.videoHeight;
    if (sampleInfo.video.preprocMode == VIDEO_PREPROC_DOWNSAMPLING) {
        encodedWidth = sampleInfo.video.downsamplingWidth;
        encodedHeight = sampleInfo.video.downsamplingHeight;
    } else if (sampleInfo.video.preprocMode == VIDEO_PREPROC_CROP) {
        encodedWidth = sampleInfo.video.cropRight - sampleInfo.video.cropLeft + 1;
        encodedHeight = sampleInfo.video.cropBottom - sampleInfo.video.cropTop + 1;
    }
    OH_AVFormat *formatVideo = OH_AVFormat_CreateVideoFormat(sampleInfo.video.videoCodecMime.data(),
        encodedWidth, encodedHeight);
    CHECK_AND_RETURN_RET_LOG(formatVideo != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create video format failed");

    OH_AVFormat_SetDoubleValue(formatVideo, OH_MD_KEY_FRAME_RATE, sampleInfo.video.frameRate);
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_WIDTH, encodedWidth);
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_HEIGHT, encodedHeight);
    OH_AVFormat_SetStringValue(formatVideo, OH_MD_KEY_CODEC_MIME, sampleInfo.video.videoCodecMime.data());
    // HDR Vivid视频需要设置色彩信息相关key，选填。
    if (sampleInfo.video.isHDRVivid) {
        OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_VIDEO_IS_HDR_VIVID, 1);
        OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_RANGE_FLAG, sampleInfo.video.rangFlag);
        OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_COLOR_PRIMARIES, sampleInfo.video.primary);
        OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_TRANSFER_CHARACTERISTICS, sampleInfo.video.transfer);
        OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_MATRIX_COEFFICIENTS, sampleInfo.video.matrix);
    }

    int32_t ret = OH_AVMuxer_AddTrack(muxer_, &videoTrackId_, formatVideo);
    OH_AVFormat_Destroy(formatVideo);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && videoTrackId_ >= 0, AVCODEC_SAMPLE_ERR_ERROR, "AddTrack failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::AddVideoTrack]

int32_t Muxer::AddAudioAuxiliaryTrack()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::AddAudioAuxiliaryTrack]
    int32_t audioAuxlTrackId = -1;
    std::vector<int32_t> audioTrackIDsVector = {0}; // 根据实际情况设置被辅助音频轨的编号，可填写多个值。
    int32_t *audioAuxlTrackIDs = audioTrackIDsVector.data();
    OH_AVFormat *audioAuxlFormat = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(audioAuxlFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create audio format failed");
    OH_AVFormat_SetStringValue(audioAuxlFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC); // 必填。
    OH_AVFormat_SetIntValue(audioAuxlFormat, OH_MD_KEY_AUD_SAMPLE_RATE, AUD_SAMPLE_RATE); // 必填。
    OH_AVFormat_SetIntValue(audioAuxlFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, AUD_CHANNEL_COUNT); // 必填。
    OH_AVFormat_SetIntValue(audioAuxlFormat, OH_MD_KEY_PROFILE, AAC_PROFILE_LC); // 选填。
    OH_AVFormat_SetIntValue(audioAuxlFormat, OH_MD_KEY_TRACK_TYPE,
        static_cast<int32_t>(OH_MediaType::MEDIA_TYPE_AUXILIARY)); // 必填。
    OH_AVFormat_SetStringValue(audioAuxlFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, "auxl"); // 必填。
    OH_AVFormat_SetStringValue(audioAuxlFormat, OH_MD_KEY_TRACK_DESCRIPTION,
        "com.openharmony.audiomode.auxiliary"); // 必填。
    OH_AVFormat_SetIntBuffer(audioAuxlFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, audioAuxlTrackIDs,
        audioTrackIDsVector.size()); // 必填。

    int ret = OH_AVMuxer_AddTrack(muxer_, &audioAuxlTrackId, audioAuxlFormat);
    OH_AVFormat_Destroy(audioAuxlFormat);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && audioAuxlTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add audio auxiliary track failed, ret: %{public}d", ret);
    // [End Muxer::AddAudioAuxiliaryTrack]
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Muxer::AddVideoAuxiliaryTrack()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::AddVideoAuxiliaryTrack]
    int32_t videoAuxlTrackId = -1;
    std::vector<int32_t> videoTrackIDsVector = {0}; // 根据实际情况设置被辅助视频轨的编号，可填写多个值。
    int32_t *videoAuxlTrackIDs = videoTrackIDsVector.data();
    OH_AVFormat *videoAuxlFormat = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(videoAuxlFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create video format failed");
    OH_AVFormat_SetStringValue(videoAuxlFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_VIDEO_AVC); // 必填。
    OH_AVFormat_SetIntValue(videoAuxlFormat, OH_MD_KEY_WIDTH, KEY_WIDTH); // 必填。
    OH_AVFormat_SetIntValue(videoAuxlFormat, OH_MD_KEY_HEIGHT, KEY_HEIGHT); // 必填。
    OH_AVFormat_SetIntValue(videoAuxlFormat, OH_MD_KEY_TRACK_TYPE,
        static_cast<int32_t>(OH_MediaType::MEDIA_TYPE_AUXILIARY)); // 必填。
    OH_AVFormat_SetStringValue(videoAuxlFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE, "vdep"); // 必填。
    OH_AVFormat_SetStringValue(videoAuxlFormat, OH_MD_KEY_TRACK_DESCRIPTION, "com.openharmony.moviemode.depth"); // 必填。
    OH_AVFormat_SetIntBuffer(videoAuxlFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, videoAuxlTrackIDs,
        videoTrackIDsVector.size()); // 必填。

    int ret = OH_AVMuxer_AddTrack(muxer_, &videoAuxlTrackId, videoAuxlFormat);
    OH_AVFormat_Destroy(videoAuxlFormat);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && videoAuxlTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add video auxiliary track failed, ret: %{public}d", ret);
    // [End Muxer::AddVideoAuxiliaryTrack]
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Muxer::AddCoverTrackByCreate()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    // [Start Muxer::AddCoverTrackByCreate]
    int coverTrackId = -1;
    OH_AVFormat *formatCover = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(formatCover != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create cover format failed");
    OH_AVFormat_SetStringValue(formatCover, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_IMAGE_JPG);
    OH_AVFormat_SetIntValue(formatCover, OH_MD_KEY_WIDTH, KEY_WIDTH);
    OH_AVFormat_SetIntValue(formatCover, OH_MD_KEY_HEIGHT, KEY_HEIGHT);

    int ret = OH_AVMuxer_AddTrack(muxer_, &coverTrackId, formatCover);
    OH_AVFormat_Destroy(formatCover); // 销毁。
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && coverTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add cover track failed, ret: %{public}d", ret);
    // [End Muxer::AddCoverTrackByCreate]
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Muxer::CreateFormat()
{
    // [Start Muxer::CreateFormat]
    int coverTrackId = -1;
    OH_AVFormat *formatCover = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_IMAGE_JPG, 1280, 720);
    
    int ret = OH_AVMuxer_AddTrack(muxer_, &coverTrackId, formatCover);
    OH_AVFormat_Destroy(formatCover); // 销毁。
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && coverTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add cover track failed, ret: %{public}d", ret);
    // [End Muxer::CreateFormat]
    return AVCODEC_SAMPLE_ERR_OK;
}
 
int32_t Muxer::AddFileData()
{
    // [Start Muxer::AddFileData]
    OH_AVFormat *format = OH_AVFormat_Create(); // 使用OH_AVFormat_Create创建format。
    
    // 设置已定义的key。
    // 从API version 14开始支持设置创建时间（使用ISO 8601标准的时间格式且为UTC时间）。
    OH_AVFormat_SetStringValue(format, OH_MD_KEY_CREATION_TIME, "2024-12-28T00:00:00.000000Z");
    // 从API version 20开始支持设置备注。值类型为string。
    OH_AVFormat_SetStringValue(format, OH_MD_KEY_COMMENT, "comment test");
    
    // 设置用户自定义key（需要com.openharmony.开头）。
    OH_AVFormat_SetStringValue(format, "com.openharmony.testString", "string test"); // 值类型为string，长度不超过256个字符。
    
    int ret = OH_AVMuxer_SetFormat(muxer_, format); // 设置封装的format。
    if (ret != AV_ERR_OK) {
        // 设置format失败，未找到有效待写入的key数据。
        AVCODEC_SAMPLE_LOGW("Set format failed, ret: %{public}d", ret);
    }
    OH_AVFormat_Destroy(format); // 销毁。
    // [End Muxer::AddFileData]
    return AVCODEC_SAMPLE_ERR_OK;
}
 
int32_t Muxer::AddAACTrack()
{
    // [Start Muxer::AddAACTrack]
    int audioTrackId = -1;
    // 以封装44100Hz采样率、2声道的AAC-LC音频为例。
    OH_AVFormat *formatAudio = OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, 44100, 2);
    OH_AVFormat_SetIntValue(formatAudio, OH_MD_KEY_PROFILE, AAC_PROFILE_LC); // 选填。
    
    int ret = OH_AVMuxer_AddTrack(muxer_, &audioTrackId, formatAudio);
    OH_AVFormat_Destroy(formatAudio);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && audioTrackId >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Add audio track failed, ret: %{public}d", ret);
    // [End Muxer::AddAACTrack]
    return AVCODEC_SAMPLE_ERR_OK;
}
 
int32_t Muxer::AddVideoTrack()
{
    OH_AVFormat *formatVideo = OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_VIDEO_H263, 44100, 2);
    // [Start Muxer::SetVideoTrack]
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // 选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
        OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // 选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_MATRIX_COEFFICIENTS,
        OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // 选填。
    OH_AVFormat_SetIntValue(formatVideo, OH_MD_KEY_RANGE_FLAG, 1); // 选填。值为0代表limited range，值为1代表full range。
    // [End Muxer::SetVideoTrack]
    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Muxer::Start]
int32_t Muxer::Start()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    int ret = OH_AVMuxer_Start(muxer_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::Start]

// [Start Muxer::WriteSample]
int32_t Muxer::WriteSample(int32_t trackId, OH_AVBuffer *buffer, OH_AVCodecBufferAttr &attr)
{
    // 音视频编码输出可能由不同线程到达；整个“更新属性并写入容器”过程需要保持原子性。
    std::lock_guard<std::mutex> lock(writeMutex_);

    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");
    CHECK_AND_RETURN_RET_LOG(buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Get a empty buffer");

    int32_t ret = OH_AVBuffer_SetBufferAttr(buffer, &attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "SetBufferAttr failed");

    ret = OH_AVMuxer_WriteSampleBuffer(muxer_, trackId, buffer);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Write sample failed");
    // Muxer不接管编码器输出Buffer；调用方仍需使用原bufferIndex将该Buffer归还给编码器。
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::WriteSample]

// [Start Muxer::Stop]
int32_t Muxer::Stop()
{
    CHECK_AND_RETURN_RET_LOG(muxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Muxer is null");

    int32_t ret = OH_AVMuxer_Stop(muxer_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Muxer stop failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::Stop]

// [Start Muxer::Release]
int32_t Muxer::Release()
{
    if (muxer_ != nullptr) {
        // Destroy只释放封装器资源，不关闭Create()时由业务侧传入的文件描述符。
        OH_AVMuxer_Destroy(muxer_);
        muxer_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Muxer::Release]

int32_t Muxer::GetVideoTrackId()
{
    return videoTrackId_;
}

int32_t Muxer::GetAudioTrackId()
{
    return audioTrackId_;
}
