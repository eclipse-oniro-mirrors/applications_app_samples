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

// [extension_error_arkts]
import { huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { util } from '@kit.ArkTS';

function stringToUint8Array(str: string): Uint8Array {
  return new util.TextEncoder().encodeInto(str);
}

async function testExtensionError(): Promise<void> {
  /* 1.假设已打开的资源如下 */
  const testResourceId = JSON.stringify({
    providerName: 'testProviderName',
    bundleName: 'com.example.cryptoapplication',
    abilityName: 'CryptoExtension',
    index: {
        key: 'testKey'
    } as ESObject
  });

  /* 2.构造参数 */
  const pin = "123456";
  const params: Array<huksExternalCrypto.HuksExternalCryptoParam> = [
    {
      tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_UKEY_PIN,
      value: stringToUint8Array(pin)
    }
  ];

  /* 3.验证PIN码失败后获取错误信息 */
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
// [extension_error_arkts]
