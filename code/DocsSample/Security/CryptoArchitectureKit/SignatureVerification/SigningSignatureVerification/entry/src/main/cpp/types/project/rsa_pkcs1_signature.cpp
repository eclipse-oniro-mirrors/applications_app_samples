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

// [Start pkcs1_rsa_keypair_sign]
#include "CryptoArchitectureKit/crypto_common.h"
#include "CryptoArchitectureKit/crypto_signature.h"
#include "CryptoArchitectureKit/crypto_asym_key.h"

static void CleanupRsaSignResources(OH_CryptoAsymKeyGenerator *keyCtx, OH_CryptoKeyPair *keyPair,
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

bool DoTestRsaSignature()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    uint8_t plainText[] = {
        0x43, 0x31, 0x7d, 0xb5, 0x85, 0x2e, 0xd4, 0xef, 0x08, 0x7a, 0x17, 0x96, 0xbc, 0x7c, 0x8f, 0x80,
        0x8c, 0xa7, 0x63, 0x7f, 0x26, 0x89, 0x8f, 0xf0, 0xfa, 0xa7, 0x51, 0xbd, 0x9c, 0x69, 0x17, 0xf3,
        0xd1, 0xb5, 0xc7, 0x12, 0xbf, 0xcf, 0x91, 0x25, 0x82, 0x23, 0x6b, 0xd6, 0x64, 0x52, 0x77, 0x93,
        0x01, 0x9d, 0x70, 0xa3, 0xf4, 0x92, 0x16, 0xec, 0x3f, 0xa7, 0x3c, 0x83, 0x8d, 0x40, 0x41, 0xfc,
    };
    Crypto_DataBlob msgBlob = {.data = reinterpret_cast<uint8_t *>(plainText), .len = sizeof(plainText)};

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create((const char *)"RSA2048", &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ret = OH_CryptoSign_Create((const char *)"RSA1024|PKCS1|SHA256", &sign);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Update(sign, &msgBlob);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Final(sign, nullptr, &signData);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    CleanupRsaSignResources(keyCtx, keyPair, sign, &signData);
    return true;
}
// [End pkcs1_rsa_keypair_sign]