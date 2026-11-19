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
 * @file entry/src/main/ets/pages/universal/events/mouseEventSample/MouseEventSample.ets
 * 文件职责：MouseEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MouseEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { getStringData } from '../../../../data/ResourceDataHandle';

/**
 * MouseEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MouseEventSample {
  // @State hoverText：组件内部状态
  @State hoverText: Resource = $r('app.string.mouse_event_onHover_description');

  // @State mouseText：组件内部状态
  @State mouseText: string = '';

  // @State action：组件内部状态
  @State action: string = '';

  // @State mouseBtn：组件内部状态
  @State mouseBtn: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.mouse_event') }).id('mouse_event_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：外边距、宽度
      Column({ space: 12 }) {
        // Row：水平布局容器
        // 关键属性：主轴对齐、圆角、背景色、高度、宽度
        Row() {
          // Text：文本
          // 关键属性：宽度、文本对齐、内边距
          Text(this.mouseText).id('mouse_event_sample_text_5')
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 12 })
        }.id('mouse_event_sample_row_4')
        .justifyContent(FlexAlign.Center)
        .borderRadius(24)
        .backgroundColor(Color.White)
        .height(150)
        .width('90%')

        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.mouse_event_move_description') })
          .id('mouse_event_sample_introduction_title_6')
        // Button：按钮
        // 关键属性：宽度、高度、悬停回调
        Button(this.hoverText, { type: ButtonType.Capsule, stateEffect: false }).id('mouse_event_sample_button_7')
          .width('90%')
          .height(40)
          .onHover((isHover: boolean) => {
            // 通过onHover事件动态修改按钮在是否有鼠标悬浮时的文本内容与背景颜色
            if (isHover) {
              this.hoverText = $r('app.string.mouse_event_hover_description');
            } else {
              this.hoverText = $r('app.string.mouse_event_onHover_description');
            }
          })

        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.mouse_event_click_description') })
          .id('mouse_event_sample_introduction_title_8')
        // Button：按钮
        // 关键属性：宽度、高度、onMouse
        Button($r('app.string.mouse_event_onMouse_text'), { type: ButtonType.Capsule, stateEffect: false })
          .id('mouse_event_sample_button_9')
          .width('90%')
          .height(40)
          .onMouse((event: MouseEvent) => {
            switch (event.button) {
              case MouseButton.None:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_none'));
                break;
              case MouseButton.Left:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_left'));
                break;
              case MouseButton.Right:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_right'));
                break;
              case MouseButton.Back:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_back'));
                break;
              case MouseButton.Forward:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_forward'));
                break;
              case MouseButton.Middle:
                this.mouseBtn = getStringData($r('app.string.mouse_event_mouseBtn_middle'));
                break;
            }
            switch (event.action) {
              case MouseAction.Hover:
                this.action = getStringData($r('app.string.mouse_event_mouseAction_hover'));
                break;
              case MouseAction.Press:
                this.action = getStringData($r('app.string.mouse_event_mouseAction_press'));
                break;
              case MouseAction.Move:
                this.action = getStringData($r('app.string.mouse_event_mouseAction_move'));
                break;
              case MouseAction.Release:
                this.action = getStringData($r('app.string.mouse_event_mouseAction_release'));
                break;
            }
            this.mouseText = 'onMouse:\nButton = ' + this.mouseBtn +
            '\nAction = ' + this.action + '\nXY=(' + event.x + ',' + event.y + ')' +
            '\nscreenXY=(' + event.screenX + ',' + event.screenY + ')';
          })
      }.id('mouse_event_sample_column_3')
      .margin({ top: 12 })
      .width('100%')
    }.id('mouse_event_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
