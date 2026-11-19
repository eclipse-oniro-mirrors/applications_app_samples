/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/properties/focusControlSample/FocusControlSample.ets
 * 文件职责：FocusControlSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FocusControlSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import ShowToast from '../../../../util/ShowToast';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * FocusControlSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct FocusControlSample {
  // @State inputValue：组件内部状态
  @State inputValue: string = '';

  // @State idList：组件内部状态
  @State idList: string[] = [getStringData($r('app.string.text_picker_text_banana'))
    , getStringData($r('app.string.text_picker_text_orange'))
    , getStringData($r('app.string.text_picker_text_grape'))
    , getStringData($r('app.string.text_picker_text_peach'))
    , getStringData($r('app.string.focus_control_lastPageId'))];

  // @State selectId：组件内部状态
  @State selectId: string = getStringData($r('app.string.focus_control_lastPageId'));

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.focus_control') }).id('focus_control_sample_title_bar_2')
      // Column：垂直布局容器
      Column() {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.focus_control_tab') })
          .id('focus_control_sample_introduction_title_4')
        // Row：水平布局容器
        // 关键属性：交叉轴对齐、rowStyle
        Row({ space: 20 }) {
          // Column：垂直布局容器
          // 关键属性：宽度
          Column({ space: 20 }) {
            // Column：垂直布局容器
            // 关键属性：边框宽度、边框颜色、边框样式、tabIndex
            Column({ space: 5 }) {
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、focusOnTouch
              Button($r('app.string.focus_control_group1')).id('focus_control_sample_button_8')
                .width(165)
                .height(40)
                .fontColor(Color.White)
                .focusOnTouch(true) // 该Button组件点击后可获焦
              // Row：水平布局容器
              Row({ space: 5 }) {
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色
                Button().id('focus_control_sample_button_10')
                  .width(80)
                  .height(40)
                  .fontColor(Color.White)
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色、focusOnTouch
                Button().id('focus_control_sample_button_11')
                  .width(80)
                  .height(40)
                  .fontColor(Color.White)
                  .focusOnTouch(true) // 该Button组件点击后可获焦
              }.id('focus_control_sample_row_9')
            }.id('focus_control_sample_column_7')
            .borderWidth(2)
            .borderColor(Color.Red)
            .borderStyle(BorderStyle.Dashed)
            .tabIndex(1) // 该Column组件为按TAB键走焦的第一个获焦的组件
            // Column：垂直布局容器
            // 关键属性：边框宽度、边框颜色、边框样式、tabIndex
            Column({ space: 5 }) {
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色
              Button($r('app.string.focus_control_group2')).id('focus_control_sample_button_13')
                .width(165)
                .height(40)
                .fontColor(Color.White)
              // Row：水平布局容器
              Row({ space: 5 }) {
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色
                Button().id('focus_control_sample_button_15')
                  .width(80)
                  .height(40)
                  .fontColor(Color.White)
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色、groupDefaultFocus
                Button().id('focus_control_sample_button_16')
                  .width(80)
                  .height(40)
                  .fontColor(Color.White)
                  .groupDefaultFocus(true) // 该Button组件上级Column组件获焦时获焦
              }.id('focus_control_sample_row_14')
            }.id('focus_control_sample_column_12')
            .borderWidth(2)
            .borderColor(Color.Green)
            .borderStyle(BorderStyle.Dashed)
            .tabIndex(2) // 该Column组件为按TAB键走焦的第二个获焦的组件
          }.id('focus_control_sample_column_6')
          .width('50%')

          // Column：垂直布局容器
          // 关键属性：宽度、边框宽度、边框颜色、边框样式、tabIndex
          Column({ space: 5 }) {
            // TextInput：单行输入框
            // 关键属性：宽度、高度、内容变更回调
            // 交互：输入/提交回调
            TextInput({ placeholder: $r('app.string.focus_control_input'), text: this.inputValue })
              .id('focus_control_sample_text_input_18')
              .width(165)
              .height(40)
              .onChange((value: string) => {
                this.inputValue = value;
              })
              .defaultFocus(true) // 该TextInput组件为页面的初始默认焦点
            // Button：按钮
            // 关键属性：宽度、高度、字体颜色
            Button($r('app.string.focus_control_group3')).id('focus_control_sample_button_19')
              .width(165)
              .height(40)
              .fontColor(Color.White)
          }.id('focus_control_sample_column_17')
          .width('40%')
          .borderWidth(2)
          .borderColor(Color.Orange)
          .borderStyle(BorderStyle.Dashed)
          .tabIndex(3) // 该Column组件为按TAB键走焦的第三个获焦的组件
        }.id('focus_control_sample_row_5')
        .alignItems(VerticalAlign.Top)
        .rowStyle()

        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.focus_control_request_focus') })
          .id('focus_control_sample_introduction_title_20')
        // Row：水平布局容器
        // 关键属性：rowStyle
        Row() {
          // Column：垂直布局容器
          // 关键属性：宽度、外边距
          Column({ space: 20 }) {
            // Row：水平布局容器
            Row({ space: 16 }) {
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、key、focusable
              Button(this.idList[0]).id('focus_control_sample_button_24')
                .width(200)
                .height(40)
                .fontColor(Color.White)
                .key(this.idList[0])
                .focusable(false)
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、key
              Button(this.idList[1]).id('focus_control_sample_button_25')
                .width(200)
                .height(40)
                .fontColor(Color.White)
                .key(this.idList[1])
            }.id('focus_control_sample_row_23')

            // Row：水平布局容器
            Row({ space: 16 }) {
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、key
              Button(this.idList[2]).id('focus_control_sample_button_27')
                .width(200)
                .height(40)
                .fontColor(Color.White)
                .key(this.idList[2])
              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、key
              Button(this.idList[3]).id('focus_control_sample_button_28')
                .width(200)
                .height(40)
                .fontColor(Color.White)
                .key(this.idList[3])
            }.id('focus_control_sample_row_26')

            // Row：水平布局容器
            Row({ space: 16 }) {
              // Select：下拉选择器
              // 关键属性：当前值、onSelect
              Select([{ value: this.idList[0] },
                { value: this.idList[1] },
                { value: this.idList[2] },
                { value: this.idList[3] },
                { value: this.idList[4] }])
                .value(this.selectId)
                .onSelect((index: number) => {
                  this.selectId = this.idList[index];
                })
                .id('focus_select')

              // Button：按钮
              // 关键属性：宽度、高度、字体颜色、点击事件回调、requestFocus
              // 交互：可点击交互
              Button($r('app.string.focus_control_request_focus'))
                .width(200)
                .height(40)
                .fontColor(Color.White)
                .onClick(() => {
                  let res:boolean = focusControl.requestFocus(this.selectId); // 使选中的this.selectId的组件获焦
                  if (res) {
                    ShowToast.shortToast($r('app.string.focus_control_success'));
                  } else {
                    ShowToast.shortToast($r('app.string.focus_control_failed'));
                  }
                })
                .id('focus_btn')
            }.id('focus_control_sample_row_29')
          }.id('focus_control_sample_column_22')
          .width('100%')
          .margin({ top: 20 })
        }.id('focus_control_sample_row_21')
        .rowStyle()
      }.id('focus_control_sample_column_3')
    }.id('focus_control_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}