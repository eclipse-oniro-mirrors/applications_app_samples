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
  BarState,
  EdgeEffect,
  TextAlign,
  RowOptions,
  ScrollOptions,
  Curve,
  NavDestination,
  $r,
  DataChangeListener,
  LazyForEach,
  SwiperDisplayMode,
  SwiperAnimationMode,
  DotIndicator,
  SwiperController,
  ScrollState,
  SwiperAnimationEvent,
  ColumnOptions,
  IDataSource,
  State
} from '@kit.ArkUI';
import { RecordData } from '@ohos.base'

// [Start SwiperDeprecated]
// xxx.ets
export class MyDataSource implements IDataSource<string> {
  private list: string[] = [];
  private listener?: DataChangeListener = undefined

  constructor(list: string[]) {
    this.list = list;
  }

  totalCount(): int {
    return this.list.length;
  }

  getData(index: int): string {
    return this.list[index as int];
  }

  public addData(index: int, data: string): void {
    this.list.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public deleteData(index: int): void {
    this.list.splice(index, 1);
    this.notifyDataDelete(index);
  }

  notifyDataAdd(index: int): void {
    this.listener!.onDataAdd(index)
  }

  notifyDataDelete(index: int): void {
    this.listener!.onDataDelete(index);
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

// 如需作为页面入口，请取消@Entry的注释并删除export关键字
@Entry
@Component
export struct SwiperDeprecatedExample {
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSource = new MyDataSource([]);

  aboutToAppear(): void {
    let list: string[] = [];
    for (let i: number = 1; i <= 3; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list);
    // [Start DotIndicator]
    let a: DotIndicator = new DotIndicator().color("#FFFF00FF")
    // [End DotIndicator]
  }

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      // [Start indicator_bool]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(true)
      // [End indicator_bool]

      // [Start indicator_color]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().color("#FFFF00FF"))
      // [End indicator_color]

      // [Start indicator_right]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().right(0))
      // [End indicator_right]

      // [Start indicator_left]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().left(0))
      // [End indicator_left]

      // [Start indicator_top]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().top(0))
      // [End indicator_top]

      // [Start indicator_bottom]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().bottom(0))
      // [End indicator_bottom]

      // [Start indicator_selectedColor]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().selectedColor(0))
      // [End indicator_selectedColor]

      // [Start indicator_mask]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().mask(true))
      // [End indicator_mask]

      // [Start indicator_size]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .indicator(new DotIndicator().itemWidth(100).itemHeight(100).selectedItemWidth(100).selectedItemHeight(100))
      // [End indicator_size]

      // [Start indicator_Stretch]
      Swiper(this.swiperController) {
        // [StartExclude swiper_content]
        LazyForEach(this.data, (item: string, index: int) => {
          Text(item)
            .width('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
        })
        // [EndExclude swiper_content]
      }
      .displayMode(SwiperDisplayMode.STRETCH)
      // [End indicator_Stretch]
    }.width('100%')
  }
}
// [End SwiperDeprecated]