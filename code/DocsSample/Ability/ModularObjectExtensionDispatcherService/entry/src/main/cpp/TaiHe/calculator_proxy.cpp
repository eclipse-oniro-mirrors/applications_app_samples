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

#include "calculator_proxy.h"

namespace OHOS {
namespace IPC {

namespace {
struct ParcelDeleter {
    void operator()(OHIPCParcel* parcel) const
    {
        if (parcel != nullptr) {
            OH_IPCParcel_Destroy(parcel);
        }
    }
};
} // namespace

ErrCode CalculatorProxy::WriteRemoteObject(OHIPCParcel* parcel) const
{
    if (parcel == nullptr || remoteProxy_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (OH_IPCParcel_WriteRemoteProxy(parcel, remoteProxy_) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

ErrCode CalculatorProxy::multiply(int32_t a, int32_t b, int32_t& result)
{
    if (remoteProxy_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelData(OH_IPCParcel_Create());
    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelReply(OH_IPCParcel_Create());
    if (parcelData == nullptr || parcelReply == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    if (OH_IPCParcel_WriteInterfaceToken(parcelData.get(),
        ICalculator::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), a) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    if (OH_IPCParcel_WriteInt32(parcelData.get(), b) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ICalculator::IpcCode::COMMAND_MULTIPLY),
        parcelData.get(),
        parcelReply.get(),
        &option);
    if (transportErr != OH_IPC_SUCCESS) {
        return transportErr;
    }

    int32_t errCode = OH_IPC_SUCCESS;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }

    int32_t resultValue = 0;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &resultValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    result = resultValue;

    return errCode;
}

ErrCode CalculatorProxy::GetVersion(std::string& result)
{
    if (remoteProxy_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelData(OH_IPCParcel_Create());
    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelReply(OH_IPCParcel_Create());
    if (parcelData == nullptr || parcelReply == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    if (OH_IPCParcel_WriteInterfaceToken(parcelData.get(),
        ICalculator::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ICalculator::IpcCode::COMMAND_GET_VERSION),
        parcelData.get(),
        parcelReply.get(),
        &option);
    if (transportErr != OH_IPC_SUCCESS) {
        return transportErr;
    }

    int32_t errCode = OH_IPC_SUCCESS;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }

    const char* versionStr = OH_IPCParcel_ReadString(parcelReply.get());
    if (versionStr == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    result = versionStr;

    return errCode;
}

ErrCode CalculatorProxy::GetTaiheVersion(std::string& result)
{
    if (remoteProxy_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelData(OH_IPCParcel_Create());
    std::unique_ptr<OHIPCParcel, ParcelDeleter> parcelReply(OH_IPCParcel_Create());
    if (parcelData == nullptr || parcelReply == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }

    if (OH_IPCParcel_WriteInterfaceToken(parcelData.get(),
        ICalculator::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ICalculator::IpcCode::COMMAND_GET_TAIHE_VERSION),
        parcelData.get(),
        parcelReply.get(),
        &option);
    if (transportErr != OH_IPC_SUCCESS) {
        return transportErr;
    }

    int32_t errCode = OH_IPC_SUCCESS;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }

    const char* versionStr = OH_IPCParcel_ReadString(parcelReply.get());
    if (versionStr == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    result = versionStr;

    return errCode;
}

} // namespace IPC
} // namespace OHOS
