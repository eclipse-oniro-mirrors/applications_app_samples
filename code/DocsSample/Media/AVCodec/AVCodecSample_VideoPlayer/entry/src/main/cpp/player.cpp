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

#include "player.h"
#include "video_output.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <condition_variable>
#include <ctime>
#include <hilog/log.h>
#include <limits>
#include <memory>
#include <mutex>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avsource.h>

namespace {
using Format = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>;
using Clock = std::chrono::steady_clock;
using namespace std::chrono_literals;

constexpr unsigned PLAYER_LOG_DOMAIN = 0xD000;
constexpr char PLAYER_LOG_TAG[] = "[Sample_AVCodecVideoPlayer]";
constexpr auto POLL_INTERVAL = 5ms;
constexpr auto DECODE_TIMEOUT = 10s;
constexpr auto SURFACE_SUBMIT_LEAD = 4ms;
constexpr auto SURFACE_TAIL_TIME = 34ms;
constexpr int64_t NS_PER_SECOND = 1'000'000'000;
constexpr int64_t NS_PER_MICROSECOND = 1'000;
constexpr size_t MAX_CODEC_BUFFERS = 32;

bool Check(int32_t code, const char *operation)
{
    if (code != AV_ERR_OK) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "%{public}s failed: %{public}d", operation, code);
    }
    return code == AV_ERR_OK;
}

int64_t MonotonicTimeNs()
{
    timespec now {};
    if (clock_gettime(CLOCK_MONOTONIC, &now) != 0) {
        return 0;
    }
    return now.tv_sec * NS_PER_SECOND + now.tv_nsec;
}

struct CodecBuffer {
    uint32_t index = 0;
    OH_AVBuffer *buffer = nullptr;
};

// 回调只交接索引和借用的Buffer，播放线程负责读写和归还。
class BufferQueue {
public:
    bool Push(CodecBuffer buffer);
    CodecBuffer Take();

private:
    std::array<CodecBuffer, MAX_CODEC_BUFFERS> entries_ {};
    size_t first_ = 0;
    size_t count_ = 0;
};

bool BufferQueue::Push(CodecBuffer buffer)
{
    if (count_ == entries_.size()) {
        return false;
    }
    entries_[(first_ + count_) % entries_.size()] = buffer;
    ++count_;
    return true;
}

CodecBuffer BufferQueue::Take()
{
    if (count_ == 0) {
        return {};
    }
    const CodecBuffer result = entries_[first_];
    first_ = (first_ + 1) % entries_.size();
    --count_;
    return result;
}

class VideoDecoder {
public:
    VideoDecoder(bool synchronous, bool surface, const std::atomic<bool> &stopped)
        : synchronous_(synchronous), surface_(surface), stopped_(stopped) {}
    ~VideoDecoder();

    bool Open(OH_AVFormat *trackFormat, OHNativeWindow *window);
    bool Run(OH_AVDemuxer *demuxer, uint32_t track, BufferOutput &display);

private:
    static void OnError(OH_AVCodec *, int32_t code, void *data);
    static void OnFormatChanged(OH_AVCodec *, OH_AVFormat *, void *data);
    static void OnInput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *data);
    static void OnOutput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *data);

    void Queue(BufferQueue &queue, CodecBuffer buffer);
    CodecBuffer GetBuffer(bool input);
    bool Feed(OH_AVDemuxer *demuxer, uint32_t track, CodecBuffer input);
    bool Show(BufferOutput &display, CodecBuffer output);
    bool Present(BufferOutput &display, CodecBuffer output, const OH_AVCodecBufferAttr &attr);
    bool ConfigureOutput(BufferOutput &display);
    int64_t PresentationTimeNs(int64_t pts);
    bool WaitUntil(int64_t targetNs);
    bool Stopped() const;

    bool synchronous_;
    bool surface_;
    const std::atomic<bool> &stopped_;
    OH_AVCodec *codec_ = nullptr;
    bool started_ = false;
    bool inputEnded_ = false;
    bool outputEnded_ = false;
    bool shownFrame_ = false;
    int64_t firstPts_ = 0;
    int64_t clockStartNs_ = 0;
    int64_t lastSurfaceFrameNs_ = 0;
    std::atomic<bool> failed_ {false};
    std::atomic<bool> formatChanged_ {true};
    std::mutex mutex_;
    std::condition_variable available_;
    BufferQueue inputs_;
    BufferQueue outputs_;
};

