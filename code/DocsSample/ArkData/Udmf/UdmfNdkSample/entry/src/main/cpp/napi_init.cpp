/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start udmf_sample_head_file]
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <database/udmf/utd.h>
#include <database/udmf/uds.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/udmf_err_code.h>
#include <hilog/log.h>

#undef LOG_TAG
#define LOG_TAG "MY_LOG"
// [End udmf_sample_head_file]

// [Start udmf_sample_get_typeId]
int32_t GetTypeId()
{
    // 1. 通过文件后缀名获取纯文本类型的UTD的typeId
    unsigned int typeIds1Count = 0;
    const char** typeIds1 = OH_Utd_GetTypesByFilenameExtension(".txt", &typeIds1Count);
    OH_LOG_INFO(LOG_APP, "the count of typeIds1 is %{public}u", typeIds1Count);
    // 2. 通过MIME类型获取typeId
    unsigned int typeIds2Count = 0;
    const char** typeIds2 = OH_Utd_GetTypesByMimeType("text/plain", &typeIds2Count);
    OH_LOG_INFO(LOG_APP, "the count of typeIds2 is %{public}u", typeIds2Count);
    // 3. 使用以上两个步骤获取到的typeId创建UTD实例对象。
    OH_Utd* utd1 = OH_Utd_Create(typeIds1[0]);
    OH_Utd* utd2 = OH_Utd_Create(typeIds2[0]);
    // 4. 比较两种方式获取到的typeId对应的UTD是否相同
    bool isEquals = OH_Utd_Equals(utd1, utd2);
    if (isEquals) {
        OH_LOG_INFO(LOG_APP, "utd1 == utd2");
    } else {
        OH_LOG_ERROR(LOG_APP, "utd1 != utd2");
    }
    // 5. 销毁OH_Utd_GetTypesByFilenameExtension与OH_Utd_GetFilenameExtensions函数获取到的指针，同时销毁UTD指针
    OH_Utd_DestroyStringList(typeIds1, typeIds1Count);
    OH_Utd_DestroyStringList(typeIds2, typeIds2Count);
    OH_Utd_Destroy(utd1);
    OH_Utd_Destroy(utd2);
    return Udmf_ErrCode::UDMF_E_OK;
}
// [End udmf_sample_get_typeId]

// [Start udmf_sample_send_unifieddata]
int32_t SendUnifiedData()
{
    // 1. 创建超链接hyperlink数据的UDS数据结构。
    OH_UdsHyperlink* hyperlink = OH_UdsHyperlink_Create();
    // 2. 设置hyperlink中的URL和描述信息。
    if (OH_UdsHyperlink_SetUrl(hyperlink, "www.demo.com") != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Hyperlink set url error!");
    }
    if (OH_UdsHyperlink_SetDescription(hyperlink, "This is the description.") != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Hyperlink set description error!");
    }
    // 3. 创建OH_UdmfRecord对象，并向OH_UdmfRecord中添加超链接类型数据。
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    if (OH_UdmfRecord_AddHyperlink(record, hyperlink) != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Add hyperlink to record error!");
    }
    // 4. 创建OH_UdmfData对象，并向OH_UdmfData中添加OH_UdmfRecord。
    OH_UdmfData* data = OH_UdmfData_Create();
    if (OH_UdmfData_AddRecord(data, record) != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Add record to data error!");
    }
    // 5. 构建数据，将数据写入数据库中，得到返回的key值。
    char key[UDMF_KEY_BUFFER_LEN] = {0};
    if (OH_Udmf_SetUnifiedData(Udmf_Intention::UDMF_INTENTION_DRAG, data, key,
        sizeof(key)) != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Set data error!");
    }
    OH_LOG_INFO(LOG_APP, "key = %{public}s", key);
    // 6. 使用完成后销毁指针。
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return Udmf_ErrCode::UDMF_E_OK;
}
// [End udmf_sample_send_unifieddata]

// [Start udmf_sample_get_unifieddata]
static void ProcessHyperlinkFromRecord(OH_UdmfRecord* record, OH_UdsHyperlink* hyperlink)
{
    unsigned int recordTypeIdCount = 0;
    char** typeIdsFromRecord = OH_UdmfRecord_GetTypes(record, &recordTypeIdCount);
    for (unsigned int j = 0; j < recordTypeIdCount; j++) {
        if (strcmp(typeIdsFromRecord[j], UDMF_META_HYPERLINK) == 0) {
            if (OH_UdmfRecord_GetHyperlink(record, hyperlink) != Udmf_ErrCode::UDMF_E_OK) {
                OH_LOG_ERROR(LOG_APP, "Fail get hyperlink from record!");
            }
            break;
        }
    }
}

