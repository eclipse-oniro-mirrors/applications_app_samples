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

#include <algorithm>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <iterator>
#include <thread>
#include <vector>
#include "../../entry/src/main/cpp/sample/player/sync/PlaybackDiagnostics.h"
#include "../../entry/src/main/cpp/common/DumpSession.h"

namespace {
constexpr int64_t WORKER_COUNT = 4;
constexpr int64_t EVENT_SEQUENCE_SPAN = 127;
constexpr int64_t EVENT_CAPACITY = 128;
constexpr int64_t EVENT_COUNT = 200;
constexpr int64_t WORKER_ITERATIONS = 500;
constexpr int64_t SAMPLE_CAPACITY = 512;
constexpr int64_t EXPECTED_P95_US = 575;
constexpr int64_t SAMPLE_COUNT = 600;
constexpr int64_t EXPECTED_CONCURRENT_SEQUENCE = 2002;
constexpr int64_t DUMP_PTS_US = 5000;
constexpr int64_t OLD_PTS_US = 1000000;
constexpr int64_t AUDIO_SEEK_PTS_US = 2000000;
constexpr int64_t TARGET_PTS_US = 5000000;
constexpr int64_t SUPERSEDED_PTS_US = 6000000;
constexpr int64_t FAILED_PTS_US = 7000000;
constexpr int64_t DUMP_BYTES = 4;
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

bool HasStage(const PlaybackDiagnosticsInfo &snapshot, const std::string &stage)
{
    return std::any_of(snapshot.events.begin(), snapshot.events.end(),
                       [&stage](const auto &event) { return event.stage == stage; });
}

void TestSeekOutputBoundary()
{
    PlaybackDiagnostics diagnostics;
    diagnostics.Reset();
    diagnostics.BeginSeek(PlaybackDiagnostics::Clock::now(), TARGET_PTS_US);
    diagnostics.RecordVideoSubmission(OLD_PTS_US, 10);
    Require(diagnostics.Snapshot().seekFirstOutputUs == -1, "Old worker output must not complete a seek");
    diagnostics.ArmSeekOutput();
    diagnostics.RecordVideoSubmission(TARGET_PTS_US, 20);
    diagnostics.EndSeek(true);
    const auto snapshot = diagnostics.Snapshot();
    Require(snapshot.seekFirstOutputUs >= 0 && snapshot.seekRebuildUs >= 0, "Seek timing is missing");
    Require(HasStage(snapshot, "seek.video.first.submit"), "Target video submission is missing");
    Require(snapshot.events.back().seekId == 1, "Seek events must share one ID");

    diagnostics.BeginSeek(PlaybackDiagnostics::Clock::now(), SUPERSEDED_PTS_US);
    diagnostics.ArmSeekOutput();
    diagnostics.BeginSeek(PlaybackDiagnostics::Clock::now(), FAILED_PTS_US);
    Require(HasStage(diagnostics.Snapshot(), "seek.superseded"), "Superseded seek is missing");
    diagnostics.ArmSeekOutput();
    diagnostics.EndSeek(false);
    diagnostics.RecordVideoSubmission(FAILED_PTS_US, 30);
    Require(diagnostics.Snapshot().seekFirstOutputUs == -1, "Failed seek must not accept output");
    Require(HasStage(diagnostics.Snapshot(), "seek.failed"), "Seek failure is missing");

    diagnostics.Reset();
    diagnostics.BeginSeek(PlaybackDiagnostics::Clock::now(), AUDIO_SEEK_PTS_US);
    diagnostics.ArmSeekOutput();
    diagnostics.RecordSeekOutput();
    Require(HasStage(diagnostics.Snapshot(), "seek.audio.first.output"), "Audio-only seek is missing");
}

void TestBoundedSamplesAndReset()
{
    PlaybackDiagnostics diagnostics;
    diagnostics.Reset();
    for (int64_t sample = 1; sample <= SAMPLE_COUNT; ++sample) {
        diagnostics.RecordVideoSubmission(sample, sample);
    }
    auto snapshot = diagnostics.Snapshot();
    Require(snapshot.presentCallSamples == SAMPLE_CAPACITY, "Presentation sample ring exceeded its bound");
    Require(snapshot.presentCallP95Us == EXPECTED_P95_US && snapshot.presentCallMaxUs == SAMPLE_COUNT,
            "P95/max are incorrect");
    for (int index = 0; index < EVENT_COUNT; ++index) {
        diagnostics.RecordEvent("test.event", index);
    }
    snapshot = diagnostics.Snapshot();
    Require(snapshot.events.size() == EVENT_CAPACITY, "Timeline exceeded its bound");
    Require(snapshot.events.back().sequence - snapshot.events.front().sequence == EVENT_SEQUENCE_SPAN,
            "Event order is broken");
    diagnostics.Reset();
    snapshot = diagnostics.Snapshot();
    Require(snapshot.events.size() == 1 && snapshot.events.front().stage == "playback.initialize",
            "Reset must begin a new session");
    Require(snapshot.presentCallSamples == 0 && snapshot.presentCallMaxUs == 0, "Reset leaked old samples");
}

void TestConcurrentSnapshots()
{
    PlaybackDiagnostics diagnostics;
    diagnostics.Reset();
    std::vector<std::thread> workers;
    for (int worker = 0; worker < WORKER_COUNT; ++worker) {
        workers.emplace_back([&diagnostics]() {
            for (int index = 0; index < WORKER_ITERATIONS; ++index) {
                diagnostics.RecordEvent("test.concurrent");
                diagnostics.RecordVideoSubmission(index, index);
                (void)diagnostics.Snapshot();
            }
        });
    }
    for (auto &worker : workers) {
        worker.join();
    }
    const auto snapshot = diagnostics.Snapshot();
    Require(snapshot.events.size() == EVENT_CAPACITY && snapshot.presentCallSamples == SAMPLE_CAPACITY,
            "Concurrent bounds are broken");
    Require(snapshot.events.back().sequence == EXPECTED_CONCURRENT_SEQUENCE, "Concurrent event writes were lost");
}

void TestSessionReportLifecycle()
{
    PlaybackDiagnostics diagnostics;
    diagnostics.Reset();
    diagnostics.SetSession("playback_test_1", "runMode=3; dump=0");
    Require(diagnostics.Snapshot().observedConfiguration == "not configured",
            "Unconfigured session must not claim observed output");
    diagnostics.SetObservedConfiguration("runMode=3; size=1920x1080");
    diagnostics.BeginSeek(PlaybackDiagnostics::Clock::now(), OLD_PTS_US);
    diagnostics.ArmSeekOutput();
    diagnostics.EndSeek(true);
    diagnostics.RecordVideoSubmission(OLD_PTS_US, 10);
    diagnostics.RecordEvent("playback.completed");
    const auto snapshot = diagnostics.Snapshot();
    Require(snapshot.sessionId == "playback_test_1" && snapshot.requestedConfiguration == "runMode=3; dump=0" &&
                snapshot.observedConfiguration == "runMode=3; size=1920x1080",
            "Seek or completion erased session configuration");
    Require(HasStage(snapshot, "playback.completed"), "Completion event is missing");
    diagnostics.Reset();
    const auto next = diagnostics.Snapshot();
    Require(next.sessionId.empty() && next.requestedConfiguration.empty() && next.observedConfiguration.empty(),
            "New initialization inherited the previous session report");
}

std::string ReadText(const std::filesystem::path &path)
{
    std::ifstream stream(path);
    return {std::istreambuf_iterator<char>(stream), std::istreambuf_iterator<char>()};
}

void TestDumpLifecycle()
{
    const auto name = std::to_string(PlaybackDiagnostics::Clock::now().time_since_epoch().count());
    const auto directory = std::filesystem::temp_directory_path() / ("avcodec_dump_test_" + name);
    std::filesystem::create_directory(directory);
    const auto path = directory / "output.h265";
    std::ofstream(path).close();
    DumpSession session;
    session.Open(path.string(), "mime=video/hevc");
    Require(ReadText(path.string() + ".session.txt").find("state=writing") == 0, "Initial dump state is missing");
    Require(session.CanWrite(DUMP_BYTES), "Small dump write should fit host storage");
    session.Written(DUMP_BYTES, DUMP_PTS_US);
    session.Stop("size_limit");
    session.Stop("completed");
    const auto metadata = ReadText(path.string() + ".session.txt");
    Require(metadata.find("state=size_limit") == 0 && metadata.find("bytes=4") != std::string::npos,
            "Final close replaced the stop reason or lost bytes");
    Require(metadata.find("lastPtsUs=5000") != std::string::npos, "Dump PTS is missing");
    Require(!session.CanWrite(1), "Terminal dump state accepted another write");
    session.Open(path.string(), "test=space");
    Require(!session.CanWrite(UINT64_MAX), "Impossible write bypassed storage protection");
    Require(ReadText(path.string() + ".session.txt").find("state=low_space") == 0, "Low-space reason is missing");
    Require(!std::filesystem::exists(path.string() + ".session.txt.pending"), "Metadata temporary file leaked");
    std::filesystem::remove_all(directory);
}
} // namespace

int main()
{
    TestSeekOutputBoundary();
    TestBoundedSamplesAndReset();
    TestConcurrentSnapshots();
    TestSessionReportLifecycle();
    TestDumpLifecycle();
    std::cout << "PlaybackDiagnostics/DumpSession: 5 groups passed\n";
    return EXIT_SUCCESS;
}
