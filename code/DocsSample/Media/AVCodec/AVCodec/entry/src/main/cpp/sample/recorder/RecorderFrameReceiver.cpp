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

#include "RecorderFrameReceiver.h"
#include "RecorderFrameCopy.h"
#include "av_codec_sample_log.h"
#include <algorithm>
#include <dlfcn.h>
#include <chrono>
#include <iterator>
#include <memory>

#undef LOG_TAG
#define LOG_TAG "RecorderFrameReceiver"

namespace {
constexpr int32_t RECEIVER_CAPACITY = 3;
constexpr auto FRAME_POLL_INTERVAL = std::chrono::milliseconds(5);

bool ReadPlanes(const OH_NativeBuffer_Config &config, const OH_NativeBuffer_Planes &planes, size_t bytes, int32_t width,
                int32_t height, RecorderFrames::Plane &y, RecorderFrames::Plane &u, RecorderFrames::Plane &v)
{
    RecorderFrames::Yuv420Layout layout;
    switch (config.format) {
        case NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP:
            layout = RecorderFrames::Yuv420Layout::NV12;
            break;
        case NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP:
            layout = RecorderFrames::Yuv420Layout::NV21;
            break;
        case NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P:
            layout = RecorderFrames::Yuv420Layout::I420;
            break;
        case NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P:
            layout = RecorderFrames::Yuv420Layout::YV12;
            break;
        default:
            return false;
    }
    if (planes.planeCount < RecorderFrames::SEMIPLANAR_PLANE_COUNT ||
        planes.planeCount > RecorderFrames::YUV_COMPONENT_COUNT) {
        return false;
    }
    RecorderFrames::Plane mapped[RecorderFrames::YUV_COMPONENT_COUNT]{};
    for (uint32_t index = 0; index < planes.planeCount; ++index) {
        const auto &plane = planes.planes[index];
        mapped[index] = {plane.offset, plane.rowStride, plane.columnStride};
    }
    return RecorderFrames::ResolveYuv420Planes(mapped, planes.planeCount, layout, bytes, width, height, y, u, v);
}
} // namespace

RecorderFrameReceiver::~RecorderFrameReceiver()
{
    closing_.store(true);
    if (receiverThread_.joinable()) {
        receiverThread_.join();
    }
    if (latestImage_ != nullptr) {
        (void)OH_ImageNative_Release(latestImage_);
    }
    if (receiver_ != nullptr) {
        (void)OH_ImageReceiverNative_Release(receiver_);
    }
    if (imageLibrary_ != nullptr) {
        (void)dlclose(imageLibrary_);
    }
}

bool RecorderFrameReceiver::Create(int32_t width, int32_t height)
{
    if (receiver_ != nullptr || imageLibrary_ != nullptr) {
        return false;
    }
    // NAPI模块可能以局部作用域加载，RTLD_DEFAULT无法可靠查到其依赖库中的符号。
    // 从所属库句柄查询API 23接口，旧系统仍可使用Surface录制。
    imageLibrary_ = dlopen("libohimage.so", RTLD_NOW | RTLD_LOCAL);
    if (imageLibrary_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Open image library failed: %{public}s", dlerror());
        return false;
    }
    (void)dlerror();
    getBufferData_ = reinterpret_cast<GetBufferData>(dlsym(imageLibrary_, "OH_ImageNative_GetBufferData"));
    if (getBufferData_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Resolve image buffer API failed (requires API 23): %{public}s", dlerror());
        return false;
    }
    OH_ImageReceiverOptions *rawOptions = nullptr;
    Image_ErrorCode ret = OH_ImageReceiverOptions_Create(&rawOptions);
    if (ret != IMAGE_SUCCESS || rawOptions == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create image receiver options failed, ret: %{public}d", ret);
        return false;
    }
    const std::unique_ptr<OH_ImageReceiverOptions, decltype(&OH_ImageReceiverOptions_Release)> options(
        rawOptions, OH_ImageReceiverOptions_Release);
    const Image_Size size{static_cast<uint32_t>(width), static_cast<uint32_t>(height)};
    ret = OH_ImageReceiverOptions_SetSize(options.get(), size);
    if (ret == IMAGE_SUCCESS) {
        ret = OH_ImageReceiverOptions_SetCapacity(options.get(), RECEIVER_CAPACITY);
    }
    if (ret != IMAGE_SUCCESS) {
        AVCODEC_SAMPLE_LOGE("Set image receiver options failed, ret: %{public}d, size: %{public}dx%{public}d", ret,
                            width, height);
        return false;
    }
    ret = OH_ImageReceiverNative_Create(options.get(), &receiver_);
    if (ret != IMAGE_SUCCESS || receiver_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create image receiver failed, ret: %{public}d", ret);
        return false;
    }
    ret = OH_ImageReceiverNative_GetReceivingSurfaceId(receiver_, &surfaceId_);
    if (ret != IMAGE_SUCCESS || surfaceId_ == 0) {
        AVCODEC_SAMPLE_LOGE("Get image receiver surface failed, ret: %{public}d", ret);
        return false;
    }
    width_ = width;
    height_ = height;
    receiverThread_ = std::thread(&RecorderFrameReceiver::ReceiveImages, this);
    AVCODEC_SAMPLE_LOGI("Camera frame receiver ready: %{public}dx%{public}d", width, height);
    return true;
}

