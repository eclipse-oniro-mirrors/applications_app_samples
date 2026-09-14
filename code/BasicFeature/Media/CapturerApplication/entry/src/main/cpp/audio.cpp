/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdint>
#include <cstdio>
#include <cstring>
#include "napi/native_api.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "OH_AUDIO_NAPI"

#include "renderer/oh_audio_renderer.h"
#include "capturer/oh_audio_capturer.h"
#include <uv.h>

constexpr uint32_t NAPI_REF_COUNT = 2;
constexpr size_t ARG_COUNT_CAPTURER_PARAMS = 5;
constexpr size_t ARG_COUNT_RENDERER_PARAMS = 4;
constexpr size_t ARG_COUNT_INTERRUPT_CALLBACK = 2;
constexpr size_t ARG_COUNT_CAPTURER_LOAD = 1;
constexpr size_t ARG_COUNT_RENDERER_LOAD = 4;
constexpr size_t CAPTURER_PARAM_INDEX_SOURCE_TYPE = 0;
constexpr size_t CAPTURER_PARAM_INDEX_SAMPLING_RATE = 1;
constexpr size_t CAPTURER_PARAM_INDEX_CHANNEL_COUNT = 2;
constexpr size_t CAPTURER_PARAM_INDEX_SAMPLE_FORMAT = 3;
constexpr size_t CAPTURER_PARAM_INDEX_LOW_LATENCY_MODE = 4;
constexpr size_t RENDERER_PARAM_INDEX_SAMPLING_RATE = 0;
constexpr size_t RENDERER_PARAM_INDEX_CHANNEL_COUNT = 1;
constexpr size_t RENDERER_PARAM_INDEX_SAMPLE_FORMAT = 2;
constexpr size_t RENDERER_PARAM_INDEX_LOW_LATENCY_MODE = 3;
constexpr size_t INTERRUPT_CALLBACK_ARG_INDEX_FUNC = 0;
constexpr size_t CAPTURER_LOAD_PARAM_INDEX_RECORDING_FD = 0;
constexpr size_t RENDERER_LOAD_PARAM_INDEX_RECORDING_FD = 0;
constexpr size_t RENDERER_LOAD_PARAM_INDEX_FILE_SIZE = 1;
constexpr size_t RENDERER_LOAD_PARAM_INDEX_DURATION = 2;
constexpr size_t RENDERER_LOAD_PARAM_INDEX_FILE_OFFSET = 3;

struct InterruptCallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    int32_t forceType = 0;
    int32_t hintType = 0;
};

void InterruptCallback(void *asyncContext, OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    uv_loop_s *loop = nullptr;
    InterruptCallbackContext *context = (InterruptCallbackContext *)asyncContext;
    napi_get_uv_event_loop(context->env, &loop);
    uv_work_t *work = new uv_work_t;
    context->forceType = type;
    context->hintType = hint;
    work->data = context;
    uv_queue_work(
        loop, work, [](uv_work_t *work) {},
        [](uv_work_t *work, int status) {
            InterruptCallbackContext *context = (InterruptCallbackContext *)work->data;
            napi_handle_scope scope = nullptr;
            // manage napi_value lifeCycle，avoid memory leaks.
            napi_open_handle_scope(context->env, &scope);
            napi_value callback = nullptr;
            napi_value forceTypeValue;
            napi_value hintTypeValue;
            napi_create_int32(context->env, context->forceType, &forceTypeValue);
            napi_create_int32(context->env, context->hintType, &hintTypeValue);
            napi_value args[2] = {forceTypeValue, hintTypeValue};
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            // callBack to UI side.
            napi_call_function(context->env, nullptr, callback, NAPI_REF_COUNT, args, nullptr);
            napi_close_handle_scope(context->env, scope);
            delete work;
        });
}

static napi_value OnRendererInterrupt(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_INTERRUPT_CALLBACK;
    napi_value args[ARG_COUNT_INTERRUPT_CALLBACK] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    auto asyncContext = new InterruptCallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[INTERRUPT_CALLBACK_ARG_INDEX_FUNC], NAPI_REF_COUNT, &asyncContext->callbackRef);
    OHAudioRenderer::GetInstance().rendererInterruptCallback = &InterruptCallback;
    OHAudioRenderer::GetInstance().rendererInterruptCallbackContext = asyncContext;
    return nullptr;
}

