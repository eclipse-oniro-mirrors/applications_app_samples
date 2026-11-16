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

#include "qos_bench.h"

#include <thread>
#include <vector>

#include "qos_core.h"
#include "qos_napi_util.h"

namespace {
constexpr int MAX_BENCH_ROUNDS = 3;
constexpr int MAX_CONCURRENT_THREADS = 8;
constexpr int MAX_CONCURRENT_ROUNDS = 5;
constexpr int LEVEL_COUNT = QosCore::LEVEL_COUNT;
constexpr int INVALID_RESULT = QosCore::INVALID_RESULT;
constexpr double INVALID_DURATION = QosCore::INVALID_DURATION;

struct LevelSample {
    int level = 0;
    int successCount = 0;
    int failCount = 0;
    double avgDuration = INVALID_DURATION;
    double minDuration = INVALID_DURATION;
    double maxDuration = INVALID_DURATION;
    int setResult = INVALID_RESULT;
    int queryLevel = INVALID_RESULT;
    int resetResult = INVALID_RESULT;
    int bindResult = INVALID_RESULT;
};

struct BenchmarkOutcome {
    int rounds = 0;
    int totalRuns = 0;
    int fastestLevel = INVALID_RESULT;
    int slowestLevel = INVALID_RESULT;
    LevelSample samples[LEVEL_COUNT];
};

struct BenchmarkContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    int rounds = 1;
    BenchmarkOutcome outcome;
};

struct ConcurrentOutcome {
    int level = INVALID_RESULT;
    int threads = 0;
    int rounds = 0;
    int successCount = 0;
    int failCount = 0;
    double avgDuration = INVALID_DURATION;
    double minDuration = INVALID_DURATION;
    double maxDuration = INVALID_DURATION;
};

struct ConcurrentContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    int level = 0;
    int threads = 1;
    int rounds = 1;
    ConcurrentOutcome outcome;
};

BenchmarkOutcome ComputeBenchmark(int rounds)
{
    BenchmarkOutcome outcome;
    outcome.rounds = rounds;
    for (int level = QosCore::MIN_LEVEL; level <= QosCore::MAX_LEVEL; level++) {
        LevelSample& sample = outcome.samples[level - QosCore::MIN_LEVEL];
        sample.level = level;
        double total = 0.0;
        for (int round = 0; round < rounds; round++) {
            double duration = QosCore::RunWithLevel(level);
            QosCore::RunInfo info = QosCore::LastRunInfo();
            outcome.totalRuns++;
            sample.setResult = info.setResult;
            sample.queryLevel = info.queryLevel;
            sample.resetResult = info.resetResult;
            sample.bindResult = info.bindResult;
            bool success = duration >= 0.0 && info.setResult == 0;
            if (success) {
                sample.successCount++;
                total += duration;
                if (sample.minDuration < 0.0 || duration < sample.minDuration) {
                    sample.minDuration = duration;
                }
                if (sample.maxDuration < 0.0 || duration > sample.maxDuration) {
                    sample.maxDuration = duration;
                }
            } else {
                sample.failCount++;
            }
        }
        if (sample.successCount > 0) {
            sample.avgDuration = total / sample.successCount;
        }
    }

    for (int index = 0; index < LEVEL_COUNT; index++) {
        const LevelSample& sample = outcome.samples[index];
        if (sample.successCount == 0) {
            continue;
        }
        if (outcome.fastestLevel == INVALID_RESULT ||
            sample.avgDuration < outcome.samples[outcome.fastestLevel - QosCore::MIN_LEVEL].avgDuration) {
            outcome.fastestLevel = sample.level;
        }
        if (outcome.slowestLevel == INVALID_RESULT ||
            sample.avgDuration > outcome.samples[outcome.slowestLevel - QosCore::MIN_LEVEL].avgDuration) {
            outcome.slowestLevel = sample.level;
        }
    }
    return outcome;
}

ConcurrentOutcome ComputeConcurrent(int level, int threads, int rounds)
{
    ConcurrentOutcome outcome;
    outcome.level = level;
    outcome.threads = threads;
    outcome.rounds = rounds;
    std::vector<double> durations(static_cast<size_t>(threads * rounds), INVALID_DURATION);
    std::vector<std::thread> workers;
    workers.reserve(static_cast<size_t>(threads));
    for (int index = 0; index < threads; index++) {
        workers.emplace_back([level, rounds, index, &durations]() {
            for (int round = 0; round < rounds; round++) {
                size_t slot = static_cast<size_t>(index * rounds + round);
                durations[slot] = QosCore::RunWithLevel(level);
            }
        });
    }
    for (std::thread& worker : workers) {
        worker.join();
    }

    double total = 0.0;
    for (double duration : durations) {
        if (duration < 0.0) {
            outcome.failCount++;
            continue;
        }
        outcome.successCount++;
        total += duration;
        if (outcome.minDuration < 0.0 || duration < outcome.minDuration) {
            outcome.minDuration = duration;
        }
        if (outcome.maxDuration < 0.0 || duration > outcome.maxDuration) {
            outcome.maxDuration = duration;
        }
    }
    if (outcome.successCount > 0) {
        outcome.avgDuration = total / outcome.successCount;
    }
    return outcome;
}

