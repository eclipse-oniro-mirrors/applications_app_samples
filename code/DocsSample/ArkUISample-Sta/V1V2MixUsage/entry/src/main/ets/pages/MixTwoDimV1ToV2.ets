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

// [Start MixTwoDimV1ToV2]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, Divider, ForEach, Row, Require, Param, State } from '@kit.ArkUI';

@ComponentV2
struct Item {
  @Require @Param itemArr: Array<string>;

  build() {
    Column() {
      ForEach(this.itemArr, (item: string, index: int) => {
        Text(`${index}: ${item}`)
          .fontSize(20)
          .margin(10)
      }, (item: string) => item + Math.random())

      Button('@Param push')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.itemArr.push('Param');
        })
    }
  }
}

@Entry
@Component
struct CompV1 {
  @State arr: Array<Array<string>> =
    [['apple'], ['banana'], ['orange']];

  build() {
    Column() {
      ForEach(this.arr, (itemArr: Array<string>) => {
        Item({ itemArr: itemArr })
      }, (itemArr: Array<string>) => JSON.stringify(itemArr) + Math.random())
      Button('@State push two-dimensional array item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0].push('strawberry');
        })

      Button('@State push array item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.push(['pear']);
        })

      Button('@State change two-dimensional array first item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0][0] = 'APPLE';
        })

      Button('@State change array first item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0] = ['watermelon'];
        })
    }
    .width('100%')
  }
}
// [End MixTwoDimV1ToV2]

@Builder
export function mixTwoDimV1ToV2(): void {
  NavDestination() {
    CompV1()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_twodim_v1_to_v2_title'))
}
