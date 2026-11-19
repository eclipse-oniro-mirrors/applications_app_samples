/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/dateDialogSample/DateDialogSample.ets
 * 文件职责：DateDialogSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：textStyle、rowStyle、DataDialogSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'
import { getStringData } from '../../../../data/ResourceDataHandle'

/**
 * textStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function textStyle() {
  .height(40)
  .padding(8)
  .fontSize(20)
  .borderRadius(20)
  .fontColor($r('app.color.background_blue'))
  .backgroundColor($r('app.color.background_grey'))
}

/**
 * rowStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Row)
function rowStyle() {
  .height(50)
  .padding(6)
  .width('100%')
  .borderRadius(24)
  .margin({ top: 12, bottom: 12 })
}

/**
 * DataDialogSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DataDialogSample {
  // @State lunarDate：组件内部状态
  @State lunarDate: string = getStringData($r('app.string.date_picker_dialog_datetimeone'))
  // @State gregorianDate：组件内部状态
  @State gregorianDate: string = getStringData($r('app.string.date_picker_dialog_datetimeone'))
  private context = getContext(this)
  private selectedDate: Date = new Date(getStringData($r('app.string.date_picker_dialog_datetimeone')))

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.date_picker_dialog') }).id('date_dialog_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.date_picker_dialog_date') })
            .id('date_dialog_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row({ space: 16 }) {
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.date_picker_dialog_date_lunar')).id('date_dialog_sample_text_7')
              .fontSize(20)
            // Text：文本
            // 关键属性：textStyle、点击事件回调、show
            // 交互：可点击交互
            Text(this.lunarDate)
              .textStyle()
              .onClick(() => {
                DatePickerDialog.show({
                  start: new Date(getStringData($r('app.string.date_picker_dialog_datetimetwo'))),
                  end: new Date(getStringData($r('app.string.date_picker_dialog_datetimethree'))),
                  selected: this.selectedDate,
                  lunar: true,
                  onAccept: (value: DatePickerResult) => {
                    this.setDate(true, value)
                  },
                  onCancel: () => {
                    ShowToast.shortToast($r('app.string.date_picker_dialog_cancel'))
                  },
                  onChange: (value: DatePickerResult) => {
                    this.ShowToastDate(value)
                  }
                })
              }).id('test_lunar')
          }.id('date_dialog_sample_row_6')
          .rowStyle()

          // Row：水平布局容器
          // 关键属性：rowStyle
          Row({ space: 16 }) {
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.date_picker_dialog_date_gregorian')).id('date_dialog_sample_text_9')
              .fontSize(20)
            // Text：文本
            // 关键属性：textStyle、点击事件回调、show
            // 交互：可点击交互
            Text(this.gregorianDate)
              .textStyle()
              .onClick(() => {
                DatePickerDialog.show({
                  start: new Date(getStringData($r('app.string.date_picker_dialog_datetimetwo'))),
                  end: new Date(getStringData($r('app.string.date_picker_dialog_datetimethree'))),
                  selected: this.selectedDate,
                  lunar: false,
                  onAccept: (value: DatePickerResult) => {
                    this.setDate(false, value)
                  },
                  onCancel: () => {
                    ShowToast.shortToast($r('app.string.date_picker_dialog_cancel'))
                  },
                  onChange: (value: DatePickerResult) => {
                    this.ShowToastDate(value)
                  }
                })
              }).id('test_gregorian')
          }.id('date_dialog_sample_row_8')
          .rowStyle()
        }.id('date_dialog_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('date_dialog_sample_scroll_3')
    }.id('date_dialog_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  /**
   * setDate：执行 setDate 相关逻辑。
   */
  setDate(isLunar: boolean, value: DatePickerResult) {
    if (value.year !== undefined && value.month !== undefined && value.day !== undefined) {
      this.selectedDate.setFullYear(value.year, value.month, value.day);
      let month: string = `${value.month + 1}`;
      let day: string = `${value.day}`;
      if (value.month < 9) {
        month = `0${value.month + 1}`;
      }
      if (value.day < 10) {
        day = `0${value.day}`;
      }
      if (isLunar) {
        this.lunarDate = `${value.year}-${month}-${day}`;
      } else {
        this.gregorianDate = `${value.year}-${month}-${day}`;
      }
    }
  }

  // ShowToastDate：ShowToastDate 自定义组件
  /**
   * ShowToastDate：执行 ShowToastDate 相关逻辑。
   */
  ShowToastDate(value: DatePickerResult) {
    if (value.year !== undefined && value.month !== undefined && value.day !== undefined) {
      let month: string = `${value.month + 1}`;
      let day: string = `${value.day}`;
      if (value.month < 9) {
        month = `0${value.month + 1}`;
      }
      if (value.day < 10) {
        day = `0${value.day}`;
      }
      ShowToast.shortToast(`${this.context.resourceManager.getStringSync($r('app.string.date_picker_toast_date')
)}${value.year}-${month}-${day}`);
    }
  }
}