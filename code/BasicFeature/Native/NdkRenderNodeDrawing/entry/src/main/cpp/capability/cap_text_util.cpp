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
#include "cap_text_util.h"

#include <unistd.h>

namespace ndr {
namespace cap {
OH_Drawing_Font *CreateSampleFont(float textSize)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font == nullptr) {
        DRAWING_LOGE("CreateSampleFont create font failed");
        return nullptr;
    }
    OH_Drawing_FontSetTextSize(font, textSize);
    for (int32_t index = 0; index < SAMPLE_FONT_COUNT; ++index) {
        if (SAMPLE_FONT_PATHS[index] == nullptr || access(SAMPLE_FONT_PATHS[index], F_OK) != 0) {
            continue;
        }
        OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile(SAMPLE_FONT_PATHS[index], 0);
        if (typeface == nullptr) {
            continue;
        }
        OH_Drawing_FontSetTypeface(font, typeface);
        OH_Drawing_TypefaceDestroy(typeface);
        break;
    }
    return font;
}

bool RegisterSampleFont(OH_Drawing_FontCollection *fontCollection, OH_Drawing_TextStyle *textStyle)
{
    if (fontCollection == nullptr || textStyle == nullptr) {
        return false;
    }
    for (int32_t index = 0; index < SAMPLE_FONT_COUNT; ++index) {
        if (SAMPLE_FONT_PATHS[index] == nullptr || access(SAMPLE_FONT_PATHS[index], F_OK) != 0) {
            continue;
        }
        const uint32_t result = OH_Drawing_RegisterFont(fontCollection, SAMPLE_FONT_FAMILY, SAMPLE_FONT_PATHS[index]);
        if (result != 0) {
            DRAWING_LOGW("RegisterSampleFont failed, result=%{public}u index=%{public}d", result, index);
            continue;
        }
        const char *families[] = {SAMPLE_FONT_FAMILY};
        OH_Drawing_SetTextStyleFontFamilies(textStyle, 1, families);
        return true;
    }
    return false;
}

void DestroyTypographyBundle(TypographyBundle &bundle)
{
    if (bundle.typography != nullptr) {
        OH_Drawing_DestroyTypography(bundle.typography);
        bundle.typography = nullptr;
    }
    if (bundle.handler != nullptr) {
        OH_Drawing_DestroyTypographyHandler(bundle.handler);
        bundle.handler = nullptr;
    }
    if (bundle.textStyle != nullptr) {
        OH_Drawing_DestroyTextStyle(bundle.textStyle);
        bundle.textStyle = nullptr;
    }
    if (bundle.typographyStyle != nullptr) {
        OH_Drawing_DestroyTypographyStyle(bundle.typographyStyle);
        bundle.typographyStyle = nullptr;
    }
    if (bundle.fontCollection != nullptr) {
        OH_Drawing_DestroyFontCollection(bundle.fontCollection);
        bundle.fontCollection = nullptr;
    }
}

bool BuildTypography(TypographyBundle &bundle, const char *text, double fontSize, double maxWidth,
    uint32_t color)
{
    if (text == nullptr || fontSize <= 0.0 || maxWidth <= 0.0) {
        return false;
    }
    bundle.fontCollection = OH_Drawing_CreateFontCollection();
    bundle.typographyStyle = OH_Drawing_CreateTypographyStyle();
    bundle.textStyle = OH_Drawing_CreateTextStyle();
    if (bundle.fontCollection == nullptr || bundle.typographyStyle == nullptr || bundle.textStyle == nullptr) {
        DRAWING_LOGE("BuildTypography create style failed");
        DestroyTypographyBundle(bundle);
        return false;
    }
    OH_Drawing_SetTypographyTextDirection(bundle.typographyStyle, TEXT_DIRECTION_LTR);
    OH_Drawing_SetTypographyTextAlign(bundle.typographyStyle, TEXT_ALIGN_LEFT);
    OH_Drawing_SetTextStyleColor(bundle.textStyle, color);
    OH_Drawing_SetTextStyleFontSize(bundle.textStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(bundle.textStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(bundle.textStyle, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(bundle.textStyle, 1.0);
    (void)RegisterSampleFont(bundle.fontCollection, bundle.textStyle);

    bundle.handler = OH_Drawing_CreateTypographyHandler(bundle.typographyStyle, bundle.fontCollection);
    if (bundle.handler == nullptr) {
        DRAWING_LOGE("BuildTypography create handler failed");
        DestroyTypographyBundle(bundle);
        return false;
    }
    OH_Drawing_TypographyHandlerPushTextStyle(bundle.handler, bundle.textStyle);
    OH_Drawing_TypographyHandlerAddText(bundle.handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(bundle.handler);
    bundle.typography = OH_Drawing_CreateTypography(bundle.handler);
    if (bundle.typography == nullptr) {
        DRAWING_LOGE("BuildTypography create typography failed");
        DestroyTypographyBundle(bundle);
        return false;
    }
    OH_Drawing_TypographyLayout(bundle.typography, maxWidth);
    return true;
}
} // namespace cap
} // namespace ndr
