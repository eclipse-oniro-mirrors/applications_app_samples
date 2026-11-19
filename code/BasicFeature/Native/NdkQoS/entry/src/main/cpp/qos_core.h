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

#ifndef QOS_CORE_H
#define QOS_CORE_H

namespace QosCore {
constexpr int MIN_LEVEL = 0;
constexpr int MAX_LEVEL = 5;
constexpr int LEVEL_COUNT = MAX_LEVEL - MIN_LEVEL + 1;
constexpr int INVALID_RESULT = -1;
constexpr double INVALID_DURATION = -1.0;

struct RunInfo {
    int setResult = INVALID_RESULT;
    int queryLevel = INVALID_RESULT;
    int resetResult = INVALID_RESULT;
    int bindResult = INVALID_RESULT;
    double duration = INVALID_DURATION;
};

struct RunStats {
    int runCount = 0;
    int levelCount[LEVEL_COUNT] = {0, 0, 0, 0, 0, 0};
    int lastLevel = INVALID_RESULT;
    double totalDuration = 0.0;
    double minDuration = INVALID_DURATION;
    double maxDuration = INVALID_DURATION;
};

double RunWithLevel(int level);

RunInfo LastRunInfo();

RunStats GetStats();
void ResetStats();

int CpuCount();

int SelectedCpu();

int BindCurrentThread(int cpu);

int ReadThreadAffinity(int* cpus, int capacity);
} // namespace QosCore

#endif // QOS_CORE_H
