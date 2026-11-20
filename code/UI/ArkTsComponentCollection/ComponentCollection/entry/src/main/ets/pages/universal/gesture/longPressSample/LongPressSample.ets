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
 * @file entry/src/main/ets/pages/universal/gesture/longPressSample/LongPressSample.ets
 * 文件职责：LongPressSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TapGestureExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';
import { getStringData } from '../../../../data/ResourceDataHandle';

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('100%')
  .margin({ left: 24, right: 24, top: 16, bottom: 8 })
}

/**
 * TapGestureExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TapGestureExample {
  // @State count：组件内部状态
  @State count: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.long_press_gesture') }).id('long_press_sample_title_bar_2')
      // Column：垂直布局容器
      Column() {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.long_press') }).id('long_press_sample_introduction_title_4')
        // Row：水平布局容器
        // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
        Row() {
          // Column：垂直布局容器
          // 关键属性：高度、宽度、内边距、边框、外边距
          Column() {
            // Text：文本
            // 关键属性：字号、外边距
            Text(getStringData($r('app.string.onAction')) + this.count).id('long_press_sample_text_7')
              .fontSize(24)
              .margin({ top: 20 })
          }.id('long_press_sample_column_6')
          .height(150)
          .width(300)
          .padding(20)
          .border({ width: 3 })
          .margin(30)
        }.id('long_press_sample_row_5')
        .justifyContent(FlexAlign.Center)
        .borderRadius(24)
        .backgroundColor(Color.White)
        .height(200)
        .margin({ left: 12, right: 12 })
        .width('100%')

        // Button：按钮
        // 关键属性：commonButtonStyle
        Button($r('app.string.long_press_text')).id('long_press_sample_button_8')
          .commonButtonStyle()
            // 单指长按文本触发该手势事件
          .gesture(
            // LongPressGesture：LongPressGesture 自定义组件
            LongPressGesture({ fingers: 1, duration: 500, repeat: true })
              // 由于repeat设置为true，长按动作存在时会连续触发，触发间隔为duration（默认值500ms）
              .onAction((event: GestureEvent) => {
                if (event.repeat) {
                  this.count++;
                }
              })
                // 长按动作一结束触发
              .onActionEnd(() => {
                this.count = 0;
              })
              .onActionCancel(() => {
                ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'));
              })
          )
          .id('long_press')
      }.id('long_press_sample_column_3')
    }.id('long_press_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}