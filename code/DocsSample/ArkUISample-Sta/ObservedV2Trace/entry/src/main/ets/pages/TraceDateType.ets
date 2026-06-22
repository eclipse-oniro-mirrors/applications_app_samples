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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start TraceDateType]
import { Button, Column, ComponentV2, DatePicker, Divider, Entry, ObservedV2, Trace } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace selectedDate: Date = new Date('2021-08-08')
}

@Entry
@ComponentV2
struct DateSample {
  info: Info = new Info()

  build() {
    Column() {
      Button('set selectedDate to 2023-07-08')
        .width(300)
        .margin(10)
        .onClick((e) => {
        // 通过给info.selectedDate重新赋值新的Date实例，触发UI刷新
        this.info.selectedDate = new Date('2023-07-08');
        })
      Button('increase the year by 1')
        .width(300)
        .margin(10)
        .onClick((e) => {
        // 调用Date的setFullYear接口修改年份，触发UI刷新
        this.info.selectedDate.setFullYear(this.info.selectedDate.getFullYear() + 1);
        })
      Button('increase the month by 1')
        .width(300)
        .margin(10)
        .onClick((e) => {
        // 调用Date的setMonth接口修改月份，触发UI刷新
        this.info.selectedDate.setMonth(this.info.selectedDate.getMonth() + 1);
        })
      Button('increase the day by 1')
        .width(300)
        .margin(10)
        .onClick((e) => {
        // 调用Date的setDate接口修改日期，触发UI刷新
        this.info.selectedDate.setDate(this.info.selectedDate.getDate() + 1);
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.info.selectedDate
      })
    }.width('100%')
  }
}

// [End TraceDateType]

@Builder
export function traceDateType(): void {
  NavDestination() {
    DateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_date_type_title'))
}