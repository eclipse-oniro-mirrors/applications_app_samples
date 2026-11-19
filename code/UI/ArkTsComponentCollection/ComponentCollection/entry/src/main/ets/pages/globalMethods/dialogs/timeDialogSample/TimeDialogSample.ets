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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/timeDialogSample/TimeDialogSample.ets
 * 文件职责：TimeDialogSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：textStyle、rowStyle、TimeDialogSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

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
 * TimeDialogSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TimeDialogSample {
  // @State fullTime：组件内部状态
  @State fullTime: string = getStringData($r('app.string.time_picker_dialog_timeone'));

  // @State halfTime：组件内部状态
  @State halfTime: string = getStringData($r('app.string.time_picker_dialog_timeone'));
  private context: Context = getContext(this);
  private selectTime: Date = new Date(getStringData($r('app.string.time_picker_dialog_timetwo')));

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.time_picker_dialog') }).id('time_dialog_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.time_picker_dialog_time') })
            .id('time_dialog_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row({ space: 16 }) {
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.time_picker_dialog_24_hour')).id('time_dialog_sample_text_7')
              .fontSize(20)
            // Text：文本
            // 关键属性：textStyle、点击事件回调、show
            // 交互：可点击交互
            Text(this.fullTime)
              .textStyle()
              .onClick(() => {
                TimePickerDialog.show({
                  selected: this.selectTime,
                  useMilitaryTime: true,
                  onAccept: (value: TimePickerResult) => {
                    this.setTime(true, value)
                  },
                  onCancel: () => {
                    ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'))
                  },
                  onChange: (value: TimePickerResult) => {
                    this.ShowToastTime(value)
                  }
                })
              }).id('test_24hour')
          }.id('time_dialog_sample_row_6')
          .rowStyle()

          // Row：水平布局容器
          // 关键属性：rowStyle
          Row({ space: 16 }) {
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.time_picker_dialog_12_hour')).id('time_dialog_sample_text_9')
              .fontSize(20)
            // Text：文本
            // 关键属性：textStyle、点击事件回调、show
            // 交互：可点击交互
            Text(this.halfTime)
              .textStyle()
              .onClick(() => {
                TimePickerDialog.show({
                  selected: this.selectTime,
                  useMilitaryTime: false,
                  onAccept: (value: TimePickerResult) => {
                    this.setTime(false, value)
                  },
                  onCancel: () => {
                    ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'))
                  },
                  onChange: (value: TimePickerResult) => {
                    this.ShowToastTime(value)
                  }
                })
              }).id('test_12hour')
          }.id('time_dialog_sample_row_8')
          .rowStyle()
        }.id('time_dialog_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('time_dialog_sample_scroll_3')
    }.id('time_dialog_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  /**
   * setTime：执行 setTime 相关逻辑。
   */
  setTime(isUseMilitaryTime: boolean, value: TimePickerResult) {
    if (value.hour !== undefined && value.minute !== undefined) {
      this.selectTime.setHours(value.hour, value.minute);
      let hour: string = `${value.hour}`;
      let minute: string = `${value.minute}`;
      if (value.hour < 10) {
        hour = `0${value.hour}`;
      }
      if (value.minute < 10) {
        minute = `0${value.minute}`;
      }
      if (isUseMilitaryTime) {
        this.fullTime = `${hour}:${minute}`;
      } else {
        this.halfTime = `${hour}:${minute}`;
      }
    }
  }

  // ShowToastTime：ShowToastTime 自定义组件
  /**
   * ShowToastTime：执行 ShowToastTime 相关逻辑。
   */
  ShowToastTime(value: TimePickerResult) {
    if (value.hour !== undefined && value.minute !== undefined) {
      let hour: string = `${value.hour}`;
      let minute: string = `${value.minute}`;
      if (value.hour < 10) {
        hour = `0${value.hour}`;
      }
      if (value.minute < 10) {
        minute = `0${value.minute}`;
      }
      ShowToast.shortToast(`${this.context.resourceManager.getStringSync($r('app.string.time_picker_toast_time')
)}${hour}:${minute}`);
    }
  }
}