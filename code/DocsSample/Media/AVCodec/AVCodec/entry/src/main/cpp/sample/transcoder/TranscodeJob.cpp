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

#include "TranscodeJob.h"
#include <cerrno>
#include <cmath>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>
#include <utility>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <native_window/external_window.h>

namespace {
constexpr int64_t POLL_TIMEOUT_US = 0;
constexpr int32_t AUDIO_BUFFER_BYTES = 1024 * 1024;
constexpr int64_t AUDIO_LEAD_US = 500000;
constexpr auto STALL_LIMIT = std::chrono::seconds(30);
constexpr auto POLL_INTERVAL = std::chrono::milliseconds(2);
constexpr int32_t STATE_FINISHED = 2;
constexpr int32_t STATE_CANCELLED = 3;
constexpr int32_t STATE_FAILED = 4;
}

TranscodeJob::TranscodeJob(TranscodeOptions options) : options_(std::move(options)) {}
TranscodeJob::~TranscodeJob() { Cleanup(); }

TranscodeSnapshot TranscodeJob::Snapshot() const
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    return snapshot_;
}

bool TranscodeJob::Fail(const char *operation, int32_t result)
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    if (snapshot_.detail.empty()) {
        snapshot_.detail = operation;
        snapshot_.errorCode = result;
    }
    return false;
}

bool TranscodeJob::Check(int32_t result, const char *operation)
{
    return result == AV_ERR_OK || Fail(operation, result);
}

bool TranscodeJob::OpenSource()
{
    struct stat inputStat {};
    struct stat outputStat {};
    if (fstat(options_.inputFd, &inputStat) != 0 || fstat(options_.outputFd, &outputStat) != 0 ||
        inputStat.st_size <= 0 || (inputStat.st_dev == outputStat.st_dev && inputStat.st_ino == outputStat.st_ino)) {
        return Fail("Invalid input/output descriptors or identical files");
    }
    source_ = OH_AVSource_CreateWithFD(options_.inputFd, 0, inputStat.st_size);
    if (source_ == nullptr) { return Fail("Create media source"); }
    Format sourceFormat(OH_AVSource_GetSourceFormat(source_), OH_AVFormat_Destroy);
    if (sourceFormat == nullptr) { return Fail("Read media source description"); }
    int32_t trackCount = 0;
    OH_AVFormat_GetIntValue(sourceFormat.get(), OH_MD_KEY_TRACK_COUNT, &trackCount);
    OH_AVFormat_GetLongValue(sourceFormat.get(), OH_MD_KEY_DURATION, &durationUs_);
    for (int32_t index = 0; index < trackCount; ++index) {
        Format track(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type)) { continue; }
        if (type == MEDIA_TYPE_VID && videoTrack_ < 0) {
            videoTrack_ = index;
            videoFormat_ = std::move(track);
        } else if (type == MEDIA_TYPE_AUD && audioTrack_ < 0 && options_.keepAudio) {
            audioTrack_ = index;
            audioFormat_ = std::move(track);
        }
    }
    if (videoFormat_ == nullptr || !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_WIDTH, &sourceWidth_) ||
        !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_HEIGHT, &sourceHeight_) ||
        !TranscodeFrames::FitSize(sourceWidth_, sourceHeight_, options_.surface ? 0 : options_.longEdge,
            targetWidth_, targetHeight_)) {
        return Fail("No supported video track or invalid video dimensions");
    }
    int32_t transfer = 0;
    int32_t hdr = 0;
    int32_t profile = 0;
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_TRANSFER_CHARACTERISTICS, &transfer);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_VIDEO_IS_HDR_VIVID, &hdr);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_PROFILE, &profile);
    const char *sourceMime = nullptr;
    OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &sourceMime);
    const bool hevc = sourceMime != nullptr && std::string(sourceMime) == OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    if (hdr != 0 || transfer == TRANSFER_CHARACTERISTIC_HLG || transfer == TRANSFER_CHARACTERISTIC_PQ ||
        (hevc && profile != HEVC_PROFILE_MAIN)) {
        return Fail("HDR input requires tone mapping or metadata preservation; this transcode path supports SDR");
    }
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_ROTATION, &rotation_);
    OH_AVFormat_GetDoubleValue(videoFormat_.get(), OH_MD_KEY_FRAME_RATE, &frameRate_);
    if (!std::isfinite(frameRate_) || frameRate_ <= 0) { frameRate_ = 30; }
    demuxer_ = OH_AVDemuxer_CreateWithSource(source_);
    if (demuxer_ == nullptr || !Check(OH_AVDemuxer_SelectTrackByID(demuxer_, videoTrack_), "Select video track")) {
        return Fail("Create demuxer or select video track");
    }
    if (audioTrack_ >= 0) {
        if (!Check(OH_AVDemuxer_SelectTrackByID(demuxer_, audioTrack_), "Select original audio track")) { return false; }
        audioBuffer_ = OH_AVBuffer_Create(AUDIO_BUFFER_BYTES);
        if (audioBuffer_ == nullptr) { return Fail("Create audio remux buffer"); }
        audioDone_ = false;
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.outputWidth = targetWidth_;
    snapshot_.outputHeight = targetHeight_;
    return true;
}

