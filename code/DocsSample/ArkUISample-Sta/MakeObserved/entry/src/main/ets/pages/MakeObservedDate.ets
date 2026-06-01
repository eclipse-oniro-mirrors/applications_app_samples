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
// [Start MakeObservedDate]
import { Button, ClickEvent, Column, Component, Entry, Text, UIUtils } from '@kit.ArkUI';

@Entry
@Component
struct DateExample {
  selectedDate: Date = UIUtils.makeObserved(new Date('2021-08-08'));

  build() {
    Column() {
      Text(`${this.selectedDate}`)
        .fontSize(20)
        .margin(10)
      // 调用Date的setFullYear接口修改年份，触发UI刷新
      Button('increase the year by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
        })
      // 调用Date的setMonth接口修改月份，触发UI刷新
      Button('increase the month by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1);
        })
      // 调用Date的setDate接口修改日期，触发UI刷新
      Button('increase the day by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1);
        })
    }
    .width('100%')
  }
}

// [End MakeObservedDate]

@Builder
export function makeObservedDate(): void {
  NavDestination() {
    DateExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.make_observed_date_title'))
}