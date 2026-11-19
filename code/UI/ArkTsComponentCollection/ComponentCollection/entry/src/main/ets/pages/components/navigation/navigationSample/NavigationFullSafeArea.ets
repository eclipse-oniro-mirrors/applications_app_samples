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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationFullSafeArea.ets
 * 文件职责：NavigationFullSafeArea 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationFullSafeArea。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * NavigationFullSafeArea：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationFullSafeArea {
  // @State type：组件内部状态
  @State type: SafeAreaType[] = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD];

  // @State edge：组件内部状态
  @State edge: SafeAreaEdge[] = [SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Navigation：导航容器
      // 关键属性：hideTitleBar、背景色、圆角、高度、宽度、expandSafeArea
      Navigation() {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.navigation_safearea_title') }).id('navigation_full_safe_area_title_bar_3')
        // Row：水平布局容器
        // 关键属性：宽度、内边距、高度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.navigation_safearea_default')).id('navigation_full_safe_area_text_5')
            .fontSize(16)
          // Blank：占位空白
          Blank().id('navigation_full_safe_area_blank_6')
          // Radio：单选框
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Radio({ value: 'default', group: 'safearea' }).id('navigation_full_safe_area_radio_7')
            .onChange((checked: boolean) => {
              if (checked) {
                this.type = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD];
                this.edge = [SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END];
              }
            })
            .checked(true)
        }.id('navigation_full_safe_area_row_4')
        .width('100%')
        .padding({ left: 12, right: 12 })
        .height(48)

        // Divider：分割线
        // 关键属性：外边距
        Divider().id('navigation_full_safe_area_divider_8')
          .margin({ left: 12, right: 12 })

        // Row：水平布局容器
        // 关键属性：宽度、内边距、高度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.navigation_safearea_expand')).id('navigation_full_safe_area_text_10')
            .fontSize(16)
          // Blank：占位空白
          Blank().id('navigation_full_safe_area_blank_11')
          // Radio：单选框
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Radio({ value: 'expand', group: 'safearea' }).id('navigation_full_safe_area_radio_12')
            .onChange((checked: boolean) => {
              if (checked) {
                this.type = [SafeAreaType.SYSTEM];
                this.edge = [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM];
              }
            })
        }.id('navigation_full_safe_area_row_9')
        .width('100%')
        .padding({ left: 12, right: 12 })
        .height(48)

        // Divider：分割线
        // 关键属性：外边距
        Divider().id('navigation_full_safe_area_divider_13')
          .margin({ left: 12, right: 12 })

        // Row：水平布局容器
        // 关键属性：宽度、内边距、高度
        Row() {
          // Text：文本
          // 关键属性：字号
          Text($r('app.string.navigation_safearea_unexpand')).id('navigation_full_safe_area_text_15')
            .fontSize(16)
          // Blank：占位空白
          Blank().id('navigation_full_safe_area_blank_16')
          // Radio：单选框
          // 关键属性：内容变更回调
          // 交互：输入/提交回调
          Radio({ value: 'unexpand', group: 'safearea' }).id('navigation_full_safe_area_radio_17')
            .onChange((checked: boolean) => {
              if (checked) {
                this.type = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD];
                this.edge = [SafeAreaEdge.START, SafeAreaEdge.END];
              }
            })
        }.id('navigation_full_safe_area_row_14')
        .width('100%')
        .padding({ left: 12, right: 12 })
        .height(48)
      }.id('navigation_full_safe_area_navigation_2')
      .hideTitleBar(true)
      .backgroundColor(Color.White)
      .borderRadius(24)
      .height('100%')
      .width('93%')
      .expandSafeArea(this.type, this.edge)
    }.id('navigation_full_safe_area_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}