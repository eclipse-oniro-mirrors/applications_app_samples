/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/properties/sizeSample/SizeSample.ets
 * 文件职责：SizeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Size。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ bottom: 12 })
  .justifyContent(FlexAlign.SpaceBetween)
}

/**
 * Size：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Size {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.prop_size') }).id('size_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：外边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_width') }).id('size_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Row：水平布局容器
            // 关键属性：宽度、高度、圆角、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.size_width_fixed_100vp')).id('size_sample_text_8')
                .fontSize(18)
                .fontColor(Color.White)
            }.id('size_sample_row_7')
            .width(100)
            .height(100)
            .borderRadius(5)
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.background_green'))

            // Row：水平布局容器
            // 关键属性：宽度、高度、外边距、圆角、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.size_width_fixed_60vw')).id('size_sample_text_10')
                .fontSize(18)
                .fontColor(Color.White)
            }.id('size_sample_row_9')
            .width('60vw')
            .height(100)
            .margin({ left: 20 })
            .borderRadius(5)
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.background_green'))

            // Row：水平布局容器
            // 关键属性：高度、布局权重、圆角、外边距、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、宽度、高度、字体颜色、文本对齐、背景色
              Text($r('app.string.size_width_percent')).id('size_sample_text_12')
                .fontSize(18)
                .width('60%')
                .height('100%')
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
                .backgroundColor($r('app.color.background_green'))
            }.id('size_sample_row_11')
            .height(100)
            .layoutWeight(1)
            .borderRadius(5)
            .margin({ left: 20 })
            .justifyContent(FlexAlign.Start)
            .backgroundColor($r('app.color.background_blue'))
          }.id('size_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_height') }).id('size_sample_introduction_title_13')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Row：水平布局容器
            // 关键属性：高度、圆角、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.size_height_fixed_100vp')).id('size_sample_text_16')
                .fontSize(18)
                .fontColor(Color.White)
            }.id('size_sample_row_15')
            .height(100)
            .borderRadius(5)
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.background_blue'))

            // Row：水平布局容器
            // 关键属性：高度、圆角、外边距、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.size_height_fixed_60vh')).id('size_sample_text_18')
                .fontSize(18)
                .fontColor(Color.White)
            }.id('size_sample_row_17')
            .height('60vh')
            .borderRadius(5)
            .margin({ left: 20 })
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.background_blue'))

            // Row：水平布局容器
            // 关键属性：高度、布局权重、圆角、外边距、交叉轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、宽度、高度、字体颜色、文本对齐、背景色
              Text($r('app.string.size_height_percent')).id('size_sample_text_20')
                .fontSize(18)
                .width('100%')
                .height('60%')
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
                .backgroundColor($r('app.color.background_green'))
            }.id('size_sample_row_19')
            .height(100)
            .layoutWeight(1)
            .borderRadius(5)
            .margin({ left: 20 })
            .alignItems(VerticalAlign.Top)
            .backgroundColor($r('app.color.background_blue'))
          }.id('size_sample_row_14')
          .rowStyle()

          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Row：水平布局容器
            // 关键属性：高度、圆角、主轴对齐、背景色
            Row() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.size_height_fixed_calc')).id('size_sample_text_23')
                .fontSize(18)
                .fontColor(Color.White)
            }.id('size_sample_row_22')
            .height('calc(200vp - 100vp)')
            .borderRadius(5)
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.background_blue'))
          }.id('size_sample_row_21')
          .rowStyle()
        }.id('size_sample_column_4')
        .margin({ left: 12, right: 12 })
        .constraintSize({ minHeight: '100%' })
      }.id('size_sample_scroll_3')
    }.id('size_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}