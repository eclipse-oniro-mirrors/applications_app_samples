/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "AVScreenCapture.h"
#include <js_native_api.h>
#include <multimedia/player_framework/native_avscreen_capture.h>
#include <multimedia/player_framework/native_avscreen_capture_errors.h>
#include <node_api.h>
#include <node_api_types.h>
#include <thread>
#include <string>

bool g_isRunning = false;
OH_AVScreenCapture *g_avScreenCapture;
napi_threadsafe_function g_startFn;
napi_threadsafe_function g_stopFn;

static void CallStartCallback()
{
    napi_acquire_threadsafe_function(g_startFn);
    napi_call_threadsafe_function(g_startFn, nullptr, napi_tsfn_nonblocking);
    napi_release_threadsafe_function(g_startFn, napi_tsfn_release);
    g_startFn = nullptr;
}

static void CallStopCallback()
{
    napi_acquire_threadsafe_function(g_stopFn);
    napi_call_threadsafe_function(g_stopFn, nullptr, napi_tsfn_nonblocking);
    napi_release_threadsafe_function(g_stopFn, napi_tsfn_release);
    g_stopFn = nullptr;
}

void AVScreenCapture::StopScreenCaptureRecording(struct OH_AVScreenCapture *capture)
{
    if (g_isRunning && capture != nullptr) {
        OH_AVScreenCapture_StopScreenRecording(capture);
        g_isRunning = false;
    }
}

void AVScreenCapture::OnErrorSaveFile(OH_AVScreenCapture *capture, int32_t errorCode, void *userData)
{
    (void)capture;
    (void)errorCode;
    (void)userData;
}

// [Start ReleaseAVScreenCapture]
void AVScreenCapture::ReleaseAVScreenCapture(struct OH_AVScreenCapture *capture)
{
    StopScreenCaptureRecording(capture);
    if (capture != nullptr) {
        OH_AVScreenCapture_Release(capture);
        g_isRunning = false;
        g_avScreenCapture = nullptr;
    }
}
// [End ReleaseAVScreenCapture]

void AVScreenCapture::OnStateChangeSaveFile(struct OH_AVScreenCapture *capture,
                                            OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    (void)capture;
    (void)userData;
    switch (stateCode) {
        case OH_SCREEN_CAPTURE_STATE_STARTED: {
            CallStartCallback();
            break;
        }
        case OH_SCREEN_CAPTURE_STATE_CANCELED: {
            std::thread releaseInstanceThread(ReleaseAVScreenCapture, capture);
            releaseInstanceThread.detach();
            CallStopCallback();
            break;
        }
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER: {
            std::thread releaseInstanceThread(ReleaseAVScreenCapture, capture);
            releaseInstanceThread.detach();
            CallStopCallback();
            break;
        }
        default:
            break;
    }
}

// [Start SetConfig]
void AVScreenCapture::SetConfig(OH_AVScreenCaptureConfig &config)
{
    OH_RecorderInfo recorderInfo;
    recorderInfo.fileFormat = OH_ContainerFormatType::CFT_MPEG_4A;
    OH_VideoCaptureInfo videoCapInfo = {
        .videoFrameWidth = 0, .videoFrameHeight = 0, .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA};
    OH_VideoEncInfo videoEncInfo = {
        .videoCodec = OH_VideoCodecFormat::OH_H264, .videoBitrate = 2000000, .videoFrameRate = 30};
    OH_VideoInfo videoInfo = {.videoCapInfo = videoCapInfo, .videoEncInfo = videoEncInfo};

    OH_AudioCaptureInfo micCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_MIC};
    OH_AudioCaptureInfo innerCapInfo = {
        .audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_ALL_PLAYBACK};
    OH_AudioEncInfo audioEncInfo = {
        .audioBitrate = 96000, .audioCodecformat = OH_AudioCodecFormat::OH_AAC_LC};
    OH_AudioInfo audioInfo = {.micCapInfo = micCapInfo, .innerCapInfo = innerCapInfo, .audioEncInfo = audioEncInfo};

    config.captureMode = OH_CAPTURE_HOME_SCREEN;
    config.dataType = OH_CAPTURE_FILE;
    config.audioInfo = audioInfo;
    config.videoInfo = videoInfo;
    config.recorderInfo = recorderInfo;
}
// [End SetConfig]

// [Start StopScreenCaptureToFile]
OH_AVSCREEN_CAPTURE_ErrCode AVScreenCapture::StopScreenCaptureToFile()
{
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;

    if (g_isRunning && g_avScreenCapture != nullptr) {
        result = OH_AVScreenCapture_StopScreenRecording(g_avScreenCapture);
        result = OH_AVScreenCapture_Release(g_avScreenCapture);
        g_isRunning = false;
        g_avScreenCapture = nullptr;
    }
    return result;
}
// [End StopScreenCaptureToFile]

OH_AVSCREEN_CAPTURE_ErrCode AVScreenCapture::SetMicrophoneEnabled(bool isMicrophone)
{
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    if (g_avScreenCapture != nullptr) {
        result = OH_AVScreenCapture_SetMicrophoneEnabled(g_avScreenCapture, isMicrophone);
    }
    return result;
}

// [Start StartScreenCaptureToFile]
OH_AVSCREEN_CAPTURE_ErrCode AVScreenCapture::StartScreenCaptureToFile(int32_t outputFd, bool isMicrophone)
{
    if (g_avScreenCapture != nullptr) {
        StopScreenCaptureRecording(g_avScreenCapture);
        OH_AVScreenCapture_Release(g_avScreenCapture);
    }
    g_avScreenCapture = OH_AVScreenCapture_Create();
    if (g_avScreenCapture == nullptr) {
        return AV_SCREEN_CAPTURE_ERR_INVALID_VAL;
    }
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    std::string fileUrl = "fd://" + std::to_string(outputFd);
    config_.recorderInfo.url = const_cast<char *>(fileUrl.c_str());

    OH_AVScreenCapture_SetMicrophoneEnabled(g_avScreenCapture, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(g_avScreenCapture, OnErrorSaveFile, nullptr);
    OH_AVScreenCapture_SetStateCallback(g_avScreenCapture, OnStateChangeSaveFile, nullptr);

    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(g_avScreenCapture, config_);
    if (result != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_AVScreenCapture_Release(g_avScreenCapture);
        return result;
    }

    result = OH_AVScreenCapture_StartScreenRecording(g_avScreenCapture);
    if (result != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_AVScreenCapture_Release(g_avScreenCapture);
        return result;
    }
    g_isRunning = true;
    return result;
}
// [End StartScreenCaptureToFile]

void AVScreenCapture::ThreadSafeCallJs(napi_env env, napi_value jsCb, void *context, void *data)
{
    if (env == nullptr) {
        return;
    }
    napi_value global;
    napi_get_global(env, &global);
    napi_value res;
    napi_call_function(env, global, jsCb, 0, nullptr, &res);
}

napi_value AVScreenCapture::SetStopCallbackToFile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "ThreadSafeSetStopFlag", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1, nullptr, nullptr, nullptr,
                                    ThreadSafeCallJs, &g_stopFn);
    return nullptr;
}

napi_value AVScreenCapture::SetStartCallbackToFile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "ThreadSafeSetStopFlag", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_threadsafe_function(env, args[0], nullptr, resourceName, 0, 1, nullptr, nullptr, nullptr,
                                    ThreadSafeCallJs, &g_startFn);
    return nullptr;
}
