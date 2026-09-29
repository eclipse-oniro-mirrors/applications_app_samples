/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_SURFACE_VIDEO_SINK_H
#define AVCODEC_SAMPLE_SURFACE_VIDEO_SINK_H

#include "VideoSink.h"

class SurfaceVideoSink final : public VideoSink {
public:
    int32_t Present(const VideoPresentRequest &request) override
    {
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, request.render,
            request.renderTimestamp);
    }

    void Reset() override {}
};

#endif // AVCODEC_SAMPLE_SURFACE_VIDEO_SINK_H
