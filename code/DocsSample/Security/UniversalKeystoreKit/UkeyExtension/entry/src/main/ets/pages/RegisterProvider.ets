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

// [register_provider_arkts]
import { huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { BusinessError } from '@kit.BasicServicesKit';

function stringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

async function registerProvider(): Promise<void> {
  try {
    /* 1.构造注册参数 */
    const providerName = 'testProvider';
    const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
      {
        tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
        value: stringToUint8Array('CryptoExtension')
      }
    ];

    /* 2.调用registerProvider */
    await huksExternalCrypto.registerProvider(providerName, extProperties)
      .then(() => {
        console.info('promise: registerProvider success.');
      }).catch((error: BusinessError) => {
        console.error(`promise: registerProvider failed, errCode : ${error.code}, errMsg : ${error.message}`);
      });
  } catch (error) {
    console.error('promise: registerProvider input arg invalid.');
  }
}

async function testRegisterProvider() {
  await registerProvider();
}
// [register_provider_arkts]
