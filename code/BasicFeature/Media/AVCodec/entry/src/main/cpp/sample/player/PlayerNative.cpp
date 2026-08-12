/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "player"

namespace {
constexpr size_t LEGACY_PLAY_ARG_COUNT = 9;
constexpr size_t STRUCTURED_PLAY_ARG_COUNT = 2;

struct CallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    bool success = false;
    bool structuredResult = false;
    PlaybackCompletionReason reason = PlaybackCompletionReason::ERROR;
};

const char *GetCompletionReasonName(PlaybackCompletionReason reason)
{
    switch (reason) {
        case PlaybackCompletionReason::COMPLETED:
            return "completed";
        case PlaybackCompletionReason::STOPPED:
            return "stopped";
        case PlaybackCompletionReason::ERROR:
        default:
            return "error";
    }
}

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

bool CreateStructuredResult(napi_env env, const CallbackContext &context, napi_value &result)
{
    napi_value success = nullptr;
    napi_value reason = nullptr;
    if (napi_create_object(env, &result) != napi_ok ||
        napi_get_boolean(env, context.success, &success) != napi_ok ||
        napi_create_string_utf8(env, GetCompletionReasonName(context.reason), NAPI_AUTO_LENGTH, &reason) != napi_ok ||
        napi_set_named_property(env, result, "success", success) != napi_ok ||
        napi_set_named_property(env, result, "reason", reason) != napi_ok) {
        return false;
    }
    return true;
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
        const bool resultCreated = context.structuredResult ?
            CreateStructuredResult(context.env, context, callbackArgs[0]) :
            napi_get_boolean(context.env, context.success, &callbackArgs[0]) == napi_ok;
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

bool GetRequiredProperty(napi_env env, napi_value object, const char *name, napi_value &value)
{
    bool hasProperty = false;
    if (napi_has_named_property(env, object, name, &hasProperty) != napi_ok || !hasProperty ||
        napi_get_named_property(env, object, name, &value) != napi_ok) {
        std::string message = "Missing play option: " + std::string(name);
        napi_throw_type_error(env, nullptr, message.c_str());
        return false;
    }
    return true;
}

bool ReadInt32Property(napi_env env, napi_value object, const char *name, int32_t &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_int32(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ReadInt64Property(napi_env env, napi_value object, const char *name, int64_t &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_int64(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ReadBoolProperty(napi_env env, napi_value object, const char *name, bool &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_bool(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a boolean");
        return false;
    }
    return true;
}

bool ParsePlayOptions(napi_env env, napi_value options, SampleInfo &sampleInfo)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, options, &type) != napi_ok || type != napi_object) {
        napi_throw_type_error(env, nullptr, "Play options must be an object");
        return false;
    }
    return ReadInt32Property(env, options, "inputFileFd", sampleInfo.inputFd) &&
        ReadInt64Property(env, options, "inputFileOffset", sampleInfo.inputFileOffset) &&
        ReadInt64Property(env, options, "inputFileSize", sampleInfo.inputFileSize) &&
        ReadInt32Property(env, options, "videoDecoderType", sampleInfo.codecType) &&
        ReadInt32Property(env, options, "videoDecoderRunMode", sampleInfo.codecRunMode) &&
        ReadInt32Property(env, options, "videoDecoderSyncMode", sampleInfo.codecSyncMode) &&
        ReadBoolProperty(env, options, "isSmartFluencySupported", sampleInfo.isSmartFluencySupported) &&
        ReadBoolProperty(env, options, "enableVideoDump", sampleInfo.enableVideoDump);
}

bool IsFunction(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    return napi_typeof(env, value, &type) == napi_ok && type == napi_function;
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

    if (Player::GetInstance().GetState() != PlayerState::IDLE) {
        AVCODEC_SAMPLE_LOGE("Player is not idle");
        Callback(asyncContext.release(), false, PlaybackCompletionReason::ERROR);
        napi_get_boolean(env, false, &result);
        return result;
    }

    sampleInfo.playDoneCallback = &Callback;
    sampleInfo.playDoneCallbackData = asyncContext.get();
    int32_t ret = Player::GetInstance().Init(sampleInfo);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        asyncContext.release();
        ret = Player::GetInstance().Start();
    } else if (Player::GetInstance().GetState() == PlayerState::STOPPING) {
        asyncContext.release();
    } else {
        Callback(asyncContext.release(), false, PlaybackCompletionReason::ERROR);
    }

    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

bool SetStateValue(napi_env env, napi_value stateObject, const char *name, PlayerState state)
{
    napi_value value = nullptr;
    return napi_create_int32(env, static_cast<int32_t>(state), &value) == napi_ok &&
        napi_set_named_property(env, stateObject, name, value) == napi_ok;
}

bool ExportPlayerState(napi_env env, napi_value exports)
{
    napi_value stateObject = nullptr;
    if (napi_create_object(env, &stateObject) != napi_ok ||
        !SetStateValue(env, stateObject, "IDLE", PlayerState::IDLE) ||
        !SetStateValue(env, stateObject, "INITIALIZING", PlayerState::INITIALIZING) ||
        !SetStateValue(env, stateObject, "READY", PlayerState::READY) ||
        !SetStateValue(env, stateObject, "PLAYING", PlayerState::PLAYING) ||
        !SetStateValue(env, stateObject, "STOPPING", PlayerState::STOPPING)) {
        return false;
    }
    return napi_set_named_property(env, exports, "PlayerState", stateObject) == napi_ok;
}
} // namespace

napi_value PlayerNative::SetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    double speed;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_double(env, args[0], &speed);
    Player::GetInstance().SetSpeed(static_cast<float>(speed));
    return nullptr;
}

