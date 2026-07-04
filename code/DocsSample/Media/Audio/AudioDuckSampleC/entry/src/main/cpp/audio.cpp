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
#include "renderer/oh_audio_music_renderer.h"
#include "renderer/oh_audio_nav_renderer.h"
#include <uv.h>

constexpr size_t ARG_COUNT_INTERRUPT = 2;
constexpr size_t ARG_COUNT_RENDERER_PARAMS = 4;
constexpr size_t ARG_COUNT_LOAD_INFO = 4;
constexpr size_t CALLBACK_PARAM_COUNT = 2;
constexpr size_t NAPI_REF_COUNT = 2;
constexpr size_t INDEX_SAMPLING_RATE = 0;
constexpr size_t INDEX_CHANNEL_COUNT = 1;
constexpr size_t INDEX_SAMPLE_FORMAT = 2;
constexpr size_t INDEX_LOW_LATENCY_MODE = 3;
constexpr size_t INDEX_FD = 0;
constexpr size_t INDEX_FILE_SIZE = 1;
constexpr size_t INDEX_DURATION = 2;
constexpr size_t INDEX_FILE_OFFSET = 3;
constexpr size_t INDEX_CALLBACK_REF = 0;

struct InterruptCallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    int32_t forceType = 0;
    int32_t hintType = 0;
};

void InterruptCallback(void *asyncContext, OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
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
            napi_open_handle_scope(context->env, &scope);
            napi_value callback = nullptr;
            napi_value forceTypeValue;
            napi_value hintTypeValue;
            napi_create_int32(context->env, context->forceType, &forceTypeValue);
            napi_create_int32(context->env, context->hintType, &hintTypeValue);
            napi_value args[CALLBACK_PARAM_COUNT] = {forceTypeValue, hintTypeValue};
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            napi_call_function(context->env, nullptr, callback, CALLBACK_PARAM_COUNT, args, nullptr);
            napi_close_handle_scope(context->env, scope);
            delete work;
        });
}

static napi_value OnMusicInterrupt(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_INTERRUPT;
    napi_value args[ARG_COUNT_INTERRUPT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    auto asyncContext = new InterruptCallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[INDEX_CALLBACK_REF], NAPI_REF_COUNT, &asyncContext->callbackRef);
    OHAudioMusicRenderer::GetInstance().rendererInterruptCallback = &InterruptCallback;
    OHAudioMusicRenderer::GetInstance().rendererInterruptCallbackContext = asyncContext;
    return nullptr;
}

static napi_value OnNavInterrupt(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_INTERRUPT;
    napi_value args[ARG_COUNT_INTERRUPT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    auto asyncContext = new InterruptCallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[INDEX_CALLBACK_REF], NAPI_REF_COUNT, &asyncContext->callbackRef);
    OHAudioNavRenderer::GetInstance().rendererInterruptCallback = &InterruptCallback;
    OHAudioNavRenderer::GetInstance().rendererInterruptCallbackContext = asyncContext;
    return nullptr;
}

static napi_value MusicRendererInit(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().InitRenderer();
    return nullptr;
}

static napi_value MusicRendererStart(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().Start();
    return nullptr;
}

static napi_value MusicRendererPause(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().Pause();
    return nullptr;
}

static napi_value MusicRendererStop(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().Stop();
    return nullptr;
}

static napi_value MusicRendererRelease(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().Release();
    return nullptr;
}

static napi_value ResetMusicFileOffset(napi_env env, napi_callback_info info)
{
    OHAudioMusicRenderer::GetInstance().ResetFileOffset();
    return nullptr;
}

static napi_value NavRendererInit(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().InitRenderer();
    return nullptr;
}

static napi_value NavRendererInitWithDuckSession(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().InitRendererWithDuckSession();
    return nullptr;
}

static napi_value NavRendererStart(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().Start();
    return nullptr;
}

static napi_value NavRendererStop(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().Stop();
    return nullptr;
}

static napi_value NavRendererRelease(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().Release();
    return nullptr;
}

static napi_value ResetNavFileOffset(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().ResetFileOffset();
    return nullptr;
}

static napi_value FinishNavigationWithDuckSession(napi_env env, napi_callback_info info)
{
    OHAudioNavRenderer::GetInstance().FinishNavigationWithDuckSession();
    return nullptr;
}

static napi_value SetMusicRendererParams(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_RENDERER_PARAMS;
    napi_value args[ARG_COUNT_RENDERER_PARAMS];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < ARG_COUNT_RENDERER_PARAMS) { return nullptr; }
    uint32_t samplingRate = 0;
    uint32_t channelCount = 0;
    uint32_t sampleFormat = 0;
    bool isLowLatencyMode = false;
    napi_get_value_uint32(env, args[INDEX_SAMPLING_RATE], &samplingRate);
    napi_get_value_uint32(env, args[INDEX_CHANNEL_COUNT], &channelCount);
    napi_get_value_uint32(env, args[INDEX_SAMPLE_FORMAT], &sampleFormat);
    napi_get_value_bool(env, args[INDEX_LOW_LATENCY_MODE], &isLowLatencyMode);
    OHAudioMusicRenderer::GetInstance().SetRendererParams(
        samplingRate, channelCount, sampleFormat, isLowLatencyMode);
    return nullptr;
}

