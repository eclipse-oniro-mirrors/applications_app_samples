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
#include <vector>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodePcmConverter.h"
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeFrameProcessor.h"

namespace {
void Require(bool condition, const char *message)
{
    if (!condition) { std::cerr << message << '\n'; std::exit(EXIT_FAILURE); }
}

void TestPcmRates()
{
    const int32_t rates[] = {8000, 44100, 48000, 96000};
    for (int32_t sourceRate : rates) {
        for (int32_t targetRate : rates) {
            for (int32_t channels : {1, 2}) {
                TranscodePcmConverter converter;
                Require(converter.Configure(sourceRate, targetRate, 2, channels), "Configure PCM converter");
                std::vector<uint8_t> output;
                // Opposite-sign stereo samples must downmix to zero without overflow.
                const uint8_t sample[] = {0xFF, 0x7F, 0x01, 0x80};
                constexpr int64_t samples = 1001;
                for (int64_t index = 0; index < samples; ++index) {
                    Require(!converter.Pending(), "Drain converter before consuming source sample");
                    converter.Push(sample);
                    while (converter.Pull(output)) {}
                }
                converter.Finish();
                while (converter.Pull(output)) {}
                const int64_t expected = (samples * targetRate + sourceRate - 1) / sourceRate;
                Require(converter.Count() == expected && output.size() == static_cast<size_t>(expected * channels * 2),
                    "Rational sample count and final fractional tail");
                if (channels == 1) {
                    for (uint8_t value : output) { Require(value == 0, "Stereo downmix clipping"); }
                }
                Require(!converter.Pending(), "No pending tail after drain");
            }
        }
    }
    TranscodePcmConverter converter;
    Require(!converter.Configure(0, 48000, 2, 2), "Reject zero rate");
    Require(!converter.Configure(48000, 48000, 6, 2), "Reject unsupported channels");
    Require(converter.Configure(48000, 48000, 1, 2), "Mono duplication configuration");
    std::vector<uint8_t> output;
    const uint8_t mono[] = {0x34, 0x12};
    converter.Push(mono); converter.Pull(output);
    Require(output == std::vector<uint8_t>({0x34, 0x12, 0x34, 0x12}), "Duplicate mono to stereo");
}

void TestBilinear()
{
    using namespace TranscodeFrames;
    const Layout input {4, 4, 4, 4, Chroma::NV12};
    const Layout output {2, 2, 2, 2, Chroma::NV12};
    const std::vector<uint8_t> source = {0, 20, 40, 60, 20, 40, 60, 80,
        40, 60, 80, 100, 60, 80, 100, 120, 10, 20, 30, 40, 50, 60, 70, 80};
    std::vector<uint8_t> pixels(RequiredBytes(output) + 1, 99);
    Require(Process(source.data(), source.size(), input, pixels.data(), pixels.size() - 1, output, false,
        ResizeMode::FIT, Filter::BILINEAR), "Bilinear processing");
    Require(pixels == std::vector<uint8_t>({20, 60, 60, 100, 40, 50, 99}), "Filtered luma, UV and bounds");
    const Layout same {4, 4, 4, 4, Chroma::NV12};
    std::vector<uint8_t> copy(source.size());
    Require(Process(source.data(), source.size(), input, copy.data(), copy.size(), same, false,
        ResizeMode::FIT, Filter::BILINEAR) && copy == source, "Same-size filter keeps exact fast path");
    Require(!Process(source.data(), source.size(), input, copy.data(), copy.size(), same, false,
        ResizeMode::FIT, static_cast<Filter>(99)), "Reject invalid filter");
}
}

int main()
{
    TestPcmRates();
    TestBilinear();
    std::cout << "Transcode quality: filters, bounds, sample counts, channel conversion and tails passed\n";
}
