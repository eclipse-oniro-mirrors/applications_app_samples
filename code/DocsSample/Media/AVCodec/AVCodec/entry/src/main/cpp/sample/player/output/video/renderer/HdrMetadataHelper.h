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

#ifndef VIDEO_CODEC_HDR_METADATA_HELPER_H
#define VIDEO_CODEC_HDR_METADATA_HELPER_H

#include <multimedia/player_framework/native_avbuffer.h>
#include <native_buffer/native_buffer.h>
#include <native_window/external_window.h>

class HdrMetadataHelper {
public:
    static bool IsHdrVivid(OH_AVBuffer *buffer);
    // Surface/OpenGL/Vulkan路径直接持有NativeBuffer时，使用该接口确认解码后的真实元数据。
    // 它只读取元数据，不接管buffer生命周期。
    static bool IsHdrVividNativeBuffer(OH_NativeBuffer *buffer);
    // Surface解码器回调只提供归还句柄。帧送显后读取XComponent最近刷新的Buffer；
    // 读取失败不清除已有的HDR Vivid确认状态。
    static bool IsLastFlushedBufferHdrVivid(OHNativeWindow *window);
    static bool CopyToNativeBuffer(OH_AVBuffer *sourceBuffer, OH_NativeBuffer *targetBuffer);
    static bool SetBt709OutputMetadata(OH_NativeBuffer *targetBuffer);
    // 将解码Surface Buffer的色彩空间和HDR元数据同步到显示窗口。
    // Surface/OpenGL/Vulkan路径没有可供应用直接读取的OH_AVBuffer内存，
    // 因此必须从NativeImage取到的OH_NativeBuffer转发给XComponent窗口。
    static bool SetNativeWindowMetadataFromBuffer(OHNativeWindow *window, OH_NativeBuffer *sourceBuffer);
    // NativeImage外部纹理渲染无法暴露逐帧HDR Vivid动态元数据。
    // 创建普通8-bit图形输出前清除静态HDR状态，防止沿用前一条流的结果。
    static bool ResetNativeWindowSdrMetadata(OHNativeWindow *window);
};

#endif // VIDEO_CODEC_HDR_METADATA_HELPER_H
