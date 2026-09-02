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
// [Start signatures_with_ecdsa_keys_c]
#include "CryptoArchitectureKit/crypto_common.h"
#include "CryptoArchitectureKit/crypto_signature.h"
#include "CryptoArchitectureKit/crypto_asym_key.h"

static void CleanupEcdsaResources(OH_CryptoAsymKeyGenerator *keyCtx, OH_CryptoKeyPair *keyPair,
    OH_CryptoSign *sign, Crypto_DataBlob *signData)
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
    if (signData != nullptr && signData->data != nullptr) {
        OH_Crypto_FreeDataBlob(signData);
    }
}

bool DoTestEcdsaSign()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    uint8_t plainText[] = {
        0xe4, 0x2b, 0xcc, 0x08, 0x11, 0x79, 0x16, 0x1b, 0x35, 0x7f, 0xb3, 0xaf, 0x40, 0x3b, 0x3f, 0x7c
    };
    Crypto_DataBlob msgBlob = {.data = reinterpret_cast<uint8_t *>(plainText), .len = sizeof(plainText)};

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create((const char *)"ECC256", &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ret = OH_CryptoSign_Create((const char *)"ECC256|SHA256", &sign);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Update(sign, &msgBlob);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Final(sign, nullptr, &signData);
    if (ret != CRYPTO_SUCCESS) {
        CleanupEcdsaResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    CleanupEcdsaResources(keyCtx, keyPair, sign, &signData);
    return true;
}
// [End signatures_with_ecdsa_keys_c]