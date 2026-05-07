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
// [Start LocalArrayVariable]
import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Local arr: int[] = [0, 1, 2];

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
      Button(`reset`).onClick((e: ClickEvent) => {
        this.arr = [0, 1, 2];
      })
    }
  }
}

// [End LocalArrayVariable]

@Builder
export function localArrayVariable(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_array_variable_title'))
}