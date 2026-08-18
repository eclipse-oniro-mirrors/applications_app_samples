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
    return ReadInt32Property(env, options, "inputFileFd", sampleInfo.source.inputFd) &&
        ReadInt64Property(env, options, "inputFileOffset", sampleInfo.source.inputFileOffset) &&
        ReadInt64Property(env, options, "inputFileSize", sampleInfo.source.inputFileSize) &&
        ReadInt32Property(env, options, "videoDecoderType", sampleInfo.codec.codecType) &&
        ReadInt32Property(env, options, "videoDecoderRunMode", sampleInfo.codec.codecRunMode) &&
        ReadInt32Property(env, options, "videoDecoderSyncMode", sampleInfo.codec.codecSyncMode) &&
        ReadBoolProperty(env, options, "isSmartFluencySupported", sampleInfo.codec.isSmartFluencySupported) &&
        ReadBoolProperty(env, options, "enableVideoDump", sampleInfo.output.enableVideoDump);
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

    sampleInfo.playback.playDoneCallback = &Callback;
    sampleInfo.playback.playDoneCallbackData = asyncContext.get();
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

bool SetInt32Property(napi_env env, napi_value object, const char *name, int32_t value)
{
    napi_value property = nullptr;
    return napi_create_int32(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, name, property) == napi_ok;
}

bool SetInt64Property(napi_env env, napi_value object, const char *name, int64_t value)
{
    napi_value property = nullptr;
    return napi_create_int64(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, name, property) == napi_ok;
}

bool SetDoubleProperty(napi_env env, napi_value object, const char *name, double value)
{
    napi_value property = nullptr;
    return napi_create_double(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, name, property) == napi_ok;
}

bool SetBoolProperty(napi_env env, napi_value object, const char *name, bool value)
{
    napi_value property = nullptr;
    return napi_get_boolean(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, name, property) == napi_ok;
}

bool SetStringProperty(napi_env env, napi_value object, const char *name, const std::string &value)
{
    napi_value property = nullptr;
    return napi_create_string_utf8(env, value.c_str(), value.length(), &property) == napi_ok &&
        napi_set_named_property(env, object, name, property) == napi_ok;
}

bool PopulatePlaybackInfo(napi_env env, napi_value object, const PlaybackInfo &info)
{
    return SetInt32Property(env, object, "state", static_cast<int32_t>(info.state)) &&
        SetDoubleProperty(env, object, "speed", info.speed) &&
        SetInt64Property(env, object, "durationUs", info.durationUs) &&
        SetInt64Property(env, object, "positionUs", info.positionUs) &&
        SetBoolProperty(env, object, "hasVideo", info.hasVideo) &&
        SetBoolProperty(env, object, "hasAudio", info.hasAudio) &&
        SetBoolProperty(env, object, "isSmartFluencyAvailable", info.smartFluencyAvailable) &&
        SetBoolProperty(env, object, "isHdrVividConfirmed", info.hdrVividConfirmed);
}

bool PopulateVideoMediaInfo(napi_env env, napi_value object, const MediaInfo &info)
{
    return SetStringProperty(env, object, "codecMime", info.videoCodecMime) &&
        SetInt32Property(env, object, "width", info.videoWidth) &&
        SetInt32Property(env, object, "height", info.videoHeight) &&
        SetDoubleProperty(env, object, "frameRate", info.frameRate) &&
        SetInt64Property(env, object, "bitrate", info.videoBitrate) &&
        SetInt32Property(env, object, "profile", info.codecProfile) &&
        SetInt32Property(env, object, "rotation", info.rotation) &&
        SetBoolProperty(env, object, "isHdrVividContainerSignaled", info.hdrVividContainerSignaled) &&
        SetBoolProperty(env, object, "isHdrVividConfirmed", info.hdrVividConfirmed);
}

bool PopulateAudioMediaInfo(napi_env env, napi_value object, const MediaInfo &info)
{
    return SetStringProperty(env, object, "codecMime", info.audioCodecMime) &&
        SetInt32Property(env, object, "sampleFormat", info.audioSampleFormat) &&
        SetInt32Property(env, object, "sampleRate", info.audioSampleRate) &&
        SetInt32Property(env, object, "channelCount", info.audioChannelCount) &&
        SetInt64Property(env, object, "channelLayout", info.audioChannelLayout) &&
        SetInt64Property(env, object, "bitrate", info.audioBitrate) &&
        SetInt32Property(env, object, "aacAdts", info.aacAdts) &&
        SetInt64Property(env, object, "codecConfigLength", info.codecConfigLength);
}

