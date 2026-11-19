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
 * @file entry/src/main/ets/pages/components/navigation/tabSample/TabSample.ets
 * 文件职责：TabSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TabSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel, PropertiesControlPanel } from './TabControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.Start)
}

/**
 * TabSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TabSample {
  // @State fontColor：组件内部状态
  @State fontColor: string = '#182431';

  // @State selectedFontColor：组件内部状态
  @State selectedFontColor: string = '#007DFF';

  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0;

  // @State barPosition：组件内部状态
  @State barPosition: BarPosition = BarPosition.Start;

  // @State vertical：组件内部状态
  @State vertical: boolean = false;

  // @State isScrollable：组件内部状态
  @State isScrollable: boolean = false;

  // @State barMode：组件内部状态
  @State barMode: BarMode = BarMode.Fixed;

  // @State animationDuration：组件内部状态
  @State animationDuration: number = 400;
  private controller: TabsController = new TabsController();

  @Builder TabBuilder(index: number, name: string) {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // Text：文本
      // 关键属性：字体颜色、字号、字重、外边距
      Text(name).id('tab_sample_text_2')
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .margin({ top: 17, bottom: 7 })

      // Divider：分割线
      // 关键属性：strokeWidth、color、透明度、宽度
      Divider().id('tab_sample_divider_3')
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.id('tab_sample_column_1').width('100%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.tabs_title') }).id('tab_sample_title_bar_5')
        .flexGrow(0)
      // component
      // Tabs：页签容器
      // 关键属性：是否纵向、barMode、scrollable、animationDuration、高度、宽度
      // 交互：输入/提交回调
      Tabs({ barPosition: this.barPosition, controller: this.controller }) {
        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('tab_sample_column_8')
            .width('100%')
            .height('100%')
            .backgroundColor('#00CB87')
        }.id('tab_sample_tab_content_7').tabBar(this.TabBuilder(0, 'green'))

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('tab_sample_column_10')
            .width('100%')
            .height('100%')
            .backgroundColor('#007DFF')
        }.id('tab_sample_tab_content_9').tabBar(this.TabBuilder(1, 'blue'))

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('tab_sample_column_12').width('100%').height('100%').backgroundColor('#FFBF00')
        }.id('tab_sample_tab_content_11').tabBar(this.TabBuilder(2, 'yellow'))

        // TabContent：页签内容
        // 关键属性：tabBar、TabBuilder
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、tabBar、TabBuilder
          Column().id('tab_sample_column_14')
            .width('100%')
            .height('100%')
            .backgroundColor('#E67C92')
        }.id('tab_sample_tab_content_13').tabBar(this.TabBuilder(3, 'pink'))
      }.id('tab_sample_tabs_6')
      .vertical(this.vertical)
      .barMode(this.barMode)
      .scrollable(this.isScrollable)
      .animationDuration(this.animationDuration)
      .height(300)
      .width('100%')
      .barWidth(360)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .flexGrow(0)

      // Scroll：滚动容器
      // 关键属性：剩余空间放大、高度、外边距
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.tabs_introduction_arguments') })
            .id('tab_sample_introduction_title_17')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
            ArgumentsControlPanel({
              barPosition: $barPosition,
              changeIndex: (index: number) => {
                this.controller.changeIndex(index);
              }
            }).id('tab_sample_arguments_control_panel_19')
          }.id('tab_sample_column_18')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.tabs_introduction_properties') })
            .id('tab_sample_introduction_title_20')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // PropertiesControlPanel：PropertiesControlPanel 自定义组件
            PropertiesControlPanel({
              vertical: $vertical,
              barMode: $barMode,
              isScrollable: $isScrollable,
              animationDuration: $animationDuration
            }).id('tab_sample_properties_control_panel_22')
          }.id('tab_sample_column_21')
          .backgroundStyle()
        }.id('tab_sample_column_16')
      }.id('tab_sample_scroll_15')
      .flexGrow(1)
      .height(100)
      .margin({ bottom: 10 })
    }.id('tab_sample_flex_4')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}