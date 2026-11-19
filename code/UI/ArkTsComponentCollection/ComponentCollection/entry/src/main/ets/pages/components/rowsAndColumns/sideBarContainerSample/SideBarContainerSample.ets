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
 * @file entry/src/main/ets/pages/components/rowsAndColumns/sideBarContainerSample/SideBarContainerSample.ets
 * 文件职责：SideBarContainerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SideBarContainerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel, PropertyControlPanel } from './SideBarContainerControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Text) function contentTextStyle() {
  .fontSize(20)
  .fontWeight(900)
  .textAlign(TextAlign.Start)
}

@Extend(Text) function sidebarTextStyle() {
  .fontSize(25)
  .fontColor($r('app.color.font_color_red'))
}

/**
 * SideBarContainerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SideBarContainerSample {
  // @State sbcType：组件内部状态
  @State sbcType: SideBarContainerType = SideBarContainerType.Overlay;

  // @State isShowSidebar：组件内部状态
  @State isShowSidebar: boolean = false;

  // @State leftMargin：组件内部状态
  @State leftMargin: number = 16;

  // @State topMargin：组件内部状态
  @State topMargin: number = 16;

  // @State isShowButton：组件内部状态
  @State isShowButton: boolean = true;

  // @State sidebarPosition：组件内部状态
  @State sidebarPosition: SideBarPosition = SideBarPosition.Start;

  // @State minWidth：组件内部状态
  @State minWidth: number = 100;

  // @State maxWidth：组件内部状态
  @State maxWidth: number = 300;

  // @State isAutoHidden：组件内部状态
  @State isAutoHidden: boolean = true;

  // @State state：组件内部状态
  @State state: boolean = true;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：宽度、高度、内边距、背景色
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.sidebarcontainer_title') }).id('side_bar_container_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.sidebarcontainer_drag_divider') })
        .id('side_bar_container_sample_introduction_title_3')
      // 展示区
        // Column：垂直布局容器
        // 关键属性：backgroundStyle、高度
        Column() {
          // SideBarContainer：侧边栏容器
          // 关键属性：showSideBar、controlButton
          SideBarContainer(this.sbcType) {
            // 侧边栏
            // Column：垂直布局容器
            // 关键属性：主轴对齐、交叉轴对齐、背景色
            Column({ space: 20 }) {
              // Button：按钮
              Button() {
                // Text：文本
                // 关键属性：sidebarTextStyle
                Text($r('app.string.sidebarcontainer_sidebar_text_one')).id('side_bar_container_sample_text_8')
                  .sidebarTextStyle()
              }.id('side_bar_container_sample_button_7')
              // Button：按钮
              Button() {
                // Text：文本
                // 关键属性：sidebarTextStyle
                Text($r('app.string.sidebarcontainer_sidebar_text_two')).id('side_bar_container_sample_text_10')
                  .sidebarTextStyle()
              }.id('side_bar_container_sample_button_9')
            }.id('side_bar_container_sample_column_6')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .backgroundColor($r('app.color.background_light_gray'))
            // 内容区
            // Column：垂直布局容器
            // 关键属性：主轴对齐、交叉轴对齐
            Column() {
              // Scroll：滚动容器
              // 关键属性：scrollable、高度、宽度
              Scroll(){
                // Text：文本
                // 关键属性：contentTextStyle、文本对齐、字体颜色
                Text(this.state === true ? $r('app.string.sidebarcontainer__is_show_true')
                  : $r('app.string.sidebarcontainer__is_show_false'))
                  .id('side_bar_container_sample_text_13')
                  .contentTextStyle()
                  .textAlign(TextAlign.Center)
                  .fontColor($r('app.color.font_color_red'))
              }.id('side_bar_container_sample_scroll_12')
              .scrollable(ScrollDirection.Vertical)
              .height("100%")
              .width('100%')
            }.id('side_bar_container_sample_column_11')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }.id('side_bar_container_sample_side_bar_container_5')
          .showSideBar(this.isShowSidebar)
          .controlButton({
            left: this.leftMargin,
            top: this.topMargin,
            icons: { shown: $r('app.media.ic_down_arrow'), hidden: $r('app.media.ic_right_arrow') }
          })
          .showControlButton(this.isShowButton)
          .sideBarPosition(this.sidebarPosition)
          .sideBarWidth(200)
          .minSideBarWidth(this.minWidth)
          .maxSideBarWidth(this.maxWidth)
          .autoHide(this.isAutoHidden)
          .onChange((bool) => {
            this.state = bool;
          })
        }.id('side_bar_container_sample_column_4')
        .backgroundStyle()
        .height(400)

      // 控制面板
      // Scroll：滚动容器
      // 关键属性：宽度、布局权重、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.sidebarcontainer_argument') })
            .id('side_bar_container_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
            ArgumentsControlPanel({ type: $sbcType }).id('side_bar_container_sample_arguments_control_panel_17')
          }.id('side_bar_container_sample_column_16')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.sidebarcontainer_property') })
            .id('side_bar_container_sample_introduction_title_18')
          // Column：垂直布局容器
          // 关键属性：主轴对齐、宽度、backgroundStyle
          Column() {
            // PropertyControlPanel：PropertyControlPanel 自定义组件
            PropertyControlPanel({
              isShowSidebar: $isShowSidebar,
              leftMargin: $leftMargin,
              topMargin: $topMargin,
              isShowButton: $isShowButton,
              sidebarPosition: $sidebarPosition,
              minWidth: $minWidth,
              maxWidth: $maxWidth,
              isAutoHidden: $isAutoHidden
            }).id('side_bar_container_sample_property_control_panel_20')
          }.id('side_bar_container_sample_column_19')
          .justifyContent(FlexAlign.Start)
          .width('100%')
          .backgroundStyle()
        }.id('side_bar_container_sample_column_14')
        .width('100%')
      }
      .id('sideBar_scroll_001')
      .width('100%')
      .layoutWeight(1)
      .padding({ bottom: 30 })
    }.id('side_bar_container_sample_flex_1')
    .width('100%')
    .height('100%')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
