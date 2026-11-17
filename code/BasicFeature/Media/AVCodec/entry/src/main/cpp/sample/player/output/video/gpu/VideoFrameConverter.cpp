/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "VideoFrameConverter.h"

#include <algorithm>
#include <array>
#include <cmath>
#include <limits>

#include "av_codec_sample_log.h"

namespace {
constexpr int32_t YUV_DIVISOR = 2;
constexpr int32_t RGBA_BYTES_PER_PIXEL = 4;
constexpr int32_t BYTE_COUNT = 1;
constexpr int32_t TEN_BIT_STORAGE_BYTES = 2;
constexpr int32_t EIGHT_BIT_MAX = 255;
constexpr int32_t TEN_BIT_MAX = 1023;
constexpr int32_t TEN_BIT_TO_EIGHT_BIT_ROUNDING = 2;
constexpr int32_t TEN_BIT_TO_EIGHT_BIT_SHIFT = 2;
constexpr int32_t RGBA1010102_GREEN_SHIFT = 10;
constexpr int32_t RGBA1010102_BLUE_SHIFT = 20;
constexpr int32_t RGBA1010102_ALPHA_SHIFT = 30;
constexpr uint32_t BYTE_BITS = 8U;
constexpr uint32_t TWO_BYTES_BITS = BYTE_BITS * 2U;
constexpr uint32_t THREE_BYTES_BITS = BYTE_BITS * 3U;
constexpr uint32_t RGBA1010102_COLOR_MASK = 0x3FFU;
constexpr uint32_t RGBA1010102_ALPHA_MASK = 0x3U;
constexpr uint32_t RGBA1010102_COLOR_ROUNDING = 511U;
constexpr uint32_t TEN_BIT_SAMPLE_SHIFT = 6U;
constexpr uint32_t UV_SAMPLES_PER_PIXEL = 2U;
constexpr int32_t ROTATION_90_DEGREES = 90;
constexpr int32_t ROTATION_180_DEGREES = 180;
constexpr int32_t ROTATION_270_DEGREES = 270;
constexpr int32_t ROTATION_FULL_CIRCLE_DEGREES = 360;
constexpr int32_t SDR_LUT_SIZE = 1024;
constexpr int64_t GPU_UPLOAD_MAX_PIXELS = 1280LL * 720LL;
constexpr int64_t GPU_PORTRAIT_UPLOAD_MAX_PIXELS = 960LL * 540LL;
constexpr int32_t ROTATION_TILE_EDGE = 32;
constexpr float YUV_LUMA_OFFSET = 16.0F;
constexpr float YUV_LUMA_RANGE = 219.0F;
constexpr float YUV_CHROMA_OFFSET = 128.0F;
constexpr float YUV_CHROMA_RANGE = 224.0F;
constexpr int32_t BT601_LUMA_MULTIPLIER = 298;
constexpr int32_t BT601_RED_MULTIPLIER = 409;
constexpr int32_t BT601_GREEN_BLUE_MULTIPLIER = 100;
constexpr int32_t BT601_GREEN_RED_MULTIPLIER = 208;
constexpr int32_t BT601_BLUE_MULTIPLIER = 516;
constexpr int32_t BT601_ROUNDING = 128;
constexpr int32_t BT601_SHIFT = 8;
constexpr float HALF_SAMPLE = 0.5F;
constexpr float ONE_F = 1.0F;
constexpr float SRGB_GAMMA_DENOMINATOR = 2.2F;
constexpr int32_t CENTER_DIVISOR = 2;
constexpr float HLG_LINEAR_DIVISOR = 3.0F;
constexpr float HLG_LOG_DIVISOR = 12.0F;
constexpr int32_t CHROMA_SAMPLE_BYTES = 2;
constexpr int32_t MIN_EVEN_DIMENSION = 2;
constexpr int32_t SDR_BLACK_LEVEL = 16;
constexpr int32_t BIT_SHIFT_FOR_TEN_BIT = 6;
constexpr int32_t RGBA_RED_INDEX = 0;
constexpr int32_t RGBA_GREEN_INDEX = 1;
constexpr int32_t RGBA_BLUE_INDEX = 2;
constexpr int32_t RGBA_ALPHA_INDEX = 3;
constexpr float HDR_RED_FROM_CHROMA = 1.4746F;
constexpr float HDR_GREEN_FROM_BLUE = 0.16455F;
constexpr float HDR_GREEN_FROM_RED = 0.57135F;
constexpr float HDR_BLUE_FROM_CHROMA = 1.8814F;
constexpr float BT709_RED_FROM_RED = 1.6605F;
constexpr float BT709_RED_FROM_GREEN = 0.5876F;
constexpr float BT709_RED_FROM_BLUE = 0.0728F;
constexpr float BT709_GREEN_FROM_RED = 0.1246F;
constexpr float BT709_GREEN_FROM_GREEN = 1.1329F;
constexpr float BT709_GREEN_FROM_BLUE = 0.0083F;
constexpr float BT709_BLUE_FROM_RED = 0.0182F;
constexpr float BT709_BLUE_FROM_GREEN = 0.1006F;
constexpr float BT709_BLUE_FROM_BLUE = 1.1187F;

struct Yuv420Layout {
    const uint8_t *yPlane = nullptr;
    const uint8_t *uPlane = nullptr;
    const uint8_t *vPlane = nullptr;
    const uint8_t *uvPlane = nullptr;
    int32_t stride = 0;
    int32_t chromaStride = 0;
    bool planar = false;
    bool tenBit = false;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
};

struct YuvSample {
    int32_t y = 0;
    int32_t u = static_cast<int32_t>(YUV_CHROMA_OFFSET);
    int32_t v = static_cast<int32_t>(YUV_CHROMA_OFFSET);
};

struct RgbaScalingContext {
    const uint8_t *source = nullptr;
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    int32_t stride = 0;
    int32_t outputWidth = 0;
    int32_t outputHeight = 0;
    std::vector<uint8_t> &rgba;
};

struct Yuv420LayoutRequest {
    const uint8_t *source = nullptr;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    bool tenBit = false;
};

struct Yuv420BufferRequest {
    int32_t width = 0;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    bool tenBit = false;
};

struct Yuv420ConversionContext {
    const Yuv420Layout &layout;
    const SampleInfo &sampleInfo;
    VideoFrameConverter::FrameSize source;
    VideoFrameConverter::FrameSize output;
    std::vector<uint8_t> &rgba;
};

struct FitRgbaContext {
    const std::vector<uint8_t> &source;
    std::vector<uint8_t> &rgba;
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    int32_t targetWidth = 0;
    int32_t fittedWidth = 0;
    int32_t fittedHeight = 0;
    int32_t left = 0;
    int32_t top = 0;
    int32_t rotation = 0;
};

double DivideByPositive(double numerator, double denominator)
{
    double quotient = 0.0;
    if (denominator > 0.0) {
        quotient = numerator / denominator;
    }
    return quotient;
}

int32_t DivideIntegerByPositive(int32_t numerator, int32_t denominator)
{
    int32_t quotient = 0;
    if (denominator > 0) {
        quotient = numerator / denominator;
    }
    return quotient;
}

float ClampUnit(float value)
{
    return std::clamp(value, 0.0F, 1.0F);
}

std::array<float, EIGHT_BIT_MAX + 1> BuildHlgTransferLut()
{
    std::array<float, EIGHT_BIT_MAX + 1> values {};
    constexpr float hlgA = 0.17883277F;
    constexpr float hlgB = 0.28466892F;
    constexpr float hlgC = 0.55991073F;
    for (int32_t index = 0; index <= EIGHT_BIT_MAX; ++index) {
        const float encoded = static_cast<float>(index) / EIGHT_BIT_MAX;
        values[index] = encoded <= HALF_SAMPLE ? encoded * encoded / HLG_LINEAR_DIVISOR :
            (std::exp((encoded - hlgC) / hlgA) + hlgB) / HLG_LOG_DIVISOR;
    }
    return values;
}

std::array<float, EIGHT_BIT_MAX + 1> BuildPqTransferLut()
{
    std::array<float, EIGHT_BIT_MAX + 1> values {};
    constexpr float pqM1 = 0.15930176F;
    constexpr float pqM2 = 78.84375F;
    constexpr float pqC1 = 0.8359375F;
    constexpr float pqC2 = 18.8515625F;
    constexpr float pqC3 = 18.6875F;
    for (int32_t index = 0; index <= EIGHT_BIT_MAX; ++index) {
        const float encoded = static_cast<float>(index) / EIGHT_BIT_MAX;
        const float power = std::pow(encoded, ONE_F / pqM2);
        const float numerator = std::max(power - pqC1, 0.0F);
        const float rawDenominator = pqC2 - pqC3 * power;
        if (rawDenominator <= 0.0F) {
            values[index] = 0;
            continue;
        }
        values[index] = std::pow(numerator / rawDenominator, ONE_F / pqM1);
    }
    return values;
}

const std::array<float, EIGHT_BIT_MAX + 1> &GetHdrTransferLut(OH_TransferCharacteristic transfer)
{
    static const std::array<float, EIGHT_BIT_MAX + 1> hlgLut = BuildHlgTransferLut();
    static const std::array<float, EIGHT_BIT_MAX + 1> pqLut = BuildPqTransferLut();
    return transfer == TRANSFER_CHARACTERISTIC_PQ ? pqLut : hlgLut;
}

std::array<uint8_t, SDR_LUT_SIZE + 1> BuildSdrOutputLut()
{
    std::array<uint8_t, SDR_LUT_SIZE + 1> values {};
    constexpr float hdrToSdrExposure = 2.5F;
    constexpr float srgbGamma = ONE_F / SRGB_GAMMA_DENOMINATOR;
    for (int32_t index = 0; index <= SDR_LUT_SIZE; ++index) {
        const float linear = static_cast<float>(index) / SDR_LUT_SIZE;
        const float toneMapped = linear * hdrToSdrExposure /
            (ONE_F + linear * hdrToSdrExposure);
        values[index] = static_cast<uint8_t>(std::lround(std::pow(toneMapped, srgbGamma) * EIGHT_BIT_MAX));
    }
    return values;
}

uint8_t EncodeSdr(float linear)
{
    static const std::array<uint8_t, SDR_LUT_SIZE + 1> outputLut = BuildSdrOutputLut();
    const int32_t index = static_cast<int32_t>(std::lround(ClampUnit(linear) * SDR_LUT_SIZE));
    return outputLut[std::clamp(index, 0, SDR_LUT_SIZE)];
}

uint8_t ToEightBitSample(int32_t sample, bool tenBit)
{
    if (!tenBit) {
        return static_cast<uint8_t>(std::clamp(sample, 0, EIGHT_BIT_MAX));
    }
    return static_cast<uint8_t>(std::clamp((sample + TEN_BIT_TO_EIGHT_BIT_ROUNDING) >>
        TEN_BIT_TO_EIGHT_BIT_SHIFT, 0, EIGHT_BIT_MAX));
}

void ConvertHdrYuvToBt709(uint8_t y, uint8_t u, uint8_t v, OH_TransferCharacteristic transfer, uint8_t *pixel)
{
    const float luma = ClampUnit((static_cast<float>(y) - YUV_LUMA_OFFSET) / YUV_LUMA_RANGE);
    const float chromaBlue = (static_cast<float>(u) - YUV_CHROMA_OFFSET) / YUV_CHROMA_RANGE;
    const float chromaRed = (static_cast<float>(v) - YUV_CHROMA_OFFSET) / YUV_CHROMA_RANGE;
    const float redPrime = ClampUnit(luma + HDR_RED_FROM_CHROMA * chromaRed);
    const float greenPrime = ClampUnit(luma - HDR_GREEN_FROM_BLUE * chromaBlue - HDR_GREEN_FROM_RED * chromaRed);
    const float bluePrime = ClampUnit(luma + HDR_BLUE_FROM_CHROMA * chromaBlue);
    const std::array<float, EIGHT_BIT_MAX + 1> &transferLut = GetHdrTransferLut(transfer);
    const auto toLutIndex = [](float value) -> size_t {
        return static_cast<size_t>(std::lround(value * EIGHT_BIT_MAX));
    };
    const float red = transferLut[toLutIndex(redPrime)];
    const float green = transferLut[toLutIndex(greenPrime)];
    const float blue = transferLut[toLutIndex(bluePrime)];
    pixel[RGBA_RED_INDEX] = EncodeSdr(BT709_RED_FROM_RED * red - BT709_RED_FROM_GREEN * green -
        BT709_RED_FROM_BLUE * blue);
    pixel[RGBA_GREEN_INDEX] = EncodeSdr(-BT709_GREEN_FROM_RED * red + BT709_GREEN_FROM_GREEN * green -
        BT709_GREEN_FROM_BLUE * blue);
    pixel[RGBA_BLUE_INDEX] = EncodeSdr(-BT709_BLUE_FROM_RED * red - BT709_BLUE_FROM_GREEN * green +
        BT709_BLUE_FROM_BLUE * blue);
    pixel[RGBA_ALPHA_INDEX] = EIGHT_BIT_MAX;
}

uint8_t *GetSource(const CodecBufferInfo &bufferInfo)
{
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0) {
        return nullptr;
    }
    uint8_t *address = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    return address == nullptr ? nullptr : address + bufferInfo.attr.offset;
}

