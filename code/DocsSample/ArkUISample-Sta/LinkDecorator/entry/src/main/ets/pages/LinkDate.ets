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
// [Start LinkDate]
import { Button, ClickEvent, Column, Component, Entry, Link, State, Text } from '@kit.ArkUI';

@Component
struct DateComponent {
  @Link selectedDate: Date;

  build() {
    Column() {
      Text(`${this.selectedDate}`)
      Button('child increase the year by 1')
        .onClick((e: ClickEvent) => {
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
        })
      Button('child increace the day by 1')
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1);
        })
      Button('child update the new date')
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2023-09-09');
        })
    }
  }
}
@Entry
@Component
struct ParentComponent {
  @State parentSelectedDate: Date = new Date('2021-08-08');

  build() {
    Column() {
      Text(`${this.parentSelectedDate}`)
      Button('parent increase the month by 1')
        .onClick((e: ClickEvent) => {
          this.parentSelectedDate.setMonth(this.parentSelectedDate.getMonth() + 1);
        })
      Button('parent update the new date')
        .onClick((e: ClickEvent) => {
          this.parentSelectedDate = new Date('2023-07-07');
        })
      DateComponent({ selectedDate:this.parentSelectedDate })
    }
  }
}
// [End LinkDate]

@Builder
export function linkDate(): void {
  NavDestination() {
    ParentComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_date_title'))
}