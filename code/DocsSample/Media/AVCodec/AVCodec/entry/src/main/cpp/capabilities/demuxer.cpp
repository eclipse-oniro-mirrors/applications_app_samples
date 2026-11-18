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

#include "demuxer.h"
#include <cstdint>
#include <cstdio>
#include <cstring>
// [Start Demuxer::IncludeHeaders]
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/drm_framework/native_drm_common.h>
#include <sys/stat.h>
#include <fstream>
#include <string>
// [End Demuxer::IncludeHeaders]

#undef LOG_TAG
#define LOG_TAG "Demuxer"

namespace {
constexpr size_t CODEC_CONFIG_LOG_BYTES = 2;
using namespace std;
constexpr size_t MAX_CODEC_CONFIG_SIZE = 1024 * 1024;

string CopyFormatDump(OH_AVFormat *format)
{
    const char *dump = OH_AVFormat_DumpInfo(format);
    return dump == nullptr ? "" : dump;
}
}

// [Start Demuxer::AVSourceReadAt]
// 自定义数据源读取回调：按pos和length从g_filePath指向的文件读取数据填充到data。
// 使用OH_AVSource_CreateWithDataSource创建source前需要先实现该函数，并将待解封装文件路径写入g_filePath。
// g_filePath在Demuxer::Create中、解封装线程启动前完成赋值；当前播放链路同一时刻仅持有一个Demuxer实例。
static std::string g_filePath;

enum MediaDataSourceError : int32_t {
    SOURCE_ERROR_IO = -2,
    SOURCE_ERROR_EOF = -1
};

static int32_t AVSourceReadAt(OH_AVBuffer *data, int32_t length, int64_t pos)
{
    // 回调可能由解封装器内部多线程触发，每次读取独立打开文件以保证线程安全。
    if (data == nullptr) {
        AVCODEC_SAMPLE_LOGW("AVSourceReadAt: data is nullptr");
        return MediaDataSourceError::SOURCE_ERROR_IO;
    }
    char *addr = reinterpret_cast<char *>(OH_AVBuffer_GetAddr(data));
    if (addr == nullptr) {
        AVCODEC_SAMPLE_LOGW("AVSourceReadAt: buffer address is nullptr");
        return MediaDataSourceError::SOURCE_ERROR_IO;
    }
    std::ifstream infile(g_filePath, std::ifstream::binary);
    if (!infile.is_open()) {
        AVCODEC_SAMPLE_LOGW("AVSourceReadAt: open file failed, file: %{public}s", g_filePath.c_str());
        return MediaDataSourceError::SOURCE_ERROR_IO;  // 打开文件失败。
    }
    infile.seekg(0, std::ios::end);
    int64_t fileSize = infile.tellg();
    if (pos >= fileSize) {
        AVCODEC_SAMPLE_LOGW("AVSourceReadAt: pos is over or equals file size");
        return MediaDataSourceError::SOURCE_ERROR_EOF;  // pos已经是文件末尾位置，无法读取。
    }
    if (pos + length > fileSize) {
        length = static_cast<int32_t>(fileSize - pos);  // pos+length超过文件大小时，读取从pos到文件末尾的数据。
    }
    infile.seekg(pos, std::ios::beg);
    if (length <= 0) {
        AVCODEC_SAMPLE_LOGW("AVSourceReadAt: read length is less than zero");
        return MediaDataSourceError::SOURCE_ERROR_IO;
    }
    infile.read(addr, length);
    return length;
}
// [End Demuxer::AVSourceReadAt]