bool TranscodeJob::ConfigureCodecs()
{
    const char *sourceMime = nullptr;
    if (!OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &sourceMime)) {
        return Fail("Read source video MIME");
    }
    decoder_ = OH_VideoDecoder_CreateByMime(sourceMime);
    encoder_ = OH_VideoEncoder_CreateByMime(options_.mime.c_str());
    if (decoder_ == nullptr || encoder_ == nullptr) { return Fail("Create video decoder or encoder"); }
    OH_AVCapability *capability = OH_AVCodec_GetCapability(options_.mime.c_str(), true);
    if (capability == nullptr || !OH_AVCapability_IsVideoSizeSupported(capability, targetWidth_, targetHeight_)) {
        return Fail("Encoder does not support the selected output size");
    }
    Format output(OH_AVFormat_CreateVideoFormat(options_.mime.c_str(), targetWidth_, targetHeight_),
        OH_AVFormat_Destroy);
    if (output == nullptr ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_PIXEL_FORMAT,
            options_.surface ? AV_PIXEL_FORMAT_SURFACE_FORMAT : AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetLongValue(output.get(), OH_MD_KEY_BITRATE, options_.bitrate) ||
        !OH_AVFormat_SetDoubleValue(output.get(), OH_MD_KEY_FRAME_RATE, frameRate_) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, VBR) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_I_FRAME_INTERVAL, 2000)) {
        return Fail("Build video encoder format");
    }
    // 透传 SDR 的颜色描述；旋转保存为 MP4 元数据，不让解码器先转一次、播放器再转一次。
    for (const char *key : { OH_MD_KEY_COLOR_PRIMARIES, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
        OH_MD_KEY_MATRIX_COEFFICIENTS, OH_MD_KEY_RANGE_FLAG }) {
        int32_t component = 0;
        if (OH_AVFormat_GetIntValue(videoFormat_.get(), key, &component) &&
            !OH_AVFormat_SetIntValue(output.get(), key, component)) { return Fail("Copy SDR color description"); }
    }
    if (!Check(OH_VideoEncoder_Configure(encoder_, output.get()), "Configure video encoder")) { return false; }
    if (!OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ROTATION, 0) ||
        !Check(OH_VideoDecoder_Configure(decoder_, videoFormat_.get()), "Configure video decoder")) { return false; }
    if (options_.surface) {
        if (targetWidth_ != sourceWidth_ || targetHeight_ != sourceHeight_ || options_.grayscale || options_.longEdge != 0) {
            return Fail("Surface transcode requires original dimensions and no CPU filter");
        }
        if (!Check(OH_VideoEncoder_GetSurface(encoder_, &encoderWindow_), "Get encoder input Surface") ||
            !Check(OH_VideoDecoder_SetSurface(decoder_, encoderWindow_), "Connect decoder to encoder Surface")) {
            return false;
        }
    }
    if (!Check(OH_VideoEncoder_Prepare(encoder_), "Prepare video encoder") ||
        !Check(OH_VideoDecoder_Prepare(decoder_), "Prepare video decoder") ||
        !Check(OH_VideoEncoder_Start(encoder_), "Start video encoder")) { return false; }
    encoderStarted_ = true;
    if (!Check(OH_VideoDecoder_Start(decoder_), "Start video decoder")) { return false; }
    decoderStarted_ = true;
    muxer_ = OH_AVMuxer_Create(options_.outputFd, AV_OUTPUT_FORMAT_MPEG_4);
    if (muxer_ == nullptr || !Check(OH_AVMuxer_SetRotation(muxer_, rotation_), "Set output rotation")) {
        return Fail("Create MP4 muxer or set rotation");
    }
    return true;
}

