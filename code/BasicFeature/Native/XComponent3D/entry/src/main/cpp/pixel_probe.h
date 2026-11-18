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

#ifndef XCOMPONENT3D_PIXEL_PROBE_H
#define XCOMPONENT3D_PIXEL_PROBE_H

#include <cstdint>

namespace PixelProbe
{
    // 离线渲染用的 pbuffer 边长，取 4 是为了让 glReadPixels 的采样点远离边缘
    const int32_t PROBE_SURFACE_SIZE = 4;

    // 单个采样点的通道字节数：R、G、B、A 各一字节
    const int32_t PROBE_CHANNEL_BYTES = 4;

    // 读回样本的有效字节数：主采样点与对角采样点各 4 通道
    const int32_t PROBE_RGBA_BYTES = 2 * PROBE_CHANNEL_BYTES;

    /**
     * 用独立的 EGL 上下文把 pbuffer 清成指定颜色并回读像素。
     * 不复用渲染线程的窗口，避免与 XComponent 渲染状态互相干扰。
     * @param red 0~255 红通道
     * @param green 0~255 绿通道
     * @param blue 0~255 蓝通道
     * @param alpha 0~255 透明通道
     * @param outRgba 输出 8 字节，前 4 字节为左下角像素，后 4 字节为右上角像素
     * @return 0 成功；-1 EGL 或 GL 失败；-2 入参越界
     */
    int32_t RenderSolidAndRead(uint8_t red, uint8_t green, uint8_t blue, uint8_t alpha,
                               uint8_t outRgba[PROBE_RGBA_BYTES]);

    // 回读 pbuffer 边长，供用例核对采样面积
    int32_t GetProbeSurfaceSize();
} // namespace PixelProbe

#endif // XCOMPONENT3D_PIXEL_PROBE_H
