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

// [Start full_audio_recorder]
// [Start full_video_recorder]
#include <cstdio>
#include <cstring>
#include <string>
#include <fcntl.h>
#include <unistd.h>

#include "napi/native_api.h"
// [Start include_avrecorder_h]
#include "multimedia/player_framework/avrecorder.h"
#include "multimedia/player_framework/avrecorder_base.h"
// [End include_avrecorder_h]
#include "multimedia/player_framework/native_avformat.h"
#include "multimedia/media_library/media_asset_change_request_capi.h"
#include "multimedia/media_library/media_access_helper_capi.h"
#include "multimedia/media_library/media_asset_capi.h"
#include "native_window/external_window.h"
#include "hilog/log.h"
#include <AbilityKit/ability_runtime/application_context.h>

static constexpr int32_t AUDIO_BITRATE = 112000;
static constexpr int32_t AUDIO_CHANNELS = 2;
static constexpr int32_t AUDIO_SAMPLE_RATE = 48000;
static constexpr int32_t VIDEO_BITRATE = 3000000;
static constexpr int32_t VIDEO_FRAME_WIDTH = 1920;
static constexpr int32_t VIDEO_FRAME_HEIGHT = 1080;
static constexpr int32_t VIDEO_FRAME_RATE = 30;
static constexpr int32_t CALLBACK_ARG_COUNT = 2;
static constexpr int32_t FILE_PERMISSIONS = 0777;

// [Start declare_avrecorder]
static OH_AVRecorder *g_recorder = nullptr;
// [End declare_avrecorder]
static int32_t g_outputFd = -1;

// [StartExclude full_audio_recorder]
// [StartExclude full_video_recorder]
static napi_threadsafe_function g_stateTsfn = nullptr;
static napi_threadsafe_function g_errorTsfn = nullptr;
static napi_ref g_stateCallbackRef = nullptr;
static napi_ref g_errorCallbackRef = nullptr;

struct StateChangeData {
    int32_t state;
    int32_t reason;
};

static void StateChangeCallJs(napi_env env, napi_value js_cb, void *context, void *data)
{
    StateChangeData *scData = static_cast<StateChangeData *>(data);
    napi_value argv[2];
    napi_create_int32(env, scData->state, &argv[0]);
    napi_create_int32(env, scData->reason, &argv[1]);
    napi_value undefined;
    napi_get_undefined(env, &undefined);
    napi_call_function(env, undefined, js_cb, CALLBACK_ARG_COUNT, argv, nullptr);
    delete scData;
}

struct ErrorData {
    int32_t errorCode;
    std::string errorMsg;
};

static void ErrorCallJs(napi_env env, napi_value js_cb, void *context, void *data)
{
    ErrorData *errData = static_cast<ErrorData *>(data);
    napi_value argv[2];
    napi_create_int32(env, errData->errorCode, &argv[0]);
    napi_create_string_utf8(env, errData->errorMsg.c_str(), NAPI_AUTO_LENGTH, &argv[1]);
    napi_value undefined;
    napi_get_undefined(env, &undefined);
    napi_call_function(env, undefined, js_cb, CALLBACK_ARG_COUNT, argv, nullptr);
    delete errData;
}
// [EndExclude full_audio_recorder]
// [EndExclude full_video_recorder]

