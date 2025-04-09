/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include "ani/ani.h"
#include "ani_accessing_fields.cpp"
#include "ani_array.cpp"
#include "ani_calling_methods.cpp"
#include "ani_object.cpp"
#include "ani_references.cpp"
#include "ani_string.cpp"
#include "ani_versionInfo.cpp"
#include <array>
#include <cstdint>
#include <iostream>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"  // 全局tag宏，标识模块日志tag

auto Methods()
{
    std::array method = {
        ani_native_function{"UpdateFields", ":V", reinterpret_cast<void *>(UpdateFields)},
        ani_native_function{"UpdateFields2", ":V", reinterpret_cast<void *>(UpdateFields2)},
        ani_native_function{"UpdateIntFields", ":I", reinterpret_cast<void *>(UpdateIntFields)},
        ani_native_function{"UpdateDoubleFields", ":D", reinterpret_cast<void *>(UpdateDoubleFields)},
        ani_native_function{"UpdateBoolFields", ":Z", reinterpret_cast<void *>(UpdateBoolFields)},
        ani_native_function{"UpdateShortFields", ":S", reinterpret_cast<void *>(UpdateShortFields)},
        ani_native_function{"UpdateLongFields", ":J", reinterpret_cast<void *>(UpdateLongFields)},
        ani_native_function{"UpdateCharFields", ":C", reinterpret_cast<void *>(UpdateCharFields)},
        ani_native_function{"UpdateFloatFields", ":F", reinterpret_cast<void *>(UpdateFloatFields)},
        ani_native_function{"UpdateByteFields", ":B", reinterpret_cast<void *>(UpdateByteFields)},
        ani_native_function{"UpdateByNameFields", ":V", reinterpret_cast<void *>(UpdateByNameFields)},
        ani_native_function{"UpdateByNameFields2", ":V", reinterpret_cast<void *>(UpdateByNameFields2)},
        ani_native_function{"UpdateStaticFields", ":V", reinterpret_cast<void *>(UpdateStaticFields)},
        ani_native_function{"UpdateStaticFields2", ":V", reinterpret_cast<void *>(UpdateStaticFields2)},
        ani_native_function{"ProcessArray", "[D:V", reinterpret_cast<void *>(ProcessArray)},
        ani_native_function{"ProcessArray2", "[D:V", reinterpret_cast<void *>(ProcessArray2)},
        ani_native_function{"NativeVoidFunc", ":V", reinterpret_cast<void *>(NativeVoidFunc)},
        ani_native_function{"NativeBoolFunc", ":Z", reinterpret_cast<void *>(NativeBoolFunc)},
        ani_native_function{"NativeIntFunc", ":I", reinterpret_cast<void *>(NativeIntFunc)},
        ani_native_function{"NativeLongFunc", ":J", reinterpret_cast<void *>(NativeLongFunc)},
        ani_native_function{"NativeDoubleFunc", ":D", reinterpret_cast<void *>(NativeDoubleFunc)},
        ani_native_function{"NativeFloatFunc", ":F", reinterpret_cast<void *>(NativeFloatFunc)},
        ani_native_function{"NativeCharFunc", ":C", reinterpret_cast<void *>(NativeCharFunc)},
        ani_native_function{"NativeByteFunc", ":B", reinterpret_cast<void *>(NativeByteFunc)},
        ani_native_function{"NativeStaticFunc", ":V", reinterpret_cast<void *>(NativeStaticFunc)},
        ani_native_function{"GetVersionInfo", ":I", reinterpret_cast<void *>(GetVersionInfo)},
        ani_native_function{"Global_Local_References", ":V", reinterpret_cast<void *>(Global_Local_References)},
        ani_native_function{"Weak_Global_References", ":V", reinterpret_cast<void *>(Weak_Global_References)},
        ani_native_function{"String_Operations", ":Lstd/core/String;", reinterpret_cast<void *>(String_Operations)},
        ani_native_function{"NativeByNameFunc", ":V", reinterpret_cast<void *>(NativeByNameFunc)},
        ani_native_function{"NativeByNameDoubleFunc", ":D", reinterpret_cast<void *>(NativeByNameDoubleFunc)},
        ani_native_function{"NativeByNameBoolFunc", ":Z", reinterpret_cast<void *>(NativeByNameBoolFunc)},
        ani_native_function{"NativeByNameIntFunc", ":I", reinterpret_cast<void *>(NativeByNameIntFunc)},
        ani_native_function{"NativeByNameShortFunc", ":S", reinterpret_cast<void *>(NativeByNameShortFunc)},
        ani_native_function{"NativeByNameLongFunc", ":J", reinterpret_cast<void *>(NativeByNameLongFunc)},
        ani_native_function{"NativeByNameCharFunc", ":C", reinterpret_cast<void *>(NativeByNameCharFunc)},
        ani_native_function{"NativeByNameFloatFunc", ":F", reinterpret_cast<void *>(NativeByNameFloatFunc)},
        ani_native_function{"NativeByNameByteFunc", ":B", reinterpret_cast<void *>(NativeByNameByteFunc)},
        ani_native_function{"HandleDoubleData", "D:D", reinterpret_cast<void *>(HandleDoubleData)},
    };
    return method;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return ANI_OUT_OF_REF;
    }
    OH_LOG_ERROR(LOG_APP, "testTag get vm success start");
    if (ANI_OK != env->GetVM(&vm)) {
        std::cerr << "GetVM Fail" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag get vm success end");
    static const char *clsName = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return ANI_INVALID_ARGS;
    }
    std::array method = Methods();
    if (ANI_OK != env->Class_BindNativeMethods(cls, method.data(), method.size())) {
        return ANI_INVALID_TYPE;
    };
    *result = ANI_VERSION_1;
    return ANI_OK;
}