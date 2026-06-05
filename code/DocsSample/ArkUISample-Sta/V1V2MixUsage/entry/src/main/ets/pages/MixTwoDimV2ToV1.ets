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

// [Start MixTwoDimV2ToV1]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, Divider, ForEach, Row, ObjectLink, Local } from '@kit.ArkUI';

@Component
struct Item {
  @ObjectLink itemArr: Array<string>;

  build() {
    Column() {
      ForEach(this.itemArr, (item: string, index: int) => {
        Text(`${index}: ${item}`)
          .fontSize(20)
          .margin(10)
      }, (item: string) => item + Math.random())

      Button('@ObjectLink push')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.itemArr.push('ObjectLink');
        })
    }
  }
}

@Entry
@ComponentV2
struct IndexPage {
  @Local arr: Array<Array<string>> = [['apple'], ['banana'], ['orange']];

  build() {
    Column() {
      ForEach(this.arr, (itemArr: Array<string>) => {
        Item({ itemArr: itemArr })
      }, (itemArr: Array<string>) => JSON.stringify(itemArr) + Math.random())
      Button('@Local push two-dimensional array item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0].push('strawberry');
        })

      Button('@Local push array item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr.push(['pear']);
        })

      Button('@Local change two-dimensional array first item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0][0] = 'APPLE';
        })

      Button('@Local change array first item')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.arr[0] = ['watermelon'];
        })
    }
    .width('100%')
  }
}
// [End MixTwoDimV2ToV1]

@Builder
export function mixTwoDimV2ToV1(): void {
  NavDestination() {
    IndexPage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_twodim_v2_to_v1_title'))
}