// [Start define_onstatechange_callback]
static void OnStateChange(OH_AVRecorder *recorder, OH_AVRecorder_State state,
    OH_AVRecorder_StateChangeReason reason, void *userData)
{
    // [StartExclude full_audio_recorder]
    // [StartExclude full_video_recorder]
    // [StartExclude define_onstatechange_callback]
    OH_LOG_INFO(LOG_APP, "OnStateChange: state=%{public}d, reason=%{public}d", state, reason);
    StateChangeData *scData = new StateChangeData();
    scData->state = static_cast<int32_t>(state);
    scData->reason = static_cast<int32_t>(reason);
    napi_acquire_threadsafe_function(g_stateTsfn);
    napi_call_threadsafe_function(g_stateTsfn, scData, napi_tsfn_nonblocking);
    // [EndExclude define_onstatechange_callback]
    // [EndExclude full_audio_recorder]
    // [EndExclude full_video_recorder]
    
    (void)recorder;
    (void)userData;

    // 将reason转换为字符串表示。
    const char *reasonStr =
        (reason == OH_AVRecorder_StateChangeReason::AVRECORDER_USER) ? "USER" :
        (reason == OH_AVRecorder_StateChangeReason::AVRECORDER_BACKGROUND) ? "BACKGROUND" : "UNKNOWN";

    if (state == OH_AVRecorder_State::AVRECORDER_IDLE) {
        OH_LOG_INFO(LOG_APP, "==NDKDemo== Recorder OnStateChange IDLE, reason: %{public}s", reasonStr);
        // 处理状态变更。
    }
}
// [End define_onstatechange_callback]

// [Start define_onerror_callback]
static void OnError(OH_AVRecorder *recorder, int32_t errorCode, const char *errorMsg, void *userData)
{
    // [StartExclude full_audio_recorder]
    // [StartExclude full_video_recorder]
    // [StartExclude define_onerror_callback]
    OH_LOG_ERROR(LOG_APP, "OnError: errorCode=%{public}d, errorMsg=%{public}s", errorCode, errorMsg);
    ErrorData *errData = new ErrorData();
    errData->errorCode = errorCode;
    errData->errorMsg = errorMsg ? errorMsg : "";
    napi_acquire_threadsafe_function(g_errorTsfn);
    napi_call_threadsafe_function(g_errorTsfn, errData, napi_tsfn_nonblocking);
    // [EndExclude define_onerror_callback]
    // [EndExclude full_audio_recorder]
    // [EndExclude full_video_recorder]
    
    (void)recorder;
    (void)userData;
    OH_LOG_ERROR(LOG_APP, "==NDKDemo== Recorder OnError errorCode: %{public}d, error message: %{public}s",
                 errorCode, errorMsg);
}
// [End define_onerror_callback]

// [Start define_onuri_callback]
void OnUri(OH_AVRecorder *recorder, OH_MediaAsset *asset, void *userData)
{
    (void)recorder;
    (void)userData;
    OH_LOG_INFO(LOG_APP, "==NDKDemo== OnUri in!");
    if (asset != nullptr) {
        auto changeRequest = OH_MediaAssetChangeRequest_Create(asset);
        if (changeRequest == nullptr) {
            OH_LOG_ERROR(LOG_APP, "==NDKDemo== changeRequest is null!");
            return;
        }
        MediaLibrary_ImageFileType imageFileType = MEDIA_LIBRARY_IMAGE_JPEG; // 待媒体库提供可用的VIDEO接口。
        uint32_t result = OH_MediaAssetChangeRequest_SaveCameraPhoto(changeRequest, imageFileType);
        OH_LOG_INFO(LOG_APP, "result of OH_MediaAssetChangeRequest_SaveCameraPhoto: %d", result);

        uint32_t resultChange = OH_MediaAccessHelper_ApplyChanges(changeRequest);
        OH_LOG_INFO(LOG_APP, "result of OH_MediaAccessHelper_ApplyChanges: %d", resultChange);

        OH_MediaAsset_Release(asset);
        OH_MediaAssetChangeRequest_Release(changeRequest);
    } else {
        OH_LOG_ERROR(LOG_APP, "Received null media asset!");
    }
    OH_LOG_INFO(LOG_APP, "==NDKDemo== OnUri out!");
}
// [End define_onuri_callback]

