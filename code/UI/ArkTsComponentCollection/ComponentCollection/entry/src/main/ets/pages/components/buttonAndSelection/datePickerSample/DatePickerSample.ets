/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/datePickerSample/DatePickerSample.ets
 * 文件职责：DatePickerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DatePickerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

/**
 * DatePickerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DatePickerSample {
  // @State isLunar：组件内部状态
  @State isLunar: boolean = false
  // @State selectDate：组件内部状态
  @State selectDate: string = '2022-10-30'
  // 当前日期选择器组件的日期
  private currentPickerDate: Date = new Date('2022-10-30');

  /**
   * itemBorder：执行 itemBorder 相关逻辑。
   */
  @Styles
  itemBorder() {
    .padding(12)
    .borderRadius(24)
    .margin({ top: 12 })
    .backgroundColor(Color.White)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.date_picker_title') }).id('date_picker_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：itemBorder、内边距、外边距、交叉轴对齐
      Column() {
        // Text：文本
        // 关键属性：宽度、外边距、文本对齐
        Text(this.selectDate)
          .width('100%')
          .margin(12)
          .textAlign(TextAlign.Center)
          .id('dateValue')
        // DatePicker：日期选择器
        // 关键属性：高度、lunar、内容变更回调
        // 交互：输入/提交回调
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2200-12-31'),
          selected: this.currentPickerDate // Default date is 2022-10-30
        })
          .id('datePicker')
          .height(230)
          .lunar(this.isLunar)
          .onChange((date: DatePickerResult) => {
            // Get date from value
            if (date.year !== undefined && date.month !== undefined && date.day !== undefined) {
              let month: string = `${date.month + 1}`;
              let day: string = `${date.day}`;
              if (date.month < 9) {
                month = `0${date.month + 1}`;
              }
              if (date.day < 10) {
                day = `0${date.day}`;
              }
              this.selectDate = `${date.year}-${month}-${day}`;
              this.currentPickerDate.setFullYear(date.year, date.month, date.day);
            }
          })
        // Row：水平布局容器
        Row() {
          // Checkbox：复选框
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Checkbox()
            .onChange(() => {
              this.isLunar = !this.isLunar;
            }).id('Checkbox')
          // Text：文本
          Text($r('app.string.date_picker_lunar')).id('date_picker_sample_text_5')
        }.id('date_picker_sample_row_4')
      }.id('date_picker_sample_column_3')
      .itemBorder()
      .padding({ left: 12, right: 12 })
      .margin({ top: 12, left: 12, right: 12 })
      .alignItems(HorizontalAlign.Start)
    }.id('date_picker_sample_column_1')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}