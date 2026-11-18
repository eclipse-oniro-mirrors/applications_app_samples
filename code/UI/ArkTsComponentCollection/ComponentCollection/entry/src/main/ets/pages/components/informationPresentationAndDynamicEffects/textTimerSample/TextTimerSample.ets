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
 * @file TextTimerSample.ets
 * 文件职责：TextTimerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextTimerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'
import { getStringData } from '../../../../data/ResourceDataHandle'

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
 * TextTimerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextTimerSample {
  textTimerController: TextTimerController = new TextTimerController()
  // @State format：组件内部状态
  @State format: string = 'mm:ss.SS'
  // @State isCountDown：组件内部状态
  @State isCountDown: boolean = true

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_timer') }).id('text_timer_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('text_timer_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // TextTimer：文本计时器
        // 关键属性：format、字体颜色、字号、onTimer、info
        TextTimer({ controller: this.textTimerController, isCountDown: this.isCountDown, count: 30000 })
          .id('text_timer_sample_text_timer_5')
          .format(this.format)
          .fontColor(Color.Black)
          .fontSize(50)
          .onTimer((utc: number, elapsedTime: number) => {
            Logger.info(`textTimer notCountDown utc is：${utc}, elapsedTime: ${elapsedTime}`)
          })
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Button：按钮
          Button($r('app.string.text_timer_start')).onClick(() => {
            this.textTimerController.start()
          }).id('test_start')
          // Blank：占位空白
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Blank().id('text_timer_sample_blank_8')
          // Button：按钮
          Button($r('app.string.text_timer_pause')).onClick(() => {
            this.textTimerController.pause()
          }).id('test_pause')
          // Blank：占位空白
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Blank().id('text_timer_sample_blank_10')
          // Button：按钮
          // 关键属性：宽度
          Button($r('app.string.text_timer_reset')).onClick(() => {
            this.textTimerController.reset()
          }).id('test_reset')
        }.id('text_timer_sample_row_6').width('100%')
      }.id('text_timer_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_options')).id('text_timer_sample_text_12')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度、cardStyle
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_timer_iscountdown')).id('text_timer_sample_text_15')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_timer_sample_blank_16')
          // Toggle：开关
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Toggle({ type: ToggleType.Switch, isOn: this.isCountDown })
            .onChange((isOn) => {
              this.isCountDown = isOn
            }).id('test_toggle')
        }.id('text_timer_sample_row_14').width('100%')
        .height(50)
      }.id('text_timer_sample_column_13').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.textclock_timeformat')).id('text_timer_sample_text_17')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_timer_timeformatone')).id('text_timer_sample_text_20')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_timer_sample_blank_21')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_timer_timeformatone')),
            group: getStringData($r('app.string.text_timer_groupformat'))
          })
            .checked(this.format === getStringData($r('app.string.text_timer_timeformatone')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_timer_timeformatone'))
            }).id('test_radio1')
        }.id('text_timer_sample_row_19').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_timer_timeformattwo')).id('text_timer_sample_text_23')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_timer_sample_blank_24')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_timer_timeformattwo')),
            group: getStringData($r('app.string.text_timer_groupformat'))
          })
            .checked(this.format === getStringData($r('app.string.text_timer_timeformattwo')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_timer_timeformattwo'))
            }).id('test_radio2')
        }.id('text_timer_sample_row_22').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_timer_timeformatthree')).id('text_timer_sample_text_26')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_timer_sample_blank_27')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_timer_timeformatthree')),
            group: getStringData($r('app.string.text_timer_groupformat'))
          })
            .checked(this.format === getStringData($r('app.string.text_timer_timeformatthree')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_timer_timeformatthree'))
            }).id('test_radio3')
        }.id('text_timer_sample_row_25').width('100%')
        .height(50)
      }.id('text_timer_sample_column_18')
      .cardStyle()
      .width('100%')

    }.id('text_timer_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}