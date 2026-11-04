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
#include <iterator>
#include <vector>
#include <cmath>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodePcmConverter.h"
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeFrameProcessor.h"

namespace {
constexpr int32_t TEST_SAMPLE_RATE_48000 = 48000;
constexpr int32_t TEST_STEREO_CHANNELS = 2;
constexpr int32_t TEST_UNSUPPORTED_CHANNELS = 6;
constexpr int32_t TEST_PCM_SAMPLE_BYTES = 2;
constexpr int32_t TEST_SOURCE_SAMPLE_COUNT = 1001;
constexpr int32_t INVALID_FILTER_ID = 99;
constexpr uint8_t PIXEL_PADDING_SENTINEL = 99;
constexpr uint8_t EXPECTED_FILTERED_PIXELS[] = {20, 60, 60, 100, 40, 50, PIXEL_PADDING_SENTINEL};
constexpr int32_t CROP_SOURCE_WIDTH = 8;
constexpr int32_t CROP_FRAME_HEIGHT = 4;
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr int32_t CHROMA_COMPONENTS = 2;
constexpr uint8_t CHROMA_TEST_STEP = 10;
constexpr uint8_t CROPPED_U = 20;
constexpr uint8_t CROPPED_V = 21;
constexpr int32_t CHROMA_V_COMPONENT_OFFSET = 1;
constexpr int32_t AREA_SOURCE_EDGE = 16;
constexpr int32_t AREA_TARGET_EDGE = 2;
constexpr uint8_t AREA_EXPECTED_LUMA = 32;
constexpr uint8_t MAX_PIXEL = 255;
constexpr uint8_t NEUTRAL_UV = 128;
constexpr int32_t AUDIO_TARGET_RATE = 16000;
constexpr int32_t AUDIO_TEST_SAMPLES = TEST_SAMPLE_RATE_48000;
constexpr int32_t AUDIO_AMPLITUDE = 12000;
constexpr int32_t AUDIO_PASSBAND_HZ = 1000;
constexpr int32_t AUDIO_STOPBAND_HZ = 12000;
constexpr int32_t AUDIO_EDGE_SKIP = 100;
constexpr double PI = 3.14159265358979323846;
constexpr double MAX_ALIAS_RATIO = 0.02;
constexpr double MIN_PASSBAND_RMS = 8000;
constexpr int32_t PCM_HIGH_BYTE_SHIFT = 8;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestPcmRate(int32_t sourceRate, int32_t targetRate, int32_t channels, bool lowPass)
{
    Require(sourceRate > 0, "Source sample rate must be positive");
    TranscodePcmConverter converter;
    Require(converter.Configure(sourceRate, targetRate, TEST_STEREO_CHANNELS, channels, lowPass),
        "Configure PCM converter");
    std::vector<uint8_t> output;
    const uint8_t sample[] = {0xFF, 0x7F, 0x01, 0x80};
    for (int32_t index = 0; index < TEST_SOURCE_SAMPLE_COUNT; ++index) {
        Require(!converter.Pending(), "Drain converter before consuming source sample");
        converter.Push(sample);
        while (converter.Pull(output)) {}
    }
    converter.Finish();
    while (converter.Pull(output)) {}
    const int64_t expected = (TEST_SOURCE_SAMPLE_COUNT * targetRate + sourceRate - 1) / sourceRate;
    Require(converter.Count() == expected &&
        output.size() == static_cast<size_t>(expected * channels * TEST_PCM_SAMPLE_BYTES),
        "Rational sample count and final fractional tail");
    if (channels == 1) {
        for (uint8_t value : output) {
            Require(value == 0, "Stereo downmix clipping");
        }
    }
    Require(!converter.Pending(), "No pending tail after drain");
}

void TestPcmRates()
{
    const int32_t rates[] = {8000, 44100, TEST_SAMPLE_RATE_48000, 96000};
    const int32_t channelCounts[] = {1, TEST_STEREO_CHANNELS};
    for (int32_t sourceRate : rates) {
        for (int32_t targetRate : rates) {
            for (int32_t channels : channelCounts) {
                TestPcmRate(sourceRate, targetRate, channels, false);
                TestPcmRate(sourceRate, targetRate, channels, true);
            }
        }
    }
    TranscodePcmConverter converter;
    Require(!converter.Configure(0, TEST_SAMPLE_RATE_48000, TEST_STEREO_CHANNELS, TEST_STEREO_CHANNELS),
        "Reject zero rate");
    Require(!converter.Configure(TEST_SAMPLE_RATE_48000, TEST_SAMPLE_RATE_48000,
        TEST_UNSUPPORTED_CHANNELS, TEST_STEREO_CHANNELS),
        "Reject unsupported channels");
    Require(converter.Configure(TEST_SAMPLE_RATE_48000, TEST_SAMPLE_RATE_48000, 1, TEST_STEREO_CHANNELS),
        "Mono duplication configuration");
    std::vector<uint8_t> output;
    const uint8_t mono[] = {0x34, 0x12};
    converter.Push(mono);
    converter.Pull(output);
    Require(output == std::vector<uint8_t>({0x34, 0x12, 0x34, 0x12}), "Duplicate mono to stereo");
}

void TestBilinear()
{
    using namespace TranscodeFrames;
    const Layout input {4, 4, 4, 4, Chroma::NV12};
    const Layout output {2, 2, 2, 2, Chroma::NV12};
    const std::vector<uint8_t> source = {0, 20, 40, 60, 20, 40, 60, 80,
        40, 60, 80, 100, 60, 80, 100, 120, 10, 20, 30, 40, 50, 60, 70, 80};
    std::vector<uint8_t> pixels(RequiredBytes(output) + 1, PIXEL_PADDING_SENTINEL);
    Require(Process(source.data(), source.size(), input, pixels.data(), pixels.size() - 1, output, false,
        ResizeMode::FIT, Filter::BILINEAR), "Bilinear processing");
    const std::vector<uint8_t> expectedPixels(std::begin(EXPECTED_FILTERED_PIXELS),
        std::end(EXPECTED_FILTERED_PIXELS));
    Require(pixels == expectedPixels, "Filtered luma, UV and bounds");
    const Layout same {4, 4, 4, 4, Chroma::NV12};
    std::vector<uint8_t> copy(source.size());
    Require(Process(source.data(), source.size(), input, copy.data(), copy.size(), same, false,
        ResizeMode::FIT, Filter::BILINEAR) && copy == source, "Same-size filter keeps exact fast path");
    Require(!Process(source.data(), source.size(), input, copy.data(), copy.size(), same, false,
        ResizeMode::FIT, static_cast<Filter>(INVALID_FILTER_ID)), "Reject invalid filter");
}

void TestCenterCropChromaOffset()
{
    using namespace TranscodeFrames;
    const Layout input {CROP_SOURCE_WIDTH, CROP_FRAME_HEIGHT, CROP_SOURCE_WIDTH, CROP_FRAME_HEIGHT, Chroma::NV12};
    const Layout output {CHROMA_SUBSAMPLING, CROP_FRAME_HEIGHT, CHROMA_SUBSAMPLING, CROP_FRAME_HEIGHT, Chroma::NV12};
    std::vector<uint8_t> source(RequiredBytes(input), 0);
    const size_t chromaOffset = static_cast<size_t>(input.stride) * input.sliceHeight;
    for (int32_t row = 0; row < input.height / CHROMA_SUBSAMPLING; ++row) {
        const size_t rowOffset = chromaOffset + static_cast<size_t>(row) * input.stride;
        for (int32_t pair = 0; pair < input.width / CHROMA_SUBSAMPLING; ++pair) {
            source[rowOffset + pair * CHROMA_COMPONENTS] = static_cast<uint8_t>(CHROMA_TEST_STEP * (pair + 1));
            source[rowOffset + pair * CHROMA_COMPONENTS + CHROMA_V_COMPONENT_OFFSET] =
                static_cast<uint8_t>(CHROMA_TEST_STEP * (pair + 1) + CHROMA_V_COMPONENT_OFFSET);
        }
    }
    std::vector<uint8_t> result(RequiredBytes(output));
    Require(Process(source.data(), source.size(), input, result.data(), result.size(), output, false,
        ResizeMode::CENTER_CROP, Filter::BILINEAR), "Center-crop processing");
    const size_t outputChromaOffset = static_cast<size_t>(output.stride) * output.sliceHeight;
    Require(result[outputChromaOffset] == CROPPED_U &&
        result[outputChromaOffset + CHROMA_V_COMPONENT_OFFSET] == CROPPED_V &&
        result[outputChromaOffset + output.stride] == CROPPED_U &&
        result[outputChromaOffset + output.stride + CHROMA_V_COMPONENT_OFFSET] == CROPPED_V,
        "Center crop applies chroma x offset");
}

void TestAreaReduction()
{
    using namespace TranscodeFrames;
    const Layout input {AREA_SOURCE_EDGE, AREA_SOURCE_EDGE, AREA_SOURCE_EDGE, AREA_SOURCE_EDGE, Chroma::NV12};
    const Layout output {AREA_TARGET_EDGE, AREA_TARGET_EDGE, AREA_TARGET_EDGE, AREA_TARGET_EDGE, Chroma::NV12};
    std::vector<uint8_t> source(RequiredBytes(input), NEUTRAL_UV);
    for (int32_t y = 0; y < input.height; ++y) {
        for (int32_t x = 0; x < input.width; ++x) {
            source[y * input.stride + x] = x % (AREA_SOURCE_EDGE / AREA_TARGET_EDGE) == 0 ? MAX_PIXEL : 0;
        }
    }
    std::vector<uint8_t> pixels(RequiredBytes(output));
    Require(Process(source.data(), source.size(), input, pixels.data(), pixels.size(), output, false,
        ResizeMode::FIT, Filter::AREA), "Area downsampling");
    for (int32_t i = 0; i < output.width * output.height; ++i) {
        Require(pixels[i] == AREA_EXPECTED_LUMA, "Area retains average of detail lost by point sampling");
    }
    Require(pixels.back() == NEUTRAL_UV, "Area preserves neutral chroma");
}

double ResampleTone(int32_t frequency, bool lowPass)
{
    TranscodePcmConverter converter;
    Require(converter.Configure(TEST_SAMPLE_RATE_48000, AUDIO_TARGET_RATE, 1, 1, lowPass), "Configure tone test");
    std::vector<uint8_t> output;
    for (int32_t i = 0; i < AUDIO_TEST_SAMPLES; ++i) {
        const int16_t value = static_cast<int16_t>(std::lround(AUDIO_AMPLITUDE *
            std::sin(2 * PI * frequency * i / TEST_SAMPLE_RATE_48000)));
        const uint8_t sample[] = {static_cast<uint8_t>(value),
            static_cast<uint8_t>(static_cast<uint16_t>(value) >> PCM_HIGH_BYTE_SHIFT)};
        converter.Push(sample);
        while (converter.Pull(output)) {}
    }
    converter.Finish();
    while (converter.Pull(output)) {}
    Require(converter.Count() == AUDIO_TARGET_RATE, "Low-pass preserves exact one-second sample count");
    double energy = 0;
    for (int32_t i = AUDIO_EDGE_SKIP; i < AUDIO_TARGET_RATE - AUDIO_EDGE_SKIP; ++i) {
        const int16_t value = static_cast<int16_t>(static_cast<uint16_t>(output[i * TEST_PCM_SAMPLE_BYTES]) |
            static_cast<uint16_t>(output[i * TEST_PCM_SAMPLE_BYTES + 1]) << PCM_HIGH_BYTE_SHIFT);
        energy += static_cast<double>(value) * value;
    }
    return std::sqrt(energy / (AUDIO_TARGET_RATE - AUDIO_EDGE_SKIP * 2));
}

void TestLowPass()
{
    Require(ResampleTone(AUDIO_STOPBAND_HZ, true) < ResampleTone(AUDIO_STOPBAND_HZ, false) * MAX_ALIAS_RATIO,
        "Suppress tones above target Nyquist instead of aliasing");
    Require(ResampleTone(AUDIO_PASSBAND_HZ, true) > MIN_PASSBAND_RMS, "Preserve passband amplitude");
    const int32_t shortLengths[] = {0, 1, 7, 31};
    for (int32_t length : shortLengths) {
        TranscodePcmConverter converter;
        converter.Configure(TEST_SAMPLE_RATE_48000, AUDIO_TARGET_RATE, 1, 1, true);
        std::vector<uint8_t> output;
        const uint8_t sample[] = {0, 0};
        for (int32_t i = 0; i < length; ++i) {
            converter.Push(sample);
            while (converter.Pull(output)) {}
        }
        converter.Finish();
        while (converter.Pull(output)) {}
        Require(converter.Count() == (length * AUDIO_TARGET_RATE + TEST_SAMPLE_RATE_48000 - 1) /
            TEST_SAMPLE_RATE_48000, "Flush short filter tails without changing duration");
    }
}
}

int main()
{
    TestPcmRates();
    TestBilinear();
    TestCenterCropChromaOffset();
    TestAreaReduction();
    TestLowPass();
    std::cout << "Transcode quality: filters, bounds, sample counts, channel conversion and tails passed\n";
}
