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
 * @file entry/src/main/ets/pages/universal/properties/locationSample/LocationSample.ets
 * 文件职责：LocationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：LocationSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * LocationSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct LocationSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.location_settings') }).id('location_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_align') })
            .id('location_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            Column() {
              // Stack：层叠布局容器
              // 关键属性：宽度、高度、外边距、背景色、align
              Stack() {
                // Text：文本
                // 关键属性：高度
                Text($r('app.string.location_settings_bottom_end')).id('location_sample_text_9')
                  .height('65%')
              }.id('location_sample_stack_8')
              .width('90%')
              .height(50)
              .margin({ top: 5 })
              .backgroundColor(0xFFE4C4)
              .align(Alignment.BottomEnd)

              // Stack：层叠布局容器
              // 关键属性：宽度、高度、外边距、背景色、align
              Stack() {
                // Text：文本
                Text($r('app.string.location_settings_top_start')).id('location_sample_text_11')
              }.id('location_sample_stack_10')
              .width('90%')
              .height(50)
              .margin({ top: 5 })
              .backgroundColor(0xFFE4C4)
              .align(Alignment.TopStart)

              // Stack：层叠布局容器
              // 关键属性：宽度、高度、外边距、背景色、align
              Stack() {
                // Text：文本
                Text($r('app.string.location_settings_center')).id('location_sample_text_13')
              }.id('location_sample_stack_12')
              .width('90%')
              .height(50)
              .margin({ top: 5 })
              .backgroundColor(0xFFE4C4)
              .align(Alignment.Center)
            }.id('location_sample_column_7')
          }.id('location_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_direction') })
            .id('location_sample_introduction_title_14')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、方向
              Row() {
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色
                Text($r('app.string.text_picker_text_banana')).id('location_sample_text_18')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xF5DEB3)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色
                Text($r('app.string.text_picker_text_orange')).id('location_sample_text_19')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xD2B48C)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色
                Text($r('app.string.text_picker_text_peach')).id('location_sample_text_20')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xF5DEB3)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色
                Text($r('app.string.text_picker_text_apple')).id('location_sample_text_21')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xD2B48C)
              }.id('location_sample_row_17')
              .width('90%')
              .direction(Direction.Ltr)
              // 父容器设置direction为Direction.Rtl，子元素从右到左排列
              // Row：水平布局容器
              // 关键属性：宽度、方向
              Row() {
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色、文本对齐
                Text($r('app.string.text_picker_text_banana')).id('location_sample_text_23')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xF5DEB3)
                  .textAlign(TextAlign.End)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色、文本对齐
                Text($r('app.string.text_picker_text_orange')).id('location_sample_text_24')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xD2B48C)
                  .textAlign(TextAlign.End)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色、文本对齐
                Text($r('app.string.text_picker_text_peach')).id('location_sample_text_25')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xF5DEB3)
                  .textAlign(TextAlign.End)
                // Text：文本
                // 关键属性：高度、宽度、字号、背景色、文本对齐
                Text($r('app.string.text_picker_text_apple')).id('location_sample_text_26')
                  .height(50)
                  .width('25%')
                  .fontSize(16)
                  .backgroundColor(0xD2B48C)
                  .textAlign(TextAlign.End)
              }.id('location_sample_row_22')
              .width('90%')
              .direction(Direction.Rtl)
            }.id('location_sample_column_16')
          }.id('location_sample_row_15')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_position') })
            .id('location_sample_introduction_title_27')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            // 关键属性：高度
            Column() {
              // Text：文本
              // 关键属性：尺寸、背景色、边框、字号、align、绝对定位
              Text($r('app.string.location_settings_position_text')).id('location_sample_text_30')
                .size({ width: '60%', height: '30' })
                .backgroundColor(0xbbb2cb)
                .border({ width: 1 })
                .fontSize(16)
                .align(Alignment.Start)
                .position({ x: 30, y: 10 })
            }.id('location_sample_column_29')
            .height(100)
          }.id('location_sample_row_28')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_markAnchor') })
            .id('location_sample_introduction_title_31')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Stack：层叠布局容器
            // 关键属性：外边距、边框
            Stack({ alignContent: Alignment.TopStart }) {
              // Row：水平布局容器
              // 关键属性：尺寸、背景色
              Row().id('location_sample_row_34')
                .size({ width: '100', height: '100' })
                .backgroundColor(0xdeb887)
              // Text：文本
              // 关键属性：字号、文本对齐、尺寸、背景色、锚点
              Text($r('app.string.text_picker_text_banana')).id('location_sample_text_35')
                .fontSize('30px')
                .textAlign(TextAlign.Center)
                .size({ width: 25, height: 25 })
                .backgroundColor(Color.Green)
                .markAnchor({ x: 25, y: 25 })
              // Text：文本
              // 关键属性：字号、文本对齐、尺寸、背景色、锚点
              Text($r('app.string.text_picker_text_banana')).id('location_sample_text_36')
                .fontSize('30px')
                .textAlign(TextAlign.Center)
                .size({ width: 25, height: 25 })
                .backgroundColor(Color.Green)
                .markAnchor({ x: -100, y: -25 })
              // Text：文本
              // 关键属性：字号、文本对齐、尺寸、背景色、锚点
              Text($r('app.string.text_picker_text_banana')).id('location_sample_text_37')
                .fontSize('30px')
                .textAlign(TextAlign.Center)
                .size({ width: 25, height: 25 })
                .backgroundColor(Color.Green)
                .markAnchor({ x: 25, y: -25 })
            }.id('location_sample_stack_33')
            .margin({ top: 25, left: 50 })
            .border({ width: 1, style: BorderStyle.Dashed })
          }.id('location_sample_row_32')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_offset') })
            .id('location_sample_introduction_title_38')
          // Row：水平布局容器
          // 关键属性：高度、rowStyle
          Row() {
            // Text：文本
            // 关键属性：尺寸、背景色、边框、字号、文本对齐
            Text($r('app.string.text_picker_text_banana')).id('location_sample_text_40')
              .size({ width: '15%', height: '50' })
              .backgroundColor(0xdeb887)
              .border({ width: 1 })
              .fontSize(16)
              .textAlign(TextAlign.Center)
            // Text：文本
            // 关键属性：尺寸、背景色、边框、字号、align、偏移
            Text($r('app.string.location_settings_position_offSet_text')).id('location_sample_text_41')
              .size({ width: 120, height: '50' })
              .backgroundColor(0xbbb2cb)
              .border({ width: 1 })
              .fontSize(16)
              .align(Alignment.Start)
              .offset({ x: 15, y: 30 })
            // Text：文本
            // 关键属性：尺寸、背景色、边框、字号、文本对齐
            Text($r('app.string.text_picker_text_banana')).id('location_sample_text_42')
              .size({ width: '15%', height: '50' })
              .backgroundColor(0xdeb887)
              .border({ width: 1 })
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }.id('location_sample_row_39')
          .height(200)
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.location_settings_alignRules') })
            .id('location_sample_introduction_title_43')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // RelativeContainer：相对布局容器
            // 关键属性：宽度、高度
            RelativeContainer() {
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、相对对齐规则
              Row()
                .width(100)
                .height(100)
                .backgroundColor(Color.Pink)
                .alignRules({
                  top: { anchor: "__container__", align: VerticalAlign.Top },
                  left: { anchor: "__container__", align: HorizontalAlign.Start }
                })
                .id("row1")

              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、相对对齐规则
              Row()
                .width(100)
                .height(100)
                .backgroundColor(Color.Green)
                .alignRules({
                  top: { anchor: "__container__", align: VerticalAlign.Top },
                  right: { anchor: "__container__", align: HorizontalAlign.End }
                })
                .id("row2")

              // Row：水平布局容器
              // 关键属性：高度、背景色、相对对齐规则
              Row().height(100)
                .backgroundColor(Color.Blue)
                .alignRules({
                  top: { anchor: "row1", align: VerticalAlign.Bottom },
                  left: { anchor: "row1", align: HorizontalAlign.End },
                  right: { anchor: "row2", align: HorizontalAlign.Start }
                })
                .id("row3")

              // Row：水平布局容器
              // 关键属性：背景色、相对对齐规则
              Row()
                .backgroundColor(Color.Orange)
                .alignRules({
                  top: { anchor: "row3", align: VerticalAlign.Bottom },
                  bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                  right: { anchor: "row1", align: HorizontalAlign.End }
                })
                .id("row4")

              // Row：水平布局容器
              // 关键属性：背景色、相对对齐规则
              Row()
                .backgroundColor(Color.Red)
                .alignRules({
                  top: { anchor: "row3", align: VerticalAlign.Bottom },
                  bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
                  left: { anchor: "row2", align: HorizontalAlign.Start },
                  right: { anchor: "__container__", align: HorizontalAlign.End }
                })
                .id("row5")
            }.id('location_sample_relative_container_45')
            .width(300)
            .height(300)
          }.id('location_sample_row_44')
          .rowStyle()
        }.id('location_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('location_sample_scroll_3')
      .margin({ bottom: 70 })
    }.id('location_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}