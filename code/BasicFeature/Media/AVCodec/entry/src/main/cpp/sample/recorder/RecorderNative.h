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

#ifndef VIDEO_CODEC_SAMPLE_RECODER_NATIVE_H
#define VIDEO_CODEC_SAMPLE_RECODER_NATIVE_H

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <memory>
#include <native_window/external_window.h>
#include "napi/native_api.h"
#include "Recorder.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"

class RecorderNative {
public:
    // 将 ArkTS 录制配置转换为 SampleInfo，并通过异步 Promise 初始化原生录制器。
    static napi_value Init(napi_env env, napi_callback_info info);
    // 启动已经初始化完成的录制器。
    static napi_value Start(napi_env env, napi_callback_info info);
    // 异步请求停止录制并开始排空编码器。
    static napi_value StopStart(napi_env env, napi_callback_info info);
    // 异步等待资源释放完成，Promise 返回后可以开始下一次录制。
    static napi_value StopEnd(napi_env env, napi_callback_info info);
};

#endif