// [Start Demuxer::OnDrmInfoChangedWithObj]
// DRM信息监听回调OnDrmInfoChangedWithObj实现。
static void OnDrmInfoChangedWithObj(OH_AVDemuxer *demuxer, DRM_MediaKeySystemInfo *drmInfo)
{
    // 解析DRM信息，包括数量、DRM类型及对应pssh，用于后续创建MediaKeySystem、MediaKeySession并设置解码器解密配置。
    if (drmInfo == nullptr) {
        return;
    }
    AVCODEC_SAMPLE_LOGI("Demuxer DRM info changed, demuxer: %{public}p, pssh count: %{public}u",
        static_cast<void *>(demuxer), drmInfo->psshCount);
    for (uint32_t index = 0; index < drmInfo->psshCount && index < MAX_PSSH_INFO_COUNT; index++) {
        const DRM_PsshInfo &pssh = drmInfo->psshInfo[index];
        char uuid[DRM_UUID_LEN * 2 + 1] = {0};
        for (uint32_t uuidIndex = 0; uuidIndex < DRM_UUID_LEN; uuidIndex++) {
            snprintf(uuid + uuidIndex * 2, 3, "%02x", pssh.uuid[uuidIndex]);
        }
        AVCODEC_SAMPLE_LOGI("Demuxer DRM pssh[%{public}u] uuid: %{public}s, dataLen: %{public}d", index, uuid,
            pssh.dataLen);
    }
}
// [End Demuxer::OnDrmInfoChangedWithObj]

Demuxer::~Demuxer() { Release(); }

