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
#ifndef NDR_CAP_TEXT_UTIL_H
#define NDR_CAP_TEXT_UTIL_H

#include <unistd.h>

#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>

#include "common/log_common.h"

namespace ndr {
namespace cap {
// 字体能力域与排版能力域共用的系统字体候选列表，文件不存在时回退到默认字体。
constexpr const char *SAMPLE_FONT_PATHS[] = {"/system/fonts/NotoSans_KR_Bold.otf"};
constexpr int32_t SAMPLE_FONT_COUNT = static_cast<int32_t>(sizeof(SAMPLE_FONT_PATHS) / sizeof(SAMPLE_FONT_PATHS[0]));
constexpr const char *SAMPLE_FONT_FAMILY = "ndrCapabilityFamily";

// 创建一个带字号的 Font，并尽力挂上系统字体文件，失败时保留默认字体继续绘制。
OH_Drawing_Font *CreateSampleFont(float textSize);

// 把系统字体注册到字体集合，并写入文本样式的字体族；失败时沿用默认字体族。
bool RegisterSampleFont(OH_Drawing_FontCollection *fontCollection, OH_Drawing_TextStyle *textStyle);

// 排版所需的一组对象，按创建逆序销毁，避免任何一步失败时泄漏。
struct TypographyBundle {
    OH_Drawing_FontCollection *fontCollection = nullptr;
    OH_Drawing_TypographyStyle *typographyStyle = nullptr;
    OH_Drawing_TextStyle *textStyle = nullptr;
    OH_Drawing_TypographyCreate *handler = nullptr;
    OH_Drawing_Typography *typography = nullptr;
};

void DestroyTypographyBundle(TypographyBundle &bundle);

// 生成一段左对齐、单一样式的排版对象；maxWidth 为布局宽度，单位像素。
bool BuildTypography(TypographyBundle &bundle, const char *text, double fontSize, double maxWidth,
    uint32_t color);
} // namespace cap
} // namespace ndr

#endif // NDR_CAP_TEXT_UTIL_H
