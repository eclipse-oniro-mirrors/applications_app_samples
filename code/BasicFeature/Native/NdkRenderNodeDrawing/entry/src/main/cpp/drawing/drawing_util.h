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
#ifndef NDR_DRAWING_UTIL_H
#define NDR_DRAWING_UTIL_H

#include <cstdint>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_rect.h>

namespace ndr {
// 示例统一配色，避免各页面颜色散落。
constexpr uint32_t COLOR_PRIMARY = 0xFF1F6FEB;  // 主色（蓝）
constexpr uint32_t COLOR_ACCENT = 0xFFF59E0B;   // 强调色（橙）
constexpr uint32_t COLOR_FILL = 0x8093C5FD;     // 半透明填充（蓝）
constexpr uint32_t COLOR_TEXT = 0xFF1F2937;     // 文字色
constexpr uint32_t COLOR_BACKGROUND = 0xFFF8FAFC; // 画布底色

// 创建矩形，使用完毕后需调用 OH_Drawing_RectDestroy 释放。
inline OH_Drawing_Rect *CreateRect(float left, float top, float right, float bottom)
{
    return OH_Drawing_RectCreate(left, top, right, bottom);
}
} // namespace ndr

#endif // NDR_DRAWING_UTIL_H
