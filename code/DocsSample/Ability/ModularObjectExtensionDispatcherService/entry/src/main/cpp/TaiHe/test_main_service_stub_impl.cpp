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

#include "test_main_service_stub_impl.h"
#include "calculator_stub_impl.h"
#include <cstdint>
namespace OHOS {
namespace IPC {
ErrCode TestMainServiceStubImpl::Add(int32_t a, int32_t b, int32_t &result)
{
    result = a + b;
    return 0;
}

ErrCode TestMainServiceStubImpl::TestType_Array(const std::array<std::array<int32_t, 5>, 5> &matrix,
    std::array<std::array<int32_t, 5>, 5> &result)
{
    uint32_t arrSize = 5;
    for (int32_t i = 0; i < arrSize; i++) {
        for (int32_t j = 0; j < arrSize; j++) {
            result[i][j] = matrix[i][j] + 1;
        }
    }
    return 0;
}

ErrCode TestMainServiceStubImpl::TestType_Vector(const std::vector<int32_t> &a, std::vector<int32_t> &result)
{
    size_t size = 5;
    result.resize(size);
    for (int32_t i = 0; i < a.size(); i++) {
        result[i] = a[i] + 1;
    }
    return 0;
}

ErrCode TestMainServiceStubImpl::TestType_Set(const std::set<int32_t> &a, std::set<int32_t> &result)
{
    result = a;
    int32_t testNum = 1000;
    result.insert(testNum);
    return 0;
}

ErrCode TestMainServiceStubImpl::TestType_Map(const std::map<std::string, int32_t> &a,
    std::map<std::string, int32_t> &result)
{
    result = a;
    int32_t testNum = 100;
    result.emplace("china", testNum);
    return 0;
}

ErrCode TestMainServiceStubImpl::TestType_Struct(OHOS::IPC::Point &a, int32_t idx, int32_t idy, OHOS::IPC::Point &b)
{
    b.x = a.x + idx;
    b.y = a.y + idy;
    return 0;
}

ErrCode TestMainServiceStubImpl::RegisterCallback(OHOS::IPC::ITestEventCallback &callback)
{
    callback.OnConnected(1, "connected");
    callback.OnDisconnected("dis connected");
    return 0;
}

ErrCode TestMainServiceStubImpl::GetPrimaryCalculator(int32_t userId, OHOS::IPC::ICalculator *&result)
{
    result = new CalculatorStubImpl(context_);
    return 0;
}
} // namespace IPC
} // namespace OHOS
