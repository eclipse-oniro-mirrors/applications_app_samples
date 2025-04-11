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
#include "hilog/log.h"
#include <iostream>

#define CHAR_A 'A'
#define CHAR_B 'B'
#define CHAR_G 'G'
#define CHAR_U 'U'
#define CHAR_Z 'Z'
#define NUM15 15
#define NUM2 2
#define NUM120 120
#define NUM255 255
#define NUM65538 65538
#define NUM12345678910 12345678910
#define NUM3_12 3.12
#define NUM3_14 3.14
#define NUM4_56 4.56
#define NUM15_23 15.23
#define NUM15_2365941 15.2365941
#define NUM12365478941 12365478941

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"  // 全局tag宏，标识模块日志tag

//  Accessing Fields of Objects  Class Operations
static void UpdateFields(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_field boolField;
    if (ANI_OK != env->Class_FindField(cls, "boolField", &boolField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field doubleField;
    if (ANI_OK != env->Class_FindField(cls, "doubleField", &doubleField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field floatField;
    if (ANI_OK != env->Class_FindField(cls, "floatField", &floatField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field charField;
    if (ANI_OK != env->Class_FindField(cls, "charField", &charField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_boolean boolValue = ANI_TRUE;
    if (ANI_OK != env->Object_SetField_Boolean(obj, boolField, boolValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_double doubleValue = NUM3_14;
    if (ANI_OK != env->Object_SetField_Double(obj, doubleField, doubleValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_float floatValue = NUM4_56;
    if (ANI_OK != env->Object_SetField_Float(obj, floatField, floatValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_char charValue = CHAR_Z;
    if (ANI_OK != env->Object_SetField_Char(obj, charField, charValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    return;
}

static void UpdateFields2(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_field intField;
    if (ANI_OK != env->Class_FindField(cls, "intField", &intField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field shortField;
    if (ANI_OK != env->Class_FindField(cls, "shortField", &shortField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field longField;
    if (ANI_OK != env->Class_FindField(cls, "longField", &longField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_field byteField;
    if (ANI_OK != env->Class_FindField(cls, "byteField", &byteField)) {
        std::cerr << "Get Field Fail" << className << "'" << std::endl;
        return;
    }
    ani_int intValue = NUM15;
    if (ANI_OK != env->Object_SetField_Int(obj, intField, intValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_short shortValue = NUM255;
    if (ANI_OK != env->Object_SetField_Short(obj, shortField, shortValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_long longValue = NUM12345678910;
    if (ANI_OK != env->Object_SetField_Long(obj, longField, longValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_byte byteValue = CHAR_A;
    if (ANI_OK != env->Object_SetField_Byte(obj, byteField, byteValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
}

static ani_int UpdateIntFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_int intField;
    if (ANI_OK != env->Object_GetFieldByName_Int(obj, "getIntField", &intField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0;
    }
    return intField;
}

static ani_double UpdateDoubleFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_double doubleField;
    if (ANI_OK != env->Object_GetFieldByName_Double(obj, "getDoubleField", &doubleField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0.0;
    }
    return doubleField;
}

static ani_boolean UpdateBoolFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_boolean boolField;
    if (ANI_OK != env->Object_GetFieldByName_Boolean(obj, "getBoolField", &boolField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return false;
    }
    return boolField;
}

static ani_short UpdateShortFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_short shortField;
    if (ANI_OK != env->Object_GetFieldByName_Short(obj, "getShortField", &shortField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0;
    }
    return shortField;
}

static ani_long UpdateLongFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_long longField;
    if (ANI_OK != env->Object_GetFieldByName_Long(obj, "getLongField", &longField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0;
    }
    return longField;
}

static ani_char UpdateCharFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_char charField;
    if (ANI_OK != env->Object_GetFieldByName_Char(obj, "getCharField", &charField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0;
    }
    return charField;
}

static ani_float UpdateFloatFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_float floatField;
    if (ANI_OK != env->Object_GetFieldByName_Float(obj, "getFloatField", &floatField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0.0;
    }
    return floatField;
}

static ani_byte UpdateByteFields([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_byte byteField;
    if (ANI_OK != env->Object_GetFieldByName_Byte(obj, "getByteField", &byteField)) {
        std::cerr << "Get Field Fail" << std::endl;
        return 0x0;
    }
    return byteField;
}

static void UpdateByNameFields(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_byte byteValue = CHAR_B;
    if (ANI_OK != env->Object_SetFieldByName_Byte(obj, "fieldByName_Byte", byteValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_double doubleValue = NUM4_56;
    if (ANI_OK != env->Object_SetFieldByName_Double(obj, "fieldByName_Double", doubleValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_short shortValue = NUM255;
    if (ANI_OK != env->Object_SetFieldByName_Short(obj, "fieldByName_Short", shortValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_boolean boolValue = true;
    if (ANI_OK != env->Object_SetFieldByName_Boolean(obj, "fieldByName_Bool", boolValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    return;
}

static void UpdateByNameFields2(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_float floatValue = NUM15_23;
    if (ANI_OK != env->Object_SetFieldByName_Float(obj, "fieldByName_Float", floatValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_long longValue = NUM12365478941;
    if (ANI_OK != env->Object_SetFieldByName_Long(obj, "fieldByName_Long", longValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_char charValue = CHAR_G;
    if (ANI_OK != env->Object_SetFieldByName_Char(obj, "fieldByName_Char", charValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    ani_int intValue = NUM120;
    if (ANI_OK != env->Object_SetFieldByName_Int(obj, "fieldByName_Int", intValue)) {
        std::cerr << "Set Field Fail" << className << "'" << std::endl;
    }
    return;
}

//  Accessing Static Fields  Class Operations
static void UpdateStaticFields(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_static_field intField;
    if (ANI_OK != env->Class_FindStaticField(cls, "intStaticField", &intField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field shortField;
    if (ANI_OK != env->Class_FindStaticField(cls, "shortStaticField", &shortField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field longField;
    if (ANI_OK != env->Class_FindStaticField(cls, "longStaticField", &longField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field charField;
    if (ANI_OK != env->Class_FindStaticField(cls, "charStaticField", &charField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_int intValue = NUM65538;
    if (ANI_OK != env->Class_SetStaticField_Int(cls, intField, intValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_short shortValue = NUM2;
    if (ANI_OK != env->Class_SetStaticField_Short(cls, shortField, shortValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_long longValue = NUM12345678910;
    if (ANI_OK != env->Class_SetStaticField_Long(cls, longField, longValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_char charValue = CHAR_U;
    if (ANI_OK != env->Class_SetStaticField_Char(cls, charField, charValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    return;
}

static void UpdateStaticFields2(ani_env *env, ani_object obj)
{
    std::cout << "Update Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_static_field doubleField;
    if (ANI_OK != env->Class_FindStaticField(cls, "doubleStaticField", &doubleField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field floatField;
    if (ANI_OK != env->Class_FindStaticField(cls, "floatStaticField", &floatField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field boolField;
    if (ANI_OK != env->Class_FindStaticField(cls, "boolStaticField", &boolField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field byteField;
    if (ANI_OK != env->Class_FindStaticField(cls, "byteStaticField", &byteField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_double doubleValue = NUM15_2365941;
    if (ANI_OK != env->Class_SetStaticField_Double(cls, doubleField, doubleValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_float floatValue = NUM3_12;
    if (ANI_OK != env->Class_SetStaticField_Float(cls, floatField, floatValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_boolean boolValue = true;
    if (ANI_OK != env->Class_SetStaticField_Boolean(cls, boolField, boolValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    ani_byte byteValue = CHAR_U;
    if (ANI_OK != env->Class_SetStaticField_Byte(cls, byteField, byteValue)) {
        std::cerr << "Set StaticField Fail" << className << "'" << std::endl;
    }
    return;
}

static void GetStaticFields(ani_env *env, ani_object obj)
{
    std::cout << "Get Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_static_field intField;
    if (ANI_OK != env->Class_FindStaticField(cls, "intStaticField", &intField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field shortField;
    if (ANI_OK != env->Class_FindStaticField(cls, "shortStaticField", &shortField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field longField;
    if (ANI_OK != env->Class_FindStaticField(cls, "longStaticField", &longField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field charField;
    if (ANI_OK != env->Class_FindStaticField(cls, "charStaticField", &charField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_int intValue;
    if (ANI_OK != env->Class_GetStaticField_Int(cls, intField, &intValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Int result: %{public}d", intValue);
    ani_short shortValue;
    if (ANI_OK != env->Class_GetStaticField_Short(cls, shortField, &shortValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Short result: %{public}h", shortValue);
    ani_long longValue;
    if (ANI_OK != env->Class_GetStaticField_Long(cls, longField, &longValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Long result: %{public}l", longValue);
    ani_char charValue;
    if (ANI_OK != env->Class_GetStaticField_Char(cls, charField, &charValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Char result: %{public}c", charValue);
    return;
}

static void GetStaticFields2(ani_env *env, ani_object obj)
{
    std::cout << "Get Field in native" << std::endl;
    const char *className = "Lentry/src/main/ets/entryability/EntryAbility/Calc;";
    ani_class cls;
    if (ANI_OK != env->FindClass(className, &cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_static_field byteField;
    if (ANI_OK != env->Class_FindStaticField(cls, "byteStaticField", &byteField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field doubleField;
    if (ANI_OK != env->Class_FindStaticField(cls, "doubleStaticField", &doubleField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field floatField;
    if (ANI_OK != env->Class_FindStaticField(cls, "floatStaticField", &floatField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_static_field boolField;
    if (ANI_OK != env->Class_FindStaticField(cls, "boolStaticField", &boolField)) {
        std::cerr << "Get StaticField Fail" << className << "'" << std::endl;
        return;
    }
    ani_byte byteValue;
    if (ANI_OK != env->Class_GetStaticField_Byte(cls, byteField, &byteValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Byte result: %{public}c", byteValue);
    ani_double doubleValue;
    if (ANI_OK != env->Class_GetStaticField_Double(cls, doubleField, &doubleValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Double result: %{public}lf", doubleValue);
    ani_boolean boolValue;
    if (ANI_OK != env->Class_GetStaticField_Boolean(cls, boolField, &boolValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Boolean result: %{public}d", static_cast<ani_int>(boolValue));
    ani_float floatValue;
    if (ANI_OK != env->Class_GetStaticField_Float(cls, floatField, &floatValue)) {
        std::cerr << "Set StaticField Fail " << className << "'" << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Class_GetStaticField_Boolean result: %{public}f", floatValue);
    return;
}