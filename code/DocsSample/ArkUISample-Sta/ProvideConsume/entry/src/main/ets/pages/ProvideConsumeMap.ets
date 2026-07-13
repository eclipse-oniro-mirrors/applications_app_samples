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
// [Start ProvideConsumeMap]
import { Button, ClickEvent, Column, Component, Consume, Divider, Entry, ForEach, Provide, Row, Text } from '@kit.ArkUI';
@Component
struct Child {
  @Consume message: Map<number, string>;

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`)
          .fontSize(20)
          .margin(10)
        Text(`${item[1]}`)
          .fontSize(20)
          .margin(10)
        Divider()
      })
      Button('Consume init Map')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.message = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);
      })
      Button('Consume set new one')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 新增键值对，触发UI刷新
          this.message.set(4, 'd');
      })
      Button('Consume clear')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 清空Map，触发UI刷新
          this.message.clear();
      })
      Button('Consume replace the first item')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 更新键值对，触发UI刷新
          this.message.set(0, 'aa');
      })
      Button('Consume delete the first item')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 删除键值对，触发UI刷新
          this.message.delete(0);
      })
    }
    .width('100%')
  }
}

@Entry
@Component
struct MapSample {
  @Provide message: Map<number, string> = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c']]);

  build() {
    Row() {
      Column() {
        Button('Provide init Map')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message = new Map<number, string>([[0, 'a'], [1, 'b'], [3, 'c'], [4, 'd']]);
        })
        Child()
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End ProvideConsumeMap]

@Builder
export function provideConsumeMap(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provide_consume_map_title'))
}