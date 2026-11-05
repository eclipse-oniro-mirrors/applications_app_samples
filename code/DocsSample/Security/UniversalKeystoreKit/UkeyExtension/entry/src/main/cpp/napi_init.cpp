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

#include "napi/native_api.h"
#include "huks/native_huks_api.h"
#include "huks/native_huks_type.h"
#include "huks/native_huks_param.h"
#include "huks/native_huks_external_crypto_api.h"
#include <string.h>
#include <cstdint>
#include <device_certificate/certmanager/cm_native_api.h>
#include <device_certificate/certmanager/cm_native_type.h>

static OH_Huks_Result InitParamSet(
    struct OH_Huks_ExternalCryptoParamSet **paramSet,
    const struct OH_Huks_ExternalCryptoParam *params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitExternalCryptoParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_AddExternalCryptoParams(*paramSet, params, paramCount);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(paramSet);
        return ret;
    }
    ret = OH_Huks_BuildExternalCryptoParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(paramSet);
        return ret;
    }
    return ret;
}

static OH_Huks_Result InitHuksParamSet(
    struct OH_Huks_ParamSet **paramSet,
    const struct OH_Huks_Param *params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    return ret;
}

// [register_provider_cpp]
static struct OH_Huks_Blob g_abilityName = {
    (uint32_t)strlen("testAbility"),
    (uint8_t *)"testAbility"
};

static struct OH_Huks_Blob g_providerName = {
    (uint32_t)strlen("testProviderName"),
    (uint8_t *)"testProviderName"
};

static struct OH_Huks_ExternalCryptoParam g_abilityParams[] = {
    {
        .tag = OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
        .blob = g_abilityName
    },
};