VideoDecoder::~VideoDecoder()
{
    if (codec_ == nullptr) {
        return;
    }
    if (started_) {
        Check(OH_VideoDecoder_Stop(codec_), "Stop video decoder");
    }
    // Destroy回收尚在队列中的Buffer，完成前保留回调上下文。
    Check(OH_VideoDecoder_Destroy(codec_), "Destroy video decoder");
}

bool VideoDecoder::Open(OH_AVFormat *trackFormat, OHNativeWindow *window)
{
    const char *mime = nullptr;
    int32_t width = 0;
    int32_t height = 0;
    if (!OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr ||
        !OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_WIDTH, &width) ||
        !OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_HEIGHT, &height)) {
        return false;
    }
    codec_ = OH_VideoDecoder_CreateByMime(mime);
    Format format(OH_AVFormat_CreateVideoFormat(mime, width, height), OH_AVFormat_Destroy);
    if (codec_ == nullptr || format == nullptr) {
        return false;
    }
    if (synchronous_) {
        OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    }
    if (surface_) {
        int32_t rotation = 0;
        OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_ROTATION, &rotation);
        OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ROTATION, rotation);
    } else {
        OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    }
    if (!Check(OH_VideoDecoder_Configure(codec_, format.get()), "Configure video decoder")) {
        return false;
    }
    if (surface_ && !Check(OH_VideoDecoder_SetSurface(codec_, window), "Set decoder Surface")) {
        return false;
    }
    if (!synchronous_) {
        const OH_AVCodecCallback callbacks {OnError, OnFormatChanged, OnInput, OnOutput};
        if (!Check(OH_VideoDecoder_RegisterCallback(codec_, callbacks, this), "Register decoder callbacks")) {
            return false;
        }
    }
    started_ = Check(OH_VideoDecoder_Prepare(codec_), "Prepare video decoder") &&
        Check(OH_VideoDecoder_Start(codec_), "Start video decoder");
    return started_;
}

void VideoDecoder::OnError(OH_AVCodec *, int32_t code, void *data)
{
    auto &decoder = *static_cast<VideoDecoder *>(data);
    (void)Check(code, "Video decoder callback");
    decoder.failed_ = true;
    decoder.available_.notify_one();
}

void VideoDecoder::OnFormatChanged(OH_AVCodec *, OH_AVFormat *, void *data)
{
    auto &decoder = *static_cast<VideoDecoder *>(data);
    decoder.formatChanged_ = true;
}

void VideoDecoder::OnInput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *data)
{
    auto &decoder = *static_cast<VideoDecoder *>(data);
    decoder.Queue(decoder.inputs_, {index, buffer});
}

void VideoDecoder::OnOutput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *data)
{
    auto &decoder = *static_cast<VideoDecoder *>(data);
    decoder.Queue(decoder.outputs_, {index, buffer});
}

void VideoDecoder::Queue(BufferQueue &queue, CodecBuffer buffer)
{
    {
        std::lock_guard<std::mutex> guard(mutex_);
        if (buffer.buffer == nullptr || !queue.Push(buffer)) {
            failed_ = true;
        }
    }
    available_.notify_one();
}

CodecBuffer VideoDecoder::GetBuffer(bool input)
{
    if (!synchronous_) {
        std::lock_guard<std::mutex> guard(mutex_);
        return input ? inputs_.Take() : outputs_.Take();
    }
    CodecBuffer result;
    const int32_t code = input ? OH_VideoDecoder_QueryInputBuffer(codec_, &result.index, 0) :
        OH_VideoDecoder_QueryOutputBuffer(codec_, &result.index, 0);
    if (code == AV_ERR_STREAM_CHANGED && !input) {
        formatChanged_ = true;
        return {};
    }
    if (code == AV_ERR_TRY_AGAIN_LATER) {
        return {};
    }
    if (!Check(code, input ? "Query decoder input" : "Query decoder output")) {
        failed_ = true;
        return {};
    }
    result.buffer = input ? OH_VideoDecoder_GetInputBuffer(codec_, result.index) :
        OH_VideoDecoder_GetOutputBuffer(codec_, result.index);
    if (result.buffer == nullptr) {
        failed_ = true;
    }
    return result;
}