int32_t GetWidth(const SampleInfo &sampleInfo, const CodecUserData &context)
{
    return context.width > 0 ? context.width : sampleInfo.video.videoWidth;
}

int32_t GetHeight(const SampleInfo &sampleInfo, const CodecUserData &context)
{
    return context.height > 0 ? context.height : sampleInfo.video.videoHeight;
}

int32_t GetStride(const SampleInfo &sampleInfo, const CodecUserData &context, int32_t width)
{
    if (context.widthStride > 0) {
        return context.widthStride;
    }
    const bool tenBit = IsTenBitHevcOutput(sampleInfo.video);
    return width * (tenBit ? TEN_BIT_STORAGE_BYTES : BYTE_COUNT);
}

OH_AVPixelFormat GetOutputPixelFormat(const SampleInfo &sampleInfo, const CodecUserData &context)
{
    (void)sampleInfo;
    return context.outputPixelFormat;
}

bool IsTenBitOutput(const SampleInfo &sampleInfo, const CodecUserData &context)
{
    const OH_AVPixelFormat outputFormat = GetOutputPixelFormat(sampleInfo, context);
    if (outputFormat == AV_PIXEL_FORMAT_RGBA1010102) {
        return true;
    }
    if (outputFormat != AV_PIXEL_FORMAT_NV12 && outputFormat != AV_PIXEL_FORMAT_NV21 &&
        outputFormat != AV_PIXEL_FORMAT_YUVI420) {
        return false;
    }
    // 行跨度包含实现相关的对齐信息，不能据此识别 P010：窄幅 8-bit 帧的行跨度也可能大于可见宽度的两倍。
    // 应改用解码格式和码流元数据判断。
    return IsTenBitHevcOutput(sampleInfo.video);
}

