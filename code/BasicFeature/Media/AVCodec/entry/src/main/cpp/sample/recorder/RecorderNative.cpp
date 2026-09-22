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
constexpr size_t RECORDER_ARG_COUNT = 16;
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
constexpr size_t BITRATE_MODE_ARG = 10;
constexpr size_t I_FRAME_INTERVAL_ARG = 11;
constexpr size_t AUDIO_SAMPLE_RATE_ARG = 12;
constexpr size_t AUDIO_CHANNEL_COUNT_ARG = 13;
constexpr size_t AUDIO_BITRATE_ARG = 14;
constexpr size_t AUDIO_LATENCY_MODE_ARG = 15;
constexpr size_t VIDEO_MIME_LENGTH = 20;
constexpr int32_t AUDIO_SAMPLE_RATE = 48000;
constexpr int32_t AUDIO_CHANNEL_COUNT = 2;
constexpr int32_t AUDIO_BITRATE = 32000;
constexpr double AUDIO_FRAME_DURATION_SECONDS = 0.02;
}

struct AsyncCallbackInfo {
    // 该对象从创建异步任务起一直存活到完成回调；完成回调负责删除任务和对象本身。
    napi_env env = nullptr;
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int32_t resultCode = -1;
    std::string outputId = "";
    SampleInfo sampleInfo;
};

void DealCallBack(napi_env env, void *data)
{
    // 此回调运行在 JS 线程。NativeInit/NativeStop* 已结束后才能读取并销毁异步上下文。
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    if (asyncCallbackInfo == nullptr) {
        return;
    }
    napi_value code;
    napi_status status = napi_create_int32(env, asyncCallbackInfo->resultCode, &code);
    napi_value outputId;
    if (status == napi_ok) {
        status = napi_create_string_utf8(env, asyncCallbackInfo->outputId.data(), NAPI_AUTO_LENGTH, &outputId);
    }
    napi_value obj;
    if (status == napi_ok) {
        status = napi_create_object(env, &obj);
    }
    if (status == napi_ok) {
        status = napi_set_named_property(env, obj, "code", code);
    }
    if (status == napi_ok) {
        status = napi_set_named_property(env, obj, "outputId", outputId);
    }
    if (status == napi_ok) {
        (void)napi_resolve_deferred(asyncCallbackInfo->env, asyncCallbackInfo->deferred, obj);
    } else {
        // 构造 Response 失败时仍需结束 Promise，避免 ArkTS 一直等待异步任务。
        napi_value failure;
        if (napi_get_boolean(env, false, &failure) == napi_ok) {
            (void)napi_resolve_deferred(asyncCallbackInfo->env, asyncCallbackInfo->deferred, failure);
        }
    }
    // 异步工作项必须先于 AsyncCallbackInfo 释放，二者均不再被后续回调使用。
    if (asyncCallbackInfo->asyncWork != nullptr) {
        (void)napi_delete_async_work(env, asyncCallbackInfo->asyncWork);
    }
    delete asyncCallbackInfo;
}

void ResolveAsyncWorkFailure(napi_env env, AsyncCallbackInfo *asyncCallbackInfo)
{
    // 工作项未入队时不会再有完成回调，当前路径负责结束 Promise 并释放全部上下文。
    napi_value failure;
    if (napi_get_boolean(env, false, &failure) == napi_ok) {
        (void)napi_resolve_deferred(asyncCallbackInfo->env, asyncCallbackInfo->deferred, failure);
    }
    if (asyncCallbackInfo->asyncWork != nullptr) {
        (void)napi_delete_async_work(env, asyncCallbackInfo->asyncWork);
    }
    delete asyncCallbackInfo;
}

void SetCallBackResult(AsyncCallbackInfo *asyncCallbackInfo, int32_t code)
{
    asyncCallbackInfo->resultCode = code;
}

void OutputIdCallBack(AsyncCallbackInfo *asyncCallbackInfo, std::string outputId)
{
    asyncCallbackInfo->outputId = outputId;
}

void NativeInit(void *data)
{
    // 执行回调位于 NAPI 工作线程，不能直接操作 ArkTS 对象，只将结果写入异步上下文。
    auto *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    int32_t ret = Recorder::GetInstance().Init(asyncCallbackInfo->sampleInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Recorder::Init failed, ret: %{public}d", ret);
        SetCallBackResult(asyncCallbackInfo, ret);
        return;
    }

    uint64_t id = 0;
    ret = OH_NativeWindow_GetSurfaceId(asyncCallbackInfo->sampleInfo.video.window, &id);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Get encoder output id failed, ret: %{public}d, window: %{public}p", ret,
            asyncCallbackInfo->sampleInfo.video.window);
        // Init 已成功但无法把输出 Surface 交给 ArkTS 时，不能保留这次未启动会话的回调上下文。
        (void)Recorder::GetInstance().StopEnd();
        SetCallBackResult(asyncCallbackInfo, ret);
        return;
    }
    asyncCallbackInfo->outputId = std::to_string(id);
    OutputIdCallBack(asyncCallbackInfo, asyncCallbackInfo->outputId);
    SetCallBackResult(asyncCallbackInfo, AVCODEC_SAMPLE_ERR_OK);
}

