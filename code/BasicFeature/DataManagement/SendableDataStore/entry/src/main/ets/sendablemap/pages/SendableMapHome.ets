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
import { SendableMapManager } from '../SendableMapManager';
import { MapEntry, DataType } from '../../models/DataModels';

@Entry
@Component
struct SendableMapHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: SendableMapManager = new SendableMapManager();

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
      Text($r('app.string.map_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('map_page_title')
      Text($r('app.string.map_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_map_create'))
          this.actionButton($r('app.string.initialize_map'),
            (): void => this.runSync((): string => this.manager.initialize(64)))

          this.sectionTitle($r('app.string.section_map_crud'))
          this.buttonRow($r('app.string.put_string_entry'),
            (): void => this.runSync((): string => this.manager.putString('name', 'SendableMap')),
            $r('app.string.get_entry'),
            (): void => this.runSync((): string => this.manager.get('name')))
          this.buttonRow($r('app.string.put_number_entry'),
            (): void => this.runSync((): string => this.manager.putNumber('count', 42)),
            $r('app.string.get_with_type'),
            (): void => this.runSync((): string => this.manager.getWithType('count')))
          this.buttonRow($r('app.string.put_boolean_entry'),
            (): void => this.runSync((): string => this.manager.putBoolean('active', true)),
            $r('app.string.has_entry'),
            (): void => this.runSync((): string => this.manager.has('active')))
          this.buttonRow($r('app.string.remove_entry'),
            (): void => this.runSync((): string => this.manager.remove('active')),
            $r('app.string.get_value'),
            (): void => this.runSync((): string => this.manager.getValue('name')))

          this.sectionTitle($r('app.string.section_map_batch'))
          this.buttonRow($r('app.string.put_all_entries'),
            (): void => this.runSync((): string => {
              const e1: MapEntry = { key: 'batch_a', value: 'val_a', dataType: DataType.STRING, updatedAt: 0 };
              const e2: MapEntry = { key: 'batch_b', value: 'val_b', dataType: DataType.STRING, updatedAt: 0 };
              return this.manager.putAll([e1, e2]);
            }),
            $r('app.string.get_all_entries'),
            (): void => this.runSync((): string => this.manager.getAll(['batch_a', 'batch_b', 'name'])))
          this.buttonRow($r('app.string.remove_all_entries'),
            (): void => this.runSync((): string => this.manager.removeAll(['batch_a', 'batch_b'])),
            $r('app.string.clear_map'),
            (): void => this.runSync((): string => this.manager.clear()))

          this.sectionTitle($r('app.string.section_map_traverse'))
          this.buttonRow($r('app.string.all_keys'),
            (): void => this.runSync((): string => this.manager.allKeys()),
            $r('app.string.all_values'),
            (): void => this.runSync((): string => this.manager.allValues()))
          this.buttonRow($r('app.string.all_entries'),
            (): void => this.runSync((): string => this.manager.allEntries()),
            $r('app.string.for_each'),
            (): void => this.runSync((): string => this.manager.forEach()))
          this.buttonRow($r('app.string.filter_by_type'),
            (): void => this.runSync((): string => this.manager.filterByType(DataType.STRING)),
            $r('app.string.filter_by_prefix'),
            (): void => this.runSync((): string => this.manager.filterByKeyPrefix('batch_')))

          this.sectionTitle($r('app.string.section_map_convert'))
          this.buttonRow($r('app.string.to_json_object'),
            (): void => this.runSync((): string => this.manager.toJSONObject()),
            $r('app.string.to_json_typed'),
            (): void => this.runSync((): string => this.manager.toJSONTyped()))
          this.buttonRow($r('app.string.show_map_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()),
            $r('app.string.reset_map_stats'),
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