static napi_value OnCapturerInterrupt(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_INTERRUPT_CALLBACK;
    napi_value args[ARG_COUNT_INTERRUPT_CALLBACK] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    auto asyncContext = new InterruptCallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[INTERRUPT_CALLBACK_ARG_INDEX_FUNC], NAPI_REF_COUNT, &asyncContext->callbackRef);
    OHAudioCapturer::GetInstance().capturerInterruptCallback = &InterruptCallback;
    OHAudioCapturer::GetInstance().capturerInterruptCallbackContext = asyncContext;
    return nullptr;
}

static napi_value AudioCapturerInit(napi_env env, napi_callback_info info)
{
    OHAudioCapturer::GetInstance().Init();
    return nullptr;
}

static napi_value AudioCapturerStart(napi_env env, napi_callback_info info)
{
    OHAudioCapturer::GetInstance().Start();
    return nullptr;
}

static napi_value AudioCapturerPause(napi_env env, napi_callback_info info)
{
    OHAudioCapturer::GetInstance().Pause();
    return nullptr;
}

static napi_value AudioCapturerStop(napi_env env, napi_callback_info info)
{
    OHAudioCapturer::GetInstance().Stop();
    return nullptr;
}

static napi_value AudioCapturerRelease(napi_env env, napi_callback_info info)
{
    OHAudioCapturer::GetInstance().Release();
    return nullptr;
}

static napi_value SetCapturerParams(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_CAPTURER_PARAMS;
    napi_value args[ARG_COUNT_CAPTURER_PARAMS];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (argc < ARG_COUNT_CAPTURER_PARAMS) {
        return nullptr;
    }
    
    uint32_t sourceType = -1;
    uint32_t samplingRate = 0;
    uint32_t channelCount = 0;
    uint32_t sampleFormat = -1;
    bool isLowLatencyMode = false;
    
    napi_get_value_uint32(env, args[CAPTURER_PARAM_INDEX_SOURCE_TYPE], &sourceType);
    napi_get_value_uint32(env, args[CAPTURER_PARAM_INDEX_SAMPLING_RATE], &samplingRate);
    napi_get_value_uint32(env, args[CAPTURER_PARAM_INDEX_CHANNEL_COUNT], &channelCount);
    napi_get_value_uint32(env, args[CAPTURER_PARAM_INDEX_SAMPLE_FORMAT], &sampleFormat);
    napi_get_value_bool(env, args[CAPTURER_PARAM_INDEX_LOW_LATENCY_MODE], &isLowLatencyMode);
    
    if (sourceType >= 0 && samplingRate > 0 && channelCount > 0 && sampleFormat >= 0) {
        OHAudioCapturer::GetInstance().SetCapturerParams(sourceType, samplingRate,
            channelCount, sampleFormat, isLowLatencyMode);
    }
    OH_LOG_INFO(LOG_APP, "SetCapturerAudioParams success, samplingRate %{public}d, channelCount: %{public}d",
        samplingRate, channelCount);
    return nullptr;
}

static napi_value SetRendererParams(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_RENDERER_PARAMS;
    napi_value args[ARG_COUNT_RENDERER_PARAMS];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (argc < ARG_COUNT_RENDERER_PARAMS) {
        return nullptr;
    }
    
    uint32_t samplingRate = 0;
    uint32_t channelCount = 0;
    uint32_t sampleFormat = -1;
    bool isLowLatencyMode = false;
    
    napi_get_value_uint32(env, args[RENDERER_PARAM_INDEX_SAMPLING_RATE], &samplingRate);
    napi_get_value_uint32(env, args[RENDERER_PARAM_INDEX_CHANNEL_COUNT], &channelCount);
    napi_get_value_uint32(env, args[RENDERER_PARAM_INDEX_SAMPLE_FORMAT], &sampleFormat);
    napi_get_value_bool(env, args[RENDERER_PARAM_INDEX_LOW_LATENCY_MODE], &isLowLatencyMode);
    
    if (samplingRate > 0 && channelCount > 0 && sampleFormat >= 0) {
        OHAudioRenderer::GetInstance().SetRendererParams(samplingRate, channelCount, sampleFormat, isLowLatencyMode);
    }
    OH_LOG_INFO(LOG_APP,
        "SetRendererParams success, samplingRate %{public}d, channelCount: %{public}d, isLowLatencyMode: %{public}d",
        samplingRate, channelCount, isLowLatencyMode);
    return nullptr;
}

