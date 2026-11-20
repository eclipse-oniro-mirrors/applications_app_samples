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
import { SendableArrayManager } from '../SendableArrayManager';

@Entry
@Component
struct SendableArrayHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: SendableArrayManager = new SendableArrayManager();

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
      Text($r('app.string.array_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('array_page_title')
      Text($r('app.string.array_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_array_create'))
          this.buttonRow($r('app.string.create_number_array'),
            (): void => this.runSync((): string => this.manager.createNumberArray(10)),
            $r('app.string.create_string_array'),
            (): void => this.runSync((): string => this.manager.createStringArray(8)))
          this.buttonRow($r('app.string.create_from_array'),
            (): void => this.runSync((): string => this.manager.createFromArray([5, 3, 8, 1, 9, 2])),
            $r('app.string.create_from_strings'),
            (): void => this.runSync((): string => this.manager.createFromStringArray(['hello', 'world', 'sendable'])))

          this.sectionTitle($r('app.string.section_array_element'))
          this.buttonRow($r('app.string.set_number_element'),
            (): void => this.runSync((): string => this.manager.setNumberElement(0, 42)),
            $r('app.string.get_number_element'),
            (): void => this.runSync((): string => this.manager.getNumberElement(0)))
          this.buttonRow($r('app.string.set_string_element'),
            (): void => this.runSync((): string => this.manager.setStringElement(0, 'updated')),
            $r('app.string.get_string_element'),
            (): void => this.runSync((): string => this.manager.getStringElement(0)))
          this.actionButton($r('app.string.swap_elements'),
            (): void => this.runSync((): string => this.manager.swapElements(0, 1)))

          this.sectionTitle($r('app.string.section_array_batch'))
          this.buttonRow($r('app.string.fill_number'),
            (): void => this.runSync((): string => this.manager.fillNumberArray(7)),
            $r('app.string.fill_string'),
            (): void => this.runSync((): string => this.manager.fillStringArray('test')))
          this.buttonRow($r('app.string.sort_array'),
            (): void => this.runSync((): string => this.manager.sortNumberArray()),
            $r('app.string.reverse_array'),
            (): void => this.runSync((): string => this.manager.reverseArray()))
          this.buttonRow($r('app.string.slice_number'),
            (): void => this.runSync((): string => this.manager.sliceNumberArray(0, 5)),
            $r('app.string.slice_string'),
            (): void => this.runSync((): string => this.manager.sliceStringArray(0, 4)))

          this.sectionTitle($r('app.string.section_array_search'))
          this.buttonRow($r('app.string.find_number_index'),
            (): void => this.runSync((): string => this.manager.findNumberIndex(8)),
            $r('app.string.contains_number'),
            (): void => this.runSync((): string => this.manager.containsNumber(3)))
          this.buttonRow($r('app.string.filter_greater'),
            (): void => this.runSync((): string => this.manager.filterNumberGreaterThan(4)),
            $r('app.string.filter_less'),
            (): void => this.runSync((): string => this.manager.filterNumberLessThan(4)))
          this.buttonRow($r('app.string.sum_array'),
            (): void => this.runSync((): string => this.manager.sumNumberArray()),
            $r('app.string.average_array'),
            (): void => this.runSync((): string => this.manager.averageNumber()))
          this.buttonRow($r('app.string.min_number'),
            (): void => this.runSync((): string => this.manager.minNumber()),
            $r('app.string.max_number'),
            (): void => this.runSync((): string => this.manager.maxNumber()))

          this.sectionTitle($r('app.string.section_array_convert'))
          this.buttonRow($r('app.string.to_json'),
            (): void => this.runSync((): string => this.manager.toJSON()),
            $r('app.string.get_metadata'),
            (): void => this.runSync((): string => this.manager.getMetadata()))
          this.buttonRow($r('app.string.show_array_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()),
            $r('app.string.reset_array_stats'),
            (): void => this.runSync((): string => this.manager.resetStatistics()))
          this.actionButton($r('app.string.clear_array'),
            (): void => this.runSync((): string => this.manager.clearArray()))
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
