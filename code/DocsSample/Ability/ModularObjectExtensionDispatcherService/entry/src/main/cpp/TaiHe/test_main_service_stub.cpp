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

#include "test_main_service_stub.h"
#include "test_event_callback_proxy.h"

static void* OhipcReadInterfaceTokenAllocator(int32_t len)
{
    return malloc(len);
}

static const char* typeLibInfo = "{\"version\":\"1.0\",\"taihe_version\":\"1.0.0\",\"enums\":[],\"structs\":[{\"memberId\":1,\"name\":\"Point\",\"fields\":[{\"memberId\":2,\"name\":\"x\",\"type_info\":{\"type\":\"i32\"}},{\"memberId\":3,\"name\":\"y\",\"type_info\":{\"type\":\"i32\"}}]}],\"interfaces\":[{\"memberId\":4,\"name\":\"ICalculator\",\"descriptor\":\"OHOS.IPC.ICalculator\",\"interface_type\":0,\"methods\":[{\"memberId\":7,\"name\":\"multiply\",\"code\":1001,\"oneway\":false,\"return_type\":{\"type\":\"i32\"},\"parameters\":[{\"memberId\":5,\"name\":\"a\",\"type_info\":{\"type\":\"i32\"}},{\"memberId\":6,\"name\":\"b\",\"type_info\":{\"type\":\"i32\"}}]}]},{\"memberId\":8,\"name\":\"ITestEventCallback\",\"descriptor\":\"OHOS.IPC.ITestEventCallback\",\"interface_type\":2,\"methods\":[{\"memberId\":11,\"name\":\"OnConnected\",\"code\":1001,\"oneway\":false,\"return_type\":{\"type\":\"void\"},\"parameters\":[{\"memberId\":9,\"name\":\"clientId\",\"type_info\":{\"type\":\"i32\"}},{\"memberId\":10,\"name\":\"welcome\",\"type_info\":{\"type\":\"String\"}}]},{\"memberId\":13,\"name\":\"OnDisconnected\",\"code\":1002,\"oneway\":true,\"return_type\":{\"type\":\"void\"},\"parameters\":[{\"memberId\":12,\"name\":\"reason\",\"type_info\":{\"type\":\"String\"}}]}]},{\"memberId\":14,\"name\":\"ITestMainService\",\"descriptor\":\"OHOS.IPC.ITestMainService\",\"interface_type\":1,\"methods\":[{\"memberId\":17,\"name\":\"Add\",\"code\":1001,\"oneway\":false,\"return_type\":{\"type\":\"i32\"},\"parameters\":[{\"memberId\":15,\"name\":\"a\",\"type_info\":{\"type\":\"i32\"}},{\"memberId\":16,\"name\":\"b\",\"type_info\":{\"type\":\"i32\"}}]},{\"memberId\":19,\"name\":\"TestType_Array\",\"code\":1002,\"oneway\":false,\"return_type\":{\"type\":\"array\",\"size\":5,\"value_type\":{\"type\":\"array\",\"size\":5,\"value_type\":{\"type\":\"i32\"}}},\"parameters\":[{\"memberId\":18,\"name\":\"matrix\",\"type_info\":{\"type\":\"array\",\"size\":5,\"value_type\":{\"type\":\"array\",\"size\":5,\"value_type\":{\"type\":\"i32\"}}}}]},{\"memberId\":21,\"name\":\"TestType_Vector\",\"code\":1003,\"oneway\":false,\"return_type\":{\"type\":\"vector\",\"value_type\":{\"type\":\"i32\"}},\"parameters\":[{\"memberId\":20,\"name\":\"a\",\"type_info\":{\"type\":\"vector\",\"value_type\":{\"type\":\"i32\"}}}]},{\"memberId\":23,\"name\":\"TestType_Set\",\"code\":1004,\"oneway\":false,\"return_type\":{\"type\":\"set\",\"value_type\":{\"type\":\"i32\"}},\"parameters\":[{\"memberId\":22,\"name\":\"a\",\"type_info\":{\"type\":\"set\",\"value_type\":{\"type\":\"i32\"}}}]},{\"memberId\":25,\"name\":\"TestType_Map\",\"code\":1005,\"oneway\":false,\"return_type\":{\"type\":\"map\",\"key_type\":{\"type\":\"String\"},\"value_type\":{\"type\":\"i32\"}},\"parameters\":[{\"memberId\":24,\"name\":\"a\",\"type_info\":{\"type\":\"map\",\"key_type\":{\"type\":\"String\"},\"value_type\":{\"type\":\"i32\"}}}]},{\"memberId\":29,\"name\":\"TestType_Struct\",\"code\":1006,\"oneway\":false,\"return_type\":{\"type\":\"struct\",\"idl_type\":\"Point\"},\"parameters\":[{\"memberId\":26,\"name\":\"a\",\"type_info\":{\"type\":\"struct\",\"idl_type\":\"Point\"}},{\"memberId\":27,\"name\":\"idx\",\"type_info\":{\"type\":\"i32\"}},{\"memberId\":28,\"name\":\"idy\",\"type_info\":{\"type\":\"i32\"}}]},{\"memberId\":31,\"name\":\"RegisterCallback\",\"code\":1007,\"oneway\":false,\"return_type\":{\"type\":\"void\"},\"parameters\":[{\"memberId\":30,\"name\":\"callback\",\"type_info\":{\"type\":\"interface\",\"idl_type\":\"ITestEventCallback\"}}]},{\"memberId\":33,\"name\":\"GetPrimaryCalculator\",\"code\":1008,\"oneway\":false,\"return_type\":{\"type\":\"interface\",\"idl_type\":\"ICalculator\"},\"parameters\":[{\"memberId\":32,\"name\":\"userId\",\"type_info\":{\"type\":\"i32\"}}]}]}]}";

