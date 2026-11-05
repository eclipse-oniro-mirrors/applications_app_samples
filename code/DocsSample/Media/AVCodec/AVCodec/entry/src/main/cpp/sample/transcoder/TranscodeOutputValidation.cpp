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
#include <chrono>
#include <cmath>
#include <utility>
#include <sys/stat.h>
#include <thread>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include "av_codec_sample_log.h"

namespace {
constexpr int64_t TRACK_START_TOLERANCE_US = 100000;
constexpr int64_t MIN_DURATION_TOLERANCE_US = 250000;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t US_PER_MS = 1000;
constexpr int64_t MIDPOINT_DIVISOR = 2;
constexpr int64_t SAMPLE_PTS_TOLERANCE_US = 2000000;
constexpr auto SAMPLE_DECODE_TIMEOUT = std::chrono::seconds(10);
constexpr auto SAMPLE_IDLE_WAIT = std::chrono::milliseconds(1);
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
        OH_AVFormat *expectedAudio = audioFormat_.get();
        if (options_.remuxOnly && options_.remuxAllAudioTracks) {
            expectedAudio = audioOrdinal >= 0 && static_cast<size_t>(audioOrdinal) < remuxAudioFormats_.size() ?
                remuxAudioFormats_[audioOrdinal].get() : nullptr;
        }
        for (const char *key : {OH_MD_KEY_AUD_SAMPLE_RATE, OH_MD_KEY_AUD_CHANNEL_COUNT}) {
            int32_t expected = 0;
            int32_t actual = 0;
            if (expectedAudio == nullptr || !OH_AVFormat_GetIntValue(expectedAudio, key, &expected)) { continue; }
            if (options_.audioMode == 1 && !(options_.remuxOnly && options_.remuxAllAudioTracks)) {
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
    const int32_t expectedAudioTracks = options_.remuxOnly && options_.remuxAllAudioTracks ?
        static_cast<int32_t>(remuxAudioFormats_.size()) : (audioTrack_ >= 0 ? 1 : 0);
    const int32_t expectedTracks = 1 + expectedAudioTracks;
    if (description == nullptr || !OH_AVFormat_GetIntValue(description.get(), OH_MD_KEY_TRACK_COUNT, &count) ||
        !OH_AVFormat_GetLongValue(description.get(), OH_MD_KEY_DURATION, &duration) || duration <= 0 ||
        count != expectedTracks) {
        return Fail("Validate MP4 duration and track count");
    }
    if (!ValidateOutputTracks(output.get(), count, expectedTracks)) {
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
    if (options_.deepValidation) {
        int32_t outputVideoTrack = -1;
        for (int32_t index = 0; index < count; ++index) {
            Format track(OH_AVSource_GetTrackFormat(output.get(), index), OH_AVFormat_Destroy);
            int32_t type = -1;
            if (track != nullptr && OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type) &&
                type == MEDIA_TYPE_VID) {
                outputVideoTrack = index;
                break;
            }
        }
        if (outputVideoTrack < 0) { return Fail("Find output video track for decode validation"); }
        if (!ValidateOutputSamples(outputVideoTrack, duration)) { return false; }
    } else {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.sampleValidation = "not_requested";
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
    struct stat file {};
    if (fstat(options_.outputFd, &file) != 0 || file.st_size <= 0) {
        failure = "output file unavailable";
        return false;
    }
    std::unique_ptr<OH_AVSource, decltype(&OH_AVSource_Destroy)> source(
        OH_AVSource_CreateWithFD(options_.outputFd, 0, file.st_size), OH_AVSource_Destroy);
    if (source == nullptr) { failure = "reopen output"; return false; }
    Format format(OH_AVSource_GetTrackFormat(source.get(), videoTrack), OH_AVFormat_Destroy);
    const char *mime = nullptr;
    if (format == nullptr || !OH_AVFormat_GetStringValue(format.get(), OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr) {
        failure = "read video format";
        return false;
    }
    std::unique_ptr<OH_AVDemuxer, decltype(&OH_AVDemuxer_Destroy)> demuxer(
        OH_AVDemuxer_CreateWithSource(source.get()), OH_AVDemuxer_Destroy);
    std::unique_ptr<OH_AVCodec, decltype(&OH_VideoDecoder_Destroy)> decoder(
        OH_VideoDecoder_CreateByMime(mime), OH_VideoDecoder_Destroy);
    if (demuxer == nullptr || decoder == nullptr ||
        OH_AVDemuxer_SelectTrackByID(demuxer.get(), videoTrack) != AV_ERR_OK ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ROTATION, 0) ||
        OH_VideoDecoder_Configure(decoder.get(), format.get()) != AV_ERR_OK ||
        OH_VideoDecoder_Prepare(decoder.get()) != AV_ERR_OK || OH_VideoDecoder_Start(decoder.get()) != AV_ERR_OK) {
        failure = "initialize synchronous decoder";
        return false;
    }
    bool decoderStarted = true;
    const auto stopDecoder = [&decoder, &decoderStarted]() {
        if (decoderStarted) { (void)OH_VideoDecoder_Stop(decoder.get()); decoderStarted = false; }
    };
    if (targetUs > 0 && OH_AVDemuxer_SeekToTime(demuxer.get(), targetUs / US_PER_MS,
        SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) {
        stopDecoder();
        failure = "seek to sample time";
        return false;
    }
    bool inputEos = false;
    bool outputEos = false;
    bool reachedTarget = false;
    int64_t lastPts = -1;
    const auto deadline = std::chrono::steady_clock::now() + SAMPLE_DECODE_TIMEOUT;
    while (!cancelled_.load() && !reachedTarget && !outputEos &&
        std::chrono::steady_clock::now() < deadline) {
        bool progressed = false;
        if (!inputEos) {
            uint32_t index = 0;
            const int32_t query = OH_VideoDecoder_QueryInputBuffer(decoder.get(), &index, 0);
            if (query == AV_ERR_OK) {
                OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder.get(), index);
                OH_AVCodecBufferAttr attr{};
                if (buffer == nullptr || OH_AVDemuxer_ReadSampleBuffer(demuxer.get(), videoTrack, buffer) != AV_ERR_OK ||
                    OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK ||
                    OH_VideoDecoder_PushInputBuffer(decoder.get(), index) != AV_ERR_OK) {
                    stopDecoder(); failure = "feed compressed sample"; return false;
                }
                inputEos = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
                progressed = true;
            } else if (query != AV_ERR_TRY_AGAIN_LATER) {
                stopDecoder(); failure = "query decoder input"; return false;
            }
        }
        uint32_t outputIndex = 0;
        const int32_t queryOutput = OH_VideoDecoder_QueryOutputBuffer(decoder.get(), &outputIndex, 0);
        if (queryOutput == AV_ERR_OK) {
            OH_AVBuffer *buffer = OH_VideoDecoder_GetOutputBuffer(decoder.get(), outputIndex);
            OH_AVCodecBufferAttr attr{};
            if (buffer == nullptr || OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
                stopDecoder(); failure = "read decoded sample"; return false;
            }
            if (attr.size > 0) {
                if (attr.pts < 0 || attr.pts > durationUs + SAMPLE_PTS_TOLERANCE_US ||
                    (lastPts >= 0 && attr.pts < lastPts)) {
                    (void)OH_VideoDecoder_FreeOutputBuffer(decoder.get(), outputIndex);
                    stopDecoder();
                    failure = "decoded PTS is out of range or regresses: currentUs=" + std::to_string(attr.pts) +
                        " previousUs=" + std::to_string(lastPts) + " durationUs=" + std::to_string(durationUs);
                    return false;
                }
                lastPts = attr.pts;
                reachedTarget = reachedTarget || attr.pts >= targetUs;
            }
            outputEos = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
            if (OH_VideoDecoder_FreeOutputBuffer(decoder.get(), outputIndex) != AV_ERR_OK) {
                stopDecoder(); failure = "return decoded output"; return false;
            }
            progressed = true;
        } else if (queryOutput != AV_ERR_TRY_AGAIN_LATER && queryOutput != AV_ERR_STREAM_CHANGED) {
            stopDecoder(); failure = "query decoder output"; return false;
        }
        if (!progressed) { std::this_thread::sleep_for(SAMPLE_IDLE_WAIT); }
    }
    stopDecoder();
    if (cancelled_.load()) { failure = "cancelled"; return false; }
    if (!reachedTarget && !outputEos && std::chrono::steady_clock::now() >= deadline) {
        failure = "decode timeout";
        return false;
    }
    if (!reachedTarget) {
        failure = "no decoded frame reached target PTS; targetUs=" + std::to_string(targetUs) +
            " lastDecodedPtsUs=" + std::to_string(lastPts);
        return false;
    }
    return true;
}
