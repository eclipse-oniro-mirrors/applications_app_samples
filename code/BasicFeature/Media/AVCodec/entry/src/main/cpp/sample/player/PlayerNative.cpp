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

struct CallbackContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    bool success = false;
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

void Callback(void *asyncContext, bool success)
{
    CallbackContext *context = static_cast<CallbackContext *>(asyncContext);
    if (context == nullptr || context->env == nullptr) {
        DestroyCallbackContext(context);
        return;
    }
    context->success = success;

    uv_loop_s *loop = nullptr;
    napi_status status = napi_get_uv_event_loop(context->env, &loop);
    if (status != napi_ok || loop == nullptr) {
        AVCODEC_SAMPLE_LOGE("Get uv event loop failed");
        DestroyCallbackContext(context);
        return;
    }

    uv_work_t *work = new uv_work_t;
    work->data = context;
    int32_t ret = uv_queue_work(
        loop, work, [](uv_work_t *work) {},
        [](uv_work_t *work, int status) {
            (void)status;
            CallbackContext *context = (CallbackContext *)work->data;
            napi_handle_scope scope = nullptr;
            if (napi_open_handle_scope(context->env, &scope) == napi_ok) {
                napi_value callback = nullptr;
                if (napi_get_reference_value(context->env, context->callbackRef, &callback) == napi_ok &&
                    callback != nullptr) {
                    napi_value callbackArgs[1] = {nullptr};
                    napi_get_boolean(context->env, context->success, &callbackArgs[0]);
                    napi_call_function(context->env, nullptr, callback, 1, callbackArgs, nullptr);
                }
                napi_close_handle_scope(context->env, scope);
            }
            DestroyCallbackContext(context);
            delete work;
    });
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGE("Queue play done callback failed, ret: %{public}d", ret);
        DestroyCallbackContext(context);
        delete work;
    }
}

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
    Player::GetInstance().OnThermalLevelRecovered();
    return nullptr;
}

napi_value PlayerNative::Play(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    size_t argc = 9;
    napi_value args[9] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int index = 0;
    napi_get_value_int32(env, args[index++], &sampleInfo.inputFd);
    napi_get_value_int64(env, args[index++], &sampleInfo.inputFileOffset);
    napi_get_value_int64(env, args[index++], &sampleInfo.inputFileSize);
    napi_get_value_int32(env, args[index++], &sampleInfo.codecType);
    napi_get_value_int32(env, args[index++], &sampleInfo.codecRunMode);
    napi_get_value_int32(env, args[index++], &sampleInfo.codecSyncMode);
    napi_get_value_bool(env, args[index++], &sampleInfo.isSmartFluencySupported);
    napi_get_value_bool(env, args[index++], &sampleInfo.enableVideoDump);

    auto asyncContext = new CallbackContext();
    asyncContext->env = env;
    napi_create_reference(env, args[index], 1, &asyncContext->callbackRef);

    sampleInfo.playDoneCallback = &Callback;
    sampleInfo.playDoneCallbackData = asyncContext;
    int32_t ret = Player::GetInstance().Init(sampleInfo);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        ret = Player::GetInstance().Start();
    }

    napi_value result = nullptr;
    napi_get_boolean(env, ret == AVCODEC_SAMPLE_ERR_OK, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"playNative", nullptr, PlayerNative::Play, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    napi_define_properties(env, exports, sizeof(classProp) / sizeof(classProp[0]), classProp);
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
