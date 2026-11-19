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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/progressSample/ProgressSample.ets
 * 文件职责：ProgressSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ProgressSample。
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
 * ProgressSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ProgressSample {
  // @State accumulateTime：组件内部状态
  @State accumulateTime: number = 0
  // @State progress：组件内部状态
  @State progress: number = 50
  controller: TextClockController = new TextClockController()

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.progress_name') }).id('progress_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_linear')).id('progress_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Column：垂直布局容器
        // 关键属性：cardStyle
        Column({ space: 15 }) {
          // Progress：进度条
          // 关键属性：宽度
          Progress({ value: this.progress, type: ProgressType.Linear }).id('progress_sample_progress_6').width(200)
          // Progress：进度条
          // 关键属性：color、宽度
          Progress({ value: this.progress, total: 150, type: ProgressType.Linear }).id('progress_sample_progress_7')
            .color(Color.Grey)
            .width(200)
        }.id('progress_sample_column_5')
      }.id('progress_sample_column_4').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_eclipse')).id('progress_sample_text_8')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Row：水平布局容器
        // 关键属性：cardStyle
        Row({ space: 40 }) {
          // Progress：进度条
          // 关键属性：宽度
          Progress({ value: this.progress, type: ProgressType.Eclipse }).id('progress_sample_progress_11').width(50)
          // Progress：进度条
          // 关键属性：宽度、color
          Progress({ value: this.progress, total: 150, type: ProgressType.Eclipse })
            .id('progress_sample_progress_12')
            .width(50)
            .color(Color.Grey)
        }.id('progress_sample_row_10')
      }.id('progress_sample_column_9').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_scalering')).id('progress_sample_text_13')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column({ space: 10 }) {
        // Row：水平布局容器
        // 关键属性：cardStyle
        Row({ space: 20 }) {
          // Progress：进度条
          // 关键属性：宽度
          Progress({ value: this.progress, type: ProgressType.ScaleRing }).id('progress_sample_progress_16').width(50)
          // Progress：进度条
          // 关键属性：color、宽度、样式
          Progress({ value: this.progress, total: 150, type: ProgressType.ScaleRing }).id('progress_sample_progress_17')
            .color(Color.Grey).width(50)
            .style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })
          // Progress：进度条
          // 关键属性：color、宽度、样式
          Progress({ value: this.progress, total: 150, type: ProgressType.ScaleRing }).id('progress_sample_progress_18')
            .color(Color.Grey).width(50)
            .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
          // Progress：进度条
          // 关键属性：color、宽度、样式
          Progress({ value: this.progress, total: 150, type: ProgressType.ScaleRing }).id('progress_sample_progress_19')
            .color(Color.Grey).width(50)
            .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 3 })
        }.id('progress_sample_row_15')
      }.id('progress_sample_column_14').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_ring')).id('progress_sample_text_20')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Row：水平布局容器
        // 关键属性：cardStyle
        Row({ space: 40 }) {
          // Progress：进度条
          // 关键属性：宽度
          Progress({ value: this.progress, type: ProgressType.Ring }).id('progress_sample_progress_23').width(50)
          // Progress：进度条
          // 关键属性：color、宽度、样式
          Progress({ value: this.progress, total: 150, type: ProgressType.Ring }).id('progress_sample_progress_24')
            .color(Color.Grey).width(50)
            .style({ strokeWidth: 10, scaleCount: 30, scaleWidth: 20 })
        }.id('progress_sample_row_22')
      }.id('progress_sample_column_21').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_capsule')).id('progress_sample_text_25')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        Row({ space: 40 }) {
          // Progress：进度条
          // 关键属性：宽度、高度
          Progress({ value: this.progress, type: ProgressType.Capsule })
            .id('progress_sample_progress_28')
            .width(100)
            .height(50)
          // Progress：进度条
          // 关键属性：color、宽度、高度
          Progress({ value: this.progress, total: 150, type: ProgressType.Capsule }).id('progress_sample_progress_29')
            .color(Color.Grey)
            .width(100)
            .height(50)
        }.id('progress_sample_row_27')
      }.id('progress_sample_column_26')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.progress_change')).id('progress_sample_text_30')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度、高度
      Column() {
        // Row：水平布局容器
        Row({ space: 10 }) {
          // Slider：滑块
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Slider({
            value: this.progress,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          }).id('progress_sample_slider_33')
            .onChange((value: number) => {
              this.progress = value
            })
        }.id('progress_sample_row_32')
      }.id('progress_sample_column_31')
      .cardStyle()
      .width('100%')
    }.id('progress_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}