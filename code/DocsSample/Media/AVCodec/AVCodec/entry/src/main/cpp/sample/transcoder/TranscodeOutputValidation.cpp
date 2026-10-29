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
#include <sys/stat.h>
#include <multimedia/player_framework/native_avcodec_base.h>

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

bool TranscodeJob::ValidateOutput()
{
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.stage = "validate";
        snapshot_.outputValidation = "checking";
    }
    struct stat file {};
    if (fstat(options_.outputFd, &file) != 0 || file.st_size <= 0) { return Fail("Validate output file size"); }
    std::unique_ptr<OH_AVSource, decltype(&OH_AVSource_Destroy)> output(
        OH_AVSource_CreateWithFD(options_.outputFd, 0, file.st_size), OH_AVSource_Destroy);
    if (output == nullptr) { return Fail("Reopen finalized MP4 for validation"); }
    Format description(OH_AVSource_GetSourceFormat(output.get()), OH_AVFormat_Destroy);
    int32_t count = 0;
    int64_t duration = 0;
    const int32_t expectedTracks = audioTrack_ >= 0 ? 2 : 1;
    if (description == nullptr || !OH_AVFormat_GetIntValue(description.get(), OH_MD_KEY_TRACK_COUNT, &count) ||
        !OH_AVFormat_GetLongValue(description.get(), OH_MD_KEY_DURATION, &duration) || duration <= 0 ||
        count != expectedTracks) { return Fail("Validate MP4 duration and track count"); }
    int32_t videos = 0;
    int32_t audios = 0;
    for (int32_t index = 0; index < count; ++index) {
        if (cancelled_.load()) { return false; }
        std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> track(
            OH_AVSource_GetTrackFormat(output.get(), index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type) ||
            (type != MEDIA_TYPE_VID && type != MEDIA_TYPE_AUD) || !ValidateOutputTrack(track.get(), type)) {
            return Fail("Validate MP4 track MIME and video dimensions");
        }
        videos += type == MEDIA_TYPE_VID;
        audios += type == MEDIA_TYPE_AUD;
    }
    if (videos != 1 || audios != expectedTracks - 1) { return Fail("Validate MP4 media tracks"); }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.outputDurationUs = duration;
    snapshot_.outputValidation = "passed";
    return true;
}