static SampleInfo ParseSampleInfo(napi_env env, napi_value args[], size_t argc)
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
    if (argc > BITRATE_MODE_ARG) {
        int32_t bitrateMode = CBR;
        napi_get_value_int32(env, args[BITRATE_MODE_ARG], &bitrateMode);
        sampleInfo.video.bitrateMode = static_cast<uint32_t>(bitrateMode);
    }
    if (argc > I_FRAME_INTERVAL_ARG) {
        napi_get_value_int32(env, args[I_FRAME_INTERVAL_ARG], &sampleInfo.video.iFrameInterval);
    }
    if (argc > AUDIO_SAMPLE_RATE_ARG) {
        napi_get_value_int32(env, args[AUDIO_SAMPLE_RATE_ARG], &sampleInfo.audio.audioSampleRate);
    }
    if (argc > AUDIO_CHANNEL_COUNT_ARG) {
        napi_get_value_int32(env, args[AUDIO_CHANNEL_COUNT_ARG], &sampleInfo.audio.audioChannelCount);
    }
    if (argc > AUDIO_BITRATE_ARG) {
        napi_get_value_int64(env, args[AUDIO_BITRATE_ARG], &sampleInfo.audio.audioBitRate);
    }
    if (argc > AUDIO_LATENCY_MODE_ARG) {
        napi_get_value_int32(env, args[AUDIO_LATENCY_MODE_ARG], &sampleInfo.audio.audioLatencyMode);
    }

    sampleInfo.video.videoCodecMime = videoCodecMime;
    if (sampleInfo.video.isHDRVivid) {
        sampleInfo.video.hevcProfile = HEVC_PROFILE_MAIN_10;
    } else if (sampleInfo.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_AVC) {
        // 默认 AVC 录制流使用 Baseline Profile，兼容范围更广，且不会请求可选的 B 帧能力。
        sampleInfo.video.hevcProfile = AVC_PROFILE_BASELINE;
    }
    return sampleInfo;
}

static AsyncCallbackInfo* CreateAsyncInfo(napi_env env, napi_deferred deferred, SampleInfo sampleInfo)
{
    // 保存异步任务的输入和结果；正常完成时由完成回调释放该对象。
    auto *asyncInfo = new AsyncCallbackInfo();
    asyncInfo->env = env;
    asyncInfo->deferred = deferred;
    asyncInfo->sampleInfo = sampleInfo;
    asyncInfo->resultCode = -1;
    return asyncInfo;
}

static bool StartAsyncWork(napi_env env, AsyncCallbackInfo *asyncInfo, napi_async_execute_callback execute)
{
    // NAPI 将 asyncInfo 原样传给执行与完成回调，因此在任务结束前不得释放或复用该对象。
    napi_value resourceName;
    napi_status status = napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    if (status != napi_ok) {
        ResolveAsyncWorkFailure(env, asyncInfo);
        return false;
    }
    status = napi_create_async_work(env, nullptr, resourceName, execute,
        [](napi_env callbackEnv, napi_status callbackStatus, void *data) {
            auto *asyncInfo = static_cast<AsyncCallbackInfo *>(data);
            if (callbackStatus != napi_ok && asyncInfo != nullptr) {
                SetCallBackResult(asyncInfo, -1);
            }
            DealCallBack(callbackEnv, data);
        }, asyncInfo, &asyncInfo->asyncWork);
    if (status != napi_ok) {
        ResolveAsyncWorkFailure(env, asyncInfo);
        return false;
    }
    status = napi_queue_async_work(env, asyncInfo->asyncWork);
    if (status != napi_ok) {
        ResolveAsyncWorkFailure(env, asyncInfo);
        return false;
    }
    return true;
}

napi_value RecorderNative::Init(napi_env env, napi_callback_info info)
{
    size_t argc = RECORDER_ARG_COUNT;
    napi_value args[RECORDER_ARG_COUNT] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    // 只在 Native 边补齐未传入的音频默认值，界面显式传入的参数保持不变。
    SampleInfo sampleInfo = ParseSampleInfo(env, args, argc);

    sampleInfo.audio.audioCodecMime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    sampleInfo.audio.audioSampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
    sampleInfo.audio.audioSampleRate = sampleInfo.audio.audioSampleRate > 0 ?
        sampleInfo.audio.audioSampleRate : AUDIO_SAMPLE_RATE;
    sampleInfo.audio.audioChannelCount = sampleInfo.audio.audioChannelCount > 0 ?
        sampleInfo.audio.audioChannelCount : AUDIO_CHANNEL_COUNT;
    sampleInfo.audio.audioBitRate = sampleInfo.audio.audioBitRate > 0 ? sampleInfo.audio.audioBitRate : AUDIO_BITRATE;
    sampleInfo.audio.audioChannelLayout = sampleInfo.audio.audioChannelCount == 1 ?
        OH_AudioChannelLayout::CH_LAYOUT_MONO : OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    sampleInfo.audio.audioMaxInputSize = sampleInfo.audio.audioSampleRate * sampleInfo.audio.audioChannelCount *
        sizeof(short) * AUDIO_FRAME_DURATION_SECONDS;

    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    
    auto *asyncInfo = CreateAsyncInfo(env, deferred, sampleInfo);
    (void)StartAsyncWork(env, asyncInfo, [](napi_env, void *data) { NativeInit(data); });
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
    // 工作线程仅记录原生停止结果；Promise 的解析和对象销毁由完成回调处理。
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

    auto *asyncCallbackInfo = CreateAsyncInfo(env, deferred, SampleInfo());
    (void)StartAsyncWork(env, asyncCallbackInfo, [](napi_env, void *data) { NativeStopStart(data); });
    return promise;
}

napi_value RecorderNative::StopEnd(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    auto *asyncCallbackInfo = CreateAsyncInfo(env, deferred, SampleInfo());
    (void)StartAsyncWork(env, asyncCallbackInfo, [](napi_env, void *data) { NativeStopEnd(data); });
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
