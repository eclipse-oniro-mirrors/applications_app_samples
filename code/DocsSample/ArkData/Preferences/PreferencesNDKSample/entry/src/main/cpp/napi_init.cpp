/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
// [Start preferences_include]
#include <database/preferences/oh_preferences.h>
#include <database/preferences/oh_preferences_err_code.h>
#include <database/preferences/oh_preferences_option.h>
#include <database/preferences/oh_preferences_value.h>
// [End preferences_include]

// [Start DataChangeObserverCallback]
// 数据变更回调函数
void DataChangeObserverCallback(void *context, const OH_PreferencesPair *pairs, uint32_t count)
{
    for (uint32_t i = 0; i < count; i++) {
        // 获取索引i对应的PreferenceValue
        const OH_PreferencesValue *pValue = OH_PreferencesPair_GetPreferencesValue(pairs, i);
        // 获取PreferencesValue的数据类型
        Preference_ValueType type = OH_PreferencesValue_GetValueType(pValue);
        int ret = PREFERENCES_OK;
        if (type == PREFERENCE_TYPE_INT) {
            int intValue = 0;
            ret = OH_PreferencesValue_GetInt(pValue, &intValue);
            if (ret == PREFERENCES_OK) {
                // 业务逻辑
            }
        } else if (type == PREFERENCE_TYPE_BOOL) {
            bool boolValue = true;
            ret = OH_PreferencesValue_GetBool(pValue, &boolValue);
            if (ret == PREFERENCES_OK) {
                // 业务逻辑
            }
        } else if (type == PREFERENCE_TYPE_STRING) {
            char *stringValue = nullptr;
            uint32_t valueLen = 0;
            ret = OH_PreferencesValue_GetString(pValue, &stringValue, &valueLen);
            if (ret == PREFERENCES_OK) {
                // 业务逻辑
                OH_Preferences_FreeString(stringValue);
            }
        } else {
            // 无效类型
        }
    }
}
// [End DataChangeObserverCallback]

// [Start PreferencesCrudTest]
void PreferencesCrudTest(OH_Preferences *preference)
{
    // 1. 对key_int、key_bool和key_string注册数据变更订阅。
    const char *keys[] = {"key_int", "key_bool", "key_string"};
    int ret = OH_Preferences_RegisterDataObserver(preference, nullptr, DataChangeObserverCallback, keys, 3);
    if (ret != PREFERENCES_OK) {
        (void)OH_Preferences_Close(preference);
        // 错误处理
    }
    
    // 2. 设置Preferences实例中的KV数据。
    ret = OH_Preferences_SetInt(preference, keys[0], 0);
    if (ret != PREFERENCES_OK) {
        (void)OH_Preferences_Close(preference);
        // 错误处理
    }
    ret = OH_Preferences_SetBool(preference, keys[1], true);
    if (ret != PREFERENCES_OK) {
        (void)OH_Preferences_Close(preference);
        // 错误处理
    }
    int32_t stringIndex = 2;
    ret = OH_Preferences_SetString(preference, keys[stringIndex], "string value");
    if (ret != PREFERENCES_OK) {
        (void)OH_Preferences_Close(preference);
        // 错误处理
    }
    
    // 3. 获取Preferences实例中的KV数据。
    int intValue = 0;
    ret = OH_Preferences_GetInt(preference, keys[0], &intValue);
    if (ret == PREFERENCES_OK) {
        // 业务逻辑
    }
    
    bool boolValue = false;
    ret = OH_Preferences_GetBool(preference, keys[1], &boolValue);
    if (ret == PREFERENCES_OK) {
        // 业务逻辑
    }
    
    char *stringValue = nullptr;
    uint32_t valueLen = 0;
    ret = OH_Preferences_GetString(preference, keys[stringIndex], &stringValue, &valueLen);
    if (ret == PREFERENCES_OK) {
        // 业务逻辑
        // 使用完OH_Preferences_GetString接口后，需要对字符串进行释放。
        OH_Preferences_FreeString(stringValue);
        stringValue = nullptr;
    }
}
// [End PreferencesCrudTest]

// [Start PreferencesOpenTest]
void PreferencesOpenTest()
{
    OH_LOG_ERROR(LOG_APP, "PreferencesOpenCrudTest start.");
    // 1. 创建Preferences配置选项。
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    if (option == nullptr) {
        // 错误处理
    }
    // 设置Preferences配置选项的文件名称。
    int ret = OH_PreferencesOption_SetFileName(option, "testdb");
    if (ret != PREFERENCES_OK) {
        (void)OH_PreferencesOption_Destroy(option);
        // 错误处理
    }
    // 设置Preferences配置选项的应用组ID。
    ret = OH_PreferencesOption_SetDataGroupId(option, "");
    if (ret != PREFERENCES_OK) {
        (void)OH_PreferencesOption_Destroy(option);
        // 错误处理
    }
    // 设置Preferences配置选项的包名称。
    ret = OH_PreferencesOption_SetBundleName(option, "com.example");
    if (ret != PREFERENCES_OK) {
        (void)OH_PreferencesOption_Destroy(option);
        // 错误处理
    }
    // 设置Preferences配置选项的存储模式，需要注意的是，设置之前需要调用OH_Preferences_IsStorageTypeSupported接口判断当前平台是否支持需要选择的模式。
    bool isGskvSupported = false;
    ret = OH_Preferences_IsStorageTypeSupported(Preferences_StorageType::PREFERENCES_STORAGE_GSKV, &isGskvSupported);
    if (ret != PREFERENCES_OK) {
        (void)OH_PreferencesOption_Destroy(option);
        // 错误处理
    }
    if (isGskvSupported) {
        ret = OH_PreferencesOption_SetStorageType(option, Preferences_StorageType::PREFERENCES_STORAGE_GSKV);
        if (ret != PREFERENCES_OK) {
            (void)OH_PreferencesOption_Destroy(option);
            // 错误处理
        }
    } else {
        ret = OH_PreferencesOption_SetStorageType(option, Preferences_StorageType::PREFERENCES_STORAGE_XML);
        if (ret != PREFERENCES_OK) {
            (void)OH_PreferencesOption_Destroy(option);
            // 错误处理
        }
    }
    // 2. 打开一个Preferences实例。
    int errCode = PREFERENCES_OK;
    OH_Preferences *preference = OH_Preferences_Open(option, &errCode);
    // option使用完毕后可直接释放，释放后需要将指针置空。
    (void)OH_PreferencesOption_Destroy(option);
    option = nullptr;
    if (preference == nullptr || errCode != PREFERENCES_OK) {
        // 错误处理
    }
    // 3. 使用preference进行增删改查。
    PreferencesCrudTest(preference);
    // 4. 使用完Preferences实例后需要关闭实例，关闭后需要将指针置空。
    (void)OH_Preferences_Close(preference);
    preference = nullptr;
    OH_LOG_ERROR(LOG_APP, "PreferencesOpenCrudTest end.");
}
// [End PreferencesOpenCrudTest]

static napi_value Add(napi_env env, napi_callback_info info)
{
    PreferencesOpenTest();
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);
    return sum;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
