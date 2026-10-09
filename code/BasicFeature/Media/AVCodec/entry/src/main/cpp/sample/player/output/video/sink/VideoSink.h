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
    virtual void BeginPlayback() {}
    // 在配置解码器前给 sink 预创建 GPU 资源的机会。
    // 返回非空表示解码器应使用该生产者 Surface。
    virtual OHNativeWindow *PrepareForPlayback(const SampleInfo &sampleInfo)
    {
        (void)sampleInfo;
        return nullptr;
    }
    virtual bool UsesSurfaceDecoder() const
    {
        return false;
    }
    virtual void Reset() = 0;
};

#endif // AVCODEC_SAMPLE_VIDEO_SINK_H
