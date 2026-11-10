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
import { Logger } from '../utils/Logger';

@Entry
@Component
struct Index {
  build(): void {
    Column({ space: 12 }) {
      Text($r('app.string.home_title'))
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .margin({ top: 32 })
      Text($r('app.string.home_description'))
        .fontSize(15)
        .fontColor($r('app.color.secondary_text'))
        .textAlign(TextAlign.Center)
      Scroll() {
        Column({ space: 8 }) {
          Text($r('app.string.section_data_storage'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
            .margin({ top: 4 })
          Button($r('app.string.open_preferences'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('preferencesButton')
            .onClick((): void => {
              this.openPage('sendablepreferences/pages/SendablePreferencesHome');
            })
          Button($r('app.string.open_relational_store'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('rdbButton')
            .onClick((): void => {
              this.openPage('sendablerelationalstore/pages/SendableRelationalStoreHome');
            })

          Text($r('app.string.section_data_collections'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
            .margin({ top: 8 })
          Button($r('app.string.open_array'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('arrayButton')
            .onClick((): void => {
              this.openPage('sendablearray/pages/SendableArrayHome');
            })
          Button($r('app.string.open_map'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('mapButton')
            .onClick((): void => {
              this.openPage('sendablemap/pages/SendableMapHome');
            })
          Button($r('app.string.open_queue'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('queueButton')
            .onClick((): void => {
              this.openPage('sendablequeue/pages/SendableQueueHome');
            })
          Button($r('app.string.open_record'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('recordButton')
            .onClick((): void => {
              this.openPage('sendablerecord/pages/SendableRecordHome');
            })

          Text($r('app.string.section_advanced_features'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.primary_text'))
            .width('100%')
            .margin({ top: 8 })
          Button($r('app.string.open_migration'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('migrationButton')
            .onClick((): void => {
              this.openPage('migration/pages/DataMigrationHome');
            })
          Button($r('app.string.open_backup'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('backupButton')
            .onClick((): void => {
              this.openPage('backup/pages/DataBackupHome');
            })
          Button($r('app.string.open_encryption'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('encryptionButton')
            .onClick((): void => {
              this.openPage('encryption/pages/DataEncryptionHome');
            })
          Button($r('app.string.open_distributed'))
            .width('100%')
            .height(48)
            .fontSize(14)
            .id('distributedButton')
            .onClick((): void => {
              this.openPage('distributed/pages/DistributedDataHome');
            })
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor($r('app.color.page_background'))
  }

  private openPage(url: string): void {
    this.getUIContext().getRouter().pushUrl({ url: url }).catch((error: BusinessError): void => {
      Logger.error(`Failed to open ${url}: ${error.code}, ${error.message}`);
    });
  }
}