namespace OHOS {
namespace IPC {

TestMainServiceStub::TestMainServiceStub(OH_AbilityRuntime_ModObjExtensionContextHandle context)
    : context_(context),
      remoteStub_(OH_AbilityRuntime_ModObjExtensionContext_CreateIPCRemoteStub(
          context,
          ITestMainService::GetDescriptor(),
          &TestMainServiceStub::OnRemoteRequest,
          nullptr,
          this))
{
}

TestMainServiceStub::~TestMainServiceStub()
{
    if (remoteStub_ != nullptr) {
        OH_AbilityRuntime_ModObjExtensionContext_DestroyIPCRemoteStub(context_, remoteStub_);
        remoteStub_ = nullptr;
    }
}

ErrCode TestMainServiceStub::WriteRemoteObject(OHIPCParcel* parcel) const
{
    if (parcel == nullptr || remoteStub_ == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    if (OH_IPCParcel_WriteRemoteStub(parcel, remoteStub_) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::OnRemoteRequest(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply, void* userData)
{
    if (userData == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    auto* stub = static_cast<TestMainServiceStub*>(userData);
    return stub->OnRemoteRequestInner(code, data, reply);
}

int32_t TestMainServiceStub::OnRemoteRequestInner(uint32_t code, const OHIPCParcel* data, OHIPCParcel* reply)
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
        std::strcmp(remoteDescriptor, ITestMainService::GetDescriptor()) != 0) {
        if (remoteDescriptor != nullptr) {
            free(remoteDescriptor);
        }
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    free(remoteDescriptor);

    switch (static_cast<ITestMainService::IpcCode>(code)) {
        case ITestMainService::IpcCode::COMMAND_ADD:
            return HandleAdd(data, reply);
        case ITestMainService::IpcCode::COMMAND_TEST_TYPE__ARRAY:
            return HandleTestType_Array(data, reply);
        case ITestMainService::IpcCode::COMMAND_TEST_TYPE__VECTOR:
            return HandleTestType_Vector(data, reply);
        case ITestMainService::IpcCode::COMMAND_TEST_TYPE__SET:
            return HandleTestType_Set(data, reply);
        case ITestMainService::IpcCode::COMMAND_TEST_TYPE__MAP:
            return HandleTestType_Map(data, reply);
        case ITestMainService::IpcCode::COMMAND_TEST_TYPE__STRUCT:
            return HandleTestType_Struct(data, reply);
        case ITestMainService::IpcCode::COMMAND_REGISTER_CALLBACK:
            return HandleRegisterCallback(data, reply);
        case ITestMainService::IpcCode::COMMAND_GET_PRIMARY_CALCULATOR:
            return HandleGetPrimaryCalculator(data, reply);
        case ITestMainService::IpcCode::COMMAND_GET_TYPE_LIB_INFO:
            return HandleGetTypeLibInfo(data, reply);
        case ITestMainService::IpcCode::COMMAND_GET_VERSION:
            return HandleGetVersion(data, reply);
        case ITestMainService::IpcCode::COMMAND_GET_TAIHE_VERSION:
            return HandleGetTaiheVersion(data, reply);
        default:
            return OH_IPC_CHECK_PARAM_ERROR;
    }
}

int32_t TestMainServiceStub::HandleAdd(const OHIPCParcel* data, OHIPCParcel* reply)
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
    ErrCode errCode = Add(a, b, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, result) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleTestType_Array(const OHIPCParcel* data, OHIPCParcel* reply)
{
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(data, &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    if (sz != 5) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    std::array<std::array<int32_t, 5>, 5> matrix = {};
    for (int32_t i = 0; i < sz; ++i) {
        int32_t sz1 = 0;
        if (OH_IPCParcel_ReadInt32(data, &sz1) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        if (sz1 != 5) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        std::array<int32_t, 5> item = {};
        for (int32_t i1 = 0; i1 < sz1; ++i1) {
            int32_t item1Value = 0;
            if (OH_IPCParcel_ReadInt32(data, &item1Value) != OH_IPC_SUCCESS) {
                return OH_IPC_PARCEL_READ_ERROR;
            }
            int32_t item1 = item1Value;
            item[static_cast<size_t>(i1)] = item1;
        }
        matrix[static_cast<size_t>(i)] = item;
    }
    std::array<std::array<int32_t, 5>, 5> result = {};
    ErrCode errCode = TestType_Array(matrix, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, 5) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (int32_t i = 0; i < 5; ++i) {
        std::array<int32_t, 5> item = result[i];
        if (OH_IPCParcel_WriteInt32(reply, 5) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
        for (int32_t i1 = 0; i1 < 5; ++i1) {
            int32_t item1 = item[i1];
            if (OH_IPCParcel_WriteInt32(reply, item1) != OH_IPC_SUCCESS) {
                return OH_IPC_PARCEL_WRITE_ERROR;
            }
        }
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleTestType_Vector(const OHIPCParcel* data, OHIPCParcel* reply)
{
    std::vector<int32_t> a;
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(data, &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        int32_t itemValue = 0;
        if (OH_IPCParcel_ReadInt32(data, &itemValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t item = itemValue;
        a.push_back(item);
    }
    std::vector<int32_t> result;
    ErrCode errCode = TestType_Vector(a, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, static_cast<int32_t>(result.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& item : result) {
        if (OH_IPCParcel_WriteInt32(reply, item) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleTestType_Set(const OHIPCParcel* data, OHIPCParcel* reply)
{
    std::set<int32_t> a;
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(data, &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        int32_t itemValue = 0;
        if (OH_IPCParcel_ReadInt32(data, &itemValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t item = itemValue;
        a.insert(item);
    }
    std::set<int32_t> result;
    ErrCode errCode = TestType_Set(a, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, static_cast<int32_t>(result.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& item : result) {
        if (OH_IPCParcel_WriteInt32(reply, item) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleTestType_Map(const OHIPCParcel* data, OHIPCParcel* reply)
{
    std::map<std::string, int32_t> a;
    int32_t sz = 0;
    if (OH_IPCParcel_ReadInt32(data, &sz) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    for (int32_t i = 0; i < sz; ++i) {
        const char* keyRaw = OH_IPCParcel_ReadString(data);
        if (keyRaw == nullptr) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        std::string key = keyRaw;
        int32_t valValue = 0;
        if (OH_IPCParcel_ReadInt32(data, &valValue) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_READ_ERROR;
        }
        int32_t val = valValue;
        a.erase(key);
        a.emplace(key, val);
    }
    std::map<std::string, int32_t> result;
    ErrCode errCode = TestType_Map(a, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (OH_IPCParcel_WriteInt32(reply, static_cast<int32_t>(result.size())) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    for (const auto& entry : result) {
        auto key = entry.first;
        auto val = entry.second;
        if (OH_IPCParcel_WriteString(reply, key.c_str()) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
        if (OH_IPCParcel_WriteInt32(reply, val) != OH_IPC_SUCCESS) {
            return OH_IPC_PARCEL_WRITE_ERROR;
        }
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleTestType_Struct(const OHIPCParcel* data, OHIPCParcel* reply)
{
    OHOS::IPC::Point a;
    if (a.Unmarshalling(data) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t idxValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &idxValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t idx = idxValue;
    int32_t idyValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &idyValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t idy = idyValue;
    OHOS::IPC::Point result;
    ErrCode errCode = TestType_Struct(a, idx, idy, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (result.Marshalling(reply) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleRegisterCallback(const OHIPCParcel* data, OHIPCParcel* reply)
{
    OHIPCRemoteProxy* callbackProxy = OH_IPCParcel_ReadRemoteProxy(data);
    if (callbackProxy == nullptr) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    OHOS::IPC::TestEventCallbackProxy callback = OHOS::IPC::TestEventCallbackProxy(callbackProxy);
    ErrCode errCode = RegisterCallback(callback);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleGetPrimaryCalculator(const OHIPCParcel* data, OHIPCParcel* reply)
{
    int32_t userIdValue = 0;
    if (OH_IPCParcel_ReadInt32(data, &userIdValue) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }
    int32_t userId = userIdValue;
    OHOS::IPC::ICalculator* result = nullptr;
    ErrCode errCode = GetPrimaryCalculator(userId, result);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }

    if (result == nullptr) {
        return OH_IPC_CHECK_PARAM_ERROR;
    }
    ErrCode resultWriteStatus = result->WriteRemoteObject(reply);
    if (resultWriteStatus != OH_IPC_SUCCESS) {
        return resultWriteStatus;
    }

    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleGetTypeLibInfo(const OHIPCParcel* data, OHIPCParcel* reply)
{
    int32_t fd = 0;
    if (OH_IPCParcel_ReadFileDescriptor(data, &fd) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_READ_ERROR;
    }

    ErrCode errCode = GetTypeLibInfo(fd);
    if (OH_IPCParcel_WriteInt32(reply, errCode) != OH_IPC_SUCCESS) {
        return OH_IPC_PARCEL_WRITE_ERROR;
    }
    return OH_IPC_SUCCESS;
}

int32_t TestMainServiceStub::HandleGetVersion(const OHIPCParcel* data, OHIPCParcel* reply)
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

int32_t TestMainServiceStub::HandleGetTaiheVersion(const OHIPCParcel* data, OHIPCParcel* reply)
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

ErrCode TestMainServiceStub::GetTypeLibInfo(int32_t fd)
{
    if (typeLibInfo == nullptr || strlen(typeLibInfo) == 0) {
        close(fd);
        return OH_IPC_INNER_ERROR;
    }

    int32_t ret = write(fd, typeLibInfo, strlen(typeLibInfo));
    close(fd);

    return ret >= 0 ? OH_IPC_SUCCESS : OH_IPC_INNER_ERROR;
}

ErrCode TestMainServiceStub::GetVersion(std::string& result)
{
    result = "1.0.0";
    return OH_IPC_SUCCESS;
}

ErrCode TestMainServiceStub::GetTaiheVersion(std::string& result)
{
    result = "1.0.0";
    return OH_IPC_SUCCESS;
}

} // namespace IPC
} // namespace OHOS
