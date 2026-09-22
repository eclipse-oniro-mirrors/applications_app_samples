/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "NativePlayerContext.h"
#include "PlayerNapiParser.h"
#include "dfx/error/av_codec_sample_error.h"

namespace {
struct AsyncSeekWork {
    std::shared_ptr<NativePlayerSession> session;
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    int64_t positionUs = 0;
    bool success = false;
};

void ExecuteSeek(napi_env env, void *data)
{
    (void)env;
    auto *work = static_cast<AsyncSeekWork *>(data);
    work->success = work->session->player.SeekTo(work->positionUs) == AVCODEC_SAMPLE_ERR_OK;
}

void CompleteSeek(napi_env env, napi_status status, void *data)
{
    std::unique_ptr<AsyncSeekWork> work(static_cast<AsyncSeekWork *>(data));
    work->session->seeking = false;
    napi_value result = nullptr;
    if (napi_get_boolean(env, status == napi_ok && work->success, &result) == napi_ok) {
        napi_resolve_deferred(env, work->deferred, result);
    }
    napi_delete_async_work(env, work->work);
}

void RejectSeek(napi_env env, napi_deferred deferred)
{
    napi_value result = nullptr;
    if (napi_get_boolean(env, false, &result) == napi_ok) {
        napi_resolve_deferred(env, deferred, result);
    }
}
} // 匿名命名空间

napi_value SeekToAsync(napi_env env, napi_callback_info info)
{
    auto work = std::make_unique<AsyncSeekWork>();
    if (!PlayerNapiParser::ParseSeekPosition(env, info, work->positionUs)) {
        return nullptr;
    }
    napi_value promise = nullptr;
    if (napi_create_promise(env, &work->deferred, &promise) != napi_ok) {
        return nullptr;
    }
    work->session = GetNativePlayerSession(env);
    if (work->session == nullptr || work->session->seeking.load()) {
        RejectSeek(env, work->deferred);
        return promise;
    }
    napi_value name = nullptr;
    if (napi_create_string_utf8(env, "PlayerSeek", NAPI_AUTO_LENGTH, &name) != napi_ok ||
        napi_create_async_work(env, nullptr, name, ExecuteSeek, CompleteSeek, work.get(), &work->work) != napi_ok) {
        RejectSeek(env, work->deferred);
        return promise;
    }
    work->session->seeking = true;
    if (napi_queue_async_work(env, work->work) != napi_ok) {
        work->session->seeking = false;
        napi_delete_async_work(env, work->work);
        RejectSeek(env, work->deferred);
        return promise;
    }
    // 完成回调接管 work 的所有权，并在工作线程结束前保持 Player 存活。
    work.release();
    return promise;
}
