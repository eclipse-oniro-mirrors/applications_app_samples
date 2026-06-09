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
// [Start ParamArrayVariable]
import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Param, Require, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Local arr: int[] = [0, 1, 2];
  build() {
    Column() {
      Text(`Local ${this.arr}`)
        .fontSize(20)
        .margin(10)
      Button(`change arr[0]: ${this.arr[0]}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
        // 修改数组元素，变化可观察到
        this.arr[0]++;
      })
      Button(`push item: ${this.arr.length}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
        // 通过push API修改数组，变化可观察到
        this.arr.push(Double.toInt(this.arr.length));
      })
      Button(`pop item`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
        this.arr.pop();
      })
      Button(`reverse`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
        this.arr.reverse();
      })
      Button(`reset`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
        // 对数组整体赋值，变化可观察到
        this.arr = [0, 1, 2];
      })
      Child({ arr: this.arr })
    }
    .width('100%')
  }
}
@ComponentV2
struct Child {
  @Require @Param arr: int[];
  build() {
    Column() {
    Text(`Param ${this.arr}`)
      .fontSize(20)
      .margin(10)
    }
    .width('100%')
  }
}

// [End ParamArrayVariable]

@Builder
export function paramArrayVariable(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.param_array_variable_title'))
}