bool TranscodeJob::StartMuxer()
{
    if (muxStarted_) { return true; }
    // 等编码器报告实际输出描述后再加轨；不能拿源文件的 AVC/HEVC 配置来描述新编码的码流。
    Format format(OH_VideoEncoder_GetOutputDescription(encoder_), OH_AVFormat_Destroy);
    if (format == nullptr || !Check(OH_AVMuxer_AddTrack(muxer_, &muxVideoTrack_, format.get()), "Add encoded video track")) {
        return Fail("Read encoder output description or add video track");
    }
    if (audioFormat_ != nullptr &&
        !Check(OH_AVMuxer_AddTrack(muxer_, &muxAudioTrack_, audioFormat_.get()),
            "Original audio is not supported in MP4; retry with audio preservation disabled")) { return false; }
    if (!Check(OH_AVMuxer_Start(muxer_), "Start MP4 muxer")) { return false; }
    muxStarted_ = true;
    return true;
}

bool TranscodeJob::FeedDecoder(bool &advanced)
{
    if (decoderInputDone_) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_VideoDecoder_QueryInputBuffer(decoder_, &index, POLL_TIMEOUT_US);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query decoder input")) { return false; }
    OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder_, index);
    OH_AVCodecBufferAttr attr {};
    if (buffer == nullptr || !Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, videoTrack_, buffer), "Read compressed video") ||
        !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read compressed video attributes") ||
        !Check(OH_VideoDecoder_PushInputBuffer(decoder_, index), "Submit decoder input")) {
        return Fail("Read or submit decoder input");
    }
    decoderInputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

bool TranscodeJob::ReadLayout(OH_AVFormat *format, TranscodeFrames::Layout &layout)
{
    if (format == nullptr) { return Fail("Read codec image layout"); }
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &layout.width)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &layout.width);
    }
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &layout.height)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &layout.height);
    }
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &layout.stride);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &layout.sliceHeight);
    int32_t pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat);
    if (pixelFormat == AV_PIXEL_FORMAT_NV12) { layout.chroma = TranscodeFrames::Chroma::NV12; }
    else if (pixelFormat == AV_PIXEL_FORMAT_NV21) { layout.chroma = TranscodeFrames::Chroma::NV21; }
    else if (pixelFormat == AV_PIXEL_FORMAT_YUVI420) { layout.chroma = TranscodeFrames::Chroma::I420; }
    else { return Fail("Buffer transcode requires 8-bit NV12/NV21/I420 output"); }
    return TranscodeFrames::RequiredBytes(layout) != 0 || Fail("Invalid codec stride or slice height");
}

bool TranscodeJob::DrainDecoder(bool &advanced)
{
    if (decoderOutputDone_ || pendingDecoded_ != nullptr) { return true; }
    const int32_t result = OH_VideoDecoder_QueryOutputBuffer(decoder_, &pendingDecodedIndex_, POLL_TIMEOUT_US);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) {
        advanced = true;
        return true;
    }
    if (!Check(result, "Query decoder output")) { return false; }
    pendingDecoded_ = OH_VideoDecoder_GetOutputBuffer(decoder_, pendingDecodedIndex_);
    if (pendingDecoded_ == nullptr ||
        !Check(OH_AVBuffer_GetBufferAttr(pendingDecoded_, &pendingDecodedAttr_), "Read decoded frame attributes")) {
        pendingDecoded_ = nullptr;
        return Fail("Get decoded output Buffer");
    }
    advanced = true;
    return true;
}

