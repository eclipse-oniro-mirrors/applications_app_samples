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

#include "../core/TranscodeJob.h"
#include "TranscodeSampleValidator.h"
#include <algorithm>
#include <cmath>
#include <utility>
#include <sys/stat.h>
#include "av_codec_sample_log.h"

namespace {
constexpr int64_t TRACK_START_TOLERANCE_US = 100000;
constexpr int64_t MIN_DURATION_TOLERANCE_US = 250000;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t US_PER_MS = 1000;
constexpr int64_t MIDPOINT_DIVISOR = 2;
}

void TranscodeJob::AddValidationNote(const std::string &note)
{
    AVCODEC_SAMPLE_LOGW("Transcode output validation: %{public}s", note.c_str());
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.validationNotes.push_back(note);
}

void TranscodeJob::ValidateOutputMetadata(OH_AVFormat *format, int32_t type, int32_t audioOrdinal)
{
    if (type == MEDIA_TYPE_AUD) {
        ValidateOutputAudioMetadata(format, audioOrdinal);
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

void TranscodeJob::ValidateOutputAudioMetadata(OH_AVFormat *format, int32_t audioOrdinal)
{
    OH_AVFormat *expectedAudio = audioFormat_.get();
    if (options_.remuxOnly && options_.remuxAllAudioTracks) {
        expectedAudio = audioOrdinal >= 0 && static_cast<size_t>(audioOrdinal) < remuxAudioFormats_.size() ?
            remuxAudioFormats_[audioOrdinal].get() : nullptr;
    }
    for (const char *key : {OH_MD_KEY_AUD_SAMPLE_RATE, OH_MD_KEY_AUD_CHANNEL_COUNT}) {
        int32_t expected = 0;
        int32_t actual = 0;
        if (expectedAudio == nullptr || !OH_AVFormat_GetIntValue(expectedAudio, key, &expected)) {
            continue;
        }
        if (options_.audioMode == 1 && !(options_.remuxOnly && options_.remuxAllAudioTracks)) {
            if (key == OH_MD_KEY_AUD_SAMPLE_RATE && options_.audioSampleRate > 0) {
                expected = options_.audioSampleRate;
            }
            if (key == OH_MD_KEY_AUD_CHANNEL_COUNT && options_.audioOutputChannels > 0) {
                expected = options_.audioOutputChannels;
            }
        }
        if (!OH_AVFormat_GetIntValue(format, key, &actual) || actual != expected) {
            AddValidationNote(std::string("Audio metadata differs or is unavailable: ") + key +
                " expected=" + std::to_string(expected) + " actual=" + std::to_string(actual));
        }
    }
}

bool TranscodeJob::ValidateOutputTrack(OH_AVFormat *format, int32_t type, int32_t audioOrdinal)
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
    if (options_.remuxOnly && options_.remuxAllAudioTracks) {
        if (audioOrdinal < 0 || static_cast<size_t>(audioOrdinal) >= remuxAudioFormats_.size()) { return false; }
        const char *expected = nullptr;
        return remuxAudioFormats_[audioOrdinal] != nullptr &&
            OH_AVFormat_GetStringValue(remuxAudioFormats_[audioOrdinal].get(), OH_MD_KEY_CODEC_MIME, &expected) &&
            expected != nullptr && std::string(mime) == expected;
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
    bool hasVideoStart = false;
    int32_t audioOrdinal = 0;
    std::vector<std::pair<int32_t, int64_t>> audioStarts;
    for (int32_t index = 0; index < count; ++index) {
        if (cancelled_.load()) { return false; }
        std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> track(
            OH_AVSource_GetTrackFormat(source, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type) ||
            (type != MEDIA_TYPE_VID && type != MEDIA_TYPE_AUD) ||
            !ValidateOutputTrack(track.get(), type, type == MEDIA_TYPE_AUD ? audioOrdinal : -1)) {
            return Fail("Validate MP4 track MIME and video dimensions");
        }
        const int32_t currentAudioOrdinal = type == MEDIA_TYPE_AUD ? audioOrdinal++ : -1;
        videos += type == MEDIA_TYPE_VID;
        audios += type == MEDIA_TYPE_AUD;
        ValidateOutputMetadata(track.get(), type, currentAudioOrdinal);
        if (type == MEDIA_TYPE_VID) {
            hasVideoStart = OH_AVFormat_GetLongValue(track.get(), OH_MD_KEY_TRACK_START_TIME, &videoStart);
        } else {
            int64_t audioStart = 0;
            if (OH_AVFormat_GetLongValue(track.get(), OH_MD_KEY_TRACK_START_TIME, &audioStart)) {
                audioStarts.emplace_back(currentAudioOrdinal, audioStart);
            }
        }
    }
    if (videos != 1 || audios != expectedTracks - 1) { return Fail("Validate MP4 media tracks"); }
    if (hasVideoStart) {
        for (const auto &audioStart : audioStarts) {
            if (std::abs(static_cast<double>(audioStart.second) - videoStart) > TRACK_START_TOLERANCE_US) {
                AddValidationNote("Audio/video track starts differ by more than 100 ms: audioTrack=" +
                    std::to_string(audioStart.first) + " videoUs=" + std::to_string(videoStart) +
                    " audioUs=" + std::to_string(audioStart.second));
            }
        }
    }
    return true;
}

bool TranscodeJob::ReadOutputDescription(OH_AVSource *output, int32_t &count, int64_t &duration)
{
    Format description(OH_AVSource_GetSourceFormat(output), OH_AVFormat_Destroy);
    const int32_t expectedAudioTracks = options_.remuxOnly && options_.remuxAllAudioTracks ?
        static_cast<int32_t>(remuxAudioFormats_.size()) : (audioTrack_ >= 0 ? 1 : 0);
    const int32_t expectedTracks = 1 + expectedAudioTracks;
    if (description == nullptr || !OH_AVFormat_GetIntValue(description.get(), OH_MD_KEY_TRACK_COUNT, &count) ||
        !OH_AVFormat_GetLongValue(description.get(), OH_MD_KEY_DURATION, &duration) || duration <= 0 ||
        count != expectedTracks) {
        return Fail("Validate MP4 duration and track count");
    }
    return ValidateOutputTracks(output, count, expectedTracks);
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
    int32_t count = 0;
    int64_t duration = 0;
    if (!ReadOutputDescription(output.get(), count, duration)) {
        return false;
    }
    if (!Snapshot().subtitleTracks.empty()) {
        AddValidationNote("Subtitle tracks were detected in the source but are not present in MP4 output");
    }
    const int64_t toleranceUs = std::max(MIN_DURATION_TOLERANCE_US,
        static_cast<int64_t>(2 * US_PER_SECOND / std::max(1.0, OutputFrameRate())));
    if (selectedDurationUs_ > 0 && std::abs(duration - selectedDurationUs_) > toleranceUs) {
        AddValidationNote("Duration differs: expectedUs=" + std::to_string(selectedDurationUs_) +
            " actualUs=" + std::to_string(duration) + " toleranceUs=" + std::to_string(toleranceUs));
    }
    if (!ValidateOutputDecodeSamples(output.get(), count, duration)) {
        return false;
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.outputDurationUs = duration;
    snapshot_.expectedDurationUs = selectedDurationUs_;
    snapshot_.outputValidation = snapshot_.validationNotes.empty() ? "passed" : "warning";
    AVCODEC_SAMPLE_LOGI("Transcode output validation: %{public}s, sourceStartUs=%{public}" PRId64
        ", expectedUs=%{public}" PRId64 ", actualUs=%{public}" PRId64,
        snapshot_.outputValidation.c_str(), sourceStartUs_, selectedDurationUs_, duration);
    return true;
}

bool TranscodeJob::ValidateOutputDecodeSamples(OH_AVSource *output, int32_t count, int64_t duration)
{
    if (!options_.deepValidation) {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.sampleValidation = "not_requested";
        return true;
    }
    for (int32_t index = 0; index < count; ++index) {
        Format track(OH_AVSource_GetTrackFormat(output, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track != nullptr && OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type) &&
            type == MEDIA_TYPE_VID) {
            return ValidateOutputSamples(index, duration);
        }
    }
    return Fail("Find output video track for decode validation");
}

bool TranscodeJob::ValidateOutputSamples(int32_t videoTrack, int64_t durationUs)
{
    std::vector<int64_t> targets {0, durationUs / MIDPOINT_DIVISOR,
        std::max<int64_t>(0, durationUs - US_PER_SECOND)};
    std::sort(targets.begin(), targets.end());
    targets.erase(std::unique(targets.begin(), targets.end()), targets.end());
    bool passed = true;
    for (const int64_t targetUs : targets) {
        if (cancelled_.load()) { return false; }
        std::string failure;
        const bool decoded = ValidateOutputSampleAt(videoTrack, targetUs, durationUs, failure);
        if (cancelled_.load()) {
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.sampleValidation = "cancelled";
            return false;
        }
        if (!decoded) {
            AddValidationNote("Decode validation failed at " + std::to_string(targetUs / US_PER_MS) +
                " ms: " + failure);
            passed = false;
        }
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.sampleValidation = passed ? "passed" : "warning";
    return true;
}

bool TranscodeJob::ValidateOutputSampleAt(int32_t videoTrack, int64_t targetUs, int64_t durationUs,
    std::string &failure)
{
    return ValidateTranscodeOutputSample(options_.outputFd, videoTrack, targetUs, durationUs, cancelled_, failure);
}
