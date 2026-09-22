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

#include "HdrMetadataHelper.h"

#include <algorithm>
#include <memory>

#include <native_fence/native_fence.h>

namespace {
struct NativeBufferUnreferencer {
    void operator()(OH_NativeBuffer *buffer) const
    {
        if (buffer != nullptr) {
            (void)OH_NativeBuffer_Unreference(buffer);
        }
    }
};

using NativeBufferReference = std::unique_ptr<OH_NativeBuffer, NativeBufferUnreferencer>;

NativeBufferReference GetNativeBuffer(OH_AVBuffer *buffer)
{
    return NativeBufferReference(buffer == nullptr ? nullptr : OH_AVBuffer_GetNativeBuffer(buffer));
}

bool GetMetadata(OH_NativeBuffer *buffer, OH_NativeBuffer_MetadataKey key, int32_t &size, uint8_t *&data)
{
    size = 0;
    data = nullptr;
    return buffer != nullptr && OH_NativeBuffer_GetMetadataValue(buffer, key, &size, &data) == 0 &&
        size > 0 && data != nullptr;
}

bool SetMetadataType(OH_NativeBuffer *buffer, OH_NativeBuffer_MetadataType type)
{
    return OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_METADATA_TYPE, static_cast<int32_t>(sizeof(type)),
        reinterpret_cast<uint8_t *>(&type)) == 0;
}

bool IsHdrVividNativeBuffer(OH_NativeBuffer *nativeBuffer)
{
    if (nativeBuffer == nullptr) {
        return false;
    }

    int32_t typeSize = 0;
    uint8_t *typeData = nullptr;
    if (!GetMetadata(nativeBuffer, OH_HDR_METADATA_TYPE, typeSize, typeData) ||
        typeSize < static_cast<int32_t>(sizeof(OH_NativeBuffer_MetadataType))) {
        return false;
    }
    OH_NativeBuffer_MetadataType type = OH_VIDEO_NONE;
    std::copy_n(typeData, sizeof(type), reinterpret_cast<uint8_t *>(&type));
    if (type != OH_VIDEO_HDR_VIVID) {
        return false;
    }

    int32_t dynamicMetadataSize = 0;
    uint8_t *dynamicMetadata = nullptr;
    return GetMetadata(nativeBuffer, OH_HDR_DYNAMIC_METADATA, dynamicMetadataSize, dynamicMetadata);
}

bool SetNativeWindowMetadata(OHNativeWindow *window, OH_NativeBuffer_ColorSpace colorSpace,
    OH_NativeBuffer_MetadataType metadataType)
{
    if (window == nullptr) {
        return false;
    }
    // The native-window API takes a byte vector, while the payload for OH_HDR_METADATA_TYPE is
    // the complete OH_NativeBuffer_MetadataType enum rather than a single enumerator byte.
    const int32_t colorSpaceRet = OH_NativeWindow_SetColorSpace(window, colorSpace);
    const int32_t metadataRet = OH_NativeWindow_SetMetadataValue(window, OH_HDR_METADATA_TYPE,
        static_cast<int32_t>(sizeof(metadataType)), reinterpret_cast<uint8_t *>(&metadataType));
    return colorSpaceRet == 0 && metadataRet == 0;
}

bool CopyMetadata(OH_NativeBuffer *source, OH_NativeBuffer *target, OH_NativeBuffer_MetadataKey key)
{
    int32_t size = 0;
    uint8_t *data = nullptr;
    if (!GetMetadata(source, key, size, data)) {
        return true;
    }
    return OH_NativeBuffer_SetMetadataValue(target, key, size, data) == 0;
}
} // namespace

bool HdrMetadataHelper::IsHdrVivid(OH_AVBuffer *buffer)
{
    NativeBufferReference nativeBuffer = GetNativeBuffer(buffer);
    return IsHdrVividNativeBuffer(nativeBuffer.get());
}

bool HdrMetadataHelper::IsLastFlushedBufferHdrVivid(OHNativeWindow *window)
{
    if (window == nullptr) {
        return false;
    }
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fenceFd = -1;
    float transformMatrix[16] = {};
    const int32_t ret = OH_NativeWindow_GetLastFlushedBufferV2(window, &windowBuffer, &fenceFd, transformMatrix);
    if (fenceFd >= 0) {
        OH_NativeFence_Close(fenceFd);
    }
    if (ret != 0 || windowBuffer == nullptr) {
        return false;
    }

    OH_NativeBuffer *nativeBuffer = nullptr;
    const int32_t nativeBufferRet = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativeBuffer);
    const bool isHdrVivid = nativeBufferRet == 0 && IsHdrVividNativeBuffer(nativeBuffer);
    (void)OH_NativeWindow_NativeObjectUnreference(windowBuffer);
    return isHdrVivid;
}

bool HdrMetadataHelper::CopyToNativeBuffer(OH_AVBuffer *sourceBuffer, OH_NativeBuffer *targetBuffer)
{
    if (targetBuffer == nullptr) {
        return false;
    }
    NativeBufferReference sourceNativeBuffer = GetNativeBuffer(sourceBuffer);
    if (sourceNativeBuffer == nullptr) {
        return true;
    }

    bool succeeded = true;
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_NONE;
    if (OH_NativeBuffer_GetColorSpace(sourceNativeBuffer.get(), &colorSpace) == 0) {
        succeeded = OH_NativeBuffer_SetColorSpace(targetBuffer, colorSpace) == 0 && succeeded;
    }

    int32_t typeSize = 0;
    uint8_t *typeData = nullptr;
    if (!GetMetadata(sourceNativeBuffer.get(), OH_HDR_METADATA_TYPE, typeSize, typeData) ||
        typeSize < static_cast<int32_t>(sizeof(OH_NativeBuffer_MetadataType))) {
        return SetMetadataType(targetBuffer, OH_VIDEO_NONE) && succeeded;
    }

    succeeded = CopyMetadata(sourceNativeBuffer.get(), targetBuffer, OH_HDR_STATIC_METADATA) && succeeded;
    succeeded = CopyMetadata(sourceNativeBuffer.get(), targetBuffer, OH_HDR_DYNAMIC_METADATA) && succeeded;
    return OH_NativeBuffer_SetMetadataValue(targetBuffer, OH_HDR_METADATA_TYPE,
        typeSize, typeData) == 0 && succeeded;
}

bool HdrMetadataHelper::SetBt709OutputMetadata(OH_NativeBuffer *targetBuffer)
{
    if (targetBuffer == nullptr) {
        return false;
    }
    return OH_NativeBuffer_SetColorSpace(targetBuffer, OH_COLORSPACE_BT709_LIMIT) == 0 &&
        SetMetadataType(targetBuffer, OH_VIDEO_NONE);
}

bool HdrMetadataHelper::ResetNativeWindowSdrMetadata(OHNativeWindow *window)
{
    return SetNativeWindowMetadata(window, OH_COLORSPACE_BT709_LIMIT, OH_VIDEO_NONE);
}