int32_t Demuxer::Create(SampleInfo &info)
{
    videoTrackId_ = -1;
    audioTrackId_ = -1;
    info.audio.trackIndex = -1;
    // 输入按优先级选择：uri（网络或本地路径） > 自定义数据源（沙箱文件路径） > fd。
    if (!info.source.inputUri.empty()) {
        // [Start Demuxer::CreateSourceWithURI]
        // 为 uri 资源文件创建 source 资源实例（可选）。使用网络URI前需先在module.json5中申请Internet权限。
        source_ = OH_AVSource_CreateWithURI(const_cast<char *>(info.source.inputUri.c_str()));
        CHECK_AND_RETURN_RET_LOG(source_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
            "Create demuxer source failed, uri: %{public}s", info.source.inputUri.c_str());
        // [End Demuxer::CreateSourceWithURI]
    } else if (!info.source.inputFilePath.empty()) {
        // [Start Demuxer::CreateSourceWithDataSource]
        // 为自定义数据源创建 source 资源实例（可选）。使用该方式前，需要先实现AVSourceReadAt接口函数实现。
        g_filePath = info.source.inputFilePath;
        struct stat fileStatus {};
        CHECK_AND_RETURN_RET_LOG(stat(g_filePath.c_str(), &fileStatus) == 0, AVCODEC_SAMPLE_ERR_ERROR,
            "Get file status failed, path: %{public}s", g_filePath.c_str());
        OH_AVDataSource dataSource = {fileStatus.st_size, AVSourceReadAt};
        source_ = OH_AVSource_CreateWithDataSource(&dataSource);
        CHECK_AND_RETURN_RET_LOG(source_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
            "Create demuxer source with data source failed, path: %{public}s", g_filePath.c_str());
        // [End Demuxer::CreateSourceWithDataSource]
    } else {
        // [Start Demuxer::CreateSourceWithFD]
        // fd由应用侧打开后传入。offset（文件起始偏移）、fileSize（文件大小）需与待解封装文件匹配：
        // fd指向单个资源文件时，offset为0、fileSize为资源文件大小；
        // fd指向多个连续拼接的资源文件时（如多个mp3二进制拼接），offset、fileSize按实际偏移和大小设置。
        source_ = OH_AVSource_CreateWithFD(info.source.inputFd, info.source.inputFileOffset,
            info.source.inputFileSize);
        CHECK_AND_RETURN_RET_LOG(source_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
            "Create demuxer source failed, fd: %{public}d, offset: %{public}" PRId64", file size: %{public}" PRId64,
            info.source.inputFd, info.source.inputFileOffset, info.source.inputFileSize);
        // [End Demuxer::CreateSourceWithFD]
    }

    // [Start Demuxer::CreateDemuxer]
    // 为资源实例创建对应的解封装器。
    demuxer_ = OH_AVDemuxer_CreateWithSource(source_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create demuxer failed");
    // [End Demuxer::CreateDemuxer]

    // [Start Demuxer::SetDemuxerMediaKeySystemInfoCallback]
    // 注册DRM信息监听回调（可选，非DRM码流不会触发）。回调返回解封装器实例，适用于多个解封装器场景。
    Demuxer_MediaKeySystemInfoCallback callback = &OnDrmInfoChangedWithObj;
    OH_AVErrCode drmRet = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(demuxer_, callback);
    if (drmRet != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Set demuxer media key system info callback failed, ret: %{public}d", drmRet);
    }
    // [End Demuxer::SetDemuxerMediaKeySystemInfoCallback]

    // [Start Demuxer::GetCustomMetadataFormat]
    // 获取文件用户自定义属性（可选，仅当封装时写入了自定义属性时返回非空）。
    // customKey需与封装时写入的key完全一致（含完整命名层级），value类型需与封装时数据类型匹配。
    std::shared_ptr<OH_AVFormat> customMetadataFormat(OH_AVSource_GetCustomMetadataFormat(source_),
        OH_AVFormat_Destroy);
    if (customMetadataFormat != nullptr) {
        info.source.customMetadataDump = CopyFormatDump(customMetadataFormat.get());
        AVCODEC_SAMPLE_LOGI("Custom metadata: %{public}s", info.source.customMetadataDump.c_str());
    }
    // [End Demuxer::GetCustomMetadataFormat]

    // [Start Demuxer::GetSourceFormat]
    // 获取文件级属性（sourceFormat），轨道数、时长等从中读取。
    auto sourceFormat = std::shared_ptr<OH_AVFormat>(OH_AVSource_GetSourceFormat(source_), OH_AVFormat_Destroy);
    CHECK_AND_RETURN_RET_LOG(sourceFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Get source format failed");
    // [End Demuxer::GetSourceFormat]

    // 先校验显式指定的音轨。指定轨道不是音频时，仍回退到历史行为：选择第一条音频轨。
    if (info.codec.audioTrackIndex >= 0) {
        auto requestedFormat = GetTrackFormat(info.codec.audioTrackIndex);
        if (requestedFormat == nullptr || GetTrackType(requestedFormat) != MEDIA_TYPE_AUD) {
            AVCODEC_SAMPLE_LOGW("Requested audio track is unavailable, fallback to first audio track: %{public}d",
                info.codec.audioTrackIndex);
            info.codec.audioTrackIndex = -1;
        }
    }

    int32_t ret = GetTrackInfo(sourceFormat, info);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Get video track info failed");

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Demuxer::ReadSample]
int32_t Demuxer::ReadSample(int32_t trackId, OH_AVBuffer *buffer, OH_AVCodecBufferAttr &attr)
{
    // 在调用OH_AVDemuxer_ReadSampleBuffer接口获取数据前，需要先调用OH_AVDemuxer_SelectTrackByID选中需要获取数据的轨道。
    // 注意：在avi、mpg、wmv格式下，由于容器标准不支持封装时间戳信息，
    // demuxer解出的帧中不含pts信息，需要调用方根据帧率及解码出帧后的显示顺序自行计算显示时间戳信息。
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    int32_t ret = OH_AVDemuxer_ReadSampleBuffer(demuxer_, trackId, buffer);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Read sample failed");
    ret = OH_AVBuffer_GetBufferAttr(buffer, &attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "GetBufferAttr failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Demuxer::ReadSample]

// [Start Demuxer::SelectAudioTrack]
int32_t Demuxer::SelectAudioTrack(int32_t trackIndex, SampleInfo &info)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    auto trackFormat = GetTrackFormat(trackIndex);
    CHECK_AND_RETURN_RET_LOG(trackFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Get audio track format failed, index: %{public}d", trackIndex);
    CHECK_AND_RETURN_RET_LOG(GetTrackType(trackFormat) == MEDIA_TYPE_AUD, AVCODEC_SAMPLE_ERR_ERROR,
        "Selected track is not an audio track, index: %{public}d", trackIndex);
    // 先解析到临时对象。切换失败时，当前元数据和Demuxer已选轨集合必须保持不变。
    SampleInfo candidateInfo = info;
    CHECK_AND_RETURN_RET_LOG(PopulateAudioTrackInfo(trackFormat, trackIndex, candidateInfo) == AVCODEC_SAMPLE_ERR_OK,
        AVCODEC_SAMPLE_ERR_ERROR, "Parse audio track failed, index: %{public}d", trackIndex);

    // Seek和ReadSample要求轨道处于选中状态。先取消旧音轨，否则Demuxer会继续推进旧流。
    const int32_t previousTrackId = audioTrackId_;
    if (previousTrackId >= 0 && previousTrackId != trackIndex) {
        OH_AVDemuxer_UnselectTrackByID(demuxer_, static_cast<uint32_t>(previousTrackId));
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer_, static_cast<uint32_t>(trackIndex)) != AV_ERR_OK) {
        if (previousTrackId >= 0) {
            OH_AVDemuxer_SelectTrackByID(demuxer_, static_cast<uint32_t>(previousTrackId));
        }
        AVCODEC_SAMPLE_LOGE("Select audio track failed, index: %{public}d", trackIndex);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    info.audio = candidateInfo.audio;
    // 读取音频样本时使用此容器轨道ID，因此必须和上方选中的元数据同步。
    audioTrackId_ = trackIndex;
    LogAudioConfig(info, info.audio.audioCodecMime.c_str());
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Demuxer::SelectAudioTrack]

int32_t Demuxer::GetAudioTrackInfo(int32_t trackIndex, AudioSampleInfo &audioInfo)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    auto trackFormat = GetTrackFormat(trackIndex);
    CHECK_AND_RETURN_RET_LOG(trackFormat != nullptr && GetTrackType(trackFormat) == MEDIA_TYPE_AUD,
        AVCODEC_SAMPLE_ERR_ERROR, "Audio track is unavailable, index: %{public}d", trackIndex);
    SampleInfo candidateInfo;
    CHECK_AND_RETURN_RET_LOG(PopulateAudioTrackInfo(trackFormat, trackIndex, candidateInfo) == AVCODEC_SAMPLE_ERR_OK,
        AVCODEC_SAMPLE_ERR_ERROR, "Parse audio track failed, index: %{public}d", trackIndex);
    audioInfo = std::move(candidateInfo.audio);
    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Demuxer::GetMediaKeySystemInfo]
int32_t Demuxer::GetMediaKeySystemInfo(DRM_MediaKeySystemInfo &mediaKeySystemInfo)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    // 在监听到DRM信息后，可主动调用该接口获取DRM信息（uuid及对应pssh）。
    OH_AVErrCode ret = OH_AVDemuxer_GetMediaKeySystemInfo(demuxer_, &mediaKeySystemInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Get media key system info failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Demuxer::GetMediaKeySystemInfo]

// [Start Demuxer::Release]
int32_t Demuxer::Release()
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    // 需要用户调用 OH_AVDemuxer_Destroy 接口成功后，手动将实例置为nullptr，对同一实例重复调用会导致程序错误。
    // Demuxer必须先于Source销毁；fd由应用侧管理，不由解封装模块关闭。
    if (demuxer_ != nullptr) {
        OH_AVDemuxer_Destroy(demuxer_);
        demuxer_ = nullptr;
    }
    if (source_ != nullptr) {
        OH_AVSource_Destroy(source_);
        source_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End Demuxer::Release]

int32_t Demuxer::GetTrackInfo(std::shared_ptr<OH_AVFormat> sourceFormat, SampleInfo &info)
{
    // [Start Demuxer::GetTrackCount]
    // 获取文件轨道数等文件级属性（可选，若用户已知轨道信息，可跳过此步）。
    // trackCount为0表示文件中无轨道，需根据业务做其他处理。
    OH_AVFormat_GetLongValue(sourceFormat.get(), OH_MD_KEY_DURATION, &info.source.durationUs);
    OH_AVFormat_GetIntValue(sourceFormat.get(), OH_MD_KEY_TRACK_COUNT, &info.source.trackCount);
    info.source.sourceFormatDump = CopyFormatDump(sourceFormat.get());
    // [End Demuxer::GetTrackCount]

    // [Start Demuxer::GetTrackInfo]
    // 遍历轨道获取轨道级属性。不支持的类型不会修改trackType的值，
    // trackType初始值建议设为非有效值（如-1），避免误用。
    info.source.trackFormats.clear();
    for (int32_t index = 0; index < info.source.trackCount; index++) {
        auto trackFormat = GetTrackFormat(index);
        if (trackFormat == nullptr) {
            AVCODEC_SAMPLE_LOGW("Get track format failed, index: %{public}d", index);
            continue;
        }
        int trackType = GetTrackType(trackFormat);
        SaveTrackFormat(trackFormat, index, trackType, info);
        if (trackType == MEDIA_TYPE_VID) {
            ProcessVideoTrack(trackFormat, index, info);
        } else if (trackType == MEDIA_TYPE_AUD) {
            ProcessAudioTrack(trackFormat, index, info);
        }
    }
    return AVCODEC_SAMPLE_ERR_OK;
    // [End Demuxer::GetTrackInfo]
}

std::shared_ptr<OH_AVFormat> Demuxer::GetTrackFormat(int32_t index)
{
    return std::shared_ptr<OH_AVFormat>(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
}

int Demuxer::GetTrackType(std::shared_ptr<OH_AVFormat> trackFormat)
{
    int trackType = -1;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_TRACK_TYPE, &trackType);
    return trackType;
}

// [Start Demuxer::SaveTrackFormat]
void Demuxer::SaveTrackFormat(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, int32_t trackType,
    SampleInfo &info)
{
    MediaTrackFormatInfo trackInfo;
    trackInfo.trackIndex = index;
    trackInfo.trackType = trackType;
    char *codecMime = nullptr;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&codecMime));
    trackInfo.codecMime = codecMime == nullptr ? "" : codecMime;
    // 辅助轨：根据辅助轨类型处理轨道参考关系。
    // referenceType为辅助轨类型，referenceIds为被参考的轨道ID。
    if (trackType == MEDIA_TYPE_AUXILIARY) {
        const char *referenceType = nullptr;
        if (OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_TRACK_REFERENCE_TYPE, &referenceType) &&
            referenceType != nullptr) {
            trackInfo.referenceType = referenceType;
        }
        int32_t *referenceIds = nullptr;
        size_t referenceIdsCount = 0;
        if (OH_AVFormat_GetIntBuffer(trackFormat.get(), OH_MD_KEY_REFERENCE_TRACK_IDS, &referenceIds,
            &referenceIdsCount) && referenceIds != nullptr) {
            trackInfo.referenceTrackIds.assign(referenceIds, referenceIds + referenceIdsCount);
        }
        AVCODEC_SAMPLE_LOGI("Auxiliary track, index: %{public}d, reference type: %{public}s, reference track count: "
            "%{public}zu", index, trackInfo.referenceType.c_str(), trackInfo.referenceTrackIds.size());
    }
    if (trackType == MEDIA_TYPE_AUD) {
        OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &trackInfo.audioSampleRate);
        OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &trackInfo.audioChannelCount);
    }
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &trackInfo.bitrate);
    trackInfo.formatDump = CopyFormatDump(trackFormat.get());
    info.source.trackFormats.push_back(std::move(trackInfo));
}
// [End Demuxer::SaveTrackFormat]

