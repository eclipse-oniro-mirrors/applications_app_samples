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
// [Start verify_signatures_with_ecdsa_keys_c]
#include "signing_signature_verification.h"

bool DoTestEcdsaSignature()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;

    uint8_t plainText[] = {0xe4, 0x2b, 0xcc, 0x08, 0x11, 0x79, 0x16, 0x1b,
                           0x35, 0x7f, 0xb3, 0xaf, 0x40, 0x3b, 0x3f, 0x7c};
    Crypto_DataBlob msgBlob = {.data = reinterpret_cast<uint8_t *>(plainText), .len = sizeof(plainText)};

    uint8_t pubKeyText[] = {0x30, 0x39, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08,
                            0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x22, 0x00, 0x03, 0x4d, 0xe4, 0xbb,
                            0x11, 0x10, 0x1a, 0xd2, 0x05, 0x74, 0xf1, 0x0b, 0xb4, 0x75, 0x57, 0xf4, 0x3e, 0x55, 0x14,
                            0x17, 0x05, 0x4a, 0xb2, 0xfb, 0x8c, 0x84, 0x64, 0x38, 0x02, 0xa0, 0x2a, 0xa6, 0xf0};

    Crypto_DataBlob keyBlob = {.data = reinterpret_cast<uint8_t *>(pubKeyText), .len = sizeof(pubKeyText)};

    uint8_t signText[] = {0x30, 0x44, 0x02, 0x20, 0x21, 0x89, 0x99, 0xb1, 0x56, 0x4e, 0x3a, 0x2c, 0x16, 0x08,
                          0xb5, 0x8a, 0x06, 0x6f, 0x67, 0x47, 0x1b, 0x04, 0x18, 0x7d, 0x53, 0x2d, 0xba, 0x00,
                          0x38, 0xd9, 0xe3, 0xe7, 0x8c, 0xcf, 0x76, 0x83, 0x02, 0x20, 0x13, 0x54, 0x84, 0x9d,
                          0x73, 0x40, 0xc3, 0x92, 0x66, 0xdc, 0x3e, 0xc9, 0xf1, 0x4c, 0x33, 0x84, 0x2a, 0x76,
                          0xaf, 0xc6, 0x61, 0x84, 0x5c, 0xae, 0x4b, 0x0d, 0x3c, 0xb0, 0xc8, 0x04, 0x89, 0x71};

    Crypto_DataBlob signBlob = {.data = reinterpret_cast<uint8_t *>(signText), .len = sizeof(signText)};

    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    // keypair
    ret = OH_CryptoAsymKeyGenerator_Create((const char *)"ECC256", &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        return false;
    }
    ret = OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &keyBlob, nullptr, &keyPair);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        return false;
    }
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    // verify
    ret = OH_CryptoVerify_Create((const char *)"ECC|SHA256", &verify);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoVerify_Destroy(verify);
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        return false;
    }
    ret = OH_CryptoVerify_Init(verify, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoVerify_Destroy(verify);
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        return false;
    }
    bool res = OH_CryptoVerify_Final(verify, &msgBlob, &signBlob);
    if (ret != true) {
        OH_CryptoVerify_Destroy(verify);
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        return false;
    }

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return res;
}
// [End verify_signatures_with_ecdsa_keys_c]