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

#include "TranscodeJob.h"
#include <algorithm>
#include <cmath>
#include <sys/stat.h>
#include <multimedia/player_framework/native_avcodec_base.h>

namespace {
constexpr int64_t TRACK_START_TOLERANCE_US = 100000;
constexpr int64_t MIN_DURATION_TOLERANCE_US = 250000;
constexpr int64_t US_PER_SECOND = 1000000;
}

void TranscodeJob::AddValidationNote(const std::string &note)
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.validationNotes.push_back(note);
}

void TranscodeJob::ValidateOutputMetadata(OH_AVFormat *format, int32_t type)
{
    if (type == MEDIA_TYPE_AUD) {
        for (const char *key : {OH_MD_KEY_AUD_SAMPLE_RATE, OH_MD_KEY_AUD_CHANNEL_COUNT}) {
            int32_t expected = 0;
            int32_t actual = 0;
            if (audioFormat_ == nullptr || !OH_AVFormat_GetIntValue(audioFormat_.get(), key, &expected)) { continue; }
            if (options_.audioMode == 1) {
                if (key == OH_MD_KEY_AUD_SAMPLE_RATE && options_.audioSampleRate > 0) {
                    expected = options_.audioSampleRate;
                }
                if (key == OH_MD_KEY_AUD_CHANNEL_COUNT && options_.audioChannels > 0) {
                    expected = options_.audioChannels;
                }
            }
            if (!OH_AVFormat_GetIntValue(format, key, &actual) || actual != expected) {
                AddValidationNote(std::string("Audio metadata differs or is unavailable: ") + key +
                    " expected=" + std::to_string(expected) + " actual=" + std::to_string(actual));
            }
        }
        return;
    }
    int32_t actualRotation = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_ROTATION, &actualRotation);
    if (actualRotation != rotation_) {
        AddValidationNote("Rotation differs: expected=" + std::to_string(rotation_) +
            " actual=" + std::to_string(actualRotation));
    }
    for (const char *key : {OH_MD_KEY_COLOR_PRIMARIES, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
        OH_MD_KEY_MATRIX_COEFFICIENTS, OH_MD_KEY_RANGE_FLAG}) {
        int32_t expected = 0;
        int32_t actual = 0;
        if (OH_AVFormat_GetIntValue(videoFormat_.get(), key, &expected) &&
            (!OH_AVFormat_GetIntValue(format, key, &actual) || expected != actual)) {
            AddValidationNote(std::string("Color metadata differs or is unavailable: ") + key);
        }
    }
}

bool TranscodeJob::ValidateOutputTrack(OH_AVFormat *format, int32_t type)
{
    const char *mime = nullptr;
    if (!OH_AVFormat_GetStringValue(format, OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr) { return false; }
    if (type == MEDIA_TYPE_VID) {
        int32_t width = 0;
        int32_t height = 0;
        return OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &width) &&
            OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &height) &&
            width == targetWidth_ && height == targetHeight_ && options_.mime == mime;
    }
    const char *expected = nullptr;
    if (audioFormat_ == nullptr) { return false; }
    if (options_.audioMode == 1) { return std::string(mime) == OH_AVCODEC_MIMETYPE_AUDIO_AAC; }
    return OH_AVFormat_GetStringValue(audioFormat_.get(), OH_MD_KEY_CODEC_MIME, &expected) &&
        expected != nullptr && std::string(mime) == expected;
}

bool TranscodeJob::ValidateOutputTracks(OH_AVSource *source, int32_t count, int32_t expectedTracks)
{
    int32_t videos = 0;
    int32_t audios = 0;
    int64_t videoStart = 0;
    int64_t audioStart = 0;
    bool hasVideoStart = false;
    bool hasAudioStart = false;
    for (int32_t index = 0; index < count; ++index) {
        if (cancelled_.load()) { return false; }
        std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> track(
            OH_AVSource_GetTrackFormat(source, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type) ||
            (type != MEDIA_TYPE_VID && type != MEDIA_TYPE_AUD) || !ValidateOutputTrack(track.get(), type)) {
            return Fail("Validate MP4 track MIME and video dimensions");
        }
        videos += type == MEDIA_TYPE_VID;
        audios += type == MEDIA_TYPE_AUD;
        ValidateOutputMetadata(track.get(), type);
        if (type == MEDIA_TYPE_VID) {
            hasVideoStart = OH_AVFormat_GetLongValue(track.get(), OH_MD_KEY_TRACK_START_TIME, &videoStart);
        } else {
            hasAudioStart = OH_AVFormat_GetLongValue(track.get(), OH_MD_KEY_TRACK_START_TIME, &audioStart);
        }
    }
    if (videos != 1 || audios != expectedTracks - 1) { return Fail("Validate MP4 media tracks"); }
    if (hasVideoStart && hasAudioStart &&
        std::abs(static_cast<double>(audioStart) - videoStart) > TRACK_START_TOLERANCE_US) {
        AddValidationNote("Audio/video track starts differ by more than 100 ms: videoUs=" +
            std::to_string(videoStart) + " audioUs=" + std::to_string(audioStart));
    }
    return true;
}

bool TranscodeJob::ValidateOutput()
{
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.stage = "validate";
        snapshot_.outputValidation = "checking";
    }
    struct stat file {};
    if (fstat(options_.outputFd, &file) != 0 || file.st_size <= 0) {
        return Fail("Validate output file size");
    }
    std::unique_ptr<OH_AVSource, decltype(&OH_AVSource_Destroy)> output(
        OH_AVSource_CreateWithFD(options_.outputFd, 0, file.st_size), OH_AVSource_Destroy);
    if (output == nullptr) {
        return Fail("Reopen finalized MP4 for validation");
    }
    Format description(OH_AVSource_GetSourceFormat(output.get()), OH_AVFormat_Destroy);
    int32_t count = 0;
    int64_t duration = 0;
    const int32_t expectedTracks = audioTrack_ >= 0 ? 2 : 1;
    if (description == nullptr || !OH_AVFormat_GetIntValue(description.get(), OH_MD_KEY_TRACK_COUNT, &count) ||
        !OH_AVFormat_GetLongValue(description.get(), OH_MD_KEY_DURATION, &duration) || duration <= 0 ||
        count != expectedTracks) {
        return Fail("Validate MP4 duration and track count");
    }
    if (!ValidateOutputTracks(output.get(), count, expectedTracks)) {
        return false;
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.outputDurationUs = duration;
    snapshot_.expectedDurationUs = selectedDurationUs_;
    const int64_t toleranceUs = std::max(MIN_DURATION_TOLERANCE_US,
        static_cast<int64_t>(2 * US_PER_SECOND / std::max(1.0, OutputFrameRate())));
    if (selectedDurationUs_ > 0 && std::abs(duration - selectedDurationUs_) > toleranceUs) {
        snapshot_.validationNotes.push_back("Duration differs: expectedUs=" + std::to_string(selectedDurationUs_) +
            " actualUs=" + std::to_string(duration) + " toleranceUs=" + std::to_string(toleranceUs));
    }
    snapshot_.outputValidation = snapshot_.validationNotes.empty() ? "passed" : "warning";
    return true;
}
