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
 * @file TextClockSample.ets
 * 文件职责：TextClockSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextClockSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
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
 * TextClockSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextClockSample {
  // @State format：组件内部状态
  @State format: string = 'HH:mm:ss'
  // @State accumulateTime：组件内部状态
  @State accumulateTime: number = 0
  // @State fontFeature：组件内部状态
  @State fontFeature: string = 'ss01';

  // @State textShadows：组件内部状态
  @State textShadows: ShadowOptions | Array<ShadowOptions> = [];
  controller: TextClockController = new TextClockController();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_clock') }).id('text_clock_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('text_clock_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // TextClock：文本时钟
        // 关键属性：format、外边距、字号、textShadow、fontFeature
        TextClock({ timeZoneOffset: -8, controller: this.controller }).id('text_clock_sample_text_clock_5')
          .format(this.format)
          .margin(20)
          .fontSize(30)
          .textShadow(this.textShadows)
          .fontFeature(this.fontFeature)
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Button：按钮
          Button($r('app.string.text_clock_start')).onClick(() => {
            this.controller.start()
          }).id('test_start')
          // Blank：占位空白
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Blank().id('text_clock_sample_blank_8')
          // Button：按钮
          // 关键属性：宽度
          Button($r('app.string.text_clock_stop')).onClick(() => {
            this.controller.stop()
          }).id('test_stop')
        }.id('text_clock_sample_row_6').width('100%')
      }.id('text_clock_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.textclock_timeformat')).id('text_clock_sample_text_10')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_clock_timeformatone')).id('text_clock_sample_text_13')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_clock_sample_blank_14')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_clock_timeformatone')),
            group: getStringData($r('app.string.text_clock_groupformat'))
          }).id('test_radio1')
            .checked(this.format === getStringData($r('app.string.text_clock_timeformatone')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_clock_timeformatone'))
            })
        }.id('text_clock_sample_row_12').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_clock_timeformattwo')).id('text_clock_sample_text_16')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_clock_sample_blank_17')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_clock_timeformattwo')),
            group: getStringData($r('app.string.text_clock_groupformat'))
          }).id('test_radio2')
            .checked(this.format === getStringData($r('app.string.text_clock_timeformattwo')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_clock_timeformattwo'))
            })
        }.id('text_clock_sample_row_15').width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_clock_timeformatthree')).id('text_clock_sample_text_19')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_clock_sample_blank_20')
          // Radio：单选框
          // 关键属性：勾选状态、内容变更回调
          // 交互：输入/提交回调
          Radio({
            value: getStringData($r('app.string.text_clock_timeformatthree')),
            group: getStringData($r('app.string.text_clock_groupformat'))
          }).id('test_radio3')
            .checked(this.format === getStringData($r('app.string.text_clock_timeformatthree')))
            .onChange((isChecked: boolean) => {
              if (isChecked)
                this.format = getStringData($r('app.string.text_clock_timeformatthree'))
            })
        }.id('text_clock_sample_row_18').width('100%')
        .height(50)
      }.id('text_clock_sample_column_11')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.textclock_style')).id('text_clock_sample_text_21')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_clock_textShadow')).id('text_clock_sample_text_24')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_clock_sample_blank_25')
          // Toggle：开关
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Toggle({ type: ToggleType.Switch, isOn: false })
            .id('text_shadow')
            .onChange((isOn: boolean) => {
              if (isOn) {
                this.textShadows = [{ radius: 10, color: Color.Green, offsetX: 10, offsetY: 0 }];
              } else {
                this.textShadows = [{ radius: 0, color: Color.White, offsetX: 0, offsetY: 0 }];
              }
            })
        }.id('text_clock_sample_row_23')
        .width('100%')
        .height(50)

        // Row：水平布局容器
        // 关键属性：宽度、高度
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.text_clock_fontSetting')).id('text_clock_sample_text_27')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('text_clock_sample_blank_28')
          // Select：下拉选择器
          // 关键属性：选中状态、当前值、onSelect
          Select([{ value: $r('app.string.text_clock_monospaced_numbers') },
            { value: $r('app.string.text_clock_monovolume_numbers') }])
            .id('font_setting')
            .selected(0)
            .value($r('app.string.text_clock_select_button'))
            .onSelect((index: number) => {
              if (index === 0) {
                this.fontFeature = 'ss01';
              } else if (index === 1) {
                this.fontFeature = 'ss02';
              }
            })

        }.id('text_clock_sample_row_26').width('100%')
        .height(50)
      }.id('text_clock_sample_column_22')
      .cardStyle()
      .width('100%')
    }.id('text_clock_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