static napi_value CreateRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "CreateRecorder called");
    if (g_recorder != nullptr) {
        OH_AVRecorder_Release(g_recorder);
        g_recorder = nullptr;
    }
    // [Start create_avrecorder]
    g_recorder = OH_AVRecorder_Create();
    // [End create_avrecorder]
    if (g_recorder == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to create recorder");
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "CreateRecorder succeeded");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value SetRecorderStateCallback(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SetRecorderStateCallback called");
    // [StartExclude full_audio_recorder]
    // [StartExclude full_video_recorder]
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype type;
    napi_typeof(env, args[0], &type);
    if (type != napi_function) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }

    if (g_stateCallbackRef != nullptr) {
        napi_delete_reference(env, g_stateCallbackRef);
        g_stateCallbackRef = nullptr;
    }
    napi_create_reference(env, args[0], 1, &g_stateCallbackRef);

    napi_value work_name;
    napi_create_string_utf8(env, "AVRecorderStateCallback", NAPI_AUTO_LENGTH, &work_name);

    if (g_stateTsfn != nullptr) {
        napi_release_threadsafe_function(g_stateTsfn, napi_tsfn_release);
        g_stateTsfn = nullptr;
    }
    napi_create_threadsafe_function(env, args[0], nullptr, work_name, 0, 1, nullptr, nullptr, nullptr,
        StateChangeCallJs, &g_stateTsfn);
    // [EndExclude full_audio_recorder]
    // [EndExclude full_video_recorder]

    // [Start set_onstatechange_callback]
    // 设置状态回调。
    OH_AVRecorder_SetStateCallback(g_recorder, OnStateChange, nullptr);
    // [End set_onstatechange_callback]

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value SetRecorderErrorCallback(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SetRecorderErrorCallback called");
    // [StartExclude full_audio_recorder]
    // [StartExclude full_video_recorder]
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype type;
    napi_typeof(env, args[0], &type);
    if (type != napi_function) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }

    if (g_errorCallbackRef != nullptr) {
        napi_delete_reference(env, g_errorCallbackRef);
        g_errorCallbackRef = nullptr;
    }
    napi_create_reference(env, args[0], 1, &g_errorCallbackRef);

    napi_value work_name;
    napi_create_string_utf8(env, "AVRecorderErrorCallback", NAPI_AUTO_LENGTH, &work_name);

    if (g_errorTsfn != nullptr) {
        napi_release_threadsafe_function(g_errorTsfn, napi_tsfn_release);
        g_errorTsfn = nullptr;
    }
    napi_create_threadsafe_function(env, args[0], nullptr, work_name, 0, 1, nullptr, nullptr, nullptr,
        ErrorCallJs, &g_errorTsfn);
    // [EndExclude full_audio_recorder]
    // [EndExclude full_video_recorder]

    // [Start set_onerror_callback]
    // 设置错误回调。
    OH_AVRecorder_SetErrorCallback(g_recorder, OnError, nullptr);
    // [End set_onerror_callback]

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value SetRecorderUriCallback(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SetRecorderUriCallback called");
    // [Start set_onuri_callback]
    // 设置生成媒体文件回调（fileGenerationMode选择AUTO_CREATE时设置）。
    OH_AVRecorder_SetUriCallback(g_recorder, OnUri, nullptr);
    // [End set_onuri_callback]
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

// [StartExclude full_video_recorder]
// [Start prepare_audio_recorder]
static napi_value PrepareAudioRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "PrepareAudioRecorder called");
    
    OH_AVRecorder_Config config;
    memset(&config, 0, sizeof(config));
    config.audioSourceType = AVRECORDER_MIC;
    config.profile.audioBitrate = AUDIO_BITRATE; // 112000
    config.profile.audioChannels = AUDIO_CHANNELS; // 2
    config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
    config.profile.audioSampleRate = AUDIO_SAMPLE_RATE; // 48000
    config.profile.fileFormat = AVRECORDER_CFT_MPEG_4A;
    config.videoSourceType = AVRECORDER_SURFACE_YUV;
    config.fileGenerationMode = AVRECORDER_APP_CREATE;

    // 获取沙箱路径
    char fileDirPath[1000] = {0};
    int32_t bufferSize = 1000;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(fileDirPath, bufferSize, &writeLength);
    if (errCode != AbilityRuntime_ErrorCode::ABILITY_RUNTIME_ERROR_CODE_NO_ERROR || writeLength <= 0) {
        OH_LOG_ERROR(LOG_APP, "==NDKDemo== GetFilesDir failed, errCode: %{public}d", errCode);
        napi_value res;
        napi_create_int32(env, -1, &res);
        return res;
    }
    const std::string avrecorderRoot = fileDirPath;
    g_outputFd = open((avrecorderRoot + "/audio_example.m4a").c_str(), O_RDWR | O_CREAT, FILE_PERMISSIONS);
    std::string fileUrl = "fd://" + std::to_string(g_outputFd);
    config.url = const_cast<char *>(fileUrl.c_str());
    OH_LOG_INFO(LOG_APP, "config.url is: %s", config.url);

    OH_AVErrCode err = OH_AVRecorder_Prepare(g_recorder, &config);
    if (err != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Failed to prepare audio recorder, error: %{public}d", err);
    }
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}
// [End prepare_audio_recorder]
// [EndExclude full_video_recorder]

