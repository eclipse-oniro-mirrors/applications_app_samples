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
#include <iostream>


//  Calling Instance Methods
static void NativeByNameFunc(ani_env *env, ani_object obj)
{
    std::cout << "Print in Native Func" << std::endl;
    if (ANI_OK != env->Object_CallMethodByName_Void(obj, "ManagedByNameVoidFunc", ":V")) {
        std::cerr << "Object_CallMethodByName_Void Fail" << std::endl;
        return;
    }
}

static ani_double NativeByNameDoubleFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_double doubleValue;
    if (ANI_OK != env->Object_CallMethodByName_Double(obj, "ManagedByNameDoubleFunc", ":D", &doubleValue)) {
        std::cerr << "Object_CallMethodByName_Double Fail" << std::endl;
        return 0.0;
    }
    return doubleValue;
}

static ani_boolean NativeByNameBoolFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_boolean boolValue;
    if (ANI_OK != env->Object_CallMethodByName_Boolean(obj, "ManagedByNameBoolFunc", ":Z", &boolValue)) {
        std::cerr << "Object_CallMethodByName_Double Fail" << std::endl;
        return false;
    }
    return boolValue;
}

static ani_int NativeByNameIntFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_int intValue;
    if (ANI_OK != env->Object_CallMethodByName_Int(obj, "ManagedByNameIntFunc", ":I", &intValue)) {
        std::cerr << "Object_CallMethodByName_Int Fail" << std::endl;
        return false;
    }
    return intValue;
}

static ani_short NativeByNameShortFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_short shortValue;
    if (ANI_OK != env->Object_CallMethodByName_Short(obj, "ManagedByNameShortFunc", ":S", &shortValue)) {
        std::cerr << "Object_CallMethodByName_Short Fail" << std::endl;
        return 0;
    }
    return shortValue;
}

static ani_long NativeByNameLongFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_long longValue;
    if (ANI_OK != env->Object_CallMethodByName_Long(obj, "ManagedByNameLongFunc", ":J", &longValue)) {
        std::cerr << "Object_CallMethodByName_Long Fail" << std::endl;
        return 0;
    }
    return longValue;
}

static ani_char NativeByNameCharFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_char charValue;
    if (ANI_OK != env->Object_CallMethodByName_Char(obj, "ManagedByNameCharFunc", ":C", &charValue)) {
        std::cerr << "Object_CallMethodByName_Char Fail" << std::endl;
        return '0';
    }
    return charValue;
}

static ani_float NativeByNameFloatFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_float floatValue;
    if (ANI_OK != env->Object_CallMethodByName_Float(obj, "ManagedByNameFloatFunc", ":F", &floatValue)) {
        std::cerr << "Object_CallMethodByName_Float Fail" << std::endl;
        return 0.0;
    }
    return floatValue;
}

static ani_byte NativeByNameByteFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_byte byteValue;
    if (ANI_OK != env->Object_CallMethodByName_Byte(obj, "ManagedByNameByteFunc", ":B", &byteValue)) {
        std::cerr << "Object_CallMethodByName_Byte Fail" << std::endl;
        return 0x0;
    }
    return byteValue;
}
// todo Calling Static Methods
static void NativeStaticFunc(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFunc", ":V", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return;
    }
    std::cout << "Print in ManagedStaticFunc " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Void(cls, managedMethod, ":V")) {
        std::cerr << "Class_CallStaticMethod_Void Fail" << std::endl;
        return;
    }
}

static ani_double NativeStaticFuncDouble(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0.0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncDouble", ":D", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0.0;
    }
    ani_double doubleValue;
    std::cout << "Print in ManagedStaticFuncDouble " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Double(cls, managedMethod, &doubleValue)) {
        std::cerr << "Class_CallStaticMethod_Double Fail" << std::endl;
        return 0.0;
    }
    return doubleValue;
}

static ani_float NativeStaticFuncFloat(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0.0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncFloat", ":F", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0.0;
    }
    ani_float floatValue;
    std::cout << "Print in ManagedStaticFuncFloat " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Float(cls, managedMethod, &floatValue)) {
        std::cerr << "Class_CallStaticMethod_Float Fail" << std::endl;
        return 0.0;
    }
    return floatValue;
}

static ani_char NativeStaticFuncChar(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return ' ';
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncChar", ":C", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return ' ';
    }
    ani_char charValue;
    std::cout << "Print in ManagedStaticFuncChar " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Char(cls, managedMethod, &charValue)) {
        std::cerr << "Class_CallStaticMethod_Char Fail" << std::endl;
        return ' ';
    }
    return charValue;
}

static ani_byte NativeStaticFuncByte(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0x0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncByte", ":B", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0x0;
    }
    ani_byte byteValue;
    std::cout << "Print in ManagedStaticFuncByte " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Byte(cls, managedMethod, &byteValue)) {
        std::cerr << "Class_CallStaticMethod_Byte Fail" << std::endl;
        return 0x0;
    }
    return byteValue;
}

static ani_boolean NativeStaticFuncBoolean(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return false;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncBoolean", ":Z", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return false;
    }
    ani_boolean boolValue;
    std::cout << "Print in ManagedStaticFuncBoolean " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Boolean(cls, managedMethod, &boolValue)) {
        std::cerr << "Class_CallStaticMethod_Boolean Fail" << std::endl;
        return false;
    }
    return boolValue;
}

static ani_int NativeStaticFuncInt(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncInt", ":I", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0;
    }
    ani_int intValue;
    std::cout << "Print in ManagedStaticFuncInt " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Int(cls, managedMethod, &intValue)) {
        std::cerr << "Class_CallStaticMethod_Double Fail" << std::endl;
        return 0;
    }
    return intValue;
}

static ani_short NativeStaticFuncShort(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncShort", ":S", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0;
    }
    ani_short shortValue;
    std::cout << "Print in ManagedStaticFuncShort " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Short(cls, managedMethod, &shortValue)) {
        std::cerr << "Class_CallStaticMethod_Short Fail" << std::endl;
        return 0;
    }
    return shortValue;
}

static ani_long NativeStaticFuncLong(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_static_method managedMethod;
    if (ANI_OK != env->Class_FindStaticMethod(cls, "ManagedStaticFuncLong", ":J", &managedMethod)) {
        std::cerr << "Class_FindStaticMethod Fail" << std::endl;
        return 0;
    }
    ani_long longValue;
    std::cout << "Print in ManagedStaticFuncLong " << std::endl;
    if (ANI_OK != env->Class_CallStaticMethod_Long(cls, managedMethod, &longValue)) {
        std::cerr << "Class_CallStaticMethod_Long Fail" << std::endl;
        return 0;
    }
    return longValue;
}