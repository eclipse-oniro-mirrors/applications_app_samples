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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationExpandSafeArea.ets
 * 文件职责：NavigationExpandSafeArea 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationExpandSafeArea。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * NavigationExpandSafeArea：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationExpandSafeArea {
  // @State expand：组件内部状态
  @State expand: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、expandSafeArea
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_expand_title') }).id('navigation_expand_safe_area_title_bar_2')
      // Button：按钮
      // 关键属性：宽度、外边距、背景色、点击事件回调
      // 交互：可点击交互
      Button() {
        // Text：文本
        // 关键属性：高度、字号、圆角
        Text($r('app.string.navigation_unexpand')).id('navigation_expand_safe_area_text_4')
          .height(28)
          .fontSize(12)
          .borderRadius(14)
      }.id('navigation_expand_safe_area_button_3')
      .width('88%')
      .margin({ bottom: '2%' })
      .backgroundColor(this.expand ? $r('app.color.background_grey') : $r('app.color.button_default_bg_color'))
      .onClick(() => {
        this.expand = !this.expand;
      })

      // Navigation：导航容器
      // 关键属性：hideTitleBar、背景色、圆角、高度、宽度
      Navigation().id('navigation_expand_safe_area_navigation_5')
        .hideTitleBar(true)
        .backgroundColor(Color.White)
        .borderRadius(24)
        .height('88%')
        .width('93%')
    }.id('navigation_expand_safe_area_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
    .expandSafeArea(this.expand ? [SafeAreaType.SYSTEM] : [SafeAreaType.CUTOUT],
      this.expand ? [SafeAreaEdge.BOTTOM] : [SafeAreaEdge.START])
  }
}