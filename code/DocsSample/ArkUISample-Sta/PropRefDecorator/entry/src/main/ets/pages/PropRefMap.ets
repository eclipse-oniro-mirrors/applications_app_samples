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
// [Start PropRefMap]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State map: Map<int, int> = new Map<int, int>([[0, 0], [1, 1], [2, 2]]);
  build() {
    Column() {
      Child({ map: this.map })
    }
    .width('100%')
  }
}
@Component
struct Child {
  @PropRef map: Map<int, int>;
  build() {
    Column() {
      Text(`${this.map}`)
        .fontSize(20)
        .margin(10)
      Button(`change map[0]: ${this.map.get(0)}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 更新键值对，触发UI刷新
          this.map.set(0, this.map.get(0)! + 1);
      })
      Button(`add item: ${this.map.size}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 新增键值对，触发UI刷新
          this.map.set(this.map.size, this.map.size);
      })
    }
    .width('100%')
  }
}
// [End PropRefMap]

@Builder
export function propRefMap(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_map_title'))
}