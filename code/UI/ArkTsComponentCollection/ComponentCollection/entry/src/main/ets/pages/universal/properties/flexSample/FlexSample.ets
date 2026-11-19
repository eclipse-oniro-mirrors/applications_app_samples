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
 * @file entry/src/main/ets/pages/universal/properties/flexSample/FlexSample.ets
 * 文件职责：FlexSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FlexSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * FlexSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct FlexSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.flex') }).id('flex_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.flex_flexBasis') }).id('flex_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Flex：弹性布局容器
            // 关键属性：宽度、高度、内边距、背景色
            Flex() {
              // Text：文本
              // 关键属性：基准尺寸、高度、背景色、文本对齐
              Text($r('app.string.flex_basis_100')).id('flex_sample_text_8')
                .flexBasis(100) // 这里表示宽度为100vp
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：基准尺寸、宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_basis_auto')).id('flex_sample_text_9')
                .flexBasis(getStringData($r('app.string.flex_auto'))) // 这里表示宽度保持原本设置的60%的宽度
                .width('60%')
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
            }.id('flex_sample_flex_7')
            .width('100%')
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
          }.id('flex_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.flex_flexGrow') }).id('flex_sample_introduction_title_10')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Flex：弹性布局容器
            // 关键属性：宽度、高度、内边距、背景色
            Flex() {
              // Text：文本
              // 关键属性：剩余空间放大、高度、背景色、文本对齐
              Text($r('app.string.flex_grow_2')).id('flex_sample_text_13')
                .flexGrow(2) // 父容器分配给该Text的宽度为剩余宽度的2/3
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：剩余空间放大、高度、背景色、文本对齐
              Text($r('app.string.flex_grow_1')).id('flex_sample_text_14')
                .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的1/3
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
            }.id('flex_sample_flex_12')
            .width('100%')
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
          }.id('flex_sample_row_11')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.flex_flexShrink') }).id('flex_sample_introduction_title_15')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Flex：弹性布局容器
            // 关键属性：宽度、高度、内边距、背景色
            Flex({ direction: FlexDirection.Row }) {
              // Text：文本
              // 关键属性：空间不足收缩、宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_shrink_0')).id('flex_sample_text_18')
                .flexShrink(0)
                .width('50%')
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_shrink_default')).id('flex_sample_text_19') // 默认值为1
                .width('40%')
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：空间不足收缩、宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_shrink_1')).id('flex_sample_text_20')
                .flexShrink(1)
                .width('40%')
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
            }.id('flex_sample_flex_17')
            .width('100%')
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
          }.id('flex_sample_row_16')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.flex_alignSelf') }).id('flex_sample_introduction_title_21')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Flex：弹性布局容器
            // 关键属性：宽度、高度、内边距、背景色
            Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
              // Text：文本
              // 关键属性：宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_no_alignSelf_70')).id('flex_sample_text_24')
                .width('33%')
                .height(70)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：自身对齐、宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_end_alignSelf')).id('flex_sample_text_25')
                .alignSelf(ItemAlign.End)
                .width('33%')
                .height(70)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：宽度、高度、背景色、文本对齐
              Text($r('app.string.flex_end_alignSelf_100')).id('flex_sample_text_26')
                .width('34%')
                .height('100%')
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
            }.id('flex_sample_flex_23')
            .width('100%')
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
          }.id('flex_sample_row_22')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.flex_layoutWeight') })
            .id('flex_sample_introduction_title_27')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Flex：弹性布局容器
            // 关键属性：宽度、高度、内边距、背景色
            Flex({ direction: FlexDirection.Row }) {
              // Text：文本
              // 关键属性：宽度、高度、背景色、文本对齐
              Text($r('app.string.size_size_description_one')).id('flex_sample_text_30')
                .width(100)
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              // Text：文本
              // 关键属性：布局权重、高度、背景色、文本对齐
              Text($r('app.string.flex_layoutWeight')).id('flex_sample_text_31') // 默认值为1
                .layoutWeight(1)
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
            }.id('flex_sample_flex_29')
            .width('100%')
            .height(120)
            .padding(10)
            .backgroundColor(0xAFEEEE)
          }.id('flex_sample_row_28')
          .rowStyle()
        }.id('flex_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('flex_sample_scroll_3')
      .margin({ bottom: 60 })
    }.id('flex_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}