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
      Button(`change arr[0]: ${this.arr[0]}`).onClick((e: ClickEvent) => {
        this.arr[0]++;
      })
      Button(`push item: ${this.arr.length}`).onClick((e: ClickEvent) => {
        this.arr.push(Double.toInt(this.arr.length));
      })
      Button(`pop item`).onClick((e: ClickEvent) => {
        this.arr.pop();
      })
      Button(`reverse`).onClick((e: ClickEvent) => {
        this.arr.reverse();
      })
    }
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