/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_VIDEO_FRAME_CONVERTER_H
#define AVCODEC_SAMPLE_VIDEO_FRAME_CONVERTER_H

#include <cstdint>
#include <vector>

#include "sample_info.h"
#include "codec_buffer.h"

class VideoFrameConverter final {
public:
    struct FrameSize {
        int32_t width = 0;
        int32_t height = 0;
    };

    struct FrameScaleRequest {
        FrameSize source;
        FrameSize output;
        int32_t rotation = 0;
        int64_t maxUploadPixels = 0;
        int64_t maxPortraitUploadPixels = 0;
    };

    struct FrameFitRequest {
        FrameSize source;
        FrameSize target;
        int32_t rotation = 0;
    };

    struct FrameRotationRequest {
        FrameSize source;
        int32_t rotation = 0;
    };

    static bool ToRgba(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
        const CodecUserData &context, std::vector<uint8_t> &rgba);
    static bool ToRgbaScaled(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
        const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba);
    static FrameSize GetScaledFrameSize(const FrameScaleRequest &request);
    static bool ResizeRgba(const std::vector<uint8_t> &source, const FrameSize &sourceSize,
        const FrameSize &targetSize, std::vector<uint8_t> &rgba);
    static bool FitRgba(const std::vector<uint8_t> &source, const FrameFitRequest &request,
        std::vector<uint8_t> &rgba);
    static bool RotateRgba(const std::vector<uint8_t> &source, const FrameRotationRequest &request,
        std::vector<uint8_t> &rgba);

private:
    static bool ConvertRgba(const uint8_t *source, const SampleInfo &sampleInfo,
        const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba);
    static bool ConvertYuv420(const uint8_t *source, const SampleInfo &sampleInfo,
        const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba);
    static bool ValidateBufferSize(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
        const CodecUserData &context);
    static uint8_t ClampColor(int32_t value);
};

#endif // AVCODEC_SAMPLE_VIDEO_FRAME_CONVERTER_H
