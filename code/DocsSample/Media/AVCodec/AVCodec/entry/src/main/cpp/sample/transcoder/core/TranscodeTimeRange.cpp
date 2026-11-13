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
#include <climits>
#include <algorithm>
#include <multimedia/player_framework/native_avcodec_base.h>

bool TranscodeJob::ConfigureTimeRange()
{
    selectedDurationUs_ = durationUs_;
    // File-relative selection and raw demuxer PTS use different origins for sources such as MPEG-TS.
    // Both tracks subtract this same origin so their relative start times remain unchanged.
    rangeStartUs_ = sourceStartUs_;
    if (options_.previewOnly) {
        options_.startTimeMs = std::max<int64_t>(options_.startTimeMs, options_.previewTimeMs);
        if (durationUs_ <= 0 && options_.startTimeMs == 0 && options_.endTimeMs == 0) { return true; }
    }
    if (options_.startTimeMs == 0 && options_.endTimeMs == 0 && !options_.previewOnly) { return true; }
    constexpr int64_t usPerMs = 1000;
    if ((options_.surface && !options_.gpu && !options_.previewOnly) || durationUs_ <= 0 ||
        options_.startTimeMs < 0 || options_.endTimeMs < 0 ||
        options_.startTimeMs > INT32_MAX || options_.endTimeMs > INT32_MAX) {
        return Fail("Time range requires Buffer input and a known source duration");
    }
    rangeStartUs_ = options_.startTimeMs * usPerMs;
    rangeEndUs_ = options_.endTimeMs > 0 ? options_.endTimeMs * usPerMs : durationUs_;
    if (rangeStartUs_ >= rangeEndUs_ || rangeEndUs_ > durationUs_) { return Fail("Invalid transcode time range"); }
    selectedDurationUs_ = rangeEndUs_ - rangeStartUs_;
    if (sourceStartUs_ > INT64_MAX - rangeEndUs_) { return Fail("Source time range exceeds timestamp limits"); }
    rangeStartUs_ += sourceStartUs_;
    rangeEndUs_ += sourceStartUs_;
    return true;
}

bool TranscodeJob::DiscardOutsideRange(bool &advanced)
{
    if (pendingDecoded_ == nullptr) { return false; }
    if (rangeEndUs_ <= 0) { return true; }
    const bool eos = (pendingDecodedAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    const bool hasFrame = options_.surface ? !eos || pendingDecodedAttr_.size > 0 : pendingDecodedAttr_.size > 0;
    if (hasFrame && (pendingDecodedAttr_.pts < rangeStartUs_ ||
        pendingDecodedAttr_.pts >= rangeEndUs_)) {
        if (!Check(OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_), "Discard pre-range video")) {
            return false;
        }
        pendingDecoded_ = nullptr;
        // Continue to the decoder's real EOS: compressed PTS can be reordered by B frames.
        decoderOutputDone_ = eos;
        pendingDecodedAttr_ = {};
        advanced = true;
    }
    return true;
}
