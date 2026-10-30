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

import { huks, huksExternalCrypto } from '@kit.UniversalKeystoreKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_UkeyExtension]';

function stringToUint8Array(str: string): Uint8Array {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

@Entry
@Component
struct Index {
  @State message: string = 'UkeyExtension';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Scroll() {
        Column({ space: 10 }) {
          Text($r('app.string.api_22_title'))
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.section_title_color'))
            .margin({ top: 10, bottom: 5 })

          this.featureButton($r('app.string.register_provider'), () => this.registerProvider())
          this.featureButton($r('app.string.unregister_single'), () => this.unregisterSingle())
          this.featureButton($r('app.string.unregister_all'), () => this.unregisterAll())
          this.featureButton($r('app.string.open_resource'), () => this.openResource())
          this.featureButton($r('app.string.close_resource'), () => this.closeResource())
          this.featureButton($r('app.string.query_pin_auth_state'), () => this.queryPinAuthState())

          Text($r('app.string.api_26_title'))
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.section_title_color'))
            .margin({ top: 20, bottom: 5 })

          this.featureButton($r('app.string.register_provider_with_auth_ui'),
            () => this.registerProviderWithAuthUI())
          this.featureButton($r('app.string.clear_pin_auth_state'), () => this.clearPinAuthState())
          this.featureButton($r('app.string.get_resource_id'), () => this.getResourceId())
          this.featureButton($r('app.string.set_property'), () => this.setProperty())
          this.featureButton($r('app.string.extension_key_generation'), () => this.extensionKeyGeneration())
          this.featureButton($r('app.string.extension_key_export'), () => this.extensionKeyExport())
          this.featureButton($r('app.string.extension_key_import'), () => this.extensionKeyImport())

          Text($r('app.string.api_26_1_title'))
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.section_title_color'))
            .margin({ top: 20, bottom: 5 })

          this.featureButton($r('app.string.register_ukey_auth_extension'),
            () => this.registerUkeyAuthExtension())
        }
        .padding(15)
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  featureButton(title: Resource, action: () => void) {
    Button(title)
      .width('100%')
      .height(45)
      .fontSize(16)
      .margin({ bottom: 5 })
      .onClick(() => {
        hilog.info(DOMAIN, TAG, 'featureButton click');
        action();
      })
  }

  // API 22: 注册Provider
  async registerProvider(): Promise<void> {
    try {
      const providerName = 'testProvider';
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
          value: stringToUint8Array('CryptoExtension')
        }
      ];
      await huksExternalCrypto.registerProvider(providerName, extProperties);
      hilog.info(DOMAIN, TAG, 'registerProvider success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'registerProvider failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 22: 注销单个Provider
  async unregisterSingle(): Promise<void> {
    try {
      const providerName = 'testProvider';
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
          value: stringToUint8Array('CryptoExtension')
        }
      ];
      await huksExternalCrypto.unregisterProvider(providerName, extProperties);
      hilog.info(DOMAIN, TAG, 'unregisterSingle success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'unregisterSingle failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 22: 批量注销Provider
  async unregisterAll(): Promise<void> {
    try {
      const providerName = 'testProvider';
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [];
      await huksExternalCrypto.unregisterProvider(providerName, extProperties);
      hilog.info(DOMAIN, TAG, 'unregisterAll success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'unregisterAll failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 22: 打开资源
  async openResource(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.openResource(resourceId, []);
      hilog.info(DOMAIN, TAG, 'openResource success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'openResource failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 22: 关闭资源
  async closeResource(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.closeResource(resourceId, []);
      hilog.info(DOMAIN, TAG, 'closeResource success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'closeResource failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 22: 查询PIN认证状态
  async queryPinAuthState(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      const state = await huksExternalCrypto.getUkeyPinAuthState(resourceId, []);
      hilog.info(DOMAIN, TAG, 'queryPinAuthState success, state: %{public}d', state);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'queryPinAuthState failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 注册Provider与定制化认证UI
  async registerProviderWithAuthUI(): Promise<void> {
    try {
      const providerName = 'testProvider';
      const abilityInfo = JSON.stringify([
        { abilityName: 'UiAbility1', index: '' },
        { abilityName: 'UiAbility2', index: 'string2' }
      ]);
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
          value: stringToUint8Array('CryptoExtension')
        },
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_INFO,
          value: stringToUint8Array(abilityInfo)
        }
      ];
      await huksExternalCrypto.registerProvider(providerName, extProperties);
      hilog.info(DOMAIN, TAG, 'registerProviderWithAuthUI success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'registerProviderWithAuthUI failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 清除PIN认证状态
  async clearPinAuthState(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.clearUkeyPinAuthState(resourceId);
      hilog.info(DOMAIN, TAG, 'clearPinAuthState success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'clearPinAuthState failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 获取资源ID
  async getResourceId(): Promise<void> {
    try {
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
          value: stringToUint8Array('CryptoExtension')
        },
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_BUNDLE_NAME,
          value: stringToUint8Array('com.example.cryptoapplication')
        },
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_RESOURCE_INFO,
          value: stringToUint8Array('vendor_defined_resource_info')
        }
      ];
      const resourceId = await huksExternalCrypto.getResourceId('testProviderName', extProperties);
      hilog.info(DOMAIN, TAG, 'getResourceId success, resourceId: %{public}s', resourceId);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'getResourceId failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 属性设置
  async setProperty(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.setProperty(resourceId, 'SKF_SetDevInfo');
      hilog.info(DOMAIN, TAG, 'setProperty success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'setProperty failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 密钥生成
  async extensionKeyGeneration(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.openResource(resourceId, []);
      const properties: huks.HuksParam[] = [
        { tag: huks.HuksTag.HUKS_TAG_KEY_CLASS, value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION },
        { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_RSA },
        { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048 },
        { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN }
      ];
      const huksOptions: huks.HuksOptions = { properties: properties, inData: new Uint8Array([]) };
      await huks.generateKeyItem(resourceId, huksOptions);
      hilog.info(DOMAIN, TAG, 'extensionKeyGeneration success');
      await huksExternalCrypto.closeResource(resourceId, []);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'extensionKeyGeneration failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 公钥导出
  async extensionKeyExport(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.openResource(resourceId, []);
      const exportProperties: huks.HuksParam[] = [
        { tag: huks.HuksTag.HUKS_TAG_KEY_CLASS, value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION }
      ];
      const exportOptions: huks.HuksOptions = { properties: exportProperties };
      const data = await huks.exportKeyItem(resourceId, exportOptions);
      hilog.info(DOMAIN, TAG, 'extensionKeyExport success, length: %{public}d', data.outData?.length ?? 0);
      await huksExternalCrypto.closeResource(resourceId, []);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'extensionKeyExport failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.0: 密钥导入
  async extensionKeyImport(): Promise<void> {
    try {
      const resourceId = JSON.stringify({
        providerName: 'testProviderName',
        bundleName: 'com.example.cryptoapplication',
        abilityName: 'CryptoExtension',
        index: { key: 'testKey' } as ESObject
      });
      await huksExternalCrypto.openResource(resourceId, []);
      const properties: huks.HuksParam[] = [
        { tag: huks.HuksTag.HUKS_TAG_KEY_CLASS, value: huks.HuksKeyClassType.HUKS_KEY_CLASS_EXTENSION },
        { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_RSA },
        { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048 },
        { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT }
      ];
      const huksOptions: huks.HuksOptions = { properties: properties, inData: new Uint8Array([]) };
      await huks.importWrappedKeyItem(resourceId, resourceId, huksOptions);
      hilog.info(DOMAIN, TAG, 'extensionKeyImport success');
      await huksExternalCrypto.closeResource(resourceId, []);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'extensionKeyImport failed: %{public}s', JSON.stringify(error));
    }
  }

  // API 26.0.1: 注册UkeyAuthExtensionAbility
  async registerUkeyAuthExtension(): Promise<void> {
    try {
      const providerName = 'testProvider';
      const abilityInfo = JSON.stringify([
        { abilityName: 'UkeyAuthExtensionAbility1', index: '', abilityType: 1 }
      ]);
      const extProperties: huksExternalCrypto.HuksExternalCryptoParam[] = [
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
          value: stringToUint8Array('CryptoExtension')
        },
        {
          tag: huksExternalCrypto.HuksExternalCryptoTag.HUKS_EXT_CRYPTO_TAG_ABILITY_INFO,
          value: stringToUint8Array(abilityInfo)
        }
      ];
      await huksExternalCrypto.registerProvider(providerName, extProperties);
      hilog.info(DOMAIN, TAG, 'registerUkeyAuthExtension success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'registerUkeyAuthExtension failed: %{public}s', JSON.stringify(error));
    }
  }
}
