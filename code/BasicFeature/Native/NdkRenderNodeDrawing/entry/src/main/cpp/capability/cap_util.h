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
#ifndef NDR_CAP_UTIL_H
#define NDR_CAP_UTIL_H

#include <cmath>
#include <cstdint>

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_round_rect.h>

namespace ndr {
namespace cap {
// 能力域统一配色，下标 0..5，越界按模取用，保证任意参数都能取到有效颜色。
constexpr uint32_t PALETTE[] = {0xFF1F6FEB, 0xFFF59E0B, 0xFF10B981, 0xFFEF4444, 0xFF8B5CF6, 0xFF0EA5E9};
constexpr int32_t PALETTE_COUNT = 6;
constexpr float PI = 3.14159265F;

// 调色板槽位名称，与 PALETTE 的顺序一一对应，绘制代码按语义取色而不是写死下标。
enum PaletteSlot : int32_t {
    SLOT_BLUE = 0,
    SLOT_ORANGE = 1,
    SLOT_GREEN = 2,
    SLOT_RED = 3,
    SLOT_PURPLE = 4,
    SLOT_CYAN = 5,
};

// 坐标成对存放时的步长与分量下标，用于把单点写入顶点缓冲区。
constexpr int32_t COORD_STRIDE = 2;
constexpr int32_t COORD_OFFSET_X = 0;
constexpr int32_t COORD_OFFSET_Y = 1;
// 三色与八色循环取色时的循环长度。
constexpr int32_t COLOR_CYCLE_TRIPLE = 3;
constexpr int32_t COLOR_CYCLE_OCTET = 8;

// ARGB 通道布局：每通道 8 位，蓝、绿、红、透明度的移位量依次为 0、8、16、24。
constexpr int32_t CHANNEL_BITS = 8;
constexpr int32_t CHANNEL_COUNT = 4;
constexpr int32_t BLUE_SHIFT = 0;
constexpr int32_t GREEN_SHIFT = 8;
constexpr int32_t RED_SHIFT = 16;
constexpr int32_t ALPHA_SHIFT = 24;
constexpr uint32_t BYTE_MASK = 0xFFU;
constexpr uint32_t RGB_MASK = 0x00FFFFFFU;
constexpr uint32_t ALPHA_MASK = 0xFF000000U;
constexpr float BYTE_MAX = 255.0F;
// 百分比取值换算：百分数乘该系数得到 0..1 的比例。
constexpr float PERCENT_SCALE = 0.01F;
// 尺寸取中时乘的系数。
constexpr float HALF = 0.5F;
// 浮点转整时的四舍五入偏移。
constexpr float ROUND_OFFSET = 0.5F;
// 整圆与半圆对应的倍数，用于把比例换算成角度。
constexpr float FULL_TURN = 2.0F;
constexpr float HALF_TURN = 0.5F;
constexpr float HALF_TURN_DEGREE = 180.0F;
// 多边形边数上下限，上限与 points 缓冲长度一致。
constexpr int32_t MIN_POLYGON_SIDES = 3;
constexpr int32_t MAX_POLYGON_SIDES = 12;
// Skew 以正切值入参，90° 附近会发散，先限制在 ±89.5°。
constexpr float MAX_SKEW_DEGREE = 89.5F;

// 画布尺寸与百分比换算，避免每个场景重复书写 w * xx 之类的魔法数。
struct Frame {
    float width = 0.0F;
    float height = 0.0F;
    float centerX = 0.0F;
    float centerY = 0.0F;
    float shortSide = 0.0F;

    // 宽度方向的百分比位置，0 为左，100 为右。
    float X(float percent) const
    {
        return width * percent * PERCENT_SCALE;
    }

    // 高度方向的百分比位置，0 为上，100 为下。
    float Y(float percent) const
    {
        return height * percent * PERCENT_SCALE;
    }