bool VideoDecoder::Feed(OH_AVDemuxer *demuxer, uint32_t track, CodecBuffer input)
{
    OH_AVCodecBufferAttr attr {};
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer, track, input.buffer), "Read video sample") ||
        !Check(OH_AVBuffer_GetBufferAttr(input.buffer, &attr), "Read video sample attributes") ||
        !Check(OH_VideoDecoder_PushInputBuffer(codec_, input.index), "Submit video sample")) {
        return false;
    }
    inputEnded_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    return true;
}

bool VideoDecoder::Stopped() const
{
    return stopped_.load() || failed_.load();
}

int64_t VideoDecoder::PresentationTimeNs(int64_t pts)
{
    // 以首帧PTS对齐系统单调时钟，解码时间戳由微秒换算为纳秒。
    pts = std::max<int64_t>(pts, 0);
    if (clockStartNs_ == 0) {
        clockStartNs_ = MonotonicTimeNs();
        firstPts_ = pts;
    }
    const int64_t elapsedUs = std::max<int64_t>(pts - firstPts_, 0);
    if (clockStartNs_ == 0 || elapsedUs > (std::numeric_limits<int64_t>::max() - clockStartNs_) / NS_PER_MICROSECOND) {
        return 0;
    }
    return clockStartNs_ + elapsedUs * NS_PER_MICROSECOND;
}

bool VideoDecoder::WaitUntil(int64_t targetNs)
{
    std::unique_lock<std::mutex> lock(mutex_);
    while (!Stopped()) {
        const int64_t nowNs = MonotonicTimeNs();
        if (nowNs == 0) {
            return false;
        }
        if (nowNs >= targetNs) {
            return true;
        }
        available_.wait_for(lock, std::min(std::chrono::nanoseconds(targetNs - nowNs),
            std::chrono::duration_cast<std::chrono::nanoseconds>(POLL_INTERVAL)));
    }
    return false;
}

bool VideoDecoder::ConfigureOutput(BufferOutput &display)
{
    if (!formatChanged_.exchange(false)) {
        return true;
    }
    Format outputFormat(OH_VideoDecoder_GetOutputDescription(codec_), OH_AVFormat_Destroy);
    return outputFormat != nullptr && display.Configure(outputFormat.get());
}

bool VideoDecoder::Present(BufferOutput &display, CodecBuffer output, const OH_AVCodecBufferAttr &attr)
{
    const int64_t targetNs = PresentationTimeNs(attr.pts);
    const auto lead = surface_ ? SURFACE_SUBMIT_LEAD : 0ms;
    if (targetNs == 0 || !WaitUntil(targetNs - std::chrono::nanoseconds(lead).count())) {
        return false;
    }
    if (surface_) {
        if (!Check(OH_VideoDecoder_RenderOutputBufferAtTime(codec_, output.index, targetNs), "Render Surface frame")) {
            return false;
        }
        lastSurfaceFrameNs_ = std::max(targetNs, MonotonicTimeNs());
        return true;
    }
    return ConfigureOutput(display) && display.Present(output.buffer, attr);
}

