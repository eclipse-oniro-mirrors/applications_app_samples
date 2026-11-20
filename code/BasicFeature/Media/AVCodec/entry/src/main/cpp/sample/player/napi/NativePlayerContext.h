/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H
#define AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H

#include <atomic>
#include <memory>
#include "Player.h"
#include "napi/native_api.h"

struct NativePlayerSession {
    Player player;
    // NAPI 的 JS 线程与跳转工作线程共享该标记。重建 codec 期间，
    // 它阻止其他控制操作继续访问 Player。
    std::atomic<bool> seeking { false };
};

struct NativePlayerContext {
    std::shared_ptr<NativePlayerSession> session = std::make_shared<NativePlayerSession>();
};

inline std::shared_ptr<NativePlayerSession> GetNativePlayerSession(napi_env env)
{
    void *data = nullptr;
    if (napi_get_instance_data(env, &data) != napi_ok || data == nullptr) {
        return nullptr;
    }
    return static_cast<NativePlayerContext *>(data)->session;
}

napi_value SeekToAsync(napi_env env, napi_callback_info info);

#endif // AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H
