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

// [extension_key_import_arkts]
import { huks, huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { BusinessError } from '@kit.BasicServicesKit';

async function openResource(resourceId: string): Promise<void> {
  try {
    await huksExternalCrypto.openResource(resourceId)
      .then(() => {
        console.info('promise: openResource success.');
      }).catch((error: BusinessError) => {
        console.error(`promise: openResource failed, errCode : ${error.code}, errMsg : ${error.message}`);
      });
  } catch (error) {
    console.error('promise: openResource input arg invalid.');
  }
}

async function importWrappedKeyItem(
  keyAlias: string,
  wrappingKeyAlias: string,
  huksOptions: huks.HuksOptions
): Promise<void> {
  try {
    await huks.importWrappedKeyItem(keyAlias, wrappingKeyAlias, huksOptions)
      .then(() => {
        console.info('promise: importWrappedKeyItem success.');
      }).catch((error: BusinessError) => {
        console.error(`promise: importWrappedKeyItem failed, errCode : ${error.code}, errMsg : ${error.message}`);
      });
  } catch (error) {
    console.error('promise: importWrappedKeyItem input arg invalid.');
  }
}

async function closeResource(resourceId: string): Promise<void> {
  try {
    await huksExternalCrypto.closeResource(resourceId)
      .then(() => {
        console.info('promise: closeResource success.');
      }).catch((error: BusinessError) => {
        console.error(`promise: closeResource failed, errCode : ${error.code}, errMsg : ${error.message}`);
      });
  } catch (error) {
    console.error('promise: closeResource input arg invalid.');
  }
}

async function extensionKeyImport(): Promise<void> {
  /* 1.准备资源ID（keyAlias和wrappingKeyAlias使用resourceId） */
  const resourceId = JSON.stringify({
    providerName: 'testProviderName',
    bundleName: 'com.example.cryptoapplication',
    abilityName: 'CryptoExtension',
    index: {
      key: 'testKey'
    } as ESObject
  });
  const keyAlias = resourceId;
  const wrappingKeyAlias = resourceId;

  const properties: huks.HuksParam[] = [
    {
      tag: huks.HuksTag.HUKS_TAG_KEY_CLASS,
      value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION
    },
    {
      tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
      value: huks.HuksKeyAlg.HUKS_ALG_RSA
    },
    {
      tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
      value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048
    },
    {
      tag: huks.HuksTag.HUKS_TAG_PURPOSE,
      value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
    }
  ];
  // 加密封装的密钥数据（由Extension实现方定义格式）
  const wrappedKeyData: Uint8Array = new Uint8Array([/* 封装密钥数据 */]);
  const huksOptions: huks.HuksOptions = {
    properties: properties,
    inData: wrappedKeyData
  };

  try {
    /* 2.打开资源 */
    await openResource(resourceId);

    /* 3.导入加密封装的密钥 */
    await importWrappedKeyItem(keyAlias, wrappingKeyAlias, huksOptions);

    /* 4.关闭资源 */
    await closeResource(resourceId);

    console.info('promise: extensionKeyImport completed successfully.');
  } catch (error) {
    console.error('promise: extensionKeyImport input arg invalid.');
  }
}
// [extension_key_import_arkts]
