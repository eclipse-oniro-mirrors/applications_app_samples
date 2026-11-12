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
OH_AudioStreamBuilder builder;
OH_AudioCapturer capturer;
Failure failure = Failure::NONE;
int32_t generates = 0;
int32_t builderDestroys = 0;
int32_t capturerReleases = 0;
OH_AudioCapturer_Callbacks registeredCallbacks {};
void *registeredContext = nullptr;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestInitializationFailure(Failure stage)
{
    failure = stage;
    generates = 0;
    builderDestroys = 0;
    capturerReleases = 0;
    AudioCapturer wrapper;
    SampleInfo sample;
    CodecUserData context;
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_ERROR,
        "Initialization failure propagates immediately");
    Require(builderDestroys == 1 &&
        capturerReleases == (stage == Failure::GENERATE ? 1 : 0), "Partially created resources are released");
    Require(generates == (stage == Failure::GENERATE ? 1 : 0), "Failed configuration never generates a capturer");
    Require(!wrapper.AudioCapturerStart(), "Failed initialization cannot start capture");
    wrapper.AudioCapturerRelease();
    Require(builderDestroys == 1, "Cleanup after failure is idempotent");
}

void TestCaptureAndReuse()
{
    failure = Failure::NONE;
    builderDestroys = 0;
    capturerReleases = 0;
    AudioCapturer wrapper;
    SampleInfo sample;
    CodecUserData context;
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
        registeredContext == &context && registeredCallbacks.OH_AudioCapturer_OnReadData != nullptr,
        "Successful initialization binds the session context");
    Require(wrapper.AudioCapturerStart(), "A generated capturer starts");
    Require(wrapper.AudioCapturerInit(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
        builderDestroys == 1 && capturerReleases == 1, "Reinitialization releases the previous capture session");
    wrapper.AudioCapturerRelease();
    Require(builderDestroys == CAPTURE_SESSION_COUNT && capturerReleases == CAPTURE_SESSION_COUNT,
        "Each generated capture session is released once");
}
} // namespace

extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_Create(OH_AudioStreamBuilder **value, OH_AudioStream_Type)
{
    *value = &builder;
    return failure == Failure::CREATE ? AUDIOSTREAM_ERROR_SYSTEM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_Destroy(OH_AudioStreamBuilder *)
{
    ++builderDestroys;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetSamplingRate(OH_AudioStreamBuilder *, int32_t)
{
    return failure == Failure::CONFIGURE ? AUDIOSTREAM_ERROR_INVALID_PARAM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetChannelCount(OH_AudioStreamBuilder *, int32_t)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetSampleFormat(OH_AudioStreamBuilder *,
    OH_AudioStream_SampleFormat)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetLatencyMode(OH_AudioStreamBuilder *,
    OH_AudioStream_LatencyMode)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetEncodingType(OH_AudioStreamBuilder *,
    OH_AudioStream_EncodingType)
{
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetCapturerCallback(OH_AudioStreamBuilder *,
    OH_AudioCapturer_Callbacks callbacks, void *userData)
{
    registeredCallbacks = callbacks;
    registeredContext = userData;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_GenerateCapturer(OH_AudioStreamBuilder *,
    OH_AudioCapturer **value)
{
    ++generates;
    *value = &capturer;
    return failure == Failure::GENERATE ? AUDIOSTREAM_ERROR_SYSTEM : AUDIOSTREAM_SUCCESS;
}
extern "C" OH_AudioStream_Result OH_AudioCapturer_Start(OH_AudioCapturer *) { return AUDIOSTREAM_SUCCESS; }
extern "C" OH_AudioStream_Result OH_AudioCapturer_Stop(OH_AudioCapturer *) { return AUDIOSTREAM_SUCCESS; }
extern "C" OH_AudioStream_Result OH_AudioCapturer_Release(OH_AudioCapturer *)
{
    ++capturerReleases;
    return AUDIOSTREAM_SUCCESS;
}
extern "C" int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...) { return 0; }

int main()
{
    TestInitializationFailure(Failure::CREATE);
    TestInitializationFailure(Failure::CONFIGURE);
    TestInitializationFailure(Failure::GENERATE);
    TestCaptureAndReuse();
    std::cout << "Audio capture: initialization failures, partial cleanup and reuse passed\n";
}
