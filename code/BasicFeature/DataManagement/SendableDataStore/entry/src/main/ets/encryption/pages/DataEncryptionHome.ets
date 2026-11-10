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

import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../../utils/Logger';
import { DataEncryptionManager } from '../DataEncryptionManager';
import { EncryptionMode, HashAlgorithm } from '../../models/DataModels';

@Entry
@Component
struct DataEncryptionHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: DataEncryptionManager = new DataEncryptionManager();

  aboutToDisappear(): void {
    this.manager.release();
  }

  @Builder
  sectionTitle(title: Resource): void {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.primary_text'))
      .width('100%')
      .margin({ top: 8 })
  }

  @Builder
  actionButton(label: Resource, action: () => void): void {
    Button(label)
      .width('100%')
      .height(44)
      .fontSize(14)
      .onClick(action)
  }

  @Builder
  buttonRow(firstLabel: Resource, firstAction: () => void, secondLabel: Resource, secondAction: () => void): void {
    Row({ space: 8 }) {
      Button(firstLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(firstAction)
      Button(secondLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(secondAction)
    }
    .width('100%')
  }

  build(): void {
    Column({ space: 10 }) {
      Text($r('app.string.encryption_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('encryption_page_title')
      Text($r('app.string.encryption_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_encrypt_init'))
          this.buttonRow($r('app.string.init_aes256'),
            (): void => this.runSync((): string =>
              this.manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256)),
            $r('app.string.init_sm4'),
            (): void => this.runSync((): string =>
              this.manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3)))

          this.sectionTitle($r('app.string.section_encrypt_key'))
          this.buttonRow($r('app.string.generate_key'),
            (): void => this.runSync((): string => this.manager.generateKey()),
            $r('app.string.get_key'),
            (): void => this.runSync((): string => this.manager.getKey()))
          this.buttonRow($r('app.string.set_key'),
            (): void => this.runSync((): string =>
              this.manager.setKey('MySecretKeyForEncryption123456')),
            $r('app.string.check_key'),
            (): void => this.runSync((): string => `keyGenerated=${this.manager.isKeyGenerated()}`))

          this.sectionTitle($r('app.string.section_encrypt_decrypt'))
          this.buttonRow($r('app.string.encrypt_text'),
            (): void => this.runSync((): string => this.manager.encrypt('Hello Sendable Data!')),
            $r('app.string.decrypt_text'),
            (): void => this.runSync((): string => {
              const encrypted = this.manager.encrypt('TestDecrypt');
              const hexPart = encrypted.split(': ')[1];
              return this.manager.decrypt(hexPart);
            }))
          this.buttonRow($r('app.string.encrypt_sync'),
            (): void => this.runSync((): string => this.manager.encryptSync('Sync encrypted')),
            $r('app.string.decrypt_sync'),
            (): void => this.runSync((): string => {
              const enc = this.manager.encryptSync('SyncDecrypt');
              const hex = enc.split(': ')[1];
              return this.manager.decryptSync(hex);
            }))

          this.sectionTitle($r('app.string.section_encrypt_hash'))
          this.buttonRow($r('app.string.compute_hash'),
            (): void => this.runSync((): string => this.manager.computeHash('sample data')),
            $r('app.string.verify_hash'),
            (): void => this.runSync((): string => {
              const hash = this.manager.computeHash('verify me');
              return this.manager.verifyHash('verify me', hash);
            }))

          this.sectionTitle($r('app.string.section_encrypt_mode'))
          this.buttonRow($r('app.string.set_mode_aes128'),
            (): void => this.runSync((): string => this.manager.setEncryptionMode(EncryptionMode.AES_128)),
            $r('app.string.set_mode_aes256'),
            (): void => this.runSync((): string => this.manager.setEncryptionMode(EncryptionMode.AES_256)))
          this.buttonRow($r('app.string.set_hash_sha512'),
            (): void => this.runSync((): string => this.manager.setHashAlgorithm(HashAlgorithm.SHA_512)),
            $r('app.string.set_auto_encrypt'),
            (): void => this.runSync((): string => this.manager.setAutoEncrypt(true)))
          this.buttonRow($r('app.string.get_config'),
            (): void => this.runSync((): string => this.manager.getEncryptionConfig()),
            $r('app.string.show_encrypt_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()))
          this.actionButton($r('app.string.reset_encrypt_stats'),
            (): void => this.runSync((): string => this.manager.resetStatistics()))
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.Top)
      Text($r('app.string.result_title'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .width('100%')
      Scroll() {
        Text(this.result)
          .fontSize(13)
          .fontColor($r('app.color.primary_text'))
          .width('100%')
      }
      .height(110)
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.result_background'))
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.page_background'))
  }

  private runSync(action: () => string): void {
    try {
      this.result = action();
    } catch (error) {
      this.showError(error as BusinessError);
    }
  }

  private showError(error: BusinessError): void {
    const message = `${error.name}: ${error.message}; code=${error.code}`;
    this.result = message;
    Logger.error(message);
  }
}