bool TranscodeJob::SubmitDecodedFrame(bool &advanced)
{
    const bool sendEmptyEos = decoderOutputDone_ && !encoderEosSent_ && !options_.surface;
    if (pendingDecoded_ == nullptr && !sendEmptyEos) { return true; }
    const bool eos = sendEmptyEos || (pendingDecodedAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (options_.surface) {
        const bool hasFrame = !eos || pendingDecodedAttr_.size > 0;
        const int32_t result = hasFrame ? OH_VideoDecoder_RenderOutputBuffer(decoder_, pendingDecodedIndex_) :
            OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_);
        pendingDecoded_ = nullptr;
        if (!Check(result, "Submit decoded Surface frame")) { return false; }
        if (eos && !Check(OH_VideoEncoder_NotifyEndOfStream(encoder_), "Notify Surface encoder EOS")) { return false; }
        encoderEosSent_ = eos;
        decoderOutputDone_ = eos;
        advanced = true;
        return true;
    }
    uint32_t index = 0;
    const int32_t result = OH_VideoEncoder_QueryInputBuffer(encoder_, &index, POLL_TIMEOUT_US);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query Buffer encoder input")) { return false; }
    OH_AVBuffer *input = OH_VideoEncoder_GetInputBuffer(encoder_, index);
    if (input == nullptr) { return Fail("Get Buffer encoder input"); }
    OH_AVCodecBufferAttr attr {};
    attr.pts = pendingDecodedAttr_.pts;
    const bool hasFrame = !sendEmptyEos && (!eos || pendingDecodedAttr_.size > 0);
    if (hasFrame) {
        Format decoded(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
        Format encoded(OH_VideoEncoder_GetInputDescription(encoder_), OH_AVFormat_Destroy);
        if (!ReadLayout(decoded.get(), decodedLayout_) || !ReadLayout(encoded.get(), encodedLayout_) ||
            encodedLayout_.width != targetWidth_ || encodedLayout_.height != targetHeight_) { return false; }
        const int32_t sourceCapacity = OH_AVBuffer_GetCapacity(pendingDecoded_);
        const int32_t targetCapacity = OH_AVBuffer_GetCapacity(input);
        const int32_t offset = pendingDecodedAttr_.offset;
        uint8_t *source = OH_AVBuffer_GetAddr(pendingDecoded_);
        uint8_t *target = OH_AVBuffer_GetAddr(input);
        if (source == nullptr || sourceCapacity < 0 || targetCapacity < 0 || offset < 0 || offset > sourceCapacity ||
            !TranscodeFrames::Process(source + offset, sourceCapacity - offset, decodedLayout_,
                target, targetCapacity, encodedLayout_, options_.grayscale)) { return Fail("Process decoded image layout"); }
        attr.size = static_cast<int32_t>(TranscodeFrames::RequiredBytes(encodedLayout_));
    }
    // 带数据的最后一帧先正常送入，下一轮再单独送空 EOS，避免编码器忽略尾帧。
    if (eos && !hasFrame) { attr.flags = AVCODEC_BUFFER_FLAGS_EOS; }
    if (!Check(OH_AVBuffer_SetBufferAttr(input, &attr), "Set encoder input attributes") ||
        !Check(OH_VideoEncoder_PushInputBuffer(encoder_, index), "Submit processed Buffer to encoder")) { return false; }
    if (pendingDecoded_ != nullptr &&
        !Check(OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_), "Return decoded frame")) { return false; }
    pendingDecoded_ = nullptr;
    decoderOutputDone_ = eos;
    encoderEosSent_ = eos && !hasFrame;
    advanced = true;
    return true;
}

bool TranscodeJob::DrainEncoder(bool &advanced)
{
    if (encoderOutputDone_) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_VideoEncoder_QueryOutputBuffer(encoder_, &index, POLL_TIMEOUT_US);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) { advanced = true; return StartMuxer(); }
    if (!Check(result, "Query encoded output")) { return false; }
    OH_AVBuffer *buffer = OH_VideoEncoder_GetOutputBuffer(encoder_, index);
    OH_AVCodecBufferAttr attr {};
    if (buffer == nullptr || !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read encoded output attributes")) {
        return Fail("Get encoded output Buffer");
    }
    bool success = StartMuxer();
    if (success && attr.size > 0) {
        success = Check(OH_AVMuxer_WriteSampleBuffer(muxer_, muxVideoTrack_, buffer), "Write encoded video to MP4");
    }
    const bool returned = Check(OH_VideoEncoder_FreeOutputBuffer(encoder_, index), "Return encoded output");
    if (!success || !returned) { return false; }
    encoderOutputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (attr.size > 0 && (attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        videoPositionUs_ = std::max(videoPositionUs_, attr.pts);
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        ++snapshot_.frames;
        snapshot_.bytes += attr.size;
        snapshot_.stage = "transcode";
        if (durationUs_ > 0) {
            snapshot_.progress = std::clamp(static_cast<double>(videoPositionUs_) / durationUs_ * 99, 0.0, 99.0);
        }
    }
    advanced = true;
    return true;
}