// [Start Demuxer::ProcessVideoTrack]
void Demuxer::ProcessVideoTrack(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, SampleInfo &info)
{
    OH_AVDemuxer_SelectTrackByID(demuxer_, index);

    char *videoCodecMime = nullptr;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&videoCodecMime));
    if (videoCodecMime == nullptr || strncmp(videoCodecMime, "video/", strlen("video/")) != 0) {
        AVCODEC_SAMPLE_LOGW("Not a video track, mime: %{public}s", videoCodecMime);
        return;
    }

    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_WIDTH, &info.video.videoWidth);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_HEIGHT, &info.video.videoHeight);
    OH_AVFormat_GetDoubleValue(trackFormat.get(), OH_MD_KEY_FRAME_RATE, &info.video.frameRate);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &info.video.bitrate);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_ROTATION, &info.video.rotation);
    int32_t colorPrimary = static_cast<int32_t>(info.video.primary);
    if (OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_COLOR_PRIMARIES, &colorPrimary)) {
        info.video.primary = static_cast<OH_ColorPrimary>(colorPrimary);
    }
    int32_t transfer = static_cast<int32_t>(info.video.transfer);
    if (OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_TRANSFER_CHARACTERISTICS, &transfer)) {
        info.video.transfer = static_cast<OH_TransferCharacteristic>(transfer);
    }
    int32_t matrix = static_cast<int32_t>(info.video.matrix);
    if (OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_MATRIX_COEFFICIENTS, &matrix)) {
        info.video.matrix = static_cast<OH_MatrixCoefficient>(matrix);
    }
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_RANGE_FLAG, &info.video.rangFlag);
    int32_t hdrVividContainerSignaled = 0;
    if (OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_VIDEO_IS_HDR_VIVID,
        &hdrVividContainerSignaled)) {
        info.video.hdrVividContainerSignaled = hdrVividContainerSignaled == 1;
    }

    info.video.videoCodecMime = videoCodecMime;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_PROFILE, &info.video.hevcProfile);
    videoTrackId_ = index;

    LogVideoConfig(info, videoCodecMime);
}
// [End Demuxer::ProcessVideoTrack]

