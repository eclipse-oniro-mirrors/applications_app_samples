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
#include "../../entry/src/main/cpp/capabilities/include/audio_capturer.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

struct OH_AudioStreamBuilderStruct {};
struct OH_AudioCapturerStruct {};

namespace {
enum class Failure { NONE, CREATE, CONFIGURE, GENERATE };
constexpr int32_t CAPTURE_SESSION_COUNT = 2;
OH_AudioStreamBuilder g_builder;
OH_AudioCapturer g_capturer;
Failure g_failure = Failure::NONE;
int32_t g_generates = 0;
int32_t g_builderDestroys = 0;
int32_t g_capturerReleases = 0;
OH_AudioCapturer_Callbacks g_registeredCallbacks {};
void *g_registeredContext = nullptr;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestInitializationFailure(Failure stage)
{
    g_failure = stage;
    g_generates = 0;
    g_builderDestroys = 0;
    g_capturerReleases = 0;
    AudioCapturer wrapper;
    SampleInfo sample;
    CodecUserData context;
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_ERROR,
        "Initialization failure propagates immediately");
    Require(g_builderDestroys == 1 &&
        g_capturerReleases == (stage == Failure::GENERATE ? 1 : 0), "Partially created resources are released");
    Require(g_generates == (stage == Failure::GENERATE ? 1 : 0), "Failed configuration never generates a capturer");
    Require(!wrapper.AudioCapturerStart(), "Failed initialization cannot start capture");
    wrapper.AudioCapturerRelease();
    Require(g_builderDestroys == 1, "Cleanup after failure is idempotent");
}

void TestCaptureAndReuse()
{
    g_failure = Failure::NONE;
    g_builderDestroys = 0;
    g_capturerReleases = 0;
    AudioCapturer wrapper;
    SampleInfo sample;
    CodecUserData context;
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
        g_registeredContext == &context && g_registeredCallbacks.OH_AudioCapturer_OnReadData != nullptr,
        "Successful initialization binds the session context");
    Require(wrapper.AudioCapturerStart(), "A generated capturer starts");
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
        g_builderDestroys == 1 && g_capturerReleases == 1, "Reinitialization releases the previous capture session");
    wrapper.AudioCapturerRelease();
    Require(g_builderDestroys == CAPTURE_SESSION_COUNT && g_capturerReleases == CAPTURE_SESSION_COUNT,
        "Each generated capture session is released once");
}
} // namespace

extern "C" OH_AudioStream_Result FakeAudioStreamBuilderCreate(OH_AudioStreamBuilder **value, OH_AudioStream_Type)
    __asm__("OH_AudioStreamBuilder_Create");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderCreate(OH_AudioStreamBuilder **value, OH_AudioStream_Type)
{
    *value = &g_builder;
    return g_failure == Failure::CREATE ? AUDIOSTREAM_ERROR_SYSTEM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderDestroy(OH_AudioStreamBuilder *)
    __asm__("OH_AudioStreamBuilder_Destroy");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderDestroy(OH_AudioStreamBuilder *)
{
    ++g_builderDestroys;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetSamplingRate(OH_AudioStreamBuilder *, int32_t)
    __asm__("OH_AudioStreamBuilder_SetSamplingRate");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetSamplingRate(OH_AudioStreamBuilder *, int32_t)
{
    return g_failure == Failure::CONFIGURE ? AUDIOSTREAM_ERROR_INVALID_PARAM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetChannelCount(OH_AudioStreamBuilder *, int32_t)
    __asm__("OH_AudioStreamBuilder_SetChannelCount");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetChannelCount(OH_AudioStreamBuilder *, int32_t)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetSampleFormat(OH_AudioStreamBuilder *,
    OH_AudioStream_SampleFormat)
    __asm__("OH_AudioStreamBuilder_SetSampleFormat");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetSampleFormat(OH_AudioStreamBuilder *,
    OH_AudioStream_SampleFormat)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetLatencyMode(OH_AudioStreamBuilder *,
    OH_AudioStream_LatencyMode)
    __asm__("OH_AudioStreamBuilder_SetLatencyMode");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetLatencyMode(OH_AudioStreamBuilder *,
    OH_AudioStream_LatencyMode)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetEncodingType(OH_AudioStreamBuilder *,
    OH_AudioStream_EncodingType)
    __asm__("OH_AudioStreamBuilder_SetEncodingType");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetEncodingType(OH_AudioStreamBuilder *,
    OH_AudioStream_EncodingType)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetCapturerCallback(OH_AudioStreamBuilder *,
    OH_AudioCapturer_Callbacks callbacks, void *userData)
    __asm__("OH_AudioStreamBuilder_SetCapturerCallback");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderSetCapturerCallback(OH_AudioStreamBuilder *,
    OH_AudioCapturer_Callbacks callbacks, void *userData)
{
    g_registeredCallbacks = callbacks;
    g_registeredContext = userData;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderGenerateCapturer(OH_AudioStreamBuilder *,
    OH_AudioCapturer **value)
    __asm__("OH_AudioStreamBuilder_GenerateCapturer");
extern "C" OH_AudioStream_Result FakeAudioStreamBuilderGenerateCapturer(OH_AudioStreamBuilder *,
    OH_AudioCapturer **value)
{
    ++g_generates;
    *value = &g_capturer;
    return g_failure == Failure::GENERATE ? AUDIOSTREAM_ERROR_SYSTEM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioCapturerStart(OH_AudioCapturer *)
    __asm__("OH_AudioCapturer_Start");
extern "C" OH_AudioStream_Result FakeAudioCapturerStart(OH_AudioCapturer *)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioCapturerStop(OH_AudioCapturer *)
    __asm__("OH_AudioCapturer_Stop");
extern "C" OH_AudioStream_Result FakeAudioCapturerStop(OH_AudioCapturer *)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result FakeAudioCapturerRelease(OH_AudioCapturer *)
    __asm__("OH_AudioCapturer_Release");
extern "C" OH_AudioStream_Result FakeAudioCapturerRelease(OH_AudioCapturer *)
{
    ++g_capturerReleases;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
    __asm__("OH_LOG_Print");
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}

int main()
{
    TestInitializationFailure(Failure::CREATE);
    TestInitializationFailure(Failure::CONFIGURE);
    TestInitializationFailure(Failure::GENERATE);
    TestCaptureAndReuse();
    std::cout << "Audio capture: initialization failures, partial cleanup and reuse passed\n";
}
