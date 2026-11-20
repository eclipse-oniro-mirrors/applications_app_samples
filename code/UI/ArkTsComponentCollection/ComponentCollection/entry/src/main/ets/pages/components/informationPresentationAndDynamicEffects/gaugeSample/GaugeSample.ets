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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/gaugeSample/GaugeSample.ets
 * 文件职责：GaugeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GaugeSample。
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

@Extend(Circle) function colorPicker(color: Color | string, callback: () => void) {
  .fill(color)
  .height(20)
  .width(20)
  .onClick(() => {
    callback()
  })
}

@Styles function pressedStyle() {
  .opacity(0.7)
  .borderWidth(1)
  .borderRadius(20)
}

/**
 * GaugeSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GaugeSample {
  // @State start：组件内部状态
  @State start: boolean = false
  // @State fromStart：组件内部状态
  @State fromStart: boolean = true
  // @State step：组件内部状态
  @State step: number = 50
  // @State loop：组件内部状态
  @State loop: number = 3
  // @State mColor：组件内部状态
  @State mColor: Color = Color.Gray
  // @State value：组件内部状态
  @State value: number = 0
  // @State startAngle：组件内部状态
  @State startAngle: number = 210
  // @State endAngle：组件内部状态
  @State endAngle: number = 150
  // @State mWidth：组件内部状态
  @State mWidth: number = 10

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.gauge_name') }).id('gauge_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('gauge_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Gauge：仪表盘
        // 关键属性：宽度、高度、colors、startAngle、endAngle、strokeWidth
        Gauge({ value: this.value }).id('gauge_sample_gauge_5')
          .width(200)
          .height(200)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .startAngle(this.startAngle)
          .endAngle(this.endAngle)
          .strokeWidth(this.mWidth)
      }.id('gauge_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_options')).id('gauge_sample_text_6')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.gauge_value')).id('gauge_sample_text_9')
            .leftTitleStyle()
          // Row：水平布局容器
          // 关键属性：布局权重、宽度
          Row({ space: 10 }) {
            // Slider：滑块
            // 关键属性：内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.value,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            })
              .id('gauge_slider_001')
              .onChange((value: number) => {
                this.value = value
              })
          }.id('gauge_sample_row_10').layoutWeight(1)
        }.id('gauge_sample_row_8').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.gauge_strokewidth')).id('gauge_sample_text_12')
            .leftTitleStyle()
          // Row：水平布局容器
          // 关键属性：布局权重、宽度
          Row({ space: 10 }) {
            // Slider：滑块
            // 关键属性：内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.mWidth,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            })
              .id('gauge_slider_002')
              .onChange((value: number) => {
                this.mWidth = value
              })
          }.id('gauge_sample_row_13').layoutWeight(1)
        }.id('gauge_sample_row_11').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.gauge_startangle')).id('gauge_sample_text_15')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('gauge_sample_blank_16')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.startAngle.toString()).id('gauge_sample_text_18')
          }.id('gauge_sample_counter_17')
          .onInc(() => {
            this.startAngle++
          })
          .onDec(() => {
            if (this.startAngle > 0) {
              this.startAngle--
            }
          })
        }.id('gauge_sample_row_14').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.gauge_endangle')).id('gauge_sample_text_20')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('gauge_sample_blank_21')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.endAngle.toString()).id('gauge_sample_text_23')
          }.id('gauge_sample_counter_22')
          .onInc(() => {
            this.endAngle++
          })
          .onDec(() => {
            if (this.endAngle > 0) {
              this.endAngle--
            }
          })
        }.id('gauge_sample_row_19').width('100%')
        .height(50)
      }.id('gauge_sample_column_7')
      .cardStyle()
      .width('100%')

    }.id('gauge_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}