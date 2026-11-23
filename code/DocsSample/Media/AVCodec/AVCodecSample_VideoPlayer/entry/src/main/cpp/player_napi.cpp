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

#include "player.h"

#include <charconv>
#include <fcntl.h>
#include <hilog/log.h>
#include <memory>
#include <napi/native_api.h>
#include <unistd.h>

namespace {
constexpr size_t PLAY_ARGUMENT_COUNT = 5;
constexpr size_t SURFACE_ID_CAPACITY = 21;
constexpr unsigned PLAYER_LOG_DOMAIN = 0xD000;
constexpr char PLAYER_LOG_TAG[] = "[Sample_AVCodecVideoPlayer]";

struct Playback {
    ~Playback()
    {
        if (fd >= 0) {
            close(fd);
        }
    }

    int fd = -1;
    int64_t size = 0;
    bool synchronous = false;
    bool surface = true;
    uint64_t surfaceId = 0;
    std::atomic<bool> stopped {false};
    bool completed = false;
    napi_deferred deferred = nullptr;
    napi_async_work work = nullptr;
};

// NAPI线程维护单个播放任务，解码线程只读取停止标记。
Playback *g_playback = nullptr;

napi_value Finished(napi_env env, napi_deferred deferred, bool success)
{
    napi_value result = nullptr;
    napi_get_boolean(env, success, &result);
    napi_resolve_deferred(env, deferred, result);
    return nullptr;
}

bool ReadArguments(napi_env env, napi_callback_info info, Playback &job)
{
    size_t count = PLAY_ARGUMENT_COUNT;
    napi_value arguments[PLAY_ARGUMENT_COUNT] {};
    int32_t fd = -1;
    char id[SURFACE_ID_CAPACITY] {};
    size_t length = 0;
    if (napi_get_cb_info(env, info, &count, arguments, nullptr, nullptr) != napi_ok ||
        count != PLAY_ARGUMENT_COUNT ||
        napi_get_value_int32(env, arguments[0], &fd) != napi_ok || fd < 0 ||
        napi_get_value_int64(env, arguments[1], &job.size) != napi_ok || job.size <= 0 ||
        napi_get_value_bool(env, arguments[2], &job.synchronous) != napi_ok ||
        napi_get_value_bool(env, arguments[3], &job.surface) != napi_ok ||
        napi_get_value_string_utf8(env, arguments[4], nullptr, 0, &length) != napi_ok || length >= sizeof(id) ||
        napi_get_value_string_utf8(env, arguments[4], id, sizeof(id), &length) != napi_ok) {
        return false;
    }
    const auto parsed = std::from_chars(id, id + length, job.surfaceId);
    if (parsed.ec != std::errc {} || parsed.ptr != id + length || job.surfaceId == 0) {
        return false;
    }
    job.fd = fcntl(fd, F_DUPFD_CLOEXEC, 0);
    return job.fd >= 0;
}

void Execute(napi_env, void *data)
{
    auto &job = *static_cast<Playback *>(data);
    if (!job.stopped.load()) {
        OH_LOG_Print(LOG_APP, LOG_INFO, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "Playback started: %{public}s, %{public}s", job.synchronous ? "sync" : "async",
            job.surface ? "Surface" : "Buffer");
        job.completed = PlayVideo(job.fd, job.size, job.synchronous, job.surface, job.surfaceId, job.stopped);
    }
}

void Complete(napi_env env, napi_status status, void *data)
{
    std::unique_ptr<Playback> job(static_cast<Playback *>(data));
    const bool success = status == napi_ok && job->completed && !job->stopped.load();
    const char *outcome = success ? "completed" : (job->stopped.load() ? "stopped" : "failed");
    const auto deferred = job->deferred;
    napi_delete_async_work(env, job->work);
    g_playback = nullptr;
    job.reset();
    OH_LOG_Print(LOG_APP, LOG_INFO, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
        "Playback resources released: %{public}s", outcome);
    Finished(env, deferred, success);
}

napi_value Play(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return nullptr;
    }
    if (g_playback != nullptr) {
        Finished(env, deferred, false);
        return promise;
    }
    std::unique_ptr<Playback> job(new (std::nothrow) Playback);
    napi_value name = nullptr;
    if (job == nullptr || !ReadArguments(env, info, *job) ||
        napi_create_string_utf8(env, "AVCodecSampleVideoPlayer", NAPI_AUTO_LENGTH, &name) != napi_ok ||
        napi_create_async_work(env, nullptr, name, Execute, Complete, job.get(), &job->work) != napi_ok) {
        job.reset();
        Finished(env, deferred, false);
        return promise;
    }
    job->deferred = deferred;
    if (napi_queue_async_work(env, job->work) != napi_ok) {
        napi_delete_async_work(env, job->work);
        job.reset();
        Finished(env, deferred, false);
        return promise;
    }
    g_playback = job.release();
    OH_LOG_Print(LOG_APP, LOG_INFO, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Playback queued");
    return promise;
}

napi_value Stop(napi_env env, napi_callback_info)
{
    if (g_playback != nullptr) {
        g_playback->stopped = true;
    }
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    return undefined;
}

napi_value Init(napi_env env, napi_value exports)
{
    const napi_property_descriptor methods[] = {
        {"play", nullptr, Play, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stop", nullptr, Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(methods) / sizeof(methods[0]), methods);
    return exports;
}

napi_module g_module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};
}

extern "C" __attribute__((constructor)) void RegisterPlayerModule()
{
    napi_module_register(&g_module);
}
