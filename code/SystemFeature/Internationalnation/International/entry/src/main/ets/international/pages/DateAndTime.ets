/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import i18n from '@ohos.i18n';
import router from '@ohos.router';
import systemTime from '@ohos.systemDateTime';
import IntlUtil from '../../utils/IntlUtil';
import Logger from '../../utils/Logger';
import TitleBar from '../../components/TitleBar';

const TAG: string = 'DateAndTime';

export class TimeZoneInfo {
  key: string = '';
  timeZone: string = '';
  display: Resource | undefined = undefined;
}

@Entry
@Component
struct DateAndTime {
  private intervalId: number = -1;
  @State is24Hours: boolean = false;
  @State date: string = '';
  @State time: string = '';
  @State timeZone: string = '';

  aboutToAppear() {
    this.is24Hours = i18n.System.is24HourClock();
  }

  onPageShow() {
    this.getTimeDisplay();
    this.intervalId = setInterval(() => {
      this.getTimeDisplay();
    }, 1000);
  }

  onPageHide() {
    clearInterval(this.intervalId);
  }

  async getTimeDisplay() {
    let timeZone = await systemTime.getTimezone();
    let zone = i18n.getTimeZone(timeZone);
    this.timeZone = IntlUtil.getTimeZoneString(zone);
    let timeInfo = IntlUtil.getDateString();
    this.date = timeInfo[0];
    this.time = timeInfo[1];
  }

  @Builder
  Hours24View() {
    Row() {
      Text($r('app.string.hours_24'))
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
      Toggle({ type: ToggleType.Switch, isOn: this.is24Hours })
        .margin({ top: 20, bottom: 20 })
        .onChange((isOn: boolean) => {
          this.is24Hours = !this.is24Hours;
          Logger.info(TAG, `set24HourClock result = ${i18n.System.set24HourClock(this.is24Hours)}`);
          this.getTimeDisplay();
        })
    }
    .width('95%')
    .padding(10)
    .margin({ top: 20, bottom: 10 })
    .backgroundColor($r('app.color.white'))
    .border({ color: $r('app.color.white'), width: 1, radius: 15 })
  }

  @Builder
  TimeView($$: Data) {
    if ($$.isDivider) {
      Divider()
        .color($r('app.color.divider'))
        .width('100%')
        .strokeWidth(1)
        .margin({ top: 10, bottom: 10 })
    }
    Row() {
      Text($$.key)
        .fontSize(22)
      Blank()
      Text($$.value)
        .fontSize(22)
      Image($r('app.media.more'))
        .width(15).height(50)
        .objectFit(ImageFit.Contain)
        .margin({ left: 10 })
    }
    .width('100%')
    .margin(10)
    .onClick($$.handleClick)
  }

  build() {
    Column() {
      TitleBar({ hasBackPress: true, title: $r('app.string.date_time') })
      Scroll() {
        Column() {
          this.Hours24View()
          Column() {
            this.TimeView({
              key: $r('app.string.date'),
              value: this.date,
              isDivider: false,
              handleClick: () => {
                DatePickerDialog
                  .show({
                    lunar: false,
                    onAccept: (result: DatePickerResult) => {
                      Logger.info(TAG, `DatePicker onAccept,year：${result.year}`);
                      let date = new Date();
                      date.setFullYear(result.year, result.month, result.day);
                      systemTime.setDate(date, () => {
                        Logger.info(TAG, `setDate finish`)
                        this.getTimeDisplay()
                      });
                    }
                  })
              }
            })
            this.TimeView({
              key: $r('app.string.time'),
              value: this.time,
              isDivider: true,
              handleClick: () => {
                TimePickerDialog.show({
                  useMilitaryTime: this.is24Hours,
                  onAccept: (result: TimePickerResult) => {
                    Logger.info(TAG, 'DatePicker onAccept');
                    let date = new Date();
                    date.setHours(result.hour, result.minute);
                    systemTime.setTime(date.getTime(), () => {
                      Logger.info(TAG, `setTime finish`)
                      this.getTimeDisplay()
                    });
                  }
                })
              }
            })
            this.TimeView({
              key: $r('app.string.time_zone'),
              value: this.timeZone,
              isDivider: true,
              handleClick: () => {
                router.pushUrl({
                  url: 'international/pages/TimeZone'
                });
              }
            })
          }
          .width('95%')
          .padding(10)
          .margin({ top: 20, bottom: 10 })
          .backgroundColor($r('app.color.white'))
          .border({ color: $r('app.color.white'), width: 1, radius: 15 })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.f5f5f5'))
  }
}

class Data {
  key: Resource | undefined = undefined;
  value: string = '';
  isDivider: boolean = false;
  handleClick: (event: ClickEvent) => void = () => {};
}