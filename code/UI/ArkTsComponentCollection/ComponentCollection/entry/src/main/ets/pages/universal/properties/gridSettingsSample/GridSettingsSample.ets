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
 * @file entry/src/main/ets/pages/universal/properties/gridSettingsSample/GridSettingsSample.ets
 * 文件职责：GridSettingsSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridSettingsSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import Logger from '../../../../util/Logger';

@Extend(Row) function rowStyle() {
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

@Extend(Column) function columnStyle() {
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * GridSettingsSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GridSettingsSample {
  // @State Number：组件内部状态
  @State Number: String[] = ['0', '1', '2', '3']

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.grid_settings') }).id('grid_settings_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束、内边距
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.grid_settings_useSize') })
            .id('grid_settings_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：宽度
          Column() {
            // GridContainer：GridContainer 自定义组件
            // 关键属性：高度
            GridContainer() {
              // Row：水平布局容器
              // 关键属性：高度、rowStyle
              Row() {
                // Row：水平布局容器
                // 关键属性：useSizeType
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.mouse_event_mouseBtn_left')).id('grid_settings_sample_text_10')
                    .fontSize(16)
                }.id('grid_settings_sample_row_9')
                .useSizeType({
                  xs: { span: 1, offset: 0 }, sm: { span: 1, offset: 0 },
                  md: { span: 1, offset: 0 }, lg: { span: 2, offset: 0 }
                })
                .height('100%')
                .backgroundColor(0x66bbb2cb)

                // Row：水平布局容器
                // 关键属性：useSizeType
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.location_settings_center')).id('grid_settings_sample_text_12')
                    .fontSize(16)
                }.id('grid_settings_sample_row_11')
                .useSizeType({
                  xs: { span: 1, offset: 0 }, sm: { span: 2, offset: 1 },
                  md: { span: 5, offset: 1 }, lg: { span: 7, offset: 2 }
                })
                .height('100%')
                .backgroundColor(0x66b6c5d1)

                // Row：水平布局容器
                // 关键属性：useSizeType
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.mouse_event_mouseBtn_right')).id('grid_settings_sample_text_14')
                    .fontSize(16)
                }.id('grid_settings_sample_row_13')
                .useSizeType({
                  xs: { span: 1, offset: 0 }, sm: { span: 1, offset: 3 },
                  md: { span: 2, offset: 6 }, lg: { span: 3, offset: 9 }
                })
                .height('100%')
                .backgroundColor(0x66bbb2cb)
              }.id('grid_settings_sample_row_8')
              .height(180)
              .rowStyle()
            }.id('grid_settings_sample_grid_container_7')
            .height(200)
          }.id('grid_settings_sample_column_6')
          .width('100%')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.grid_settings_gridSpan') })
            .id('grid_settings_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：宽度
          Column() {
            // GridContainer：GridContainer 自定义组件
            // 关键属性：高度
            GridContainer() {
              // Row：水平布局容器
              // 关键属性：高度、rowStyle
              Row() {
                // Row：水平布局容器
                // 关键属性：gridSpan、高度、背景色
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.mouse_event_mouseBtn_left')).id('grid_settings_sample_text_20')
                    .fontSize(16)
                }.id('grid_settings_sample_row_19')
                .gridSpan(1)
                .height('100%')
                .backgroundColor(0x66bbb2cb)

                // Row：水平布局容器
                // 关键属性：useSizeType
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.location_settings_center')).id('grid_settings_sample_text_22')
                    .fontSize(16)
                }.id('grid_settings_sample_row_21')
                .useSizeType({
                  xs: { span: 1, offset: 0 }, sm: { span: 2, offset: 1 },
                  md: { span: 5, offset: 1 }, lg: { span: 7, offset: 2 }
                })
                .height('100%')
                .gridSpan(2)
                .gridOffset(1)
                .backgroundColor(0x66b6c5d1)

                // Row：水平布局容器
                // 关键属性：gridSpan、gridOffset、高度、背景色
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.mouse_event_mouseBtn_right')).id('grid_settings_sample_text_24')
                    .fontSize(16)
                }.id('grid_settings_sample_row_23')
                .gridSpan(1)
                .gridOffset(3)
                .height('100%')
                .backgroundColor(0x66bbb2cb)
              }.id('grid_settings_sample_row_18')
              .height(180)
              .rowStyle()
            }.id('grid_settings_sample_grid_container_17')
            .height(200)
          }.id('grid_settings_sample_column_16')
          .width('100%')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.grid_edgeEffect_spring') })
            .id('grid_settings_sample_introduction_title_25')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Grid：网格容器
            // 关键属性：columnsTemplate、列间距、行间距、边缘效果、onScrollIndex、info
            Grid() {
              ForEach(this.Number, (day: string) => {
                ForEach(this.Number, (day: string) => {
                  // GridItem：网格项
                  GridItem() {
                    // Text：文本
                    // 关键属性：字号、背景色、宽度、高度、文本对齐
                    Text(day).id('grid_settings_sample_text_29')
                      .fontSize(16)
                      .backgroundColor(0x66bbb2cb)
                      .width('100%')
                      .height(80)
                      .textAlign(TextAlign.Center)
                  }.id('grid_settings_sample_grid_item_28')
                }, (day: string) => day)
              }, (day: string) => day)
            }.id('grid_settings_sample_grid_27')
            .columnsTemplate('1fr 1fr 1fr 1fr')
            .columnsGap(10)
            .rowsGap(10)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollIndex((first: number) => {
              Logger.info(first.toString())
            })
            .width('90%')
            .backgroundColor(0x66b6c5d1)
            .height(300)
            .scrollBar(BarState.On)
          }.id('grid_settings_sample_column_26')
          .columnStyle()
        }.id('grid_settings_sample_column_4')
        .constraintSize({ minHeight: '100%' })
        .padding(12)
      }.id('grid_settings_sample_scroll_3')
    }.id('grid_settings_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}