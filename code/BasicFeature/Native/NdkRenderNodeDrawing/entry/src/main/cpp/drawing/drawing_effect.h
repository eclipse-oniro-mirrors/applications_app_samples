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
#ifndef NDR_DRAWING_EFFECT_H
#define NDR_DRAWING_EFFECT_H

#include <cstdint>
#include <native_drawing/drawing_types.h>

namespace ndr {
// 绘制效果：填充描边、混合模式、路径效果、渐变、颜色滤波、蒙版滤波。
void DrawEffectScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind);
} // namespace ndr

#endif // NDR_DRAWING_EFFECT_H
