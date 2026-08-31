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

#include "PlayerNapiSerializer.h"

namespace {
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

bool SetStateValue(napi_env env, napi_value stateObject, const char *name, PlayerState state)
{
    napi_value value = nullptr;
    return napi_create_int32(env, static_cast<int32_t>(state), &value) == napi_ok &&
        napi_set_named_property(env, stateObject, name, value) == napi_ok;
}
} // namespace

bool PlayerNapiSerializer::CreatePlaybackResult(napi_env env, bool success,
    PlaybackCompletionReason reason, bool structuredResult, napi_value &result)
{
    if (!structuredResult) {
        return napi_get_boolean(env, success, &result) == napi_ok;
    }
    napi_value successValue = nullptr;
    napi_value reasonValue = nullptr;
    return napi_create_object(env, &result) == napi_ok &&
        napi_get_boolean(env, success, &successValue) == napi_ok &&
        napi_create_string_utf8(env, GetCompletionReasonName(reason), NAPI_AUTO_LENGTH, &reasonValue) == napi_ok &&
        napi_set_named_property(env, result, "success", successValue) == napi_ok &&
        napi_set_named_property(env, result, "reason", reasonValue) == napi_ok;
}

bool PlayerNapiSerializer::CreatePlaybackInfo(napi_env env, const PlaybackInfo &info, napi_value &result)
{
    return napi_create_object(env, &result) == napi_ok && PopulatePlaybackInfo(env, result, info);
}

bool PlayerNapiSerializer::CreateMediaInfo(napi_env env, const MediaInfo &info, napi_value &result)
{
    return napi_create_object(env, &result) == napi_ok && PopulateMediaInfo(env, result, info);
}

bool PlayerNapiSerializer::ExportPlayerState(napi_env env, napi_value exports)
{
    napi_value stateObject = nullptr;
    if (napi_create_object(env, &stateObject) != napi_ok ||
        !SetStateValue(env, stateObject, "IDLE", PLAYER_STATE_IDLE) ||
        !SetStateValue(env, stateObject, "INITIALIZING", PLAYER_STATE_INITIALIZING) ||
        !SetStateValue(env, stateObject, "READY", PLAYER_STATE_READY) ||
        !SetStateValue(env, stateObject, "PLAYING", PLAYER_STATE_PLAYING) ||
        !SetStateValue(env, stateObject, "STOPPING", PLAYER_STATE_STOPPING) ||
        !SetStateValue(env, stateObject, "SEEKING", PLAYER_STATE_SEEKING) ||
        !SetStateValue(env, stateObject, "PAUSED", PLAYER_STATE_PAUSED)) {
        return false;
    }
    return napi_set_named_property(env, exports, "PlayerState", stateObject) == napi_ok;
}