int32_t GetUnifiedData()
{
    // 1. 创建统一数据OH_UdmfData。
    OH_UdmfData* readData = OH_UdmfData_Create();
    // 此处key为示例，不可直接使用，其值应与OH_Udmf_SetUnifiedData接口中获取到的key值保持一致。
    char key[] = {"udmf://Drag/com.ohos.test/0123456789"};
    // 2. 通过key值从数据库中获取到数据。
    if (OH_Udmf_GetUnifiedData(key, Udmf_Intention::UDMF_INTENTION_DRAG, readData) != Udmf_ErrCode::UDMF_E_OK) {
        OH_LOG_ERROR(LOG_APP, "Failed to get data.");
        OH_UdmfData_Destroy(readData);
        return Udmf_ErrCode::UDMF_ERR;
    }
    // 3. 判断OH_UdmfData是否有对应的类型。
    if (!OH_UdmfData_HasType(readData, UDMF_META_HYPERLINK)) {
        OH_LOG_ERROR(LOG_APP, "There is no hyperlink type in data.");
        OH_UdmfData_Destroy(readData);
        return Udmf_ErrCode::UDMF_ERR;
    }
    // 4. 获取数据记录和hyperlink数据。
    unsigned int recordsCount = 0;
    OH_UdmfRecord** records = OH_UdmfData_GetRecords(readData, &recordsCount);
    OH_LOG_INFO(LOG_APP, "the count of records count is %{public}u", recordsCount);
    // 创建hyperlink的UDS，用来承载record中读取出来的hyperlink数据。
    OH_UdsHyperlink* hyperlink = OH_UdsHyperlink_Create();
    // 获取records中的元素。
    for (unsigned int i = 0; i < recordsCount; i++) {
        ProcessHyperlinkFromRecord(records[i], hyperlink);
    }
    // 5. 读取OH_UdsHyperlink中的各项信息。
    OH_LOG_INFO(LOG_APP, "The hyperlink type id is : %{public}s", OH_UdsHyperlink_GetType(hyperlink));
    OH_LOG_INFO(LOG_APP, "The hyperlink url is : %{public}s", OH_UdsHyperlink_GetUrl(hyperlink));
    OH_LOG_INFO(LOG_APP, "The hyperlink description is : %{public}s", OH_UdsHyperlink_GetDescription(hyperlink));
    // 6. 销毁指针。
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfData_Destroy(readData);
    return Udmf_ErrCode::UDMF_E_OK;
}
// [End udmf_sample_get_unifieddata]

// [Start udmf_sample_get_data_callback]
// 为了代码可读性，代码中省略了各个步骤操作结果的校验，实际开发中需要确认每次调用的成功。
// 1. 获取数据时触发的提供UDS数据的回调函数。
static void* GetDataCallback(void* context, const char* type)
{
    if (strcmp(type, UDMF_META_PLAIN_TEXT)) {
        // 2. 创建超链接hyperlink数据的UDS数据结构。
        OH_UdsHyperlink* hyperlink = OH_UdsHyperlink_Create();
        // 3. 设置hyperlink中的URL和描述信息。
        OH_UdsHyperlink_SetUrl(hyperlink, "www.demo.com");
        OH_UdsHyperlink_SetDescription(hyperlink, "This is the description.");
        return hyperlink;
    }
    return nullptr;
}
// 4. OH_UdmfRecordProvider销毁时触发的回调函数。
static void ProviderFinalizeCallback(void* context) { OH_LOG_INFO(LOG_APP, "OH_UdmfRecordProvider finalize."); }
// [End udmf_sample_get_data_callback]

// [Start udmf_sample_send_delay_unifieddata]
int32_t SendDelayUnifiedData()
{
    // 为了代码可读性，代码中省略了各个步骤操作结果的校验，实际开发中需要确认每次调用的成功。
    // 1. 创建一个统一数据提供者，并配置它提供数据、销毁时的两个回调函数。
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    OH_UdmfRecordProvider_SetData(provider, (void*)provider, GetDataCallback, ProviderFinalizeCallback);

    // 2. 创建一个OH_UdmfRecord对象，并将OH_UdmfRecordProvider配置到其中。
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    const char* types[1] = {UDMF_META_HYPERLINK};
    OH_UdmfRecord_SetProvider(record, types, 1, provider);

    // 3. 创建OH_UdmfData对象，并向OH_UdmfData中添加OH_UdmfRecord。
    OH_UdmfData* data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);

    // 4. 构建数据，将数据写入数据库中，得到返回的Key值。
    char key[UDMF_KEY_BUFFER_LEN] = {0};
    OH_Udmf_SetUnifiedData(Udmf_Intention::UDMF_INTENTION_DRAG, data, key, sizeof(key));
    OH_LOG_INFO(LOG_APP, "key = %{public}s", key);

    // 5. 使用完成后销毁指针。
    OH_UdmfRecordProvider_Destroy(provider);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(data);
    return Udmf_ErrCode::UDMF_E_OK;
}
// [End udmf_sample_send_delay_unifieddata]

static napi_value NAPI_Global_getTypeId(napi_env env, napi_callback_info info)
{
    int32_t ret = GetTypeId();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NAPI_Global_sendUnifiedData(napi_env env, napi_callback_info info)
{
    int32_t ret = SendUnifiedData();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NAPI_Global_getUnifiedData(napi_env env, napi_callback_info info)
{
    int32_t ret = GetUnifiedData();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NAPI_Global_sendDelayUnifiedData(napi_env env, napi_callback_info info)
{
    int32_t ret = SendDelayUnifiedData();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"getTypeId", nullptr, NAPI_Global_getTypeId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendUnifiedData", nullptr, NAPI_Global_sendUnifiedData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getUnifiedData", nullptr, NAPI_Global_getUnifiedData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendDelayUnifiedData", nullptr, NAPI_Global_sendDelayUnifiedData, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc)/sizeof(desc[0]), desc);
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
