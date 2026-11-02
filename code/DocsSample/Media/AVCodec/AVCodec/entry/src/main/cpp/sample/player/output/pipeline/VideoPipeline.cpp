/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
