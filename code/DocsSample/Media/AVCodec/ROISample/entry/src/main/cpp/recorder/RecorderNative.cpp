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

#include "RecorderNative.h"
#include <cstdint>
#include <native_window/external_window.h>
#include "Player.h"
#include "Recorder.h"
#include "CodecInfo.h"
#include "dfx/error/SampleError.h"
#include "SampleLog.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "recorder"

struct AsyncCallbackInfo {
    napi_env env;
    napi_async_work asyncWork;
    napi_deferred deferred;
    int32_t resultCode = 0;
    std::string surfaceId = "";
    SampleInfo sampleInfo;
    NativeCameraConfig cameraConfig;
    int32_t cameraPosition = CAMERA_POSITION_FRONT;
    Recorder *recorder = nullptr;
};

void DealCallBack(napi_env env, void *data)
{
    AsyncCallbackInfo *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    napi_value code;
    napi_create_int32(env, asyncCallbackInfo->resultCode, &code);
    napi_value surfaceId;
    napi_create_string_utf8(env, asyncCallbackInfo->surfaceId.data(), NAPI_AUTO_LENGTH, &surfaceId);
    napi_value obj;
    napi_create_object(env, &obj);

    napi_set_named_property(env, obj, "code", code);
    napi_set_named_property(env, obj, "surfaceId", surfaceId);
    napi_value cameraPosition;
    napi_create_int32(env, asyncCallbackInfo->cameraPosition, &cameraPosition);
    napi_set_named_property(env, obj, "cameraPosition", cameraPosition);
    napi_resolve_deferred(asyncCallbackInfo->env, asyncCallbackInfo->deferred, obj);
    if (asyncCallbackInfo->asyncWork != nullptr) {
        napi_delete_async_work(env, asyncCallbackInfo->asyncWork);
    }
    delete asyncCallbackInfo;
}

void SetCallBackResult(AsyncCallbackInfo *asyncCallbackInfo, int32_t code)
{
    asyncCallbackInfo->resultCode = code;
}

void SurfaceIdCallBack(AsyncCallbackInfo *asyncCallbackInfo, std::string surfaceId)
{
    asyncCallbackInfo->surfaceId = surfaceId;
}

void NativeInit(napi_env env, void *data)
{
    int32_t ret = SAMPLE_ERR_ERROR;
    AsyncCallbackInfo *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    if (asyncCallbackInfo->recorder) {
        ret = asyncCallbackInfo->recorder->Init(asyncCallbackInfo->sampleInfo);
    }
    if (ret != SAMPLE_ERR_OK) {
        SetCallBackResult(asyncCallbackInfo, -1);
    }

    uint64_t id = 0;
    ret = OH_NativeWindow_GetSurfaceId(asyncCallbackInfo->sampleInfo.videoInfo.window, &id);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "RenderThread",
                 "ljc nativeImageWindow_:%{public}p, nativeImageSurfaceId_%{public}lu.",
                 asyncCallbackInfo->sampleInfo.videoInfo.window, id);
    if (ret != SAMPLE_ERR_OK) {
        SetCallBackResult(asyncCallbackInfo, -1);
    }
    asyncCallbackInfo->surfaceId = std::to_string(id);
    SurfaceIdCallBack(asyncCallbackInfo, asyncCallbackInfo->surfaceId);
}

napi_value RecorderNative::CreateRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "enter CreateRecorderObject");

    napi_value result;
    auto recorder = new Recorder();
    int64_t addrValue = reinterpret_cast<int64_t>(recorder);
    napi_create_bigint_int64(env, addrValue, &result);
    OH_LOG_INFO(LOG_APP, "end CreateRecorderObject, addrValue:%{public}ld", addrValue);
    return result;
}

napi_value RecorderNative::ReleaseRecorder(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "enter ReleaseRecorder");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    if (recorder) {
        delete recorder;
        recorder = nullptr;
    }
    OH_LOG_INFO(LOG_APP, "end ReleaseRecorder");
    return nullptr;
}

napi_value RecorderNative::Init(napi_env env, napi_callback_info info)
{
    SampleInfo sampleInfo;
    size_t argc = NAPI_INIT_ARG_COUNT;
    napi_value args[NAPI_INIT_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    Recorder *recorder = ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]);
    ParseInitArgs(env, args, sampleInfo);
    FillAudioDefaults(sampleInfo);

    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    AsyncCallbackInfo *asyncCallbackInfo = new AsyncCallbackInfo();
    asyncCallbackInfo->env = env;
    asyncCallbackInfo->asyncWork = nullptr;
    asyncCallbackInfo->deferred = deferred;
    asyncCallbackInfo->resultCode = -1;
    asyncCallbackInfo->sampleInfo = sampleInfo;
    asyncCallbackInfo->recorder = recorder;

    napi_value resourceName;
    napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName,
        [](napi_env env, void *data) { NativeInit(env, data); },
        [](napi_env env, napi_status status, void *data) { DealCallBack(env, data); },
        static_cast<void *>(asyncCallbackInfo), &asyncCallbackInfo->asyncWork);
    napi_queue_async_work(env, asyncCallbackInfo->asyncWork);
    return promise;
}

