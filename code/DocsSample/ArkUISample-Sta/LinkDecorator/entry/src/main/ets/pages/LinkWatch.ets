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
// [Start LinkWatch]
import { Button, ClickEvent, Column, Component, Entry, Link, State, Text, Watch } from '@kit.ArkUI';

@Entry
@Component
struct Parent {
  @State sourceNumber: int = 0;

  build() {
    Column() {
      Text(`父组件的sourceNumber：` + this.sourceNumber)
        .fontSize(20)
        .margin(10)
      Child({ sourceNumber: this.sourceNumber })
      Button('父组件更改sourceNumber')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.sourceNumber++;
        })
    }
    .width('100%')
  }
}

@Component
struct Child {
  @State memberMessage: string = 'Hello World';
  @Link @Watch('onSourceChange') sourceNumber: int;

  onSourceChange(propertyName: string) {
    // 给memberMessage变量赋新的值
    this.memberMessage = this.sourceNumber.toString();
  }

  build() {
    Column() {
      Text(this.memberMessage)
        .fontSize(20)
        .margin(10)
      Text(`子组件的sourceNumber：` + this.sourceNumber.toString())
        .fontSize(20)
        .margin(10)
      Button('子组件更改memberMessage')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.memberMessage = 'Hello memberMessage';
        })
    }
    .width('100%')
  }
}
// [End LinkWatch]

@Builder
export function linkWatch(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_watch_title'))
}