    // 以短边为基准的百分比长度，圆形类图元用它换算半径可避免拉伸。
    float Span(float percent) const
    {
        return shortSide * percent * PERCENT_SCALE;
    }
};

inline Frame MakeFrame(int32_t width, int32_t height)
{
    Frame frame;
    frame.width = static_cast<float>(width);
    frame.height = static_cast<float>(height);
    frame.centerX = frame.width * HALF;
    frame.centerY = frame.height * HALF;
    frame.shortSide = frame.width < frame.height ? frame.width : frame.height;
    return frame;
}

inline float ClampFloat(float value, float min, float max)
{
    if (value < min) {
        return min;
    }
    return value > max ? max : value;
}

inline uint32_t PaletteColor(int32_t index)
{
    int32_t wrapped = index % PALETTE_COUNT;
    if (wrapped < 0) {
        wrapped += PALETTE_COUNT;
    }
    return PALETTE[wrapped];
}

// alpha 取 0..1，写入 ARGB 的高字节。
inline uint32_t WithAlpha(uint32_t color, float alpha)
{
    const uint32_t alphaByte =
        static_cast<uint32_t>(ClampFloat(alpha, 0.0F, 1.0F) * BYTE_MAX + ROUND_OFFSET);
    return (color & RGB_MASK) | (alphaByte << ALPHA_SHIFT);
}

// 按 ARGB 四个通道线性插值。
uint32_t MixColor(uint32_t from, uint32_t to, float ratio);

// 取出单通道分量，shift 取 BLUE_SHIFT/GREEN_SHIFT/RED_SHIFT/ALPHA_SHIFT。
inline uint32_t ColorChannel(uint32_t color, int32_t shift)
{
    return (color >> shift) & BYTE_MASK;
}

// 用单通道分量重新拼装颜色，便于演示分量顺序对结果的影响。
inline uint32_t PackColor(uint32_t alpha, uint32_t red, uint32_t green, uint32_t blue)
{
    return ((alpha & BYTE_MASK) << ALPHA_SHIFT) | ((red & BYTE_MASK) << RED_SHIFT) |
        ((green & BYTE_MASK) << GREEN_SHIFT) | (blue & BYTE_MASK);
}

// 把 0..255 的浮点分量收敛到字节，超界自动裁剪。
inline uint32_t ToByte(float value)
{
    const float clamped = ClampFloat(value, 0.0F, BYTE_MAX);
    return static_cast<uint32_t>(clamped + ROUND_OFFSET);
}

inline OH_Drawing_Brush *NewBrush(uint32_t color)
{
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    if (brush == nullptr) {
        return nullptr;
    }
    OH_Drawing_BrushSetAntiAlias(brush, true);
    OH_Drawing_BrushSetColor(brush, color);
    return brush;
}

OH_Drawing_Pen *NewPen(uint32_t color, float width);

void FillRectArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom);

void StrokeRectArea(OH_Drawing_Canvas *canvas, uint32_t color, float width,
    float left, float top, float right, float bottom);

void FillCircleArea(OH_Drawing_Canvas *canvas, uint32_t color, float cx, float cy, float radius);

void StrokeCircleArea(OH_Drawing_Canvas *canvas, uint32_t color, float width, float cx, float cy, float radius);

void FillOvalArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom);

void StrokeLineArea(OH_Drawing_Canvas *canvas, uint32_t color, float width,
    float x1, float y1, float x2, float y2);

void FillRoundRectArea(OH_Drawing_Canvas *canvas, uint32_t color,
    float left, float top, float right, float bottom, float radius);

void FillPathArea(OH_Drawing_Canvas *canvas, uint32_t color, OH_Drawing_Path *path);

void StrokePathArea(OH_Drawing_Canvas *canvas, uint32_t color, float width, OH_Drawing_Path *path);

void FillRegionArea(OH_Drawing_Canvas *canvas, uint32_t color, OH_Drawing_Region *region);

void FillArcArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom,
    float startAngle, float sweepAngle, bool useCenter);

// 构造正多边形路径，返回的对象需调用方使用 OH_Drawing_PathDestroy 释放。
OH_Drawing_Path *CreatePolygonPath(float cx, float cy, float radius, int32_t sides);

// 构造圆形路径，返回的对象需调用方释放。
inline OH_Drawing_Path *CreateCirclePath(float cx, float cy, float radius)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return nullptr;
    }
    OH_Drawing_PathAddCircle(path, cx, cy, radius, PATH_DIRECTION_CW);
    return path;
}

// 构造矩形路径，返回的对象需调用方释放。
inline OH_Drawing_Path *CreateRectPath(float left, float top, float right, float bottom)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return nullptr;
    }
    OH_Drawing_PathAddRect(path, left, top, right, bottom, PATH_DIRECTION_CW);
    return path;
}

// 角度转弧度，Skew 等接口以正切值入参。90° 附近正切会发散成 1e7 量级的退化矩阵，
// 先用 MAX_SKEW_DEGREE 限制在 ±89.5°。
inline float DegreeToTan(float degree)
{
    return std::tan(ClampFloat(degree, -MAX_SKEW_DEGREE, MAX_SKEW_DEGREE) * PI / HALF_TURN_DEGREE);
}
} // namespace cap
} // namespace ndr

#endif // NDR_CAP_UTIL_H
