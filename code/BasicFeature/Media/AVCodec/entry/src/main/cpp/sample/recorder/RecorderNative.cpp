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

#include "RecorderNative.h"
#include <bits/alltypes.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "recorder"

namespace {
constexpr int32_t RGBA = 3;
constexpr size_t RECORDER_ARG_COUNT = 10;
constexpr size_t OUTPUT_FD_ARG = 0;
constexpr size_t VIDEO_MIME_ARG = 1;
constexpr size_t VIDEO_WIDTH_ARG = 2;
constexpr size_t VIDEO_HEIGHT_ARG = 3;
constexpr size_t FRAME_RATE_ARG = 4;
constexpr size_t HDR_VIVID_ARG = 5;
constexpr size_t BITRATE_ARG = 6;
constexpr size_t PIXEL_FORMAT_ARG = 7;
constexpr size_t SYNC_MODE_ARG = 8;
constexpr size_t OUTPUT_FORMAT_ARG = 9;
constexpr size_t VIDEO_MIME_LENGTH = 20;
constexpr int32_t AUDIO_SAMPLE_RATE = 48000;
constexpr int32_t AUDIO_CHANNEL_COUNT = 2;
constexpr int32_t AUDIO_BITRATE = 32000;
constexpr double AUDIO_FRAME_DURATION_SECONDS = 0.02;
}

struct AsyncCallbackInfo {
    napi_env env;
    napi_async_work asyncWork;
    napi_deferred deferred;
    int32_t resultCode = 0;
    std::string surfaceId = "";
    SampleInfo sampleInfo;
};

void DealCallBack(napi_env env, void *data)
{
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    napi_value code;
    napi_create_int32(env, asyncCallbackInfo->resultCode, &code);
    napi_value surfaceId;
    napi_create_string_utf8(env, asyncCallbackInfo->surfaceId.data(), NAPI_AUTO_LENGTH, &surfaceId);
    napi_value obj;
    napi_create_object(env, &obj);

    napi_set_named_property(env, obj, "code", code);
    napi_set_named_property(env, obj, "surfaceId", surfaceId);
    napi_resolve_deferred(asyncCallbackInfo->env, asyncCallbackInfo->deferred, obj);
    napi_delete_async_work(env, asyncCallbackInfo->asyncWork);
    delete asyncCallbackInfo;
}

void SetCallBackResult(AsyncCallbackInfo *asyncCallbackInfo, int32_t code)
{
    asyncCallbackInfo->resultCode = code;
}

void SurfaceIdCallBack(AsyncCallbackInfo *asyncCallbackInfo, std::string surfaceId)
{
    asyncCallbackInfo->surfaceId = surfaceId;
}

void NativeInit(void *data)
{
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    int32_t ret = Recorder::GetInstance().Init(asyncCallbackInfo->sampleInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        SetCallBackResult(asyncCallbackInfo, -1);
    }

    uint64_t id = 0;
    ret = OH_NativeWindow_GetSurfaceId(asyncCallbackInfo->sampleInfo.video.window, &id);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        SetCallBackResult(asyncCallbackInfo, -1);
    }
    asyncCallbackInfo->surfaceId = std::to_string(id);
    SurfaceIdCallBack(asyncCallbackInfo, asyncCallbackInfo->surfaceId);
}

static SampleInfo ParseSampleInfo(napi_env env, napi_value args[])
{
    SampleInfo sampleInfo;
    napi_get_value_int32(env, args[OUTPUT_FD_ARG], &sampleInfo.output.outputFd);
    char videoCodecMime[VIDEO_MIME_LENGTH] = { 0 };
    size_t videoCodecMimeLength = 0;
    napi_get_value_string_utf8(env, args[VIDEO_MIME_ARG], videoCodecMime,
        VIDEO_MIME_LENGTH, &videoCodecMimeLength);
    napi_get_value_int32(env, args[VIDEO_WIDTH_ARG], &sampleInfo.video.videoWidth);
    napi_get_value_int32(env, args[VIDEO_HEIGHT_ARG], &sampleInfo.video.videoHeight);
    napi_get_value_double(env, args[FRAME_RATE_ARG], &sampleInfo.video.frameRate);
    napi_get_value_int32(env, args[HDR_VIVID_ARG], &sampleInfo.video.isHDRVivid);
    napi_get_value_int64(env, args[BITRATE_ARG], &sampleInfo.video.bitrate);

    int32_t format;
    if (napi_ok == napi_get_value_int32(env, args[PIXEL_FORMAT_ARG], &format)) {
        sampleInfo.video.pixelFormat = (format == RGBA) ? AV_PIXEL_FORMAT_RGBA : AV_PIXEL_FORMAT_NV12;
    }

    napi_get_value_int32(env, args[SYNC_MODE_ARG], &sampleInfo.codec.codecSyncMode);
    napi_get_value_int32(env, args[OUTPUT_FORMAT_ARG], &sampleInfo.output.outputFormat);

    sampleInfo.video.videoCodecMime = videoCodecMime;
    if (sampleInfo.video.isHDRVivid) {
        sampleInfo.video.hevcProfile = HEVC_PROFILE_MAIN_10;
    }
    return sampleInfo;
}