int32_t GetSliceHeight(const SampleInfo &sampleInfo, const CodecUserData &context, int32_t height)
{
    (void)sampleInfo;
    return context.heightStride > 0 ? context.heightStride : height;
}

bool MultiplySize(size_t left, size_t right, size_t &result)
{
    if (right != 0 && left > std::numeric_limits<size_t>::max() / right) {
        return false;
    }
    result = left * right;
    return true;
}

int32_t NormalizeRotation(int32_t rotation)
{
    int32_t normalized = rotation % ROTATION_FULL_CIRCLE_DEGREES;
    if (normalized < 0) {
        normalized += ROTATION_FULL_CIRCLE_DEGREES;
    }
    if (normalized == ROTATION_90_DEGREES || normalized == ROTATION_180_DEGREES ||
        normalized == ROTATION_270_DEGREES) {
        return normalized;
    }
    return 0;
}

void CopyRgbaPixel(const uint8_t *source, uint8_t *target)
{
    std::copy_n(source, RGBA_BYTES_PER_PIXEL, target);
}

uint32_t ReadRgba1010102(const uint8_t *source)
{
    return static_cast<uint32_t>(source[RGBA_RED_INDEX]) |
        (static_cast<uint32_t>(source[RGBA_GREEN_INDEX]) << BYTE_BITS) |
        (static_cast<uint32_t>(source[RGBA_BLUE_INDEX]) << TWO_BYTES_BITS) |
        (static_cast<uint32_t>(source[RGBA_ALPHA_INDEX]) << THREE_BYTES_BITS);
}

bool ResizeRgbaBuffer(int32_t width, int32_t height, std::vector<uint8_t> &rgba)
{
    size_t pixels = 0;
    size_t bytes = 0;
    if (width <= 0 || height <= 0 ||
        !MultiplySize(static_cast<size_t>(width), static_cast<size_t>(height), pixels) ||
        !MultiplySize(pixels, RGBA_BYTES_PER_PIXEL, bytes)) {
        return false;
    }
    rgba.resize(bytes);
    return true;
}

int32_t ScaleCoordinate(int32_t coordinate, int32_t sourceExtent, int32_t targetExtent)
{
    if (sourceExtent <= 0 || targetExtent <= 0) {
        return 0;
    }
    return DivideIntegerByPositive(coordinate * sourceExtent, targetExtent);
}

uint8_t ScaleTenBitColor(uint32_t value)
{
    return static_cast<uint8_t>((value * EIGHT_BIT_MAX + RGBA1010102_COLOR_ROUNDING) / TEN_BIT_MAX);
}

uint8_t ScaleTenBitAlpha(uint32_t value)
{
    return static_cast<uint8_t>(value * EIGHT_BIT_MAX / RGBA1010102_ALPHA_MASK);
}

void ConvertRgba1010102Pixel(uint32_t packed, uint8_t *destination)
{
    destination[RGBA_RED_INDEX] = ScaleTenBitColor(packed & RGBA1010102_COLOR_MASK);
    destination[RGBA_GREEN_INDEX] = ScaleTenBitColor((packed >> RGBA1010102_GREEN_SHIFT) &
        RGBA1010102_COLOR_MASK);
    destination[RGBA_BLUE_INDEX] = ScaleTenBitColor((packed >> RGBA1010102_BLUE_SHIFT) &
        RGBA1010102_COLOR_MASK);
    destination[RGBA_ALPHA_INDEX] = ScaleTenBitAlpha((packed >> RGBA1010102_ALPHA_SHIFT) &
        RGBA1010102_ALPHA_MASK);
}

