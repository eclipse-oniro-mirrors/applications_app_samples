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
import { DataMigrationManager } from '../DataMigrationManager';

@Entry
@Component
struct DataMigrationHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: DataMigrationManager = new DataMigrationManager();

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
      Text($r('app.string.migration_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('migration_page_title')
      Text($r('app.string.migration_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_migration_init'))
          this.actionButton($r('app.string.init_migration'),
            (): void => this.runSync((): string => this.manager.initialize(1)))

          this.sectionTitle($r('app.string.section_migration_version'))
          this.buttonRow($r('app.string.get_current_version'),
            (): void => this.runSync((): string => `currentVersion=${this.manager.getCurrentVersion()}`),
            $r('app.string.get_target_version'),
            (): void => this.runSync((): string => `targetVersion=${this.manager.getTargetVersion()}`))
          this.actionButton($r('app.string.get_status'),
            (): void => this.runSync((): string => this.manager.getStatusString()))

          this.sectionTitle($r('app.string.section_migration_steps'))
          this.buttonRow($r('app.string.register_step_1_2'),
            (): void => this.runSync((): string =>
              this.manager.registerMigrationStep(1, 2, 'Add user preferences table')),
            $r('app.string.register_step_2_3'),
            (): void => this.runSync((): string =>
              this.manager.registerMigrationStep(2, 3, 'Add encryption support')))
          this.buttonRow($r('app.string.register_step_3_4'),
            (): void => this.runSync((): string =>
              this.manager.registerMigrationStep(3, 4, 'Add distributed sync')),
            $r('app.string.get_version_history'),
            (): void => this.runSync((): string => this.manager.getVersionHistory()))

          this.sectionTitle($r('app.string.section_migration_execute'))
          this.buttonRow($r('app.string.migrate_async'),
            (): void => this.runAsync((): Promise<string> => this.manager.migrate(3)),
            $r('app.string.migrate_sync'),
            (): void => this.runSync((): string => this.manager.migrateSync(4)))
          this.actionButton($r('app.string.rollback'),
            (): void => this.runSync((): string => this.manager.rollback(2)))

          this.sectionTitle($r('app.string.section_migration_strategy'))
          this.buttonRow($r('app.string.get_strategy'),
            (): void => this.runSync((): string => this.manager.getMigrationStrategy()),
            $r('app.string.set_auto_migrate'),
            (): void => this.runSync((): string => this.manager.setAutoMigrate(true)))
          this.buttonRow($r('app.string.get_migration_log'),
            (): void => this.runSync((): string => this.manager.getMigrationLog()),
            $r('app.string.show_migration_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()))
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

  private runAsync(action: () => Promise<string>): void {
    action().then((message: string): void => {
      this.result = message;
    }).catch((error: BusinessError): void => {
      this.showError(error);
    });
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