void Demuxer::ProcessAudioTrack(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, SampleInfo &info)
{
    // 默认保留第一条音轨；调用方可通过CodecOptions::audioTrackIndex显式指定容器轨道索引。
    if (info.audio.trackIndex >= 0 ||
        (info.codec.audioTrackIndex >= 0 && info.codec.audioTrackIndex != index)) {
        return;
    }
    OH_AVDemuxer_SelectTrackByID(demuxer_, index);
    if (PopulateAudioTrackInfo(trackFormat, index, info) != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Parse audio track failed, index: %{public}d", index);
        return;
    }
    audioTrackId_ = index;

    LogAudioConfig(info, info.audio.audioCodecMime.c_str());
}

int32_t Demuxer::PopulateAudioTrackInfo(std::shared_ptr<OH_AVFormat> trackFormat, int32_t trackIndex,
    SampleInfo &info)
{
    char *audioCodecMime = nullptr;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&audioCodecMime));
    CHECK_AND_RETURN_RET_LOG(audioCodecMime != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Audio track mime is null, index: %{public}d", trackIndex);
    AudioSampleInfo audioInfo;
    audioInfo.trackIndex = trackIndex;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &audioInfo.audioSampleFormat);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &audioInfo.audioChannelCount);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_CHANNEL_LAYOUT, &audioInfo.audioChannelLayout);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &audioInfo.audioSampleRate);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &audioInfo.audioBitRate);
    info.audio = std::move(audioInfo);
    HandleCodecConfig(trackFormat, info);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AAC_IS_ADTS, &info.audio.aacAdts);
    info.audio.audioCodecMime = audioCodecMime;
    return AVCODEC_SAMPLE_ERR_OK;
}

