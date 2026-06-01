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
// [Start MakeObservedArray]
import { Button, ClickEvent, Column, Component, Entry, Text, UIUtils } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  arr: int[] = UIUtils.makeObserved([0, 1, 2]);

  build() {
    Column() {
      Text(`${this.arr}`)
        .fontSize(20)
        .margin(10)
      // 修改数组元素，触发UI刷新
      Button(`change arr[0]: ${this.arr[0]}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.arr[0]++;
        })
      // 新增数组元素，触发UI刷新
      Button(`push item: ${this.arr.length}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.arr.push(Double.toInt(this.arr.length));
        })
      // 删除数组元素，触发UI刷新
      Button(`pop item`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.arr.pop();
        })
      // 翻转数组元素，触发UI刷新
      Button(`reverse`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.arr.reverse();
        })
    }
    .width('100%')
  }
}

// [End MakeObservedArray]

@Builder
export function makeObservedArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.make_observed_array_title'))
}