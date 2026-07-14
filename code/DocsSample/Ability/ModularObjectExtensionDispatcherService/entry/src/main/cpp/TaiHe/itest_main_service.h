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

#ifndef OHOS_IPC_ITEST_MAIN_SERVICE_H
#define OHOS_IPC_ITEST_MAIN_SERVICE_H

#include <IPCKit/ipc_kit.h>

#include <array>
#include <cstdint>
#include <map>
#include <memory>
#include <set>
#include <string>
#include <vector>


#include "icalculator.h"
#include "itest_event_callback.h"
#include "point.h"

namespace OHOS {
namespace IPC {

using ErrCode = int32_t;

class ITestMainService {
public:
    virtual ~ITestMainService() = default;
    static const char* GetDescriptor() { return "OHOS.IPC.ITestMainService"; }

    virtual ErrCode WriteRemoteObject(OHIPCParcel* parcel) const = 0;

    enum class IpcCode : uint32_t {
        COMMAND_ADD = 1001,
        COMMAND_TEST_TYPE__ARRAY = 1002,
        COMMAND_TEST_TYPE__VECTOR = 1003,
        COMMAND_TEST_TYPE__SET = 1004,
        COMMAND_TEST_TYPE__MAP = 1005,
        COMMAND_TEST_TYPE__STRUCT = 1006,
        COMMAND_REGISTER_CALLBACK = 1007,
        COMMAND_GET_PRIMARY_CALCULATOR = 1008,
        COMMAND_GET_TYPE_LIB_INFO = 1,
        COMMAND_GET_VERSION = 2,
        COMMAND_GET_TAIHE_VERSION = 3,
    };

    virtual ErrCode Add(int32_t a, int32_t b, int32_t& result) = 0;
    virtual ErrCode TestType_Array(
        const std::array<std::array<int32_t, 5>, 5>& matrix, std::array<std::array<int32_t, 5>, 5>& result) = 0;
    virtual ErrCode TestType_Vector(const std::vector<int32_t>& a, std::vector<int32_t>& result) = 0;
    virtual ErrCode TestType_Set(const std::set<int32_t>& a, std::set<int32_t>& result) = 0;
    virtual ErrCode TestType_Map(const std::map<std::string, int32_t>& a, std::map<std::string, int32_t>& result) = 0;
    virtual ErrCode TestType_Struct(OHOS::IPC::Point& a, int32_t idx, int32_t idy, OHOS::IPC::Point& result) = 0;
    virtual ErrCode RegisterCallback(OHOS::IPC::ITestEventCallback& callback) = 0;
    virtual ErrCode GetPrimaryCalculator(int32_t userId, OHOS::IPC::ICalculator*& result) = 0;
    virtual ErrCode GetTypeLibInfo(int32_t fd) = 0;
    virtual ErrCode GetVersion(std::string& result) = 0;
    virtual ErrCode GetTaiheVersion(std::string& result) = 0;
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_ITEST_MAIN_SERVICE_H