bool VideoDecoder::Show(BufferOutput &display, CodecBuffer output)
{
    OH_AVCodecBufferAttr attr {};
    if (!Check(OH_AVBuffer_GetBufferAttr(output.buffer, &attr), "Read decoded frame attributes")) {
        return false;
    }
    const bool eos = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    const bool codecData = (attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) != 0;
    const bool frame = !codecData && (attr.size > 0 || (surface_ && !eos));
    const bool presented = frame && Present(display, output, attr);
    // 空EOS以及Buffer模式未送出的EOS索引由Destroy统一回收。
    if (!eos && (!surface_ || !presented) &&
        !Check(OH_VideoDecoder_FreeOutputBuffer(codec_, output.index), "Return decoded buffer")) {
        return false;
    }
    outputEnded_ = eos;
    if (eos) {
        OH_LOG_Print(LOG_APP, LOG_INFO, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Video decoder reached EOS");
    }
    shownFrame_ = shownFrame_ || presented;
    return !frame || presented;
}

bool VideoDecoder::Run(OH_AVDemuxer *demuxer, uint32_t track, BufferOutput &display)
{
    auto lastProgress = Clock::now();
    while (!outputEnded_ && !Stopped()) {
        const CodecBuffer output = GetBuffer(false);
        const CodecBuffer input = inputEnded_ ? CodecBuffer {} : GetBuffer(true);
        if (Stopped()) {
            break;
        }
        if ((output.buffer != nullptr && !Show(display, output)) ||
            (!outputEnded_ && input.buffer != nullptr && !Feed(demuxer, track, input))) {
            return false;
        }
        if (output.buffer != nullptr || input.buffer != nullptr) {
            lastProgress = Clock::now();
            continue;
        }
        if (Clock::now() - lastProgress > DECODE_TIMEOUT) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Video decoder made no progress");
            return false;
        }
        std::unique_lock<std::mutex> lock(mutex_);
        available_.wait_for(lock, POLL_INTERVAL);
    }
    if (!outputEnded_ || !shownFrame_ || Stopped()) {
        return false;
    }
    // 给Surface尾帧留出显示刷新时间，再释放解码器。
    return !surface_ || WaitUntil(lastSurfaceFrameNs_ + std::chrono::nanoseconds(SURFACE_TAIL_TIME).count());
}

Format FindVideoTrack(OH_AVSource *source, uint32_t &track)
{
    Format info(OH_AVSource_GetSourceFormat(source), OH_AVFormat_Destroy);
    int32_t count = 0;
    if (info == nullptr || !OH_AVFormat_GetIntValue(info.get(), OH_MD_KEY_TRACK_COUNT, &count)) {
        return {nullptr, OH_AVFormat_Destroy};
    }
    for (int32_t index = 0; index < count; ++index) {
        Format format(OH_AVSource_GetTrackFormat(source, static_cast<uint32_t>(index)), OH_AVFormat_Destroy);
        int32_t type = 0;
        if (format != nullptr && OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_TRACK_TYPE, &type) &&
            type == MEDIA_TYPE_VID) {
            track = static_cast<uint32_t>(index);
            return format;
        }
    }
    return {nullptr, OH_AVFormat_Destroy};
}
}

bool PlayVideo(int fd, int64_t size, bool synchronous, bool surface, uint64_t surfaceId,
    const std::atomic<bool> &stopped)
{
    std::unique_ptr<OH_AVSource, decltype(&OH_AVSource_Destroy)> source(
        OH_AVSource_CreateWithFD(fd, 0, size), OH_AVSource_Destroy);
    if (source == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Create video source failed");
        return false;
    }
    uint32_t track = 0;
    const Format trackFormat = FindVideoTrack(source.get(), track);
    if (trackFormat == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Input has no video track");
        return false;
    }
    std::unique_ptr<OH_AVDemuxer, decltype(&OH_AVDemuxer_Destroy)> demuxer(
        OH_AVDemuxer_CreateWithSource(source.get()), OH_AVDemuxer_Destroy);
    if (demuxer == nullptr ||
        !Check(OH_AVDemuxer_SelectTrackByID(demuxer.get(), track), "Select video track") || stopped.load()) {
        return false;
    }
    OHNativeWindow *native = nullptr;
    const int32_t windowResult = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &native);
    std::unique_ptr<OHNativeWindow, decltype(&OH_NativeWindow_DestroyNativeWindow)> window(
        native, OH_NativeWindow_DestroyNativeWindow);
    if (!Check(windowResult, "Create playback window") || window == nullptr) {
        return false;
    }
    OH_NativeWindow_CleanCache(window.get());
    if (surface) {
        OH_NativeWindow_NativeWindowHandleOpt(window.get(), SET_TRANSFORM, NATIVEBUFFER_ROTATE_NONE);
    }
    if (!Check(OH_NativeWindow_NativeWindowSetScalingModeV2(window.get(), OH_SCALING_MODE_SCALE_FIT_V2),
        "Set playback window scaling")) {
        return false;
    }
    int32_t rotation = 0;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_ROTATION, &rotation);
    BufferOutput display(window.get(), rotation);
    VideoDecoder decoder(synchronous, surface, stopped);
    return decoder.Open(trackFormat.get(), window.get()) && decoder.Run(demuxer.get(), track, display);
}