// [StartExclude full_audio_recorder]
// [Start prepare_video_recorder]
static napi_value PrepareVideoRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "PrepareVideoRecorder called");

    OH_AVRecorder_Config config;
    memset(&config, 0, sizeof(config));

    config.audioSourceType = AVRECORDER_MIC;
    config.profile.audioBitrate = AUDIO_BITRATE; // 112000
    config.profile.audioChannels = AUDIO_CHANNELS; // 2
    config.profile.audioCodec = AVRECORDER_AUDIO_AAC;
    config.profile.audioSampleRate = AUDIO_SAMPLE_RATE; // 48000
    config.videoSourceType = AVRECORDER_SURFACE_YUV;
    config.profile.videoBitrate = VIDEO_BITRATE; // 3000000
    config.profile.videoCodec = AVRECORDER_VIDEO_AVC;
    config.profile.videoFrameWidth = VIDEO_FRAME_WIDTH; // 1920
    config.profile.videoFrameHeight = VIDEO_FRAME_HEIGHT; // 1080
    config.profile.videoFrameRate = VIDEO_FRAME_RATE; // 30
    config.profile.isHdr = false;
    config.profile.enableTemporalScale = false;
    config.profile.fileFormat = AVRECORDER_CFT_MPEG_4;
    config.fileGenerationMode = AVRECORDER_APP_CREATE;
    config.metadata.videoOrientation = const_cast<char *>("90");

    // 获取沙箱路径
    char fileDirPath[1000] = {0};
    int32_t bufferSize = 1000;
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(fileDirPath, bufferSize, &writeLength);
    if (errCode != AbilityRuntime_ErrorCode::ABILITY_RUNTIME_ERROR_CODE_NO_ERROR || writeLength <= 0) {
        OH_LOG_ERROR(LOG_APP, "==NDKDemo== GetFilesDir failed, errCode: %{public}d", errCode);
        napi_value res;
        napi_create_int32(env, -1, &res);
        return res;
    }
    const std::string avrecorderRoot = fileDirPath;
    g_outputFd = open((avrecorderRoot + "/video_example.mp4").c_str(), O_RDWR | O_CREAT, FILE_PERMISSIONS);
    std::string fileUrl = "fd://" + std::to_string(g_outputFd);
    config.url = const_cast<char *>(fileUrl.c_str());
    OH_LOG_INFO(LOG_APP, "config.url is: %s", config.url);

    OH_AVErrCode err = OH_AVRecorder_Prepare(g_recorder, &config);
    if (err != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Failed to prepare video recorder, error: %{public}d", err);
    }
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}
// [End prepare_video_recorder]

// [Start get_input_surface_id]
static std::string GetSurfaceIdString()
{
    OHNativeWindow *window = nullptr;
    OH_AVErrCode err = OH_AVRecorder_GetInputSurface(g_recorder, &window);
    if (err != AV_ERR_OK || window == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to get input surface, error: %{public}d", err);
        return "";
    }
    uint64_t surfaceId = 0;
    int32_t nErr = OH_NativeWindow_GetSurfaceId(window, &surfaceId);
    if (nErr != 0) {
        OH_LOG_ERROR(LOG_APP, "Failed to get surface ID from native window, error: %{public}d", nErr);
        return "";
    }
    char surfaceIdStr[32] = {0};
    int32_t snprintfRet = snprintf(surfaceIdStr, sizeof(surfaceIdStr), "%lu", surfaceId);
    if (snprintfRet < 0) {
        OH_LOG_ERROR(LOG_APP, "snprintf failed");
        return "";
    }
    OH_LOG_INFO(LOG_APP, "Input surface ID: %{public}s", surfaceIdStr);
    return surfaceIdStr;
}
// [End get_input_surface_id]

