/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef GAME_CONTROLLER_LOG_H
#define GAME_CONTROLLER_LOG_H

#include <functional>
#include <mutex>
#include <string>

/**
 * @brief Log singleton of the demo. PrintLog outputs the message to the UI log page
 * through the sink registered by the ArkTS side, and the sink runs on the JS thread.
 */
class Log {
public:
    static Log* GetInstance()
    {
        static Log instance;
        return &instance;
    }

    /**
     * @brief Registers the log sink. The sink is invoked on the thread which calls PrintLog,
     * so it must be thread safe itself.
     */
    void SetSink(std::function<void(const std::string&)> sink)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        sink_ = std::move(sink);
    }

    /**
     * @brief Outputs a log message to the UI log page. It can be called on any thread.
     */
    void PrintLog(const std::string& log)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (sink_ != nullptr) {
            sink_(log);
        }
    }

private:
    Log() = default;
    ~Log() = default;
    Log(const Log&) = delete;
    Log& operator=(const Log&) = delete;

    std::function<void(const std::string&)> sink_ = nullptr;
    std::mutex mutex_;
};

#endif // GAME_CONTROLLER_LOG_H
