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

#ifndef MODULAROBJECTEXTENSIONSERVICE_CALCULATOR_STUB_IMPL_H
#define MODULAROBJECTEXTENSIONSERVICE_CALCULATOR_STUB_IMPL_H

#include "calculator_stub.h"
namespace OHOS {
namespace IPC{
class CalculatorStubImpl : public CalculatorStub {
public:
    CalculatorStubImpl(OH_AbilityRuntime_ModObjExtensionContextHandle context): CalculatorStub(context) {}
    ErrCode multiply(int32_t a, int32_t b, int32_t& result) override;
};

}
}

#endif //MODULAROBJECTEXTENSIONSERVICE_CALCULATOR_STUB_IMPL_H
