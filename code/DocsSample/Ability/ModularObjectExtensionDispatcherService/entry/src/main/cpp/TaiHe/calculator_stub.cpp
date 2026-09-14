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

#include <cstdlib>
#include <cstring>
#include <unistd.h>

#include "calculator_stub.h"

static void* OhipcReadInterfaceTokenAllocator(int32_t len)
{
    return malloc(len);
}

namespace OHOS {
namespace IPC {

CalculatorStub::CalculatorStub(OH_AbilityRuntime_ModObjExtensionContextHandle context)
    : context_(context),
      remoteStub_(OH_AbilityRuntime_ModObjExtensionContext_CreateIPCRemoteStub(
          context,
          ICalculator::GetDescriptor(),
          &CalculatorStub::OnRemoteRequest,
          nullptr,
          this))
{
}

CalculatorStub::~CalculatorStub()
{
    if (remoteStub_ != nullptr) {
        OH_AbilityRuntime_ModObjExtensionContext_DestroyIPCRemoteStub(context_, remoteStub_);
        remoteStub_ = nullptr;
    }
}

ErrCode CalculatorStub::WriteRemoteObject(OHIPCParcel* parcel) const
{
    if (parcel == nullptr || remoteStub_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (OH_IPCParcel_WriteRemoteStub(parcel, remoteStub_) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t CalculatorStub::OnRemoteRequest(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply, void* userData)
{
    if (userData == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    auto* stub = static_cast<CalculatorStub*>(userData);
    return stub->OnRemoteRequestInner(code, data, reply);
}

int32_t CalculatorStub::OnRemoteRequestInner(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply)
{
    if (data == nullptr || reply == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    char* remoteDescriptor = nullptr;
    int32_t remoteDescriptorLen = 0;
    if (OH_IPCParcel_ReadInterfaceToken(data, &remoteDescriptor,
        &remoteDescriptorLen, OhipcReadInterfaceTokenAllocator) != OH_IPC_SUCCESS) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (remoteDescriptor == nullptr ||
        std::strcmp(remoteDescriptor, ICalculator::GetDescriptor()) != 0) {
        if (remoteDescriptor != nullptr) {
            free(remoteDescriptor);
        }
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    free(remoteDescriptor);

    switch (static_cast<ICalculator::IpcCode>(code)) {
        case ICalculator::IpcCode::COMMAND_MULTIPLY:
            return Handlemultiply(data, reply);
        case ICalculator::IpcCode::COMMAND_GET_VERSION:
            return HandleGetVersion(data, reply);
        case ICalculator::IpcCode::COMMAND_GET_TAIHE_VERSION:
            return HandleGetTaiheVersion(data, reply);
        default:
            return OH_IPC_CHECK_PARAM_ERROR;
    }
}

int32_t CalculatorStub::Handlemultiply(const OHIPCParcel* data, OHIPCParcel* reply)
{
    int32_t aValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &aValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t a = aValue;
    int32_t bValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &bValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t b = bValue;
    int32_t result = 0;
    ErrCode errCode = multiply(a, b, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, result) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    return OH_IPC_SUCCESS;
}

int32_t CalculatorStub::HandleGetVersion(const OHIPCParcel* data, OHIPCParcel* reply)
{
    std::string result;
    ErrCode errCode = GetVersion(result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteString(reply, result.c_str()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t CalculatorStub::HandleGetTaiheVersion(const OHIPCParcel* data, OHIPCParcel* reply)
{
    std::string result;
    ErrCode errCode = GetTaiheVersion(result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteString(reply, result.c_str()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

ErrCode CalculatorStub::GetVersion(std::string& result)
{
    result = "1";
    return OH_IPC_SUCCESS;
}

ErrCode CalculatorStub::GetTaiheVersion(std::string& result)
{
    result = "1.0.0";
    return OH_IPC_SUCCESS;
}

} // namespace IPC
} // namespace OHOS
