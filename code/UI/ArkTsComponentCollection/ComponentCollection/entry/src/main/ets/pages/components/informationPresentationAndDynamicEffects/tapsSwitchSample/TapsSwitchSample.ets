/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file TapsSwitchSample.ets
 * 文件职责：TapsSwitchSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TapsSwitchSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * TapsSwitchSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TapsSwitchSample {
  // @State fontColor：组件内部状态
  @State fontColor: string = '#182431'
  // @State selectedFontColor：组件内部状态
  @State selectedFontColor: string = '#007DFF'
  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // Text：文本
      // 关键属性：字体颜色、字号、字重、行高、外边距
      Text(name).id('taps_switch_sample_text_2')
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 });
      // Divider：分割线
      // 关键属性：strokeWidth、color、透明度、宽度
      Divider().id('taps_switch_sample_divider_3')
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0);
    }.id('taps_switch_sample_column_1').width('100%');
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：内边距、宽度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.tabs_switch_effect') }).id('taps_switch_sample_title_bar_5');
      // Tabs：页签容器
      // 关键属性：是否纵向、barMode、barWidth、barHeight、animationDuration、内容变更回调
      // 交互：输入/提交回调
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('taps_switch_sample_column_8').width('100%').height('100%').backgroundColor('#00CB87')
        }.id('taps_switch_sample_tab_content_7').tabBar(this.TabBuilder(0, 'green'));

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('taps_switch_sample_column_10').width('100%').height('100%').backgroundColor('#007DFF')
        }.id('taps_switch_sample_tab_content_9').tabBar(this.TabBuilder(1, 'blue'));

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('taps_switch_sample_column_12').width('100%').height('100%').backgroundColor('#FFBF00')
        }.id('taps_switch_sample_tab_content_11').tabBar(this.TabBuilder(2, 'yellow'));

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('taps_switch_sample_column_14').width('100%').height('100%').backgroundColor('#E67C92')
        }.id('taps_switch_sample_tab_content_13').tabBar(this.TabBuilder(3, 'pink'));
      }.id('taps_switch_sample_tabs_6')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(500)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('100%')
      .backgroundColor('#F1F3F5');
    }.id('taps_switch_sample_column_4')
    .padding({bottom: 12})
    .width('100%');
  }

}