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

#include "RecorderOptionsParser.h"
#include <cmath>
#include <limits>
#include <type_traits>
#include <vector>
#include "multimedia/player_framework/native_avmuxer.h"

namespace {
constexpr int32_t CAMERA_RGBA_FORMAT = 3;
constexpr size_t MAX_OPTION_STRING_BYTES = 1024;
constexpr double MAX_SAFE_INTEGER = 9007199254740991.0;

bool Property(napi_env env, napi_value object, const char *key, napi_value &result)
{
    napi_valuetype type = napi_undefined;
    bool present = false;
    if (object == nullptr || napi_typeof(env, object, &type) != napi_ok || type != napi_object ||
        napi_has_named_property(env, object, key, &present) != napi_ok || !present ||
        napi_get_named_property(env, object, key, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    return true;
}

template<typename T>
bool Number(napi_env env, napi_value object, const char *key, T &result)
{
    napi_value item = nullptr;
    double number = 0;
    if (!Property(env, object, key, item)) {
        return false;
    }
    if (napi_get_value_double(env, item, &number) != napi_ok || !std::isfinite(number) ||
        number < static_cast<double>(std::numeric_limits<T>::lowest()) ||
        number > static_cast<double>(std::numeric_limits<T>::max()) ||
        (std::is_integral<T>::value && std::trunc(number) != number) ||
        (std::is_integral<T>::value && std::abs(number) > MAX_SAFE_INTEGER)) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    result = static_cast<T>(number);
    return true;
}

bool Boolean(napi_env env, napi_value object, const char *key, bool &result)
{
    napi_value item = nullptr;
    if (!Property(env, object, key, item)) {
        return false;
    }
    if (napi_get_value_bool(env, item, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    return true;
}

bool String(napi_env env, napi_value object, const char *key, std::string &result)
{
    napi_value item = nullptr;
    size_t length = 0;
    if (!Property(env, object, key, item)) {
        return false;
    }
    if (napi_get_value_string_utf8(env, item, nullptr, 0, &length) != napi_ok ||
        length >= MAX_OPTION_STRING_BYTES) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    std::vector<char> bytes(length + 1);
    if (napi_get_value_string_utf8(env, item, bytes.data(), bytes.size(), &length) != napi_ok) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    result.assign(bytes.data(), length);
    if (result.find('\0') != std::string::npos) {
        napi_throw_type_error(env, nullptr, key);
        return false;
    }
    return true;
}

bool Video(napi_env env, napi_value object, SampleInfo &info)
{
    int32_t pixelFormat = 0;
    bool hdr = false;
    bool sync = false;
    const bool parsed = String(env, object, "mime", info.video.videoCodecMime) &&
        String(env, object, "codecName", info.codec.codecName) &&
        Number(env, object, "width", info.video.videoWidth) &&
        Number(env, object, "height", info.video.videoHeight) &&
        Number(env, object, "frameRate", info.video.frameRate) &&
        Number(env, object, "bitrate", info.video.bitrate) &&
        Number(env, object, "pixelFormat", pixelFormat) &&
        Number(env, object, "bitrateMode", info.video.bitrateMode) &&
        Number(env, object, "iFrameInterval", info.video.iFrameInterval) &&
        Boolean(env, object, "hdrVivid", hdr) && Boolean(env, object, "synchronous", sync);
    info.video.pixelFormat = pixelFormat == CAMERA_RGBA_FORMAT ? AV_PIXEL_FORMAT_RGBA : AV_PIXEL_FORMAT_NV12;
    info.video.isHDRVivid = hdr ? 1 : 0;
    info.codec.codecSyncMode = sync ? 1 : 0;
    return parsed;
}

bool Audio(napi_env env, napi_value object, SampleInfo &info)
{
    return Number(env, object, "sampleRate", info.audio.audioSampleRate) &&
        Number(env, object, "channelCount", info.audio.audioChannelCount) &&
        Number(env, object, "bitrate", info.audio.audioBitRate) &&
        Number(env, object, "latencyMode", info.audio.audioLatencyMode);
}

bool Preprocess(napi_env env, napi_value object, SampleInfo &info)
{
    return Number(env, object, "mode", info.video.preprocMode) &&
        Number(env, object, "downsamplingWidth", info.video.downsamplingWidth) &&
        Number(env, object, "downsamplingHeight", info.video.downsamplingHeight) &&
        Number(env, object, "dropToFrameRate", info.video.dropToFrameRate) &&
        Number(env, object, "cropLeft", info.video.cropLeft) &&
        Number(env, object, "cropTop", info.video.cropTop) &&
        Number(env, object, "cropRight", info.video.cropRight) &&
        Number(env, object, "cropBottom", info.video.cropBottom);
}

bool Secondary(napi_env env, napi_value object, SampleInfo &info)
{
    return Boolean(env, object, "enabled", info.output.enableDualOutput) &&
        Number(env, object, "fd", info.output.secondaryOutputFd) &&
        Number(env, object, "width", info.output.secondaryVideoWidth) &&
        Number(env, object, "height", info.output.secondaryVideoHeight);
}

bool Dump(napi_env env, napi_value object, SampleInfo &info)
{
    return Boolean(env, object, "enabled", info.output.enableVideoDump) &&
        String(env, object, "primaryPath", info.output.videoDumpPath) &&
        String(env, object, "secondaryPath", info.output.secondaryVideoDumpPath) &&
        Number(env, object, "maxMiB", info.output.dumpMaxMiB) &&
        Number(env, object, "maxSeconds", info.output.dumpMaxSeconds);
}

constexpr int32_t MAX_AUDIO_CHANNELS = 2;
constexpr int32_t MAX_DUMP_MIB = 1024;
constexpr int32_t MAX_DUMP_SECONDS = 300;

bool ValidateMediaOptions(const SampleInfo &info)
{
    const auto &video = info.video;
    return video.videoWidth > 0 && video.videoHeight > 0 && video.frameRate > 0 && video.bitrate > 0 &&
        info.audio.audioSampleRate > 0 && info.audio.audioChannelCount >= 1 &&
        info.audio.audioChannelCount <= MAX_AUDIO_CHANNELS && info.audio.audioBitRate > 0 &&
        (video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_AVC ||
         video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
}

bool ValidateOutputOptions(const SampleInfo &info)
{
    const auto &output = info.output;
    return output.outputFd >= 0 && output.dumpMaxMiB >= 0 && output.dumpMaxMiB <= MAX_DUMP_MIB &&
        output.dumpMaxSeconds >= 0 && output.dumpMaxSeconds <= MAX_DUMP_SECONDS &&
        (output.outputFormat == AV_OUTPUT_FORMAT_MPEG_4 || output.outputFormat == AV_OUTPUT_FORMAT_FLV) &&
        (!output.enableDualOutput || (output.secondaryOutputFd >= 0 &&
         output.secondaryOutputFd != output.outputFd && output.secondaryVideoWidth > 0 &&
         output.secondaryVideoHeight > 0)) &&
        (!output.enableVideoDump || (!output.videoDumpPath.empty() &&
         (!output.enableDualOutput || !output.secondaryVideoDumpPath.empty())));
}

bool Validate(napi_env env, const SampleInfo &info)
{
    // 不在解析层猜测设备能力；这里只拦截无效值，具体组合仍由编码器能力查询和 Configure 校验。
    if (!ValidateMediaOptions(info) || !ValidateOutputOptions(info)) {
        napi_throw_range_error(env, nullptr, "Invalid recorder options");
        return false;
    }
    return true;
}
}

bool ParseRecorderOptions(napi_env env, napi_value options, SampleInfo &info)
{
    napi_value video = nullptr;
    napi_value audio = nullptr;
    napi_value preprocess = nullptr;
    napi_value secondary = nullptr;
    napi_value dump = nullptr;
    napi_value output = nullptr;
    if (!Property(env, options, "video", video) || !Property(env, options, "audio", audio) ||
        !Property(env, options, "preprocess", preprocess) || !Property(env, options, "secondary", secondary) ||
        !Property(env, options, "dump", dump) || !Property(env, options, "output", output) ||
        !Video(env, video, info) || !Audio(env, audio, info) || !Preprocess(env, preprocess, info) ||
        !Secondary(env, secondary, info) || !Dump(env, dump, info) ||
        !Number(env, output, "fd", info.output.outputFd) ||
        !Number(env, output, "format", info.output.outputFormat) || !Validate(env, info)) {
        return false;
    }
    info.video.hevcProfile = info.video.isHDRVivid ? HEVC_PROFILE_MAIN_10 :
        (info.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_AVC ? AVC_PROFILE_BASELINE : HEVC_PROFILE_MAIN);
    return true;
}