void ConvertRgba1010102Row(const uint8_t *source, int32_t sourceWidth, int32_t outputWidth, uint8_t *target)
{
    for (int32_t column = 0; column < outputWidth; ++column) {
        const int32_t sourceColumn = ScaleCoordinate(column, sourceWidth, outputWidth);
        const uint32_t packed = ReadRgba1010102(source +
            static_cast<size_t>(sourceColumn) * RGBA_BYTES_PER_PIXEL);
        ConvertRgba1010102Pixel(packed, target + static_cast<size_t>(column) * RGBA_BYTES_PER_PIXEL);
    }
}

void ConvertRgba1010102(const RgbaScalingContext &context)
{
    for (int32_t row = 0; row < context.outputHeight; ++row) {
        const int32_t sourceRow = ScaleCoordinate(row, context.sourceHeight, context.outputHeight);
        const uint8_t *rowSource = context.source + static_cast<size_t>(sourceRow) * context.stride;
        uint8_t *target = context.rgba.data() + static_cast<size_t>(row) * context.outputWidth *
            RGBA_BYTES_PER_PIXEL;
        ConvertRgba1010102Row(rowSource, context.sourceWidth, context.outputWidth, target);
    }
}

void CopyRgbaRows(const uint8_t *source, int32_t sourceWidth, int32_t sourceHeight, int32_t stride,
    std::vector<uint8_t> &rgba)
{
    const size_t rowBytes = static_cast<size_t>(sourceWidth) * RGBA_BYTES_PER_PIXEL;
    for (int32_t row = 0; row < sourceHeight; ++row) {
        uint8_t *destination = rgba.data() + static_cast<size_t>(row) * rowBytes;
        const uint8_t *sourceRow = source + static_cast<size_t>(row) * stride;
        std::copy_n(sourceRow, rowBytes, destination);
    }
}

void ScaleRgbaRow(const uint8_t *source, int32_t sourceWidth, int32_t outputWidth, uint8_t *target)
{
    for (int32_t column = 0; column < outputWidth; ++column) {
        const int32_t sourceColumn = ScaleCoordinate(column, sourceWidth, outputWidth);
        const uint8_t *sourcePixel = source + static_cast<size_t>(sourceColumn) * RGBA_BYTES_PER_PIXEL;
        CopyRgbaPixel(sourcePixel, target + static_cast<size_t>(column) * RGBA_BYTES_PER_PIXEL);
    }
}

void ScaleRgba(const RgbaScalingContext &context)
{
    for (int32_t row = 0; row < context.outputHeight; ++row) {
        const int32_t sourceRow = ScaleCoordinate(row, context.sourceHeight, context.outputHeight);
        const uint8_t *sourceRowStart = context.source + static_cast<size_t>(sourceRow) * context.stride;
        uint8_t *target = context.rgba.data() + static_cast<size_t>(row) * context.outputWidth *
            RGBA_BYTES_PER_PIXEL;
        ScaleRgbaRow(sourceRowStart, context.sourceWidth, context.outputWidth, target);
    }
}

YuvSample ReadYuvSample(const Yuv420Layout &layout, int32_t sourceRow, int32_t sourceColumn)
{
    const int32_t chromaRow = sourceRow / YUV_DIVISOR;
    const int32_t chromaColumn = sourceColumn / YUV_DIVISOR;
    YuvSample sample;
    if (layout.tenBit) {
        const auto *yRow = reinterpret_cast<const uint16_t *>(layout.yPlane +
            static_cast<size_t>(sourceRow) * layout.stride);
        sample.y = yRow[sourceColumn] >> BIT_SHIFT_FOR_TEN_BIT;
        if (layout.planar) {
            const auto *uRow = reinterpret_cast<const uint16_t *>(layout.uPlane +
                static_cast<size_t>(chromaRow) * layout.chromaStride);
            const auto *vRow = reinterpret_cast<const uint16_t *>(layout.vPlane +
                static_cast<size_t>(chromaRow) * layout.chromaStride);
            sample.u = uRow[chromaColumn] >> BIT_SHIFT_FOR_TEN_BIT;
            sample.v = vRow[chromaColumn] >> BIT_SHIFT_FOR_TEN_BIT;
        } else {
            const auto *uvRow = reinterpret_cast<const uint16_t *>(layout.uvPlane +
                static_cast<size_t>(chromaRow) * layout.stride);
            const int32_t uvIndex = chromaColumn * UV_SAMPLES_PER_PIXEL;
            sample.u = uvRow[uvIndex] >> BIT_SHIFT_FOR_TEN_BIT;
            sample.v = uvRow[uvIndex + BYTE_COUNT] >> BIT_SHIFT_FOR_TEN_BIT;
        }
    } else {
        sample.y = layout.yPlane[static_cast<size_t>(sourceRow) * layout.stride + sourceColumn];
        if (layout.planar) {
            sample.u = layout.uPlane[static_cast<size_t>(chromaRow) * layout.chromaStride + chromaColumn];
            sample.v = layout.vPlane[static_cast<size_t>(chromaRow) * layout.chromaStride + chromaColumn];
        } else {
            const uint8_t *uvRow = layout.uvPlane + static_cast<size_t>(chromaRow) * layout.stride;
            const int32_t uvIndex = chromaColumn * UV_SAMPLES_PER_PIXEL;
            sample.u = uvRow[uvIndex];
            sample.v = uvRow[uvIndex + BYTE_COUNT];
        }
    }
    if (layout.pixelFormat == AV_PIXEL_FORMAT_NV21) {
        std::swap(sample.u, sample.v);
    }
    return sample;
}

bool BuildYuv420Layout(const Yuv420LayoutRequest &request, Yuv420Layout &layout)
{
    size_t ySize = 0;
    if (request.source == nullptr || request.stride <= 0 || request.sliceHeight <= 0 ||
        !MultiplySize(static_cast<size_t>(request.stride), static_cast<size_t>(request.sliceHeight), ySize)) {
        return false;
    }
    layout = {};
    layout.yPlane = request.source;
    layout.stride = request.stride;
    layout.planar = request.pixelFormat == AV_PIXEL_FORMAT_YUVI420;
    layout.tenBit = request.tenBit;
    layout.pixelFormat = request.pixelFormat;
    if (!layout.planar) {
        layout.uvPlane = request.source + ySize;
        return true;
    }
    layout.chromaStride = request.stride / YUV_DIVISOR;
    size_t chromaSize = 0;
    if (layout.chromaStride <= 0 || !MultiplySize(static_cast<size_t>(layout.chromaStride),
        static_cast<size_t>(request.sliceHeight / YUV_DIVISOR), chromaSize)) {
        return false;
    }
    layout.uPlane = request.source + ySize;
    layout.vPlane = layout.uPlane + chromaSize;
    return true;
}

