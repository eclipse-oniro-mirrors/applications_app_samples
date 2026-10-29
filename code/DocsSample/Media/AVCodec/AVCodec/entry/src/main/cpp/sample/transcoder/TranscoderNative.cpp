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

#include <cmath>
#include <climits>
#include <fcntl.h>
#include <unistd.h>
#include <napi/native_api.h>
#include "TranscodeJob.h"

namespace {
constexpr int64_t MIN_BITRATE = 100000;
constexpr int64_t HD_LONG_EDGE = 720;
constexpr int64_t FULL_HD_LONG_EDGE = 1080;
constexpr int64_t UHD_LONG_EDGE = 1920;
constexpr int64_t MAX_ENCODER_CATEGORY = 2;
constexpr int64_t MAX_AUDIO_MODE = 2;
constexpr int64_t MAX_RESIZE_MODE = static_cast<int64_t>(TranscodeFrames::ResizeMode::LETTERBOX);
struct TranscodeModuleState {
    std::shared_ptr<TranscodeJob> current;
};
struct TranscodeAsyncWork {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::shared_ptr<TranscodeJob> job;
};

bool SetNumber(napi_env env, napi_value object, const char *key, double number)
{
    napi_value result = nullptr;
    return napi_create_double(env, number, &result) == napi_ok &&
           napi_set_named_property(env, object, key, result) == napi_ok;
}

bool SetString(napi_env env, napi_value object, const char *key, const std::string &text)
{
    napi_value result = nullptr;
    return napi_create_string_utf8(env, text.c_str(), text.size(), &result) == napi_ok &&
           napi_set_named_property(env, object, key, result) == napi_ok;
}

bool SetSnapshotFields(napi_env env, napi_value result, const TranscodeSnapshot &snapshot)
{
    const std::pair<const char *, double> numbers[] = {
        {"state", snapshot.state}, {"progress", snapshot.progress}, {"frames", snapshot.frames},
        {"bytes", snapshot.bytes}, {"errorCode", snapshot.errorCode},
        {"outputWidth", snapshot.outputWidth}, {"outputHeight", snapshot.outputHeight},
        {"elapsedMs", snapshot.elapsedMs}, {"firstFrameMs", snapshot.firstFrameMs}, {"fps", snapshot.fps},
        {"speed", snapshot.speed}, {"remainingSeconds", snapshot.remainingSeconds},
        {"decoderWaitMs", snapshot.decoderWaitMs}, {"encoderInputWaitMs", snapshot.encoderInputWaitMs},
        {"encoderOutputWaitMs", snapshot.encoderOutputWaitMs}, {"copiedBytes", snapshot.copiedBytes},
        {"fileBytes", snapshot.fileBytes}, {"availableBytes", snapshot.availableBytes},
        {"estimatedBytes", snapshot.estimatedBytes}, {"sourceWidth", snapshot.sourceWidth},
        {"sourceHeight", snapshot.sourceHeight}, {"durationUs", snapshot.durationUs},
        {"sourceFrameRate", snapshot.sourceFrameRate}, {"minBitrate", snapshot.minBitrate},
        {"maxBitrate", snapshot.maxBitrate}, {"audioBytes", snapshot.audioBytes}, {"audioMode", snapshot.audioMode},
        {"outputDurationUs", snapshot.outputDurationUs}};
    for (const auto &number : numbers) {
        if (!SetNumber(env, result, number.first, number.second)) { return false; }
    }
    const std::pair<const char *, const std::string &> strings[] = {
        {"stage", snapshot.stage}, {"detail", snapshot.detail}, {"decoderName", snapshot.decoderName},
        {"encoderName", snapshot.encoderName}, {"sourceMime", snapshot.sourceMime},
        {"outputValidation", snapshot.outputValidation}};
    for (const auto &entry : strings) {
        if (!SetString(env, result, entry.first, entry.second)) { return false; }
    }
    return true;
}

bool SetDiagnostics(napi_env env, napi_value result, const TranscodeSnapshot &snapshot)
{
    napi_value rows = nullptr;
    if (napi_create_array(env, &rows) != napi_ok) { return false; }
    for (uint32_t index = 0; index < snapshot.diagnostics.size(); ++index) {
        napi_value row = nullptr;
        const auto &metric = snapshot.diagnostics[index];
        if (napi_create_object(env, &row) != napi_ok || !SetString(env, row, "name", metric.name) ||
            !SetNumber(env, row, "calls", metric.calls) || !SetNumber(env, row, "totalMs", metric.totalMs) ||
            !SetNumber(env, row, "averageMs", metric.averageMs) || !SetNumber(env, row, "p95Ms", metric.p95Ms) ||
            !SetNumber(env, row, "maxMs", metric.maxMs) || napi_set_element(env, rows, index, row) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, result, "diagnostics", rows) == napi_ok;
}

bool SetAudioTracks(napi_env env, napi_value result, const TranscodeSnapshot &snapshot)
{
    napi_value tracks = nullptr;
    napi_value ids = nullptr;
    if (napi_create_array(env, &tracks) != napi_ok || napi_create_array(env, &ids) != napi_ok) { return false; }
    for (uint32_t index = 0; index < snapshot.audioTracks.size(); ++index) {
        napi_value title = nullptr;
        napi_value id = nullptr;
        if (napi_create_string_utf8(env, snapshot.audioTracks[index].c_str(), NAPI_AUTO_LENGTH, &title) != napi_ok ||
            napi_create_int32(env, snapshot.audioTrackIds[index], &id) != napi_ok ||
            napi_set_element(env, tracks, index, title) != napi_ok ||
            napi_set_element(env, ids, index, id) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, result, "audioTracks", tracks) == napi_ok &&
        napi_set_named_property(env, result, "audioTrackIds", ids) == napi_ok;
}

napi_value ToValue(napi_env env, const TranscodeSnapshot &snapshot)
{
    napi_value result = nullptr;
    napi_value audio = nullptr;
    if (napi_create_object(env, &result) != napi_ok || !SetSnapshotFields(env, result, snapshot) ||
        !SetDiagnostics(env, result, snapshot) || !SetAudioTracks(env, result, snapshot) ||
        napi_get_boolean(env, snapshot.audioCopied, &audio) != napi_ok ||
        napi_set_named_property(env, result, "audioCopied", audio) != napi_ok) {
        return nullptr;
    }
    return result;
}

bool ReadNumber(napi_env env, napi_value object, const char *key, int64_t &number)
{
    napi_value value = nullptr;
    napi_valuetype type = napi_undefined;
    double numeric = 0;
    if (napi_get_named_property(env, object, key, &value) != napi_ok || napi_typeof(env, value, &type) != napi_ok ||
        type != napi_number || napi_get_value_double(env, value, &numeric) != napi_ok || !std::isfinite(numeric) ||
        std::trunc(numeric) != numeric || numeric < 0 || numeric > INT32_MAX) {
        return false;
    }
    number = static_cast<int64_t>(numeric);
    return true;
}

bool ReadBool(napi_env env, napi_value object, const char *key, bool &flag)
{
    napi_value value = nullptr;
    return napi_get_named_property(env, object, key, &value) == napi_ok &&
           napi_get_value_bool(env, value, &flag) == napi_ok;
}

bool ReadProcessingOptions(napi_env env, napi_value object, TranscodeOptions &options)
{
    int64_t longEdge = 0;
    int64_t resizeMode = 0;
    bool hasResizeMode = false;
    if (!ReadNumber(env, object, "longEdge", longEdge) ||
        napi_has_named_property(env, object, "resizeMode", &hasResizeMode) != napi_ok ||
        (hasResizeMode && (!ReadNumber(env, object, "resizeMode", resizeMode) || resizeMode > MAX_RESIZE_MODE))) {
        return false;
    }
    if ((longEdge != 0 && longEdge != HD_LONG_EDGE && longEdge != FULL_HD_LONG_EDGE && longEdge != UHD_LONG_EDGE) ||
        (options.surface && (options.grayscale || longEdge != 0 || resizeMode != 0))) {
        return false;
    }
    options.longEdge = static_cast<int32_t>(longEdge);
    options.resizeMode = static_cast<int32_t>(resizeMode);
    return true;
}

bool ReadTimeRange(napi_env env, napi_value object, TranscodeOptions &options)
{
    bool hasStart = false;
    bool hasEnd = false;
    if (napi_has_named_property(env, object, "startTimeMs", &hasStart) != napi_ok ||
        napi_has_named_property(env, object, "endTimeMs", &hasEnd) != napi_ok ||
        (hasStart && !ReadNumber(env, object, "startTimeMs", options.startTimeMs)) ||
        (hasEnd && !ReadNumber(env, object, "endTimeMs", options.endTimeMs))) { return false; }
    return (options.endTimeMs == 0 || options.endTimeMs > options.startTimeMs) &&
        (!options.surface || (options.startTimeMs == 0 && options.endTimeMs == 0));
}

bool ReadNumericOptions(napi_env env, napi_value object, TranscodeOptions &options, int64_t &inputFd, int64_t &outputFd)
{
    int64_t category = 0;
    int64_t audioMode = 0;
    int64_t audioTrack = 0;
    if (!ReadNumber(env, object, "inputFd", inputFd) || !ReadNumber(env, object, "outputFd", outputFd) ||
        !ReadNumber(env, object, "bitrate", options.bitrate) || options.bitrate < MIN_BITRATE ||
        !ReadBool(env, object, "useSurfaceInput", options.surface) ||
        !ReadBool(env, object, "grayscale", options.grayscale) ||
        !ReadNumber(env, object, "encoderCategory", category) || category > MAX_ENCODER_CATEGORY ||
        !ReadNumber(env, object, "audioMode", audioMode) || audioMode > MAX_AUDIO_MODE ||
        !ReadNumber(env, object, "audioTrack", audioTrack) || !ReadProcessingOptions(env, object, options) ||
        !ReadTimeRange(env, object, options)) {
        return false;
    }
    options.encoderCategory = static_cast<int32_t>(category);
    options.audioMode = static_cast<int32_t>(audioMode);
    options.audioTrack = static_cast<int32_t>(audioTrack);
    return true;
}

bool ReadOptions(napi_env env, napi_value object, TranscodeOptions &options)
{
    int64_t inputFd = -1;
    int64_t outputFd = -1;
    if (!ReadNumericOptions(env, object, options, inputFd, outputFd)) {
        return false;
    }
    napi_value mime = nullptr;
    char mimeText[32]{};
    size_t length = 0;
    if (napi_get_named_property(env, object, "mime", &mime) != napi_ok ||
        napi_get_value_string_utf8(env, mime, mimeText, sizeof(mimeText), &length) != napi_ok ||
        length >= sizeof(mimeText)) {
        return false;
    }
    options.mime = mimeText;
    if (options.mime != "video/avc" && options.mime != "video/hevc") {
        return false;
    }
    // 工作入队前复制 fd，后台任务只使用自己的描述符。
    options.inputFd = fcntl(static_cast<int32_t>(inputFd), F_DUPFD_CLOEXEC, 0);
    options.outputFd = options.inspectOnly ? -1 : fcntl(static_cast<int32_t>(outputFd), F_DUPFD_CLOEXEC, 0);
    if (options.inputFd < 0 || (!options.inspectOnly && options.outputFd < 0)) {
        if (options.inputFd >= 0) {
            close(options.inputFd);
        }
        if (options.outputFd >= 0) {
            close(options.outputFd);
        }
        return false;
    }
    return true;
}

void Execute(napi_env env, void *data)
{
    (void)env;
    static_cast<TranscodeAsyncWork *>(data)->job->Run();
}

void Complete(napi_env env, napi_status status, void *data)
{
    std::unique_ptr<TranscodeAsyncWork> work(static_cast<TranscodeAsyncWork *>(data));
    napi_value result = ToValue(env, work->job->Snapshot());
    if (status == napi_ok && result != nullptr) {
        (void)napi_resolve_deferred(env, work->deferred, result);
    } else {
        napi_value message = nullptr;
        napi_value error = nullptr;
        if (napi_create_string_utf8(env, "Transcode worker failed", NAPI_AUTO_LENGTH, &message) == napi_ok &&
            napi_create_error(env, nullptr, message, &error) == napi_ok) {
            (void)napi_reject_deferred(env, work->deferred, error);
        }
    }
    (void)napi_delete_async_work(env, work->work);
}

napi_value StartWork(napi_env env, napi_callback_info info, bool inspect)
{
    size_t argc = 1;
    napi_value argument = nullptr;
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, &argument, nullptr, &data) != napi_ok || argc != 1 || data == nullptr) {
        napi_throw_type_error(env, nullptr, "Expected transcode options");
        return nullptr;
    }
    auto *state = static_cast<TranscodeModuleState *>(data);
    if (!inspect && state->current != nullptr && state->current->Snapshot().state == 1) {
        napi_throw_error(env, nullptr, "A transcode task is already running");
        return nullptr;
    }
    TranscodeOptions options;
    options.inspectOnly = inspect;
    if (!ReadOptions(env, argument, options)) {
        napi_throw_type_error(env, nullptr, "Invalid transcode options or descriptors");
        return nullptr;
    }
    auto job = std::make_shared<TranscodeJob>(std::move(options));
    auto work = std::make_unique<TranscodeAsyncWork>();
    work->job = job;
    napi_value promise = nullptr;
    napi_value resource = nullptr;
    if (napi_create_promise(env, &work->deferred, &promise) != napi_ok ||
        napi_create_string_utf8(env, "videoTranscode", NAPI_AUTO_LENGTH, &resource) != napi_ok ||
        napi_create_async_work(env, nullptr, resource, Execute, Complete, work.get(), &work->work) != napi_ok ||
        napi_queue_async_work(env, work->work) != napi_ok) {
        if (work->work != nullptr) {
            napi_delete_async_work(env, work->work);
        }
        napi_throw_error(env, nullptr, "Could not queue transcode task");
        return nullptr;
    }
    if (!inspect) { state->current = std::move(job); }
    (void)work.release();
    return promise;
}

napi_value Start(napi_env env, napi_callback_info info) { return StartWork(env, info, false); }
napi_value Inspect(napi_env env, napi_callback_info info) { return StartWork(env, info, true); }

napi_value Status(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, nullptr, nullptr, &data) != napi_ok || data == nullptr) {
        return nullptr;
    }
    auto *state = static_cast<TranscodeModuleState *>(data);
    TranscodeSnapshot snapshot;
    snapshot.state = 0;
    snapshot.stage = "idle";
    return ToValue(env, state->current == nullptr ? snapshot : state->current->Snapshot());
}

