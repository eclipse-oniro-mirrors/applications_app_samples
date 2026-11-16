/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <cstddef>
#include <cstdint>
#include <cstring>
#include <string>
#include <mutex>
#include <map>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "ohaudio/native_audiocapturer.h"
#include "ohaudio/native_audiostreambuilder.h"
#include "ohaudio/native_audiostream_base.h"
#include "ohaudio/native_audio_common.h"

#define LOG_TAG "NR_CAPI"
#define GLOBAL_RES 0xFF00
#define MAX_STREAMS 10

// Default capturer parameters (avoid magic numbers, G.CNS.02)
constexpr int32_t DEFAULT_SOURCE_TYPE_LIVE = 17;
constexpr int32_t DEFAULT_SAMPLING_RATE = 44100;
constexpr int32_t DEFAULT_CHANNEL_COUNT = 2;
constexpr int32_t DEFAULT_SAMPLE_FORMAT_S16LE = 1;
constexpr int32_t INVALID_STREAM_ID = -1;
constexpr int32_t INITIAL_STREAM_ID = 1;
constexpr size_t ARG_COUNT_ZERO = 0;
constexpr size_t ARG_COUNT_ONE = 1;
constexpr size_t ARG_COUNT_TWO = 2;
constexpr size_t ARG_COUNT_THREE = 3;
constexpr size_t ARG_COUNT_FOUR = 4;
constexpr uint32_t MAX_MODES_COUNT = 20;
constexpr int32_t MODULE_VERSION_NUM = 1;

struct CapturerInfo {
    OH_AudioCapturer *capturer = nullptr;
    OH_AudioStreamBuilder *builder = nullptr;
    int32_t streamId = 0;
    int32_t sourceType = DEFAULT_SOURCE_TYPE_LIVE;
    int32_t samplingRate = DEFAULT_SAMPLING_RATE;
    int32_t channels = DEFAULT_CHANNEL_COUNT;
    bool callbackRegistered = false;
    std::string callbackLog = "No callback event";
};

static std::map<int32_t, CapturerInfo> g_streamMap;
static int32_t g_nextStreamId = INITIAL_STREAM_ID;
static std::mutex g_mapMutex;

static CapturerInfo *FindStream(int32_t streamId)
{
    auto it = g_streamMap.find(streamId);
    if (it != g_streamMap.end()) {
        return &it->second;
    }
    return nullptr;
}

static const char *GetModeName(OH_AudioNoiseReductionMode mode)
{
    switch (mode) {
        case AUDIO_NOISE_REDUCTION_MODE_FIDELITY:
            return "FIDELITY";
        case AUDIO_NOISE_REDUCTION_MODE_PURE_VOCALS:
            return "PURE_VOCALS";
        case AUDIO_NOISE_REDUCTION_MODE_STANDARD:
            return "STANDARD";
        default:
            return "UNKNOWN";
    }
}

static const char *GetReasonName(OH_Audio_NoiseReductionModeChangeReason reason)
{
    switch (reason) {
        case OH_AUDIO_NOISE_REDUCTION_MODE_CHANGE_REASON_USER_SETTING_BY_SYSTEM_RECORD_CONTROLLER:
            return "USER_SETTING";
        case OH_AUDIO_NOISE_REDUCTION_MODE_CHANGE_REASON_APP_SETTING:
            return "APP_SETTING";
        case OH_AUDIO_NOISE_REDUCTION_MODE_CHANGE_REASON_DEVICE_CHANGE:
            return "DEVICE_CHANGE";
        case OH_AUDIO_NOISE_REDUCTION_MODE_CHANGE_REASON_STREAM_CONCURRENCY:
            return "STREAM_CONCURRENCY";
        default:
            return "UNKNOWN";
    }
}

static void OnNoiseReductionModeChange(OH_AudioCapturer *capturer, void *userData,
    OH_Audio_NoiseReductionModeChangeInfo *changeInfo)
{
    if (changeInfo == nullptr || userData == nullptr) {
        return;
    }
    int32_t streamId = *static_cast<int32_t *>(userData);
    const char *reasonName = GetReasonName(changeInfo->reason);
    const char *modeName = GetModeName(changeInfo->noiseReductionMode);
    std::string log = std::string("reason=") + reasonName + " (" +
                      std::to_string(static_cast<int>(changeInfo->reason)) +
                      "), mode=" + modeName + " (" +
                      std::to_string(static_cast<int>(changeInfo->noiseReductionMode)) + ")";
    {
        std::lock_guard<std::mutex> lock(g_mapMutex);
        auto *info = FindStream(streamId);
        if (info != nullptr) {
            info->callbackLog = log;
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RES, LOG_TAG,
                 "Stream #%d Callback: %s", streamId, log.c_str());
}

// Parse NAPI arguments into capturer parameters.
static void ParseCapturerArgs(napi_env env, napi_callback_info info,
    int32_t &sourceTypeVal, int32_t &samplingRate, int32_t &channels, int32_t &sampleFormat)
{
    size_t argc = ARG_COUNT_FOUR;
    napi_value argv[ARG_COUNT_FOUR] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    sourceTypeVal = DEFAULT_SOURCE_TYPE_LIVE;
    samplingRate = DEFAULT_SAMPLING_RATE;
    channels = DEFAULT_CHANNEL_COUNT;
    sampleFormat = DEFAULT_SAMPLE_FORMAT_S16LE;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &sourceTypeVal);
    }
    if (argc > ARG_COUNT_ONE) {
        napi_get_value_int32(env, argv[ARG_COUNT_ONE], &samplingRate);
    }
    if (argc > ARG_COUNT_TWO) {
        napi_get_value_int32(env, argv[ARG_COUNT_TWO], &channels);
    }
    if (argc > ARG_COUNT_THREE) {
        napi_get_value_int32(env, argv[ARG_COUNT_THREE], &sampleFormat);
    }
}

