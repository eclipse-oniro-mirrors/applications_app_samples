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
#include <cstdlib>
#include <condition_variable>
#include <cstdarg>
#include <iostream>
#include <cstring>
#include "sample/player/core/Player.h"
#include "sample/player/output/video/gpu/OpenGLVideoSink.h"
#include "sample/player/output/video/gpu/VulkanVideoSink.h"
#include "codec_capability.h"
#include "sample/player/napi/NativePlayerContext.h"

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
}

struct OH_AudioStreamBuilderStruct { };
struct OH_AudioRendererStruct { };
struct OH_AVBuffer {
    uint8_t data[BUFFER_CAPACITY] {};
    OH_AVCodecBufferAttr attr {};
};
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
uint8_t *OH_AVBuffer_GetAddr(OH_AVBuffer *buffer)
{
    return buffer->data;
}
int32_t OH_AVBuffer_GetCapacity(OH_AVBuffer *)
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
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

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
SampleInfo Input(Completion &done)
{
    SampleInfo info;
    info.codec.codecRunMode = BUFFER;
    info.playback.playDoneCallback = Completion::OnDone;
    info.playback.playDoneCallbackData = &done;
    return info;
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
}

// 替换设备能力边界；Init、Start、Stop、Seek和Release编排链接生产实现。
int32_t Demuxer::Create(SampleInfo &info)
{
    info.video.videoCodecMime.clear();
    info.audio.audioCodecMime = "audio/aac";
    info.audio.audioSampleRate = AUDIO_SAMPLE_RATE;
    info.audio.audioChannelCount = AUDIO_CHANNEL_COUNT;
    info.source.durationUs = SOURCE_DURATION_US;
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
int32_t AudioDecoder::GetOutputBuffer(CodecBufferInfo &, int64_t)
{
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
int32_t VideoDecoder::Config(const SampleInfo &, CodecUserData *)
{
    return 0;
}
int32_t VideoDecoder::Start()
{
    return 0;
}
int32_t VideoDecoder::Stop()
{
    return 0;
}
int32_t VideoDecoder::Flush()
{
    return 0;
}
int32_t VideoDecoder::Release()
{
    return 0;
}
int32_t VideoDecoder::OnUserSpeedChanged(double)
{
    return 0;
}
int32_t VideoDecoder::OnThermalWarningReceived(double)
{
    return 0;
}
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &, bool)
{
    return 0;
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
bool BufferRenderer::Render(CodecBufferInfo &, const SampleInfo &, const CodecUserData &, int64_t)
{
    return true;
}
void BufferRenderer::Reset() { }
void Player::VideoDecInputAsyncThread() { }
void Player::VideoDecOutputAsyncThread() { }
void Player::VideoDecInputSyncThread() { }
void Player::VideoDecOutputSyncThread() { }
int main()
{
    TestInitializationFailure();
    TestStopReadyAndReplay();
    TestStartFailure();
    TestNaturalCompletionAndCleanupFailure();
    TestSeekAndTrackFailures();
    TestCommandStopOwnership();
    std::cout << "Player production lifecycle integration passed" << std::endl;
}
