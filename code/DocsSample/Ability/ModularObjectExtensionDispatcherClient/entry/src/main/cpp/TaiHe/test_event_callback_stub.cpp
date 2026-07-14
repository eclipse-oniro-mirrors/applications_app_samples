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

#include "test_event_callback_stub.h"

static void* OhipcReadInterfaceTokenAllocator(int32_t len)
{
    return malloc(len);
}

namespace OHOS {
namespace IPC {

TestEventCallbackStub::TestEventCallbackStub()
    : remoteStub_(OH_IPCRemoteStub_Create(
          ITestEventCallback::GetDescriptor(),
          &TestEventCallbackStub::OnRemoteRequest,
          nullptr,
          this))
{
}

TestEventCallbackStub::~TestEventCallbackStub()
{
    if (remoteStub_ != nullptr) {
        OH_IPCRemoteStub_Destroy(remoteStub_);
        remoteStub_ = nullptr;
    }
}

ErrCode TestEventCallbackStub::WriteRemoteObject(OHIPCParcel* parcel) const
{
    if (parcel == nullptr || remoteStub_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (OH_IPCParcel_WriteRemoteStub(parcel, remoteStub_) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestEventCallbackStub::OnRemoteRequest(
    uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply, void* userData)
{
    if (userData == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    auto* stub = static_cast<TestEventCallbackStub*>(userData);
    return stub->OnRemoteRequestInner(code, data, reply);
}

int32_t TestEventCallbackStub::OnRemoteRequestInner(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply)
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
        std::strcmp(remoteDescriptor, ITestEventCallback::GetDescriptor()) != 0) {
        if (remoteDescriptor != nullptr) {
            free(remoteDescriptor);
        }
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    free(remoteDescriptor);

    switch (static_cast<ITestEventCallback::IpcCode>(code)) {
        case ITestEventCallback::IpcCode::COMMAND_ON_CONNECTED:
            return HandleOnConnected(data, reply);
        case ITestEventCallback::IpcCode::COMMAND_ON_DISCONNECTED:
            return HandleOnDisconnected(data, reply);
        case ITestEventCallback::IpcCode::COMMAND_GET_VERSION:
            return HandleGetVersion(data, reply);
        case ITestEventCallback::IpcCode::COMMAND_GET_TAIHE_VERSION:
            return HandleGetTaiheVersion(data, reply);
        default:
            return OH_IPC_CHECK_PARAM_ERROR;
    }
}

int32_t TestEventCallbackStub::HandleOnConnected(const OHIPCParcel* data, OHIPCParcel* reply)
{
    int32_t clientIdValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &clientIdValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t clientId = clientIdValue;
    const char* welcomeRaw = OH_IPCParcel_ReadString(data);
    if (welcomeRaw == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    std::string welcome = welcomeRaw;
    ErrCode errCode = OnConnected(clientId, welcome);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestEventCallbackStub::HandleOnDisconnected(const OHIPCParcel* data, OHIPCParcel* reply)
{
    const char* reasonRaw = OH_IPCParcel_ReadString(data);
    if (reasonRaw == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    std::string reason = reasonRaw;
    ErrCode errCode = OnDisconnected(reason);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestEventCallbackStub::HandleGetVersion(const OHIPCParcel* data, OHIPCParcel* reply)
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

int32_t TestEventCallbackStub::HandleGetTaiheVersion(const OHIPCParcel* data, OHIPCParcel* reply)
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

ErrCode TestEventCallbackStub::GetVersion(std::string& result)
{
    result = "1";
    return OH_IPC_SUCCESS;
}

ErrCode TestEventCallbackStub::GetTaiheVersion(std::string& result)
{
    result = "1.0.0";
    return OH_IPC_SUCCESS;
}

} // namespace IPC
} // namespace OHOS
