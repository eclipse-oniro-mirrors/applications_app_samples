/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "VideoPipeline.h"

bool PipelineWorkers::Start(StartConfig config)
{
    if (inputThread_ != nullptr || outputThread_ != nullptr) {
        return false;
    }
    try {
        inputThread_ = std::make_unique<std::thread>(config.syncMode ? std::move(config.inputSync) :
            std::move(config.inputAsync));
        outputThread_ = std::make_unique<std::thread>(config.syncMode ? std::move(config.outputSync) :
            std::move(config.outputAsync));
    } catch (...) {
        if (config.stopOnFailure) {
            config.stopOnFailure();
        }
        Join();
        return false;
    }
    return true;
}

void PipelineWorkers::Join()
{
    auto join = [](std::unique_ptr<std::thread> &thread) {
        if (thread != nullptr && thread->joinable()) {
            thread->join();
        }
        thread.reset();
    };
    join(inputThread_);
    join(outputThread_);
}

bool PipelineWorkers::HasThreads() const
{
    return (inputThread_ != nullptr && inputThread_->joinable()) ||
        (outputThread_ != nullptr && outputThread_->joinable());
}
