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
#ifndef NDR_DRAWING_SHAPE_H
#define NDR_DRAWING_SHAPE_H

#include <cstdint>
#include <native_drawing/drawing_types.h>

namespace ndr {
// 绘制几何图元：点、线、圆、椭圆、矩形、圆角矩形、圆弧、路径、区域。
void DrawShapeScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind);
} // namespace ndr

#endif // NDR_DRAWING_SHAPE_H
