/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_AUDIO_PIPELINE_H
#define AVCODEC_SAMPLE_AUDIO_PIPELINE_H

#include "VideoPipeline.h"

class AudioPipeline {
public:
    using Worker = PipelineWorkers::Worker;

    bool Start(PipelineWorkers::StartConfig config)
    {
        return pipeline_.Start(std::move(config));
    }

    void Join()
    {
        pipeline_.Join();
    }

    bool HasThreads() const
    {
        return pipeline_.HasThreads();
    }

private:
    PipelineWorkers pipeline_;
};

#endif // AVCODEC_SAMPLE_AUDIO_PIPELINE_H
