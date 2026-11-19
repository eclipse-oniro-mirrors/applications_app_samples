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
 * @file entry/src/main/ets/pages/universal/events/keyPressEventSample/KeyPressEventSample.ets
 * 文件职责：KeyPressEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：KeyPressEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

/**
 * KeyPressEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct KeyPressEventSample {
  // @State text：组件内部状态
  @State text: string = '';

  // @State eventType：组件内部状态
  @State eventType: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.keyPress_event') }).id('key_press_event_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        Column({ space: 16 }) {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.key_press_description') })
            .id('key_press_event_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：圆角、背景色、高度、宽度、外边距
          Row() {
            // Text：文本
            // 关键属性：外边距
            Text(this.text).id('key_press_event_sample_text_7')
              .margin(15)
          }.id('key_press_event_sample_row_6')
          .borderRadius(24)
          .backgroundColor(Color.White)
          .height(150)
          .width('100%')
          .margin({ left: 12, right: 12 })

          // Button：按钮
          // 关键属性：按键事件回调
          Button($r('app.string.key_event')).id('key_press_event_sample_button_8')
            .onKeyEvent((event: KeyEvent) => {
              if (event.type === KeyType.Down) {
                this.eventType = getStringData($r('app.string.key_press_down'));
              }
              if (event.type === KeyType.Up) {
                this.eventType = getStringData($r('app.string.key_press_up'));
              }
              this.text = getStringData($r('app.string.key_press_keyType'))
              + this.eventType + getStringData($r('app.string.key_press_keyCode'))
              + event.keyCode + getStringData($r('app.string.key_press_keyText')) + event.keyText;
            })
            .margin({ bottom: 4 })
            .width('90%')
            .height(40)
        }.id('key_press_event_sample_column_4')
      }.id('key_press_event_sample_scroll_3')
    }.id('key_press_event_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}