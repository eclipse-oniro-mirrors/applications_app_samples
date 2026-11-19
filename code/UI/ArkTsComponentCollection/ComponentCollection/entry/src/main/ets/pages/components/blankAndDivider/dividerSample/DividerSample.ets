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
 * @file entry/src/main/ets/pages/components/blankAndDivider/dividerSample/DividerSample.ets
 * 文件职责：DividerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DividerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangePanel } from './ChangePanel'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .width('100%')
  .padding(16)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(16)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * DividerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DividerSample {
  // @State strokeWidth：组件内部状态
  @State strokeWidth: number = 8
  // @State lineColor：组件内部状态
  @State lineColor: Resource = $r('app.color.background_blue')
  // @State lineCapStyle：组件内部状态
  @State lineCapStyle: LineCapStyle = LineCapStyle.Butt

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.divider_title') }).id('divider_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.divider_horizontal') })
            .id('divider_sample_introduction_title_5')
          // Horizontal divider
          // Column：垂直布局容器
          // 关键属性：高度、columnStyle
          Column() {
            this.Block()
            // Divider：分割线
            // 关键属性：Block
            Divider().id('divider_sample_divider_7')
            this.Block()
          }.id('divider_sample_column_6')
          .height(150)
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.divider_vertical') })
            .id('divider_sample_introduction_title_8')
          // Vertical divider
          // Row：水平布局容器
          // 关键属性：高度、rowStyle、主轴对齐
          Row() {
            // Text：文本
            Text($r('app.string.radio_beijing')).id('divider_sample_text_10')
            // Divider：分割线
            // 关键属性：是否纵向、高度
            Divider().id('divider_sample_divider_11')
              .vertical(true) // If true, divider is vertical
              .height(26)
            // Text：文本
            Text($r('app.string.radio_shanghai')).id('divider_sample_text_12')
            // Divider：分割线
            // 关键属性：是否纵向、高度
            Divider().id('divider_sample_divider_13')
              .vertical(true)
              .height(26)
            // Text：文本
            Text($r('app.string.radio_guangzhou')).id('divider_sample_text_14')
          }.id('divider_sample_row_9')
          .height(60)
          .rowStyle()
          .justifyContent(FlexAlign.SpaceEvenly)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.divider_attribute') })
            .id('divider_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：高度、columnStyle、外边距
          Column() {
            this.Block()
            // Divider：分割线
            // 关键属性：color、strokeWidth、lineCap、Block
            Divider().id('divider_sample_divider_17')
              .color(this.lineColor) // Divider color
              .strokeWidth(this.strokeWidth) // Divider stroke width
              .lineCap(this.lineCapStyle) // Divider line cap style
            this.Block()

            // ChangePanel：ChangePanel 自定义组件
            ChangePanel({
              strokeWidth: $strokeWidth,
              lineCapStyle: $lineCapStyle,
              lineColor: $lineColor
            }).id('divider_sample_change_panel_18')
          }.id('divider_sample_column_16')
          .height(280)
          .columnStyle()
          .margin({ bottom: 80 })
        }.id('divider_sample_column_4')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen
      }.id('divider_sample_scroll_3')
      .padding({ left: 12, right: 12 })
    }.id('divider_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder Block() {
    // Row：水平布局容器
    // 关键属性：宽度、布局权重、外边距、圆角、背景色
    Row().id('divider_sample_row_19')
      .width('100%')
      .layoutWeight(1)
      .margin(8)
      .borderRadius(12)
      .backgroundColor($r('app.color.divider_block_color'))
  }
}