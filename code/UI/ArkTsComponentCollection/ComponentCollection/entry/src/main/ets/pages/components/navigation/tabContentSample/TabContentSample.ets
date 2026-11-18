/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/navigation/tabContentSample/TabContentSample.ets
 * 文件职责：TabContentSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TabSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonSwitcher } from '../../../../common/AttributeModificationTool';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

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
  // @State barPosition：组件内部状态
  @State barPosition: BarPosition = BarPosition.Start;

  // @State isDisabled：组件内部状态
  @State isDisabled: boolean = true;

  // @State isBottomTabBar：组件内部状态
  @State isBottomTabBar: boolean = false;

  // @State vertical：组件内部状态
  @State vertical: boolean = false;
  private controller: TabsController = new TabsController();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.tab_content_title') }).id('tab_content_sample_title_bar_2')
        .flexGrow(0)
      // component
      // Tabs：页签容器
      // 关键属性：是否纵向、barMode、宽度、高度、内边距、外边距
      Tabs({
        barPosition: this.vertical ? BarPosition.Start : this.isBottomTabBar ? BarPosition.End : BarPosition.Start,
        controller: this.controller
      }) {
        // TabContent：页签内容
        // 关键属性：tabBar、labelStyle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色
          Column().id('tab_content_sample_column_5')
            .width('100%')
            .height('100%')
            .backgroundColor('#00CB87')
        }.id('tab_content_sample_tab_content_4')
        .tabBar(new SubTabBarStyle('green')
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 10,
            minFontSize: 10,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
            font: { size: 16 }
          }))

        // TabContent：页签内容
        // 关键属性：tabBar、labelStyle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色
          Column().id('tab_content_sample_column_7')
            .width('100%')
            .height('100%')
            .backgroundColor('#007DFF')
        }.id('tab_content_sample_tab_content_6')
        .tabBar(new SubTabBarStyle('blue')
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 10,
            minFontSize: 10,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
            font: { size: 16 }
          }))

        // TabContent：页签内容
        // 关键属性：tabBar、labelStyle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色
          Column().id('tab_content_sample_column_9')
            .width('100%')
            .height('100%')
            .backgroundColor('#FFBF00')
        }.id('tab_content_sample_tab_content_8')
        .tabBar(new SubTabBarStyle('yellow')
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 10,
            minFontSize: 10,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
            font: { size: 16 }
          }))

        // TabContent：页签内容
        // 关键属性：tabBar、labelStyle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色
          Column().id('tab_content_sample_column_11')
            .width('100%')
            .height('100%')
            .backgroundColor('#E67C92')
        }.id('tab_content_sample_tab_content_10')
        .tabBar(new SubTabBarStyle('pink')
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 10,
            minFontSize: 10,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
            font: { size: 16 }
          }))
      }.id('tab_content_sample_tabs_3')
      .vertical(this.vertical)
      .barMode(BarMode.Fixed)
      .width('100%')
      .height(300)
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 20 })
      .flexGrow(0)

      // Scroll：滚动容器
      // 关键属性：剩余空间放大、高度、外边距
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        // 关键属性：主轴对齐、宽度、高度
        Column() {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // CommonSwitcher：CommonSwitcher 自定义组件
            CommonSwitcher({
              name: $r('app.string.tab_content_introduction'),
              bool: $isBottomTabBar,
              testID: `tabcontent_001`
            }).id('tab_content_sample_common_switcher_15')
            // Button：按钮
            // 关键属性：内边距、是否可用、点击事件回调
            // 交互：可点击交互
            Button($r('app.string.tab_content_side'))
              .padding(12)
              .enabled(this.isBottomTabBar ? true : false)
              .id(`tabcontent_002`)
              .onClick(() => {
                this.vertical = !this.vertical;
              })
          }.id('tab_content_sample_column_14')
          .backgroundStyle()
        }.id('tab_content_sample_column_13')
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .height('100%')
      }.id('tab_content_sample_scroll_12')
      .flexGrow(1)
      .height(100)
      .margin({ bottom: 10 })
    }.id('tab_content_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}