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
#include "cap_color.h"

#include <cmath>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
// 参数面板第 3 位为混色的目标色索引。
constexpr int32_t PARAM_TO_PALETTE = 2;

// 左原色右结果的双色块对比布局。
void DrawPair(OH_Drawing_Canvas *canvas, const cap::Frame &frame, uint32_t origin, uint32_t result)
{
    cap::FillRectArea(canvas, origin, frame.X(10.0F), frame.Y(15.0F), frame.X(47.0F), frame.Y(58.0F));
    cap::FillRectArea(canvas, result, frame.X(53.0F), frame.Y(15.0F), frame.X(90.0F), frame.Y(58.0F));
    cap::StrokeRectArea(canvas, 0x33000000U, 2.0F, frame.X(10.0F), frame.Y(15.0F), frame.X(47.0F), frame.Y(58.0F));
    cap::StrokeRectArea(canvas, 0x33000000U, 2.0F, frame.X(53.0F), frame.Y(15.0F), frame.X(90.0F), frame.Y(58.0F));
}

// 底部四根分量条，顺序为 A、R、G、B，高度表示通道取值。
void DrawChannels(OH_Drawing_Canvas *canvas, const cap::Frame &frame, uint32_t color)
{
    const float baseline = frame.Y(88.0F);
    for (int32_t index = 0; index < cap::CHANNEL_COUNT; index++) {
        const int32_t shift = cap::ALPHA_SHIFT - index * cap::CHANNEL_BITS;
        const float ratio = static_cast<float>(cap::ColorChannel(color, shift)) / cap::BYTE_MAX;
        const float height = frame.Y(6.0F) + frame.Y(20.0F) * ratio;
        const float left = frame.X(12.0F + static_cast<float>(index) * 19.0F);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(index), 0.85F), left, baseline - height,
            left + frame.X(14.0F), baseline);
    }
}

// 对比度：以 128 为中心缩放各通道，amount 为 1 时保持不变。
uint32_t ApplyContrast(uint32_t color, float amount)
{
    uint32_t result = color & cap::ALPHA_MASK;
    for (int32_t shift = cap::BLUE_SHIFT; shift < cap::ALPHA_SHIFT; shift += cap::CHANNEL_BITS) {
        const float channel = static_cast<float>(cap::ColorChannel(color, shift));
        result |= cap::ToByte((channel - 128.0F) * amount + 128.0F) << shift;
    }
    return result;
}

// 反相：按比例向补色靠拢，ratio 为 1 时完全反相。
uint32_t ApplyInvert(uint32_t color, float ratio)
{
    const uint32_t inverted = (~color) | cap::ALPHA_MASK;
    return cap::MixColor(color, inverted, ratio);
}

// 幂次变换：指数小于 1 提亮（线性转 sRGB 方向），大于 1 压暗。
uint32_t ApplyGamma(uint32_t color, float exponent)
{
    uint32_t result = color & cap::ALPHA_MASK;
    for (int32_t shift = cap::BLUE_SHIFT; shift < cap::ALPHA_SHIFT; shift += cap::CHANNEL_BITS) {
        const float normalized = static_cast<float>(cap::ColorChannel(color, shift)) / cap::BYTE_MAX;
        result |= cap::ToByte(std::pow(normalized, exponent) * cap::BYTE_MAX) << shift;
    }
    return result;
}

// 0. 调色板：按数量铺满色板，透明度由参数控制。
void ScenePalette(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t count = params.Int(0, 6, 3, 8);
    const float alpha = params.Percent(1, 1.0F);
    const int32_t columns = 4;
    const float cellWidth = frame.width * 0.92F / static_cast<float>(columns);
    const float cellHeight = frame.height * 0.3F;
    for (int32_t index = 0; index < count; index++) {
        const int32_t row = index / columns;
        const int32_t column = index % columns;
        const float left = frame.X(4.0F) + cellWidth * static_cast<float>(column);
        const float top = frame.Y(12.0F) + cellHeight * 1.2F * static_cast<float>(row);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(index), alpha), left, top,
            left + cellWidth * 0.9F, top + cellHeight * 0.9F);
    }
}

// 1. 透明度阶梯：同一个颜色按等分透明度铺开。
void SceneAlphaRamp(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t steps = params.Int(0, 8, 4, 12);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 1);
    const uint32_t color = cap::PaletteColor(palette);
    const float cellWidth = frame.width * 0.92F / static_cast<float>(steps);
    for (int32_t index = 0; index < steps; index++) {
        const float alpha = static_cast<float>(index + 1) / static_cast<float>(steps);
        const float left = frame.X(4.0F) + cellWidth * static_cast<float>(index);
        cap::FillRectArea(canvas, cap::WithAlpha(color, alpha), left, frame.Y(25.0F), left + cellWidth * 0.92F,
            frame.Y(75.0F));
    }
}