void Demuxer::HandleCodecConfig(std::shared_ptr<OH_AVFormat> trackFormat, SampleInfo &info)
{
    uint8_t *sourceCodecConfig = nullptr;
    size_t sourceLength = 0;
    info.audio.codecConfigLen = 0;
    info.audio.codecConfig.clear();
    OH_AVFormat_GetBuffer(trackFormat.get(), OH_MD_KEY_CODEC_CONFIG, &sourceCodecConfig, &sourceLength);

    if (sourceCodecConfig != nullptr && sourceLength > 0 && sourceLength <= MAX_CODEC_CONFIG_SIZE) {
        info.audio.codecConfigLen = sourceLength;
        info.audio.codecConfig.assign(sourceCodecConfig, sourceCodecConfig + sourceLength);
        LogCodecConfigDetails(info);
    } else if (sourceLength > MAX_CODEC_CONFIG_SIZE) {
        AVCODEC_SAMPLE_LOGW("Codec config is too large, skip it, size: %{public}zu, limit: %{public}zu",
            sourceLength, MAX_CODEC_CONFIG_SIZE);
    }
}

void Demuxer::LogVideoConfig(const SampleInfo &info, const char *videoCodecMime)
{
    AVCODEC_SAMPLE_LOGI("====== Demuxer Video config ======");
    AVCODEC_SAMPLE_LOGI("Mime: %{public}s", videoCodecMime);
    AVCODEC_SAMPLE_LOGI("%{public}d * %{public}d, %{public}.1ffps, %{public}" PRId64 "kbps",
                        info.video.videoWidth, info.video.videoHeight, info.video.frameRate, info.video.bitrate / 1024);
    AVCODEC_SAMPLE_LOGI("====== Demuxer Video config ======");
}

