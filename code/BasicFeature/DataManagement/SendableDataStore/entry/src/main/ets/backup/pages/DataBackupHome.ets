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
import { DataBackupManager } from '../DataBackupManager';
import { StoreType } from '../../models/DataModels';
import { ResultText } from '../../utils/ResultText';

@Entry
@Component
struct DataBackupHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: DataBackupManager = new DataBackupManager();

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
      Text($r('app.string.backup_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('backup_page_title')
      Text($r('app.string.backup_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_backup_init'))
          this.actionButton($r('app.string.init_backup'),
            (): void => this.runSync((): string => this.manager.initialize()))

          this.sectionTitle($r('app.string.section_backup_create'))
          this.buttonRow($r('app.string.create_pref_backup'),
            (): void => this.runSync((): string =>
              this.manager.createBackup('pref_backup_1', StoreType.PREFERENCES, 50)),
            $r('app.string.create_rdb_backup'),
            (): void => this.runSync((): string =>
              this.manager.createBackup('rdb_backup_1', StoreType.RDB, 120)))
          this.buttonRow($r('app.string.create_array_backup'),
            (): void => this.runSync((): string =>
              this.manager.createBackup('array_backup_1', StoreType.ARRAY, 30)),
            $r('app.string.create_map_backup'),
            (): void => this.runSync((): string =>
              this.manager.createBackup('map_backup_1', StoreType.MAP, 80)))

          this.sectionTitle($r('app.string.section_backup_restore'))
          this.buttonRow($r('app.string.restore_backup'),
            (): void => this.runSync((): string => this.manager.restoreBackup('pref_backup_1')),
            $r('app.string.delete_backup'),
            (): void => this.runSync((): string => this.manager.deleteBackup('array_backup_1')))

          this.sectionTitle($r('app.string.section_backup_info'))
          this.buttonRow($r('app.string.get_backup_info'),
            (): void => this.runSync((): string => this.manager.getBackupInfo('rdb_backup_1')),
            $r('app.string.list_backups'),
            (): void => this.runSync((): string => this.manager.listBackups()))
          this.buttonRow($r('app.string.latest_backup'),
            (): void => this.runSync((): string => this.manager.getLatestBackup()),
            $r('app.string.oldest_backup'),
            (): void => this.runSync((): string => this.manager.getOldestBackup()))
          this.buttonRow($r('app.string.verify_integrity'),
            (): void => this.runSync((): string => this.manager.verifyBackupIntegrity('pref_backup_1')),
            $r('app.string.total_size'),
            (): void => this.runSync((): string =>
              ResultText.ofArgs($r('app.string.result_backup_total_size'), [this.manager.getTotalBackupSize()],
                `totalSize=${this.manager.getTotalBackupSize()}`)))

          this.sectionTitle($r('app.string.section_backup_auto'))
          this.buttonRow($r('app.string.set_auto_backup'),
            (): void => this.runSync((): string => this.manager.setAutoBackup(true, 300000)),
            $r('app.string.check_auto_backup'),
            (): void => this.runSync((): string => this.manager.checkAutoBackup()))
          this.buttonRow($r('app.string.show_backup_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()),
            $r('app.string.reset_backup_stats'),
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
