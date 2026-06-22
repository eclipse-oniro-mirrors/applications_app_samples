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


// [Start auto_line]
import {
  Entry,
  Component,
  Column,
  Scroller,
  Scroll,
  Swiper,
  ForEach,
  Text,
  Row,
  Button,
  ScrollDirection,
  BarState,
  EdgeEffect,
  TextAlign,
  RowOptions,
  ScrollOptions,
  ScrollAnimationOptions,
  Curve,
  NavDestination,
  $r,
  State
} from '@kit.ArkUI';

// 如需作为页面入口，请取消@Entry的注释并删除export关键字
@Entry
@Component
export struct ScrollExample {
  private data: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  private scroller: Scroller = new Scroller();

  build(): void {
    NavDestination() {
      Column(undefined) {
        Scroll(this.scroller) {
          Row(undefined) {
            ForEach(this.data, (item: int) => {
              Column(undefined) {
                Text(item.toString())
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
              .width(90)
              .height(160)
              .backgroundColor(0xAFEEEE)
              .margin({ right: item === this.data[this.data.length - 1] ? 0 : 20 })
            })
          }.height(160)
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)

        Row({ space: 12 } as RowOptions) {
          Button('showNext')
            .onClick(() => {
              const xOffset: double = this.scroller.currentOffset()!.xOffset;
              this.scroller.scrollTo({
                xOffset: xOffset + 90 + 20,
                yOffset: 0,
                animation: { duration: 1000, curve: Curve.Linear } as ScrollAnimationOptions
              } as ScrollOptions);
            })
          Button('showPrevious')
            .onClick(() => {
              const xOffset: double = this.scroller.currentOffset()!.xOffset;
              this.scroller.scrollTo({
                xOffset: xOffset - 90 - 20,
                yOffset: 0,
                animation: { duration: 1000, curve: Curve.Linear } as ScrollAnimationOptions
              } as ScrollOptions);
            })
        }.margin(5)
      }.width('100%')
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.swiperAutoLinear_title'))
  }
}

// [End auto_line]