void Demuxer::LogAudioConfig(const SampleInfo &info, const char *audioCodecMime)
{
    AVCODEC_SAMPLE_LOGI("====== Demuxer Audio config ======");
    AVCODEC_SAMPLE_LOGI("audioMime:%{public}s sampleForamt:%{public}d sampleRate:%{public}d "
                        "channelCount:%{public}d channelLayout:%{public}ld adts:%{public}i",
                        audioCodecMime, info.audio.audioSampleFormat, info.audio.audioSampleRate,
                        info.audio.audioChannelCount, info.audio.audioChannelLayout, info.audio.aacAdts);
    AVCODEC_SAMPLE_LOGI("====== Demuxer Audio config ======");
}

void Demuxer::LogCodecConfigDetails(const SampleInfo &info)
{
    if (info.audio.codecConfigLen < CODEC_CONFIG_LOG_BYTES ||
        info.audio.codecConfig.size() < CODEC_CONFIG_LOG_BYTES) {
        return;
    }
    AVCODEC_SAMPLE_LOGI("codecConfig:%{public}p, len:%{public}i, 0:0x%{public}02x 1:0x:%{public}02x, bufLen:%{public}u",
                        info.audio.codecConfig.data(), static_cast<int>(info.audio.codecConfigLen),
                        info.audio.codecConfig[0], info.audio.codecConfig[1],
                        static_cast<unsigned int>(info.audio.codecConfig.size()));
}

int32_t Demuxer::GetVideoTrackId() { return videoTrackId_; }
int32_t Demuxer::GetAudioTrackId() { return audioTrackId_; }

// [Start Demuxer::Seek]
int32_t Demuxer::Seek(int64_t positionMs, OH_AVSeekMode mode)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    int32_t ret = OH_AVDemuxer_SeekToTime(demuxer_, positionMs, mode);
    if (ret == AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGI("Demuxer seek succeeded: position=%{public}lld ms, mode=%{public}d, "
            "video track=%{public}d, audio track=%{public}d", static_cast<long long>(positionMs),
            static_cast<int32_t>(mode), videoTrackId_, audioTrackId_);
        return AVCODEC_SAMPLE_ERR_OK;
    }
    AVCODEC_SAMPLE_LOGW("Demuxer seek failed: position=%{public}lld ms, mode=%{public}d, ret=%{public}d, "
        "video track=%{public}d, audio track=%{public}d", static_cast<long long>(positionMs),
        static_cast<int32_t>(mode), ret, videoTrackId_, audioTrackId_);
    // 精确定位通常从前一个同步帧开始。部分MP4索引无法提供该帧，但仍能提供邻近或后续同步帧。
    // 仅当前序同步帧请求失败后才重试，常规Seek仍优先使用前序同步帧。
    if (mode != SEEK_MODE_PREVIOUS_SYNC) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    ret = OH_AVDemuxer_SeekToTime(demuxer_, positionMs, SEEK_MODE_CLOSEST_SYNC);
    if (ret == AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Demuxer seek recovered with closest sync sample: position=%{public}lld ms",
            static_cast<long long>(positionMs));
        return AVCODEC_SAMPLE_ERR_OK;
    }
    ret = OH_AVDemuxer_SeekToTime(demuxer_, positionMs, SEEK_MODE_NEXT_SYNC);
    if (ret == AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Demuxer seek recovered with following sync sample: position=%{public}lld ms",
            static_cast<long long>(positionMs));
        return AVCODEC_SAMPLE_ERR_OK;
    }
    AVCODEC_SAMPLE_LOGE("Demuxer seek fallback failed: position=%{public}lld ms, ret=%{public}d",
        static_cast<long long>(positionMs), ret);
    return AVCODEC_SAMPLE_ERR_ERROR;
}
// [End Demuxer::Seek]
