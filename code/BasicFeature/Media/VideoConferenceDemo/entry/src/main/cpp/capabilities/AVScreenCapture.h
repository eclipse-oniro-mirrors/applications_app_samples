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

#ifndef AVSCREEN_CAPTURE_RECORD
#define AVSCREEN_CAPTURE_RECORD

#include "napi/native_api.h"
#include <multimedia/player_framework/native_avscreen_capture_base.h>
#include <multimedia/player_framework/native_avscreen_capture_errors.h>

class AVScreenCapture {
private:
    void SetConfig(OH_AVScreenCaptureConfig &config);
    static void StopScreenCaptureRecording(struct OH_AVScreenCapture *capture);
    static void OnErrorSaveFile(OH_AVScreenCapture *capture, int32_t errorCode, void *userData);
    static void ReleaseAVScreenCapture(struct OH_AVScreenCapture *capture);
    static void OnStateChangeSaveFile(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureStateCode stateCode,
                                      void *userData);

public:
    OH_AVSCREEN_CAPTURE_ErrCode StartScreenCaptureToFile(int32_t outputFd, bool isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode SetMicrophoneEnabled(bool isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode StopScreenCaptureToFile();
    static napi_value SetStopCallbackToFile(napi_env env, napi_callback_info info);
    static napi_value SetStartCallbackToFile(napi_env env, napi_callback_info info);
    static void ThreadSafeCallJs(napi_env env, napi_value jsCb, void *context, void *data);
};

#endif // AVSCREEN_CAPTURE_RECORD
