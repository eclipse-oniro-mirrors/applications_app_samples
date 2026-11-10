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
