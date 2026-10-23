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
#include "RecorderOptionsParser.h"
#include <bits/alltypes.h>
#include <cmath>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "recorder"

namespace {

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
    std::string sessionId;
    bool primary = true;
    bool requestKeyFrame = false;
    int64_t bitrate = 0;
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
    size_t argc = 1;
    napi_value options = nullptr;
    SampleInfo sampleInfo;
    if (napi_get_cb_info(env, info, &argc, &options, nullptr, nullptr) != napi_ok || argc != 1) {
        napi_throw_type_error(env, nullptr, "Recorder options are required");
        return nullptr;
    }
    if (!ParseRecorderOptions(env, options, sampleInfo)) {
        return nullptr;
    }

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

napi_value RecorderNative::UpdateParameters(napi_env env, napi_callback_info info)
{
    constexpr size_t PARAMETER_COUNT = 4;
    size_t count = PARAMETER_COUNT;
    napi_value args[PARAMETER_COUNT] = {};
    char session[128] = {};
    size_t length = 0;
    bool primary = true;
    bool keyFrame = false;
    double bitrate = 0;
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != PARAMETER_COUNT ||
        napi_get_value_string_utf8(env, args[0], session, sizeof(session), &length) != napi_ok ||
        length == 0 || length >= sizeof(session) - 1 ||
        napi_get_value_bool(env, args[1], &primary) != napi_ok ||
        napi_get_value_double(env, args[2], &bitrate) != napi_ok || !std::isfinite(bitrate) ||
        std::trunc(bitrate) != bitrate || bitrate < 0 || bitrate > 100000000 ||
        napi_get_value_bool(env, args[3], &keyFrame) != napi_ok || (bitrate == 0 && !keyFrame)) {
        napi_throw_type_error(env, nullptr, "Expected sessionId, primary, bitrate and requestKeyFrame");
        return nullptr;
    }
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return nullptr;
    }
    auto *task = CreateAsyncInfo(env, deferred, SampleInfo());
    task->sessionId.assign(session, length);
    task->primary = primary;
    task->bitrate = static_cast<int64_t>(bitrate);
    task->requestKeyFrame = keyFrame;
    (void)StartAsyncWork(env, task, [](napi_env, void *data) {
        auto *task = static_cast<AsyncCallbackInfo *>(data);
        task->resultCode = Recorder::GetInstance().UpdateVideoParameters(
            task->sessionId, task->primary, task->bitrate, task->requestKeyFrame);
    });
    return promise;
}

napi_value RecorderNative::MarkStage(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 3;
    size_t count = ARG_COUNT;
    napi_value args[ARG_COUNT] = {};
    char values[ARG_COUNT][129] = {};
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != ARG_COUNT) {
        napi_throw_type_error(env, nullptr, "Expected sessionId, stage, result");
        return nullptr;
    }
    for (size_t i = 0; i < ARG_COUNT; ++i) {
        size_t length = 0;
        if (napi_get_value_string_utf8(env, args[i], values[i], sizeof(values[i]), &length) != napi_ok ||
            length >= sizeof(values[i]) - 1) {
            napi_throw_type_error(env, nullptr, "Invalid stage string");
            return nullptr;
        }
    }
    Recorder::GetInstance().MarkStage(values[0], values[1], values[2]);
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

