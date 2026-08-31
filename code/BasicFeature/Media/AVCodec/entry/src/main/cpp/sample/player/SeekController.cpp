/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "SeekController.h"
#include <algorithm>

namespace {
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;
constexpr int64_t US_PER_SECOND = 1'000'000;
}

VideoSeekDecision SeekController::DecideVideoFrame(int64_t ptsUs, int64_t targetUs,
    bool &discardUntilTarget) const
{
    if (!discardUntilTarget) {
        return {};
    }
    if (ptsUs >= targetUs) {
        discardUntilTarget = false;
        return {false, true};
    }
    return {true, false};
}

AudioSeekResult SeekController::TrimAudioFrame(CodecBufferInfo &bufferInfo, int64_t targetUs,
    int32_t sampleRate, int32_t channelCount, int32_t capacity) const
{
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0 || bufferInfo.attr.size <= 0 ||
        channelCount <= 0 || capacity < 0 ||
        bufferInfo.attr.offset > capacity || bufferInfo.attr.size > capacity - bufferInfo.attr.offset) {
        return AUDIO_SEEK_ERROR;
    }
    if (sampleRate <= 0) {
        return AUDIO_SEEK_ERROR;
    }
    const int64_t validSampleRate = static_cast<int64_t>(sampleRate);
    const int64_t bytesPerFrame = static_cast<int64_t>(channelCount) * BYTES_PER_SAMPLE_2;
    if (bytesPerFrame == 0) {
        return AUDIO_SEEK_ERROR;
    }
    if (bufferInfo.attr.size % bytesPerFrame != 0) {
        return AUDIO_SEEK_ERROR;
    }
    const int64_t bufferFrames = bufferInfo.attr.size / bytesPerFrame;
    const int64_t bufferDurationUs = bufferFrames * US_PER_SECOND / validSampleRate;
    if (bufferFrames <= 0 || bufferInfo.attr.pts + bufferDurationUs <= targetUs) {
        return AUDIO_SEEK_DISCARD;
    }
    const int64_t deltaUs = targetUs - bufferInfo.attr.pts;
    const int64_t skipFrames = (deltaUs * validSampleRate + US_PER_SECOND - 1) / US_PER_SECOND;
    const int64_t skipBytes = skipFrames * bytesPerFrame;
    if (skipBytes >= bufferInfo.attr.size) {
        return AUDIO_SEEK_DISCARD;
    }
    const int64_t trimmedOffset = static_cast<int64_t>(bufferInfo.attr.offset) + skipBytes;
    if (trimmedOffset > capacity) {
        return AUDIO_SEEK_ERROR;
    }
    bufferInfo.attr.offset = static_cast<int32_t>(trimmedOffset);
    bufferInfo.attr.size -= static_cast<int32_t>(skipBytes);
    bufferInfo.attr.pts += skipFrames * US_PER_SECOND / validSampleRate;
    return AUDIO_SEEK_KEEP;
}
