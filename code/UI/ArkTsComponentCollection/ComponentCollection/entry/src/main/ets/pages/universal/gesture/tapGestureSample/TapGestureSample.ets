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
 * @file entry/src/main/ets/pages/universal/gesture/tapGestureSample/TapGestureSample.ets
 * 文件职责：TapGestureSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TapGestureExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .margin({ left: 12, right: 12 })
  .width('100%')
  .backgroundColor(Color.White)
}

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('90%')
  .margin({ top: 20 })
  .padding({ left: 24, right: 24, top: 8, bottom: 8 })
}

/**
 * TapGestureExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TapGestureExample {
  // @State value：组件内部状态
  @State value: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.tap_gesture') }).id('tap_gesture_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：外边距
      Column() {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.double_click') }).id('tap_gesture_sample_introduction_title_4')
        // Row：水平布局容器
        // 关键属性：主轴对齐、rowStyle
        Row() {
          // Column：垂直布局容器
          // 关键属性：高度、宽度、内边距、边框、外边距
          Column() {
            // Text：文本
            // 关键属性：字号
            Text(this.value).id('tap_gesture_sample_text_7')
              .fontSize(16)
          }.id('tap_gesture_sample_column_6')
          .height(200)
          .width(300)
          .padding(20)
          .border({ width: 3 })
          .margin(30)
        }.id('tap_gesture_sample_row_5')
        .justifyContent(FlexAlign.Center)
        .rowStyle()
        // 单指双击文本触发手势事件
        // Button：按钮
        // 关键属性：commonButtonStyle、gesture
        Button($r('app.string.double_click'))
          .commonButtonStyle()
          .id('tap_click')
          .gesture(
            // TapGesture：TapGesture 自定义组件
            // 关键属性：onAction、stringify
            TapGesture({ count: 2, fingers: 1 })
              .onAction((event: GestureEvent) => {
                this.value = getStringData($r('app.string.onAction')) + JSON.stringify(event.fingerList[0]);
              })
          )
      }.id('tap_gesture_sample_column_3')
      .margin({ bottom: 80 })
    }.id('tap_gesture_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}