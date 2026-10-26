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

#include <cassert>
#include <iostream>
#include <thread>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeDiagnostics.h"

int main()
{
    using namespace TranscodeMetrics;
    Diagnostics metrics;
    auto empty = metrics.Snapshot();
    assert(empty.size() == 6 && empty[0].calls == 0 && empty[0].p95Ms == 0);
    for (int index = 0; index < 300; ++index) {
        assert(metrics.Measure(Stage::PROCESS, [] { return 7; }) == 7);
    }
    const auto process = metrics.Snapshot()[2];
    assert(process.calls == 300 && process.averageMs >= 0 && process.p95Ms <= process.maxMs);
    metrics.Availability(1, false);
    std::this_thread::sleep_for(std::chrono::milliseconds(2));
    assert(metrics.WaitMs(1) > 0);
    metrics.Availability(1, true);
    const double completed = metrics.WaitMs(1);
    std::this_thread::sleep_for(std::chrono::milliseconds(2));
    assert(metrics.WaitMs(1) == completed && metrics.WaitMs(0) == 0);
    std::cout << "Transcode diagnostics: bounded sampling, return values and wait spans passed\n";
}
