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

import { DateMode, DatePickerComponent, DisplayMode, TimeFormat } from '@ohos.arkui.advanced.DatePickerComponent';
import { router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PickerUtils } from '../utils/PickerUtils';
import { PickerConstants } from '../utils/Constants';

/** DatePicker sample page. */
@Entry
@Component
struct DatePickerDemo {
  @State widthVp: number = 0;
  @State mode: string = 'date';
  @State dateResult: string = 'none';
  @State timeResult: string = 'none';
  @State dateTimeResult: string = 'none';
  @State lunar: boolean = false;
  @State loop: boolean = false;
  @State military: boolean = true;
  @State seconds: boolean = false;

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('DatePickerDemo');
    Logger.event('DatePickerDemo', 'config', PickerUtils.describeConfig(this.lunar, this.loop, this.military, this.seconds));
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('DatePickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('DatePickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('DatePickerDemo');
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('dateBack')
          .onClick(() => {
            Logger.event('DatePickerDemo', 'back');
            router.back();
          })
        Text($r('app.string.date_title'))
          .id('dateTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Row({ space: 8 }) {
        Button($r('app.string.mode_date')).id('dateModeDate').onClick(() => {
          this.mode = 'date';
          Logger.event('DatePickerDemo', 'mode', 'date');
        })
        Button($r('app.string.mode_time')).id('dateModeTime').onClick(() => {
          this.mode = 'time';
          Logger.event('DatePickerDemo', 'mode', 'time');
        })
        Button($r('app.string.mode_datetime')).id('dateModeDateTime').onClick(() => {
          this.mode = 'datetime';
          Logger.event('DatePickerDemo', 'mode', 'datetime');
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Row({ space: 6 }) {
        Button('Lunar').id('dpLunar').onClick(() => {
          this.lunar = !this.lunar;
          Logger.event('DatePickerDemo', 'lunar', `${this.lunar}`);
        })
        Button('Loop').id('dpLoop').onClick(() => {
          this.loop = !this.loop;
          Logger.event('DatePickerDemo', 'loop', `${this.loop}`);
        })
        Button('24h').id('dpMilitary').onClick(() => {
          this.military = !this.military;
          Logger.event('DatePickerDemo', 'military', `${this.military}`);
        })
        Button('Seconds').id('dpSeconds').onClick(() => {
          this.seconds = !this.seconds;
          Logger.event('DatePickerDemo', 'seconds', `${this.seconds}`);
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Text(PickerUtils.describeConfig(this.lunar, this.loop, this.military, this.seconds))
        .id('dateConfig')
        .fontSize(12)
        .fontColor('#666666')

      if (this.mode === 'date') {
        Column() {
          DatePickerComponent({
            options: {
              displayMode: DisplayMode.DATE,
              dateOptions: {
                mode: DateMode.DATE,
                lunar: this.lunar,
                loop: this.loop,
                selected: new Date(),
                start: PickerConstants.START_DATE,
                end: PickerConstants.END_DATE,
                onChange: (result) => {
                  this.dateResult = PickerUtils.formatDateParts(result.year, result.month, result.day);
                  Logger.event('DatePickerDemo', 'dateChange', this.dateResult);
                },
                onScrollStop: (result) => {
                  this.dateResult = PickerUtils.formatDateParts(result.year, result.month, result.day);
                  Logger.event('DatePickerDemo', 'dateScrollStop', this.dateResult);
                }
              }
            }
          })
            .id('datePicker')
            .height(220)
        }
        .width('100%')
        .height(240)

        Text(`date=${this.dateResult}`)
          .id('dateResult')
          .fontSize(13)
      } else if (this.mode === 'time') {
        Column() {
          DatePickerComponent({
            options: {
              displayMode: DisplayMode.TIME,
              timeOptions: {
                format: this.seconds ? TimeFormat.HOUR_MINUTE_SECOND : TimeFormat.HOUR_MINUTE,
                useMilitaryTime: this.military,
                loop: this.loop,
                onChange: (result) => {
                  this.timeResult = PickerUtils.formatTimeParts(result.hour, result.minute, result.second);
                  Logger.event('DatePickerDemo', 'timeChange', this.timeResult);
                },
                onScrollStop: (result) => {
                  this.timeResult = PickerUtils.formatTimeParts(result.hour, result.minute, result.second);
                  Logger.event('DatePickerDemo', 'timeScrollStop', this.timeResult);
                }
              }
            }
          })
            .id('timePicker')
            .height(220)
        }
        .width('100%')
        .height(240)

        Text(`time=${this.timeResult}`)
          .id('timeResult')
          .fontSize(13)
      } else {
        Column() {
          DatePickerComponent({
            options: {
              displayMode: DisplayMode.DATE_TIME,
              dateOptions: {
                mode: DateMode.DATE,
                lunar: this.lunar,
                loop: this.loop,
                onChange: (result) => {
                  this.dateTimeResult = PickerUtils.formatDateParts(result.year, result.month, result.day);
                  Logger.event('DatePickerDemo', 'dateTimeChange', this.dateTimeResult);
                }
              },
              timeOptions: {
                format: this.seconds ? TimeFormat.HOUR_MINUTE_SECOND : TimeFormat.HOUR_MINUTE,
                useMilitaryTime: this.military,
                loop: this.loop,
                onChange: (result) => {
                  this.dateTimeResult =
                    `${this.dateTimeResult} ${PickerUtils.formatTimeParts(result.hour, result.minute, result.second)}`;
                  Logger.event('DatePickerDemo', 'dateTimeChange', this.dateTimeResult);
                }
              }
            }
          })
            .id('dateTimePicker')
            .height(260)
        }
        .width('100%')
        .height(280)

        Text(`datetime=${this.dateTimeResult}`)
          .id('dateTimeResult')
          .fontSize(13)
      }

      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .constraintSize({ maxWidth: BreakpointUtils.contentMaxWidth(this.widthVp) })
    .alignSelf(ItemAlign.Center)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
