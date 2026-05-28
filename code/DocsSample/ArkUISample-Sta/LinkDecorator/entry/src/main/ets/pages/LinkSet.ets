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
// [Start LinkSet]
import { Button, ClickEvent, Column, Component, Divider, Entry, ForEach, Link, Row, State, Text } from '@kit.ArkUI';

@Component
struct Child {
  @Link message: Set<int>;

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [int, int]) => {
        Text(`${item[0]}`).fontSize(30)
        Divider()
      })
      Button('child init set').onClick((e: ClickEvent) => {
        this.message = new Set<int>([0, 1, 2, 3, 4]);
      })
      Button('child set new one').onClick((e: ClickEvent) => {
        this.message.add(5);
      })
    }
    .width('100%')
  }
}

@Entry
@Component
struct SetSample {
  @State message: Set<int> = new Set<int>([0, 1, 2, 3, 4]);

  build() {
    Row() {
      Column() {
        Child({ message: this.message })
        Button('parent clear').onClick((e: ClickEvent) => {
          this.message.clear();
        })
        Button('parent delete the first one').onClick((e: ClickEvent) => {
          this.message.delete(0);
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End LinkSet]

@Builder
export function linkSet(): void {
  NavDestination() {
    SetSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_set_title'))
}