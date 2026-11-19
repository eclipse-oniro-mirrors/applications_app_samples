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
#include <iostream>
#include <vector>
#include "sample/recorder/core/Recorder.h"
namespace {
constexpr int CREATE_FAILURE = -7;
constexpr int START_FAILURE = -11;
constexpr int RELEASE_FAILURE = -13;
constexpr int REPLAY_COUNT = 3;
constexpr int MUXER_CLEANUP = 1;
constexpr int ENCODER_CLEANUP = 2;
constexpr int DRAIN_DEADLINE_SECONDS = 5;
constexpr int DRAIN_UPPER_BOUND_MS = 6500;

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
    int notify = 0;
    int release = 0;
    int muxCloses = 0;
    int codecCloses = 0;
    bool eos = true;
    bool timeout = false;
    CodecUserData *video = nullptr;
    std::vector<int> cleanup;
} g_boundary;
void TestPartialInitializationAndRetry()
{
    g_boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    g_boundary.create = CREATE_FAILURE;
    Require(recorder.Init(info) == CREATE_FAILURE, "recorder.Init(info) == CREATE_FAILURE");
    Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
    Require(g_boundary.muxCloses == 1, "g_boundary.muxCloses == 1");
    Require(g_boundary.codecCloses == 1, "g_boundary.codecCloses == 1");
    g_boundary.create = 0;
    Require(recorder.Init(info) == 0, "recorder.Init(info) == 0");
    const int32_t stopped = recorder.StopEnd();
    if (stopped != 0) {
        const auto failure = recorder.GetFailure();
        std::cerr << "Initialized recorder stop: " << failure.stage << " code=" << failure.code << std::endl;
    }
    Require(stopped == 0, "Initialized recorder releases without a drain");
    Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
}
void TestStartFailure()
{
    g_boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    Require(recorder.Init(info) == 0, "recorder.Init(info) == 0");
    g_boundary.start = START_FAILURE;
    Require(recorder.Start() == START_FAILURE, "recorder.Start() == START_FAILURE");
    Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
    Require(g_boundary.cleanup == std::vector<int>({ MUXER_CLEANUP, ENCODER_CLEANUP }),
        "g_boundary.cleanup == std::vector<int>({MUXER_CLEANUP, ENCODER_CLEANUP})");
}
void TestStopAndImmediateReplay()
{
    g_boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    for (int session = 0; session < REPLAY_COUNT; ++session) {
        Require(recorder.Init(info) == 0, "recorder.Init(info) == 0");
        Require(recorder.Start() == 0, "recorder.Start() == 0");
        Require(recorder.StopStart() == 0, "recorder.StopStart() == 0");
        const int32_t stopped = recorder.StopEnd();
        if (stopped != 0) {
            const auto failure = recorder.GetFailure();
            std::cerr << "Running recorder stop: " << failure.stage << " code=" << failure.code << std::endl;
        }
        Require(stopped == 0, "Running recorder drains before release");
        Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
    }
    Require(g_boundary.muxCloses == REPLAY_COUNT, "g_boundary.muxCloses == REPLAY_COUNT");
    Require(g_boundary.codecCloses == REPLAY_COUNT, "g_boundary.codecCloses == REPLAY_COUNT");
}
void TestMissingEosAndReleaseFailure()
{
    for (bool eos : { false, true }) {
        g_boundary = {};
        g_boundary.eos = eos;
        g_boundary.release = eos ? RELEASE_FAILURE : 0;
        Recorder recorder;
        SampleInfo info;
        info.audio.enabled = false;
        Require(recorder.Init(info) == 0, "recorder.Init(info) == 0");
        Require(recorder.Start() == 0, "recorder.Start() == 0");
        Require(recorder.StopEnd() != 0, "recorder.StopEnd() != 0");
        Require(!recorder.GetFailure().stage.empty(), "!recorder.GetFailure().stage.empty()");
        Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
    }
}
void TestSharedDrainDeadline()
{
    g_boundary = {};
    g_boundary.timeout = true;
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = true;
    Require(recorder.Init(info) == 0, "recorder.Init(info) == 0");
    Require(recorder.Start() == 0, "recorder.Start() == 0");
    const auto started = std::chrono::steady_clock::now();
    Require(recorder.StopEnd() != 0, "recorder.StopEnd() != 0");
    const auto elapsed = std::chrono::steady_clock::now() - started;
    Require(elapsed >= std::chrono::seconds(DRAIN_DEADLINE_SECONDS),
        "elapsed >= std::chrono::seconds(DRAIN_DEADLINE_SECONDS)");
    Require(elapsed < std::chrono::milliseconds(DRAIN_UPPER_BOUND_MS),
        "elapsed < std::chrono::milliseconds(DRAIN_UPPER_BOUND_MS)");
    Require(!recorder.IsSessionActive(), "!recorder.IsSessionActive()");
}
}

