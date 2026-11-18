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

// 视频送显链路的阶段耗时快照。耗时单位为微秒，数值为从播放开始到当前时刻的平均值。
struct VideoSinkDiagnostics {
    bool available = false;
    uint64_t frames = 0;
    uint64_t failures = 0;
    uint64_t cacheHits = 0;
    uint64_t cacheMisses = 0;
    double averageFrameUs = 0.0;
    double averageNativeImageWaitUs = 0.0;
    double averageNativeImageAcquireUs = 0.0;
    double averageAcquireFenceWaitUs = 0.0;
    double averageImportUs = 0.0;
    double averageGpuWaitUs = 0.0;
    double averageCommandRecordUs = 0.0;
    double averageSubmitUs = 0.0;
};

class VideoSink {
public:
    virtual ~VideoSink() = default;
    virtual int32_t Present(const VideoPresentRequest &request) = 0;
    virtual void BeginPlayback() {}
    // 输出线程退出后、codec Flush/Destroy 前调用。GPU sink 先完成在途采样，
    // 归还已获取的解码 Buffer，但此时仍保留 codec 使用的 NativeImage 窗口。
    virtual bool Quiesce() { return true; }
    // codec Flush 完成后清走旧时间轴的待消费帧，不销毁解码器的输出 Surface。
    virtual void DiscardPendingFrames() {}
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
    virtual bool IsHdrVividConfirmed() const
    {
        return false;
    }
    virtual VideoSinkDiagnostics GetDiagnostics() const
    {
        return {};
    }
    virtual void Reset() = 0;
};

#endif // AVCODEC_SAMPLE_VIDEO_SINK_H
