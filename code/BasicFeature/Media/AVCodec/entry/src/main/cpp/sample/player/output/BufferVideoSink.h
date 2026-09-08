/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H
#define AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H

#include "VideoSink.h"
#include "BufferRenderer.h"
#include "dfx/error/av_codec_sample_error.h"

class BufferVideoSink final : public VideoSink {
public:
    int32_t Present(const VideoPresentRequest &request) override
    {
        if (request.render && !renderer_.Render(request.bufferInfo, request.sampleInfo, request.context,
            request.renderTimestamp)) {
            return AVCODEC_SAMPLE_ERR_ERROR;
        }
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }

    void Reset() override
    {
        renderer_.Reset();
    }

private:
    BufferRenderer renderer_;
};

#endif // AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H