uint8_t ClampColorValue(int32_t value)
{
    return static_cast<uint8_t>(std::clamp(value, 0, EIGHT_BIT_MAX));
}

void WriteSdrYuvPixel(const YuvSample &sample, bool tenBit, uint8_t *pixel)
{
    const uint8_t y8 = ToEightBitSample(sample.y, tenBit);
    const uint8_t u8 = ToEightBitSample(sample.u, tenBit);
    const uint8_t chromaRed8 = ToEightBitSample(sample.v, tenBit);
    const int32_t c = std::max(0, static_cast<int32_t>(y8) - SDR_BLACK_LEVEL);
    const int32_t d = static_cast<int32_t>(u8) - static_cast<int32_t>(YUV_CHROMA_OFFSET);
    const int32_t e = static_cast<int32_t>(chromaRed8) - static_cast<int32_t>(YUV_CHROMA_OFFSET);
    pixel[RGBA_RED_INDEX] = ClampColorValue((BT601_LUMA_MULTIPLIER * c +
        BT601_RED_MULTIPLIER * e + BT601_ROUNDING) >> BT601_SHIFT);
    pixel[RGBA_GREEN_INDEX] = ClampColorValue((BT601_LUMA_MULTIPLIER * c -
        BT601_GREEN_BLUE_MULTIPLIER * d - BT601_GREEN_RED_MULTIPLIER * e + BT601_ROUNDING) >> BT601_SHIFT);
    pixel[RGBA_BLUE_INDEX] = ClampColorValue((BT601_LUMA_MULTIPLIER * c +
        BT601_BLUE_MULTIPLIER * d + BT601_ROUNDING) >> BT601_SHIFT);
    pixel[RGBA_ALPHA_INDEX] = EIGHT_BIT_MAX;
}

void WriteYuv420Pixel(const YuvSample &sample, bool tenBit, const SampleInfo &sampleInfo, uint8_t *pixel)
{
    if (!sampleInfo.codec.convertHdrVividToBt709) {
        WriteSdrYuvPixel(sample, tenBit, pixel);
        return;
    }
    ConvertHdrYuvToBt709(ToEightBitSample(sample.y, tenBit), ToEightBitSample(sample.u, tenBit),
        ToEightBitSample(sample.v, tenBit), sampleInfo.video.transfer, pixel);
}

void ConvertYuv420Rows(const Yuv420ConversionContext &context)
{
    for (int32_t row = 0; row < context.output.height; ++row) {
        const int32_t sourceRow = ScaleCoordinate(row, context.source.height, context.output.height);
        for (int32_t column = 0; column < context.output.width; ++column) {
            const int32_t sourceColumn = ScaleCoordinate(column, context.source.width, context.output.width);
            const YuvSample sample = ReadYuvSample(context.layout, sourceRow, sourceColumn);
            uint8_t *pixel = context.rgba.data() +
                (static_cast<size_t>(row) * context.output.width + column) * RGBA_BYTES_PER_PIXEL;
            WriteYuv420Pixel(sample, context.layout.tenBit, context.sampleInfo, pixel);
        }
    }
}
} // 匿名命名空间

uint8_t VideoFrameConverter::ClampColor(int32_t value)
{
    return ClampColorValue(value);
}

bool VideoFrameConverter::ToRgba(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
    const CodecUserData &context, std::vector<uint8_t> &rgba)
{
    return ToRgbaScaled(bufferInfo, sampleInfo, context, {}, rgba);
}

bool VideoFrameConverter::ToRgbaScaled(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
    const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba)
{
    if (!ValidateBufferSize(bufferInfo, sampleInfo, context)) {
        AVCODEC_SAMPLE_LOGW("Decoded video buffer is smaller than the requested image layout");
        return false;
    }
    const uint8_t *source = GetSource(bufferInfo);
    if (source == nullptr) {
        AVCODEC_SAMPLE_LOGE("Video frame address is null");
        return false;
    }
    const OH_AVPixelFormat pixelFormat = GetOutputPixelFormat(sampleInfo, context);
    switch (pixelFormat) {
        case AV_PIXEL_FORMAT_RGBA:
        case AV_PIXEL_FORMAT_RGBA1010102:
            return ConvertRgba(source, sampleInfo, context, target, rgba);
        case AV_PIXEL_FORMAT_YUVI420:
        case AV_PIXEL_FORMAT_NV12:
        case AV_PIXEL_FORMAT_NV21:
            return ConvertYuv420(source, sampleInfo, context, target, rgba);
        default:
            AVCODEC_SAMPLE_LOGW("GPU sink does not support pixel format: %{public}d",
                pixelFormat);
            return false;
    }
}

VideoFrameConverter::FrameSize VideoFrameConverter::GetScaledFrameSize(const FrameScaleRequest &request)
{
    FrameSize target = request.source;
    if (request.source.width <= 0 || request.source.height <= 0 || request.output.width <= 0 ||
        request.output.height <= 0) {
        return target;
    }
    const int32_t normalizedRotation = NormalizeRotation(request.rotation);
    const bool quarterTurn = normalizedRotation == ROTATION_90_DEGREES ||
        normalizedRotation == ROTATION_270_DEGREES;
    const int32_t displayWidth = quarterTurn ? request.source.height : request.source.width;
    const int32_t displayHeight = quarterTurn ? request.source.width : request.source.height;
    if (displayWidth <= 0 || displayHeight <= 0) {
        return target;
    }
    const double scale = std::min(1.0, std::min(
        DivideByPositive(static_cast<double>(request.output.width), displayWidth),
        DivideByPositive(static_cast<double>(request.output.height), displayHeight)));
    target.width = std::max(1, static_cast<int32_t>(request.source.width * scale));
    target.height = std::max(1, static_cast<int32_t>(request.source.height * scale));
    const int64_t targetPixels = static_cast<int64_t>(target.width) * target.height;
    // GPU 示例路径会先在 CPU 上转换 Buffer 输出，再上传。四分之一旋转帧在 Vulkan 路径中会增加一次内存遍历，
    // 因而为竖屏上传设置更小的像素预算，以保持 4K 高帧率视频的解码输出线程响应及时。
    const int64_t normalLimit = request.maxUploadPixels > 0 ? request.maxUploadPixels : GPU_UPLOAD_MAX_PIXELS;
    const int64_t portraitLimit = request.maxPortraitUploadPixels > 0 ? request.maxPortraitUploadPixels :
        GPU_PORTRAIT_UPLOAD_MAX_PIXELS;
    const int64_t pixelLimit = quarterTurn ? portraitLimit : normalLimit;
    if (targetPixels <= pixelLimit) {
        return target;
    }
    if (targetPixels <= 0 || pixelLimit <= 0) {
        return target;
    }
    const double uploadScale = std::sqrt(static_cast<double>(pixelLimit) / targetPixels);
    target.width = std::max(MIN_EVEN_DIMENSION, static_cast<int32_t>(target.width * uploadScale) & ~1);
    target.height = std::max(MIN_EVEN_DIMENSION, static_cast<int32_t>(target.height * uploadScale) & ~1);
    return target;
}

