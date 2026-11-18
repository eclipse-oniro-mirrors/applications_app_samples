/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "capabilities/AVScreenCapture.h"
#include <multimedia/player_framework/native_avscreen_capture_errors.h>

AVScreenCapture g_capturer;

napi_value StopScreenCaptureToFile(napi_env env, napi_callback_info info)
{
    (void)info;
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    napi_value res;
    result = g_capturer.StopScreenCaptureToFile();
    napi_create_int32(env, result, &res);
    return res;
}

napi_value StartScreenCaptureToFile(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t outputFd;
    napi_get_value_int32(env, args[0], &outputFd);
    if (outputFd <= 0) {
        napi_value res;
        napi_create_int32(env, -1, &res);
        return res;
    }
    bool isMicrophone;
    napi_get_value_bool(env, args[1], &isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = g_capturer.StartScreenCaptureToFile(outputFd, isMicrophone);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

napi_value SetMicrophoneEnabled(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    bool isMicrophone;
    napi_get_value_bool(env, args[0], &isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = g_capturer.SetMicrophoneEnabled(isMicrophone);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setStartCallbackToFile", nullptr, AVScreenCapture::SetStartCallbackToFile, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setStopCallbackToFile", nullptr, AVScreenCapture::SetStopCallbackToFile, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"startScreenCaptureToFile", nullptr, StartScreenCaptureToFile, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setMicrophoneEnabled", nullptr, SetMicrophoneEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopScreenCaptureToFile", nullptr, StopScreenCaptureToFile, nullptr, nullptr, nullptr, napi_default,
         nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}