napi_value BuildSample(napi_env env, const LevelSample& sample)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    QosNapi::SetNamedInt(env, object, "level", sample.level);
    QosNapi::SetNamedInt(env, object, "successCount", sample.successCount);
    QosNapi::SetNamedInt(env, object, "failCount", sample.failCount);
    QosNapi::SetNamedDouble(env, object, "avgDuration", sample.avgDuration);
    QosNapi::SetNamedDouble(env, object, "minDuration", sample.minDuration);
    QosNapi::SetNamedDouble(env, object, "maxDuration", sample.maxDuration);
    QosNapi::SetNamedInt(env, object, "setResult", sample.setResult);
    QosNapi::SetNamedInt(env, object, "queryLevel", sample.queryLevel);
    QosNapi::SetNamedInt(env, object, "resetResult", sample.resetResult);
    QosNapi::SetNamedInt(env, object, "bindResult", sample.bindResult);
    return object;
}

void ExecuteBenchmark(napi_env env, void* data)
{
    auto* context = static_cast<BenchmarkContext*>(data);
    context->outcome = ComputeBenchmark(context->rounds);
}

void CompleteBenchmark(napi_env env, napi_status status, void* data)
{
    auto* context = static_cast<BenchmarkContext*>(data);
    if (status != napi_ok) {
        napi_value message = QosNapi::CreateString(env, "benchmark cancelled");
        napi_value error = nullptr;
        napi_create_error(env, nullptr, message, &error);
        napi_reject_deferred(env, context->deferred, error);
        napi_delete_async_work(env, context->work);
        delete context;
        return;
    }

    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_OK);
    QosNapi::SetNamedInt(env, report, "rounds", context->outcome.rounds);
    QosNapi::SetNamedInt(env, report, "totalRuns", context->outcome.totalRuns);
    QosNapi::SetNamedInt(env, report, "fastestLevel", context->outcome.fastestLevel);
    QosNapi::SetNamedInt(env, report, "slowestLevel", context->outcome.slowestLevel);

    napi_value samples = nullptr;
    napi_create_array_with_length(env, LEVEL_COUNT, &samples);
    for (int index = 0; index < LEVEL_COUNT; index++) {
        napi_set_element(env, samples, static_cast<uint32_t>(index),
                         BuildSample(env, context->outcome.samples[index]));
    }
    napi_set_named_property(env, report, "samples", samples);

    napi_resolve_deferred(env, context->deferred, report);
    napi_delete_async_work(env, context->work);
    delete context;
}

void ExecuteConcurrent(napi_env env, void* data)
{
    auto* context = static_cast<ConcurrentContext*>(data);
    context->outcome = ComputeConcurrent(context->level, context->threads, context->rounds);
}

void CompleteConcurrent(napi_env env, napi_status status, void* data)
{
    auto* context = static_cast<ConcurrentContext*>(data);
    if (status != napi_ok) {
        napi_value message = QosNapi::CreateString(env, "concurrent run cancelled");
        napi_value error = nullptr;
        napi_create_error(env, nullptr, message, &error);
        napi_reject_deferred(env, context->deferred, error);
        napi_delete_async_work(env, context->work);
        delete context;
        return;
    }

    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_OK);
    QosNapi::SetNamedInt(env, report, "level", context->outcome.level);
    QosNapi::SetNamedInt(env, report, "threads", context->outcome.threads);
    QosNapi::SetNamedInt(env, report, "rounds", context->outcome.rounds);
    QosNapi::SetNamedInt(env, report, "successCount", context->outcome.successCount);
    QosNapi::SetNamedInt(env, report, "failCount", context->outcome.failCount);
    QosNapi::SetNamedDouble(env, report, "avgDuration", context->outcome.avgDuration);
    QosNapi::SetNamedDouble(env, report, "minDuration", context->outcome.minDuration);
    QosNapi::SetNamedDouble(env, report, "maxDuration", context->outcome.maxDuration);

    napi_resolve_deferred(env, context->deferred, report);
    napi_delete_async_work(env, context->work);
    delete context;
}

napi_value RejectWith(napi_env env, const char* reason)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value message = QosNapi::CreateString(env, reason);
    napi_value error = nullptr;
    napi_create_error(env, nullptr, message, &error);
    napi_reject_deferred(env, deferred, error);
    return promise;
}
} // namespace

