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

#ifndef AVCODEC_OPERATION_FAILURE_H
#define AVCODEC_OPERATION_FAILURE_H

#include <cstdint>
#include <mutex>
#include <string>

struct OperationFailureInfo {
    std::string stage;
    int32_t code = 0;
    std::string message;
    std::string mime;
    std::string codecName;
    int32_t runMode = 0;
};

class OperationFailure {
public:
    void Reset(const std::string &mime, const std::string &name, int32_t mode)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_ = {};
        info_.mime = mime;
        info_.codecName = name;
        info_.runMode = mode;
    }

    void Record(const std::string &stage, int32_t code, const std::string &message)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        // 保留最先失败的操作，避免后续释放错误覆盖根因。
        if (info_.stage.empty()) {
            info_.stage = stage;
            info_.code = code;
            info_.message = message;
        }
    }

    OperationFailureInfo Snapshot() const
    {
        std::lock_guard<std::mutex> lock(mutex_);
        return info_;
    }

private:
    mutable std::mutex mutex_;
    OperationFailureInfo info_;
};

#endif
