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

#ifndef AVCODEC_SAMPLE_RECORDER_WORKER_H
#define AVCODEC_SAMPLE_RECORDER_WORKER_H

#include <memory>
#include <thread>
#include <utility>

// 与播放器的PipelineWorkers一样管理线程创建和join；录制输入需要在提交EOS前单独结束。
class RecorderWorker {
public:
    ~RecorderWorker() { Join(); }

    template<typename Worker>
    bool Start(Worker &&worker)
    {
        if (thread_ != nullptr) {
            return false;
        }
        try {
            thread_ = std::make_unique<std::thread>(std::forward<Worker>(worker));
        } catch (...) {
            return false;
        }
        return true;
    }

    // 调用方先通知退出并唤醒等待，再从协调线程join；不能由工作线程join自身。
    void Join()
    {
        if (thread_ != nullptr && thread_->joinable()) {
            thread_->join();
        }
        thread_.reset();
    }

private:
    std::unique_ptr<std::thread> thread_;
};

#endif // AVCODEC_SAMPLE_RECORDER_WORKER_H