bool PopulateDecoderInfo(napi_env env, napi_value object, const MediaInfo &info)
{
    return SetInt32Property(env, object, "type", info.decoderType) &&
        SetInt32Property(env, object, "runMode", info.decoderRunMode) &&
        SetInt32Property(env, object, "syncMode", info.decoderSyncMode) &&
        SetBoolProperty(env, object, "videoDumpEnabled", info.videoDumpEnabled);
}

bool SetMediaSection(napi_env env, napi_value target, const char *name, const MediaInfo &info,
    bool (*populate)(napi_env, napi_value, const MediaInfo &))
{
    napi_value section = nullptr;
    return napi_create_object(env, &section) == napi_ok && populate(env, section, info) &&
        napi_set_named_property(env, target, name, section) == napi_ok;
}

bool CreateTrackInfo(napi_env env, const MediaTrackFormatInfo &trackInfo, napi_value &object)
{
    return napi_create_object(env, &object) == napi_ok &&
        SetInt32Property(env, object, "index", trackInfo.trackIndex) &&
        SetInt32Property(env, object, "type", trackInfo.trackType) &&
        SetStringProperty(env, object, "formatDump", trackInfo.formatDump);
}

bool SetTrackFormats(napi_env env, napi_value target, const std::vector<MediaTrackFormatInfo> &trackFormats)
{
    napi_value tracks = nullptr;
    if (napi_create_array_with_length(env, trackFormats.size(), &tracks) != napi_ok) {
        return false;
    }
    for (size_t index = 0; index < trackFormats.size(); index++) {
        napi_value track = nullptr;
        if (!CreateTrackInfo(env, trackFormats[index], track) ||
            napi_set_element(env, tracks, static_cast<uint32_t>(index), track) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, target, "tracks", tracks) == napi_ok;
}

bool PopulateMediaInfo(napi_env env, napi_value object, const MediaInfo &info)
{
    return SetBoolProperty(env, object, "available", info.available) &&
        SetInt64Property(env, object, "fileSize", info.fileSize) &&
        SetInt64Property(env, object, "durationUs", info.durationUs) &&
        SetInt32Property(env, object, "trackCount", info.trackCount) &&
        SetStringProperty(env, object, "sourceFormatDump", info.sourceFormatDump) &&
        SetMediaSection(env, object, "video", info, PopulateVideoMediaInfo) &&
        SetMediaSection(env, object, "audio", info, PopulateAudioMediaInfo) &&
        SetMediaSection(env, object, "decoder", info, PopulateDecoderInfo) &&
        SetTrackFormats(env, object, info.trackFormats);
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

    bool parsed = napi_get_value_int32(env, args[0], &sampleInfo.source.inputFd) == napi_ok &&
        napi_get_value_int64(env, args[1], &sampleInfo.source.inputFileOffset) == napi_ok &&
        napi_get_value_int64(env, args[2], &sampleInfo.source.inputFileSize) == napi_ok &&
        napi_get_value_int32(env, args[3], &sampleInfo.codec.codecType) == napi_ok &&
        napi_get_value_int32(env, args[4], &sampleInfo.codec.codecRunMode) == napi_ok &&
        napi_get_value_int32(env, args[5], &sampleInfo.codec.codecSyncMode) == napi_ok &&
        napi_get_value_bool(env, args[6], &sampleInfo.codec.isSmartFluencySupported) == napi_ok &&
        napi_get_value_bool(env, args[7], &sampleInfo.output.enableVideoDump) == napi_ok;
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

napi_value PlayerNative::GetPlaybackInfo(napi_env env, napi_callback_info info)
{
    (void)info;
    const PlaybackInfo playbackInfo = Player::GetInstance().GetPlaybackInfo();
    napi_value result = nullptr;
    if (napi_create_object(env, &result) != napi_ok || !PopulatePlaybackInfo(env, result, playbackInfo)) {
        napi_throw_error(env, nullptr, "Create playback info failed");
        return nullptr;
    }
    return result;
}

napi_value PlayerNative::GetMediaInfo(napi_env env, napi_callback_info info)
{
    (void)info;
    const MediaInfo mediaInfo = Player::GetInstance().GetMediaInfo();
    napi_value result = nullptr;
    if (napi_create_object(env, &result) != napi_ok || !PopulateMediaInfo(env, result, mediaInfo)) {
        napi_throw_error(env, nullptr, "Create media info failed");
        return nullptr;
    }
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
        {"getPlaybackInfo", nullptr, PlayerNative::GetPlaybackInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMediaInfo", nullptr, PlayerNative::GetMediaInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