// Build an OH_AudioCapturer from the given parameters. Returns true on success.
static bool BuildCapturer(int32_t sourceTypeVal, int32_t samplingRate, int32_t channels,
    int32_t sampleFormat, CapturerInfo &ci)
{
    OH_AudioStream_SourceType sourceType = static_cast<OH_AudioStream_SourceType>(sourceTypeVal);
    OH_AudioStream_SampleFormat format = static_cast<OH_AudioStream_SampleFormat>(sampleFormat);

    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&ci.builder, AUDIOSTREAM_TYPE_CAPTURER);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "Create builder failed: %d", result);
        return false;
    }

    result = OH_AudioStreamBuilder_SetCapturerInfo(ci.builder, sourceType);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "SetCapturerInfo failed: %d", result);
        OH_AudioStreamBuilder_Destroy(ci.builder);
        ci.builder = nullptr;
        return false;
    }

    OH_AudioStreamBuilder_SetSamplingRate(ci.builder, samplingRate);
    OH_AudioStreamBuilder_SetChannelCount(ci.builder, channels);
    OH_AudioStreamBuilder_SetSampleFormat(ci.builder, format);

    result = OH_AudioStreamBuilder_GenerateCapturer(ci.builder, &ci.capturer);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "GenerateCapturer failed: %d", result);
        OH_AudioStreamBuilder_Destroy(ci.builder);
        ci.builder = nullptr;
        return false;
    }

    OH_AudioStreamBuilder_Destroy(ci.builder);
    ci.builder = nullptr;
    return true;
}

static napi_value CreateCapturer(napi_env env, napi_callback_info info)
{
    int32_t sourceTypeVal = DEFAULT_SOURCE_TYPE_LIVE;
    int32_t samplingRate = DEFAULT_SAMPLING_RATE;
    int32_t channels = DEFAULT_CHANNEL_COUNT;
    int32_t sampleFormat = DEFAULT_SAMPLE_FORMAT_S16LE;
    ParseCapturerArgs(env, info, sourceTypeVal, samplingRate, channels, sampleFormat);

    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RES, LOG_TAG,
                 "CreateCapturer sourceType=%d rate=%d ch=%d fmt=%d",
                 sourceTypeVal, samplingRate, channels, sampleFormat);

    // Allocate streamId under lock to avoid race on size check and id increment.
    int32_t streamId = INVALID_STREAM_ID;
    {
        std::lock_guard<std::mutex> lock(g_mapMutex);
        if (g_streamMap.size() >= MAX_STREAMS) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "Max streams reached");
            napi_value ret = nullptr;
            napi_create_int32(env, INVALID_STREAM_ID, &ret);
            return ret;
        }
        streamId = g_nextStreamId++;
    }

    CapturerInfo ci;
    ci.streamId = streamId;
    ci.sourceType = sourceTypeVal;
    ci.samplingRate = samplingRate;
    ci.channels = channels;

    if (!BuildCapturer(sourceTypeVal, samplingRate, channels, sampleFormat, ci)) {
        napi_value ret = nullptr;
        napi_create_int32(env, INVALID_STREAM_ID, &ret);
        return ret;
    }
    ci.callbackLog = "Capturer created, no callback event yet";

    {
        std::lock_guard<std::mutex> lock(g_mapMutex);
        g_streamMap[streamId] = ci;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RES, LOG_TAG, "CreateCapturer Success streamId=%d", streamId);
    napi_value ret = nullptr;
    napi_create_int32(env, streamId, &ret);
    return ret;
}

