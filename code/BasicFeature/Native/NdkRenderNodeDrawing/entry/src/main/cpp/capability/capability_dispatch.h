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
#ifndef NDR_CAPABILITY_DISPATCH_H
#define NDR_CAPABILITY_DISPATCH_H

#include <cstdint>

#include <native_drawing/drawing_canvas.h>

namespace ndr {
// 能力域名称，仅用于日志定位。
const char *CapabilityGroupName(int32_t group);

// 校验能力域与场景编号是否在声明范围内。
bool IsCapabilitySupported(int32_t group, int32_t scene);

// 统一入口：按能力域分派到对应的绘制模块，参数长度由 ParamBag 负责兜底。
// nativePixelMap 仅像素图能力域使用，其余能力域可传 nullptr；为避免能力层依赖多媒体头文件，统一以 void 指针传递。
void DispatchCapability(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t group, int32_t scene,
    const double *values, uint32_t count, void *nativePixelMap = nullptr);
} // namespace ndr

#endif // NDR_CAPABILITY_DISPATCH_H
