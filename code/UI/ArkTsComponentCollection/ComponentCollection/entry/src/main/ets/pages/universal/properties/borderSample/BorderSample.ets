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
 * @file entry/src/main/ets/pages/universal/properties/borderSample/BorderSample.ets
 * 文件职责：BorderSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Border。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .padding(8)
  .height(100)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

@Extend(Text) function textStyle(marginValue: number) {
  .height(80)
  .fontSize(18)
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
  .margin({ left: marginValue, right: marginValue })
}

/**
 * Border：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Border {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.prop_border') }).id('border_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.border_type') }).id('border_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、边框宽度、边框样式
            Text($r('app.string.border_type_dashed')).id('border_sample_text_7')
              .textStyle(20)
              .borderWidth(1)
              .borderStyle(BorderStyle.Dashed)
            // Text：文本
            // 关键属性：textStyle、边框宽度、边框样式
            Text($r('app.string.border_type_dotted')).id('border_sample_text_8')
              .textStyle(20)
              .borderWidth(1)
              .borderStyle(BorderStyle.Dotted)
            // Text：文本
            // 关键属性：textStyle、边框宽度、边框样式
            Text($r('app.string.border_type_solid')).id('border_sample_text_9')
              .textStyle(20)
              .borderWidth(1)
              .borderStyle(BorderStyle.Solid)
          }.id('border_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.border_border_style') })
            .id('border_sample_introduction_title_10')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、边框宽度
            Text($r('app.string.border_border_width')).id('border_sample_text_12')
              .textStyle(20)
              .borderWidth(10)
            // Text：文本
            // 关键属性：textStyle、边框宽度、边框颜色
            Text($r('app.string.border_border_color')).id('border_sample_text_13')
              .textStyle(20)
              .borderWidth(1)
              .borderColor($r('app.color.background_blue'))
            // Text：文本
            // 关键属性：textStyle、边框宽度、圆角
            Text($r('app.string.border_border_radius')).id('border_sample_text_14')
              .textStyle(20)
              .borderWidth(1)
              .borderRadius(20)
          }.id('border_sample_row_11')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.border_edge_style') })
            .id('border_sample_introduction_title_15')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_style_top')).id('border_sample_text_17')
              .textStyle(12)
              .border({
                width: { top: 2 },
                color: { top: $r('app.color.background_blue') },
                style: { top: BorderStyle.Solid }
              })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_style_left')).id('border_sample_text_18')
              .textStyle(12)
              .border({ width: { left: 2 }, style: { left: BorderStyle.Dashed } })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_style_bottom')).id('border_sample_text_19')
              .textStyle(12)
              .border({ width: { bottom: 10 } })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_style_right')).id('border_sample_text_20')
              .textStyle(12)
              .border({ width: { right: 2 }, radius: 20 })
          }.id('border_sample_row_16')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.border_radius') }).id('border_sample_introduction_title_21')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_radius_left_top')).id('border_sample_text_23')
              .textStyle(4)
              .border({ width: 2, radius: { topLeft: 20 } })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_radius_left_bottom')).id('border_sample_text_24')
              .textStyle(4)
              .border({ width: 2, radius: { bottomLeft: 20 } })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_radius_right_top')).id('border_sample_text_25')
              .textStyle(4)
              .border({ width: 2, radius: { topRight: 20 } })
            // Text：文本
            // 关键属性：textStyle、边框
            Text($r('app.string.border_radius_right_bottom')).id('border_sample_text_26')
              .textStyle(4)
              .border({ width: 2, radius: { bottomRight: 20 } })
          }.id('border_sample_row_22')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.border_3D') }).id('border_sample_introduction_title_27')
          // Row：水平布局容器
          // 关键属性：内边距、圆角、背景色、外边距
          Row() {
            // Text：文本
            // 关键属性：高度、字号、布局权重、文本对齐、外边距、边框
            Text($r('app.string.border_3D')).id('border_sample_text_29')
              .height(60)
              .fontSize(18)
              .layoutWeight(1)
              .textAlign(TextAlign.Center)
              .margin({ left: 10, right: 10 })
              .border({ width: 5})
              .backgroundColor($r('app.color.3D_background_color'))
              .borderColor({
                left: $r('app.color.3D_top_left_color'),
                right: $r('app.color.3D_right_buttom_color'),
                top: $r('app.color.3D_top_left_color'),
                bottom: $r('app.color.3D_right_buttom_color')
              })
          }.id('border_sample_row_28')
          .padding(8)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ left: 12, right: 12 })
        }.id('border_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('border_sample_scroll_3')
    }.id('border_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}