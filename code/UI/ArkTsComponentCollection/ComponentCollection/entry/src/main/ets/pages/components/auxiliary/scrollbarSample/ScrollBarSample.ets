/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/components/auxiliary/scrollbarSample/ScrollBarSample.ets
 * 文件职责：ScrollBarSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScrollBarSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

/**
 * ScrollBarSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ScrollBarSample {
  private vscroller: Scroller = new Scroller()
  private hscroller: Scroller = new Scroller()
  private dataArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  private ItemHeight: number = 300

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.scroll_bar') }).id('scroll_bar_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.scroll_vertical_title')).id('scroll_bar_sample_text_3')
        .leftTitleStyle()
      // Row：水平布局容器
      // 关键属性：宽度、内边距
      Row() {
        // Column：垂直布局容器
        // 关键属性：高度、自身对齐
        Column() {
          // Scroll：滚动容器
          // 关键属性：高度、内边距、滚动条
          Scroll(this.vscroller) {
            // Column：垂直布局容器
            // 关键属性：宽度、高度
            Column() {
              ForEach(this.dataArray, (item: number) => {
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、背景色、圆角
                Stack() {
                  // Text：文本
                  // 关键属性：字号、宽度
                  Text(item.toString()).id('scroll_bar_sample_text_9')
                    .fontSize(20)
                }.id('scroll_bar_sample_stack_8').width('100%')
                .height(60)
                .backgroundColor($r('app.color.white'))
                .borderRadius(10)

                // Blank：占位空白
                Blank(6).id('scroll_bar_sample_blank_10')
              })
            }.id('scroll_bar_sample_column_7').width('80%')
          }.id('scroll_bar_sample_scroll_6').height('100%')
          .padding(12)
          .scrollBar(BarState.Off)
        }.id('scroll_bar_sample_column_5').height(this.ItemHeight)
        .alignSelf(ItemAlign.Start)

        // Blank：占位空白
        Blank().id('scroll_bar_sample_blank_11')
        // ScrollBar：滚动条
        // 关键属性：宽度、高度、背景色
        ScrollBar({ scroller: this.vscroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、圆角、背景色
          Column().id('scroll_bar_sample_column_13')
            .width(10)
            .height(100)
            .borderRadius(10)
            .backgroundColor($r('app.color.contentArea_background_color'))
        }.id('scroll_bar_sample_scroll_bar_12').width(10)
        .height(this.ItemHeight)
        .backgroundColor($r('app.color.scrollbar_background_color'))
      }.id('scroll_bar_sample_row_4').width('100%')
      .padding(12)

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.scroll_horizontal_title')).id('scroll_bar_sample_text_14')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：宽度、内边距
      Column() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度、自身对齐
        Column() {
          // Scroll：滚动容器
          // 关键属性：宽度、裁剪、高度、内边距、scrollable、滚动条
          Scroll(this.hscroller) {
            // Row：水平布局容器
            Row() {
              ForEach(this.dataArray, (item: number) => {
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、背景色、圆角
                Stack() {
                  // Text：文本
                  // 关键属性：字号、宽度
                  Text(item.toString()).id('scroll_bar_sample_text_20')
                    .fontSize(20)
                }.id('scroll_bar_sample_stack_19').width(60)
                .height('100%')
                .backgroundColor($r('app.color.white'))
                .borderRadius(10)

                // Blank：占位空白
                Blank(6).id('scroll_bar_sample_blank_21')
              })
            }.id('scroll_bar_sample_row_18')
          }.id('scroll_bar_sample_scroll_17')
          .width('100%')
          .clip(true)
          .height(this.ItemHeight)
          .padding(12)
          .scrollable(ScrollDirection.Horizontal)
          .scrollBar(BarState.Off)
        }.id('scroll_bar_sample_column_16').height(this.ItemHeight)
        .width('100%')
        .alignSelf(ItemAlign.Start)

        // Blank：占位空白
        Blank().id('scroll_bar_sample_blank_22')
        // ScrollBar：滚动条
        // 关键属性：宽度、高度、背景色
        ScrollBar({ scroller: this.hscroller, direction: ScrollBarDirection.Horizontal, state: BarState.Auto }) {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、圆角、背景色
          Column().id('scroll_bar_sample_column_24')
            .width(100)
            .height(10)
            .borderRadius(10)
            .backgroundColor($r('app.color.contentArea_background_color'))
        }.id('scroll_bar_sample_scroll_bar_23').width('100%')
        .height(10)
        .backgroundColor($r('app.color.scrollbar_background_color'))
      }.id('scroll_bar_sample_column_15').width('100%')
      .padding(12)
    }.id('scroll_bar_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}