namespace QosBench {
napi_value RunBenchmarkAsync(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 1) {
        return RejectWith(env, "rounds is required");
    }
    int rounds = 0;
    if (!QosNapi::ReadIntArg(env, args[0], &rounds) || rounds < 1 || rounds > MAX_BENCH_ROUNDS) {
        return RejectWith(env, "rounds must be 1 to 3");
    }

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);

    auto* context = new BenchmarkContext();
    context->deferred = deferred;
    context->rounds = rounds;
    napi_value resourceName = QosNapi::CreateString(env, "runLevelBenchmark");
    napi_create_async_work(env, nullptr, resourceName, ExecuteBenchmark, CompleteBenchmark, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

napi_value RunConcurrentAsync(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 3) {
        return RejectWith(env, "level, threads and rounds are required");
    }
    int level = 0;
    int threads = 0;
    int rounds = 0;
    if (!QosNapi::ReadIntArg(env, args[0], &level) || level < QosCore::MIN_LEVEL || level > QosCore::MAX_LEVEL) {
        return RejectWith(env, "level must be 0 to 5");
    }
    if (!QosNapi::ReadIntArg(env, args[1], &threads) || threads < 1 || threads > MAX_CONCURRENT_THREADS) {
        return RejectWith(env, "threads must be 1 to 8");
    }
    if (!QosNapi::ReadIntArg(env, args[2], &rounds) || rounds < 1 || rounds > MAX_CONCURRENT_ROUNDS) {
        return RejectWith(env, "rounds must be 1 to 5");
    }

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);

    auto* context = new ConcurrentContext();
    context->deferred = deferred;
    context->level = level;
    context->threads = threads;
    context->rounds = rounds;
    napi_value resourceName = QosNapi::CreateString(env, "runConcurrent");
    napi_create_async_work(env, nullptr, resourceName, ExecuteConcurrent, CompleteConcurrent, context, &context->work);
    napi_queue_async_work(env, context->work);
    return promise;
}

napi_value CompareLevels(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    int levelA = 0;
    int levelB = 0;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 2 ||
        !QosNapi::ReadIntArg(env, args[0], &levelA) || !QosNapi::ReadIntArg(env, args[1], &levelB) ||
        levelA < QosCore::MIN_LEVEL || levelA > QosCore::MAX_LEVEL ||
        levelB < QosCore::MIN_LEVEL || levelB > QosCore::MAX_LEVEL) {
        QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "levelA", INVALID_RESULT);
        QosNapi::SetNamedInt(env, report, "levelB", INVALID_RESULT);
        QosNapi::SetNamedDouble(env, report, "durationA", INVALID_DURATION);
        QosNapi::SetNamedDouble(env, report, "durationB", INVALID_DURATION);
        QosNapi::SetNamedDouble(env, report, "ratio", INVALID_DURATION);
        QosNapi::SetNamedInt(env, report, "fasterLevel", INVALID_RESULT);
        return report;
    }

    double durationA = QosCore::RunWithLevel(levelA);
    double durationB = QosCore::RunWithLevel(levelB);
    double ratio = (durationB > 0.0) ? (durationA / durationB) : INVALID_DURATION;
    int fasterLevel = INVALID_RESULT;
    if (durationA >= 0.0 && durationB >= 0.0) {
        fasterLevel = (durationA <= durationB) ? levelA : levelB;
    }

    QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_OK);
    QosNapi::SetNamedInt(env, report, "levelA", levelA);
    QosNapi::SetNamedInt(env, report, "levelB", levelB);
    QosNapi::SetNamedDouble(env, report, "durationA", durationA);
    QosNapi::SetNamedDouble(env, report, "durationB", durationB);
    QosNapi::SetNamedDouble(env, report, "ratio", ratio);
    QosNapi::SetNamedInt(env, report, "fasterLevel", fasterLevel);
    return report;
}

napi_value GetRunSummary(napi_env env, napi_callback_info info)
{
    QosCore::RunStats stats = QosCore::GetStats();
    napi_value summary = nullptr;
    napi_create_object(env, &summary);
    QosNapi::SetNamedInt(env, summary, "runCount", stats.runCount);
    QosNapi::SetNamedInt(env, summary, "lastLevel", stats.lastLevel);
    QosNapi::SetNamedDouble(env, summary, "minDuration", stats.minDuration);
    QosNapi::SetNamedDouble(env, summary, "maxDuration", stats.maxDuration);
    double avgDuration = (stats.runCount > 0) ? (stats.totalDuration / stats.runCount) : INVALID_DURATION;
    QosNapi::SetNamedDouble(env, summary, "avgDuration", avgDuration);

    napi_value counts = nullptr;
    napi_create_array_with_length(env, LEVEL_COUNT, &counts);
    for (int index = 0; index < LEVEL_COUNT; index++) {
        napi_set_element(env, counts, static_cast<uint32_t>(index),
                         QosNapi::CreateInt(env, stats.levelCount[index]));
    }
    napi_set_named_property(env, summary, "levelCounts", counts);
    return summary;
}

napi_value ResetRunSummary(napi_env env, napi_callback_info info)
{
    QosCore::ResetStats();
    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_OK);
    QosNapi::SetNamedInt(env, report, "runCount", 0);
    return report;
}
} // namespace QosBench
