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

// [get_resource_id_arkts]
import { huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { util } from '@kit.ArkTS';

let providerName: string = 'testProviderName';
let abilityName: string = 'CryptoExtension';
let bundleName: string = 'com.example.cryptoapplication';
// 资源信息，格式和内容由密钥管理扩展服务实现方定义
let resourceInfo: string = 'vendor_defined_resource_info';

function stringToUint8Array(str: string): Uint8Array {
  return new util.TextEncoder().encodeInto(str);
}

async function getResourceId(): Promise<string> {
  const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
    {
      tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
      value: stringToUint8Array(abilityName),
    },
    {
      tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_BUNDLE_NAME,
      value: stringToUint8Array(bundleName),
    },
    {
      tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_RESOURCE_INFO,
      value: stringToUint8Array(resourceInfo),
    },
  ];

  const resourceId: string = await huksExternalCrypto.getResourceId(providerName, extProperties);
  console.info(`promise: getResourceId success, resourceId: ${resourceId}`);
  return resourceId;
}
// [get_resource_id_arkts]
