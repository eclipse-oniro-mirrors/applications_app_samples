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
#ifndef NDR_DRAWING_TEXT_H
#define NDR_DRAWING_TEXT_H

#include <cstdint>
#include <native_drawing/drawing_types.h>

namespace ndr {
// 文本测量结果，单位为像素。
struct TextMeasureResult {
    double width = 0.0;
    double height = 0.0;
};

// 文本绘制：TextBlob、Typography 排版与文本测量。
void DrawTextScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind);

// 测量文本在给定字号与最大宽度下的占用尺寸，失败时返回 0。
TextMeasureResult MeasureText(const char *text, double fontSize, double maxWidth);
} // namespace ndr

#endif // NDR_DRAWING_TEXT_H
