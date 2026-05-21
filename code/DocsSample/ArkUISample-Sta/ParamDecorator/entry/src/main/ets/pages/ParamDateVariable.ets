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

import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Param, Text } from '@kit.ArkUI';

@ComponentV2
struct DateComponent {
  @Param selectedDate: Date = new Date('2024-01-01');

  build() {
    Column() {
      Text(`${this.selectedDate}`)
    }
  }
}

@Entry
@ComponentV2
struct ParentComponent {
  @Local parentSelectedDate: Date = new Date('2021-08-08');

  build() {
    Column() {
      Button('parent update the new date')
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 对Date整体赋值，变化可观察到
          this.parentSelectedDate = new Date('2023-07-07');
        })
      Button('increase the year by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 通过setFullYear API修改Date，变化可观察到
          this.parentSelectedDate.setFullYear(this.parentSelectedDate.getFullYear() + 1);
        })
      Button('increase the month by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.parentSelectedDate.setMonth(this.parentSelectedDate.getMonth() + 1);
        })
      Button('parent increase the day by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.parentSelectedDate.setDate(this.parentSelectedDate.getDate() + 1);
        })
      DateComponent({ selectedDate: this.parentSelectedDate })
    }
  }
}