bool GetRgbaBufferSize(int32_t width, int32_t height, int32_t stride, size_t &required)
{
    if (width <= 0 || height <= 0 || stride <= 0) {
        return false;
    }
    size_t rowBytes = 0;
    if (!MultiplySize(static_cast<size_t>(height - BYTE_COUNT), static_cast<size_t>(stride), required) ||
        !MultiplySize(static_cast<size_t>(width), RGBA_BYTES_PER_PIXEL, rowBytes) ||
        required > std::numeric_limits<size_t>::max() - rowBytes) {
        return false;
    }
    required += rowBytes;
    return true;
}

bool IsYuv420RowLayoutValid(int32_t width, int32_t stride, bool tenBit)
{
    size_t rowBytes = 0;
    const size_t bytesPerSample = tenBit ? TEN_BIT_STORAGE_BYTES : BYTE_COUNT;
    return MultiplySize(static_cast<size_t>(width), bytesPerSample, rowBytes) &&
        rowBytes <= static_cast<size_t>(stride);
}

bool GetYuv420ChromaSize(int32_t stride, int32_t sliceHeight, OH_AVPixelFormat pixelFormat, size_t &chromaSize)
{
    const bool planar = pixelFormat == AV_PIXEL_FORMAT_YUVI420;
    const size_t chromaRows = static_cast<size_t>(sliceHeight / YUV_DIVISOR);
    const size_t chromaStride = planar ? static_cast<size_t>(stride) / YUV_DIVISOR :
        static_cast<size_t>(stride);
    if (planar && chromaStride == 0U) {
        return false;
    }
    if (!MultiplySize(chromaStride, chromaRows, chromaSize)) {
        return false;
    }
    const size_t planeCount = planar ? CHROMA_SAMPLE_BYTES : BYTE_COUNT;
    return MultiplySize(chromaSize, planeCount, chromaSize);
}

bool GetYuv420BufferSize(const Yuv420BufferRequest &request, size_t &required)
{
    if (request.width <= 0 || request.stride <= 0 || request.sliceHeight <= 0) {
        return false;
    }
    size_t ySize = 0;
    size_t chromaSize = 0;
    if (!MultiplySize(static_cast<size_t>(request.stride), static_cast<size_t>(request.sliceHeight), ySize) ||
        !IsYuv420RowLayoutValid(request.width, request.stride, request.tenBit) ||
        !GetYuv420ChromaSize(request.stride, request.sliceHeight, request.pixelFormat, chromaSize) ||
        ySize > std::numeric_limits<size_t>::max() - chromaSize) {
        return false;
    }
    required = ySize + chromaSize;
    return true;
}

bool IsSupportedYuv420Format(OH_AVPixelFormat pixelFormat)
{
    return pixelFormat == AV_PIXEL_FORMAT_YUVI420 || pixelFormat == AV_PIXEL_FORMAT_NV12 ||
        pixelFormat == AV_PIXEL_FORMAT_NV21;
}

bool VideoFrameConverter::ValidateBufferSize(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
    const CodecUserData &context)
{
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0) {
        return false;
    }
    const int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    if (capacity < 0 || bufferInfo.attr.offset > capacity) {
        return false;
    }
    const int32_t width = GetWidth(sampleInfo, context);
    const int32_t height = GetHeight(sampleInfo, context);
    const int32_t stride = GetStride(sampleInfo, context, width);
    const int32_t sliceHeight = GetSliceHeight(sampleInfo, context, height);
    if (width <= 0 || height <= 0 || stride <= 0 || sliceHeight < height) {
        return false;
    }
    size_t required = 0;
    const OH_AVPixelFormat pixelFormat = GetOutputPixelFormat(sampleInfo, context);
    const bool rgba = pixelFormat == AV_PIXEL_FORMAT_RGBA || pixelFormat == AV_PIXEL_FORMAT_RGBA1010102;
    if (rgba) {
        return GetRgbaBufferSize(width, height, stride, required) &&
            static_cast<size_t>(capacity - bufferInfo.attr.offset) >= required;
    }
    if (!IsSupportedYuv420Format(pixelFormat)) {
        return false;
    }
    const bool tenBit = IsTenBitOutput(sampleInfo, context);
    const Yuv420BufferRequest layoutRequest = {width, stride, sliceHeight, pixelFormat, tenBit};
    if (!GetYuv420BufferSize(layoutRequest, required)) {
        return false;
    }
    return static_cast<size_t>(capacity - bufferInfo.attr.offset) >= required;
}

bool VideoFrameConverter::ConvertRgba(const uint8_t *source, const SampleInfo &sampleInfo,
    const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba)
{
    const int32_t sourceWidth = GetWidth(sampleInfo, context);
    const int32_t sourceHeight = GetHeight(sampleInfo, context);
    const int32_t stride = GetStride(sampleInfo, context, sourceWidth);
    if (sourceWidth <= 0 || sourceHeight <= 0 || stride < sourceWidth * RGBA_BYTES_PER_PIXEL) {
        return false;
    }
    const int32_t outputWidth = target.width > 0 ? target.width : sourceWidth;
    const int32_t outputHeight = target.height > 0 ? target.height : sourceHeight;
    if (outputWidth <= 0 || outputHeight <= 0) {
        return false;
    }
    if (!ResizeRgbaBuffer(outputWidth, outputHeight, rgba)) {
        return false;
    }
    const RgbaScalingContext scaling = {
        source, sourceWidth, sourceHeight, stride, outputWidth, outputHeight, rgba};
    if (GetOutputPixelFormat(sampleInfo, context) == AV_PIXEL_FORMAT_RGBA1010102) {
        ConvertRgba1010102(scaling);
        return true;
    }
    if (outputWidth == sourceWidth && outputHeight == sourceHeight) {
        CopyRgbaRows(source, sourceWidth, sourceHeight, stride, rgba);
        return true;
    }
    ScaleRgba(scaling);
    return true;
}

