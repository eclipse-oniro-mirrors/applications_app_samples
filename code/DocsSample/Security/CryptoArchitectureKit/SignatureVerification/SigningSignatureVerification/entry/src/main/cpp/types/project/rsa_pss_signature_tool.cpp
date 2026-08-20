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

// [Start pss_rsa_keypair_sign]
#include "CryptoArchitectureKit/crypto_common.h"
#include "CryptoArchitectureKit/crypto_signature.h"
#include "CryptoArchitectureKit/crypto_asym_key.h"

static void CleanupRsaPssSignResources(OH_CryptoAsymKeyGenerator *keyCtx, OH_CryptoKeyPair *keyPair,
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

bool DoTestRsaPssSignSeg()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    uint8_t plainText[] = {
        0x13, 0xa7, 0x73, 0xe8, 0xb8, 0x22, 0x99, 0x72, 0x98, 0x29, 0xae, 0x74, 0xa8, 0x4a, 0xea, 0xa9,
    };
    Crypto_DataBlob msgBlob = {.data = reinterpret_cast<uint8_t *>(plainText), .len = sizeof(plainText)};

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create((const char *)"RSA2048", &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ret = OH_CryptoSign_Create((const char *)"RSA2048|PSS|SHA256|MGF1_SHA256", &sign);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Update(sign, &msgBlob);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }
    ret = OH_CryptoSign_Final(sign, nullptr, &signData);
    if (ret != CRYPTO_SUCCESS) {
        CleanupRsaPssSignResources(keyCtx, keyPair, sign, nullptr);
        return false;
    }

    CleanupRsaPssSignResources(keyCtx, keyPair, sign, &signData);
    return true;
}
// [End pss_rsa_keypair_sign]