static napi_value SetNavRendererParams(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_RENDERER_PARAMS;
    napi_value args[ARG_COUNT_RENDERER_PARAMS];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < ARG_COUNT_RENDERER_PARAMS) { return nullptr; }
    uint32_t samplingRate = 0;
    uint32_t channelCount = 0;
    uint32_t sampleFormat = 0;
    bool isLowLatencyMode = false;
    napi_get_value_uint32(env, args[INDEX_SAMPLING_RATE], &samplingRate);
    napi_get_value_uint32(env, args[INDEX_CHANNEL_COUNT], &channelCount);
    napi_get_value_uint32(env, args[INDEX_SAMPLE_FORMAT], &sampleFormat);
    napi_get_value_bool(env, args[INDEX_LOW_LATENCY_MODE], &isLowLatencyMode);
    OHAudioNavRenderer::GetInstance().SetRendererParams(
        samplingRate, channelCount, sampleFormat, isLowLatencyMode);
    return nullptr;
}

static napi_value LoadMusicInfo(napi_env env, napi_callback_info info)
{
    size_t argCount = ARG_COUNT_LOAD_INFO;
    napi_value argValues[ARG_COUNT_LOAD_INFO] = {nullptr};
    napi_get_cb_info(env, info, &argCount, argValues, nullptr, nullptr);
    uint32_t recordingFd = 0;
    uint32_t recordingFileSize = 0;
    uint32_t recordingDuration = 0;
    uint32_t recordingFileOffset = 0;
    napi_get_value_uint32(env, argValues[INDEX_FD], &recordingFd);
    napi_get_value_uint32(env, argValues[INDEX_FILE_SIZE], &recordingFileSize);
    napi_get_value_uint32(env, argValues[INDEX_DURATION], &recordingDuration);
    napi_get_value_uint32(env, argValues[INDEX_FILE_OFFSET], &recordingFileOffset);
    OHAudioMusicRenderer::GetInstance().LoadMusicInfo(
        recordingFd, recordingFileSize, recordingDuration, recordingFileOffset);
    return nullptr;
}

static napi_value LoadNavInfo(napi_env env, napi_callback_info info)
{
    size_t argCount = ARG_COUNT_LOAD_INFO;
    napi_value argValues[ARG_COUNT_LOAD_INFO] = {nullptr};
    napi_get_cb_info(env, info, &argCount, argValues, nullptr, nullptr);
    uint32_t recordingFd = 0;
    uint32_t recordingFileSize = 0;
    uint32_t recordingDuration = 0;
    uint32_t recordingFileOffset = 0;
    napi_get_value_uint32(env, argValues[INDEX_FD], &recordingFd);
    napi_get_value_uint32(env, argValues[INDEX_FILE_SIZE], &recordingFileSize);
    napi_get_value_uint32(env, argValues[INDEX_DURATION], &recordingDuration);
    napi_get_value_uint32(env, argValues[INDEX_FILE_OFFSET], &recordingFileOffset);
    OHAudioNavRenderer::GetInstance().LoadNavInfo(
        recordingFd, recordingFileSize, recordingDuration, recordingFileOffset);
    return nullptr;
}

static napi_value GetMusicProgress(napi_env env, napi_callback_info info)
{
    int32_t progress = OHAudioMusicRenderer::GetInstance().GetProgress();
    napi_value napiProgress = nullptr;
    napi_create_int32(env, progress, &napiProgress);
    return napiProgress;
}

static napi_value GetNavProgress(napi_env env, napi_callback_info info)
{
    int32_t progress = OHAudioNavRenderer::GetInstance().GetProgress();
    napi_value napiProgress = nullptr;
    napi_create_int32(env, progress, &napiProgress);
    return napiProgress;
}

// Enable music MIX_WITH_OTHERS AudioSession (C++ OHAudio API)
static napi_value EnableMusicMixMode(napi_env env, napi_callback_info info)
{
    // This is handled in ArkTS layer via audio.AudioSessionManager for simplicity.
    // C++ implementation is documented in README for reference.
    return nullptr;
}

static napi_value DisableMusicMixMode(napi_env env, napi_callback_info info)
{
    // This is handled in ArkTS layer via audio.AudioSessionManager for simplicity.
    return nullptr;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"onMusicInterrupt", nullptr, OnMusicInterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"onNavInterrupt", nullptr, OnNavInterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setMusicRendererParams", nullptr, SetMusicRendererParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setNavRendererParams", nullptr, SetNavRendererParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"musicRendererInit", nullptr, MusicRendererInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"musicRendererStart", nullptr, MusicRendererStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"musicRendererPause", nullptr, MusicRendererPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"musicRendererStop", nullptr, MusicRendererStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"musicRendererRelease", nullptr, MusicRendererRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetMusicFileOffset", nullptr, ResetMusicFileOffset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"navRendererInit", nullptr, NavRendererInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"navRendererInitWithDuckSession", nullptr,
            NavRendererInitWithDuckSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"navRendererStart", nullptr, NavRendererStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"navRendererStop", nullptr, NavRendererStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"navRendererRelease", nullptr, NavRendererRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetNavFileOffset", nullptr, ResetNavFileOffset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finishNavigationWithDuckSession", nullptr,
            FinishNavigationWithDuckSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"loadMusicInfo", nullptr, LoadMusicInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"loadNavInfo", nullptr, LoadNavInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMusicProgress", nullptr, GetMusicProgress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNavProgress", nullptr, GetNavProgress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"enableMusicMixMode", nullptr, EnableMusicMixMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"disableMusicMixMode", nullptr, DisableMusicMixMode, nullptr, nullptr, nullptr, napi_default, nullptr},
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
