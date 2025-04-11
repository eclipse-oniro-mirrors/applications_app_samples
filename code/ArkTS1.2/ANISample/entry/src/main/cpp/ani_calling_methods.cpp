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
static void NativeVoidFunc(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedVoidFunc", ":V", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return;
    }
    std::cout << "Print in Native Func" << std::endl;
    if (ANI_OK != env->Object_CallMethod_Void(obj, managedMethod)) {
        std::cerr << "Object_CallMethod_Void Fail" << std::endl;
        return;
    }
}

static ani_boolean NativeBoolFunc(ani_env *env, ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return false;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedBoolFunc", ":Z", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return false;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_boolean boolValue;
    if (ANI_OK != env->Object_CallMethod_Boolean(obj, managedMethod, &boolValue)) {
        std::cerr << "Object_CallMethod_Boolean Fail" << std::endl;
        return false;
    }
    return boolValue;
}

static ani_int NativeIntFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedIntFunc", ":I", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_int intValue;
    if (ANI_OK != env->Object_CallMethod_Int(obj, managedMethod, &intValue)) {
        std::cerr << "Object_CallMethod_Int Fail" << std::endl;
        return 0;
    }
    return intValue;
}


static ani_short NativeShortFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedShortFunc", ":S", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_short shortValue;
    if (ANI_OK != env->Object_CallMethod_Short(obj, managedMethod, &shortValue)) {
        std::cerr << "Object_CallMethod_Short Fail" << std::endl;
        return 0;
    }
    return shortValue;
}

static ani_long NativeLongFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedLongFunc", ":J", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_long longValue;
    if (ANI_OK != env->Object_CallMethod_Long(obj, managedMethod, &longValue)) {
        std::cerr << "Object_CallMethod_Long Fail" << std::endl;
        return 0;
    }
    return longValue;
}

static ani_double NativeDoubleFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedDoubleFunc", ":D", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_double doubleValue;
    if (ANI_OK != env->Object_CallMethod_Double(obj, managedMethod, &doubleValue)) {
        std::cerr << "Object_CallMethod_Double Fail" << std::endl;
        return 0;
    }
    return doubleValue;
}

static ani_float NativeFloatFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0.0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedFloatFunc", ":F", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0.0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_float floatValue;
    if (ANI_OK != env->Object_CallMethod_Float(obj, managedMethod, &floatValue)) {
        std::cerr << "Object_CallMethod_Float Fail" << std::endl;
        return 0.0;
    }
    return floatValue;
}

static ani_char NativeCharFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedCharFunc", ":C", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_char charValue;
    if (ANI_OK != env->Object_CallMethod_Char(obj, managedMethod, &charValue)) {
        std::cerr << "Object_CallMethod_Char Fail" << std::endl;
        return 0;
    }
    return charValue;
}

static ani_byte NativeByteFunc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return 0;
    }
    ani_method managedMethod;
    if (ANI_OK != env->Class_FindMethod(cls, "ManagedByteFunc", ":B", &managedMethod)) {
        std::cerr << "Class_FindMethod Fail" << std::endl;
        return 0;
    }
    std::cout << "Print in Native Func" << std::endl;
    ani_byte byteValue;
    if (ANI_OK != env->Object_CallMethod_Byte(obj, managedMethod, &byteValue)) {
        std::cerr << "Object_CallMethod_Byte Fail" << std::endl;
        return 0;
    }
    return byteValue;
}

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
    static const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
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