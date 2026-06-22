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
// [Start LinkMap]
import { Button, ClickEvent, Column, Component, Divider, Entry, ForEach, Link, Row, State, Text } from '@kit.ArkUI';
@Component
struct Child {
  @Link value: Map<int, string>;

  build() {
    Column() {
      ForEach(Array.from(this.value.entries()), (item: [int, string]) => {
        Text(`${item[0]}`)
          .fontSize(20)
          .margin(10)
        Text(`${item[1]}`)
          .fontSize(20)
          .margin(10)
        Divider()
      })
      Button('child replace the first one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 更新键值对，触发UI刷新
          this.value.set(0, 'aa');
      })
      Button('child delete the first one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 删除键值对，触发UI刷新
          this.value.delete(0);
      })
    }
    .width('100%')
  }
}

@Entry
@Component
struct MapSample {
  @State message: Map<int, string> = new Map<int, string>([[0, 'a'], [1, 'b'], [2, 'c']]);

  build() {
    Row() {
      Column() {
        Child({ value: this.message })
        Button('parent init one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message = new Map<int, string>([[0, 'a'], [1, 'b'], [2, 'c']]);
        })
        Button('parent set new one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 新增键值对，触发UI刷新
            this.message.set(3, 'd');
        })
        Button('parent clear')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            // 清空Map，触发UI刷新
            this.message.clear();
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End LinkMap]

@Builder
export function linkMap(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_map_title'))
}