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
#ifndef NDR_CAP_CANVAS_H
#define NDR_CAP_CANVAS_H

#include <cstdint>

#include <native_drawing/drawing_canvas.h>

#include "capability/param_bag.h"

namespace ndr {
// 画布能力域：scene 取 CanvasScene，参数顺序与 ets/schema/CapabilityCanvas.ets 一致。
void DrawCanvasScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params);
} // namespace ndr

#endif // NDR_CAP_CANVAS_H
