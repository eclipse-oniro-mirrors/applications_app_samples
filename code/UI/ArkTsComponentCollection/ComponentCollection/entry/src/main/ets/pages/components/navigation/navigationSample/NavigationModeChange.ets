/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationModeChange.ets
 * 文件职责：NavigationModeChange 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationModeChange。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import window from '@ohos.window';

/**
 * NavigationModeChange：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationModeChange {
  isLandscape: window.Orientation = window.Orientation.PORTRAIT;

  // @State mode：组件内部状态
  @State mode: NavigationMode = NavigationMode.Stack;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_modechange_title') }).id('navigation_mode_change_title_bar_2')

      // Navigation：导航容器
      // 关键属性：hideTitleBar、背景色、圆角、高度、宽度、mode
      Navigation().id('navigation_mode_change_navigation_3')
        .hideTitleBar(true)
        .backgroundColor(Color.White)
        .borderRadius(24)
        .height('40%')
        .width('93%')
        .mode(NavigationMode.Auto)
        .onNavigationModeChange((mode: NavigationMode) => {
          this.mode = mode;
        })

      // Row：水平布局容器
      // 关键属性：圆角、背景色、宽度、外边距、内边距
      Row() {
        // Column：垂直布局容器
        Column() {
          // Row：水平布局容器
          // 关键属性：高度、宽度
          Row() {
            // Text：文本
            // 关键属性：字号、字重
            Text($r('app.string.navigation_modevalue')).id('navigation_mode_change_text_7')
              .fontSize(16)
              .fontWeight('500')
            // Blank：占位空白
            Blank().id('navigation_mode_change_blank_8')
            // Text：文本
            // 关键属性：字号
            Text(this.mode === NavigationMode.Stack ? 'Stack' : 'Split').id('navigation_mode_change_text_9')
              .fontSize(14)
          }.id('navigation_mode_change_row_6')
          .height(48)
          .width('100%')

          // Row：水平布局容器
          // 关键属性：高度、宽度
          Row() {
            // Text：文本
            // 关键属性：字号、字重
            Text($r('app.string.navigation_mode_callback')).id('navigation_mode_change_text_11')
              .fontSize(16)
              .fontWeight('500')
            // Blank：占位空白
            Blank().id('navigation_mode_change_blank_12')
            // Text：文本
            // 关键属性：字号
            Text(this.mode === NavigationMode.Stack ? 'Stack' : 'Split').id('navigation_mode_change_text_13')
              .fontSize(14)
          }.id('navigation_mode_change_row_10')
          .height(48)
          .width('100%')
        }.id('navigation_mode_change_column_5')
      }.id('navigation_mode_change_row_4')
      .borderRadius(24)
      .backgroundColor(Color.White)
      .width('93%')
      .margin({ top: 12 })
      .padding({ left: 12, right: 12, top: 4, bottom: 4 })

      // Button：按钮
      // 关键属性：宽度、外边距、点击事件回调
      // 交互：可点击交互
      Button() {
        // Text：文本
        // 关键属性：高度、字号、圆角
        Text($r('app.string.navigation_rotate_screen')).id('navigation_mode_change_text_15')
          .height(28)
          .fontSize(12)
          .borderRadius(14)
      }.id('navigation_mode_change_button_14')
      .width('88%')
      .margin({ top: 12 })
      .onClick(() => {
        let context = getContext(this);
        window.getLastWindow(context).then((lastWindow) => {
          this.isLandscape = (this.isLandscape === window.Orientation.PORTRAIT) ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT;
          lastWindow.setPreferredOrientation(this.isLandscape);
        });
      })
    }.id('navigation_mode_change_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}