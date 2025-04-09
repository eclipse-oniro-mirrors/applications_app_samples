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

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"  // 全局tag宏，标识模块日志tag
//  Array Operations
static void ProcessArray(ani_env *env, ani_object object, ani_array_double doubleArray)
{
    ani_size length;
    if (ANI_OK != env->Array_GetLength(doubleArray, &length)) {
        std::cerr << "Array_GetLength FAILED" << std::endl;
        return;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Array_GetLength result: %{public}d", length);
    ani_array_double doubleValue;
    if (ANI_OK != env->Array_New_Double(length, &doubleValue)) {
        std::cerr << "Array_New_Double FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Double result: %{public}f", doubleValue[i]);
    }
    
    ani_array_int intValue;
    if (ANI_OK != env->Array_New_Int(length, &intValue)) {
        std::cerr << "Array_New_Int FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Int result: %{public}d", intValue[i]);
    }
    
    ani_array_short shortValue;
    if (ANI_OK != env->Array_New_Short(length, &shortValue)) {
        std::cerr << "Array_New_Short FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Short result: %{public}d", shortValue[i]);
    }
    
    ani_array_char charValue;
    if (ANI_OK != env->Array_New_Char(length, &charValue)) {
        std::cerr << "Array_New_Char FAILED" << std::endl;
        return;
    }
    std::cout << "Array int Content:" << doubleArray << std::endl;
}

static void ProcessArray2(ani_env *env, ani_object object, ani_array_double doubleArray)
{
    ani_size length;
    if (ANI_OK != env->Array_GetLength(doubleArray, &length)) {
        std::cerr << "Array_GetLength FAILED" << std::endl;
        return;
    }
    ani_array_char charValue;
    if (ANI_OK != env->Array_New_Char(length, &charValue)) {
        std::cerr << "Array_New_Char FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Char result: %{public}c", charValue[i]);
    }

    ani_array_boolean boolValue;
    if (ANI_OK != env->Array_New_Boolean(length, &boolValue)) {
        std::cerr << "Array_New_Boolean FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Boolean result: %{public}d", boolValue[i]);
    }

    ani_array_long longValue;
    if (ANI_OK != env->Array_New_Long(length, &longValue)) {
        std::cerr << "Array_New_Long FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Long result: %{public}ld", longValue[i]);
    }

    ani_array_float floatValue;
    if (ANI_OK != env->Array_New_Float(length, &floatValue)) {
        std::cerr << "Array_New_Float FAILED" << std::endl;
        return;
    }
    for (ani_int i = 0; i < length; ++i) {
        OH_LOG_ERROR(LOG_APP, "testTag Array_New_Float result: %{public}f", floatValue[i]);
    }
    std::cout << "Array int Content:" << doubleArray << std::endl;
}