Recorder *RecorderNative::ParseRecorderPtr(napi_env env, napi_value arg)
{
    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, arg, &addrValue, &flag);
    OH_LOG_INFO(LOG_APP, " Init, addrValue:%{public}ld", addrValue);
    return reinterpret_cast<Recorder *>(addrValue);
}

void RecorderNative::ParseInitArgs(napi_env env, napi_value *args, SampleInfo &sampleInfo)
{
    napi_get_value_int32(env, args[NAPI_SECOND_PARAM], &sampleInfo.fileInfo.outputFd);
    char videoCodecMime[NAPI_STRING_BUFFER_SIZE] = {0};
    size_t videoCodecMimeStrlen = 0;
    size_t len = NAPI_STRING_BUFFER_SIZE;
    napi_get_value_string_utf8(env, args[NAPI_THIRD_PARAM], videoCodecMime, len, &videoCodecMimeStrlen);
    napi_get_value_int32(env, args[NAPI_FOURTH_PARAM], &sampleInfo.videoInfo.videoWidth);
    napi_get_value_int32(env, args[NAPI_FIFTH_PARAM], &sampleInfo.videoInfo.videoHeight);
    napi_get_value_double(env, args[NAPI_SIXTH_PARAM], &sampleInfo.videoInfo.frameRate);
    napi_get_value_int32(env, args[NAPI_SEVENTH_PARAM], &sampleInfo.videoInfo.isHDRVivid);
    napi_get_value_int64(env, args[NAPI_EIGHTH_PARAM], &sampleInfo.videoInfo.bitrate);
    napi_get_value_int32(env, args[NAPI_NINTH_PARAM], &sampleInfo.audioInfo.isOpenEchoCancel);
    napi_get_value_int32(env, args[NAPI_TENTH_PARAM], &sampleInfo.fileInfo.roiFd);
    int32_t roiPathType = 0;
    napi_get_value_int32(env, args[NAPI_ELEVENTH_PARAM], &roiPathType);
    sampleInfo.videoInfo.roiPathType = static_cast<RoiPathType>(roiPathType);
    sampleInfo.videoInfo.videoCodecMime = videoCodecMime;

    if (sampleInfo.videoInfo.isHDRVivid) {
        sampleInfo.videoInfo.hevcProfile = HEVC_PROFILE_MAIN_10;
    }
}

void RecorderNative::FillAudioDefaults(SampleInfo &sampleInfo)
{
    sampleInfo.audioInfo.audioCodecMime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    sampleInfo.audioInfo.audioSampleForamt = OH_BitsPerSample::SAMPLE_S16LE;
    sampleInfo.audioInfo.audioSampleRate = AUDIO_SAMPLE_RATE;
    sampleInfo.audioInfo.audioChannelCount = AUDIO_CHANNEL_COUNT;
    sampleInfo.audioInfo.audioBitRate = AUDIO_BITRATE;
    sampleInfo.audioInfo.audioChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    sampleInfo.audioInfo.audioMaxInputSize = sampleInfo.audioInfo.audioSampleRate * AUDIO_FRAME_DURATION_SEC *
                                             sampleInfo.audioInfo.audioChannelCount * AUDIO_BYTES_PER_SAMPLE;
}

napi_value RecorderNative::Start(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    char previewSurfaceId[NAPI_STRING_BUFFER_SIZE] = {0};
    size_t previewSurfaceIdStrlen = 0;
    size_t len = NAPI_STRING_BUFFER_SIZE;
    napi_get_value_string_utf8(env, args[NAPI_SECOND_PARAM], previewSurfaceId, len, &previewSurfaceIdStrlen);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "Recoder", "previewSurfaceId:%{public}s.", previewSurfaceId);
    std::string id(previewSurfaceId);
    if (recorder) {
        recorder->Start(id);
    }
    return nullptr;
}

napi_value RecorderNative::SetPlayerAsLiveBgm(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    napi_get_value_bigint_int64(env, args[NAPI_SECOND_PARAM], &addrValue, &flag);
    Player *player = reinterpret_cast<Player *>(addrValue);
    if (recorder && player) {
        auto bgmQueue = recorder->GetBgmQueue();
        player->SetBgmQueue(bgmQueue);
    }
    return nullptr;
}

