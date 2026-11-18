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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/timePickerSample/TimePickerSample.ets
 * 文件职责：TimePickerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TimePickerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'

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
 * TimePickerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TimePickerSample {
  // @State isMilitaryTime：组件内部状态
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date()

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.time_picker') }).id('time_picker_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // TimePicker：时间选择器
        // 关键属性：useMilitaryTime、内容变更回调、setHours
        // 交互：输入/提交回调
        TimePicker({
          selected: this.selectedTime,
        }).id('time_picker_sample_time_picker_4')
          .useMilitaryTime(this.isMilitaryTime)
          .onChange((value: TimePickerResult) => {
            this.selectedTime.setHours(value.hour, value.minute)
            Logger.info(`select current date is: ${JSON.stringify(value)}`)
          })
          .height(300)
      }.id('time_picker_sample_column_3')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_options')).id('time_picker_sample_text_5')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度、高度、cardStyle
        Row() {
          // Text：文本
          // 关键属性：leftTitleStyle、宽度
          Text($r('app.string.time_picker_options_usemilitarytime')).id('time_picker_sample_text_8')
            .leftTitleStyle()
            .width('50%')
          // Blank：占位空白
          Blank().id('time_picker_sample_blank_9')
          // Toggle：开关
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Toggle({ type: ToggleType.Switch, isOn: this.isMilitaryTime })
            .onChange((isOn) => {
              this.isMilitaryTime = isOn
            }).id('test_toggle')
        }.id('time_picker_sample_row_7').width('100%')
        .height(50)
      }.id('time_picker_sample_column_6').cardStyle()
    }.id('time_picker_sample_column_1').width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}