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
#include <cassert>
#include <condition_variable>
#include <cstdarg>
#include <iostream>
#include <cstring>
#include "sample/player/core/Player.h"
#include "sample/player/output/video/gpu/OpenGLVideoSink.h"
#include "sample/player/output/video/gpu/VulkanVideoSink.h"
#include "codec_capability.h"
#include "sample/player/napi/NativePlayerContext.h"

struct OH_AudioStreamBuilderStruct {};
struct OH_AudioRendererStruct {};
struct OH_AVBuffer { uint8_t data[16] {}; OH_AVCodecBufferAttr attr {}; };
const char *OH_AVCODEC_MIMETYPE_VIDEO_HEVC = "video/hevc";
extern "C" {
int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...) { return 0; }
bool OH_AVCapability_IsHardware(OH_AVCapability *) { return false; }
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
OH_AudioStream_Result OH_AudioRenderer_Start(OH_AudioRenderer *) { return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioRenderer_Stop(OH_AudioRenderer *) { return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioRenderer_Pause(OH_AudioRenderer *) { return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioRenderer_SetSpeed(OH_AudioRenderer *, float) { return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioRenderer_SetVolume(OH_AudioRenderer *, float) { return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetLatencyMode(OH_AudioStreamBuilder *, OH_AudioStream_LatencyMode)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetSamplingRate(OH_AudioStreamBuilder *, int32_t)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetChannelCount(OH_AudioStreamBuilder *, int32_t)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetSampleFormat(OH_AudioStreamBuilder *, OH_AudioStream_SampleFormat)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetEncodingType(OH_AudioStreamBuilder *, OH_AudioStream_EncodingType)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererInfo(OH_AudioStreamBuilder *, OH_AudioStream_Usage)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererCallback(OH_AudioStreamBuilder *, OH_AudioRenderer_Callbacks, void *)
{ return AUDIOSTREAM_SUCCESS; }
OH_AudioStream_Result OH_AudioStreamBuilder_SetRendererInterruptCallback(OH_AudioStreamBuilder *,
    OH_AudioRenderer_OnInterruptCallback, void *)
{ return AUDIOSTREAM_SUCCESS; }
int32_t OH_NativeWindow_NativeWindowHandleOpt(OHNativeWindow *, int, ...) { return 0; }
uint8_t *OH_AVBuffer_GetAddr(OH_AVBuffer *buffer) { return buffer->data; }
int32_t OH_AVBuffer_GetCapacity(OH_AVBuffer *) { return 16; }
OH_AVErrCode OH_AVBuffer_GetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{ *attr = buffer->attr; return AV_ERR_OK; }
}
int32_t SampleCallback::OnRenderWriteData(OH_AudioRenderer *, void *, void *, int32_t) { return 0; }
int32_t SampleCallback::OnRenderStreamEvent(OH_AudioRenderer *, void *, OH_AudioStream_Event) { return 0; }
int32_t SampleCallback::OnRenderInterruptEvent(OH_AudioRenderer *, void *, OH_AudioInterrupt_ForceType,
    OH_AudioInterrupt_Hint) { return 0; }
void SampleCallback::OnRenderInterrupt(OH_AudioRenderer *, void *, OH_AudioInterrupt_ForceType, OH_AudioInterrupt_Hint) {}
int32_t SampleCallback::OnRenderError(OH_AudioRenderer *, void *, OH_AudioStream_Result) { return 0; }

namespace {
struct Boundary {
    int create = 0;
    int start = 0;
    int seek = 0;
    int destroy = 0;
    int releases = 0;
    CodecUserData *audio = nullptr;
    bool natural = false;
} boundary;
struct Completion {
    std::mutex mutex;
    std::condition_variable changed;
    int calls = 0;
    bool success = false;
    PlaybackCompletionReason reason = PlaybackCompletionReason::ERROR;
    static void OnDone(void *data, bool success, PlaybackCompletionReason reason)
    {
        auto *result = static_cast<Completion *>(data);
        std::lock_guard<std::mutex> lock(result->mutex);
        ++result->calls;
        result->success = success;
        result->reason = reason;
        result->changed.notify_all();
    }
    void Wait()
    {
        std::unique_lock<std::mutex> lock(mutex);
        assert(changed.wait_for(lock, std::chrono::seconds(3), [this]() { return calls > 0; }));
        assert(calls == 1);
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
    boundary = {};
    boundary.create = -7;
    Completion done;
    Player player;
    auto info = Input(done);
    bool owned = false;
    assert(player.Init(info, &owned) != 0);
    assert(owned);
    done.Wait();
    assert(done.reason == PlaybackCompletionReason::ERROR);
    assert(player.GetState() == PLAYER_STATE_IDLE);
    assert(boundary.releases == 1);
}
void TestStopReadyAndReplay()
{
    boundary = {};
    Player player;
    for (int iteration = 0; iteration < 3; ++iteration) {
        Completion done;
        auto info = Input(done);
        assert(player.Init(info) == 0);
        assert(player.GetState() == PLAYER_STATE_READY);
        assert(player.Stop() == 0);
        done.Wait();
        assert(done.reason == PlaybackCompletionReason::STOPPED);
        assert(player.GetState() == PLAYER_STATE_IDLE);
    }
    assert(boundary.releases == 3);
}
void TestStartFailure()
{
    boundary = {};
    boundary.start = -9;
    Completion done;
    Player player;
    auto info = Input(done);
    assert(player.Init(info) == 0);
    assert(player.Start() != 0);
    done.Wait();
    assert(done.reason == PlaybackCompletionReason::ERROR);
    assert(player.GetState() == PLAYER_STATE_IDLE);
}
void TestNaturalCompletionAndCleanupFailure()
{
    for (bool synchronous : {false, true}) {
        boundary = {};
        boundary.natural = true;
        boundary.destroy = -27;
        Completion done;
        Player player;
        auto info = Input(done);
        info.codec.codecSyncMode = synchronous;
        assert(player.Init(info) == 0);
        assert(player.Start() == 0);
        done.Wait();
        assert(done.success);
        assert(done.reason == PlaybackCompletionReason::COMPLETED);
        const auto report = player.GetCompletedPlaybackInfo();
        assert(report.failure.stage.empty());
        assert(report.cleanupFailure.stage == "demuxer.release");
        assert(report.cleanupFailure.code == -27);
    }
}
void TestSeekAndTrackFailures()
{
    boundary = {};
    Completion done;
    Player player;
    auto info = Input(done);
    assert(player.Init(info) == 0);
    assert(player.Start() == 0);
    boundary.start = -31;
    assert(player.SelectAudioTrack(2) != 0);
    done.Wait();
    assert(done.reason == PlaybackCompletionReason::ERROR);
    assert(player.GetState() == PLAYER_STATE_IDLE);
    boundary = {};
    Completion seekDone;
    info = Input(seekDone);
    assert(player.Init(info) == 0);
    assert(player.Start() == 0);
    boundary.seek = -33;
    assert(player.SeekTo(200000) != 0);
    seekDone.Wait();
    assert(seekDone.reason == PlaybackCompletionReason::ERROR);
}
void TestCommandStopOwnership()
{
    boundary = {};
    NativePlayerSession session;
    assert(session.Begin(NativePlayerSession::Operation::START));
    assert(!session.Begin(NativePlayerSession::Operation::TRACK));
    assert(session.RequestStop());
    assert(session.StopPending());
    Completion done;
    auto info = Input(done);
    assert(StartPlayerPlayback(session, info, Completion::OnDone, &done) != 0);
    done.Wait();
    session.Finish();
    assert(done.reason == PlaybackCompletionReason::STOPPED);
    assert(session.player.GetState() == PLAYER_STATE_IDLE);
    assert(!session.seeking);
    assert(session.Begin(NativePlayerSession::Operation::SEEK));
    assert(!session.StopPending());
    session.Finish();
}
}

// 替换设备能力边界；Init、Start、Stop、Seek和Release编排链接生产实现。
int32_t Demuxer::Create(SampleInfo &info)
{
    info.video.videoCodecMime.clear();
    info.audio.audioCodecMime = "audio/aac";
    info.audio.audioSampleRate = 48000;
    info.audio.audioChannelCount = 2;
    info.source.durationUs = 1000000;
    return boundary.create;
}
Demuxer::~Demuxer() = default;
int32_t Demuxer::Release() { ++boundary.releases; return boundary.destroy; }
int32_t Demuxer::Seek(int64_t, OH_AVSeekMode) { return boundary.seek; }
int32_t Demuxer::GetAudioTrackId() { return 0; }
int32_t Demuxer::ReadSample(int32_t, OH_AVBuffer *, OH_AVCodecBufferAttr &attr)
{
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return 0;
}
int32_t Demuxer::SelectAudioTrack(int32_t, SampleInfo &) { return 0; }
int32_t Demuxer::GetAudioTrackInfo(int32_t, AudioSampleInfo &info)
{
    info.audioCodecMime = "audio/aac";
    return 0;
}
AudioDecoder::~AudioDecoder() = default;
int32_t AudioDecoder::Create(const std::string &) { return 0; }
int32_t AudioDecoder::Config(const SampleInfo &, CodecUserData *context) { boundary.audio = context; return 0; }
int32_t AudioDecoder::ValidateConfiguration(const SampleInfo &) { return 0; }
int32_t AudioDecoder::Start()
{
    if (boundary.start != 0) { return boundary.start; }
    if (boundary.natural) {
        boundary.audio->outputFrameCount.fetch_add(1);
        auto eos = std::make_shared<CodecBufferInfo>();
        eos->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        boundary.audio->outputBufferQueue.Enqueue(eos);
    }
    return 0;
}
int32_t AudioDecoder::GetInputBuffer(CodecBufferInfo &, int64_t) { return AVCODEC_SAMPLE_ERR_AGAIN; }
int32_t AudioDecoder::PushInputBuffer(CodecBufferInfo &) { return 0; }
int32_t AudioDecoder::GetOutputBuffer(CodecBufferInfo &, int64_t)
{
    return boundary.natural ? AVCODEC_SAMPLE_ERR_END : AVCODEC_SAMPLE_ERR_AGAIN;
}
int32_t AudioDecoder::FreeOutputBuffer(const CodecBufferInfo &) { return 0; }
int32_t AudioDecoder::Stop() { return 0; }
int32_t AudioDecoder::Flush() { return 0; }
int32_t AudioDecoder::Release() { return 0; }
VideoDecoder::~VideoDecoder() = default;
int32_t VideoDecoder::Create(const std::string &, int32_t) { return 0; }
int32_t VideoDecoder::CreateByName(const std::string &) { return 0; }
int32_t VideoDecoder::Config(const SampleInfo &, CodecUserData *) { return 0; }
int32_t VideoDecoder::Start() { return 0; }
int32_t VideoDecoder::Stop() { return 0; }
int32_t VideoDecoder::Flush() { return 0; }
int32_t VideoDecoder::Release() { return 0; }
int32_t VideoDecoder::OnUserSpeedChanged(double) { return 0; }
int32_t VideoDecoder::OnThermalWarningReceived(double) { return 0; }
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &, bool) { return 0; }
bool CodecCapability::ValidateVideoConfiguration(const SampleInfo &, bool) { return true; }
bool CodecCapability::ValidateVideoFeatureConfiguration(const SampleInfo &) { return true; }
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
PluginManager::PluginWindowLease PluginManager::AcquirePluginWindow() { return {}; }
}
OpenGLVideoSink::~OpenGLVideoSink() = default;
int32_t OpenGLVideoSink::Present(const VideoPresentRequest &) { return 0; }
void OpenGLVideoSink::BeginPlayback() {}
bool OpenGLVideoSink::Quiesce() { return true; }
void OpenGLVideoSink::DiscardPendingFrames() {}
OHNativeWindow *OpenGLVideoSink::PrepareForPlayback(const SampleInfo &) { return nullptr; }
void OpenGLVideoSink::Reset() {}
VulkanVideoSink::~VulkanVideoSink() = default;
int32_t VulkanVideoSink::Present(const VideoPresentRequest &) { return 0; }
void VulkanVideoSink::BeginPlayback() {}
bool VulkanVideoSink::Quiesce() { return true; }
void VulkanVideoSink::DiscardPendingFrames() {}
OHNativeWindow *VulkanVideoSink::PrepareForPlayback(const SampleInfo &) { return nullptr; }
VideoSinkDiagnostics VulkanVideoSink::GetDiagnostics() const { return {}; }
void VulkanVideoSink::Reset() {}
bool BufferRenderer::Render(CodecBufferInfo &, const SampleInfo &, const CodecUserData &, int64_t) { return true; }
void BufferRenderer::Reset() {}
void Player::VideoDecInputAsyncThread() {}
void Player::VideoDecOutputAsyncThread() {}
void Player::VideoDecInputSyncThread() {}
void Player::VideoDecOutputSyncThread() {}
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