// 编码器、封装器和相机由宿主替换，录制会话和收尾链接生产实现。
extern "C" {
int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}
OH_AVFormat *OH_AVFormat_Create()
{
    return nullptr;
}
void OH_AVFormat_Destroy(OH_AVFormat *) { }
bool OH_AVFormat_GetIntValue(OH_AVFormat *, const char *, int32_t *)
{
    return false;
}
bool OH_AVFormat_GetLongValue(OH_AVFormat *, const char *, int64_t *)
{
    return false;
}
bool OH_AVFormat_GetDoubleValue(OH_AVFormat *, const char *, double *)
{
    return false;
}
void OH_NativeWindow_DestroyNativeWindow(OHNativeWindow *) { }
Image_ErrorCode OH_ImageNative_Release(OH_ImageNative *)
{
    return IMAGE_SUCCESS;
}
}
const char *OH_MD_KEY_WIDTH = "width";
const char *OH_MD_KEY_HEIGHT = "height";
const char *OH_MD_KEY_FRAME_RATE = "fps";
const char *OH_MD_KEY_BITRATE = "bitrate";
Muxer::~Muxer() = default;
int32_t Muxer::Create(int32_t, int32_t)
{
    return g_boundary.create;
}
int32_t Muxer::Config(SampleInfo &)
{
    return 0;
}
int32_t Muxer::Start()
{
    return 0;
}
int32_t Muxer::Release()
{
    g_boundary.cleanup.push_back(MUXER_CLEANUP);
    ++g_boundary.muxCloses;
    return g_boundary.release;
}
VideoEncoder::~VideoEncoder() = default;
int32_t VideoEncoder::Create(const std::string &)
{
    return 0;
}
int32_t VideoEncoder::CreateByName(const std::string &)
{
    return 0;
}
int32_t VideoEncoder::CreatePrimaryWithPreproc(const std::string &)
{
    return 0;
}
int32_t VideoEncoder::CreateSecondaryFromPrimary(VideoEncoder &)
{
    return 0;
}
int32_t VideoEncoder::Config(SampleInfo &, CodecUserData *context, bool)
{
    g_boundary.video = context;
    return 0;
}
int32_t VideoEncoder::Start()
{
    return g_boundary.start;
}
int32_t VideoEncoder::NotifyEndOfStream()
{
    auto output = std::make_shared<CodecBufferInfo>();
    output->attr.flags = g_boundary.eos ? AVCODEC_BUFFER_FLAGS_EOS : AVCODEC_BUFFER_FLAGS_NONE;
    g_boundary.video->outputBufferQueue.Enqueue(output);
    return g_boundary.notify;
}
OH_AVFormat *VideoEncoder::GetOutputDescription()
{
    return nullptr;
}
int32_t VideoEncoder::Release()
{
    g_boundary.cleanup.push_back(ENCODER_CLEANUP);
    ++g_boundary.codecCloses;
    return 0;
}
AudioEncoder::~AudioEncoder() = default;
int32_t AudioEncoder::Start()
{
    return 0;
}
int32_t AudioEncoder::Release()
{
    return 0;
}
AudioCapturer::~AudioCapturer() = default;
bool AudioCapturer::AudioCapturerStart()
{
    return true;
}
void AudioCapturer::AudioCapturerRelease() { }
RecorderFrameReceiver::~RecorderFrameReceiver() = default;
bool RecorderFrameReceiver::Create(int32_t, int32_t)
{
    return false;
}
OH_ImageNative *RecorderFrameReceiver::ReadLatest(int32_t)
{
    return nullptr;
}
void RecorderFrameReceiver::CancelWait() { }
void Recorder::RefreshStreamStorage(bool, bool) { }
int32_t Recorder::CreateAudioEncoder()
{
    audioEncContext_ = std::make_unique<CodecUserData>();
    return 0;
}
int32_t AudioCapturer::AudioCapturerInit(const SampleInfo &, CodecUserData *)
{
    return 0;
}
int32_t Recorder::StartVideoInputThread()
{
    return 0;
}
int32_t Recorder::SendBufferVideoEndOfStream()
{
    std::abort();
}
int32_t Recorder::SendAudioEndOfStreamSync()
{
    return 0;
}
int32_t Recorder::SendAudioEndOfStreamAsync()
{
    return 0;
}
void Recorder::AudioEncInputSyncThread() { }
void Recorder::AudioEncInputAsyncThread() { }
void Recorder::AudioEncOutputSyncThread() { }
void Recorder::AudioEncOutputAsyncThread() { }
void Recorder::VideoEncOutputAsyncThread()
{
    // 通过生产队列接收模拟codec输出，取消时由Release唤醒，避免依赖停止标记的通知时机。
    const auto output = encContext_->outputBufferQueue.Dequeue();
    if (output == nullptr || g_boundary.timeout) {
        return;
    }
    std::lock_guard<std::mutex> lock(outputDoneMutex_);
    videoOutputEosReceived_ = (output->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    videoOutputDone_ = true;
    outputDoneCond_.notify_all();
}
void Recorder::VideoEncOutputSyncThread()
{
    VideoEncOutputAsyncThread();
}
void Recorder::SecondaryVideoEncOutputAsyncThread()
{
    std::abort();
}
void Recorder::SecondaryVideoEncOutputSyncThread()
{
    std::abort();
}
int main()
{
    TestPartialInitializationAndRetry();
    TestStartFailure();
    TestStopAndImmediateReplay();
    TestMissingEosAndReleaseFailure();
    TestSharedDrainDeadline();
    std::cout << "Recorder production lifecycle integration passed" << std::endl;
}