bool TranscodeJob::CopyAudio(bool &advanced)
{
    if (audioDone_ || !muxStarted_ || (!encoderOutputDone_ && audioPositionUs_ > videoPositionUs_ + AUDIO_LEAD_US)) {
        return true;
    }
    OH_AVCodecBufferAttr attr {};
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, audioTrack_, audioBuffer_), "Read original audio sample") ||
        !Check(OH_AVBuffer_GetBufferAttr(audioBuffer_, &attr), "Read audio sample attributes")) { return false; }
    if (attr.size > 0 && !Check(OH_AVMuxer_WriteSampleBuffer(muxer_, muxAudioTrack_, audioBuffer_),
        "Remux original audio")) { return false; }
    audioPositionUs_ = attr.pts;
    audioDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

void TranscodeJob::Run()
{
    bool success = !cancelled_.load() && OpenSource() && ConfigureCodecs();
    auto lastProgress = std::chrono::steady_clock::now();
    // 输入 EOS 只结束输入；编码输出 EOS 和音轨都处理完，才能停止封装并报告完成。
    while (success && !cancelled_.load() && !(encoderOutputDone_ && audioDone_)) {
        bool advanced = false;
        success = DrainEncoder(advanced) && SubmitDecodedFrame(advanced) && DrainDecoder(advanced) &&
            FeedDecoder(advanced) && CopyAudio(advanced);
        if (advanced) { lastProgress = std::chrono::steady_clock::now(); }
        else if (std::chrono::steady_clock::now() - lastProgress > STALL_LIMIT) {
            success = Fail("Codec pipeline made no progress for 30 seconds");
        } else { std::this_thread::sleep_for(POLL_INTERVAL); }
    }
    if (success && !cancelled_.load()) {
        success = muxStarted_ && Snapshot().frames > 0;
        if (!success) { Fail("No encoded video samples were produced"); }
        if (success) { success = Check(OH_AVMuxer_Stop(muxer_), "Finalize MP4 container"); }
        if (success && fsync(options_.outputFd) != 0) { success = Fail("Flush output file", errno); }
    }
    Cleanup();
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.state = cancelled_.load() ? STATE_CANCELLED : (success ? STATE_FINISHED : STATE_FAILED);
    snapshot_.stage = cancelled_.load() ? "cancelled" : (success ? "complete" : "failed");
    if (snapshot_.state == STATE_FINISHED) {
        snapshot_.progress = 100;
        snapshot_.audioCopied = audioTrack_ >= 0;
    }
}

void TranscodeJob::Cleanup()
{
    // Surface 由编码器创建，解码器借用。先销毁解码器，再销毁编码器和窗口引用。
    if (decoder_ != nullptr) {
        if (decoderStarted_) { (void)OH_VideoDecoder_Stop(decoder_); }
        OH_VideoDecoder_Destroy(decoder_);
        decoder_ = nullptr;
        pendingDecoded_ = nullptr;
    }
    if (encoder_ != nullptr) {
        if (encoderStarted_) { (void)OH_VideoEncoder_Stop(encoder_); }
        OH_VideoEncoder_Destroy(encoder_);
        encoder_ = nullptr;
    }
    if (encoderWindow_ != nullptr) { OH_NativeWindow_DestroyNativeWindow(encoderWindow_); encoderWindow_ = nullptr; }
    if (muxer_ != nullptr) { OH_AVMuxer_Destroy(muxer_); muxer_ = nullptr; }
    if (audioBuffer_ != nullptr) { OH_AVBuffer_Destroy(audioBuffer_); audioBuffer_ = nullptr; }
    if (demuxer_ != nullptr) { OH_AVDemuxer_Destroy(demuxer_); demuxer_ = nullptr; }
    if (source_ != nullptr) { OH_AVSource_Destroy(source_); source_ = nullptr; }
    if (options_.inputFd >= 0) { close(options_.inputFd); options_.inputFd = -1; }
    if (options_.outputFd >= 0) { close(options_.outputFd); options_.outputFd = -1; }
}
