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

#include <cstdlib>
#include <iostream>
#include <thread>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeDiagnostics.h"

namespace {
constexpr size_t K_STAGE_COUNT = 6;
constexpr int K_MEASUREMENT_COUNT = 300;
constexpr int K_MEASUREMENT_VALUE = 7;
constexpr int K_WAIT_MILLISECONDS = 2;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}
} // namespace

int main()
{
    using namespace TranscodeMetrics;
    Diagnostics metrics;
    auto empty = metrics.Snapshot();
    Require(empty.size() == K_STAGE_COUNT && empty[0].calls == 0 && empty[0].p95Ms == 0,
        "Empty diagnostics");
    for (int index = 0; index < K_MEASUREMENT_COUNT; ++index) {
        const int measured = metrics.Measure(Stage::PROCESS, [] { return K_MEASUREMENT_VALUE; });
        Require(measured == K_MEASUREMENT_VALUE, "Measurement return value");
    }
    const auto process = metrics.Snapshot()[static_cast<size_t>(Stage::PROCESS)];
    Require(process.calls == K_MEASUREMENT_COUNT && process.averageMs >= 0 && process.p95Ms <= process.maxMs,
        "Process statistics");
    metrics.Availability(WaitChannel::ENCODER_INPUT, false);
    std::this_thread::sleep_for(std::chrono::milliseconds(K_WAIT_MILLISECONDS));
    const double pending = metrics.WaitMs(WaitChannel::ENCODER_INPUT);
    Require(pending > 0, "Pending wait");
    metrics.Availability(WaitChannel::ENCODER_INPUT, true);
    const double completed = metrics.WaitMs(WaitChannel::ENCODER_INPUT);
    std::this_thread::sleep_for(std::chrono::milliseconds(K_WAIT_MILLISECONDS));
    Require(metrics.WaitMs(WaitChannel::ENCODER_INPUT) == completed &&
        metrics.WaitMs(WaitChannel::DECODER_OUTPUT) == 0, "Completed wait");
    std::cout << "Transcode diagnostics: bounded sampling, return values and wait spans passed\n";
}
