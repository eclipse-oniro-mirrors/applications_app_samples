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

#ifndef VIDEOENCODER_H
#define VIDEOENCODER_H

#include <mutex>
#include <memory>
#include <string>
#include "RoiQueue.h"
#include "SampleInfo.h"
#include "CodecInfo.h"
#include "FrameQueue.h"
#include "multimedia/player_framework/native_avcodec_videoencoder.h"
#include "multimedia/player_framework/native_avbuffer_info.h"
#include "multimedia/player_framework/native_avcodec_videobase.h"
#include "native_window/external_window.h"
#include "native_window/buffer_handle.h"
#include "CodecCallback.h"
#include "dfx/error/SampleError.h"
#include "SampleLog.h"

class VideoEncoder {
public:
    // [Start roi_user_data_struct]
    // 参数回调配置的用户数据结构
    struct CodecUserRoi {
        VideoEncoder* vencoder = nullptr;
        RoiQueue* roiQueue = nullptr;
    };
    // [End roi_user_data_struct]

    VideoEncoder() = default;
    ~VideoEncoder();

    // Core control interface
    int32_t Create(const std::string &videoCodecMime);
    int32_t Config(SampleInfo &sampleInfo, CodecUserData *codecUserData);
    int32_t Start();
    int32_t FreeOutputBuffer(uint32_t bufferIndex);
    int32_t NotifyEndOfStream();
    int32_t Stop();
    int32_t Release();

    // 参数回调配置: Push ROI entry with PTS into RoiQueue (from RenderThread's NativeBuffer extraction)
    void PushRoiEntry(int64_t pts, const std::string &roiStr);

    // 参数回调配置: Clear RoiQueue (when ROI is disabled)
    void ClearRoiQueue();

    // ROI path type setter
    void SetRoiPathType(RoiPathType type)
    {
        roiPathType_ = type;
    }

    // Buffer模式: Frame queue for Buffer mode encoding
    void SetFrameQueue(FrameQueue *queue)
    {
        frameQueue_ = queue;
    }

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    int32_t Configure(const SampleInfo &sampleInfo);
    int32_t GetSurface(SampleInfo &sampleInfo);

    OH_AVCodec *encoder_ = nullptr;
    int width_ = 0;
    int height_ = 0;
    RoiPathType roiPathType_ = ROI_PATH_NATIVEBUFFER;

    // 参数回调配置: Parameter callback user data
    std::unique_ptr<CodecUserRoi> userData_;
    // 参数回调配置: RoiQueue for synchronized ROI data (PTS-keyed)
    RoiQueue roiQueue_;

    // Buffer模式: Frame queue for Buffer mode encoding
    FrameQueue *frameQueue_ = nullptr;
};

#endif // VIDEOENCODER_H
