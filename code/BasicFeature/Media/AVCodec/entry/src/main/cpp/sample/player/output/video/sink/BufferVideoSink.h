/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H
#define AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H

#include "VideoSink.h"
#include "../renderer/BufferRenderer.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

class BufferVideoSink final : public VideoSink {
public:
    void BeginPlayback() override
    {
        // The preceding stream can leave a different geometry or transform on the shared window.
        // Reconfigure it from the first decoded Buffer of the new stream.
        renderer_.Reset();
    }

    int32_t Present(const VideoPresentRequest &request) override
    {
        const bool rendered = !request.render || renderer_.Render(request.bufferInfo, request.sampleInfo,
            request.context, request.renderTimestamp);
        const int32_t freeRet = request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
        if (!rendered) {
            AVCODEC_SAMPLE_LOGE("Buffer video presentation failed, index: %{public}u", request.bufferInfo.bufferIndex);
            return AVCODEC_SAMPLE_ERR_ERROR;
        }
        if (freeRet != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGE("Free buffer video output failed, index: %{public}u, ret: %{public}d",
                request.bufferInfo.bufferIndex, freeRet);
        }
        return freeRet;
    }

    void Reset() override
    {
        renderer_.Reset();
    }

private:
    BufferRenderer renderer_;
};

#endif // AVCODEC_SAMPLE_BUFFER_VIDEO_SINK_H
