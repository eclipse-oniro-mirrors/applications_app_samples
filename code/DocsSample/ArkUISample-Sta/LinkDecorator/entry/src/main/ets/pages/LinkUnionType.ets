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
// [Start LinkUnionType]
import { Button, ClickEvent, Column, Component, Entry, Link, State, Text } from '@kit.ArkUI';

@Component
struct Child {
  @Link name: string | undefined;

  build() {
    Column() {
      Button('Child change name to Bob')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.name = 'Bob';
        })
      Button('Child change name to undefined')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.name = undefined;
        })
    }.width('100%')
  }
}

@Entry
@Component
struct Index {
  @State name: string | undefined = 'Mary';

  build() {
    Column() {
      Text(`The name is  ${this.name}`) // 显示name变量的值
        .fontSize(20)
        .margin(10)
      Child({ name: this.name })
      Button('Parents change name to Peter')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.name = 'Peter';
        })
      Button('Parents change name to undefined')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.name = undefined;
        })
    }
    .width('100%')
  }
}
// [End LinkUnionType]

@Builder
export function linkUnionType(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_union_type_title'))
}