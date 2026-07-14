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

#ifndef OHOS_IPC_ICALCULATOR_H
#define OHOS_IPC_ICALCULATOR_H

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

using ErrCode = int32_t;

class ICalculator {
public:
    virtual ~ICalculator() = default;
    static const char* GetDescriptor() { return "OHOS.IPC.ICalculator"; }

    virtual ErrCode WriteRemoteObject(OHIPCParcel* parcel) const = 0;

    enum class IpcCode : uint32_t {
        COMMAND_MULTIPLY = 1001,
        COMMAND_GET_VERSION = 2,
        COMMAND_GET_TAIHE_VERSION = 3,
    };

    virtual ErrCode multiply(int32_t a, int32_t b, int32_t& result) = 0;
    virtual ErrCode GetVersion(std::string& result) = 0;
    virtual ErrCode GetTaiheVersion(std::string& result) = 0;
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_ICALCULATOR_H