OH_ImageNative *RecorderFrameReceiver::ReadLatest()
{
    std::lock_guard<std::mutex> lock(imageMutex_);
    OH_ImageNative *image = latestImage_;
    latestImage_ = nullptr;
    return image;
}

void RecorderFrameReceiver::ReceiveImages()
{
    while (!closing_.load()) {
        OH_ImageNative *image = nullptr;
        if (OH_ImageReceiverNative_ReadLatestImage(receiver_, &image) == IMAGE_SUCCESS && image != nullptr) {
            {
                std::lock_guard<std::mutex> lock(imageMutex_);
                std::swap(image, latestImage_);
            }
        }
        if (image != nullptr) {
            (void)OH_ImageNative_Release(image);
        }
        // 准备页面尚未开始编码时也持续消费；否则Receiver满后可能连带阻塞相机显示预览。
        std::this_thread::sleep_for(FRAME_POLL_INTERVAL);
    }
}

bool RecorderFrameReceiver::Copy(OH_ImageNative *image, OH_AVBuffer *destination, int32_t stride, int32_t sliceHeight,
                                 int32_t &size) const
{
    OH_ImageBufferData data{};
    Image_Size imageSize{};
    if (image == nullptr || destination == nullptr) {
        return false;
    }
    const Image_ErrorCode sizeRet = OH_ImageNative_GetImageSize(image, &imageSize);
    if (sizeRet != IMAGE_SUCCESS || imageSize.width != static_cast<uint32_t>(width_) ||
        imageSize.height != static_cast<uint32_t>(height_)) {
        AVCODEC_SAMPLE_LOGE("Camera image size invalid: ret=%{public}d, actual=%{public}ux%{public}u, "
                            "expected=%{public}dx%{public}d",
                            sizeRet, imageSize.width, imageSize.height, width_, height_);
        return false;
    }
    const Image_ErrorCode dataRet = getBufferData_(image, &data);
    if (dataRet != IMAGE_SUCCESS || data.nativeBuffer == nullptr) {
        AVCODEC_SAMPLE_LOGE("Get camera image buffer data failed: ret=%{public}d, bytes=%{public}zu, "
                            "strides=%{public}d",
                            dataRet, data.bufferSize, data.numStride);
        return false;
    }
    OH_NativeBuffer_Config config{};
    OH_NativeBuffer_GetConfig(data.nativeBuffer, &config);
    void *address = nullptr;
    OH_NativeBuffer_Planes planes{};
    const int32_t mapRet = OH_NativeBuffer_MapPlanes(data.nativeBuffer, &address, &planes);
    if (mapRet != 0) {
        AVCODEC_SAMPLE_LOGE("Map camera image planes failed: ret=%{public}d, format=%{public}d, "
                            "size=%{public}dx%{public}d, stride=%{public}d, usage=%{public}d, bytes=%{public}zu",
                            mapRet, config.format, config.width, config.height, config.stride, config.usage,
                            data.bufferSize);
        return false;
    }
    RecorderFrames::Plane y;
    RecorderFrames::Plane u;
    RecorderFrames::Plane v;
    const int32_t capacity = OH_AVBuffer_GetCapacity(destination);
    const bool copied = capacity > 0 && ReadPlanes(config, planes, data.bufferSize, width_, height_, y, u, v) &&
                        RecorderFrames::CopyNv12(static_cast<const uint8_t *>(address), data.bufferSize, y, u, v,
                                                 OH_AVBuffer_GetAddr(destination), static_cast<size_t>(capacity),
                                                 width_, height_, stride, sliceHeight);
    const bool unmapped = OH_NativeBuffer_Unmap(data.nativeBuffer) == 0;
    // NativeBuffer由Image借出，不额外Unreference；调用方在复制结束后释放Image。
    if (!copied || !unmapped) {
        AVCODEC_SAMPLE_LOGE("Camera YUV copy failed: format=%{public}d, planes=%{public}u, bytes=%{public}zu, "
                            "capacity=%{public}d, stride=%{public}d, sliceHeight=%{public}d, copied=%{public}d, "
                            "unmapped=%{public}d",
                            config.format, planes.planeCount, data.bufferSize, capacity, stride, sliceHeight, copied,
                            unmapped);
        for (uint32_t index = 0; index < std::min<size_t>(planes.planeCount, std::size(planes.planes)); ++index) {
            const auto &plane = planes.planes[index];
            AVCODEC_SAMPLE_LOGE("Camera plane %{public}u: offset=%{public}" PRIu64 ", rowStride=%{public}u, "
                                "columnStride=%{public}u",
                                index, plane.offset, plane.rowStride, plane.columnStride);
        }
        return false;
    }
    const int32_t lumaBytes = stride * sliceHeight;
    size = lumaBytes + lumaBytes / RecorderFrames::CHROMA_SUBSAMPLING;
    return true;
}
