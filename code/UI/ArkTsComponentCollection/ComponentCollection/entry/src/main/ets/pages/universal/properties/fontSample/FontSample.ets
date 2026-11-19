/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/properties/fontSample/FontSample.ets
 * 文件职责：FontSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Font。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .height(80)
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
  .justifyContent(FlexAlign.SpaceAround)
  .padding({ left: 20, right: 20, top: 24, bottom: 24 })
}

/**
 * Font：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Font {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.prop_font') }).id('font_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.font_color') }).id('font_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：字号、字体颜色
            Text($r('app.string.prop_bluefont')).id('font_sample_text_7')
              .fontSize(20)
              .fontColor($r('app.color.background_blue'))
            // Text：文本
            // 关键属性：字号、字体颜色
            Text($r('app.string.prop_orangefont')).id('font_sample_text_8')
              .fontSize(20)
              .fontColor($r('app.color.background_orange'))
            // Text：文本
            // 关键属性：字号、字体颜色
            Text($r('app.string.prop_pinkfont')).id('font_sample_text_9')
              .fontSize(20)
              .fontColor($r('app.color.background_pink'))
          }.id('font_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.font_size') }).id('font_sample_introduction_title_10')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：字号
            Text('14vp').id('font_sample_text_12')
              .fontSize(14)
            // Text：文本
            // 关键属性：字号
            Text('18vp').id('font_sample_text_13')
              .fontSize(18)
            // Text：文本
            // 关键属性：字号
            Text('26vp').id('font_sample_text_14')
              .fontSize(26)
          }.id('font_sample_row_11')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.font_thickness') }).id('font_sample_introduction_title_15')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：字号、字重
            Text('300').id('font_sample_text_17')
              .fontSize(18)
              .fontWeight(300)
            // Text：文本
            // 关键属性：字号、字重
            Text('500').id('font_sample_text_18')
              .fontSize(18)
              .fontWeight(500)
            // Text：文本
            // 关键属性：字号、字重
            Text('800').id('font_sample_text_19')
              .fontSize(18)
              .fontWeight(800)
          }.id('font_sample_row_16')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.font_style') }).id('font_sample_introduction_title_20')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：字号、字体样式
            Text('normal').id('font_sample_text_22')
              .fontSize(20)
              .fontStyle(FontStyle.Normal)
            // Text：文本
            // 关键属性：字号、字体样式
            Text('italic').id('font_sample_text_23')
              .fontSize(20)
              .fontStyle(FontStyle.Italic)
          }.id('font_sample_row_21')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.prop_size') }).id('font_sample_introduction_title_24')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：字号、字体
            Text('sans-serif').id('font_sample_text_26')
              .fontSize(20)
              .fontFamily('sans-serif')
            // Text：文本
            // 关键属性：字号、字体
            Text('HYQiHei-65S').id('font_sample_text_27')
              .fontSize(20)
              .fontFamily('HYQiHei-65S')
          }.id('font_sample_row_25')
          .rowStyle()
        }.id('font_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('font_sample_scroll_3')
    }.id('font_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}