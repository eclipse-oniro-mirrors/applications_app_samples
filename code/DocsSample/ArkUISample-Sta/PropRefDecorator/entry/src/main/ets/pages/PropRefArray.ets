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
// [Start PropRefArray]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State arr: int[] = [0, 1, 2];
  build() {
    Column() {
      Child({ arr: this.arr })
    }
    .width('100%')
  }
}
@Component
struct Child {
  @PropRef arr: int[];
  build() {
    Column() {
      Text(`${this.arr}`)
        .fontSize(20)
        .margin(10)
      Button(`change arr[0]: ${this.arr[0]}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 修改arr变量中元素的值，触发UI刷新
          this.arr[0]++;
      })
      Button(`push item: ${this.arr.length}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 向arr变量中添加元素，触发UI刷新
          this.arr.push(Double.toInt(this.arr.length));
      })
    }
    .width('100%')
  }
}
// [End PropRefArray]

@Builder
export function propRefArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_array_title'))
}