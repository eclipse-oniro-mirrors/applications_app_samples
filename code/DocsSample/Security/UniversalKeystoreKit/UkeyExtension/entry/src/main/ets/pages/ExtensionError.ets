/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start extension_error_arkts]
import { huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { util } from '@kit.ArkTS';

function stringToUint8Array(str: string): Uint8Array {
  return new util.TextEncoder().encodeInto(str);
}

async function testExtensionError(): Promise<void> {
  /* 1.鍋囪宸叉墦寮€鐨勮祫婧愬涓?*/
  const testResourceId = JSON.stringify({
    providerName: 'testProviderName',
    bundleName: 'com.example.cryptoapplication',
    abilityName: 'CryptoExtension',
    index: {
        key: 'testKey'
    } as ESObject
  });

  /* 2.鏋勯€犲弬鏁?*/
  const pin = '123456';
  const params: huksExternalCrypto.HuksExternalCryptoParam[] = [
    {
      tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_UKEY_PIN,
      value: stringToUint8Array(pin)
    }
  ];

  /* 3.楠岃瘉PIN鐮佸け璐ュ悗鑾峰彇閿欒淇℃伅 */
  try {
    await huksExternalCrypto.getUkeyPinAuthState(testResourceId, params);
  } catch (error) {
    const errorInfo = huksExternalCrypto.getErrorInfo();
    if (errorInfo.errno !== 0) {
      console.error(`Extension error code: ${errorInfo.errno}`);
      console.error(`Extension error desc: ${errorInfo.errorDesc}`);
    }
  }
}
// [End extension_error_arkts]
