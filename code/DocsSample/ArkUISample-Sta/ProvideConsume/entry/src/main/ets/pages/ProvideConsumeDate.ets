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
// [Start ProvideConsumeDate]
import { Button, ClickEvent, Column, Component, Consume, Entry, Provide, Text } from '@kit.ArkUI';
@Component
struct Child {
  @Consume selectedDate: Date;

  build() {
    Column() {
      Text(`Provide: ${this.selectedDate}`)
      Button('child increase the day by 1')
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1);
        })
      Button('child update the new date')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2023-09-09');
        })
    }
  }
}

@Entry
@Component
struct Parent {
  @Provide selectedDate: Date = new Date('2021-08-08');

  build() {
    Column() {
      Text(`Provide: ${this.selectedDate}`)
      Button('parent increase the day by 1')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1);
        })
      Button('parent update the new date')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2023-07-07');
        })
      Child()
    }
  }
}
// [End ProvideConsumeDate]

@Builder
export function provideConsumeDate(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provide_consume_date_title'))
}