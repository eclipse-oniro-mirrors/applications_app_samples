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

#ifndef OHOS_IPC_POINT_H
#define OHOS_IPC_POINT_H

#include <IPCKit/ipc_kit.h>

#include <array>
#include <cstdint>
#include <map>
#include <memory>
#include <set>
#include <string>
#include <vector>

namespace OHOS {
namespace IPC {

struct Point {
    int32_t x;
    int32_t y;

    int32_t Marshalling(OHIPCParcel* parcel) const;
    int32_t Unmarshalling(const OHIPCParcel* parcel);
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_POINT_H
