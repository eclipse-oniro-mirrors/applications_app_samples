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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/ratingSample/RatingSample.ets
 * 文件职责：RatingSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RatingSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

/**
 * RatingSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RatingSample {
  // @State rating：组件内部状态
  @State rating: number = 1
  // @State indicator：组件内部状态
  @State indicator: boolean = false
  // @State stars：组件内部状态
  @State stars: number = 5

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.rating_name') }).id('rating_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('rating_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Rating：评分
        // 关键属性：stars、stepSize、内容变更回调
        // 交互：输入/提交回调
        Rating({ rating: this.rating, indicator: this.indicator })
          .stars(this.stars)
          .stepSize(0.5)
          .onChange((value: number) => {
            this.rating = value
          }).id('test_rating')
      }.id('rating_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_options')).id('rating_sample_text_5')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.rating_options_indicator')).id('rating_sample_text_8')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('rating_sample_blank_9')
          // Toggle：开关
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Toggle({ type: ToggleType.Switch, isOn: this.indicator })
            .onChange((isOn) => {
              this.indicator = isOn
            }).id('test_indicator')
        }.id('rating_sample_row_7').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.rating_options_value')).id('rating_sample_text_11')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('rating_sample_blank_12')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.rating.toString()).id('rating_sample_text_14')
          }.id('rating_sample_counter_13')
          .onInc(() => {
            if (this.rating < this.stars)
              this.rating += 0.5 // 评分0.5
          })
          .onDec(() => {
            if (this.rating > 0)
              this.rating -= 0.5
          })
        }.id('rating_sample_row_10').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.rating_options_stars')).id('rating_sample_text_16')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('rating_sample_blank_17')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.stars.toString()).id('rating_sample_text_19')
          }.id('rating_sample_counter_18')
          .onInc(() => {
            if (this.stars <= 8) // 总分为8
              this.stars++
          })
          .onDec(() => {
            if (this.stars > 1)
              this.stars--
          })
        }.id('rating_sample_row_15').width('100%')
        .height(50)
      }.id('rating_sample_column_6')
      .cardStyle()
      .width('100%')

    }.id('rating_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