bool VideoFrameConverter::ResizeRgba(const std::vector<uint8_t> &source, const FrameSize &sourceSize,
    const FrameSize &targetSize, std::vector<uint8_t> &rgba)
{
    const int32_t sourceWidth = sourceSize.width;
    const int32_t sourceHeight = sourceSize.height;
    const int32_t targetWidth = targetSize.width;
    const int32_t targetHeight = targetSize.height;
    if (sourceWidth <= 0 || sourceHeight <= 0 || targetWidth <= 0 || targetHeight <= 0) {
        return false;
    }
    size_t sourcePixels = 0;
    size_t requiredSourceBytes = 0;
    if (!MultiplySize(static_cast<size_t>(sourceWidth), static_cast<size_t>(sourceHeight), sourcePixels) ||
        !MultiplySize(sourcePixels, RGBA_BYTES_PER_PIXEL, requiredSourceBytes)) {
        return false;
    }
    if (!ResizeRgbaBuffer(targetWidth, targetHeight, rgba) || source.size() < requiredSourceBytes) {
        return false;
    }
    for (int32_t row = 0; row < targetHeight; ++row) {
        const int32_t sourceRow = ScaleCoordinate(row, sourceHeight, targetHeight);
        for (int32_t column = 0; column < targetWidth; ++column) {
            const int32_t sourceColumn = ScaleCoordinate(column, sourceWidth, targetWidth);
            const uint8_t *sourcePixel = source.data() +
                (static_cast<size_t>(sourceRow) * sourceWidth + sourceColumn) * RGBA_BYTES_PER_PIXEL;
            uint8_t *targetPixel = rgba.data() +
                (static_cast<size_t>(row) * targetWidth + column) * RGBA_BYTES_PER_PIXEL;
            CopyRgbaPixel(sourcePixel, targetPixel);
        }
    }
    return true;
}

struct FrameCoordinates {
    double horizontal = 0.0;
    double vertical = 0.0;
};

FrameCoordinates GetSourceCoordinates(int32_t rotation, double horizontal, double vertical)
{
    switch (rotation) {
        case ROTATION_90_DEGREES:
            return {vertical, 1.0 - horizontal};
        case ROTATION_180_DEGREES:
            return {1.0 - horizontal, 1.0 - vertical};
        case ROTATION_270_DEGREES:
            return {1.0 - vertical, horizontal};
        default:
            return {horizontal, vertical};
    }
}

void CopyFittedRgba(const FitRgbaContext &context)
{
    if (context.sourceWidth <= 0 || context.sourceHeight <= 0 || context.targetWidth <= 0 ||
        context.fittedWidth <= 0 || context.fittedHeight <= 0) {
        return;
    }
    for (int32_t y = 0; y < context.fittedHeight; ++y) {
        const double verticalCoordinate = DivideByPositive(static_cast<double>(y) + HALF_SAMPLE,
            context.fittedHeight);
        for (int32_t x = 0; x < context.fittedWidth; ++x) {
            const double horizontalCoordinate = DivideByPositive(static_cast<double>(x) + HALF_SAMPLE,
                context.fittedWidth);
            const FrameCoordinates coordinates = GetSourceCoordinates(context.rotation, horizontalCoordinate,
                verticalCoordinate);
            const int32_t sourceX = std::clamp(static_cast<int32_t>(coordinates.horizontal * context.sourceWidth),
                0, context.sourceWidth - BYTE_COUNT);
            const int32_t sourceY = std::clamp(static_cast<int32_t>(coordinates.vertical * context.sourceHeight),
                0, context.sourceHeight - BYTE_COUNT);
            const uint8_t *sourcePixel = context.source.data() +
                (static_cast<size_t>(sourceY) * context.sourceWidth + sourceX) * RGBA_BYTES_PER_PIXEL;
            uint8_t *targetPixel = context.rgba.data() +
                (static_cast<size_t>(context.top + y) * context.targetWidth + context.left + x) *
                RGBA_BYTES_PER_PIXEL;
            CopyRgbaPixel(sourcePixel, targetPixel);
        }
    }
}

bool VideoFrameConverter::FitRgba(const std::vector<uint8_t> &source, const FrameFitRequest &request,
    std::vector<uint8_t> &rgba)
{
    const int32_t sourceWidth = request.source.width;
    const int32_t sourceHeight = request.source.height;
    const int32_t targetWidth = request.target.width;
    const int32_t targetHeight = request.target.height;
    if (sourceWidth <= 0 || sourceHeight <= 0 || targetWidth <= 0 || targetHeight <= 0) {
        return false;
    }
    size_t sourcePixels = 0;
    size_t sourceSize = 0;
    if (!MultiplySize(static_cast<size_t>(sourceWidth), static_cast<size_t>(sourceHeight), sourcePixels) ||
        !MultiplySize(sourcePixels, RGBA_BYTES_PER_PIXEL, sourceSize) || source.size() < sourceSize) {
        return false;
    }
    if (!ResizeRgbaBuffer(targetWidth, targetHeight, rgba)) {
        return false;
    }
    std::fill(rgba.begin(), rgba.end(), 0);
    const int32_t normalizedRotation = NormalizeRotation(request.rotation);
    const bool quarterTurn = normalizedRotation == ROTATION_90_DEGREES ||
        normalizedRotation == ROTATION_270_DEGREES;
    const int32_t displayWidth = quarterTurn ? sourceHeight : sourceWidth;
    const int32_t displayHeight = quarterTurn ? sourceWidth : sourceHeight;
    if (displayWidth <= 0 || displayHeight <= 0) {
        return false;
    }
    const double scale = std::min(DivideByPositive(static_cast<double>(targetWidth), displayWidth),
        DivideByPositive(static_cast<double>(targetHeight), displayHeight));
    const int32_t fittedWidth = std::max(1, static_cast<int32_t>(displayWidth * scale));
    const int32_t fittedHeight = std::max(1, static_cast<int32_t>(displayHeight * scale));
    if (fittedWidth <= 0 || fittedHeight <= 0) {
        return false;
    }
    const int32_t left = (targetWidth - fittedWidth) / CENTER_DIVISOR;
    const int32_t top = (targetHeight - fittedHeight) / CENTER_DIVISOR;
    const FitRgbaContext context = {source, rgba, sourceWidth, sourceHeight, targetWidth,
        fittedWidth, fittedHeight, left, top, normalizedRotation};
    CopyFittedRgba(context);
    return true;
}

