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
// [Start MakeObservedMap]
import { Button, ClickEvent, Column, Component, Divider, Entry, ForEach, Row, Text, UIUtils } from '@kit.ArkUI';

@Entry
@Component
struct MapSample {
  message: Map<int, string> = UIUtils.makeObserved(new Map<int, string>([[0, 'a'], [1, 'b'], [3, 'c']]));

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [int, string]) => {
          Text(`${item[0]}`)
            .fontSize(20)
            .margin(10)
          Text(`${item[1]}`)
            .fontSize(20)
            .margin(10)
          Divider()
        })
        // 新增键值对，触发UI刷新
        Button('set new one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message.set(4, 'd');
          })
        // 更新键值对，触发UI刷新
        Button('replace the first one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message.set(0, 'aa');
          })
        // 删除键值对，触发UI刷新
        Button('delete the first one')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message.delete(0);
          })
        // 清空Map，触发UI刷新
        Button('clear')
          .width(300)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.message.clear();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

// [End MakeObservedMap]

@Builder
export function makeObservedMap(): void {
  NavDestination() {
    MapSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.make_observed_map_title'))
}