napi_value Cancel(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, nullptr, nullptr, &data) != napi_ok || data == nullptr) {
        return nullptr;
    }
    auto *state = static_cast<TranscodeModuleState *>(data);
    if (state->current != nullptr) {
        state->current->Cancel();
    }
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

void CleanupModule(void *data)
{
    std::unique_ptr<TranscodeModuleState> state(static_cast<TranscodeModuleState *>(data));
    if (state->current != nullptr) {
        state->current->Cancel();
    }
}

napi_value Init(napi_env env, napi_value exports)
{
    auto state = std::make_unique<TranscodeModuleState>();
    napi_property_descriptor methods[] = {
        {"start", nullptr, Start, nullptr, nullptr, nullptr, napi_default, state.get()},
        {"inspect", nullptr, Inspect, nullptr, nullptr, nullptr, napi_default, state.get()},
        {"getStatus", nullptr, Status, nullptr, nullptr, nullptr, napi_default, state.get()},
        {"cancel", nullptr, Cancel, nullptr, nullptr, nullptr, napi_default, state.get()}};
    if (napi_define_properties(env, exports, sizeof(methods) / sizeof(methods[0]), methods) != napi_ok ||
        napi_add_env_cleanup_hook(env, CleanupModule, state.get()) != napi_ok) {
        return nullptr;
    }
    (void)state.release();
    return exports;
}

static napi_module transcodeModule = {1, 0, nullptr, Init, "transcoder", nullptr, {0}};
} // namespace

extern "C" __attribute__((constructor)) void RegisterTranscoderModule()
{
    napi_module_register(&transcodeModule);
}