napi_value RecorderNative::UpdateInfoForCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    bool isFront = false;
    napi_get_value_bool(env, args[NAPI_SECOND_PARAM], &isFront);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "Recoder", "isFront :%{public}d.", isFront);
    if (recorder) {
        recorder->UpdateInfoForCamera(isFront);
    }
    return nullptr;
}

napi_value RecorderNative::UpdateCameraRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    int rotation = NativeXComponentSample::DEFAULT_CAMERA_ROTATION;
    napi_get_value_int32(env, args[NAPI_SECOND_PARAM], &rotation);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "Recoder", "fhmrotation :%{public}d.", rotation);
    if (recorder) {
        recorder->UpdateCameraRotation(rotation);
    }
    return nullptr;
}

void NativeStop(napi_env env, void *data)
{
    int32_t ret = SAMPLE_ERR_ERROR;
    AsyncCallbackInfo *asyncCallbackInfo = static_cast<AsyncCallbackInfo *>(data);
    if (asyncCallbackInfo && asyncCallbackInfo->recorder) {
        ret = asyncCallbackInfo->recorder->Stop();
    }
    SetCallBackResult(asyncCallbackInfo, ret);
}

napi_value RecorderNative::Stop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    AsyncCallbackInfo *asyncCallbackInfo = new AsyncCallbackInfo();

    asyncCallbackInfo->env = env;
    asyncCallbackInfo->asyncWork = nullptr;
    asyncCallbackInfo->deferred = deferred;
    asyncCallbackInfo->recorder = recorder;

    napi_value resourceName;
    napi_create_string_latin1(env, "recorder", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName,
        [](napi_env env, void *data) { NativeStop(env, data); },
        [](napi_env env, napi_status status, void *data) { DealCallBack(env, data); },
        static_cast<void *>(asyncCallbackInfo), &asyncCallbackInfo->asyncWork);
    napi_queue_async_work(env, asyncCallbackInfo->asyncWork);
    return promise;
}

napi_value RecorderNative::SetIsOpenROI(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t addrValue = 0;
    [[maybe_unused]] bool flag = false;
    napi_get_value_bigint_int64(env, args[NAPI_FIRST_PARAM], &addrValue, &flag);
    Recorder *recorder = reinterpret_cast<Recorder *>(addrValue);
    bool isOpenROI = false;
    napi_get_value_bool(env, args[NAPI_SECOND_PARAM], &isOpenROI);
    if (recorder) {
        recorder->SetIsOpenROI(isOpenROI);
    }
    return nullptr;
}

static void ExecuteCameraStart(napi_env, void *data)
{
    auto *context = static_cast<AsyncCallbackInfo *>(data);
    context->resultCode = context->recorder->GetNativeCamera().Start(context->cameraConfig);
    context->cameraPosition = context->recorder->GetNativeCamera().GetPosition();
}

static void ExecuteCameraStop(napi_env, void *data)
{
    auto *context = static_cast<AsyncCallbackInfo *>(data);
    context->resultCode = context->recorder->GetNativeCamera().Stop();
}

// Camera open/close can block; execute them on a worker. CameraController serializes these tasks.
static napi_value QueueCameraWork(napi_env env, AsyncCallbackInfo *context, bool start)
{
    napi_value promise;
    if (napi_create_promise(env, &context->deferred, &promise) != napi_ok) {
        delete context;
        napi_throw_error(env, nullptr, "Create camera promise failed");
        return nullptr;
    }
    context->env = env;
    napi_value name;
    napi_create_string_utf8(env, start ? "StartNativeCamera" : "StopNativeCamera", NAPI_AUTO_LENGTH, &name);
    napi_async_execute_callback execute = start ? ExecuteCameraStart : ExecuteCameraStop;
    napi_status status = napi_create_async_work(env, nullptr, name, execute,
        [](napi_env env, napi_status status, void *data) {
            auto *context = static_cast<AsyncCallbackInfo *>(data);
            if (status != napi_ok) {
                context->resultCode = CAMERA_SERVICE_FATAL_ERROR;
            }
            DealCallBack(env, data);
        }, context, &context->asyncWork);
    if (status == napi_ok) {
        status = napi_queue_async_work(env, context->asyncWork);
    }
    if (status != napi_ok) {
        context->resultCode = CAMERA_SERVICE_FATAL_ERROR;
        DealCallBack(env, context);
    }
    return promise;
}

