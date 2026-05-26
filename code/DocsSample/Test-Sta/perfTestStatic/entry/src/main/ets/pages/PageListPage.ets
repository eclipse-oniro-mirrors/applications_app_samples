'use static';
/**
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

import {
  Entry, Component, Column, Row, Text, Scroll, ScrollDirection, BarState, Color,
  ForEach, Scroller, TextAlign
} from '@ohos.arkui.component'

// [Start scroll_sta_sample]
@Entry
@Component
struct ListPage {
  scroller: Scroller = new Scroller();
  private arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  build() {
    Row() {
      Column() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: int) => {
              Text(item.toString())
                .width('90%')
                .height('40%')
                .fontSize(80)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: int) => item.toString())
          }
        }
        .width('100%')
        .height('100%')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
      }
      .width('100%')
    }
    .height('100%')
  }
}

// [End scroll_sta_sample]
