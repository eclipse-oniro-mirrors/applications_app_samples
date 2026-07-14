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

#ifndef OHOS_IPC_TEST_MAIN_SERVICE_STUB_H
#define OHOS_IPC_TEST_MAIN_SERVICE_STUB_H

#include <AbilityKit/ability_runtime/modular_object_extension_context.h>
#include "itest_main_service.h"

namespace OHOS {
namespace IPC {

class TestMainServiceStub : public ITestMainService {
public:
    explicit TestMainServiceStub(OH_AbilityRuntime_ModObjExtensionContextHandle context);
    ~TestMainServiceStub() override;

    OHIPCRemoteStub* GetRemoteStub() const
    {
        return remoteStub_;
    }

    ErrCode WriteRemoteObject(OHIPCParcel* parcel) const override;

    static int32_t OnRemoteRequest(
        uint32_t code,
        const OHIPCParcel* data,
        OHIPCParcel* reply,
        void* userData);

protected:
    ErrCode GetTypeLibInfo(int32_t fd) override;
    ErrCode GetVersion(std::string& result) override;
    ErrCode GetTaiheVersion(std::string& result) override;

private:
    int32_t OnRemoteRequestInner(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleAdd(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleTestType_Array(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleTestType_Vector(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleTestType_Set(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleTestType_Map(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleTestType_Struct(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleRegisterCallback(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleGetPrimaryCalculator(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleGetTypeLibInfo(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleGetVersion(const OHIPCParcel* data, OHIPCParcel* reply);
    int32_t HandleGetTaiheVersion(const OHIPCParcel* data, OHIPCParcel* reply);

private:
    OHIPCRemoteStub* remoteStub_ = nullptr;
    OH_AbilityRuntime_ModObjExtensionContextHandle context_;
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_TEST_MAIN_SERVICE_STUB_H
