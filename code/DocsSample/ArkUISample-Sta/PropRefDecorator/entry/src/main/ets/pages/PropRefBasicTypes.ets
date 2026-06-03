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
// [Start PropRefBasicTypes]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State count: number = 0;
  @State message: string = 'Hello';
  @State flag: boolean = false;
  build() {
    Column() {
      Text(`State ${this.count}`)
        .fontSize(20)
        .margin(10)
      Text(`State ${this.message}`)
        .fontSize(20)
        .margin(10)
      Text(`State ${this.flag}`)
        .fontSize(20)
        .margin(10)
      Button('change State')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 对数据源的更改会同步给子组件
          this.count++;
          this.message += ' World';
          this.flag = !this.flag;
      })
      Child({
        count: this.count,
        message: this.message,
        flag: this.flag
      })
    }
    .width('100%')
  }
}
@Component
struct Child {
  @PropRef count: number;
  @PropRef message: string;
  @PropRef flag: boolean;
  build() {
    Column() {
      Text(`PropRef ${this.count}`)
        .fontSize(20)
        .margin(10)
      Text(`PropRef ${this.message}`)
        .fontSize(20)
        .margin(10)
      Text(`PropRef ${this.flag}`)
        .fontSize(20)
        .margin(10)
      Button('change PropRef')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.count++;
          this.message += '!';
          this.flag = !this.flag;
        })
    }
    .width('100%')
  }
}
// [End PropRefBasicTypes]

@Builder
export function propRefBasicTypes(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_basic_types_title'))
}