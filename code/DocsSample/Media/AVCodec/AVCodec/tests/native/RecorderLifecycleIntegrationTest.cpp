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
#include <iostream>
#include <map>
#include <vector>
#include "sample/recorder/core/Recorder.h"

struct OH_AVBuffer {};
struct OH_AVFormat {};
struct OH_ImageNative {};

namespace {
constexpr int CREATE_FAILURE = -7;
constexpr int START_FAILURE = -11;
constexpr int RELEASE_FAILURE = -13;
constexpr int REPLAY_COUNT = 3;
constexpr int MUXER_CLEANUP = 1;
constexpr int ENCODER_CLEANUP = 2;
constexpr int DRAIN_DEADLINE_SECONDS = 5;
constexpr int DRAIN_UPPER_BOUND_MS = 6500;
constexpr int32_t FRAME_BYTES = 32;
constexpr int64_t FRAME_PTS_US = 10000;
constexpr int32_t OUTPUT_POLL_MS = 20;
constexpr int32_t MOCK_SECONDARY_FD = 100;
constexpr int32_t INPUT_FAILURE = -17;
constexpr int32_t INPUT_WIDTH = 1280;
constexpr int32_t INPUT_HEIGHT = 720;
constexpr int64_t CAMERA_TIMESTAMP_NS = 1000000;
constexpr auto INPUT_TEST_TIMEOUT = std::chrono::seconds(2);

using TestSupport::Require;

struct Boundary {
    int create = 0;
    int start = 0;
    int notify = 0;
    int release = 0;
    int muxCloses = 0;
    int codecCloses = 0;
    bool eos = true;
    bool timeout = false;
    bool writeFails = false;
    bool freeFails = false;
    bool inputAcquireFails = false;
    bool inputPushFails = false;
    bool bufferInput = false;
    CodecUserData *video = nullptr;
    std::vector<int> cleanup;
} g_boundary;
std::map<const VideoEncoder *, CodecUserData *> g_videoContexts;
std::atomic<int32_t> g_videoFrees {0};
std::atomic<int32_t> g_videoWrites {0};
std::atomic<int32_t> g_eosFreeAttempts {0};
std::atomic<int32_t> g_inputEosAttempts {0};
std::atomic<int32_t> g_inputFrames {0};
std::mutex g_inputMutex;
std::condition_variable g_inputCond;
bool g_frameReady = false;
bool g_inputCancelled = false;
std::thread::id g_inputThread;
std::thread::id g_eosThread;
OH_AVBuffer g_inputBuffer;
OH_AVFormat g_inputFormat;
OH_ImageNative g_cameraImage;

void QueueInputBuffer(CodecUserData *context)
{
    auto input = std::make_shared<CodecBufferInfo>();
    input->buffer = &g_inputBuffer;
    context->inputBufferQueue.Enqueue(input);
}

void ResetBufferInput()
{
    g_boundary = {};
    g_inputEosAttempts = 0;
    g_inputFrames = 0;
    g_eosFreeAttempts = 0;
    g_videoWrites = 0;
    g_videoFrees = 0;
    std::lock_guard<std::mutex> lock(g_inputMutex);
    g_frameReady = false;
    g_inputCancelled = false;
    g_inputThread = {};
    g_eosThread = {};
}

void WaitForInputFrame()
{
    std::unique_lock<std::mutex> lock(g_inputMutex);
    Require(g_inputCond.wait_for(lock, INPUT_TEST_TIMEOUT, []() { return g_inputFrames.load() == 1; }),
        "Camera frame reaches the production input worker");
}

// 在同步、异步模式下检查普通帧、无图像和暂停停止；EOS必须由输入线程提交。
void TestBufferInputStop(bool synchronous, bool paused, bool withFrame)
{
    ResetBufferInput();
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    info.video.bufferInput = true;
    info.codec.codecSyncMode = synchronous;
    Require(recorder.Init(info) == 0 && recorder.Start() == 0, "Start Buffer input recording");
    if (withFrame) {
        {
            std::lock_guard<std::mutex> lock(g_inputMutex);
            g_frameReady = true;
        }
        g_inputCond.notify_all();
        WaitForInputFrame();
    }
    if (paused) {
        const int32_t ret = recorder.SetPaused(recorder.GetSessionReport().id, true);
        if (ret != 0) {
            const auto failure = recorder.GetFailure();
            std::cerr << "Pause failed: " << failure.stage << " " << failure.message << std::endl;
        }
        Require(ret == 0, "Pause Buffer input");
    }
    Require(recorder.StopStart() == 0 && recorder.StopEnd() == 0, "Input EOS drains before destruction");
    Require(g_inputEosAttempts == 1 && g_eosFreeAttempts == 0, "Submit EOS once and leave output EOS to Destroy");
    Require(g_eosThread != std::this_thread::get_id(), "The input worker submits EOS");
    Require(!withFrame || g_eosThread == g_inputThread, "Ordinary frames and EOS use the same input worker");
    Require(g_inputFrames == (withFrame ? 1 : 0) && g_videoWrites == g_inputFrames && g_videoFrees == g_inputFrames,
        "Ordinary video frames remain written and returned once");
    Require(!recorder.IsSessionActive(), "Buffer recording releases all workers");
}

// EOS取Buffer或提交失败时停止录制，不重发EOS，也不继续等待输出排空。
void TestBufferInputEosFailure(bool synchronous, bool acquireFails)
{
    ResetBufferInput();
    g_boundary.inputAcquireFails = acquireFails;
    g_boundary.inputPushFails = !acquireFails;
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    info.video.bufferInput = true;
    info.codec.codecSyncMode = synchronous;
    Require(recorder.Init(info) == 0 && recorder.Start() == 0, "Start Buffer EOS failure case");
    const int32_t expected = !synchronous && acquireFails ? AVCODEC_SAMPLE_ERR_ERROR : INPUT_FAILURE;
    Require(recorder.StopEnd() == expected, "EOS acquisition and submission failures reach the caller");
    Require(!recorder.IsSessionActive() && !recorder.GetFailure().stage.empty(), "EOS failure finishes cleanup");
    Require(g_inputEosAttempts == (acquireFails ? 0 : 1), "Failed EOS is not retried");
}

// codec错误直接结束输入，不走正常停止时的EOS提交分支。
void TestBufferInputAbort(bool synchronous)
{
    ResetBufferInput();
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    info.video.bufferInput = true;
    info.codec.codecSyncMode = synchronous;
    Require(recorder.Init(info) == 0 && recorder.Start() == 0, "Start Buffer abort case");
    g_boundary.video->hasError.store(true);
    Require(recorder.StopEnd() != 0 && !recorder.IsSessionActive(), "Callback failure releases Buffer recording");
    Require(g_inputEosAttempts == 0, "Aborted input does not submit EOS");
}
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
void TestStopAndImmediateReplay(bool synchronous, bool dual)
{
    g_boundary = {};
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    info.codec.codecSyncMode = synchronous;
    info.output.enableDualOutput = dual;
    info.output.secondaryOutputFd = MOCK_SECONDARY_FD;
    g_videoFrees = 0;
    g_videoWrites = 0;
    g_eosFreeAttempts = 0;
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
    const int32_t streamSessions = REPLAY_COUNT * (dual ? 2 : 1);
    Require(g_boundary.muxCloses == streamSessions && g_boundary.codecCloses == streamSessions,
        "Every primary and secondary codec is destroyed after its output thread ends");
    Require(g_videoFrees == streamSessions && g_videoWrites == streamSessions && g_eosFreeAttempts == 0,
        "Ordinary frames are written and returned once; EOS ends each worker without Free");
}

void TestVideoOutputFailure(bool freeFails)
{
    g_boundary = {};
    g_boundary.freeFails = freeFails;
    g_boundary.writeFails = !freeFails;
    Recorder recorder;
    SampleInfo info;
    info.audio.enabled = false;
    Require(recorder.Init(info) == 0 && recorder.Start() == 0, "Start recording for output failure");
    Require(recorder.StopEnd() != 0 && !recorder.GetFailure().stage.empty() && !recorder.IsSessionActive(),
        "Ordinary output write and return failures still fail finalization and release the session");
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
uint8_t *OH_AVBuffer_GetAddr(OH_AVBuffer *)
{
    return nullptr;
}
int32_t OH_AVBuffer_GetCapacity(OH_AVBuffer *)
{
    return FRAME_BYTES;
}
bool OH_AVFormat_GetIntValue(OH_AVFormat *format, const char *key, int32_t *value)
{
    if (format != &g_inputFormat) {
        return false;
    }
    if (key == OH_MD_KEY_VIDEO_STRIDE) {
        *value = INPUT_WIDTH;
    } else if (key == OH_MD_KEY_VIDEO_SLICE_HEIGHT) {
        *value = INPUT_HEIGHT;
    } else if (key == OH_MD_KEY_PIXEL_FORMAT) {
        *value = AV_PIXEL_FORMAT_NV12;
    } else {
        return false;
    }
    return true;
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
Image_ErrorCode OH_ImageNative_GetTimestamp(OH_ImageNative *, int64_t *timestamp)
{
    *timestamp = CAMERA_TIMESTAMP_NS;
    return IMAGE_SUCCESS;
}
}
const char *OH_MD_KEY_WIDTH = "width";
const char *OH_MD_KEY_HEIGHT = "height";
const char *OH_MD_KEY_FRAME_RATE = "fps";
const char *OH_MD_KEY_BITRATE = "bitrate";
const char *OH_MD_KEY_VIDEO_STRIDE = "stride";
const char *OH_MD_KEY_VIDEO_SLICE_HEIGHT = "sliceHeight";
const char *OH_MD_KEY_PIXEL_FORMAT = "pixelFormat";
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
int32_t Muxer::GetVideoTrackId()
{
    return 0;
}
int32_t Muxer::WriteSample(int32_t, OH_AVBuffer *, OH_AVCodecBufferAttr &attr)
{
    Require((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) == 0, "Recorder EOS bypasses ordinary muxer writes");
    ++g_videoWrites;
    return g_boundary.writeFails ? RELEASE_FAILURE : AVCODEC_SAMPLE_ERR_OK;
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
int32_t VideoEncoder::Config(SampleInfo &info, CodecUserData *context, bool)
{
    g_boundary.video = context;
    g_videoContexts[this] = context;
    g_boundary.bufferInput = info.video.bufferInput;
    context->inputWidthStride = INPUT_WIDTH;
    context->inputHeightStride = INPUT_HEIGHT;
    context->isEncFirstFrame = info.codec.codecSyncMode;
    return 0;
}
int32_t VideoEncoder::Start()
{
    if (g_boundary.bufferInput && !g_boundary.inputAcquireFails) {
        QueueInputBuffer(g_videoContexts.at(this));
    }
    return g_boundary.start;
}
int32_t VideoEncoder::GetInputBuffer(CodecBufferInfo &info, int64_t)
{
    info.buffer = &g_inputBuffer;
    return g_boundary.inputAcquireFails ? INPUT_FAILURE : AVCODEC_SAMPLE_ERR_OK;
}
OH_AVFormat *VideoEncoder::GetInputDescription()
{
    return &g_inputFormat;
}
int32_t VideoEncoder::PushInputBuffer(CodecBufferInfo &info)
{
    const bool eos = (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    {
        std::lock_guard<std::mutex> lock(g_inputMutex);
        if (eos) {
            ++g_inputEosAttempts;
            g_eosThread = std::this_thread::get_id();
            Require(info.attr.size == 0 && info.attr.offset == 0, "EOS input is empty");
        } else {
            ++g_inputFrames;
            g_inputThread = std::this_thread::get_id();
            Require(info.attr.size == FRAME_BYTES, "Camera image bytes reach the encoder");
        }
    }
    g_inputCond.notify_all();
    if (g_boundary.inputPushFails) {
        return INPUT_FAILURE;
    }
    g_videoContexts.at(this)->outputBufferQueue.Enqueue(std::make_shared<CodecBufferInfo>(info));
    if (!eos) {
        QueueInputBuffer(g_videoContexts.at(this));
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
int32_t VideoEncoder::NotifyEndOfStream()
{
    auto *context = g_videoContexts.at(this);
    if (g_boundary.timeout) {
        return g_boundary.notify;
    }
    if (!g_boundary.eos) {
        context->hasError = true;
        context->outputBufferQueue.CancelWait();
        return g_boundary.notify;
    }
    auto frame = std::make_shared<CodecBufferInfo>();
    frame->attr.size = FRAME_BYTES;
    frame->attr.pts = FRAME_PTS_US;
    context->outputBufferQueue.Enqueue(frame);
    auto output = std::make_shared<CodecBufferInfo>();
    output->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    context->outputBufferQueue.Enqueue(output);
    return g_boundary.notify;
}
int32_t VideoEncoder::GetOutputBuffer(CodecBufferInfo &info, int64_t)
{
    const auto output = g_videoContexts.at(this)->outputBufferQueue.Dequeue(OUTPUT_POLL_MS);
    if (output == nullptr) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    info = *output;
    return AVCODEC_SAMPLE_ERR_OK;
}
int32_t VideoEncoder::FreeOutputBuffer(const CodecBufferInfo &info)
{
    if (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        ++g_eosFreeAttempts;
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    ++g_videoFrees;
    return g_boundary.freeFails ? RELEASE_FAILURE : AVCODEC_SAMPLE_ERR_OK;
}
OH_AVFormat *VideoEncoder::GetOutputDescription()
{
    return nullptr;
}
int32_t VideoEncoder::Release()
{
    g_videoContexts.erase(this);
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
    return true;
}
OH_ImageNative *RecorderFrameReceiver::ReadLatest(int32_t timeoutMs)
{
    std::unique_lock<std::mutex> lock(g_inputMutex);
    g_inputCond.wait_for(lock, std::chrono::milliseconds(timeoutMs), []() {
        return g_frameReady || g_inputCancelled;
    });
    if (g_frameReady) {
        g_frameReady = false;
        return &g_cameraImage;
    }
    return nullptr;
}
void RecorderFrameReceiver::CancelWait()
{
    {
        std::lock_guard<std::mutex> lock(g_inputMutex);
        g_inputCancelled = true;
    }
    g_inputCond.notify_all();
    if (g_boundary.inputAcquireFails && g_boundary.video != nullptr) {
        g_boundary.video->inputBufferQueue.CancelWait();
    }
}
bool RecorderFrameReceiver::Copy(OH_ImageNative *, OH_AVBuffer *, int32_t, int32_t, int32_t &size) const
{
    size = FRAME_BYTES;
    return true;
}
int32_t Recorder::CreateAudioEncoder()
{
    audioEncContext_ = std::make_unique<CodecUserData>();
    return 0;
}
int32_t AudioCapturer::AudioCapturerInit(const SampleInfo &, CodecUserData *)
{
    return 0;
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
int main()
{
    TestPartialInitializationAndRetry();
    TestStartFailure();
    for (bool synchronous : {false, true}) {
        for (bool dual : {false, true}) {
            TestStopAndImmediateReplay(synchronous, dual);
        }
    }
    TestVideoOutputFailure(false);
    TestVideoOutputFailure(true);
    TestMissingEosAndReleaseFailure();
    TestSharedDrainDeadline();
    for (bool synchronous : {false, true}) {
        TestBufferInputStop(synchronous, false, true);
        TestBufferInputStop(synchronous, true, true);
        TestBufferInputStop(synchronous, false, false);
        TestBufferInputStop(synchronous, true, false);
        TestBufferInputEosFailure(synchronous, false);
        TestBufferInputEosFailure(synchronous, true);
        TestBufferInputAbort(synchronous);
    }
    std::cout << "Recorder production lifecycle integration passed" << std::endl;
}
