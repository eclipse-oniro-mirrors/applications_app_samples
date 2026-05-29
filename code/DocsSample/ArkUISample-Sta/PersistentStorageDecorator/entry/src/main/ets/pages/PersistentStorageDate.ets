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
// [Start PersistentStorageDate]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Observed, PersistentStorage, StorageLink, Text } from '@kit.ArkUI';

@Entry
@Component
struct DateSample {
  success: boolean = PersistentStorage.persistProp<Date>('date', new Date(),
    (date: Date): jsonx.JsonElement => {
      const root = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      const dateEle = new jsonx.JsonElement({} as Record<string, jsonx.JsonElement>);
      dateEle.setString(date.toString());
      root.setElement('date', dateEle);
      return root;
    }, 
    (json: jsonx.JsonElement): Date => {
      let date: Date = new Date(json.getElement('date').asString());
      return date;
    }
  );
  @StorageLink('date') date: Date = new Date();

  build() {
    Column() {
      Text(`${this.date}`)
        .fontSize(20)
        .margin(10)
      Button(`change update`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.date = new Date('2023-09-09');
        })
      Button('increase the year by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.date.setFullYear(this.date.getFullYear() + 1);
        })
      Button('increase the month by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.date.setMonth(this.date.getMonth() + 1);
        })
      Button('parent increase the day by 1')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.date.setDate(this.date.getDate() + 1);
        })
      Button(`map change by appStorage:`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          let date = new Date();
          if (AppStorage.has('date')) {
            AppStorage.set<Date>('date', date);
          }
        })
    }
    .width('100%')
  }
}

// [End PersistentStorageDate]

@Builder
export function persistentStorageDate(): void {
  NavDestination() {
    DateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_date_title'))
}