// 2. 混色：按比例在两种颜色之间插值，两端色作为参考。
void SceneLerp(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float ratio = params.Percent(0, 0.5F);
    const int32_t fromPalette = params.Choice(1, cap::PALETTE_COUNT, 0);
    const int32_t toPalette = params.Choice(PARAM_TO_PALETTE, cap::PALETTE_COUNT, 2);
    const uint32_t from = cap::PaletteColor(fromPalette);
    const uint32_t to = cap::PaletteColor(toPalette);
    const uint32_t mixed = cap::MixColor(from, to, ratio);
    cap::FillRectArea(canvas, from, frame.X(12.0F), frame.Y(60.0F), frame.X(30.0F), frame.Y(80.0F));
    cap::FillRectArea(canvas, mixed, frame.X(12.0F), frame.Y(15.0F), frame.X(88.0F), frame.Y(55.0F));
    cap::FillRectArea(canvas, to, frame.X(70.0F), frame.Y(60.0F), frame.X(88.0F), frame.Y(80.0F));
}

// 3. ARGB：按 A、R、G、B 顺序解包与重排，结果与原色一致。
void SceneOrderArgb(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const uint32_t alpha = cap::ToByte(params.Percent(0, 0.8F) * cap::BYTE_MAX);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 1);
    const uint32_t color = cap::PaletteColor(palette);
    const uint32_t rebuilt = cap::PackColor(alpha, cap::ColorChannel(color, cap::RED_SHIFT),
        cap::ColorChannel(color, cap::GREEN_SHIFT), cap::ColorChannel(color, cap::BLUE_SHIFT));
    DrawPair(canvas, frame, cap::PaletteColor(palette), rebuilt);
    DrawChannels(canvas, frame, rebuilt);
}

// 4. RGBA：故意把分量按 R、G、B、A 错位组装，观察通道错位后的偏色。
void SceneOrderRgba(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const uint32_t alpha = cap::ToByte(params.Percent(0, 0.8F) * cap::BYTE_MAX);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 2);
    const uint32_t color = cap::PaletteColor(palette);
    // 错位组装：把红通道当透明度、绿通道当红色，得到明显的偏色结果。
    const uint32_t rotated = cap::PackColor(cap::ColorChannel(color, cap::RED_SHIFT),
        cap::ColorChannel(color, cap::GREEN_SHIFT), cap::ColorChannel(color, cap::BLUE_SHIFT), alpha);
    DrawPair(canvas, frame, color, rotated);
    DrawChannels(canvas, frame, rotated);
}

// 5. 对比度：amount 0 灰、1 原样、2 强对比。
void SceneContrast(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float amount = params.Range(0, 1.5F, 0.0F, 2.0F);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 3);
    const uint32_t color = cap::PaletteColor(palette);
    const uint32_t result = ApplyContrast(color, amount);
    DrawPair(canvas, frame, color, result);
    DrawChannels(canvas, frame, result);
}

// 6. 反相：按比例混向补色。
void SceneInvert(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float ratio = params.Percent(0, 1.0F);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 0);
    const uint32_t color = cap::PaletteColor(palette);
    const uint32_t result = ApplyInvert(color, ratio);
    DrawPair(canvas, frame, color, result);
    DrawChannels(canvas, frame, result);
}

// 7. 伽马转线性：指数大于 1，整体压暗。
void SceneGammaToLinear(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float strength = params.Percent(0, 0.5F);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 1);
    const uint32_t color = cap::PaletteColor(palette);
    const uint32_t result = ApplyGamma(color, 1.0F + strength * 1.6F);
    DrawPair(canvas, frame, color, result);
    DrawChannels(canvas, frame, result);
}

// 8. 伽马转 sRGB：指数小于 1，整体提亮。
void SceneGammaToSrgb(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float strength = params.Percent(0, 0.5F);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 4);
    const uint32_t color = cap::PaletteColor(palette);
    const uint32_t result = ApplyGamma(color, 1.0F / (1.0F + strength * 1.6F));
    DrawPair(canvas, frame, color, result);
    DrawChannels(canvas, frame, result);
}
} // namespace

void DrawColorScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawColorScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < COLOR_PALETTE || scene >= COLOR_SCENE_COUNT) {
        DRAWING_LOGE("DrawColorScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case COLOR_PALETTE:
            ScenePalette(canvas, frame, params);
            break;
        case COLOR_ALPHA_RAMP:
            SceneAlphaRamp(canvas, frame, params);
            break;
        case COLOR_LERP:
            SceneLerp(canvas, frame, params);
            break;
        case COLOR_ORDER_ARGB:
            SceneOrderArgb(canvas, frame, params);
            break;
        case COLOR_ORDER_RGBA:
            SceneOrderRgba(canvas, frame, params);
            break;
        case COLOR_CONTRAST:
            SceneContrast(canvas, frame, params);
            break;
        case COLOR_INVERT:
            SceneInvert(canvas, frame, params);
            break;
        case COLOR_GAMMA_TO_LINEAR:
            SceneGammaToLinear(canvas, frame, params);
            break;
        case COLOR_GAMMA_TO_SRGB:
            SceneGammaToSrgb(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawColorScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
