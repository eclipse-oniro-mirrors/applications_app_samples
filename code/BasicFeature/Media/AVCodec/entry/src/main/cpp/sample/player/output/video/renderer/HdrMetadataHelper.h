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
    // Surface 解码器回调只提供归还句柄。帧送显后读取 XComponent 最近刷新的 Buffer；
    // 读取失败不清除已有的 HDR Vivid 确认状态。
    static bool IsLastFlushedBufferHdrVivid(OHNativeWindow *window);
    static bool CopyToNativeBuffer(OH_AVBuffer *sourceBuffer, OH_NativeBuffer *targetBuffer);
    static bool SetBt709OutputMetadata(OH_NativeBuffer *targetBuffer);
    // NativeImage 外部纹理渲染无法暴露逐帧 HDR Vivid 动态元数据。
    // 创建普通 8-bit 图形输出前清除静态 HDR 状态，防止沿用前一条流的结果。
    static bool ResetNativeWindowSdrMetadata(OHNativeWindow *window);
};

#endif // VIDEO_CODEC_HDR_METADATA_HELPER_H
