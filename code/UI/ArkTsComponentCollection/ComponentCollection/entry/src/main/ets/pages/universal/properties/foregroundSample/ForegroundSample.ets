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
 * @file entry/src/main/ets/pages/universal/properties/foregroundSample/ForegroundSample.ets
 * 文件职责：ForegroundSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：foreground。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .padding(8)
  .height(120)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ bottom: 12 })
}

@Extend(Text) function textStyle(marginValue: number) {
  .height(80)
  .fontSize(18)
  .layoutWeight(1)
  .fontColor(Color.White)
  .textAlign(TextAlign.Center)
  .margin({ left: marginValue, right: marginValue })
}

/**
 * foreground：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct foreground {

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.prop_foreground') }).id('foreground_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、外边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.foreground_color') })
            .id('foreground_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、背景色、foregroundColor
            Text('Brand').id('foreground_sample_text_7')
              .textStyle(20)
              .backgroundColor($r('app.color.scrollbar_background_color'))
              .foregroundColor($r('app.color.background_blue'))
            // Text：文本
            // 关键属性：textStyle、背景色、foregroundColor
            Text('Warning').id('foreground_sample_text_8')
              .textStyle(20)
              .backgroundColor($r('app.color.scrollbar_background_color'))
              .foregroundColor($r('app.color.background_orange'))
            // Text：文本
            // 关键属性：textStyle、背景色、foregroundColor
            Text('Danger').id('foreground_sample_text_9')
              .textStyle(20)
              .backgroundColor($r('app.color.scrollbar_background_color'))
              .foregroundColor($r('app.color.background_pink'))
          }.id('foreground_sample_row_6')
          .rowStyle()
        }.id('foreground_sample_column_4')
        .padding({ left: 12, right: 12 })
        .margin({ bottom: 80 })
        .constraintSize({ minHeight: '100%' })
      }.id('foreground_sample_scroll_3')
    }.id('foreground_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}