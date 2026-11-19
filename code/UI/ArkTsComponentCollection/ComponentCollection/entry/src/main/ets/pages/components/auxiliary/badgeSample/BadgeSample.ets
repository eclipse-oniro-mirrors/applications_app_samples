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
 * @file entry/src/main/ets/pages/components/auxiliary/badgeSample/BadgeSample.ets
 * 文件职责：BadgeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BadgeSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .margin(10)
  .width('100%')
  .borderRadius(14)
  .padding({ left: 12, right: 12 })
  .justifyContent(FlexAlign.SpaceBetween)
}

@Extend(Badge) function badgeStyle() {
  .layoutWeight(1)
  .borderRadius(20)
  .margin({ left: 12, right: 12 })
  .backgroundColor($r('app.color.tab_bar_divider'))
}

/**
 * BadgeSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct BadgeSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.auxiliary_badge') }).id('badge_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.badge_type') }).id('badge_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 1,
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_number'))
              this.RowContainer($r('app.string.badge_number'))
            // 结束当前组件块
            }.id('badge_sample_badge_7')
            .badgeStyle()

            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              value: 'new',
              style: {
                color: 0xFFFFFF,
                fontSize: 14,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_string'))
              this.RowContainer($r('app.string.badge_string'))
            // 结束当前组件块
            }.id('badge_sample_badge_8')
            .badgeStyle()
          // 结束当前组件块
          }.id('badge_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.badge_max') }).id('badge_sample_introduction_title_9')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 10, // 设置提醒消息数100
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_number_no
              this.RowContainer($r('app.string.badge_number_normal'))
            // 结束当前组件块
            }.id('badge_sample_badge_11')
            .badgeStyle()

            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 100, // 设置提醒消息数100
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_number_ma
              this.RowContainer($r('app.string.badge_number_max'))
            // 结束当前组件块
            }.id('badge_sample_badge_12')
            .badgeStyle()
          // 结束当前组件块
          }.id('badge_sample_row_10')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.badge_location') }).id('badge_sample_introduction_title_13')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 1, // 设置提醒消息数
              position: BadgePosition.Left,
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_left'))
              this.RowContainer($r('app.string.badge_left'))
            // 结束当前组件块
            }.id('badge_sample_badge_15')
            .badgeStyle()

            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 1, // 设置提醒消息数
              position: BadgePosition.RightTop,
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_top'))
              this.RowContainer($r('app.string.badge_top'))
            // 结束当前组件块
            }.id('badge_sample_badge_16')
            .badgeStyle()

            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              count: 1, // 设置提醒消息数
              position: BadgePosition.Right,
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red }
            // 结束当前组件块
            }) {
              // 处理：this.RowContainer($r('app.string.badge_right'))
              this.RowContainer($r('app.string.badge_right'))
            }.id('badge_sample_badge_17')
            .badgeStyle()
          }.id('badge_sample_row_14')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.badge_style') }).id('badge_sample_introduction_title_18')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              value: ' ',
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 24,
                badgeColor: Color.Blue }
            }) {
              this.RowContainer($r('app.string.badge_blue'))
            }.id('badge_sample_badge_20')
            .badgeStyle()

            // Badge：角标
            // 关键属性：badgeStyle
            Badge({
              value: ' ',
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 14,
                badgeColor: Color.Green }
            }) {
              this.RowContainer($r('app.string.badge_green'))
            }.id('badge_sample_badge_21')
            .badgeStyle()
          }.id('badge_sample_row_19')
          .rowStyle()
        }.id('badge_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('badge_sample_scroll_3')
    }.id('badge_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder RowContainer(description: Resource) {
    // Row：水平布局容器
    // 关键属性：内边距、自身对齐、主轴对齐
    Row() {
      // Text：文本
      // 关键属性：最大行数、字号、字体颜色、文本对齐
      Text(description).id('badge_sample_text_23')
        .maxLines(2)
        .fontSize(16)
        .fontColor($r('app.color.font_color_shallow'))
        .textAlign(TextAlign.Center)
    }.id('badge_sample_row_22')
    .padding(8)
    .alignSelf(ItemAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}