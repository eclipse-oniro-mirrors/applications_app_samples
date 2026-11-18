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
#include <iostream>
#include <vector>
#include "sample/recorder/core/Recorder.h"
namespace {
struct Boundary {
    int create = 0;
    int start = 0;
    int notify = 0;
    int release = 0;
    int muxCloses = 0;
    int codecCloses = 0;
    bool eos = true;
    bool timeout = false;
    std::vector<int> cleanup;
} boundary;
void TestPartialInitializationAndRetry()
{
    boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    boundary.create = -7;
    assert(recorder.Init(info) == -7);
    assert(!recorder.IsSessionActive());
    assert(boundary.muxCloses == 1);
    assert(boundary.codecCloses == 1);
    boundary.create = 0;
    assert(recorder.Init(info) == 0);
    assert(recorder.StopEnd() == 0);
    assert(!recorder.IsSessionActive());
}
void TestStartFailure()
{
    boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    assert(recorder.Init(info) == 0);
    boundary.start = -11;
    assert(recorder.Start() == -11);
    assert(!recorder.IsSessionActive());
    assert(boundary.cleanup == std::vector<int>({1, 2}));
}
void TestStopAndImmediateReplay()
{
    boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    for (int session = 0; session < 3; ++session) {
        assert(recorder.Init(info) == 0);
        assert(recorder.Start() == 0);
        assert(recorder.StopStart() == 0);
        assert(recorder.StopEnd() == 0);
        assert(!recorder.IsSessionActive());
    }
    assert(boundary.muxCloses == 3);
    assert(boundary.codecCloses == 3);
}
void TestMissingEosAndReleaseFailure()
{
    for (bool eos : {false, true}) {
        boundary = {};
        boundary.eos = eos;
        boundary.release = eos ? -13 : 0;
        Recorder recorder;
        SampleInfo info;
        info.audio.enabled = false;
        assert(recorder.Init(info) == 0);
        assert(recorder.Start() == 0);
        assert(recorder.StopEnd() != 0);
        assert(!recorder.GetFailure().stage.empty());
        assert(!recorder.IsSessionActive());
    }
}
void TestSharedDrainDeadline()
{
    boundary = {};
    boundary.timeout = true;
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = true;
    assert(recorder.Init(info) == 0);
    assert(recorder.Start() == 0);
    const auto started = std::chrono::steady_clock::now();
    assert(recorder.StopEnd() != 0);
    const auto elapsed = std::chrono::steady_clock::now() - started;
    assert(elapsed >= std::chrono::seconds(5));
    assert(elapsed < std::chrono::milliseconds(6500));
    assert(!recorder.IsSessionActive());
}
}

// 编码器、封装器和相机由宿主替换，录制会话和收尾链接生产实现。
extern "C" {
int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...) { return 0; }
OH_AVFormat *OH_AVFormat_Create() { return nullptr; }
void OH_AVFormat_Destroy(OH_AVFormat *) {}
bool OH_AVFormat_GetIntValue(OH_AVFormat *, const char *, int32_t *) { return false; }
bool OH_AVFormat_GetLongValue(OH_AVFormat *, const char *, int64_t *) { return false; }
bool OH_AVFormat_GetDoubleValue(OH_AVFormat *, const char *, double *) { return false; }
void OH_NativeWindow_DestroyNativeWindow(OHNativeWindow *) {}
Image_ErrorCode OH_ImageNative_Release(OH_ImageNative *) { return IMAGE_SUCCESS; }
}
const char *OH_MD_KEY_WIDTH = "width";
const char *OH_MD_KEY_HEIGHT = "height";
const char *OH_MD_KEY_FRAME_RATE = "fps";
const char *OH_MD_KEY_BITRATE = "bitrate";
Muxer::~Muxer() = default;
int32_t Muxer::Create(int32_t, int32_t) { return boundary.create; }
int32_t Muxer::Config(SampleInfo &) { return 0; }
int32_t Muxer::Start() { return 0; }
int32_t Muxer::Release()
{
    boundary.cleanup.push_back(1);
    ++boundary.muxCloses;
    return boundary.release;
}
VideoEncoder::~VideoEncoder() = default;
int32_t VideoEncoder::Create(const std::string &) { return 0; }
int32_t VideoEncoder::CreateByName(const std::string &) { return 0; }
int32_t VideoEncoder::CreatePrimaryWithPreproc(const std::string &) { return 0; }
int32_t VideoEncoder::CreateSecondaryFromPrimary(VideoEncoder &) { return 0; }
int32_t VideoEncoder::Config(SampleInfo &, CodecUserData *, bool) { return 0; }
int32_t VideoEncoder::Start() { return boundary.start; }
int32_t VideoEncoder::NotifyEndOfStream() { return boundary.notify; }
OH_AVFormat *VideoEncoder::GetOutputDescription() { return nullptr; }
int32_t VideoEncoder::Release()
{
    boundary.cleanup.push_back(2);
    ++boundary.codecCloses;
    return 0;
}
AudioEncoder::~AudioEncoder() = default;
int32_t AudioEncoder::Start() { return 0; }
int32_t AudioEncoder::Release() { return 0; }
AudioCapturer::~AudioCapturer() = default;
bool AudioCapturer::AudioCapturerStart() { return true; }
void AudioCapturer::AudioCapturerRelease() {}
RecorderFrameReceiver::~RecorderFrameReceiver() = default;
bool RecorderFrameReceiver::Create(int32_t, int32_t) { return false; }
OH_ImageNative *RecorderFrameReceiver::ReadLatest(int32_t) { return nullptr; }
void RecorderFrameReceiver::CancelWait() {}
void Recorder::RefreshStreamStorage(bool, bool) {}
int32_t Recorder::CreateAudioEncoder()
{
    audioEncContext_ = std::make_unique<CodecUserData>();
    return 0;
}
int32_t AudioCapturer::AudioCapturerInit(const SampleInfo &, CodecUserData *) { return 0; }
int32_t Recorder::StartVideoInputThread() { return 0; }
int32_t Recorder::SendBufferVideoEndOfStream() { std::abort(); }
int32_t Recorder::SendAudioEndOfStreamSync() { return 0; }
int32_t Recorder::SendAudioEndOfStreamAsync() { return 0; }
void Recorder::AudioEncInputSyncThread() {}
void Recorder::AudioEncInputAsyncThread() {}
void Recorder::AudioEncOutputSyncThread() {}
void Recorder::AudioEncOutputAsyncThread() {}
void Recorder::VideoEncOutputAsyncThread()
{
    std::unique_lock<std::mutex> lock(outputDoneMutex_);
    outputDoneCond_.wait(lock, [this]() { return isStopping_.load() || !isStarted_.load(); });
    if (boundary.timeout) { return; }
    videoOutputEosReceived_ = boundary.eos;
    videoOutputDone_ = true;
    outputDoneCond_.notify_all();
}
void Recorder::VideoEncOutputSyncThread() { VideoEncOutputAsyncThread(); }
void Recorder::SecondaryVideoEncOutputAsyncThread() { std::abort(); }
void Recorder::SecondaryVideoEncOutputSyncThread() { std::abort(); }
int main()
{
    TestPartialInitializationAndRetry();
    TestStartFailure();
    TestStopAndImmediateReplay();
    TestMissingEosAndReleaseFailure();
    TestSharedDrainDeadline();
    std::cout << "Recorder production lifecycle integration passed" << std::endl;
}
