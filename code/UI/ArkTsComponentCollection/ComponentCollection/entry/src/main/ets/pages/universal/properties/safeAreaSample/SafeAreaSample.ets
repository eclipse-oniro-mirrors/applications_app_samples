/*
 * Copyright (c) 2023-2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/properties/safeAreaSample/SafeAreaSample.ets
 * 文件职责：SafeAreaSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：columnStyle、SafeAreaSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangePanel } from './ChangePanel'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * columnStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function columnStyle() {
  .width('90%')
  .padding(16)
  .margin(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * SafeAreaSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SafeAreaSample {
  // @State mSafeAreaType：组件内部状态
  @State mSafeAreaType: SafeAreaType[] = [SafeAreaType.CUTOUT]
  // @State mSafeAreaEdge：组件内部状态
  @State mSafeAreaEdge: SafeAreaEdge[] = [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // Stack：层叠布局容器
      Stack() {
        // Row：水平布局容器
        // 关键属性：高度、宽度、背景图、backgroundImageSize、交叉轴对齐、expandSafeArea
        Row() {
        }.id('safe_area_sample_row_3')
        .height('100%')
        .width('100%')
        .backgroundImage($r('app.media.img_test_1'))
        .backgroundImageSize(ImageSize.Cover)
        .alignItems(VerticalAlign.Top)
        .expandSafeArea(this.mSafeAreaType, this.mSafeAreaEdge)

        // Column：垂直布局容器
        // 关键属性：宽度、高度、交叉轴对齐
        Column() {
          // TitleBar：TitleBar 自定义组件
          TitleBar({ title: $r('app.string.safe_area') }).id('safe_area_sample_title_bar_5')
          // Column：垂直布局容器
          // 关键属性：columnStyle、交叉轴对齐
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.safe_area_type_and_safe_area_edge') })
              .id('safe_area_sample_introduction_title_7')
            // ChangePanel：ChangePanel 自定义组件
            ChangePanel({
              mSafeAreaType: $mSafeAreaType,
              mSafeAreaEdge: $mSafeAreaEdge
            }).id('safe_area_sample_change_panel_8')
          }.id('safe_area_sample_column_6')
          .columnStyle()
          .alignItems(HorizontalAlign.Center)

          // TextInput：单行输入框
          // 关键属性：宽度、高度、字号、字体颜色、背景色、enableKeyboardOnFocus
          TextInput({ placeholder: $r('app.string.save_area_input_text') }).id('safe_area_sample_text_input_9')
            .width(320)
            .height(40)
            .fontSize(14)
            .fontColor(Color.Black)
            .backgroundColor(Color.White)
            .enableKeyboardOnFocus(false)
            .margin({ top: 200 })
            .placeholderFont({ size: 14, weight: 400 })
        }.id('safe_area_sample_column_4')
        .width('100%')
        .height('100%')
        .alignItems(HorizontalAlign.Center)
      }.id('safe_area_sample_stack_2')
    }.id('safe_area_sample_column_1')
    .width('100%')
    .height('100%')
  }
}