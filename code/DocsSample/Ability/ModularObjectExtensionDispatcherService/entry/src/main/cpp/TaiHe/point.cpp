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

#include "point.h"

namespace OHOS {
namespace IPC {

int32_t Point::Marshalling(OHIPCParcel* parcel) const
{
    if (OH_IPCParcel_WriteInt32(parcel, x) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    if (OH_IPCParcel_WriteInt32(parcel, y) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t Point::Unmarshalling(const OHIPCParcel* parcel)
{
    int32_t xValue = 0;
    if (OH_IPCParcel_ReadInt32(parcel, &xValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    x = xValue;
    int32_t yValue = 0;
    if (OH_IPCParcel_ReadInt32(parcel, &yValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    y = yValue;
    return OH_IPC_SUCCESS;
}

} // namespace IPC
} // namespace OHOS
