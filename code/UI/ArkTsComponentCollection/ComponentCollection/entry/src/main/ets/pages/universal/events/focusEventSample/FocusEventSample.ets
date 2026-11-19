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
 * @file entry/src/main/ets/pages/universal/events/focusEventSample/FocusEventSample.ets
 * 文件职责：FocusEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FocusEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { getStringData } from '../../../../data/ResourceDataHandle';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';

/**
 * FocusEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct FocusEventSample {
  // @State oneButtonColor：组件内部状态
  @State oneButtonColor: Resource = $r('app.color.focus_on_background');

  // @State twoButtonColor：组件内部状态
  @State twoButtonColor: Resource = $r('app.color.pop_up_background');

  // @State threeButtonColor：组件内部状态
  @State threeButtonColor: Resource = $r('app.color.pop_up_background');

  // @State oneFontColor：组件内部状态
  @State oneFontColor: Resource = $r('app.color.white');

  // @State twoFontColor：组件内部状态
  @State twoFontColor: Resource = $r('app.color.focus_on_background');

  // @State threeFontColor：组件内部状态
  @State threeFontColor: Resource = $r('app.color.focus_on_background');

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.focus_event') }).id('focus_event_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        Column({ space: 16 }) {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.focus_event_description') })
            .id('focus_event_sample_introduction_title_5')
          // 通过外接键盘的Tab可以让焦点在三个按钮间移动，按钮获焦时颜色变化，失焦时变回原背景色
          // Button：按钮
          // 关键属性：背景色、宽度、外边距、高度、字体颜色、focusable
          Button($r('app.string.focus_event_button_one')).id('focus_event_sample_button_6')
            .backgroundColor(this.oneButtonColor)
            .width('100%')
            .margin({ left: 24, right: 24 })
            .height(40)
            .fontColor(this.oneFontColor)
            .focusable(true)
            .onFocus(() => {
              this.oneButtonColor = $r('app.color.focus_on_background');
              this.oneFontColor = $r('app.color.white');
              ShowToast.shortToast($r('app.string.focus_event_toast_text'));
            })
            .onBlur(() => {
              this.oneButtonColor = $r('app.color.pop_up_background');
              this.oneFontColor = $r('app.color.focus_on_background');
            })
          // Button：按钮
          // 关键属性：背景色、宽度、外边距、高度、字体颜色、focusable
          Button($r('app.string.focus_event_button_two')).id('focus_event_sample_button_7')
            .backgroundColor(this.twoButtonColor)
            .width('100%')
            .margin({ left: 24, right: 24 })
            .height(40)
            .fontColor(this.twoFontColor)
            .focusable(true)
            .onFocus(() => {
              this.twoButtonColor = $r('app.color.focus_on_background');
              this.twoFontColor = $r('app.color.white');
              ShowToast.shortToast($r('app.string.focus_event_toast_text'));
            })
            .onBlur(() => {
              this.twoFontColor = $r('app.color.focus_on_background');
              this.twoButtonColor = $r('app.color.pop_up_background');
            })
          // Button：按钮
          // 关键属性：背景色、宽度、高度、字体颜色、focusable、外边距
          Button($r('app.string.focus_event_button_three')).id('focus_event_sample_button_8')
            .backgroundColor(this.threeButtonColor)
            .width('100%')
            .height(40)
            .fontColor(this.threeFontColor)
            .focusable(true)
            .margin({ left: 24, right: 24, bottom: 10 })
            .onFocus(() => {
              this.threeButtonColor = $r('app.color.focus_on_background');
              this.threeFontColor = $r('app.color.white');
              ShowToast.shortToast($r('app.string.focus_event_toast_text'));
            })
            .onBlur(() => {
              this.threeFontColor = $r('app.color.focus_on_background');
              this.threeButtonColor = $r('app.color.pop_up_background');
            })
        }.id('focus_event_sample_column_4')
      }.id('focus_event_sample_scroll_3')
    }.id('focus_event_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}