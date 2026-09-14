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

#include "test_main_service_proxy.h"
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

ErrCode TestMainServiceProxy::WriteRemoteObject(OHIPCParcel* parcel) const
{
    if (parcel == nullptr || remoteProxy_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (OH_IPCParcel_WriteRemoteProxy(parcel, remoteProxy_) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

ErrCode TestMainServiceProxy::Add(int32_t a, int32_t b, int32_t& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
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
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_ADD),
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

ErrCode TestMainServiceProxy::TestType_Array(
    const std::array<std::array<int32_t, 5>, 5>& matrix, std::array<std::array<int32_t, 5>, 5>& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), 5) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (int32_t i = 0; i < 5; ++i) {
        std::array<int32_t, 5> item = matrix[i];
        if (OH_IPCParcel_WriteInt32(parcelData.get(), 5) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
        for (int32_t i1 = 0; i1 < 5; ++i1) {
            int32_t item1 = item[i1];
            if (OH_IPCParcel_WriteInt32(parcelData.get(), item1) != OH_IPC_SUCCESS) {
                return OH_IPC_PARCEL_WRITE_ERROR;
            }
        }
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_TEST_TYPE__ARRAY),
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

    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    if (sz != 5) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    result = {};
    for (int32_t i = 0; i < sz; ++i) {
        int32_t sz1 = 0;
        if (OH_IPCParcel_ReadInt32(parcelReply.get(), &sz1) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        if (sz1 != 5) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        std::array<int32_t, 5> item = {};
        for (int32_t i1 = 0; i1 < sz1; ++i1) {
            int32_t item1Value = 0;
            if (OH_IPCParcel_ReadInt32(parcelReply.get(), &item1Value) != OH_IPC_SUCCESS) {
                return OH_IPC_PARCEL_READ_ERROR;
            }
            int32_t item1 = item1Value;
            item[static_cast<size_t>(i1)] = item1;
        }
        result[static_cast<size_t>(i)] = item;
    }

    return errCode;
}

ErrCode TestMainServiceProxy::TestType_Vector(const std::vector<int32_t>& a, std::vector<int32_t>& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), static_cast<int32_t>(a.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& item : a) {
        if (OH_IPCParcel_WriteInt32(parcelData.get(), item) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_TEST_TYPE__VECTOR),
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

    result.clear();
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        int32_t itemValue = 0;
        if (OH_IPCParcel_ReadInt32(parcelReply.get(), &itemValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t item = itemValue;
        result.push_back(item);
    }

    return errCode;
}

ErrCode TestMainServiceProxy::TestType_Set(const std::set<int32_t>& a, std::set<int32_t>& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), static_cast<int32_t>(a.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& item : a) {
        if (OH_IPCParcel_WriteInt32(parcelData.get(), item) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_TEST_TYPE__SET),
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

    result.clear();
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        int32_t itemValue = 0;
        if (OH_IPCParcel_ReadInt32(parcelReply.get(), &itemValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t item = itemValue;
        result.insert(item);
    }

    return errCode;
}

ErrCode TestMainServiceProxy::TestType_Map(
    const std::map<std::string, int32_t>& a, std::map<std::string, int32_t>& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), static_cast<int32_t>(a.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& entry : a) {
        auto key = entry.first;
        auto val = entry.second;
        if (OH_IPCParcel_WriteString(parcelData.get(), key.c_str()) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
        if (OH_IPCParcel_WriteInt32(parcelData.get(), val) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_TEST_TYPE__MAP),
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

    result.clear();
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(parcelReply.get(), &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        const char* keyRaw = OH_IPCParcel_ReadString(parcelReply.get());
        if (keyRaw == nullptr) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        std::string key = keyRaw;
        int32_t valValue = 0;
        if (OH_IPCParcel_ReadInt32(parcelReply.get(), &valValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t val = valValue;
        result.erase(key);
        result.emplace(key, val);
    }

    return errCode;
}

ErrCode TestMainServiceProxy::TestType_Struct(OHOS::IPC::Point& a, int32_t idx, int32_t idy, OHOS::IPC::Point& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (a.Marshalling(parcelData.get()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    if (OH_IPCParcel_WriteInt32(parcelData.get(), idx) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    if (OH_IPCParcel_WriteInt32(parcelData.get(), idy) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_TEST_TYPE__STRUCT),
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

    if (result.Unmarshalling(parcelReply.get()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }

    return errCode;
}

ErrCode TestMainServiceProxy::RegisterCallback(OHOS::IPC::ITestEventCallback& callback)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    ErrCode callbackWriteStatus = callback.WriteRemoteObject(parcelData.get());
    if (callbackWriteStatus != OH_IPC_SUCCESS) {
        return callbackWriteStatus;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_REGISTER_CALLBACK),
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


    return errCode;
}

ErrCode TestMainServiceProxy::GetPrimaryCalculator(int32_t userId, OHOS::IPC::ICalculator*& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(parcelData.get(), userId) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_GET_PRIMARY_CALCULATOR),
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

    OHIPCRemoteProxy* resultProxy = OH_IPCParcel_ReadRemoteProxy(parcelReply.get());
    if (resultProxy == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    result = new OHOS::IPC::CalculatorProxy(resultProxy);

    return errCode;
}

ErrCode TestMainServiceProxy::GetTypeLibInfo(int32_t fd)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    // Write fd using OH_IPCParcel_WriteFileDescriptor
    if (OH_IPCParcel_WriteFileDescriptor(parcelData.get(), fd) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_GET_TYPE_LIB_INFO),
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

    return errCode;
}

ErrCode TestMainServiceProxy::GetVersion(std::string& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_GET_VERSION),
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

ErrCode TestMainServiceProxy::GetTaiheVersion(std::string& result)
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
        ITestMainService::GetDescriptor()) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    OH_IPC_MessageOption option = { OH_IPC_REQUEST_MODE_SYNC, 0 };
    int32_t transportErr = OH_IPCRemoteProxy_SendRequest(
        remoteProxy_,
        static_cast<uint32_t>(ITestMainService::IpcCode::COMMAND_GET_TAIHE_VERSION),
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
