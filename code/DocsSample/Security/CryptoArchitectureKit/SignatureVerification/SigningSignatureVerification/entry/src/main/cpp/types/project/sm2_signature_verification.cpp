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
// [Start verify_signatures_with_sm2_key_pair_c]
#include "signing_signature_verification.h"

bool DoTestSm2Signature()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;

    uint8_t plainText[] = {
        0x96, 0x46, 0x2e, 0xde, 0x3f, 0x47, 0xbf, 0xd6, 0x87, 0x48, 0x36, 0x1d, 0x75, 0x35, 0xbd, 0xbc,
        0x6b, 0x06, 0xe8, 0xb3, 0x68, 0x91, 0x53, 0xce, 0x76, 0x5d, 0x24, 0xda, 0xdc, 0xc4, 0x9f, 0x94,
    };
    Crypto_DataBlob msgBlob = {.data = reinterpret_cast<uint8_t *>(plainText), .len = sizeof(plainText)};

    uint8_t pubKeyText[] = {
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x81, 0x1c, 0xcf, 0x55, 0x01, 0x82, 0x2d, 0x03, 0x42, 0x00, 0x04, 0x80, 0x5b, 0x78, 0x04, 0xd7,
        0xcf, 0xc3, 0x99, 0x63, 0xae, 0x88, 0xcd, 0xfc, 0xd6, 0x18, 0xf4, 0x08, 0xe8, 0xe3, 0x68, 0x47,
        0x4f, 0x44, 0x0e, 0xb2, 0xba, 0x3a, 0xb3, 0x10, 0xf1, 0xc9, 0xd0, 0x84, 0xe2, 0xa4, 0x47, 0xbe,
        0x72, 0xae, 0xf8, 0x6a, 0xeb, 0x6e, 0x10, 0xab, 0x52, 0x6b, 0x6a, 0x58, 0xc6, 0xb5, 0x78, 0xaa,
        0x70, 0xe5, 0x58, 0x20, 0x4e, 0x34, 0x42, 0x77, 0x08, 0x27, 0x11,
    };

    Crypto_DataBlob keyBlob = {.data = reinterpret_cast<uint8_t *>(pubKeyText), .len = sizeof(pubKeyText)};

    uint8_t signText[] = {
        0x30, 0x45, 0x02, 0x21, 0x00, 0xf4, 0xe7, 0x9d, 0x35, 0x33, 0xa6, 0x86, 0x2e, 0x2a, 0x97, 0x72, 0xc9, 0x46,
        0x79, 0x65, 0xca, 0x4a, 0x71, 0x34, 0xca, 0xf7, 0x58, 0xb3, 0x26, 0xa5, 0xdb, 0xfa, 0x8b, 0xbe, 0xbf, 0x5f,
        0x90, 0x02, 0x20, 0x53, 0xb4, 0x23, 0xb1, 0xe2, 0x8f, 0x2f, 0xe9, 0xc8, 0x22, 0xef, 0xab, 0x9b, 0x13, 0x08,
        0x75, 0x8e, 0xb1, 0x9c, 0x59, 0xe5, 0xd6, 0x64, 0x35, 0xf5, 0xd1, 0xde, 0xfa, 0xfe, 0x80, 0x37, 0x1a,
    };

    Crypto_DataBlob signBlob = {.data = reinterpret_cast<uint8_t *>(signText), .len = sizeof(signText)};

    // keypair
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    ret = OH_CryptoAsymKeyGenerator_Create((const char *)"SM2_256", &keyCtx);
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
    ret = OH_CryptoVerify_Create((const char *)"SM2_256|SM3", &verify);
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

// [End verify_signatures_with_sm2_key_pair_c]