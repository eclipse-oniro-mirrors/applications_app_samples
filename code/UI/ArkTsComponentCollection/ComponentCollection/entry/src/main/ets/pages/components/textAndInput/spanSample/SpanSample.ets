/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/textAndInput/spanSample/SpanSample.ets
 * 文件职责：SpanSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SpanSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangePanel } from './ChangePanel'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * SpanSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SpanSample {
  // @State letterSpacing：组件内部状态
  @State letterSpacing: number = 3
  // @State decoration：组件内部状态
  @State decoration: TextDecorationType = TextDecorationType.None
  // @State textCase：组件内部状态
  @State textCase: TextCase = TextCase.Normal
  // @State decorationColor：组件内部状态
  @State decorationColor: Color = Color.Red
  // @State lineHeight：组件内部状态
  @State lineHeight: number = 3

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.span_title') }).id('span_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.span_attribute') }).id('span_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Text：文本
            Text() {
              // Span：行内文本片段
              // 关键属性：字号
              Span($r('app.string.span_content_one')).id('span_sample_span_8')
                .fontSize(20)
              // Span：行内文本片段
              // 关键属性：字号、字体颜色
              Span($r('app.string.span_content_two')).id('span_sample_span_9')
                .fontSize(20)
                .fontColor(Color.Red)
              // Span：行内文本片段
              // 关键属性：字号
              Span($r('app.string.span_content_three')).id('span_sample_span_10')
                .fontSize(20)
              // Span：行内文本片段
              // 关键属性：字号、字重
              Span($r('app.string.span_content_four')).id('span_sample_span_11')
                .fontSize(24)
                .fontWeight(FontWeight.Bolder)
            }.id('span_sample_text_7')
          }.id('span_sample_column_6')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.span_decoration_and_letter_spacing') })
            .id('span_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Text：文本
            // 关键属性：高度、字号
            Text() {
              // Span：行内文本片段
              // 关键属性：font
              Span($r('app.string.span_text_decoration')).id('span_sample_span_15')
                .font({
                  size: 20
                })
                .height(50)
                .lineHeight(this.lineHeight)
                .decoration({
                  type: this.decoration,
                  color: this.decorationColor
                })

              // Span：行内文本片段
              // 关键属性：font
              Span($r('app.string.span_text_spacing')).id('span_sample_span_16')
                .font({
                  size: 20
                })
                .letterSpacing(this.letterSpacing)
            }.id('span_sample_text_14')
            .height(100)
            .fontSize(50)

            // ChangePanel：ChangePanel 自定义组件
            ChangePanel({
              letterSpacing: $letterSpacing,
              decoration: $decoration,
              decorationColor: $decorationColor,
              lineHeight: $lineHeight
            }).id('span_sample_change_panel_17')
          }.id('span_sample_column_13')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.span_inherits_text_attribute') })
            .id('span_sample_introduction_title_18')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、外边距
          Column() {
            // Text：文本
            // 关键属性：高度、字号
            Text() {
              // Span：行内文本片段
              // 关键属性：字号、高度
              Span($r('app.string.span_does_not_inherit_text_attribute')).id('span_sample_span_21')
                .fontSize(20)
                .height(50)

              // Span：行内文本片段
              Span($r('app.string.span_inherits_text_attribute')).id('span_sample_span_22')
            }.id('span_sample_text_20')
            .height(70)
            .fontSize(10)
          }.id('span_sample_column_19')
          .backgroundStyle()
          .margin({ bottom: 80 })
        }.id('span_sample_column_4')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
      }.id('span_sample_scroll_3')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('span_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}