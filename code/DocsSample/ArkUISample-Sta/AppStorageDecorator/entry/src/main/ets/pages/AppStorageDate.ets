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
// [Start AppStorageDate]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct DateSample {
  @StorageLink('date') selectedDate: Date = new Date('2021-08-08');

  build() {
    Column() {
      Text(`${this.selectedDate}`)
      Button('set selectedDate to 2023-07-08')
        .margin(10)
        .onClick((e: ClickEvent) => {
          AppStorage.setOrCreate('date', new Date('2023-07-08'));
        })
      Button('increase the year by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
        })
      Button('increase the month by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1);
        })
      Button('increase the day by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1);
        })
    }.width('100%')
  }
}
// [End AppStorageDate]

@Builder
export function appStorageDate(): void {
  NavDestination() {
    DateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.app_storage_date_title'))
}