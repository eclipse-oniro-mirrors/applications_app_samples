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

#ifndef OHOS_IPC_TEST_MAIN_SERVICE_PROXY_H
#define OHOS_IPC_TEST_MAIN_SERVICE_PROXY_H

#include "itest_main_service.h"

namespace OHOS {
namespace IPC {

class TestMainServiceProxy : public ITestMainService {
public:
    explicit TestMainServiceProxy(OHIPCRemoteProxy* remote) : remoteProxy_(remote) {}
    ~TestMainServiceProxy() override = default;

    OHIPCRemoteProxy* GetRemoteProxy() const
    {
        return remoteProxy_;
    }

    ErrCode WriteRemoteObject(OHIPCParcel* parcel) const override;

    ErrCode Add(int32_t a, int32_t b, int32_t& result) override;
    ErrCode TestType_Array(
        const std::array<std::array<int32_t, 5>, 5>& matrix, std::array<std::array<int32_t, 5>, 5>& result) override;
    ErrCode TestType_Vector(const std::vector<int32_t>& a, std::vector<int32_t>& result) override;
    ErrCode TestType_Set(const std::set<int32_t>& a, std::set<int32_t>& result) override;
    ErrCode TestType_Map(const std::map<std::string, int32_t>& a, std::map<std::string, int32_t>& result) override;
    ErrCode TestType_Struct(OHOS::IPC::Point& a, int32_t idx, int32_t idy, OHOS::IPC::Point& result) override;
    ErrCode RegisterCallback(OHOS::IPC::ITestEventCallback& callback) override;
    ErrCode GetPrimaryCalculator(int32_t userId, OHOS::IPC::ICalculator*& result) override;
    ErrCode GetTypeLibInfo(int32_t fd) override;
    ErrCode GetVersion(std::string& result) override;
    ErrCode GetTaiheVersion(std::string& result) override;

private:
    OHIPCRemoteProxy* remoteProxy_ = nullptr;
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_TEST_MAIN_SERVICE_PROXY_H