static AsyncCallbackInfo* CreateAsyncInfo(napi_env env, napi_deferred deferred, SampleInfo sampleInfo)
{
    auto *asyncInfo = new AsyncCallbackInfo();
    asyncInfo->env = env;
    asyncInfo->deferred = deferred;
    asyncInfo->sampleInfo = sampleInfo;
    asyncInfo->resultCode = -1;
    return asyncInfo;
}

static void StartAsyncWork(napi_env env, AsyncCallbackInfo* asyncInfo)
{
    napi_value resourceName;
    napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName,
        [](napi_env, void *data) { NativeInit(data); },
        [](napi_env callbackEnv, napi_status, void *data) { DealCallBack(callbackEnv, data); },
        asyncInfo, &asyncInfo->asyncWork);
    napi_queue_async_work(env, asyncInfo->asyncWork);
}

napi_value RecorderNative::Init(napi_env env, napi_callback_info info)
{
    size_t argc = RECORDER_ARG_COUNT;
    napi_value args[RECORDER_ARG_COUNT] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    SampleInfo sampleInfo = ParseSampleInfo(env, args);

    sampleInfo.audio.audioCodecMime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    sampleInfo.audio.audioSampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
    sampleInfo.audio.audioSampleRate = AUDIO_SAMPLE_RATE;
    sampleInfo.audio.audioChannelCount = AUDIO_CHANNEL_COUNT;
    sampleInfo.audio.audioBitRate = AUDIO_BITRATE;
    sampleInfo.audio.audioChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    sampleInfo.audio.audioMaxInputSize = sampleInfo.audio.audioSampleRate * sampleInfo.audio.audioChannelCount *
        sizeof(short) * AUDIO_FRAME_DURATION_SECONDS;

    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    
    auto *asyncInfo = CreateAsyncInfo(env, deferred, sampleInfo);
    StartAsyncWork(env, asyncInfo);
    return promise;
}

napi_value RecorderNative::Start(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    Recorder::GetInstance().Start();
    return nullptr;
}

void NativeStopStart(void *data)
{
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    int32_t ret = Recorder::GetInstance().StopStart();
    SetCallBackResult(asyncCallbackInfo, ret == AVCODEC_SAMPLE_ERR_OK ? 0 : -1);
}

void NativeStopEnd(void *data)
{
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    int32_t ret = Recorder::GetInstance().StopEnd();
    SetCallBackResult(asyncCallbackInfo, ret == AVCODEC_SAMPLE_ERR_OK ? 0 : -1);
}

napi_value RecorderNative::StopStart(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    auto *asyncCallbackInfo = new AsyncCallbackInfo();

    asyncCallbackInfo->env = env;
    asyncCallbackInfo->asyncWork = nullptr;
    asyncCallbackInfo->deferred = deferred;

    napi_value resourceName;
    napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName, [](napi_env, void *data) { NativeStopStart(data); },
        [](napi_env callbackEnv, napi_status, void *data) { DealCallBack(callbackEnv, data); }, asyncCallbackInfo,
        &asyncCallbackInfo->asyncWork);
    napi_queue_async_work(env, asyncCallbackInfo->asyncWork);
    return promise;
}

napi_value RecorderNative::StopEnd(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    auto *asyncCallbackInfo = new AsyncCallbackInfo();

    asyncCallbackInfo->env = env;
    asyncCallbackInfo->asyncWork = nullptr;
    asyncCallbackInfo->deferred = deferred;

    napi_value resourceName;
    napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName, [](napi_env, void *data) { NativeStopEnd(data); },
        [](napi_env callbackEnv, napi_status, void *data) { DealCallBack(callbackEnv, data); }, asyncCallbackInfo,
        &asyncCallbackInfo->asyncWork);
    napi_queue_async_work(env, asyncCallbackInfo->asyncWork);
    return promise;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"initNative", nullptr, RecorderNative::Init, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startNative", nullptr, RecorderNative::Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopBeginNative", nullptr, RecorderNative::StopStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopEndNative", nullptr, RecorderNative::StopEnd, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_value RecorderNative = nullptr;
    const char *classBindName = "recorderNative";
    napi_define_class(env, classBindName, strlen(classBindName), nullptr, nullptr, 1, classProp, &RecorderNative);
    napi_define_properties(env, exports, sizeof(classProp) / sizeof(classProp[0]), classProp);
    return exports;
}
EXTERN_C_END

static napi_module RecorderModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "recorder",
    .nm_priv = ((void *)0),
    .reserved = {0},
};


extern "C" __attribute__((constructor)) void RegisterRecorderModule(void) { napi_module_register(&RecorderModule); }
