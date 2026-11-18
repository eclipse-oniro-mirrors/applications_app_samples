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
 * @file entry/src/main/ets/pages/universal/gesture/bindGestureSample/BindGestureSample.ets
 * 文件职责：BindGestureSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BindExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('100%')
  .margin({ left: 24, right: 24, top: 16, bottom: 8 })
}

/**
 * BindExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct BindExample {
  // @State priorityTestValue：组件内部状态
  @State priorityTestValue: string = '';

  // @State parallelTestValue：组件内部状态
  @State parallelTestValue: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.bind_gesture_methods') }).id('bind_gesture_sample_title_bar_2')
      // Column：垂直布局容器
      Column() {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.bind_gesture_priorityGesture') })
          .id('bind_gesture_sample_introduction_title_4')
        // Scroll：滚动容器
        // 关键属性：圆角、背景色、高度、外边距、宽度
        Scroll() {
          // Column：垂直布局容器
          // 关键属性：宽度、边框
          Column() {
            // Text：文本
            // 关键属性：字号、gesture
            Text(getStringData($r('app.string.bind_gesture_tapGesture')) + this.priorityTestValue)
              .fontSize(24)
              .gesture(
                // TapGesture：TapGesture 自定义组件
                // 关键属性：onAction
                TapGesture()
                  .onAction(() => {
                    this.priorityTestValue += getStringData($r('app.string.bind_gesture_text'));
                  }))
              .id('bind_one')
          }.id('bind_gesture_sample_column_6')
          .width(250)
          .border({ width: 3 })
        }.id('bind_gesture_sample_scroll_5')
        .borderRadius(24)
        .backgroundColor(Color.White)
        .height(220)
        .margin({ left: 12, right: 12 })
        .width('100%')

        // Button：按钮
        Button($r('app.string.bind_click')).id('bind_gesture_sample_button_8')
          // 设置为priorityGesture时，点击文本会忽略Text组件的TapGesture手势事件，优先识别父组件Column的TapGesture手势事件
          .priorityGesture(
            // TapGesture：TapGesture 自定义组件
            // 关键属性：onAction
            TapGesture()
              .onAction((event: GestureEvent) => {
                this.priorityTestValue += getStringData($r('app.string.bind_gesture_column'));
              }), GestureMask.IgnoreInternal)
          .commonButtonStyle()

        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.bind_gesture_parallelGesture') })
          .id('bind_gesture_sample_introduction_title_10')
        // Scroll：滚动容器
        // 关键属性：圆角、背景色、高度、外边距、宽度
        Scroll() {
          // Column：垂直布局容器
          // 关键属性：宽度、边框
          Column() {
            // Text：文本
            // 关键属性：字号
            Text(getStringData($r('app.string.bind_gesture_tapGesture')) + this.parallelTestValue)
              .id('bind_gesture_sample_text_13')
              .fontSize(24)
          }.id('bind_gesture_sample_column_12')
          .width(250)
          .border({ width: 3 })
        }.id('bind_gesture_sample_scroll_11')
        .borderRadius(24)
        .backgroundColor(Color.White)
        .height(220)
        .margin({ left: 12, right: 12 })
        .width('100%')

        // Row：水平布局容器
        // 关键属性：parallelGesture
        Row() {
          // Button：按钮
          // 关键属性：commonButtonStyle
          Button($r('app.string.bind_click')).id('bind_gesture_sample_button_15')
            .commonButtonStyle()
              // 设置为parallelGesture时，点击文本会同时触发子组件Text与父组件Column的TapGesture手势事件
            .gesture(
              // TapGesture：TapGesture 自定义组件
              // 关键属性：onAction
              TapGesture()
                .onAction(() => {
                  this.parallelTestValue += getStringData($r('app.string.bind_gesture_text'));
                }))
            .id('bind_two')
        }.id('bind_gesture_sample_row_14')
        .parallelGesture(
          // TapGesture：TapGesture 自定义组件
          // 关键属性：onAction
          TapGesture()
            .onAction((event: GestureEvent) => {
              this.parallelTestValue += getStringData($r('app.string.bind_gesture_column'));
            }), GestureMask.Normal)
      }.id('bind_gesture_sample_column_3')
    }.id('bind_gesture_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}