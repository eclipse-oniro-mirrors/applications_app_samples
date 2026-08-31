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

#include "PlayerNative.h"
#include <memory>
#include <uv.h>
#include "Player.h"
#include "PlayerNapiParser.h"
#include "PlayerNapiSerializer.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "plugin_manager.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "player"

namespace {
struct NativePlayerContext {
    std::unique_ptr<Player> player = std::make_unique<Player>();
};

void DestroyNativePlayerContext(napi_env env, void *data, void *hint)
{
    (void)env;
    (void)hint;
    delete static_cast<NativePlayerContext *>(data);
}

Player *GetPlayer(napi_env env)
{
    void *data = nullptr;
    if (napi_get_instance_data(env, &data) != napi_ok || data == nullptr) {
        return nullptr;
    }
    auto *context = static_cast<NativePlayerContext *>(data);
    return context->player.get();
}

struct CallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    bool success = false;
    bool structuredResult = false;
    PlaybackCompletionReason reason = PlaybackCompletionReason::ERROR;
};

void DestroyCallbackContext(CallbackContext *context)
{
    if (context == nullptr) {
        return;
    }
    if (context->env != nullptr && context->callbackRef != nullptr) {
        napi_delete_reference(context->env, context->callbackRef);
        context->callbackRef = nullptr;
    }
    delete context;
}

void InvokeJsCallback(CallbackContext &context)
{
    napi_handle_scope scope = nullptr;
    if (napi_open_handle_scope(context.env, &scope) != napi_ok) {
        return;
    }

    napi_value callback = nullptr;
    const bool callbackAvailable = napi_get_reference_value(context.env, context.callbackRef, &callback) == napi_ok &&
                                   callback != nullptr;
    if (callbackAvailable) {
        napi_value callbackArgs[1] = {nullptr};
        const bool resultCreated = PlayerNapiSerializer::CreatePlaybackResult(context.env, context.success,
            context.reason, context.structuredResult, callbackArgs[0]);
        if (resultCreated) {
            napi_call_function(context.env, nullptr, callback, 1, callbackArgs, nullptr);
        }
    }
    napi_close_handle_scope(context.env, scope);
}

void ExecuteCallbackWork(uv_work_t *work)
{
    (void)work;
}

void CompleteCallbackWork(uv_work_t *work, int status)
{
    (void)status;
    auto *context = static_cast<CallbackContext *>(work->data);
    InvokeJsCallback(*context);
    DestroyCallbackContext(context);
    delete work;
}

void Callback(void *asyncContext, bool success, PlaybackCompletionReason reason)
{
    auto *context = static_cast<CallbackContext *>(asyncContext);
    if (context == nullptr || context->env == nullptr) {
        DestroyCallbackContext(context);
        return;
    }
    context->success = success;
    context->reason = reason;

    uv_loop_s *loop = nullptr;
    napi_status status = napi_get_uv_event_loop(context->env, &loop);
    if (status != napi_ok || loop == nullptr) {
        AVCODEC_SAMPLE_LOGE("Get uv event loop failed");
        DestroyCallbackContext(context);
        return;
    }

    auto *work = new uv_work_t;
    work->data = context;
    int32_t ret = uv_queue_work(loop, work, ExecuteCallbackWork, CompleteCallbackWork);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGE("Queue play done callback failed, ret: %{public}d", ret);
        DestroyCallbackContext(context);
        delete work;
    }
}

napi_value StartPlayback(napi_env env, SampleInfo &sampleInfo, napi_value callback, bool structuredResult)
{
    napi_value result = nullptr;
    auto asyncContext = std::make_unique<CallbackContext>();
    asyncContext->env = env;
    asyncContext->structuredResult = structuredResult;
    if (napi_create_reference(env, callback, 1, &asyncContext->callbackRef) != napi_ok) {
        napi_throw_error(env, nullptr, "Create play callback reference failed");
        return nullptr;
    }

    Player *player = GetPlayer(env);
    if (player == nullptr) {
        napi_throw_error(env, nullptr, "Player context is unavailable");
        DestroyCallbackContext(asyncContext.release());
        return nullptr;
    }
    if (player->GetState() != PLAYER_STATE_IDLE) {
        AVCODEC_SAMPLE_LOGE("Player is not idle");
        Callback(asyncContext.release(), false, PlaybackCompletionReason::ERROR);
        napi_get_boolean(env, false, &result);
        return result;
    }

    sampleInfo.playback.playDoneCallback = &Callback;
    sampleInfo.playback.playDoneCallbackData = asyncContext.get();
    int32_t ret = player->Init(sampleInfo);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        asyncContext.release();
        ret = player->Start();
    } else if (player->GetState() == PLAYER_STATE_STOPPING) {
        asyncContext.release();
    } else {
        Callback(asyncContext.release(), false, PlaybackCompletionReason::ERROR);
    }

    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

} // namespace

napi_value PlayerNative::SetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    double speed;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_double(env, args[0], &speed);
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->SetSpeed(static_cast<float>(speed));
    }
    return nullptr;
}

napi_value PlayerNative::SetTransform(napi_env env, napi_callback_info info)
{
    int32_t transformHint;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_int32(env, args[0], &transformHint);
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->SetTransform(transformHint);
    }
    return nullptr;
}

napi_value PlayerNative::SetSmartFluencyEnabled(napi_env env, napi_callback_info info)
{
    bool enabled;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_bool(env, args[0], &enabled);
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->SetSmartFluencySupported(enabled);
    }
    return nullptr;
}

