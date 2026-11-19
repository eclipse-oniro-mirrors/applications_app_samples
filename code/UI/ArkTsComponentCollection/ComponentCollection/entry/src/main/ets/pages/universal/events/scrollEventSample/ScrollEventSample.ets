/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/events/scrollEventSample/ScrollEventSample.ets
 * 文件职责：ScrollEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScrollEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';

/**
 * ScrollEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ScrollEventSample {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.scroll_event') }).id('scroll_event_sample_title_bar_2')
      // Column：垂直布局容器
      Column({ space: 30 }) {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.scroll_event_description') })
          .id('scroll_event_sample_introduction_title_4')
        // Scroll：滚动容器
        // 关键属性：scrollable、滚动条、scrollBarColor、scrollBarWidth、外边距
        Scroll() {
          // Column：垂直布局容器
          // 关键属性：宽度
          Column() {
            // Row：水平布局容器
            // 关键属性：onVisibleAreaChange
            Row() {
              // Image：图片
              // 关键属性：高度、宽度
              Image($r('app.media.img_love')).id('scroll_event_sample_image_8')
                .height(100)
                .width(100)
            }.id('scroll_event_sample_row_7')
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
              if (isVisible && currentRatio >= 1.0) {
                ShowToast.shortToast($r('app.string.scroll_event_toast_visible'));
              }

              if (!isVisible && currentRatio <= 0.0) {
                ShowToast.shortToast($r('app.string.scroll_event_toast_invisible'));
              }
            })

            ForEach(this.arr, (item: number) => {
              // Text：文本
              // 关键属性：宽度、高度、背景色、圆角、字号、文本对齐
              Text(item.toString()).id('scroll_event_sample_text_9')
                .width('100%')
                .height(80)
                .backgroundColor(0xFFFFFF)
                .borderRadius(24)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ left: 12, right: 12, top: 16 })
            }, (item: number) => JSON.stringify(item))
          }.id('scroll_event_sample_column_6').width('100%')
        }.id('scroll_event_sample_scroll_5')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .margin({ bottom: 200 })
      }.id('scroll_event_sample_column_3')
    }.id('scroll_event_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
