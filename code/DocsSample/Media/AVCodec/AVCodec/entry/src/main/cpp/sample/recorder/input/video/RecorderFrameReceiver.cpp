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
#include <unordered_map>

#undef LOG_TAG
#define LOG_TAG "RecorderFrameReceiver"

struct RecorderArrivalSignal {
    std::mutex mutex;
    std::condition_variable condition;
    bool closing = false;
    bool arrived = true;
};

namespace {
constexpr int32_t RECEIVER_CAPACITY = 3;
std::mutex arrivalRegistryMutex;
std::unordered_map<OH_ImageReceiverNative *, std::shared_ptr<RecorderArrivalSignal>> arrivalRegistry;

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

void LogPlanes(const OH_NativeBuffer_Planes &planes)
{
    for (uint32_t index = 0; index < std::min<size_t>(planes.planeCount, std::size(planes.planes)); ++index) {
        const auto &plane = planes.planes[index];
        AVCODEC_SAMPLE_LOGE("Camera plane %{public}u: offset=%{public}" PRIu64 ", rowStride=%{public}u, "
            "columnStride=%{public}u", index, plane.offset, plane.rowStride, plane.columnStride);
    }
}
} // namespace

RecorderFrameReceiver::~RecorderFrameReceiver()
{
    closing_.store(true);
    if (arrival_ != nullptr) {
        std::lock_guard<std::mutex> lock(arrival_->mutex);
        arrival_->closing = true;
        arrival_->condition.notify_all();
    }
    if (callbackRegistered_) {
        const auto ret = unregisterArrival_(receiver_, OnImageArrive);
        if (ret != IMAGE_SUCCESS) {
            AVCODEC_SAMPLE_LOGW("Unregister image arrival failed: %{public}d", ret);
        }
    }
    {
        std::lock_guard<std::mutex> lock(arrivalRegistryMutex);
        arrivalRegistry.erase(receiver_);
    }
    CancelWait();
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
    if (receiverLibrary_ != nullptr) { (void)dlclose(receiverLibrary_); }
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
    receiverLibrary_ = dlopen("libimage_receiver.so", RTLD_NOW | RTLD_LOCAL);
    if (receiverLibrary_ == nullptr) { return false; }
    registerArrival_ = reinterpret_cast<RegisterArrival>(dlsym(receiverLibrary_, "OH_ImageReceiverNative_OnImageArrive"));
    unregisterArrival_ =
        reinterpret_cast<UnregisterArrival>(dlsym(receiverLibrary_, "OH_ImageReceiverNative_OffImageArrive"));
    if (getBufferData_ == nullptr || registerArrival_ == nullptr || unregisterArrival_ == nullptr) {
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
    arrival_ = std::make_shared<RecorderArrivalSignal>();
    {
        std::lock_guard<std::mutex> lock(arrivalRegistryMutex);
        arrivalRegistry.emplace(receiver_, arrival_);
    }
    // 回调只持有独立通知状态；注销失败或在途回调也不能访问已释放的Receiver业务对象。
    ret = registerArrival_(receiver_, OnImageArrive, nullptr);
    if (ret != IMAGE_SUCCESS) { return false; }
    callbackRegistered_ = true;
    try {
        receiverThread_ = std::thread(&RecorderFrameReceiver::ReceiveImages, this);
    } catch (const std::system_error &error) {
        AVCODEC_SAMPLE_LOGE("Create receiver worker failed: %{public}s", error.what());
        return false;
    }
    AVCODEC_SAMPLE_LOGI("Camera frame receiver ready: %{public}dx%{public}d", width, height);
    return true;
}

OH_ImageNative *RecorderFrameReceiver::ReadLatest(int32_t timeoutMs)
{
    std::unique_lock<std::mutex> lock(imageMutex_);
    if (timeoutMs > 0) {
        imageCond_.wait_for(lock, std::chrono::milliseconds(timeoutMs), [this]() {
            return latestImage_ != nullptr || inputCancelled_;
        });
    }
    if (inputCancelled_) { return nullptr; }
    OH_ImageNative *image = latestImage_;
    latestImage_ = nullptr;
    return image;
}

void RecorderFrameReceiver::CancelWait()
{
    {
        std::lock_guard<std::mutex> lock(imageMutex_);
        inputCancelled_ = true;
    }
    imageCond_.notify_all();
}

void RecorderFrameReceiver::OnImageArrive(OH_ImageReceiverNative *receiver, void *)
{
    std::shared_ptr<RecorderArrivalSignal> signal;
    {
        std::lock_guard<std::mutex> lock(arrivalRegistryMutex);
        const auto found = arrivalRegistry.find(receiver);
        if (found == arrivalRegistry.end()) { return; }
        signal = found->second;
    }
    std::lock_guard<std::mutex> lock(signal->mutex);
    if (!signal->closing) {
        signal->arrived = true;
        signal->condition.notify_one();
    }
}

void RecorderFrameReceiver::ReceiveImages()
{
    while (!closing_.load()) {
        {
            std::unique_lock<std::mutex> lock(arrival_->mutex);
            arrival_->condition.wait(lock, [this]() { return closing_.load() || arrival_->arrived; });
            if (closing_.load()) { break; }
            arrival_->arrived = false;
        }
        OH_ImageNative *image = nullptr;
        if (OH_ImageReceiverNative_ReadLatestImage(receiver_, &image) == IMAGE_SUCCESS && image != nullptr) {
            {
                std::lock_guard<std::mutex> lock(imageMutex_);
                std::swap(image, latestImage_);
            }
            imageCond_.notify_one();
        }
        if (image != nullptr) {
            (void)OH_ImageNative_Release(image);
        }
        // 准备页面尚未开始编码时也持续消费；否则Receiver满后可能连带阻塞相机显示预览。
    }
}

bool RecorderFrameReceiver::ReadImageData(OH_ImageNative *image, OH_ImageBufferData &data) const
{
    Image_Size imageSize{};
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
    return true;
}

bool RecorderFrameReceiver::Copy(OH_ImageNative *image, OH_AVBuffer *destination, int32_t stride, int32_t sliceHeight,
                                 int32_t &size) const
{
    OH_ImageBufferData data{};
    if (image == nullptr || destination == nullptr || !ReadImageData(image, data)) {
        return false;
    }
    OH_NativeBuffer_Config config{};
    OH_NativeBuffer_GetConfig(data.nativeBuffer, &config);
    OH_NativeBuffer_ColorSpace color = OH_COLORSPACE_NONE;
    if (OH_NativeBuffer_GetColorSpace(data.nativeBuffer, &color) == 0 && color != OH_COLORSPACE_NONE &&
        color != OH_COLORSPACE_BT709_LIMIT) {
        AVCODEC_SAMPLE_LOGE("Camera Buffer color space differs from BT.709 limited: %{public}d", color);
        return false;
    }
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
        LogPlanes(planes);
        return false;
    }
    const int32_t lumaBytes = stride * sliceHeight;
    size = lumaBytes + lumaBytes / RecorderFrames::CHROMA_SUBSAMPLING;
    return true;
}
