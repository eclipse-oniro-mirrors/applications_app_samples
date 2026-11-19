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

#include "qos_core.h"

#include <atomic>
#include <chrono>
#include <mutex>
#include <thread>

#include <sched.h>
#include <unistd.h>

#include <hilog/log.h>

#include "qos/qos.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
constexpr int DEPTH = 34;
constexpr int TASKS = 6;
constexpr long long ONE = 1;
constexpr long long TWO = 2;
constexpr int LOAD_BURST = 200000;
constexpr int LOAD_SEGMENTS = 2000;
constexpr int LOAD_PAUSE_US = 2000;
constexpr int MASK = 2;
constexpr int CPUS = 4;
constexpr int ROTATE_BITS = 33;

namespace {
std::atomic<int> g_loadActive{0};
std::atomic<unsigned long long> g_loadSink{0};
std::mutex g_stateMutex;
QosCore::RunInfo g_lastRunInfo;
QosCore::RunStats g_stats;

long long DoFib(double n)
{
    if (n == ONE) {
        return ONE;
    }
    if (n == TWO) {
        return TWO;
    }
    return DoFib(n - ONE) + DoFib(n - TWO);
}

int ApplyQosLevel(int level, QosCore::RunInfo* runInfo)
{
    int ret = OH_QoS_SetThreadQoS(static_cast<QoS_Level>(level));
    if (runInfo != nullptr) {
        runInfo->setResult = ret;
    }
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "set qos level failed.");
        return ret;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "set qos level success.");
    return ret;
}

void QueryQosLevel(QosCore::RunInfo* runInfo)
{
    QoS_Level queryLevel = QoS_Level::QOS_DEFAULT;
    int ret = OH_QoS_GetThreadQoS(&queryLevel);
    if (runInfo != nullptr) {
        runInfo->queryLevel = (ret == 0) ? static_cast<int>(queryLevel) : QosCore::INVALID_RESULT;
    }
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "get qos level failed.");
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "the qos level of current thread : %{public}d",
                 static_cast<int>(queryLevel));
}

void BindSelectedCpu(QosCore::RunInfo* runInfo)
{
    cpu_set_t cpuMask;
    CPU_ZERO(&cpuMask);
    CPU_SET(QosCore::SelectedCpu(), &cpuMask);
    int bindResult = sched_setaffinity(0, sizeof(cpuMask), &cpuMask);
    if (runInfo != nullptr) {
        runInfo->bindResult = bindResult;
    }
    if (bindResult != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "bind work thread failed");
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "bind work thread success.");
}

double MeasureFibonacci()
{
    auto startTime = std::chrono::system_clock::now();
    long long res = DoFib(DEPTH);
    auto endTime = std::chrono::system_clock::now();
    double duration = std::chrono::duration<double, std::milli>(endTime - startTime).count();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "calculate res is: %{public}llu", res);
    return duration;
}

bool ResetQosLevel(QosCore::RunInfo* runInfo)
{
    int ret = OH_QoS_ResetThreadQoS();
    if (runInfo != nullptr) {
        runInfo->resetResult = ret;
    }
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "reset qos level failed!");
        return false;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "reset qos level success.");
    return true;
}

void LogLevelAfterReset()
{
    QoS_Level afterLevel = QoS_Level::QOS_DEFAULT;
    int ret = OH_QoS_GetThreadQoS(&afterLevel);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "query qos level failed after reset.");
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "the qos level after: %{public}d",
                 static_cast<int>(afterLevel));
}

void RunOnce(int level, QosCore::RunInfo* runInfo)
{
    if (ApplyQosLevel(level, runInfo) != 0) {
        return;
    }
    QueryQosLevel(runInfo);
    BindSelectedCpu(runInfo);
    double duration = MeasureFibonacci();
    if (runInfo != nullptr) {
        runInfo->duration = duration;
    }
    if (!ResetQosLevel(runInfo)) {
        return;
    }
    LogLevelAfterReset();
}

