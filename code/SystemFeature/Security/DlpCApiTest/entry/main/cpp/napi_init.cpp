#include "napi/native_api.h"
#include <cstdint>
#include <cstdlib>
#include "DataProtectionKit/dlp_permission_api.h"
// [Start dlp_C_GetDlpPermissionInfo]
static napi_value GetDlpPermissionInfo(napi_env env, napi_callback_info info)
{
    DLP_FileAccess dlpFileAccess = NO_PERMISSION; //表示DLP文件授权类型
    uint32_t flags = 0; //表示DLP文件的详细操作权限
    DLP_ErrCode ret = OH_DLP_GetDlpPermissionInfo(&dlpFileAccess, &flags);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result[2] = {nullptr};
        napi_create_int32(env, dlpFileAccess, &result[0]);
        napi_create_int32(env, flags, &result[1]);
        return result[1];
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End dlp_C_GetDlpPermissionInfo]

// [Start dlp_C_GetOriginalFileName]
static napi_value GetOriginalFileName(napi_env env, napi_callback_info info)
{
    const char *fileName = "test.txt.dlp"; //表示dlp文件名，用以获取原始文件名
    char *originalFileName = nullptr; //表示原始文件名
    DLP_ErrCode ret = OH_DLP_GetOriginalFileName(fileName, &originalFileName);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_string_utf8(env, originalFileName, NAPI_AUTO_LENGTH, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    free(originalFileName); //处理完后手动释放originalFileName
    return result;
}
// [End dlp_C_GetOriginalFileName]

// [Start dlp_C_IsInSandbox]
static napi_value IsInSandbox(napi_env env, napi_callback_info info)
{
    bool isInSandbox = false; //true 表示当前应用在沙箱中，false 表示应用不在沙箱
    DLP_ErrCode ret = OH_DLP_IsInSandbox(&isInSandbox);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_get_boolean(env, isInSandbox, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End dlp_C_IsInSandbox]

// [Start dlp_C_SetSandboxAppConfig]
static napi_value SetSandboxAppConfig(napi_env env, napi_callback_info info)
{
    const char *configInfo = "configInfo"; //沙箱应用配置信息，用户可将配置信息json化后传入
    DLP_ErrCode ret = OH_DLP_SetSandboxAppConfig(configInfo);
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End dlp_C_SetSandboxAppConfig]

// [Start dlp_C_GetSandboxAppConfig]
static napi_value GetSandboxAppConfig(napi_env env, napi_callback_info info)
{
    char *configInfo = nullptr; //输出json化后的沙箱应用配置信息
    DLP_ErrCode ret = OH_DLP_GetSandboxAppConfig(&configInfo);
    if (ret == DLP_ErrCode::ERR_OH_SUCCESS) {
        napi_value result = nullptr;
        napi_create_string_utf8(env, configInfo, NAPI_AUTO_LENGTH, &result);
        return result;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    free(configInfo); //处理完后手动释放configInfo
    return result;
}
// [End dlp_C_GetSandboxAppConfig]

// [Start dlp_C_CleanSandboxAppConfig]
static napi_value CleanSandboxAppConfig(napi_env env, napi_callback_info info)
{
    DLP_ErrCode ret = OH_DLP_CleanSandboxAppConfig();
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End dlp_C_CleanSandboxAppConfig]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetDlpPermissionInfo", nullptr, GetDlpPermissionInfo, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"GetOriginalFileName", nullptr, GetOriginalFileName, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"IsInSandbox", nullptr, IsInSandbox, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"SetSandboxAppConfig", nullptr, SetSandboxAppConfig, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"GetSandboxAppConfig", nullptr, GetSandboxAppConfig, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"CleanSandboxAppConfig", nullptr, CleanSandboxAppConfig, nullptr,
         nullptr, nullptr, napi_default, nullptr}
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
