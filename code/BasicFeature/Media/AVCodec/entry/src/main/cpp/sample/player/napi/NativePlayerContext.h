/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H
#define AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H

#include <memory>
#include "Player.h"
#include "napi/native_api.h"

struct NativePlayerSession {
    Player player;
    // Accessed only on the JS thread; the async worker owns the session too.
    bool seeking = false;
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
