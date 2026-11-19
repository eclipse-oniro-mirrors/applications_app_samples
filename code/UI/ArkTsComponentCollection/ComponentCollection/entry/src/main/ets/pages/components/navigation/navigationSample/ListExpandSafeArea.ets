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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/ListExpandSafeArea.ets
 * 文件职责：ListExpandSafeArea 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListExpandSafeArea。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * ListExpandSafeArea：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ListExpandSafeArea {
  private counts: number[] = [];

  // @State expand：组件内部状态
  @State expand: boolean = false;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.counts.push(i);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、expandSafeArea
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_list_expand_title') }).id('list_expand_safe_area_title_bar_2')
      // Button：按钮
      // 关键属性：宽度、外边距、背景色、点击事件回调
      // 交互：可点击交互
      Button() {
        // Text：文本
        // 关键属性：高度、字号、圆角
        Text($r('app.string.navigation_expand')).id('list_expand_safe_area_text_4')
          .height(28)
          .fontSize(12)
          .borderRadius(14)
      }.id('list_expand_safe_area_button_3')
      .width('88%')
      .margin({ bottom: '2%' })
      .backgroundColor(this.expand ? $r('app.color.button_default_bg_color') : $r('app.color.background_grey'))
      .onClick(() => {
        this.expand = !this.expand;
      })

      // List：列表容器
      // 关键属性：背景色、圆角、高度、宽度、内边距
      List({ space: 12, initialIndex: 0 }) {
        ForEach(this.counts, () => {
          // ListItem：列表项
          ListItem() {
            // Row：水平布局容器
            // 关键属性：高度、外边距
            Row() {
              // Text：文本
              // 关键属性：字号
              Text('Single list').id('list_expand_safe_area_text_8')
                .fontSize(16)
            }.id('list_expand_safe_area_row_7')
            .height(48)
            .margin({ left: 24 })
          }.id('list_expand_safe_area_list_item_6')
        })
      }.id('list_expand_safe_area_list_5')
      .backgroundColor(Color.White)
      .borderRadius(24)
      .height('88%')
      .width('93%')
      .padding({ top: '5%' })
    }.id('list_expand_safe_area_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
    .expandSafeArea(this.expand ? [SafeAreaType.SYSTEM] : [], this.expand ? [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM] : [])
  }
}