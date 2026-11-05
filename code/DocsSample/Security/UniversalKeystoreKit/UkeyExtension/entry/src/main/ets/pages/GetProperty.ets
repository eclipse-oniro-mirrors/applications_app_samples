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

// [get_property_arkts]
import { huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { BusinessError } from '@kit.BasicServicesKit';

async function getDeviceInfo(): Promise<void> {
  // 假设已通过openResource打开resourceId
  const testResourceId = JSON.stringify({
    providerName: 'testProviderName',
    bundleName: 'com.example.cryptoapplication',
    abilityName: 'CryptoExtension',
    index: {
        key: 'testKey'
    } as ESObject
  });

  // 设置propertyId
  const propertyId = 'SKF_GetDevInfo';
  const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [];

  // 调用getProperty获取属性信息
  try {
    await huksExternalCrypto.getProperty(testResourceId, propertyId, extProperties)
      .then((data) => {
        console.info(`promise: getProperty success, data: ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.error(`promise: getProperty failed, errCode: ${error.code}, errMsg: ${error.message}`);
      });
  } catch (error) {
    console.error('promise: getProperty input arg invalid.');
  }
}
// [get_property_arkts]