static napi_value registerProvider(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ExternalCryptoParamSet *providerParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&providerParamSet, g_abilityParams,
            sizeof(g_abilityParams) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_RegisterProvider(&g_providerName, providerParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&providerParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [register_provider_cpp]

// [unregister_single_cpp]
static napi_value unregisterSingleProvider(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ExternalCryptoParamSet *providerParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&providerParamSet, g_abilityParams,
            sizeof(g_abilityParams) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_UnregisterProvider(&g_providerName, providerParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&providerParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [unregister_single_cpp]

// [unregister_all_cpp]
static struct OH_Huks_ExternalCryptoParam g_emptyAbilityParams[] = {};

static napi_value unregisterAllProvider(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ExternalCryptoParamSet *providerParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&providerParamSet, g_emptyAbilityParams,
            sizeof(g_emptyAbilityParams) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_UnregisterProvider(&g_providerName, providerParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&providerParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [unregister_all_cpp]

// [open_resource_cpp]
static const char *OPEN_RESOURCE_ID =
    "{\"providerName\":\"testProviderName\","
    "\"abilityName\":\"CryptoExtension\","
    "\"bundleName\":\"com.example.cryptoapplication\","
    "\"index\":{\"key\":\"testKey\"}}";

static struct OH_Huks_ExternalCryptoParam g_openResourceParamsTest[] = {};

static napi_value OpenResource(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(OPEN_RESOURCE_ID),
        (uint8_t *)OPEN_RESOURCE_ID
    };
    struct OH_Huks_ExternalCryptoParamSet *openResourceParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&openResourceParamSet, g_openResourceParamsTest,
            sizeof(g_openResourceParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_OpenResource(&resourceId, openResourceParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&openResourceParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [open_resource_cpp]

// [close_resource_cpp]
static const char *CLOSE_RESOURCE_ID =
    "{\"providerName\":\"testProviderName\","
    "\"abilityName\":\"CryptoExtension\","
    "\"bundleName\":\"com.example.cryptoapplication\","
    "\"userid\":100,"
    "\"index\":{\"key\":\"testKey\"}}";

static struct OH_Huks_ExternalCryptoParam g_closeResourceParamsTest[] = {};

static napi_value CloseResource(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(CLOSE_RESOURCE_ID),
        (uint8_t *)CLOSE_RESOURCE_ID
    };
    struct OH_Huks_ExternalCryptoParamSet *closeResourceParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&closeResourceParamSet, g_closeResourceParamsTest,
            sizeof(g_closeResourceParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_CloseResource(&resourceId, closeResourceParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&closeResourceParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [close_resource_cpp]

// [query_auth_state_cpp]
static const char *QUERY_RESOURCE_ID =
    "{\"providerName\":\"testProviderName\","
    "\"abilityName\":\"CryptoExtension\","
    "\"bundleName\":\"com.example.cryptoapplication\","
    "\"index\":{\"key\":\"testKey\"}}";

static struct OH_Huks_ExternalCryptoParam g_getPinStateParamsTest[] = {};

static napi_value GetUkeyPinAuthState(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob g_resourceId = {
        (uint32_t)strlen(QUERY_RESOURCE_ID),
        (uint8_t *)QUERY_RESOURCE_ID
    };
    struct OH_Huks_ExternalCryptoParamSet *pinStateParamSet = nullptr;
    OH_Huks_ExternalPinAuthState authState = OH_HUKS_EXT_CRYPTO_PIN_NO_AUTH;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&pinStateParamSet, g_getPinStateParamsTest,
            sizeof(g_getPinStateParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_GetUkeyPinAuthState(&g_resourceId, pinStateParamSet, &authState);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeExternalCryptoParamSet(&pinStateParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [query_auth_state_cpp]

// [get_property_cpp]
static napi_value GetProperty(napi_env env, napi_callback_info info)
{
    /* 1.假设已经打开了resourceId */
    const char *resourceIdStr = "{\"providerName\":\"testProviderName\",\"abilityName\":\"CryptoExtension\","
                              "\"bundleName\":\"com.example.cryptoapplication\",\"index\":{\"key\":\"testKey\"}}";
    const char *propertyIdStr = "SKF_GetDevInfo";

    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(resourceIdStr),
        (uint8_t *)resourceIdStr
    };
    struct OH_Huks_Blob propertyId = {
        (uint32_t)strlen(propertyIdStr),
        (uint8_t *)propertyIdStr
    };

    /* 2.构造输入参数 */
    OH_Huks_ExternalCryptoParam params[] = {};
    OH_Huks_ExternalCryptoParamSet *paramSetIn = nullptr;
    OH_Huks_ExternalCryptoParamSet *paramSetOut = nullptr;
    OH_Huks_Result ohResult;

    do {
        /* 3.初始化并构建输入参数集 */
        ohResult = InitParamSet(&paramSetIn, params,
            sizeof(params) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }

        /* 4.调用OH_Huks_GetProperty获取属性 */
        ohResult = OH_Huks_GetProperty(&resourceId, &propertyId, paramSetIn, &paramSetOut);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }

        /* 5.从输出参数集中提取结果 */
        if (paramSetOut != nullptr && paramSetOut->paramsCnt > 0) {
            for (uint32_t i = 0; i < paramSetOut->paramsCnt; i++) {
                OH_Huks_ExternalCryptoParam *param = &paramSetOut->params[i];
                if (param->tag == OH_HUKS_EXT_CRYPTO_TAG_EXTRA_DATA) {
                    char *outStr = (char *)malloc(param->blob.size + 1);
                    if (outStr != NULL) {
                        memcpy(outStr, param->blob.data, param->blob.size);
                        outStr[param->blob.size] = '\0';
                        free(outStr);
                    }
                }
            }
        }
    } while (0);

    /* 6.释放资源 */
    OH_Huks_FreeExternalCryptoParamSet(&paramSetIn);
    OH_Huks_FreeExternalCryptoParamSet(&paramSetOut);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [get_property_cpp]

// [ukey_best_practice_cpp]
/* 1. 调用证书管理接口解析用户选择的证书，获取对应的证书数据 */
static napi_value GetUkeyCert(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc != 1) {
        return nullptr;
    }
    /* 获取keyUri长度 */
    size_t length = 0;
    napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length);
    if (length == 0 || length >= SIZE_MAX) {
        return nullptr;
    }
    /* 获取keyUri值 */
    char *keyUriBuffer = static_cast<char*>(malloc(length + 1));
    if (keyUriBuffer == nullptr) {
        return nullptr;
    }
    size_t result = 0;
    napi_get_value_string_utf8(env, argv[0], keyUriBuffer, length + 1, &result);
    OH_CM_Blob keyUri = { static_cast<uint32_t>(length), (uint8_t*)keyUriBuffer };

    /* 定义UkeyInfo入参 */
    OH_CM_UkeyInfo ukeyInfo = { OH_CM_CERT_PURPOSE_SIGN };

    /* 获取keyUri对应的UKey证书详情 */
    OH_CM_CredentialDetailList credentialList = { 0, nullptr };
    int32_t ret = OH_CertManager_GetUkeyCertificate(&keyUri, &ukeyInfo, &credentialList);

    /* 调用结束释放内存 */
    OH_CertManager_FreeUkeyCertificate(&credentialList);
    free(keyUriBuffer);
    /* 返回调用结果 */
    napi_value retNapi;
    napi_create_int32(env, ret, &retNapi);
    return retNapi;
}

/* 2. 根据用户选中的keyUri作为resourceId，调用HUKS接口打开资源 */
static struct OH_Huks_ExternalCryptoParam g_bpOpenResourceParamsTest[] = {};

static napi_value BpOpenResource(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc != 1) {
        return nullptr;
    }
    /* 获取keyUri长度 */
    size_t length = 0;
    napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length);
    if (length == 0 || length >= SIZE_MAX) {
        return nullptr;
    }
    /* 获取keyUri值 */
    char *keyUriBuffer = static_cast<char*>(malloc(length + 1));
    if (keyUriBuffer == nullptr) {
        return nullptr;
    }
    size_t result = 0;
    napi_get_value_string_utf8(env, argv[0], keyUriBuffer, length + 1, &result);
    OH_Huks_Blob resourceId = {
        .size = static_cast<uint32_t>(length),
        .data = (uint8_t*)keyUriBuffer
    };

    struct OH_Huks_ExternalCryptoParamSet *openResourceParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&openResourceParamSet, g_bpOpenResourceParamsTest,
            sizeof(g_bpOpenResourceParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_OpenResource(&resourceId, openResourceParamSet);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    free(keyUriBuffer);
    OH_Huks_FreeExternalCryptoParamSet(&openResourceParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}

/* 3. 调用HUKS接口查询PIN认证状态 */
static struct OH_Huks_ExternalCryptoParam g_bpGetPinStateParamsTest[] = {};

static napi_value BpGetUkeyPinAuthState(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc != 1) {
        return nullptr;
    }
    /* 获取keyUri长度 */
    size_t length = 0;
    napi_get_value_string_utf8(env, argv[0], nullptr, 0, &length);
    if (length == 0 || length >= SIZE_MAX) {
        return nullptr;
    }
    /* 获取keyUri值 */
    char *keyUriBuffer = static_cast<char*>(malloc(length + 1));
    if (keyUriBuffer == nullptr) {
        return nullptr;
    }
    size_t result = 0;
    napi_get_value_string_utf8(env, argv[0], keyUriBuffer, length + 1, &result);
    OH_Huks_Blob resourceId = {
        .size = static_cast<uint32_t>(length),
        .data = (uint8_t*)keyUriBuffer
    };

    struct OH_Huks_ExternalCryptoParamSet *pinStateParamSet = nullptr;
    OH_Huks_ExternalPinAuthState authState = OH_HUKS_EXT_CRYPTO_PIN_NO_AUTH;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&pinStateParamSet, g_bpGetPinStateParamsTest,
            sizeof(g_bpGetPinStateParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_GetUkeyPinAuthState(&resourceId, pinStateParamSet, &authState);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    free(keyUriBuffer);
    OH_Huks_FreeExternalCryptoParamSet(&pinStateParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}

/* 4. 接口定义与注册 */
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getUkeyCert", nullptr, GetUkeyCert, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "openResource", nullptr, BpOpenResource, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getUkeyPinAuthState", nullptr, BpGetUkeyPinAuthState, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};
extern "C" __attribute__((constructor)) void RegisterHelloModule(void)
{
    napi_module_register(&demoModule);
}
// [ukey_best_practice_cpp]

// [ukey_sign_cpp]
/* 调用huks三段式接口获取签名后的数据 */
static struct OH_Huks_Param g_signParamsTest[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_RSA
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_PSS
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA384
    }, {
        .tag = OH_HUKS_TAG_KEY_CLASS,
        .uint32Param = OH_HUKS_KEY_CLASS_EXTENSION
    }
};

static const uint32_t RSA_COMMON_SIZE = 1024;
static const char *DATA_TO_SIGN = "testData";
static const char *KEY_ALIAS = "testKeyAlias";

static napi_value Sign(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob keyAlias = {
        (uint32_t)strlen(KEY_ALIAS),
        (uint8_t *)KEY_ALIAS
    };
    struct OH_Huks_Blob inData = {
        (uint32_t)strlen(DATA_TO_SIGN),
        (uint8_t *)DATA_TO_SIGN
    };
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    OH_Huks_Result ohResult;
    do {
        ohResult = InitHuksParamSet(&signParamSet, g_signParamsTest,
            sizeof(g_signParamsTest) / sizeof(OH_Huks_Param));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        uint8_t handleS[sizeof(uint64_t)] = {0};
        struct OH_Huks_Blob handleSign = { (uint32_t)sizeof(uint64_t), handleS };
        ohResult = OH_Huks_InitSession(&keyAlias, signParamSet, &handleSign, nullptr);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        uint8_t outDataS[RSA_COMMON_SIZE] = {0};
        struct OH_Huks_Blob outDataSign = { RSA_COMMON_SIZE, outDataS };
        ohResult = OH_Huks_FinishSession(&handleSign, signParamSet, &inData, &outDataSign);
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
    } while (0);
    OH_Huks_FreeParamSet(&signParamSet);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
// [ukey_sign_cpp]
