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
#include "ani_error.cpp"
#include "ani_object.cpp"
#include "ani_references.cpp"
#include "ani_string.cpp"
#include "ani_versionInfo.cpp"
#include "ani_vminterface.cpp"
#include "ani_promise.cpp"
#include "ani_class_operation.cpp"
#include "ani_reflection.cpp"
#include <array>
#include <cstdint>
#include <iostream>
auto Methods()
{
    std::array method = {
        ani_native_function{"GetVersionInfo", ":I", reinterpret_cast<void *>(GetVersionInfo)},
        ani_native_function{"Global_Local_References", ":Z", reinterpret_cast<void *>(Global_Local_References)},
        ani_native_function{"Weak_Global_References", ":Z", reinterpret_cast<void *>(Weak_Global_References)},
        ani_native_function{"ProcessArray", "[D:Z", reinterpret_cast<void *>(ProcessArray)},
        ani_native_function{"ProcessArray2", "[D:Z", reinterpret_cast<void *>(ProcessArray2)},
        ani_native_function{"String_Operations", ":Lstd/core/String;", reinterpret_cast<void *>(String_Operations)},
        ani_native_function{"UpdateFields", ":V", reinterpret_cast<void *>(UpdateFields)},
        ani_native_function{"UpdateFields2", ":V", reinterpret_cast<void *>(UpdateFields2)},
        ani_native_function{"UpdateByNameFields", ":V", reinterpret_cast<void *>(UpdateByNameFields)},
        ani_native_function{"UpdateByNameFields2", ":V", reinterpret_cast<void *>(UpdateByNameFields2)},
        ani_native_function{"UpdateStaticFields", ":V", reinterpret_cast<void *>(UpdateStaticFields)},
        ani_native_function{"UpdateStaticFields2", ":V", reinterpret_cast<void *>(UpdateStaticFields2)},
        ani_native_function{"GetStaticFields", ":Z", reinterpret_cast<void *>(GetStaticFields)},
        ani_native_function{"GetStaticFields2", ":Z", reinterpret_cast<void *>(GetStaticFields2)},
        ani_native_function{"NativeVoidFunc", ":V", reinterpret_cast<void *>(NativeVoidFunc)},
        ani_native_function{"NativeBoolFunc", ":Z", reinterpret_cast<void *>(NativeBoolFunc)},
        ani_native_function{"NativeIntFunc", ":I", reinterpret_cast<void *>(NativeIntFunc)},
        ani_native_function{"NativeLongFunc", ":J", reinterpret_cast<void *>(NativeLongFunc)},
        ani_native_function{"NativeShortFunc", ":S", reinterpret_cast<void *>(NativeShortFunc)},
        ani_native_function{"NativeDoubleFunc", ":D", reinterpret_cast<void *>(NativeDoubleFunc)},
        ani_native_function{"NativeFloatFunc", ":F", reinterpret_cast<void *>(NativeFloatFunc)},
        ani_native_function{"NativeCharFunc", ":C", reinterpret_cast<void *>(NativeCharFunc)},
        ani_native_function{"NativeByteFunc", ":B", reinterpret_cast<void *>(NativeByteFunc)},

    };
    return method;
}

auto Methods2()
{
    std::array method = {
        ani_native_function{"NativeStaticFunc", ":V", reinterpret_cast<void *>(NativeStaticFunc)},
        ani_native_function{"NativeStaticFuncDouble", ":D", reinterpret_cast<void *>(NativeStaticFuncDouble)},
        ani_native_function{"NativeStaticFuncFloat", ":F", reinterpret_cast<void *>(NativeStaticFuncFloat)},
        ani_native_function{"NativeStaticFuncChar", ":C", reinterpret_cast<void *>(NativeStaticFuncChar)},
        ani_native_function{"NativeStaticFuncByte", ":B", reinterpret_cast<void *>(NativeStaticFuncByte)},
        ani_native_function{"NativeStaticFuncBoolean", ":Z", reinterpret_cast<void *>(NativeStaticFuncBoolean)},
        ani_native_function{"NativeStaticFuncInt", ":I", reinterpret_cast<void *>(NativeStaticFuncInt)},
        ani_native_function{"NativeStaticFuncShort", ":S", reinterpret_cast<void *>(NativeStaticFuncShort)},
        ani_native_function{"NativeStaticFuncLong", ":J", reinterpret_cast<void *>(NativeStaticFuncLong)},
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
        ani_native_function{"ThrowError", "Lescompat/Error;:Z", reinterpret_cast<void *>(ThrowError)},
        ani_native_function{"VMInterface", ":Z", reinterpret_cast<void *>(VMInterface)},
        ani_native_function{"createPerson", ":Lentry/src/main/ets/pages/Index/Calc;",
                            reinterpret_cast<void *>(CreatePerson)},
        ani_native_function{"thisIsPropertyGetter", ":I", reinterpret_cast<void *>(BindGet)},
        ani_native_function{"thisIsPropertySetter", "I:V", reinterpret_cast<void *>(BindSet)},
        ani_native_function{"execute", "Lentry/src/main/ets/pages/Index/Want;:I", reinterpret_cast<void *>(execute)},
        ani_native_function{"gettid", ":I", reinterpret_cast<void *>(myGettid)},

    };
    return method;
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return ANI_OUT_OF_REF;
    }
    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return ANI_INVALID_ARGS;
    }
    std::array methodTmp = Methods();
    std::array methodTmp2 = Methods2();
    std::array<ani_native_function, methodTmp.size() + methodTmp2.size()> methods;
    std::copy(methodTmp.begin(), methodTmp.end(), methods.begin());
    std::copy(methodTmp2.begin(), methodTmp2.end(), methods.begin() + methodTmp.size());
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return ANI_INVALID_TYPE;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "Lentry/src/main/ets/pages/Index/Calc;");
    *result = ANI_VERSION_1;
    return ANI_OK;
}