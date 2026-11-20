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
// [Start sign_with_sm2_key_pair_c]
#include "signing_signature_verification.h"

static const uint8_t g_plainText[] = {
    0x96, 0x46, 0x2e, 0xde, 0x3f, 0x47, 0xbf, 0xd6, 0x87, 0x48, 0x36, 0x1d, 0x75, 0x35, 0xbd, 0xbc,
    0x6b, 0x06, 0xe8, 0xb3, 0x68, 0x91, 0x53, 0xce, 0x76, 0x5d, 0x24, 0xda, 0xdc, 0xc4, 0x9f, 0x94,
};

static void CleanupSm2SignResources(OH_CryptoAsymKeyGenerator *keyCtx,
    OH_CryptoKeyPair *keyPair, OH_CryptoSign *sign)
{
    if (sign != nullptr) {
        OH_CryptoSign_Destroy(sign);
    }
    if (keyPair != nullptr) {
        OH_CryptoKeyPair_Destroy(keyPair);
    }
    if (keyCtx != nullptr) {
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    }
}

OH_Crypto_ErrCode DoTestSm2Sign()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    Crypto_DataBlob msgBlob = {.data = const_cast<uint8_t *>(g_plainText), .len = sizeof(g_plainText)};

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create((const char *)"SM2_256", &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    if (ret != CRYPTO_SUCCESS) {
        CleanupSm2SignResources(keyCtx, keyPair, sign);
        return ret;
    }

    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ret = OH_CryptoSign_Create((const char *)"SM2_256|SM3", &sign);
    if (ret != CRYPTO_SUCCESS) {
        CleanupSm2SignResources(keyCtx, keyPair, sign);
        return ret;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        CleanupSm2SignResources(keyCtx, keyPair, sign);
        return ret;
    }

    ret = OH_CryptoSign_Update(sign, &msgBlob);
    if (ret != CRYPTO_SUCCESS) {
        CleanupSm2SignResources(keyCtx, keyPair, sign);
        return ret;
    }

    Crypto_DataBlob signBlob = {.data = nullptr, .len = 0};
    ret = OH_CryptoSign_Final(sign, nullptr, &signBlob);
    if (ret != CRYPTO_SUCCESS) {
        CleanupSm2SignResources(keyCtx, keyPair, sign);
        return ret;
    }
    CleanupSm2SignResources(keyCtx, keyPair, sign);
    OH_Crypto_FreeDataBlob(&signBlob);
    return CRYPTO_SUCCESS;
}

// [End sign_with_sm2_key_pair_c]