napi_value PlayerNative::OnThermalWarningReceived(napi_env env, napi_callback_info info)
{
    double ratio;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_double(env, args[0], &ratio);
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->OnThermalWarningReceived(ratio);
    }
    return nullptr;
}

napi_value PlayerNative::OnThermalLevelRecovered(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->OnThermalLevelRecovered();
    }
    return nullptr;
}

napi_value PlayerNative::Play(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    napi_value callback = nullptr;
    if (!PlayerNapiParser::ParseLegacyPlayArguments(env, info, sampleInfo, callback)) {
        return nullptr;
    }
    return StartPlayback(env, sampleInfo, callback, false);
}

napi_value PlayerNative::SetVolume(napi_env env, napi_callback_info info)
{
    double volume = 1.0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc != 1 ||
        napi_get_value_double(env, args[0], &volume) != napi_ok || volume < 0.0 || volume > 1.0) {
        napi_throw_range_error(env, nullptr, "volume must be a number in the range [0, 1]");
        return nullptr;
    }
    if (Player *player = GetPlayer(env); player != nullptr) {
        player->SetVolume(static_cast<float>(volume));
    }
    return nullptr;
}

napi_value PlayerNative::PlayWithOptions(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    napi_value callback = nullptr;
    if (!PlayerNapiParser::ParseStructuredPlayArguments(env, info, sampleInfo, callback)) {
        return nullptr;
    }
    return StartPlayback(env, sampleInfo, callback, true);
}

napi_value PlayerNative::Stop(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    int32_t ret = player == nullptr ? AVCODEC_SAMPLE_ERR_ERROR : player->Stop();
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

napi_value PlayerNative::Pause(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    int32_t ret = player == nullptr ? AVCODEC_SAMPLE_ERR_ERROR : player->Pause();
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

napi_value PlayerNative::Resume(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    int32_t ret = player == nullptr ? AVCODEC_SAMPLE_ERR_ERROR : player->Resume();
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

napi_value PlayerNative::SeekTo(napi_env env, napi_callback_info info)
{
    int64_t positionUs = 0;
    if (!PlayerNapiParser::ParseSeekPosition(env, info, positionUs)) {
        return nullptr;
    }
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    int32_t ret = player == nullptr ? AVCODEC_SAMPLE_ERR_ERROR : player->SeekTo(positionUs);
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

napi_value PlayerNative::GetState(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    napi_create_int32(env, static_cast<int32_t>(player == nullptr ? PLAYER_STATE_IDLE : player->GetState()), &result);
    return result;
}

napi_value PlayerNative::GetPlaybackInfo(napi_env env, napi_callback_info info)
{
    (void)info;
    Player *player = GetPlayer(env);
    const PlaybackInfo playbackInfo = player == nullptr ? PlaybackInfo {} : player->GetPlaybackInfo();
    napi_value result = nullptr;
    if (!PlayerNapiSerializer::CreatePlaybackInfo(env, playbackInfo, result)) {
        napi_throw_error(env, nullptr, "Create playback info failed");
        return nullptr;
    }
    return result;
}

napi_value PlayerNative::GetMediaInfo(napi_env env, napi_callback_info info)
{
    (void)info;
    Player *player = GetPlayer(env);
    const MediaInfo mediaInfo = player == nullptr ? MediaInfo {} : player->GetMediaInfo();
    napi_value result = nullptr;
    if (!PlayerNapiSerializer::CreateMediaInfo(env, mediaInfo, result)) {
        napi_throw_error(env, nullptr, "Create media info failed");
        return nullptr;
    }
    return result;
}

napi_value PlayerNative::IsSmartFluencyAvailable(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    Player *player = GetPlayer(env);
    napi_get_boolean(env, player != nullptr && player->IsSmartFluencyAvailable(), &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    auto *context = new NativePlayerContext;
    if (napi_set_instance_data(env, context, DestroyNativePlayerContext, nullptr) != napi_ok) {
        delete context;
        napi_throw_error(env, nullptr, "Set player instance data failed");
        return nullptr;
    }
    napi_property_descriptor classProp[] = {
        {"play", nullptr, PlayerNative::PlayWithOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"playNative", nullptr, PlayerNative::Play, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stop", nullptr, PlayerNative::Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pause", nullptr, PlayerNative::Pause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resume", nullptr, PlayerNative::Resume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seekTo", nullptr, PlayerNative::SeekTo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getState", nullptr, PlayerNative::GetState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPlaybackInfo", nullptr, PlayerNative::GetPlaybackInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMediaInfo", nullptr, PlayerNative::GetMediaInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isSmartFluencyAvailable", nullptr, PlayerNative::IsSmartFluencyAvailable,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPlaybackSpeed", nullptr, PlayerNative::SetPlaybackSpeed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setVolume", nullptr, PlayerNative::SetVolume,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setTransform", nullptr, PlayerNative::SetTransform, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setSmartFluencyEnabled", nullptr, PlayerNative::SetSmartFluencyEnabled,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"onThermalWarningReceived", nullptr, PlayerNative::OnThermalWarningReceived,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"onThermalLevelRecovered", nullptr, PlayerNative::OnThermalLevelRecovered,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    
    NativeXComponentSample::PluginManager::GetInstance()->Export(env, exports);
    if (napi_define_properties(env, exports, sizeof(classProp) / sizeof(classProp[0]), classProp) != napi_ok ||
        !PlayerNapiSerializer::ExportPlayerState(env, exports)) {
        napi_throw_error(env, nullptr, "Export player NAPI failed");
    }
    return exports;
}
EXTERN_C_END

static napi_module PlayerModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "player",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterPlayerModule(void)
{
    napi_module_register(&PlayerModule);
}