void AddLoads(int n)
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "set load thread QoS level failed.");
        g_loadActive.fetch_sub(1);
        return;
    }
    cpu_set_t cpuMask;
    CPU_ZERO(&cpuMask);
    CPU_SET(n, &cpuMask);
    if (sched_setaffinity(0, sizeof(cpuMask), &cpuMask) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "bind load thread failed");
        g_loadActive.fetch_sub(1);
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "QoS", "bind load threads success.");

    unsigned long long acc = static_cast<unsigned long long>(n) + 1ULL;
    for (int segment = 0; segment < LOAD_SEGMENTS; segment++) {
        for (int index = 0; index < LOAD_BURST; index++) {
            unsigned long long value = static_cast<unsigned long long>(index + segment);
            acc = acc * 6364136223846793005ULL + value;
            acc ^= (acc >> ROTATE_BITS);
        }
        std::this_thread::sleep_for(std::chrono::microseconds(LOAD_PAUSE_US));
    }
    g_loadSink.fetch_add(acc, std::memory_order_relaxed);
    g_loadActive.fetch_sub(1);
}
} // namespace

namespace QosCore {
int SelectedCpu()
{
    int cpuCount = CpuCount();
    return (cpuCount > MASK) ? MASK : 0;
}

void StartBackgroundLoad()
{
    int cpuCount = CpuCount();
    int loadTasks = (cpuCount > 1) ? (cpuCount - 1) : 1;
    if (loadTasks > TASKS) {
        loadTasks = TASKS;
    }
    int expected = 0;
    if (!g_loadActive.compare_exchange_strong(expected, loadTasks)) {
        return;
    }
    for (int i = 0; i < loadTasks; i++) {
        std::thread(AddLoads, i % cpuCount).detach();
    }
}

double RunWithLevel(int level)
{
    RunInfo runInfo;
    StartBackgroundLoad();
    std::thread task(RunOnce, level, &runInfo);
    task.join();

    std::lock_guard<std::mutex> lock(g_stateMutex);
    g_lastRunInfo = runInfo;
    g_stats.runCount++;
    g_stats.lastLevel = level;
    if (level >= MIN_LEVEL && level < MIN_LEVEL + LEVEL_COUNT) {
        g_stats.levelCount[level - MIN_LEVEL]++;
    }
    if (runInfo.duration >= 0.0) {
        g_stats.totalDuration += runInfo.duration;
        if (g_stats.minDuration < 0.0 || runInfo.duration < g_stats.minDuration) {
            g_stats.minDuration = runInfo.duration;
        }
        if (g_stats.maxDuration < 0.0 || runInfo.duration > g_stats.maxDuration) {
            g_stats.maxDuration = runInfo.duration;
        }
    }
    return runInfo.duration;
}

RunInfo LastRunInfo()
{
    std::lock_guard<std::mutex> lock(g_stateMutex);
    return g_lastRunInfo;
}

RunStats GetStats()
{
    std::lock_guard<std::mutex> lock(g_stateMutex);
    return g_stats;
}

void ResetStats()
{
    std::lock_guard<std::mutex> lock(g_stateMutex);
    g_stats = RunStats();
}

int CpuCount()
{
    long count = sysconf(_SC_NPROCESSORS_ONLN);
    return (count > 0) ? static_cast<int>(count) : 1;
}

int BindCurrentThread(int cpu)
{
    cpu_set_t cpuMask;
    CPU_ZERO(&cpuMask);
    CPU_SET(cpu, &cpuMask);
    return sched_setaffinity(0, sizeof(cpuMask), &cpuMask);
}

int ReadThreadAffinity(int* cpus, int capacity)
{
    if (cpus == nullptr || capacity <= 0) {
        return INVALID_RESULT;
    }
    cpu_set_t cpuMask;
    CPU_ZERO(&cpuMask);
    if (sched_getaffinity(0, sizeof(cpuMask), &cpuMask) != 0) {
        return INVALID_RESULT;
    }
    int found = 0;
    for (int cpu = 0; cpu < CPU_SETSIZE && found < capacity; cpu++) {
        if (CPU_ISSET(cpu, &cpuMask)) {
            cpus[found] = cpu;
            found++;
        }
    }
    return found;
}
} // namespace QosCore
