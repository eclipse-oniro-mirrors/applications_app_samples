/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

// Stub implementations for noise reduction mode change callback APIs.
// The SDK header declares these APIs as @since 26.1.0, but the bundled
// stub library does not yet export these symbols. This file provides
// link-time stubs so the demo compiles; at runtime the real
// implementation comes from the device's libohaudio.so.
// Remove this file once the SDK stub library includes these symbols.

#include "ohaudio/native_audiocapturer.h"
#include "ohaudio/native_audio_common.h"
#include "hilog/log.h"

#define STUB_LOG_TAG "NR_STUB"
#define STUB_GLOBAL_RES 0xFF01

OH_AudioStream_Result OH_AudioCapturer_RegisterNoiseReductionModeChangeCallback(
    OH_AudioCapturer *capturer,
    OH_AudioCapturer_OnNoiseReductionModeChangeCallback callback,
    void *userData)
{
    (void)capturer;
    (void)callback;
    (void)userData;
    OH_LOG_Print(LOG_APP, LOG_WARN, STUB_GLOBAL_RES, STUB_LOG_TAG,
                 "RegisterNoiseReductionModeChangeCallback: using stub, no real callback registered");
    return AUDIOSTREAM_SUCCESS;
}

OH_AudioStream_Result OH_AudioCapturer_UnregisterNoiseReductionModeChangeCallback(
    OH_AudioCapturer *capturer,
    OH_AudioCapturer_OnNoiseReductionModeChangeCallback callback)
{
    (void)capturer;
    (void)callback;
    OH_LOG_Print(LOG_APP, LOG_WARN, STUB_GLOBAL_RES, STUB_LOG_TAG,
                 "UnregisterNoiseReductionModeChangeCallback: using stub, no real callback unregistered");
    return AUDIOSTREAM_SUCCESS;
}
