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
    if (nativeBuffer == nullptr) {
        return false;
    }

    int32_t typeSize = 0;
    uint8_t *typeData = nullptr;
    if (!GetMetadata(nativeBuffer.get(), OH_HDR_METADATA_TYPE, typeSize, typeData) ||
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
    return GetMetadata(nativeBuffer.get(), OH_HDR_DYNAMIC_METADATA, dynamicMetadataSize, dynamicMetadata);
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
