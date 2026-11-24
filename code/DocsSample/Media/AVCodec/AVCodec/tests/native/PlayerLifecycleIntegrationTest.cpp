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
#include "TestCheck.h"
#include <cstdlib>
#include <condition_variable>
#include <cstdarg>
#include <iostream>
#include <cstring>
#include <algorithm>
#include "sample/player/core/Player.h"
#include "sample/player/output/video/gpu/OpenGLVideoSink.h"
#include "sample/player/output/video/gpu/VulkanVideoSink.h"
#include "sample/player/output/video/renderer/HdrMetadataHelper.h"
#include "codec_capability.h"
#include "sample/player/napi/NativePlayerContext.h"

extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyFence(VkDevice, VkFence, const VkAllocationCallbacks *)
    __asm__("vkDestroyFence");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyFence(VkDevice, VkFence, const VkAllocationCallbacks *)
{
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySemaphore(VkDevice, VkSemaphore, const VkAllocationCallbacks *)
    __asm__("vkDestroySemaphore");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySemaphore(VkDevice, VkSemaphore, const VkAllocationCallbacks *)
{
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyCommandPool(VkDevice, VkCommandPool, const VkAllocationCallbacks *)
    __asm__("vkDestroyCommandPool");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyCommandPool(VkDevice, VkCommandPool, const VkAllocationCallbacks *)
{
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySwapchainKHR(VkDevice, VkSwapchainKHR, const VkAllocationCallbacks *)
    __asm__("vkDestroySwapchainKHR");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySwapchainKHR(VkDevice, VkSwapchainKHR, const VkAllocationCallbacks *)
{
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyImage(VkDevice, VkImage, const VkAllocationCallbacks *)
    __asm__("vkDestroyImage");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyImage(VkDevice, VkImage, const VkAllocationCallbacks *)
{
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeFreeMemory(VkDevice, VkDeviceMemory, const VkAllocationCallbacks *)
    __asm__("vkFreeMemory");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeFreeMemory(VkDevice, VkDeviceMemory, const VkAllocationCallbacks *)
{
}

namespace {
constexpr size_t BUFFER_CAPACITY = 16;
constexpr int CREATE_FAILURE = -7;
constexpr int START_FAILURE = -9;
constexpr int CLEANUP_FAILURE = -27;
constexpr int TRACK_START_FAILURE = -31;
constexpr int SEEK_FAILURE = -33;
constexpr int REPLAY_COUNT = 3;
constexpr int CALLBACK_TIMEOUT_SECONDS = 3;
constexpr int AUDIO_TRACK_INDEX = 2;
constexpr int AUDIO_SAMPLE_RATE = 48000;
constexpr int AUDIO_CHANNEL_COUNT = 2;
constexpr int64_t SOURCE_DURATION_US = 1000000;
constexpr int64_t SEEK_POSITION_US = 200000;
constexpr int32_t VIDEO_TRACK_INDEX = 1;
constexpr int32_t FRAME_DIMENSION = 2;
constexpr double VIDEO_FRAME_RATE = 30.0;
constexpr int64_t FIRST_TAIL_PTS_US = 1'500'000;
constexpr int64_t LAST_TAIL_PTS_US = FIRST_TAIL_PTS_US + 20'000;
constexpr int64_t VIDEO_DURATION_US = 2'000'000;
constexpr int64_t MILLISECOND_US = 1000;
constexpr auto BEFORE_AUDIO_EOS = std::chrono::milliseconds(30);
constexpr auto OUTPUT_TIMEOUT = std::chrono::milliseconds(650);
std::atomic<int> g_rendererStarts { 0 };

enum class BufferReturn { PENDING, FREED, FLUSHED, DESTROYED };

struct VideoBoundary {
    std::mutex mutex;
    std::condition_variable changed;
    CodecUserData *context = nullptr;
    bool enabled = false;
    bool sampledAudioClock = false;
    bool blockDestroy = false;
    bool destroying = false;
    std::vector<BufferReturn> returns;
    std::vector<uint32_t> rendered;
} g_video;

}

struct OH_AudioStreamBuilderStruct { };
struct OH_AudioRendererStruct { };
struct OH_AVBuffer {
    uint8_t data[BUFFER_CAPACITY] {};
    OH_AVCodecBufferAttr attr {};
};
OH_AVBuffer g_videoBuffer;
const char *OH_MD_KEY_VIDEO_PIC_WIDTH = "picture_width";
const char *OH_MD_KEY_VIDEO_PIC_HEIGHT = "picture_height";
const char *OH_MD_KEY_VIDEO_STRIDE = "stride";
const char *OH_MD_KEY_VIDEO_SLICE_HEIGHT = "slice_height";
const char *OH_MD_KEY_PIXEL_FORMAT = "pixel_format";
const char *OH_AVCODEC_MIMETYPE_VIDEO_HEVC = "video/hevc";
extern "C" {
int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}
bool OH_AVCapability_IsHardware(OH_AVCapability *)
{
    return false;
}
OH_AudioStream_Result OH_AudioStreamBuilder_Create(OH_AudioStreamBuilder **out, OH_AudioStream_Type)
{
    *out = new OH_AudioStreamBuilder;
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_Destroy(OH_AudioStreamBuilder *value)
{
    delete value;
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_GenerateRenderer(OH_AudioStreamBuilder *, OH_AudioRenderer **out)
{
    *out = new OH_AudioRenderer;
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_Release(OH_AudioRenderer *value)
{
    delete value;
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_Start(OH_AudioRenderer *)
{
    ++g_rendererStarts;
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_Stop(OH_AudioRenderer *)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_Pause(OH_AudioRenderer *)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_SetSpeed(OH_AudioRenderer *, float)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioRenderer_SetVolume(OH_AudioRenderer *, float)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result FakeGetAudioTimestampInfo(OH_AudioRenderer *, int64_t *position, int64_t *timestamp)
    __asm__("OH_AudioRenderer_GetAudioTimestampInfo");
OH_AudioStream_Result FakeGetAudioTimestampInfo(OH_AudioRenderer *, int64_t *position, int64_t *timestamp)
{
    *position = 1;
    *timestamp = std::chrono::duration_cast<std::chrono::nanoseconds>(
        std::chrono::steady_clock::now().time_since_epoch()).count();
    std::lock_guard<std::mutex> lock(g_video.mutex);
    g_video.sampledAudioClock = true;
    g_video.changed.notify_all();
    return AUDIOSTREAM_SUCCESS;
}
bool FakeAvFormatGetIntValue(OH_AVFormat *, const char *, int32_t *) __asm__("OH_AVFormat_GetIntValue");
bool FakeAvFormatGetIntValue(OH_AVFormat *, const char *, int32_t *)
{
    return false;
}
void FakeAvFormatDestroy(OH_AVFormat *) __asm__("OH_AVFormat_Destroy");
void FakeAvFormatDestroy(OH_AVFormat *)
{
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetLatencyMode(OH_AudioStreamBuilder *, OH_AudioStream_LatencyMode)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetSamplingRate(OH_AudioStreamBuilder *, int32_t)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetChannelCount(OH_AudioStreamBuilder *, int32_t)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetSampleFormat(OH_AudioStreamBuilder *, OH_AudioStream_SampleFormat)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetEncodingType(OH_AudioStreamBuilder *, OH_AudioStream_EncodingType)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererInfo(OH_AudioStreamBuilder *, OH_AudioStream_Usage)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererCallback(
    OH_AudioStreamBuilder *, OH_AudioRenderer_Callbacks, void *)
{
    return AUDIOSTREAM_SUCCESS;
}
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererInterruptCallback(
    OH_AudioStreamBuilder *, OH_AudioRenderer_OnInterruptCallback, void *)
{
    return AUDIOSTREAM_SUCCESS;
}
int32_t OH_NativeWindow_NativeWindowHandleOpt(OHNativeWindow *, int, ...)
{
    return 0;
}
// SDK符号通过链接名保留，替身函数遵守项目命名规则。
uint8_t *FakeAvBufferGetAddr(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetAddr");
uint8_t *FakeAvBufferGetAddr(OH_AVBuffer *buffer)
{
    return buffer->data;
}
int32_t FakeAvBufferGetCapacity(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetCapacity");
int32_t FakeAvBufferGetCapacity(OH_AVBuffer *)
{
    return BUFFER_CAPACITY;
}
OH_AVErrCode OH_AVBuffer_GetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return AV_ERR_OK;
}
}
int32_t SampleCallback::OnRenderWriteData(OH_AudioRenderer *, void *, void *, int32_t)
{
    return 0;
}
int32_t SampleCallback::OnRenderStreamEvent(OH_AudioRenderer *, void *, OH_AudioStream_Event)
{
    return 0;
}
int32_t SampleCallback::OnRenderInterruptEvent(
    OH_AudioRenderer *, void *, OH_AudioInterrupt_ForceType, OH_AudioInterrupt_Hint)
{
    return 0;
}
void SampleCallback::OnRenderInterrupt(OH_AudioRenderer *, void *, OH_AudioInterrupt_ForceType, OH_AudioInterrupt_Hint)
{
}
int32_t SampleCallback::OnRenderError(OH_AudioRenderer *, void *, OH_AudioStream_Result)
{
    return 0;
}

namespace {
using TestSupport::Require;

struct Boundary {
    int create = 0;
    int start = 0;
    int seek = 0;
    int destroy = 0;
    int releases = 0;
    CodecUserData *audio = nullptr;
    bool natural = false;
} g_boundary;
struct Completion {
    std::mutex mutex;
    std::condition_variable changed;
    int calls = 0;
    bool success = false;
    PlaybackCompletionReason reason = PlaybackCompletionReason::ERROR;
    static void OnDone(void *data, bool completed, PlaybackCompletionReason completionReason)
    {
        auto *result = static_cast<Completion *>(data);
        std::lock_guard<std::mutex> lock(result->mutex);
        ++result->calls;
        result->success = completed;
        result->reason = completionReason;
        result->changed.notify_all();
    }
    void Wait()
    {
        std::unique_lock<std::mutex> lock(mutex);
        const bool completed =
            changed.wait_for(lock, std::chrono::seconds(CALLBACK_TIMEOUT_SECONDS), [this]() { return calls > 0; });
        Require(completed, "Playback completion callback arrives before the deadline");
        Require(calls == 1, "calls == 1");
    }
};

void ResetVideoBoundary()
{
    g_boundary = {};
    std::lock_guard<std::mutex> lock(g_video.mutex);
    g_video.enabled = true;
    g_video.sampledAudioClock = false;
    g_video.blockDestroy = false;
    g_video.destroying = false;
    g_video.returns.clear();
    g_video.rendered.clear();
}

uint32_t QueueVideoFrame(int64_t ptsUs, bool eos = false)
{
    std::lock_guard<std::mutex> lock(g_video.mutex);
    const auto index = static_cast<uint32_t>(g_video.returns.size());
    auto output = std::make_shared<CodecBufferInfo>();
    output->bufferIndex = index;
    output->buffer = &g_videoBuffer;
    output->attr.pts = ptsUs;
    output->attr.flags = eos ? AVCODEC_BUFFER_FLAGS_EOS : AVCODEC_BUFFER_FLAGS_NONE;
    g_video.returns.push_back(BufferReturn::PENDING);
    g_video.context->outputBufferQueue.Enqueue(output);
    return index;
}

void WaitForAudioClock()
{
    std::unique_lock<std::mutex> lock(g_video.mutex);
    Require(g_video.changed.wait_for(lock, OUTPUT_TIMEOUT, []() { return g_video.sampledAudioClock; }),
        "The video output worker samples the active audio clock before the command");
}

void WaitForVideoReturn(uint32_t index)
{
    std::unique_lock<std::mutex> lock(g_video.mutex);
    const bool returned = g_video.changed.wait_for(lock, OUTPUT_TIMEOUT, [index]() {
        return g_video.returns[index] != BufferReturn::PENDING;
    });
    Require(returned, "Video buffer is returned before the original audio clock deadline");
}

void VerifyWaitingVideoFrame(uint32_t index)
{
    std::unique_lock<std::mutex> lock(g_video.mutex);
    const bool returned = g_video.changed.wait_for(lock, BEFORE_AUDIO_EOS, [index]() {
        return g_video.returns[index] != BufferReturn::PENDING;
    });
    Require(!returned, "The tail frame is held while the audio clock is active");
}

SampleInfo Input(Completion &done)
{
    SampleInfo info;
    info.codec.codecRunMode = BUFFER;
    info.playback.playDoneCallback = Completion::OnDone;
    info.playback.playDoneCallbackData = &done;
    return info;
}

void StartVideoPlayback(Player &player, Completion &done, bool synchronous)
{
    auto info = Input(done);
    info.codec.codecSyncMode = synchronous;
    Require(player.Init(info) == 0, "Initialize audio and video playback");
    Require(player.Start() == 0, "Start the production audio and video workers");
}

void TestVideoTailAfterAudioEos(bool synchronous)
{
    ResetVideoBoundary();
    Completion done;
    Player player;
    StartVideoPlayback(player, done, synchronous);
    const uint32_t first = QueueVideoFrame(FIRST_TAIL_PTS_US);
    WaitForAudioClock();
    VerifyWaitingVideoFrame(first);
    auto eos = std::make_shared<CodecBufferInfo>();
    eos->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    g_boundary.audio->outputBufferQueue.Enqueue(eos);
    WaitForVideoReturn(first);
    const uint32_t last = QueueVideoFrame(LAST_TAIL_PTS_US);
    const uint32_t videoEos = QueueVideoFrame(LAST_TAIL_PTS_US, true);
    done.Wait();
    Require(done.success && done.reason == PlaybackCompletionReason::COMPLETED, "Audio-first EOS completes playback");
    Require(g_video.rendered == std::vector<uint32_t> {first, last}, "Video tail is rendered in decode order");
    Require(g_video.returns[first] == BufferReturn::FREED && g_video.returns[last] == BufferReturn::FREED,
        "Both tail frames return their codec indices");
    Require(g_video.returns[videoEos] == BufferReturn::DESTROYED, "Video EOS is reclaimed by decoder destruction");
    const auto report = player.GetCompletedPlaybackInfo();
    Require(report.positionUs == LAST_TAIL_PTS_US, "Video advances the position after audio ends");
}

void TestVideoPauseAndSeek(bool synchronous)
{
    ResetVideoBoundary();
    Completion done;
    Player player;
    StartVideoPlayback(player, done, synchronous);
    const uint32_t obsolete = QueueVideoFrame(FIRST_TAIL_PTS_US);
    WaitForAudioClock();
    Require(player.Pause() == 0, "Pause while video is waiting for its audio clock");
    WaitForVideoReturn(obsolete);
    {
        std::lock_guard<std::mutex> lock(g_video.mutex);
        Require(g_video.rendered.empty(), "Pause releases the waiting frame without presentation");
    }
    Require(player.SeekTo(SEEK_POSITION_US) == 0, "Seek while paused");
    const uint32_t beforeTarget = QueueVideoFrame(0);
    const uint32_t atTarget = QueueVideoFrame(SEEK_POSITION_US);
    WaitForVideoReturn(atTarget);
    Require(player.GetState() == PLAYER_STATE_PAUSED, "A seek frame preserves the paused state");
    Require(player.Stop() == 0, "Stop after presenting the paused seek frame");
    done.Wait();
    Require(g_video.rendered == std::vector<uint32_t> {atTarget}, "Only the frame at the seek target is rendered");
    Require(g_video.returns[obsolete] == BufferReturn::FREED && g_video.returns[beforeTarget] == BufferReturn::FREED,
        "The paused frame and the pre-target frame return their indices");
}

void TestVideoWaitInterrupted(bool synchronous, bool seek)
{
    ResetVideoBoundary();
    Completion done;
    Player player;
    StartVideoPlayback(player, done, synchronous);
    const uint32_t obsolete = QueueVideoFrame(FIRST_TAIL_PTS_US);
    WaitForAudioClock();
    if (seek) {
        Require(player.SeekTo(SEEK_POSITION_US) == 0, "Seek interrupts the audio clock wait");
    }
    Require(player.Stop() == 0, "Stop interrupts the audio clock wait or completes the seek");
    done.Wait();
    const BufferReturn expected = seek ? BufferReturn::FLUSHED : BufferReturn::DESTROYED;
    Require(done.reason == PlaybackCompletionReason::STOPPED, "The completion callback reports user stop");
    Require(g_video.rendered.empty(), "A frame from the interrupted playback interval is discarded");
    Require(g_video.returns[obsolete] == expected, "Flush or destruction reclaims the waiting frame exactly once");
}

void TestVideoCleanupProgress()
{
    ResetVideoBoundary();
    Completion done;
    Player player;
    StartVideoPlayback(player, done, false);
    Require(!player.GetPlaybackInfo().cleanupProgress.active, "Normal startup does not start cleanup diagnostics");
    const uint32_t obsolete = QueueVideoFrame(FIRST_TAIL_PTS_US);
    WaitForAudioClock();
    {
        std::lock_guard<std::mutex> lock(g_video.mutex);
        g_video.blockDestroy = true;
    }
    Require(player.Stop() == 0, "Stop with a decoder that delays destruction");
    {
        std::unique_lock<std::mutex> lock(g_video.mutex);
        const bool started = g_video.changed.wait_for(lock, OUTPUT_TIMEOUT, []() { return g_video.destroying; });
        Require(started, "The release worker reaches video decoder destruction");
    }
    const CleanupProgressInfo pending = player.GetPlaybackInfo().cleanupProgress;
    Require(player.GetState() == PLAYER_STATE_STOPPING, "The session stays in STOPPING while the decoder is owned");
    Require(pending.active && pending.stage == "codec.video.destroy", "Report the blocked release stage");
    {
        std::lock_guard<std::mutex> lock(g_video.mutex);
        Require(g_video.returns[obsolete] == BufferReturn::PENDING, "Decoder owns the index until destruction");
        g_video.blockDestroy = false;
        g_video.changed.notify_all();
    }
    done.Wait();
    const CleanupProgressInfo finished = player.GetCompletedPlaybackInfo().cleanupProgress;
    Require(!finished.active && finished.revision > pending.revision,
        "Completed playback stores final cleanup progress");
    Require(finished.totalMs >= pending.totalMs, "The final duration includes the earlier wait");
    Require(g_video.returns[obsolete] == BufferReturn::DESTROYED, "Destruction reclaims the held index");
}
void TestInitializationFailure()
{
    g_boundary = {};
    g_boundary.create = CREATE_FAILURE;
    Completion done;
    Player player;
    auto info = Input(done);
    bool owned = false;
    Require(player.Init(info, &owned) != 0, "player.Init(info, &owned) != 0");
    Require(owned, "owned");
    done.Wait();
    Require(done.reason == PlaybackCompletionReason::ERROR, "done.reason == PlaybackCompletionReason::ERROR");
    Require(player.GetState() == PLAYER_STATE_IDLE, "player.GetState() == PLAYER_STATE_IDLE");
    Require(g_boundary.releases == 1, "g_boundary.releases == 1");
}
void TestStopReadyAndReplay()
{
    g_boundary = {};
    Player player;
    for (int iteration = 0; iteration < REPLAY_COUNT; ++iteration) {
        Completion done;
        auto info = Input(done);
        Require(player.Init(info) == 0, "player.Init(info) == 0");
        Require(player.GetState() == PLAYER_STATE_READY, "player.GetState() == PLAYER_STATE_READY");
        Require(player.Stop() == 0, "player.Stop() == 0");
        done.Wait();
        Require(done.reason == PlaybackCompletionReason::STOPPED, "done.reason == PlaybackCompletionReason::STOPPED");
        Require(player.GetState() == PLAYER_STATE_IDLE, "player.GetState() == PLAYER_STATE_IDLE");
    }
    Require(g_boundary.releases == REPLAY_COUNT, "g_boundary.releases == REPLAY_COUNT");
}
void TestStartFailure()
{
    g_boundary = {};
    g_boundary.start = START_FAILURE;
    Completion done;
    Player player;
    auto info = Input(done);
    Require(player.Init(info) == 0, "player.Init(info) == 0");
    Require(player.Start() != 0, "player.Start() != 0");
    done.Wait();
    Require(done.reason == PlaybackCompletionReason::ERROR, "done.reason == PlaybackCompletionReason::ERROR");
    Require(player.GetState() == PLAYER_STATE_IDLE, "player.GetState() == PLAYER_STATE_IDLE");
}
void TestNaturalCompletionAndCleanupFailure()
{
    for (bool synchronous : { false, true }) {
        g_boundary = {};
        g_boundary.natural = true;
        g_boundary.destroy = CLEANUP_FAILURE;
        Completion done;
        Player player;
        auto info = Input(done);
        info.codec.codecSyncMode = synchronous;
        Require(player.Init(info) == 0, "player.Init(info) == 0");
        Require(player.Start() == 0, "player.Start() == 0");
        done.Wait();
        Require(done.success, "done.success");
        Require(
            done.reason == PlaybackCompletionReason::COMPLETED, "done.reason == PlaybackCompletionReason::COMPLETED");
        const auto report = player.GetCompletedPlaybackInfo();
        Require(report.failure.stage.empty(), "report.failure.stage.empty()");
        Require(report.cleanupFailure.stage == "demuxer.release", "report.cleanupFailure.stage == \"demuxer.release\"");
        Require(report.cleanupFailure.code == CLEANUP_FAILURE, "report.cleanupFailure.code == CLEANUP_FAILURE");
    }
}
void TestSeekAndTrackFailures()
{
    g_boundary = {};
    Completion done;
    Player player;
    auto info = Input(done);
    Require(player.Init(info) == 0, "player.Init(info) == 0");
    Require(player.Start() == 0, "player.Start() == 0");
    g_boundary.start = TRACK_START_FAILURE;
    Require(player.SelectAudioTrack(AUDIO_TRACK_INDEX) != 0, "player.SelectAudioTrack(AUDIO_TRACK_INDEX) != 0");
    done.Wait();
    Require(done.reason == PlaybackCompletionReason::ERROR, "done.reason == PlaybackCompletionReason::ERROR");
    Require(player.GetState() == PLAYER_STATE_IDLE, "player.GetState() == PLAYER_STATE_IDLE");
    g_boundary = {};
    Completion seekDone;
    info = Input(seekDone);
    Require(player.Init(info) == 0, "player.Init(info) == 0");
    Require(player.Start() == 0, "player.Start() == 0");
    g_boundary.seek = SEEK_FAILURE;
    Require(player.SeekTo(SEEK_POSITION_US) != 0, "player.SeekTo(SEEK_POSITION_US) != 0");
    seekDone.Wait();
    Require(seekDone.reason == PlaybackCompletionReason::ERROR, "seekDone.reason == PlaybackCompletionReason::ERROR");
}
void TestCommandStopOwnership()
{
    g_boundary = {};
    NativePlayerSession session;
    Require(
        session.Begin(NativePlayerSession::Operation::START), "session.Begin(NativePlayerSession::Operation::START)");
    Require(
        !session.Begin(NativePlayerSession::Operation::TRACK), "!session.Begin(NativePlayerSession::Operation::TRACK)");
    Require(session.RequestStop(), "session.RequestStop()");
    Require(session.StopPending(), "session.StopPending()");
    Completion done;
    auto info = Input(done);
    Require(StartPlayerPlayback(session, info, Completion::OnDone, &done) != 0,
        "StartPlayerPlayback(session, info, Completion::OnDone, &done) != 0");
    done.Wait();
    session.Finish();
    Require(done.reason == PlaybackCompletionReason::STOPPED, "done.reason == PlaybackCompletionReason::STOPPED");
    Require(session.player.GetState() == PLAYER_STATE_IDLE, "session.player.GetState() == PLAYER_STATE_IDLE");
    Require(!session.seeking, "!session.seeking");
    Require(session.Begin(NativePlayerSession::Operation::SEEK), "session.Begin(NativePlayerSession::Operation::SEEK)");
    Require(!session.StopPending(), "!session.StopPending()");
    session.Finish();
}

// 排队期间的后台状态必须跨Init保留，后台起播不能提前启动renderer。
void TestBackgroundQueuedStart()
{
    g_boundary = {};
    g_rendererStarts = 0;
    Completion done;
    NativePlayerSession session;
    auto info = Input(done);
    session.player.SetBackgroundPlaybackEnabled(false);
    Require(session.Begin(NativePlayerSession::Operation::START), "Begin queued startup");
    session.player.SetAppBackground(true);
    Require(StartPlayerPlayback(session, info, Completion::OnDone, &done) == 0, "Start queued playback");
    session.Finish();
    Require(session.player.GetState() == PLAYER_STATE_PAUSED, "Background startup remains paused");
    Require(g_rendererStarts.load() == 0, "Background startup does not start the renderer");
    session.player.SetAppBackground(false);
    Require(session.player.GetState() == PLAYER_STATE_PLAYING, "Foreground resumes background startup");
    Require(g_rendererStarts.load() == 1, "Foreground starts the renderer once");
    Require(session.player.Stop() == 0, "Stop queued playback");
    done.Wait();
}

void TestBackgroundReadyAndReplay()
{
    g_boundary = {};
    Player player;
    for (int iteration = 0; iteration < REPLAY_COUNT; ++iteration) {
        Completion done;
        auto info = Input(done);
        Require(player.Init(info) == 0, "Initialize playback for background policy");
        player.SetAppBackground(false);
        player.SetAppBackground(true);
        g_rendererStarts = 0;
        Require(player.Start() == 0, "Start background playback in READY state");
        Require(player.GetState() == PLAYER_STATE_PAUSED, "Background playback remains paused");
        Require(g_rendererStarts.load() == 0, "No renderer start before background permission");
        player.SetBackgroundPlaybackEnabled(true);
        Require(player.GetState() == PLAYER_STATE_PLAYING, "Enabling background playback resumes");
        player.SetBackgroundPlaybackEnabled(false);
        Require(player.GetState() == PLAYER_STATE_PAUSED, "Disabling background playback pauses");
        Require(player.Stop() == 0, "Stop background playback");
        done.Wait();
    }
}

void TestAllowedBackgroundStart()
{
    g_boundary = {};
    Completion done;
    Player player;
    auto info = Input(done);
    player.SetAppBackground(true);
    player.SetBackgroundPlaybackEnabled(true);
    Require(player.Init(info) == 0, "Initialize allowed background playback");
    g_rendererStarts = 0;
    Require(player.Start() == 0, "Start allowed background playback");
    Require(player.GetState() == PLAYER_STATE_PLAYING, "Allowed background startup plays");
    Require(g_rendererStarts.load() == 1, "Allowed background startup starts the renderer once");
    Require(player.Pause() == 0, "Pause playback manually");
    player.SetAppBackground(false);
    Require(player.GetState() == PLAYER_STATE_PAUSED, "Foreground preserves a manual pause");
    Require(player.Stop() == 0, "Stop allowed background playback");
    done.Wait();
}
}

// 替换设备能力边界；Init、Start、Stop、Seek和Release编排链接生产实现。
int32_t Demuxer::Create(SampleInfo &info)
{
    info.video.videoCodecMime.clear();
    if (g_video.enabled) {
        info.video.videoCodecMime = "video/avc";
        info.video.videoWidth = FRAME_DIMENSION;
        info.video.videoHeight = FRAME_DIMENSION;
        info.video.frameRate = VIDEO_FRAME_RATE;
    }
    info.audio.audioCodecMime = "audio/aac";
    info.audio.audioSampleRate = AUDIO_SAMPLE_RATE;
    info.audio.audioChannelCount = AUDIO_CHANNEL_COUNT;
    info.source.durationUs = g_video.enabled ? VIDEO_DURATION_US : SOURCE_DURATION_US;
    return g_boundary.create;
}
Demuxer::~Demuxer() = default;
int32_t Demuxer::Release()
{
    ++g_boundary.releases;
    return g_boundary.destroy;
}
int32_t Demuxer::Seek(int64_t, OH_AVSeekMode)
{
    return g_boundary.seek;
}
int32_t Demuxer::GetAudioTrackId()
{
    return 0;
}
int32_t Demuxer::GetVideoTrackId()
{
    return VIDEO_TRACK_INDEX;
}
int32_t Demuxer::ReadSample(int32_t, OH_AVBuffer *, OH_AVCodecBufferAttr &attr)
{
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return 0;
}
int32_t Demuxer::SelectAudioTrack(int32_t, SampleInfo &)
{
    return 0;
}
int32_t Demuxer::GetAudioTrackInfo(int32_t, AudioSampleInfo &info)
{
    info.audioCodecMime = "audio/aac";
    return 0;
}
AudioDecoder::~AudioDecoder() = default;
int32_t AudioDecoder::Create(const std::string &)
{
    return 0;
}
int32_t AudioDecoder::Config(const SampleInfo &, CodecUserData *context)
{
    g_boundary.audio = context;
    return 0;
}
int32_t AudioDecoder::ValidateConfiguration(const SampleInfo &)
{
    return 0;
}
int32_t AudioDecoder::Start()
{
    if (g_boundary.start != 0) {
        return g_boundary.start;
    }
    if (g_boundary.natural) {
        g_boundary.audio->outputFrameCount.fetch_add(1);
        auto eos = std::make_shared<CodecBufferInfo>();
        eos->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        g_boundary.audio->outputBufferQueue.Enqueue(eos);
    }
    return 0;
}
int32_t AudioDecoder::GetInputBuffer(CodecBufferInfo &, int64_t)
{
    return AVCODEC_SAMPLE_ERR_AGAIN;
}
int32_t AudioDecoder::PushInputBuffer(CodecBufferInfo &)
{
    return 0;
}
int32_t AudioDecoder::GetOutputBuffer(CodecBufferInfo &output, int64_t timeoutUs)
{
    if (g_video.enabled) {
        const auto timeoutMs = static_cast<int32_t>(timeoutUs / MILLISECOND_US);
        const auto result = g_boundary.audio->outputBufferQueue.Dequeue(timeoutMs);
        if (result == nullptr) {
            return AVCODEC_SAMPLE_ERR_AGAIN;
        }
        if (result->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            return AVCODEC_SAMPLE_ERR_END;
        }
        output = *result;
        return AVCODEC_SAMPLE_ERR_OK;
    }
    return g_boundary.natural ? AVCODEC_SAMPLE_ERR_END : AVCODEC_SAMPLE_ERR_AGAIN;
}
int32_t AudioDecoder::FreeOutputBuffer(const CodecBufferInfo &)
{
    return 0;
}
int32_t AudioDecoder::Stop()
{
    return 0;
}
int32_t AudioDecoder::Flush()
{
    return 0;
}
int32_t AudioDecoder::Release()
{
    return 0;
}
VideoDecoder::~VideoDecoder() = default;
int32_t VideoDecoder::Create(const std::string &, int32_t)
{
    return 0;
}
int32_t VideoDecoder::CreateByName(const std::string &)
{
    return 0;
}
int32_t VideoDecoder::Config(const SampleInfo &, CodecUserData *context)
{
    g_video.context = context;
    return 0;
}
int32_t VideoDecoder::Start()
{
    g_video.context->inputBufferQueue.Enqueue(std::make_shared<CodecBufferInfo>());
    return 0;
}
int32_t VideoDecoder::Stop()
{
    return 0;
}
int32_t VideoDecoder::Flush()
{
    std::lock_guard<std::mutex> lock(g_video.mutex);
    std::replace(g_video.returns.begin(), g_video.returns.end(), BufferReturn::PENDING, BufferReturn::FLUSHED);
    g_video.changed.notify_all();
    return 0;
}
int32_t VideoDecoder::Release()
{
    std::unique_lock<std::mutex> lock(g_video.mutex);
    g_video.destroying = true;
    g_video.changed.notify_all();
    g_video.changed.wait(lock, []() { return !g_video.blockDestroy; });
    std::replace(g_video.returns.begin(), g_video.returns.end(), BufferReturn::PENDING, BufferReturn::DESTROYED);
    g_video.context = nullptr;
    g_video.changed.notify_all();
    return 0;
}
int32_t VideoDecoder::GetInputBuffer(CodecBufferInfo &, int64_t)
{
    return AVCODEC_SAMPLE_ERR_OK;
}
int32_t VideoDecoder::PushInputBuffer(CodecBufferInfo &)
{
    return AVCODEC_SAMPLE_ERR_OK;
}
int32_t VideoDecoder::GetOutputBuffer(CodecBufferInfo &output, int64_t timeoutUs)
{
    const auto result = g_video.context->outputBufferQueue.Dequeue(static_cast<int32_t>(timeoutUs / MILLISECOND_US));
    if (result == nullptr) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    output = *result;
    return AVCODEC_SAMPLE_ERR_OK;
}
OH_AVFormat *VideoDecoder::GetOutputDescription()
{
    return nullptr;
}
int32_t VideoDecoder::OnUserSpeedChanged(double)
{
    return 0;
}
int32_t VideoDecoder::OnThermalWarningReceived(double)
{
    return 0;
}
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &bufferInfo, bool)
{
    std::lock_guard<std::mutex> lock(g_video.mutex);
    Require(bufferInfo.bufferIndex < g_video.returns.size(), "Return a known video output index");
    auto &ownership = g_video.returns[bufferInfo.bufferIndex];
    Require(ownership == BufferReturn::PENDING, "Return each output index once");
    ownership = BufferReturn::FREED;
    g_video.changed.notify_all();
    return 0;
}
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &bufferInfo, bool render, int64_t)
{
    return FreeOutputBuffer(bufferInfo, render);
}
bool CodecCapability::ValidateVideoConfiguration(const SampleInfo &, bool)
{
    return true;
}
bool CodecCapability::ValidateVideoFeatureConfiguration(const SampleInfo &)
{
    return true;
}
OH_AVCapability *CodecCapability::GetCapability(const std::string &, bool, int32_t, const std::string &)
{
    return nullptr;
}
namespace NativeXComponentSample {
PluginManager PluginManager::pluginManager_;
PluginManager::~PluginManager() = default;
PluginManager::PluginWindowLease::~PluginWindowLease() = default;
PluginManager::PluginWindowLease &PluginManager::PluginWindowLease::operator=(PluginWindowLease &&) noexcept
{
    return *this;
}
PluginManager::PluginWindowLease PluginManager::AcquirePluginWindow()
{
    return {};
}
}
OpenGLVideoSink::~OpenGLVideoSink() = default;
int32_t OpenGLVideoSink::Present(const VideoPresentRequest &)
{
    return 0;
}
void OpenGLVideoSink::BeginPlayback() { }
bool OpenGLVideoSink::Quiesce()
{
    return true;
}
void OpenGLVideoSink::DiscardPendingFrames() { }
OHNativeWindow *OpenGLVideoSink::PrepareForPlayback(const SampleInfo &)
{
    return nullptr;
}
void OpenGLVideoSink::Reset() { }
VulkanVideoSink::~VulkanVideoSink() = default;
int32_t VulkanVideoSink::Present(const VideoPresentRequest &)
{
    return 0;
}
void VulkanVideoSink::BeginPlayback() { }
bool VulkanVideoSink::Quiesce()
{
    return true;
}
void VulkanVideoSink::DiscardPendingFrames() { }
OHNativeWindow *VulkanVideoSink::PrepareForPlayback(const SampleInfo &)
{
    return nullptr;
}
VideoSinkDiagnostics VulkanVideoSink::GetDiagnostics() const
{
    return {};
}
void VulkanVideoSink::Reset() { }
bool BufferRenderer::Render(CodecBufferInfo &bufferInfo, const SampleInfo &, const CodecUserData &, int64_t)
{
    std::lock_guard<std::mutex> lock(g_video.mutex);
    g_video.rendered.push_back(bufferInfo.bufferIndex);
    return true;
}
void BufferRenderer::Reset() { }
bool HdrMetadataHelper::IsHdrVivid(OH_AVBuffer *)
{
    return false;
}
bool HdrMetadataHelper::IsLastFlushedBufferHdrVivid(OHNativeWindow *)
{
    return false;
}
int main()
{
    TestInitializationFailure();
    TestStopReadyAndReplay();
    TestStartFailure();
    TestNaturalCompletionAndCleanupFailure();
    TestSeekAndTrackFailures();
    TestCommandStopOwnership();
    TestBackgroundQueuedStart();
    TestBackgroundReadyAndReplay();
    TestAllowedBackgroundStart();
    for (bool synchronous : {false, true}) {
        TestVideoTailAfterAudioEos(synchronous);
        TestVideoPauseAndSeek(synchronous);
        TestVideoWaitInterrupted(synchronous, true);
        TestVideoWaitInterrupted(synchronous, false);
    }
    TestVideoCleanupProgress();
    std::cout << "Player production lifecycle integration passed" << std::endl;
}
