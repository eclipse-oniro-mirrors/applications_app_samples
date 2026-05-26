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
// [Start PropRefDate]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State date: Date = new Date('2021-08-08');
  build() {
    Column() {
      Child({ date: this.date })
    }
  }
}
@Component
struct Child {
  @PropRef date: Date;
  build() {
    Column() {
      Text(`${this.date}`)
      Button(`change update`).onClick((e: ClickEvent) => {
        this.date = new Date('2023-09-09');
      })
      Button('increase the year by 1').onClick((e: ClickEvent) => {
        this.date.setFullYear(this.date.getFullYear() + 1);
      })
      Button('increase the month by 1').onClick((e: ClickEvent) => {
        this.date.setMonth(this.date.getMonth() + 1);
      })
      Button('parent increase the day by 1').onClick((e: ClickEvent) => {
        this.date.setDate(this.date.getDate() + 1);
      })
    }
  }
}
// [End PropRefDate]

@Builder
export function propRefDate(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_date_title'))
}