struct RotatedPixelPosition {
    int32_t x = 0;
    int32_t y = 0;
};

struct RotationCopyContext {
    const std::vector<uint8_t> &source;
    std::vector<uint8_t> &target;
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    int32_t targetWidth = 0;
    int32_t rotation = 0;
};

struct RotationTile {
    int32_t top = 0;
    int32_t bottom = 0;
    int32_t left = 0;
    int32_t right = 0;
};

RotatedPixelPosition GetRotatedPixelPosition(const RotationCopyContext &context, int32_t sourceX, int32_t sourceY)
{
    switch (context.rotation) {
        case ROTATION_90_DEGREES:
            return {context.sourceHeight - BYTE_COUNT - sourceY, sourceX};
        case ROTATION_180_DEGREES:
            return {context.sourceWidth - BYTE_COUNT - sourceX, context.sourceHeight - BYTE_COUNT - sourceY};
        case ROTATION_270_DEGREES:
            return {sourceY, context.sourceWidth - BYTE_COUNT - sourceX};
        default:
            return {sourceX, sourceY};
    }
}

void CopyRotationTile(const RotationCopyContext &context, const RotationTile &tile)
{
    for (int32_t sourceY = tile.top; sourceY < tile.bottom; ++sourceY) {
        for (int32_t sourceX = tile.left; sourceX < tile.right; ++sourceX) {
            const RotatedPixelPosition target = GetRotatedPixelPosition(context, sourceX, sourceY);
            const uint8_t *sourcePixel = context.source.data() +
                (static_cast<size_t>(sourceY) * context.sourceWidth + sourceX) * RGBA_BYTES_PER_PIXEL;
            uint8_t *targetPixel = context.target.data() +
                (static_cast<size_t>(target.y) * context.targetWidth + target.x) * RGBA_BYTES_PER_PIXEL;
            CopyRgbaPixel(sourcePixel, targetPixel);
        }
    }
}

bool VideoFrameConverter::RotateRgba(const std::vector<uint8_t> &source, const FrameRotationRequest &request,
    std::vector<uint8_t> &rgba)
{
    const int32_t sourceWidth = request.source.width;
    const int32_t sourceHeight = request.source.height;
    const int32_t normalizedRotation = NormalizeRotation(request.rotation);
    if (sourceWidth <= 0 || sourceHeight <= 0 || normalizedRotation == 0) {
        return false;
    }
    size_t sourcePixels = 0;
    size_t sourceSize = 0;
    if (!MultiplySize(static_cast<size_t>(sourceWidth), static_cast<size_t>(sourceHeight), sourcePixels) ||
        !MultiplySize(sourcePixels, RGBA_BYTES_PER_PIXEL, sourceSize) || source.size() < sourceSize) {
        return false;
    }
    const bool quarterTurn = normalizedRotation == ROTATION_90_DEGREES ||
        normalizedRotation == ROTATION_270_DEGREES;
    const int32_t targetWidth = quarterTurn ? sourceHeight : sourceWidth;
    const int32_t targetHeight = quarterTurn ? sourceWidth : sourceHeight;
    rgba.resize(sourceSize);
    const RotationCopyContext context = {source, rgba, sourceWidth, sourceHeight, targetWidth, normalizedRotation};
    // 按源图块而非目标行遍历。否则 90 度旋转时，每个输出像素都要跨整帧行跨度访问源数据，
    // 对 4K 竖屏视频尤其昂贵。
    for (int32_t top = 0; top < sourceHeight; top += ROTATION_TILE_EDGE) {
        const int32_t bottom = std::min(top + ROTATION_TILE_EDGE, sourceHeight);
        for (int32_t left = 0; left < sourceWidth; left += ROTATION_TILE_EDGE) {
            const int32_t right = std::min(left + ROTATION_TILE_EDGE, sourceWidth);
            CopyRotationTile(context, {top, bottom, left, right});
        }
    }
    return true;
}

bool VideoFrameConverter::ConvertYuv420(const uint8_t *source, const SampleInfo &sampleInfo,
    const CodecUserData &context, const FrameSize &target, std::vector<uint8_t> &rgba)
{
    const int32_t sourceWidth = GetWidth(sampleInfo, context);
    const int32_t sourceHeight = GetHeight(sampleInfo, context);
    const bool tenBit = IsTenBitOutput(sampleInfo, context);
    const int32_t bytesPerSample = tenBit ? TEN_BIT_STORAGE_BYTES : BYTE_COUNT;
    const int32_t stride = GetStride(sampleInfo, context, sourceWidth);
    const int32_t sliceHeight = GetSliceHeight(sampleInfo, context, sourceHeight);
    if (sourceWidth <= 0 || sourceHeight <= 0 || stride < sourceWidth * bytesPerSample ||
        sliceHeight < sourceHeight) {
        return false;
    }
    const int32_t outputWidth = target.width > 0 ? target.width : sourceWidth;
    const int32_t outputHeight = target.height > 0 ? target.height : sourceHeight;
    if (!ResizeRgbaBuffer(outputWidth, outputHeight, rgba)) {
        return false;
    }
    const OH_AVPixelFormat pixelFormat = GetOutputPixelFormat(sampleInfo, context);
    Yuv420Layout layout;
    const Yuv420LayoutRequest layoutRequest = {source, stride, sliceHeight, pixelFormat, tenBit};
    if (!BuildYuv420Layout(layoutRequest, layout)) {
        return false;
    }
    const Yuv420ConversionContext conversion = {
        layout, sampleInfo, {sourceWidth, sourceHeight}, {outputWidth, outputHeight}, rgba};
    ConvertYuv420Rows(conversion);
    return true;
}