napi_value RecorderNative::StartNativeCamera(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 7;
    size_t argc = ARG_COUNT;
    napi_value args[ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc != ARG_COUNT) {
        napi_throw_type_error(env, nullptr, "Expected recorder, surfaceId, width, height, fps, position and isHdr");
        return nullptr;
    }
    auto *context = new AsyncCallbackInfo();
    context->recorder = ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]);
    char surfaceId[NAPI_STRING_BUFFER_SIZE] = {0};
    size_t length = 0;
    int32_t position = CAMERA_POSITION_FRONT;
    bool valid = context->recorder != nullptr &&
        napi_get_value_string_utf8(env, args[NAPI_SECOND_PARAM], surfaceId, sizeof(surfaceId), &length) == napi_ok &&
        length > 0 && length < sizeof(surfaceId) - 1 &&
        napi_get_value_int32(env, args[NAPI_THIRD_PARAM], &context->cameraConfig.width) == napi_ok &&
        napi_get_value_int32(env, args[NAPI_FOURTH_PARAM], &context->cameraConfig.height) == napi_ok &&
        napi_get_value_int32(env, args[NAPI_FIFTH_PARAM], &context->cameraConfig.frameRate) == napi_ok &&
        napi_get_value_int32(env, args[NAPI_SIXTH_PARAM], &position) == napi_ok &&
        napi_get_value_bool(env, args[NAPI_SEVENTH_PARAM], &context->cameraConfig.isHdr) == napi_ok;
    if (!valid) {
        delete context;
        napi_throw_type_error(env, nullptr, "Invalid Native camera arguments");
        return nullptr;
    }
    context->cameraConfig.surfaceId = surfaceId;
    context->cameraConfig.position = static_cast<Camera_Position>(position);
    return QueueCameraWork(env, context, true);
}

napi_value RecorderNative::StopNativeCamera(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 1;
    size_t argc = ARG_COUNT;
    napi_value args[ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    auto *context = new AsyncCallbackInfo();
    context->recorder = argc == ARG_COUNT ? ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]) : nullptr;
    if (context->recorder == nullptr) {
        delete context;
        napi_throw_type_error(env, nullptr, "Invalid recorder");
        return nullptr;
    }
    return QueueCameraWork(env, context, false);
}

napi_value RecorderNative::RotateNativeCamera(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 3;
    size_t argc = ARG_COUNT;
    napi_value args[ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    Recorder *recorder = ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]);
    int32_t displayRotation = 0;
    bool locked = false;
    napi_get_value_int32(env, args[NAPI_SECOND_PARAM], &displayRotation);
    napi_get_value_bool(env, args[NAPI_THIRD_PARAM], &locked);
    int32_t rotation = recorder ? recorder->GetNativeCamera().UpdateRotation(displayRotation, locked) : -1;
    napi_value result;
    napi_create_int32(env, rotation, &result);
    return result;
}

napi_value RecorderNative::SetNativeCameraZoom(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 2;
    size_t argc = ARG_COUNT;
    napi_value args[ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    Recorder *recorder = ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]);
    double zoom = 1.0;
    if (recorder && napi_get_value_double(env, args[NAPI_SECOND_PARAM], &zoom) == napi_ok) {
        recorder->GetNativeCamera().SetZoomRatio(static_cast<float>(zoom));
    }
    return nullptr;
}

napi_value RecorderNative::GetNativeCameraZoom(napi_env env, napi_callback_info info)
{
    constexpr size_t ARG_COUNT = 1;
    size_t argc = ARG_COUNT;
    napi_value args[ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    Recorder *recorder = ParseRecorderPtr(env, args[NAPI_FIRST_PARAM]);
    napi_value result;
    napi_create_double(env, recorder ? recorder->GetNativeCamera().GetZoomRatio() : 1.0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor classProp[] = {
        {"startNativeCamera", nullptr, RecorderNative::StartNativeCamera, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"stopNativeCamera", nullptr, RecorderNative::StopNativeCamera, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"rotateNativeCamera", nullptr, RecorderNative::RotateNativeCamera, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setNativeCameraZoom", nullptr, RecorderNative::SetNativeCameraZoom, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getNativeCameraZoom", nullptr, RecorderNative::GetNativeCameraZoom, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"createRecorder", nullptr, RecorderNative::CreateRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseRecorder", nullptr, RecorderNative::ReleaseRecorder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initNative", nullptr, RecorderNative::Init, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"startNative", nullptr, RecorderNative::Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"updateInfoForCamera", nullptr, RecorderNative::UpdateInfoForCamera, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"UpdateCameraRotation", nullptr, RecorderNative::UpdateCameraRotation, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"stopNative", nullptr, RecorderNative::Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPlayerAsLiveBgm", nullptr, RecorderNative::SetPlayerAsLiveBgm, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setIsOpenROI", nullptr, RecorderNative::SetIsOpenROI, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_value RecorderNative = nullptr;
    const char *classBindName = "recorderNative";
    napi_define_class(env, classBindName, strlen(classBindName), nullptr, nullptr, 1, classProp, &RecorderNative);
    napi_define_properties(env, exports, sizeof(classProp) / sizeof(classProp[0]), classProp);
    return exports;
}
EXTERN_C_END

static napi_module RecorderModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "recorder",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterRecorderModule(void) { napi_module_register(&RecorderModule); }