/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/layoutAnimationSample/LayoutAnimationSample.ets
 * 文件职责：LayoutAnimationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：LayoutAnimationSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'

@Extend(Column) function columnStyle() {
  .height(150)
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ bottom: 12 })
}

@Extend(Text) function textStyle() {
  .fontColor(Color.White)
  .size({ width: 100, height: 100 })
  .margin(5)
}

/**
 * LayoutAnimationSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct LayoutAnimationSample {
  // @State mPadding：组件内部状态
  @State mPadding: number = 5;

  // @State mMargin：组件内部状态
  @State mMargin: number = 5;

  // @State mSize：组件内部状态
  @State mSize: number = 100;

  // @State mPositionX：组件内部状态
  @State mPositionX: number = 10;

  // @State mPositionY：组件内部状态
  @State mPositionY: number = 0;

  // @State mAlignment：组件内部状态
  @State mAlignment: Alignment = Alignment.Center;

  // @State mDirection：组件内部状态
  @State mDirection: Direction = Direction.Rtl;

  // @State mColor：组件内部状态
  @State mColor: Color = Color.Pink;

  // @State mHorizontalAlign：组件内部状态
  @State mHorizontalAlign: HorizontalAlign = HorizontalAlign.Start;
  intervalID: number | null = null;

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.intervalID = setInterval(() => {
      animateTo({ duration: 2000 }, () => {
        this.mColor = this.mColor == Color.Pink ? Color.Orange : Color.Pink
        this.mPadding = this.mPadding == 5 ? 20 : 5
        this.mMargin = this.mMargin == 5 ? 20 : 5
        this.mSize = this.mSize == 50 ? 100 : 50
        this.mPositionX = this.mPositionX == 10 ? 50 : 10
        this.mAlignment = this.mAlignment == Alignment.Center ? Alignment.TopStart : Alignment.Center
        this.mDirection = this.mDirection == Direction.Rtl ? Direction.Ltr : Direction.Rtl
        this.mHorizontalAlign = this.mHorizontalAlign == HorizontalAlign.Start ? HorizontalAlign.Center : HorizontalAlign.Start
      })

    }, 3000);
  }

  /**
   * onPageHide：页面退到后台时回调。
   */
  onPageHide() {
    clearInterval(this.intervalID)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.layout_animation_expansion') }).id('layout_animation_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_align') })
            .id('layout_animation_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：textStyle、背景色、align
            Text($r('app.string.layout_animation_expansion_align')).id('layout_animation_sample_text_7')
              .textStyle()
              .backgroundColor(this.mColor)
              .align(this.mAlignment)
          }.id('layout_animation_sample_column_6')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_size') })
            .id('layout_animation_sample_introduction_title_8')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：textStyle、尺寸、背景色
            Text().id('layout_animation_sample_text_10')
              .textStyle()
              .size({ width: this.mSize, height: this.mSize })
              .backgroundColor(this.mColor)
          }.id('layout_animation_sample_column_9')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_padding') })
            .id('layout_animation_sample_introduction_title_11')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Column：垂直布局容器
            // 关键属性：尺寸、外边距、内边距、背景色
            Column() {
              // Text：文本
              // 关键属性：尺寸、背景色
              Text().id('layout_animation_sample_text_14')
                .size({ width: '100%', height: '100%' })
                .backgroundColor($r('app.color.white'))
            }.id('layout_animation_sample_column_13')
            .size({ width: 100, height: 100 })
            .margin(5)
            .padding(this.mPadding)
            .backgroundColor(this.mColor)
          }.id('layout_animation_sample_column_12')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_margin') })
            .id('layout_animation_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Row：水平布局容器
            Row() {
              ForEach(['1', '2', '3'], (item: string) => {
                // Text：文本
                // 关键属性：textStyle、外边距、背景色
                Text(item).id('layout_animation_sample_text_18')
                  .textStyle()
                  .margin(this.mMargin)
                  .backgroundColor(this.mColor)
              })
            }.id('layout_animation_sample_row_17')
          }.id('layout_animation_sample_column_16')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_direction') })
            .id('layout_animation_sample_introduction_title_19')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：方向
            Row() {
              ForEach(['1', '2', '3'], (item: string) => {
                // Text：文本
                // 关键属性：textStyle、背景色
                Text(item).id('layout_animation_sample_text_22')
                  .textStyle()
                  .backgroundColor(this.mColor)
              })
            }.id('layout_animation_sample_row_21')
            .direction(this.mDirection)
          }.id('layout_animation_sample_column_20')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_offset') })
            .id('layout_animation_sample_introduction_title_23')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：textStyle、偏移
            Text().id('layout_animation_sample_text_25')
              .textStyle()
              .offset({
                x: this.mPositionX,
                y: this.mPositionY
              })
              .backgroundColor(this.mColor)
          }.id('layout_animation_sample_column_24')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_position') })
            .id('layout_animation_sample_introduction_title_26')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：textStyle、绝对定位
            Text().id('layout_animation_sample_text_28')
              .textStyle()
              .position({
                x: this.mPositionX,
                y: this.mPositionY
              })
              .backgroundColor(this.mColor)
          }.id('layout_animation_sample_column_27')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_markAnchor') })
            .id('layout_animation_sample_introduction_title_29')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：textStyle、锚点
            Text().id('layout_animation_sample_text_31')
              .textStyle()
              .markAnchor({
                x: this.mPositionX,
                y: this.mPositionY
              })
              .backgroundColor(this.mColor)
          }.id('layout_animation_sample_column_30')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.layout_animation_expansion_alignRules') })
            .id('layout_animation_sample_introduction_title_32')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // RelativeContainer：相对布局容器
            // 关键属性：外边距、尺寸、边框
            RelativeContainer() {
              // Text：文本
              // 关键属性：尺寸、相对对齐规则
              Text()
                .size({ width: 100, height: 100 })
                .alignRules({
                  top: {
                    anchor: "__container__",
                    align: VerticalAlign.Top
                  },
                  left: {
                    anchor: "__container__",
                    align: this.mHorizontalAlign
                  }
                })
                .id('text1')
                .backgroundColor(this.mColor)
            }.id('layout_animation_sample_relative_container_34')
            .margin({ top: 10 })
            .size({ width: 300, height: 100 })
            .border({ width: 2, color: $r('app.color.radio_response_region_color') })
          }.id('layout_animation_sample_column_33')
          .columnStyle()

          .margin({ bottom: 80 })
        }.id('layout_animation_sample_column_4')
        .padding({ left: 12, right: 12 })
        .constraintSize({ minHeight: '100%' })

      }.id('layout_animation_sample_scroll_3')
    }.id('layout_animation_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}