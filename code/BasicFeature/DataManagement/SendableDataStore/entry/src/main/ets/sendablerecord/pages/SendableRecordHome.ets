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
import { SendableRecordManager } from '../SendableRecordManager';
import { SchemaField, DataType } from '../../models/DataModels';

@Entry
@Component
struct SendableRecordHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: SendableRecordManager = new SendableRecordManager();

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
      Text($r('app.string.record_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('record_page_title')
      Text($r('app.string.record_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_record_create'))
          this.actionButton($r('app.string.create_record'),
            (): void => this.runSync((): string => {
              const f1: SchemaField = {
                name: 'userName', dataType: DataType.STRING,
                required: true, defaultValue: 'guest', maxLength: 64, min: 0, max: 64
              };
              const f2: SchemaField = {
                name: 'age', dataType: DataType.NUMBER,
                required: false, defaultValue: 0, maxLength: 0, min: 0, max: 200
              };
              const f3: SchemaField = {
                name: 'active', dataType: DataType.BOOLEAN,
                required: false, defaultValue: true, maxLength: 0, min: 0, max: 1
              };
              return this.manager.createRecord('UserProfile', [f1, f2, f3]);
            }))

          this.sectionTitle($r('app.string.section_record_field'))
          this.buttonRow($r('app.string.set_string_field'),
            (): void => this.runSync((): string => this.manager.setStringField('userName', 'Alice')),
            $r('app.string.get_string_field'),
            (): void => this.runSync((): string => this.manager.getStringField('userName')))
          this.buttonRow($r('app.string.set_number_field'),
            (): void => this.runSync((): string => this.manager.setNumberField('age', 25)),
            $r('app.string.get_number_field'),
            (): void => this.runSync((): string => this.manager.getNumberField('age')))
          this.buttonRow($r('app.string.set_boolean_field'),
            (): void => this.runSync((): string => this.manager.setBooleanField('active', false)),
            $r('app.string.get_boolean_field'),
            (): void => this.runSync((): string => this.manager.getBooleanField('active')))
          this.buttonRow($r('app.string.get_field'),
            (): void => this.runSync((): string => this.manager.getField('userName')),
            $r('app.string.get_all_fields'),
            (): void => this.runSync((): string => this.manager.getAllFields()))
          this.buttonRow($r('app.string.reset_field'),
            (): void => this.runSync((): string => this.manager.resetField('age')),
            $r('app.string.reset_all_fields'),
            (): void => this.runSync((): string => this.manager.resetAllFields()))
          this.buttonRow($r('app.string.set_defaults'),
            (): void => this.runSync((): string => this.manager.setDefaults()),
            $r('app.string.validate_required'),
            (): void => this.runSync((): string => this.manager.validateRequired()))

          this.sectionTitle($r('app.string.section_record_nested'))
          this.buttonRow($r('app.string.add_nested'),
            (): void => this.runSync((): string => this.manager.addNestedRecord('address', '{"city":"Shenzhen"}')),
            $r('app.string.get_nested'),
            (): void => this.runSync((): string => this.manager.getNestedRecord('address')))
          this.buttonRow($r('app.string.list_nested'),
            (): void => this.runSync((): string => this.manager.listNestedRecords()),
            $r('app.string.remove_nested'),
            (): void => this.runSync((): string => this.manager.removeNestedRecord('address')))

          this.sectionTitle($r('app.string.section_record_convert'))
          this.buttonRow($r('app.string.record_to_json'),
            (): void => this.runSync((): string => this.manager.toJSON()),
            $r('app.string.record_to_schema'),
            (): void => this.runSync((): string => this.manager.toSchemaJSON()))
          this.buttonRow($r('app.string.get_definition'),
            (): void => this.runSync((): string => this.manager.getDefinition()),
            $r('app.string.show_record_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()))
          this.actionButton($r('app.string.reset_record_stats'),
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