static napi_value GetInputSurfaceId(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "GetInputSurfaceId called");
    std::string surfaceId = GetSurfaceIdString();
    napi_value result;
    napi_create_string_utf8(env, surfaceId.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}
// [EndExclude full_audio_recorder]

static napi_value StartRecorder(napi_env env, napi_callback_info info)
{
    // [Start start_recorder]
    OH_AVErrCode err = OH_AVRecorder_Start(g_recorder);
    // [End start_recorder]
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}

static napi_value PauseRecorder(napi_env env, napi_callback_info info)
{
    // [Start pause_recorder]
    OH_AVErrCode err = OH_AVRecorder_Pause(g_recorder);
    // [End pause_recorder]
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}

static napi_value ResumeRecorder(napi_env env, napi_callback_info info)
{
    // [Start resume_recorder]
    OH_AVErrCode err = OH_AVRecorder_Resume(g_recorder);
    // [End resume_recorder]
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}

static napi_value StopRecorder(napi_env env, napi_callback_info info)
{
    // [Start stop_recorder]
    OH_AVErrCode err = OH_AVRecorder_Stop(g_recorder);
    // [End stop_recorder]
    if (g_outputFd > 0) {
        close(g_outputFd);
        g_outputFd = -1;
    }
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}

static napi_value ResetRecorder(napi_env env, napi_callback_info info)
{
    // [Start reset_recorder]
    OH_AVErrCode err = OH_AVRecorder_Reset(g_recorder);
    // [End reset_recorder]
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(err), &result);
    return result;
}

static napi_value ReleaseRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "ReleaseRecorder called");
    // [StartExclude full_audio_recorder]
    // [StartExclude full_video_recorder]
    if (g_stateTsfn != nullptr) {
        napi_release_threadsafe_function(g_stateTsfn, napi_tsfn_release);
        g_stateTsfn = nullptr;
    }
    if (g_errorTsfn != nullptr) {
        napi_release_threadsafe_function(g_errorTsfn, napi_tsfn_release);
        g_errorTsfn = nullptr;
    }
    if (g_stateCallbackRef != nullptr) {
        napi_delete_reference(env, g_stateCallbackRef);
        g_stateCallbackRef = nullptr;
    }
    if (g_errorCallbackRef != nullptr) {
        napi_delete_reference(env, g_errorCallbackRef);
        g_errorCallbackRef = nullptr;
    }
    // [EndExclude full_audio_recorder]
    // [EndExclude full_video_recorder]
    if (g_recorder != nullptr) {
        // [Start release_recorder]
        OH_AVRecorder_Release(g_recorder);
        // [End release_recorder]
        g_recorder = nullptr;
    }
    if (g_outputFd > 0) {
        close(g_outputFd);
        g_outputFd = -1;
    }
    OH_LOG_INFO(LOG_APP, "ReleaseRecorder succeeded");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
// [End full_audio_recorder]
// [End full_video_recorder]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createRecorder", nullptr, CreateRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setRecorderStateCallback", nullptr,
         SetRecorderStateCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setRecorderErrorCallback", nullptr,
         SetRecorderErrorCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setRecorderUriCallback", nullptr,
         SetRecorderUriCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prepareAudioRecorder", nullptr,
         PrepareAudioRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prepareVideoRecorder", nullptr,
         PrepareVideoRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getInputSurfaceId", nullptr, GetInputSurfaceId,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startRecorder", nullptr, StartRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pauseRecorder", nullptr, PauseRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resumeRecorder", nullptr, ResumeRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stopRecorder", nullptr, StopRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetRecorder", nullptr, ResetRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseRecorder", nullptr, ReleaseRecorder,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
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
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
