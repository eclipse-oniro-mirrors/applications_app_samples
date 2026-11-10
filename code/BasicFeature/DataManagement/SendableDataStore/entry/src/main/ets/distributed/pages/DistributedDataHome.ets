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
import { DistributedDataManager } from '../DistributedDataManager';
import { SyncMode, ConflictPolicy } from '../../models/DataModels';

@Entry
@Component
struct DistributedDataHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: DistributedDataManager = new DistributedDataManager();

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
      Text($r('app.string.distributed_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('distributed_page_title')
      Text($r('app.string.distributed_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_dist_init'))
          this.actionButton($r('app.string.init_distributed'),
            (): void => this.runSync((): string => this.manager.initialize()))

          this.sectionTitle($r('app.string.section_dist_crud'))
          this.buttonRow($r('app.string.put_data'),
            (): void => this.runSync((): string => this.manager.put('user_name', 'Alice')),
            $r('app.string.get_data'),
            (): void => this.runSync((): string => this.manager.get('user_name')))
          this.buttonRow($r('app.string.update_data'),
            (): void => this.runSync((): string => this.manager.put('user_name', 'Bob')),
            $r('app.string.delete_data'),
            (): void => this.runSync((): string => this.manager.delete('user_name')))
          this.buttonRow($r('app.string.has_data'),
            (): void => this.runSync((): string => `has('user_name')=${this.manager.has('user_name')}`),
            $r('app.string.get_all_keys'),
            (): void => this.runSync((): string => this.manager.getAllKeys()))

          this.sectionTitle($r('app.string.section_dist_device'))
          this.buttonRow($r('app.string.register_device_1'),
            (): void => this.runSync((): string =>
              this.manager.registerDevice('dev_001', 'Phone-A', 'phone')),
            $r('app.string.register_device_2'),
            (): void => this.runSync((): string =>
              this.manager.registerDevice('dev_002', 'Tablet-B', 'tablet')))
          this.buttonRow($r('app.string.list_devices'),
            (): void => this.runSync((): string => this.manager.listDevices()),
            $r('app.string.get_device_info'),
            (): void => this.runSync((): string => this.manager.getDeviceInfo('dev_001')))
          this.buttonRow($r('app.string.set_offline'),
            (): void => this.runSync((): string => this.manager.setDeviceConnected('dev_002', false)),
            $r('app.string.connected_count'),
            (): void => this.runSync((): string => `connected=${this.manager.getConnectedDevices()}`))

          this.sectionTitle($r('app.string.section_dist_sync'))
          this.buttonRow($r('app.string.sync_data'),
            (): void => this.runAsync((): Promise<string> => this.manager.sync()),
            $r('app.string.sync_status'),
            (): void => this.runSync((): string => this.manager.syncStatus()))
          this.buttonRow($r('app.string.set_sync_mode'),
            (): void => this.runSync((): string => this.manager.setSyncMode(SyncMode.REAL_TIME)),
            $r('app.string.get_sync_mode'),
            (): void => this.runSync((): string => `syncMode=${this.manager.getSyncMode()}`))

          this.sectionTitle($r('app.string.section_dist_conflict'))
          this.buttonRow($r('app.string.set_conflict_policy'),
            (): void => this.runSync((): string => this.manager.setConflictPolicy(ConflictPolicy.TIMESTAMP)),
            $r('app.string.get_conflicts'),
            (): void => this.runSync((): string => this.manager.getConflicts()))
          this.buttonRow($r('app.string.unresolved_conflicts'),
            (): void => this.runSync((): string => this.manager.getUnresolvedConflicts()),
            $r('app.string.show_dist_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()))
          this.actionButton($r('app.string.reset_dist_stats'),
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
