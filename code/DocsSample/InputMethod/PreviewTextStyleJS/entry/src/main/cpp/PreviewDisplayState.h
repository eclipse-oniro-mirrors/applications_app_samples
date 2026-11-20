/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 预上屏显示状态不依赖回调的到达顺序。
#ifndef PREVIEW_DISPLAY_STATE_H
#define PREVIEW_DISPLAY_STATE_H
#include <cstddef>
#include <cstdint>
#include <string>

struct PreviewDisplayState {
    std::u16string text;
    bool active = false;
    int32_t underlineStyle = 0;
    uint32_t underlineColor = 0;
    bool hasUnderlineColor = false;

    void ApplyStyled(const char16_t *value, size_t length, int32_t kind, uint32_t color, bool hasColor)
    {
        text.assign(value, length);
        active = true;
        underlineStyle = kind;
        underlineColor = color;
        hasUnderlineColor = hasColor;
    }
};
#endif
