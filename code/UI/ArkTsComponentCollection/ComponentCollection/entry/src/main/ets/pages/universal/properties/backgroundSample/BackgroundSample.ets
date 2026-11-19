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
 * @file entry/src/main/ets/pages/universal/properties/backgroundSample/BackgroundSample.ets
 * 文件职责：BackgroundSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Background。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'
import { ChangePanel } from './ChangePanel'

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
  .margin({ bottom: 12 })
}

@Extend(Text) function titleText() {
  .fontSize(18)
  .margin({ bottom: 4 })
  .textAlign(TextAlign.Center)
  .fontColor($r('app.color.font_color_shallow'))
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Text) function textBorder() {
  .width('100%')
  .textStyle(12)
  .borderWidth(1)
  .borderRadius(8)
  .borderColor(Color.Black)
}

/**
 * Background：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Background {
  // @State imageSize：组件内部状态
  @State imageSize: ImageSize = ImageSize.Cover
  // @State alignment：组件内部状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @State alignment: Alignment = Alignment.TopStart
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.prop_background') }).id('background_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、外边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.background_color') })
            .id('background_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、背景色
            Text('Brand').id('background_sample_text_7')
              .textStyle(20)
              .backgroundColor($r('app.color.background_blue'))
            // Text：文本
            // 关键属性：textStyle、背景色
            Text('Warning').id('background_sample_text_8')
              .textStyle(20)
              .backgroundColor($r('app.color.background_orange'))
            // Text：文本
            // 关键属性：textStyle、背景色
            Text('Danger').id('background_sample_text_9')
              .textStyle(20)
              .backgroundColor($r('app.color.background_pink'))
          }.id('background_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.background_gradient') })
            .id('background_sample_introduction_title_10')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Text：文本
            // 关键属性：textStyle、线性渐变
            Text($r('app.string.background_gradient_linear')).id('background_sample_text_12')
              .textStyle(20)
              .linearGradient({
                angle: 180,
                direction: GradientDirection.Bottom,
                colors: [[$r('app.color.background_blue'), 0.3], [$r('app.color.background_green'), 1]],
                repeating: false
              })
            // Text：文本
            // 关键属性：textStyle、扫描渐变
            Text($r('app.string.background_gradient_sweep')).id('background_sample_text_13')
              .textStyle(20)
              .sweepGradient({
                center: [50, 50],
                start: 0,
                end: 359,
                rotation: 45,
                repeating: false,
                colors: [[$r('app.color.background_blue'), 0.3], [$r('app.color.background_green'), 1]]
              })
            // Text：文本
            // 关键属性：textStyle、径向渐变
            Text($r('app.string.background_gradient_radial')).id('background_sample_text_14')
              .textStyle(20)
              .radialGradient({
                center: [50, 50],
                radius: 50,
                repeating: true,
                colors: [[$r('app.color.background_blue'), 0.3], [$r('app.color.background_green'), 0.6]]
              })
          }.id('background_sample_row_11')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.background_image') })
            .id('background_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Grid：网格容器
            // 关键属性：行间距、内边距、高度、列间距、圆角、rowsTemplate
            Grid() {
              // GridItem：网格项
              GridItem() {
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：titleText
                  Text($r('app.string.background_image_default')).id('background_sample_text_20')
                    .titleText()
                  // Text：文本
                  // 关键属性：textBorder、backgroundImageSize、背景图
                  Text().id('background_sample_text_21')
                    .textBorder()
                    .backgroundImageSize(ImageSize.Cover)
                    .backgroundImage($r('app.media.ic_scenery1'))
                }.id('background_sample_column_19')
              }.id('background_sample_grid_item_18')

            // GridItem：网格项
            GridItem() {
              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：titleText
                Text($r('app.string.background_image_repeat')).id('background_sample_text_24')
                  .titleText()
                // Text：文本
                // 关键属性：textBorder、backgroundImageSize、背景图
                Text().id('background_sample_text_25')
                  .textBorder()
                  .backgroundImageSize({ width: 100, height: 100 })
                  .backgroundImage($r('app.media.ic_scenery1'), ImageRepeat.XY)
              }.id('background_sample_column_23')
            }.id('background_sample_grid_item_22')

            // GridItem：网格项
            GridItem() {
              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：titleText
                Text($r('app.string.background_image_size')).id('background_sample_text_28')
                  .titleText()
                // Text：文本
                // 关键属性：textBorder、背景图、backgroundImageSize
                Text().id('background_sample_text_29')
                  .textBorder()
                  .backgroundImage($r('app.media.ic_scenery1'))
                  .backgroundImageSize({ width: '50%', height: '100%' })
              }.id('background_sample_column_27')
            }.id('background_sample_grid_item_26')

              // GridItem：网格项
              GridItem() {
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：titleText
                  Text($r('app.string.background_image_offset')).id('background_sample_text_32')
                    .titleText()
                  // Text：文本
                  // 关键属性：textBorder、backgroundImageSize、backgroundImagePosition、背景图
                  Text().id('background_sample_text_33')
                    .textBorder()
                    .backgroundImageSize(ImageSize.Cover)
                    .backgroundImagePosition({ x: 20, y: 20 })
                    .backgroundImage($r('app.media.ic_scenery1'))
                }.id('background_sample_column_31')
              }.id('background_sample_grid_item_30')
            }.id('background_sample_grid_17')
            .rowsGap(8)
            .padding(8)
            .height(250)
            .columnsGap(8)
            .borderRadius(24)
            .rowsTemplate('1fr 1fr')
            .columnsTemplate('1fr 1fr')
            .backgroundColor(Color.White)
            .margin({ left: 12, right: 12 })

          }.id('background_sample_column_16')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.background_image_transformation_effect') })
            .id('background_sample_introduction_title_34')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：宽度、高度、圆角、边框宽度、边框颜色、backgroundImageSize
            Text().id('background_sample_text_36')
              .width('100%')
              .height(200)
              .borderRadius(8)
              .borderWidth(1)
              .borderColor(Color.Black)
              .backgroundImageSize(this.imageSize)
              .backgroundImagePosition(this.alignment)
              .animation({
                duration: 2000
              })
              .margin({ bottom: 4 })
              .backgroundImage($r('app.media.ic_scenery1'))

            // ChangePanel：ChangePanel 自定义组件
            // 关键属性：外边距
            ChangePanel({
              imageSize: $imageSize,
              alignment: $alignment
            }).id('background_sample_change_panel_37')
            .margin({ bottom: 40 })
          }.id('background_sample_column_35')
          .columnStyle()
        }.id('background_sample_column_4')
        .padding({ left: 12, right: 12 })
        .margin({ bottom: 80 })
        .constraintSize({ minHeight: '100%' })
      }.id('background_sample_scroll_3')
    }.id('background_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}