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

#ifndef AVCODEC_RECORDER_FRAME_RECEIVER_H
#define AVCODEC_RECORDER_FRAME_RECEIVER_H

#include <cstdint>
#include <atomic>
#include <mutex>
#include <condition_variable>
#include <thread>
#include <memory>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <multimedia/player_framework/native_avbuffer.h>

// Receiver、Image和编码输入Buffer各自保有独立所有权；只在视频输入线程复制像素。
struct RecorderArrivalSignal;
class RecorderFrameReceiver {
  public:
    ~RecorderFrameReceiver();
    bool Create(int32_t width, int32_t height);
    uint64_t GetSurfaceId() const
    {
        return surfaceId_;
    }
    OH_ImageNative *ReadLatest(int32_t timeoutMs = 0);
    void CancelWait();
    bool Copy(OH_ImageNative *image, OH_AVBuffer *destination, int32_t stride, int32_t sliceHeight,
              int32_t &size) const;

  private:
    bool LoadImageApis();
    bool CreateReceiver(int32_t width, int32_t height);
    void ReceiveImages();
    static void OnImageArrive(OH_ImageReceiverNative *receiver, void *userData);
    bool ReadImageData(OH_ImageNative *image, OH_ImageBufferData &data) const;
    using GetBufferData = Image_ErrorCode (*)(OH_ImageNative *, OH_ImageBufferData *);
    void *imageLibrary_ = nullptr;
    void *receiverLibrary_ = nullptr;
    GetBufferData getBufferData_ = nullptr;
    using RegisterArrival = Image_ErrorCode (*)(OH_ImageReceiverNative *, OH_ImageReceiver_ImageArriveCallback, void *);
    using UnregisterArrival = Image_ErrorCode (*)(OH_ImageReceiverNative *, OH_ImageReceiver_ImageArriveCallback);
    RegisterArrival registerArrival_ = nullptr;
    UnregisterArrival unregisterArrival_ = nullptr;
    bool callbackRegistered_ = false;
    OH_ImageReceiverNative *receiver_ = nullptr;
    uint64_t surfaceId_ = 0;
    int32_t width_ = 0;
    int32_t height_ = 0;
    std::atomic<bool> closing_{false};
    std::thread receiverThread_;
    std::mutex imageMutex_;
    std::condition_variable imageCond_;
    bool inputCancelled_ = false;
    std::shared_ptr<RecorderArrivalSignal> arrival_;
    OH_ImageNative *latestImage_ = nullptr;
};

#endif
