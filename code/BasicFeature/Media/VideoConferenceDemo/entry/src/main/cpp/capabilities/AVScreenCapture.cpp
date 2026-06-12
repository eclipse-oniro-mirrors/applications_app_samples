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

#include "AVScreenCapture.h"
#include "hilog/log.h"
#include <js_native_api.h>
#include <multimedia/player_framework/native_avscreen_capture.h>
#include <multimedia/player_framework/native_avscreen_capture_errors.h>
#include <node_api.h>
#include <node_api_types.h>
#include <thread>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "MY_AVSCREENCAPTURE"

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
        OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture StopScreenCapture");
    }
}

/*
 * Screen recording Error callback
 */
void AVScreenCapture::OnErrorSaveFile(OH_AVScreenCapture *capture, int32_t errorCode, void *userData)
{
    (void)capture;
    OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture OnError errorCode is %{public}d", errorCode);
    (void)userData;
}

// [Start ReleaseAVScreenCapture]
void AVScreenCapture::ReleaseAVScreenCapture(struct OH_AVScreenCapture *capture)
{
    StopScreenCaptureRecording(capture);
    if (capture != nullptr) {
        OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture ReleaseSCInstanceWorker S");
        OH_AVScreenCapture_Release(capture);
        g_isRunning = false;
        g_avScreenCapture = nullptr;
    }
}
// [End ReleaseAVScreenCapture]

/*
 * Screen recording state change callback
 */
void AVScreenCapture::OnStateChangeSaveFile(struct OH_AVScreenCapture *capture,
                                            OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    (void)capture; (void)userData;
    switch (stateCode) {
        case OH_SCREEN_CAPTURE_STATE_STARTED: {
            CallStartCallback();
            OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_STARTED");
            break;
        }
        case OH_SCREEN_CAPTURE_STATE_CANCELED: {
            std::thread releaseInstanceThread(ReleaseAVScreenCapture, capture);
            releaseInstanceThread.detach();
            CallStopCallback();
            OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_CANCELED ");
            break;
        }
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_CALL:
            OH_LOG_INFO(LOG_APP,
                        "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_STOPPED_BY_CALL");
            break;
        case OH_SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE:
            OH_LOG_INFO(LOG_APP,
                        "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE");
            break;
        case OH_SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER:
            OH_LOG_INFO(LOG_APP,
                        "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER");
            break;
        case OH_SCREEN_CAPTURE_STATE_MIC_MUTED_BY_USER:
        case OH_SCREEN_CAPTURE_STATE_MIC_UNMUTED_BY_USER:
            OH_LOG_INFO(LOG_APP, "AVScreenCapture OnStateChange MIC %{public}d", static_cast<int>(stateCode));
            break;
        case OH_SCREEN_CAPTURE_STATE_ENTER_PRIVATE_SCENE:
        case OH_SCREEN_CAPTURE_STATE_EXIT_PRIVATE_SCENE:
            OH_LOG_INFO(LOG_APP, "AVScreenCapture OnStateChange PRIVATE %{public}d", static_cast<int>(stateCode));
            break;
        case OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER: {
            std::thread releaseInstanceThread(ReleaseAVScreenCapture, capture);
            releaseInstanceThread.detach();
            CallStopCallback();
            OH_LOG_INFO(LOG_APP,
                        "AVScreenCapture ScreenCapture OnStateChange OH_SCREEN_CAPTURE_STATE_STOPPED_BY_USER");
            break;
        }
        default:
            break;
    }
}

// [Start SetConfig]
// Configuration parameters
void AVScreenCapture::SetConfig(OH_AVScreenCaptureConfig &config)
{
    OH_RecorderInfo recorderInfo;
    recorderInfo.fileFormat = OH_ContainerFormatType::CFT_MPEG_4A;
    // Config VideoCaptureInfo
    OH_VideoCaptureInfo videoCapInfo = {
        .videoFrameWidth = 0, .videoFrameHeight = 0, .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA};
    // Config VideoEncInfo
    OH_VideoEncInfo videoEncInfo = {
        .videoCodec = OH_VideoCodecFormat::OH_H264, .videoBitrate = 2000000, .videoFrameRate = 30};
    // Config VideoInfo
    OH_VideoInfo videoInfo = {.videoCapInfo = videoCapInfo, .videoEncInfo = videoEncInfo};

    // Config Mic Capture Info
    OH_AudioCaptureInfo micCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_MIC};
    // Config inner Capture Info
    OH_AudioCaptureInfo innerCapInfo = {
        .audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_ALL_PLAYBACK};
    // Config Audio Encoder Info
    OH_AudioEncInfo audioEncInfo = {
        .audioBitrate = 96000, .audioCodecformat = OH_AudioCodecFormat::OH_AAC_LC};
    // Config Audio Info
    OH_AudioInfo audioInfo = {.micCapInfo = micCapInfo, .innerCapInfo = innerCapInfo, .audioEncInfo = audioEncInfo};

    config.captureMode = OH_CAPTURE_HOME_SCREEN; // screen capture mode
    config.dataType = OH_CAPTURE_FILE;           // data type
    config.audioInfo = audioInfo;                // audio info
    config.videoInfo = videoInfo;                // video info
    config.recorderInfo = recorderInfo;          // recorder info
}
// [End SetConfig]

// [Start StopScreenCaptureToFile]
OH_AVSCREEN_CAPTURE_ErrCode AVScreenCapture::StopScreenCaptureToFile()
{
    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;

    if (g_isRunning && g_avScreenCapture != nullptr) {
        OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture File Stop");
        result = OH_AVScreenCapture_StopScreenRecording(g_avScreenCapture);
        if (result != AV_SCREEN_CAPTURE_ERR_BASE) {
            OH_LOG_ERROR(LOG_APP,
                         "AVScreenCapture StopScreenCapture OH_AVScreenCapture_StopScreenRecording Result: %{public}d",
                         result);
        } else {
            OH_LOG_INFO(LOG_APP, "AVScreenCapture StopScreenCapture OH_AVScreenCapture_StopScreenRecording");
        }
        result = OH_AVScreenCapture_Release(g_avScreenCapture);
        if (result != AV_SCREEN_CAPTURE_ERR_BASE) {
            OH_LOG_ERROR(LOG_APP, "AVScreenCapture StopScreenCapture OH_AVScreenCapture_Release: %{public}d", result);
        } else {
            OH_LOG_INFO(LOG_APP, "AVScreenCapture OH_AVScreenCapture_Release success");
        }
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
        OH_LOG_ERROR(LOG_APP, "AVScreenCapture create screen capture failed");
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
        OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture OH_AVScreenCapture_Init failed %{public}d", result);
    }
    OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture OH_AVScreenCapture_Init succ %{public}d", result);

    result = OH_AVScreenCapture_StartScreenRecording(g_avScreenCapture);
    if (result != AV_SCREEN_CAPTURE_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture Started failed %{public}d", result);
        OH_AVScreenCapture_Release(g_avScreenCapture);
    }
    OH_LOG_INFO(LOG_APP, "AVScreenCapture ScreenCapture Started succ %{public}d", result);
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