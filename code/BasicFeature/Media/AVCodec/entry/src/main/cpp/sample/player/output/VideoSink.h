/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_VIDEO_SINK_H
#define AVCODEC_SAMPLE_VIDEO_SINK_H

#include <cstdint>
#include "sample_info.h"
#include "video_decoder.h"

struct VideoPresentRequest {
    VideoDecoder &decoder;
    CodecBufferInfo &bufferInfo;
    const SampleInfo &sampleInfo;
    const CodecUserData &context;
    bool render = false;
    int64_t renderTimestamp = 0;
};

class VideoSink {
public:
    virtual ~VideoSink() = default;
    virtual int32_t Present(const VideoPresentRequest &request) = 0;
    virtual void Reset() = 0;
};

#endif // AVCODEC_SAMPLE_VIDEO_SINK_H