static napi_value StartCapturer(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_Start(ci->capturer);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "Start #%d failed: %d", streamId, result);
        return ret;
    }
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value StopCapturer(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_Stop(ci->capturer);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "Stop #%d failed: %d", streamId, result);
        return ret;
    }
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value ReleaseCapturer(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    if (ci->callbackRegistered) {
        OH_AudioCapturer_UnregisterNoiseReductionModeChangeCallback(ci->capturer, nullptr);
        ci->callbackRegistered = false;
    }
    OH_AudioCapturer_Release(ci->capturer);
    ci->capturer = nullptr;
    g_streamMap.erase(streamId);

    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_RES, LOG_TAG, "Release #%d done", streamId);
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value GetSupportedModes(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value resultArray = nullptr;
    napi_create_array(env, &resultArray);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return resultArray;

    OH_AudioNoiseReductionMode modes[MAX_MODES_COUNT];
    uint32_t inSize = MAX_MODES_COUNT;
    uint32_t outSize = 0;
    OH_AudioStream_Result result = OH_AudioCapturer_GetSupportedNoiseReductionModes(
        ci->capturer, modes, inSize, &outSize);
    if (result != AUDIOSTREAM_SUCCESS) return resultArray;

    for (uint32_t i = 0; i < outSize; i++) {
        napi_value modeVal = nullptr;
        napi_create_int32(env, static_cast<int32_t>(modes[i]), &modeVal);
        napi_set_element(env, resultArray, i, modeVal);
    }
    return resultArray;
}

static napi_value GetCurrentMode(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_create_int32(env, -1, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    OH_AudioNoiseReductionMode mode;
    OH_AudioStream_Result result = OH_AudioCapturer_GetNoiseReductionMode(ci->capturer, &mode);
    if (result != AUDIOSTREAM_SUCCESS) return ret;

    napi_create_int32(env, static_cast<int32_t>(mode), &ret);
    return ret;
}

static napi_value SetMode(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_TWO;
    napi_value argv[ARG_COUNT_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    int32_t modeVal = 0;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }
    if (argc > ARG_COUNT_ONE) {
        napi_get_value_int32(env, argv[ARG_COUNT_ONE], &modeVal);
    }

    OH_AudioNoiseReductionMode mode = static_cast<OH_AudioNoiseReductionMode>(modeVal);
    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_SetNoiseReductionMode(ci->capturer, mode);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "SetMode #%d failed: %d", streamId, result);
        return ret;
    }
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value RegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;
    if (ci->callbackRegistered) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_RegisterNoiseReductionModeChangeCallback(
        ci->capturer, OnNoiseReductionModeChange, &ci->streamId);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, GLOBAL_RES, LOG_TAG, "RegisterCallback #%d failed: %d", streamId, result);
        return ret;
    }
    ci->callbackRegistered = true;
    ci->callbackLog = "Callback registered, waiting for events...";
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value UnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;
    if (!ci->callbackRegistered) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_UnregisterNoiseReductionModeChangeCallback(
        ci->capturer, OnNoiseReductionModeChange);
    if (result != AUDIOSTREAM_SUCCESS) return ret;
    ci->callbackRegistered = false;
    ci->callbackLog = "Callback unregistered";
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value UnregisterAllCallbacks(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    napi_value ret = nullptr;
    napi_get_boolean(env, false, &ret);

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    if (ci == nullptr || ci->capturer == nullptr) return ret;

    OH_AudioStream_Result result = OH_AudioCapturer_UnregisterNoiseReductionModeChangeCallback(
        ci->capturer, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) return ret;
    ci->callbackRegistered = false;
    ci->callbackLog = "All callbacks unregistered";
    napi_get_boolean(env, true, &ret);
    return ret;
}

static napi_value GetCallbackLog(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_ONE;
    napi_value argv[ARG_COUNT_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t streamId = -1;
    if (argc > ARG_COUNT_ZERO) {
        napi_get_value_int32(env, argv[ARG_COUNT_ZERO], &streamId);
    }

    std::lock_guard<std::mutex> lock(g_mapMutex);
    auto *ci = FindStream(streamId);
    std::string log = (ci != nullptr) ? ci->callbackLog : "Stream not found";
    napi_value ret = nullptr;
    napi_create_string_utf8(env, log.c_str(), log.length(), &ret);
    return ret;
}

static napi_value GetStreamCount(napi_env env, napi_callback_info info)
{
    std::lock_guard<std::mutex> lock(g_mapMutex);
    napi_value ret = nullptr;
    napi_create_int32(env, static_cast<int32_t>(g_streamMap.size()), &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createCapturer", nullptr, CreateCapturer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startCapturer", nullptr, StartCapturer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopCapturer", nullptr, StopCapturer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseCapturer", nullptr, ReleaseCapturer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSupportedModes", nullptr, GetSupportedModes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCurrentMode", nullptr, GetCurrentMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setMode", nullptr, SetMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCallback", nullptr, RegisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unregisterCallback", nullptr, UnregisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unregisterAllCallbacks", nullptr, UnregisterAllCallbacks, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCallbackLog", nullptr, GetCallbackLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getStreamCount", nullptr, GetStreamCount, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module noiseReductionModule = {
    .nm_version = MODULE_VERSION_NUM,
    .nm_flags = MODULE_VERSION_NUM,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterNoiseReductionModule(void)
{
    napi_module_register(&noiseReductionModule);
}
