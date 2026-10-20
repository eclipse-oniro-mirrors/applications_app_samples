/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_VIDEO_PIPELINE_H
#define AVCODEC_SAMPLE_VIDEO_PIPELINE_H

#include <functional>
#include <memory>
#include <thread>
#include <utility>

class PipelineWorkers {
public:
    using Worker = std::function<void()>;

    struct StartConfig {
        bool syncMode = false;
        Worker inputSync;
        Worker outputSync;
        Worker inputAsync;
        Worker outputAsync;
        Worker stopOnFailure;
    };

    bool Start(StartConfig config);
    void Join();
    bool HasThreads() const;

private:
    std::unique_ptr<std::thread> inputThread_;
    std::unique_ptr<std::thread> outputThread_;
};

class VideoPipeline final {
public:
    using Worker = PipelineWorkers::Worker;

    bool Start(PipelineWorkers::StartConfig config)
    {
        return workers_.Start(std::move(config));
    }

    void Join()
    {
        workers_.Join();
    }

    bool HasThreads() const
    {
        return workers_.HasThreads();
    }

private:
    PipelineWorkers workers_;
};

#endif // AVCODEC_SAMPLE_VIDEO_PIPELINE_H