napi_value PlayerNative::SetTransform(napi_env env, napi_callback_info info)
{
    int32_t transformHint;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_int32(env, args[0], &transformHint);
    Player::GetInstance().SetTransform(transformHint);
    return nullptr;
}

napi_value PlayerNative::SetSmartFluencyEnabled(napi_env env, napi_callback_info info)
{
    bool enabled;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_bool(env, args[0], &enabled);
    Player::GetInstance().SetSmartFluencySupported(enabled);
    return nullptr;
}

napi_value PlayerNative::OnThermalWarningReceived(napi_env env, napi_callback_info info)
{
    double ratio;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_double(env, args[0], &ratio);
    Player::GetInstance().OnThermalWarningReceived(ratio);
    return nullptr;
}

napi_value PlayerNative::OnThermalLevelRecovered(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    Player::GetInstance().OnThermalLevelRecovered();
    return nullptr;
}

napi_value PlayerNative::Play(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    size_t argc = LEGACY_PLAY_ARG_COUNT;
    napi_value args[LEGACY_PLAY_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc != LEGACY_PLAY_ARG_COUNT || !IsFunction(env, args[LEGACY_PLAY_ARG_COUNT - 1])) {
        napi_throw_type_error(env, nullptr, "playNative requires eight options and a callback");
        return nullptr;
    }

    bool parsed = napi_get_value_int32(env, args[0], &sampleInfo.inputFd) == napi_ok &&
        napi_get_value_int64(env, args[1], &sampleInfo.inputFileOffset) == napi_ok &&
        napi_get_value_int64(env, args[2], &sampleInfo.inputFileSize) == napi_ok &&
        napi_get_value_int32(env, args[3], &sampleInfo.codecType) == napi_ok &&
        napi_get_value_int32(env, args[4], &sampleInfo.codecRunMode) == napi_ok &&
        napi_get_value_int32(env, args[5], &sampleInfo.codecSyncMode) == napi_ok &&
        napi_get_value_bool(env, args[6], &sampleInfo.isSmartFluencySupported) == napi_ok &&
        napi_get_value_bool(env, args[7], &sampleInfo.enableVideoDump) == napi_ok;
    if (!parsed) {
        napi_throw_type_error(env, nullptr, "Invalid playNative argument type");
        return nullptr;
    }
    return StartPlayback(env, sampleInfo, args[LEGACY_PLAY_ARG_COUNT - 1], false);
}

napi_value PlayerNative::PlayWithOptions(napi_env env, napi_callback_info info)
{
    size_t argc = STRUCTURED_PLAY_ARG_COUNT;
    napi_value args[STRUCTURED_PLAY_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc != STRUCTURED_PLAY_ARG_COUNT || !IsFunction(env, args[1])) {
        napi_throw_type_error(env, nullptr, "play requires an options object and a callback");
        return nullptr;
    }

    SampleInfo sampleInfo;
    if (!ParsePlayOptions(env, args[0], sampleInfo)) {
        return nullptr;
    }
    return StartPlayback(env, sampleInfo, args[1], true);
}

napi_value PlayerNative::Stop(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    int32_t ret = Player::GetInstance().Stop();
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

napi_value PlayerNative::GetState(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(Player::GetInstance().GetState()), &result);
    return result;
}

napi_value PlayerNative::IsSmartFluencyAvailable(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_get_boolean(env, Player::GetInstance().IsSmartFluencyAvailable(), &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"play", nullptr, PlayerNative::PlayWithOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"playNative", nullptr, PlayerNative::Play, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stop", nullptr, PlayerNative::Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getState", nullptr, PlayerNative::GetState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isSmartFluencyAvailable", nullptr, PlayerNative::IsSmartFluencyAvailable,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPlaybackSpeed", nullptr, PlayerNative::SetPlaybackSpeed,
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
        !ExportPlayerState(env, exports)) {
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
