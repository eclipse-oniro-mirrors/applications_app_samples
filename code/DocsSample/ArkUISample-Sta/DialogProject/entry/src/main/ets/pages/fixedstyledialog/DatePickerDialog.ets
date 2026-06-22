'use static'

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

import {
  Column,
  Button,
  Entry,
  Component,
  FontWeight,
  ResourceStr,
  NavDestination,
  ColumnOptions,
  $r
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0000;

// [Start date_picker_dialog]

@Entry
@Component
export struct DatePickerDialogExample {
  @State selectTime: Date = new Date('2023-12-25T08:30:00');

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {

        Column() {
          Button('showDatePickerDialog')
            .margin(30)
            .onClick(() => {
              this.getUIContext().showDatePickerDialog({
                start: new Date('2000-1-1'),
                end: new Date('2100-12-31'),
                selected: this.selectTime,
                lunarSwitch: true,
                showTime: true,
                onDateAccept: (value: Date): void => {
                  this.selectTime = value;
                  hilog.info(DOMAIN, 'testTag', 'DatePickerDialog:onAccept()' + JSON.stringify(value));
                },
              })
            })
        }.width('100%').margin({ top: 5 })

      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    // [StartExclude date_picker_dialog]
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.CustomDialog_date')替换为实际资源文件，在本示例中该资源文件的value值为"日期滑动选择器弹窗"
    .title($r('app.string.CustomDialog_date'))
    // [EndExclude date_picker_dialog]
  }
}
// [End date_picker_dialog]