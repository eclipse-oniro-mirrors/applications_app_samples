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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/marqueeSample/MarqueeSample.ets
 * 文件职责：MarqueeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MarqueeSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'
import { getStringData } from '../../../../data//ResourceDataHandle'

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
 * MarqueeSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MarqueeSample {
  // @State start：组件内部状态
  @State start: boolean = false
  // @State fromStart：组件内部状态
  @State fromStart: boolean = true
  // @State step：组件内部状态
  @State step: number = 50
  // @State loop：组件内部状态
  @State loop: number = 0
  // @State marqueeSrc：组件内部状态
  @State marqueeSrc: string = getStringData($r('app.string.marquee_src'))
  // @State mColor：组件内部状态
  @State mColor: Color = Color.Gray

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.marquee_name') }).id('marquee_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('marquee_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Marquee：跑马灯
        // 关键属性：宽度、字体颜色、字号、allowScale、字重、背景色
        Marquee({
          start: this.start,
          step: this.step,
          loop: this.loop,
          fromStart: this.fromStart,
          src: this.marqueeSrc
        }).id('marquee_sample_marquee_5')
          .width(300)
          .fontColor(Color.White)
          .fontSize(30)
          .allowScale(false)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Gray)
          .margin({ bottom: 40 })
          .onStart(() => {
            Logger.info('Marquee animation complete onStart')
          })
          .onBounce(() => {
            Logger.info('Marquee animation complete onBounce')
          })
          .onFinish(() => {
            Logger.info('Marquee animation complete onFinish')
            this.start = false
            this.loop = 0
          })
        // Button：按钮
        // 关键属性：点击事件回调
        // 交互：可点击交互
        Button(this.start ? 'stop' : 'start')
          .onClick(() => {
            this.start = !this.start
          })
          .id('test_marqueeButton')
          .width(200)
          .height(60)
          .margin({ bottom: 20 })
      }.id('marquee_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_options')).id('marquee_sample_text_6')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.marquee_fromstart')).id('marquee_sample_text_9')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('marquee_sample_blank_10')
          // Toggle：开关
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Toggle({ type: ToggleType.Switch, isOn: this.fromStart })
            .onChange((isOn) => {
              this.fromStart = isOn
            }).id('test_toggle')
        }.id('marquee_sample_row_8').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.marquee_step')).id('marquee_sample_text_12')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('marquee_sample_blank_13')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.step.toString()).id('marquee_sample_text_15')
          }.id('marquee_sample_counter_14')
          .onInc(() => {
            this.step++
          })
          .onDec(() => {
            if (this.step > 0) {
              this.step--
            }
          })
        }.id('marquee_sample_row_11').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.marquee_loop')).id('marquee_sample_text_17')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('marquee_sample_blank_18')
          // Counter：计数器
          // 关键属性：onInc
          Counter() {
            // Text：文本
            Text(this.loop.toString()).id('marquee_sample_text_20')
          }.id('marquee_sample_counter_19')
          .onInc(() => {
            this.loop++
          })
          .onDec(() => {
            if (this.loop > 0) {
              this.loop--
            }
          })
        }.id('marquee_sample_row_16').width('100%')
        .height(50)
      }.id('marquee_sample_column_7')
      .cardStyle()
      .width('100%')

    }.id('marquee_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