static napi_value AudioRendererInit(napi_env env, napi_callback_info info)
{
    OHAudioRenderer::GetInstance().InitRenderer();
    return nullptr;
}

static napi_value AudioRendererStart(napi_env env, napi_callback_info info)
{
    OHAudioRenderer::GetInstance().Start();
    return nullptr;
}

static napi_value AudioRendererPause(napi_env env, napi_callback_info info)
{
    OHAudioRenderer::GetInstance().Pause();
    return nullptr;
}

static napi_value AudioRendererStop(napi_env env, napi_callback_info info)
{
    OHAudioRenderer::GetInstance().Stop();
    return nullptr;
}

static napi_value AudioRendererRelease(napi_env env, napi_callback_info info)
{
    OHAudioRenderer::GetInstance().Release();
    return nullptr;
}

static napi_value LoadCapturerRecordingInfo(napi_env env, napi_callback_info info)
{
    size_t argCount = ARG_COUNT_CAPTURER_LOAD;
    napi_value argValues[ARG_COUNT_CAPTURER_LOAD] = {nullptr};
    napi_get_cb_info(env, info, &argCount, argValues, nullptr, nullptr);
    uint32_t recordingFd = -1;
    napi_get_value_uint32(env, argValues[CAPTURER_LOAD_PARAM_INDEX_RECORDING_FD], &recordingFd);
    
    OHAudioCapturer::GetInstance().LoadRecordingInfo(recordingFd);
    return nullptr;
}

static napi_value LoadRendererRecordingInfo(napi_env env, napi_callback_info info)
{
    size_t argCount = ARG_COUNT_RENDERER_LOAD;
    napi_value argValues[ARG_COUNT_RENDERER_LOAD] = {nullptr};
    napi_get_cb_info(env, info, &argCount, argValues, nullptr, nullptr);
    uint32_t recordingFd = -1;
    napi_get_value_uint32(env, argValues[RENDERER_LOAD_PARAM_INDEX_RECORDING_FD], &recordingFd);
    uint32_t recordingFileSize = 0;
    napi_get_value_uint32(env, argValues[RENDERER_LOAD_PARAM_INDEX_FILE_SIZE], &recordingFileSize);
    uint32_t recordingDuration = 0;
    napi_get_value_uint32(env, argValues[RENDERER_LOAD_PARAM_INDEX_DURATION], &recordingDuration);
    uint32_t recordingFileOffset = 0;
    napi_get_value_uint32(env, argValues[RENDERER_LOAD_PARAM_INDEX_FILE_OFFSET], &recordingFileOffset);
    OHAudioRenderer::GetInstance().LoadRecordingInfo(recordingFd, recordingFileSize,
        recordingDuration, recordingFileOffset);
    return nullptr;
}

static napi_value GetRendererProgress(napi_env env, napi_callback_info info)
{
    int32_t currentProgress = OHAudioRenderer::GetInstance().GetProgress();
    napi_value napiProgress = nullptr;
    napi_create_int32(env, currentProgress, &napiProgress);
    return napiProgress;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"onRendererInterrupt", nullptr, OnRendererInterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"onCapturerInterrupt", nullptr, OnCapturerInterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCapturerParams", nullptr, SetCapturerParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setRendererParams", nullptr, SetRendererParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerInit", nullptr, AudioCapturerInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerStart", nullptr, AudioCapturerStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerPause", nullptr, AudioCapturerPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerStop", nullptr, AudioCapturerStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerRelease", nullptr, AudioCapturerRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererInit", nullptr, AudioRendererInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererStart", nullptr, AudioRendererStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererPause", nullptr, AudioRendererPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererRelease", nullptr, AudioRendererRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererStop", nullptr, AudioRendererStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"loadCapturerRecordingInfo", nullptr, LoadCapturerRecordingInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"loadRendererRecordingInfo", nullptr, LoadRendererRecordingInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRendererProgress", nullptr, GetRendererProgress, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}