napi_value RecorderNative::Start(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_get_boolean(env, Recorder::GetInstance().Start() == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
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

namespace {
bool SetStatNumber(napi_env env, napi_value object, const char *key, double number)
{
    napi_value property = nullptr;
    return napi_create_double(env, number, &property) == napi_ok &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetReportString(napi_env env, napi_value object, const char *key, const std::string &text)
{
    napi_value property = nullptr;
    return napi_create_string_utf8(env, text.c_str(), text.size(), &property) == napi_ok &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetTiming(napi_env env, napi_value object, const char *key, const StageTimingInfo &timing)
{
    napi_value details = nullptr;
    return napi_create_object(env, &details) == napi_ok &&
        SetStatNumber(env, details, "count", timing.count) &&
        SetStatNumber(env, details, "averageMs", timing.averageMs) &&
        SetStatNumber(env, details, "p95Ms", timing.p95Ms) &&
        SetStatNumber(env, details, "maximumMs", timing.maximumMs) &&
        napi_set_named_property(env, object, key, details) == napi_ok;
}

bool SetAudioStats(napi_env env, napi_value object, const RecorderAudioInfo &stats)
{
    napi_value audio = nullptr;
    return napi_create_object(env, &audio) == napi_ok &&
        SetStatNumber(env, audio, "capturedFrames", stats.capturedFrames) &&
        SetStatNumber(env, audio, "pendingPcmMs", stats.pendingPcmMs) &&
        SetStatNumber(env, audio, "outputFrames", stats.outputFrames) &&
        SetStatNumber(env, audio, "outputBytes", stats.outputBytes) &&
        SetStatNumber(env, audio, "recentBitrate", stats.recentBitrate) &&
        SetStatNumber(env, audio, "outputIdleMs", stats.outputIdleMs) &&
        SetStatNumber(env, audio, "firstPtsUs", stats.firstPtsUs) &&
        SetStatNumber(env, audio, "lastPtsUs", stats.lastPtsUs) &&
        SetStatNumber(env, audio, "primaryFirstPtsUs", stats.primaryFirstPtsUs) &&
        SetStatNumber(env, audio, "primaryLastPtsUs", stats.primaryLastPtsUs) &&
        SetStatNumber(env, audio, "secondaryFirstPtsUs", stats.secondaryFirstPtsUs) &&
        SetStatNumber(env, audio, "secondaryLastPtsUs", stats.secondaryLastPtsUs) &&
        SetStatNumber(env, audio, "primaryWriteFailures", stats.primaryWriteFailures) &&
        SetStatNumber(env, audio, "secondaryWriteFailures", stats.secondaryWriteFailures) &&
        SetTiming(env, audio, "primaryMuxer", stats.primaryMuxer) &&
        SetTiming(env, audio, "secondaryMuxer", stats.secondaryMuxer) &&
        napi_set_named_property(env, object, "audio", audio) == napi_ok;
}

bool SetStreamStats(napi_env env, napi_value object, const char *key, const RecorderStreamInfo &stats)
{
    napi_value stream = nullptr;
    return napi_create_object(env, &stream) == napi_ok &&
        SetStatNumber(env, stream, "width", stats.width) &&
        SetStatNumber(env, stream, "height", stats.height) &&
        SetStatNumber(env, stream, "frames", static_cast<double>(stats.frames)) &&
        SetStatNumber(env, stream, "bytes", static_cast<double>(stats.bytes)) &&
        SetStatNumber(env, stream, "framesPerSecond", stats.framesPerSecond) &&
        SetStatNumber(env, stream, "bitrate", stats.bitrate) &&
        SetStatNumber(env, stream, "recentBitrate", stats.live.recentBitrate) &&
        SetStatNumber(env, stream, "recentFps", stats.live.recentFps) &&
        SetStatNumber(env, stream, "expectedFps", stats.live.expectedFps) &&
        SetStatNumber(env, stream, "targetBitrate", stats.live.targetBitrate) &&
        SetStatNumber(env, stream, "outputIdleMs", stats.live.outputIdleMs) &&
        SetStatNumber(env, stream, "longestGapMs", stats.live.longestGapMs) &&
        SetStatNumber(env, stream, "keyFrames", stats.live.keyFrames) &&
        SetStatNumber(env, stream, "lastKeyFramePtsUs", stats.live.lastKeyFramePtsUs) &&
        SetStatNumber(env, stream, "keyFrameIntervalMs", stats.live.keyFrameIntervalMs) &&
        SetStatNumber(env, stream, "keyFrameWaitMs", stats.live.keyFrameWaitMs) &&
        SetStatNumber(env, stream, "keyFrameRequests", stats.live.keyFrameRequests) &&
        SetStatNumber(env, stream, "parameterAccepted", stats.live.parameterAccepted) &&
        SetStatNumber(env, stream, "parameterRejected", stats.live.parameterRejected) &&
        SetStatNumber(env, stream, "ptsRegressions", stats.live.ptsRegressions) &&
        SetStatNumber(env, stream, "queueDepth", stats.queueDepth) &&
        SetStatNumber(env, stream, "queuePeak", stats.queuePeak) &&
        SetStatNumber(env, stream, "codecWidth", stats.codecWidth) &&
        SetStatNumber(env, stream, "codecHeight", stats.codecHeight) &&
        SetStatNumber(env, stream, "codecFps", stats.codecFps) &&
        SetStatNumber(env, stream, "codecBitrate", stats.codecBitrate) &&
        SetStatNumber(env, stream, "fileBytes", stats.fileBytes) &&
        SetStatNumber(env, stream, "freeBytes", stats.freeBytes) &&
        SetStatNumber(env, stream, "fileBytesPerSecond", stats.fileBytesPerSecond) &&
        SetStatNumber(env, stream, "dumpBytes", stats.dumpBytes) &&
        SetReportString(env, stream, "keyFrameRequest", stats.live.keyFrameRequest) &&
        SetReportString(env, stream, "requestedConfiguration", stats.requestedConfiguration) &&
        SetReportString(env, stream, "codecDescription", stats.codecDescription) &&
        SetReportString(env, stream, "dumpState", stats.dumpState) &&
        SetTiming(env, stream, "queueWait", stats.queueWait) &&
        SetTiming(env, stream, "queueResidence", stats.queueResidence) &&
        SetTiming(env, stream, "muxerWrite", stats.muxerWrite) &&
        SetTiming(env, stream, "dumpWrite", stats.dumpWrite) &&
        SetTiming(env, stream, "bufferHold", stats.bufferHold) &&
        napi_set_named_property(env, object, key, stream) == napi_ok;
}
} // 匿名命名空间

napi_value RecorderNative::GetDiagnostics(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_value active = nullptr;
    const SessionReportInfo session = Recorder::GetInstance().GetSessionReport();
    if (napi_create_object(env, &result) != napi_ok ||
        napi_get_boolean(env, Recorder::GetInstance().IsSessionActive(), &active) != napi_ok ||
        napi_set_named_property(env, result, "active", active) != napi_ok ||
        !SetReportString(env, result, "sessionId", session.id) ||
        !SetReportString(env, result, "requestedConfiguration", session.requested) ||
        !SetReportString(env, result, "observedConfiguration", session.observed) ||
        !SetReportString(env, result, "parameterChanges", session.changes) ||
        !SetReportString(env, result, "endReason", session.endReason) ||
        !SetAudioStats(env, result, Recorder::GetInstance().GetAudioStats()) ||
        !SetStreamStats(env, result, "primary", Recorder::GetInstance().GetOutputStats(true)) ||
        !SetStreamStats(env, result, "secondary", Recorder::GetInstance().GetOutputStats(false))) {
        napi_throw_error(env, nullptr, "Serialize recording diagnostics failed");
        return nullptr;
    }
    const OperationFailureInfo failure = Recorder::GetInstance().GetFailure();
    napi_value timeline = nullptr;
    napi_create_array_with_length(env, session.timeline.size(), &timeline);
    for (size_t i = 0; i < session.timeline.size(); ++i) {
        napi_value event = nullptr;
        napi_create_object(env, &event);
        SetStatNumber(env, event, "elapsedMs", session.timeline[i].elapsedMs);
        SetReportString(env, event, "stage", session.timeline[i].stage);
        SetReportString(env, event, "result", session.timeline[i].result);
        napi_set_element(env, timeline, i, event);
    }
    napi_set_named_property(env, result, "timeline", timeline);
    napi_value details = nullptr;
    napi_value message = nullptr;
    napi_value stage = nullptr;
    if (napi_create_object(env, &details) != napi_ok ||
        napi_create_string_utf8(env, failure.stage.c_str(), NAPI_AUTO_LENGTH, &stage) != napi_ok ||
        napi_create_string_utf8(env, failure.message.c_str(), NAPI_AUTO_LENGTH, &message) != napi_ok ||
        napi_set_named_property(env, details, "stage", stage) != napi_ok ||
        napi_set_named_property(env, details, "message", message) != napi_ok ||
        !SetStatNumber(env, details, "code", failure.code) ||
        napi_set_named_property(env, result, "failure", details) != napi_ok) {
        napi_throw_error(env, nullptr, "Serialize recorder failure failed");
        return nullptr;
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"initNative", nullptr, RecorderNative::Init, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDiagnostics", nullptr, RecorderNative::GetDiagnostics, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"markStage", nullptr, RecorderNative::MarkStage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateParameters", nullptr, RecorderNative::UpdateParameters, nullptr, nullptr, nullptr, napi_default, nullptr},
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
