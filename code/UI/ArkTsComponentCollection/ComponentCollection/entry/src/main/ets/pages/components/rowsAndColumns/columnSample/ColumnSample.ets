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
 * @file entry/src/main/ets/pages/components/rowsAndColumns/columnSample/ColumnSample.ets
 * 文件职责：ColumnSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ColumnSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel, PropertyControlPanel } from './ColumnControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .height(400)
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * ColumnSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ColumnSample {
  // @State elementSpacing：组件内部状态
  @State elementSpacing: number = 5;

  // @State alignItems：组件内部状态
  @State alignItems: HorizontalAlign = HorizontalAlign.Center;

  // @State justifyContent：组件内部状态
  @State justifyContent: FlexAlign = FlexAlign.Center;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.column_title') }).id('column_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、主轴对齐、交叉轴对齐
          Column({ space: this.elementSpacing }) {
            // Text：文本
            // 关键属性：高度、宽度、背景色
            Text().id('column_sample_text_6')
              .height(50)
              .width(50)
              .backgroundColor($r('app.color.background_green'))
            // Text：文本
            // 关键属性：高度、宽度、背景色
            Text().id('column_sample_text_7')
              .height(50)
              .width(50)
              .backgroundColor($r('app.color.background_orange'))
            // Text：文本
            // 关键属性：高度、宽度、背景色
            Text().id('column_sample_text_8')
              .height(50)
              .width(50)
              .backgroundColor($r('app.color.background_dark'))
          }.id('column_sample_column_5')
          .backgroundStyle()
          .justifyContent(this.justifyContent)
          .alignItems(this.alignItems)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.column_introduction_arguments') })
            .id('column_sample_introduction_title_9')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
            ArgumentsControlPanel({ elementSpacing: $elementSpacing }).id('column_sample_arguments_control_panel_11')
          }.id('column_sample_column_10')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.column_introduction_properties') })
            .id('column_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // PropertyControlPanel：PropertyControlPanel 自定义组件
            // 关键属性：columnStyle
            PropertyControlPanel({ alignItems: $alignItems, justifyContent: $justifyContent })
              .id('column_sample_property_control_panel_14')
          }.id('column_sample_column_13').columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.column_introduction_tips') })
            .id('column_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.column_tips')).id('column_sample_text_17')
              .fontSize(20)
          }.id('column_sample_column_16')
          .columnStyle()
        }.id('column_sample_column_4')
        .width('100%')
      }.id('column_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 80 })
    }.id('column_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
