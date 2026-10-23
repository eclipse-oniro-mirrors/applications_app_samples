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
struct TranscodeModuleState { std::shared_ptr<TranscodeJob> current; };
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

napi_value ToValue(napi_env env, const TranscodeSnapshot &snapshot)
{
    napi_value result = nullptr;
    napi_value audio = nullptr;
    if (napi_create_object(env, &result) != napi_ok ||
        !SetNumber(env, result, "state", snapshot.state) || !SetNumber(env, result, "progress", snapshot.progress) ||
        !SetNumber(env, result, "frames", snapshot.frames) || !SetNumber(env, result, "bytes", snapshot.bytes) ||
        !SetNumber(env, result, "errorCode", snapshot.errorCode) ||
        !SetNumber(env, result, "outputWidth", snapshot.outputWidth) ||
        !SetNumber(env, result, "outputHeight", snapshot.outputHeight) ||
        !SetString(env, result, "stage", snapshot.stage) || !SetString(env, result, "detail", snapshot.detail) ||
        napi_get_boolean(env, snapshot.audioCopied, &audio) != napi_ok ||
        napi_set_named_property(env, result, "audioCopied", audio) != napi_ok) { return nullptr; }
    return result;
}

bool ReadNumber(napi_env env, napi_value object, const char *key, int64_t &number)
{
    napi_value value = nullptr;
    napi_valuetype type = napi_undefined;
    double numeric = 0;
    if (napi_get_named_property(env, object, key, &value) != napi_ok ||
        napi_typeof(env, value, &type) != napi_ok || type != napi_number ||
        napi_get_value_double(env, value, &numeric) != napi_ok || !std::isfinite(numeric) ||
        std::trunc(numeric) != numeric || numeric < 0 || numeric > INT32_MAX) { return false; }
    number = static_cast<int64_t>(numeric);
    return true;
}

bool ReadBool(napi_env env, napi_value object, const char *key, bool &flag)
{
    napi_value value = nullptr;
    return napi_get_named_property(env, object, key, &value) == napi_ok &&
        napi_get_value_bool(env, value, &flag) == napi_ok;
}

bool ReadOptions(napi_env env, napi_value object, TranscodeOptions &options)
{
    int64_t inputFd = -1;
    int64_t outputFd = -1;
    int64_t longEdge = 0;
    if (!ReadNumber(env, object, "inputFd", inputFd) || !ReadNumber(env, object, "outputFd", outputFd) ||
        !ReadNumber(env, object, "bitrate", options.bitrate) || !ReadNumber(env, object, "longEdge", longEdge) ||
        !ReadBool(env, object, "surface", options.surface) || !ReadBool(env, object, "grayscale", options.grayscale) ||
        !ReadBool(env, object, "keepAudio", options.keepAudio) || options.bitrate < 100000 ||
        (longEdge != 0 && longEdge != 720 && longEdge != 1080 && longEdge != 1920) ||
        (options.surface && (options.grayscale || longEdge != 0))) { return false; }
    napi_value mime = nullptr;
    char mimeText[32] {};
    size_t length = 0;
    if (napi_get_named_property(env, object, "mime", &mime) != napi_ok ||
        napi_get_value_string_utf8(env, mime, mimeText, sizeof(mimeText), &length) != napi_ok || length >= sizeof(mimeText)) {
        return false;
    }
    options.mime = mimeText;
    if (options.mime != "video/avc" && options.mime != "video/hevc") { return false; }
    options.longEdge = static_cast<int32_t>(longEdge);
    // 工作入队前复制 fd，后台任务只使用自己的描述符。
    options.inputFd = fcntl(static_cast<int32_t>(inputFd), F_DUPFD_CLOEXEC, 0);
    options.outputFd = fcntl(static_cast<int32_t>(outputFd), F_DUPFD_CLOEXEC, 0);
    if (options.inputFd < 0 || options.outputFd < 0) {
        if (options.inputFd >= 0) { close(options.inputFd); }
        if (options.outputFd >= 0) { close(options.outputFd); }
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

napi_value Start(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argument = nullptr;
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, &argument, nullptr, &data) != napi_ok || argc != 1 || data == nullptr) {
        napi_throw_type_error(env, nullptr, "Expected transcode options");
        return nullptr;
    }
    auto *state = static_cast<TranscodeModuleState *>(data);
    if (state->current != nullptr && state->current->Snapshot().state == 1) {
        napi_throw_error(env, nullptr, "A transcode task is already running");
        return nullptr;
    }
    TranscodeOptions options;
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
        if (work->work != nullptr) { napi_delete_async_work(env, work->work); }
        napi_throw_error(env, nullptr, "Could not queue transcode task");
        return nullptr;
    }
    state->current = std::move(job);
    (void)work.release();
    return promise;
}

napi_value Status(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    void *data = nullptr;
    if (napi_get_cb_info(env, info, &argc, nullptr, nullptr, &data) != napi_ok || data == nullptr) { return nullptr; }
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
    if (napi_get_cb_info(env, info, &argc, nullptr, nullptr, &data) != napi_ok || data == nullptr) { return nullptr; }
    auto *state = static_cast<TranscodeModuleState *>(data);
    if (state->current != nullptr) { state->current->Cancel(); }
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

void CleanupModule(void *data)
{
    std::unique_ptr<TranscodeModuleState> state(static_cast<TranscodeModuleState *>(data));
    if (state->current != nullptr) { state->current->Cancel(); }
}

napi_value Init(napi_env env, napi_value exports)
{
    auto state = std::make_unique<TranscodeModuleState>();
    napi_property_descriptor methods[] = {
        {"start", nullptr, Start, nullptr, nullptr, nullptr, napi_default, state.get()},
        {"getStatus", nullptr, Status, nullptr, nullptr, nullptr, napi_default, state.get()},
        {"cancel", nullptr, Cancel, nullptr, nullptr, nullptr, napi_default, state.get()}
    };
    if (napi_define_properties(env, exports, sizeof(methods) / sizeof(methods[0]), methods) != napi_ok ||
        napi_add_env_cleanup_hook(env, CleanupModule, state.get()) != napi_ok) { return nullptr; }
    (void)state.release();
    return exports;
}

static napi_module transcodeModule = { 1, 0, nullptr, Init, "transcoder", nullptr, { 0 } };
}

extern "C" __attribute__((constructor)) void RegisterTranscoderModule()
{
    napi_module_register(&transcodeModule);
}
