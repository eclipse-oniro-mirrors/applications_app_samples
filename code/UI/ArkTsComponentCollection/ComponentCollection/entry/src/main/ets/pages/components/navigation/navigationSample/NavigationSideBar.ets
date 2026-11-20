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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationSideBar.ets
 * 文件职责：NavigationSideBar 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationSideBar。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import router from '@ohos.router';

/**
 * NavigationSideBar：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationSideBar {
  navarray: number[] = [1, 2, 3];
  contentarray: number[] = [1, 2, 3, 4];

  // @State expand：组件内部状态
  @State expand: boolean = false;

  // @State selectnav：组件内部状态
  @State selectnav: number = -1;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Navigation：导航容器
      // 关键属性：hideTitleBar、mode、navBarWidthRange、minContentWidth、宽度、高度
      Navigation() {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.navigation_sidebar_title') }).id('navigation_side_bar_title_bar_3')
        // Column：垂直布局容器
        // 关键属性：背景色、圆角、内边距
        Column() {
          ForEach(this.navarray, (navidx: number) => {
            // NavRouter：NavRouter 自定义组件
            NavRouter() {
              // Row：水平布局容器
              // 关键属性：高度、内边距、宽度、圆角、背景色
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.navigation_navbar_list', navidx)).id('navigation_side_bar_text_6')
                  .fontSize(16)
                // Blank：占位空白
                Blank().id('navigation_side_bar_blank_7')
                // Image：图片
                // 关键属性：objectFit、高度
                Image($r('app.media.ic_right_arrow')).id('navigation_side_bar_image_8')
                  .objectFit(ImageFit.ScaleDown)
                  .height(22)
              }
              .height(48)
              .padding(13)
              .width('90%')
              .borderRadius(24)
              .backgroundColor(this.selectnav === navidx ? 0x007DFF : Color.Transparent)
              .id(`nav${navidx}`)

              // NavDestination：导航目的地
              // 关键属性：hideTitleBar、背景色、onShown
              NavDestination() {
                // Row：水平布局容器
                // 关键属性：高度、宽度
                Row() {
                  // Image：图片
                  // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
                  // 交互：可点击交互
                  Image($r('app.media.ic_back')).id('navigation_side_bar_image_11')
                    .width(20)
                    .height(20)
                    .margin({ left: 26 })
                    .objectFit(ImageFit.Contain)
                    .onClick(() => {
                      router.back()
                    })
                  // Text：文本
                  // 关键属性：字号、布局权重、外边距、align
                  Text($r('app.string.navigation_navbar_list', navidx)).id('navigation_side_bar_text_12')
                    .fontSize(20)
                    .layoutWeight(1)
                    .margin({ left: 16 })
                    .align(Alignment.Start)
                  // Blank：占位空白
                  Blank().id('navigation_side_bar_blank_13')
                }.id('navigation_side_bar_row_10')
                .height(56)
                .width('100%')

                // List：列表容器
                // 关键属性：圆角、背景色、宽度、内边距
                List() {
                  ForEach(this.contentarray, (contentidx: number) => {
                    // ListItem：列表项
                    ListItem() {
                      // Row：水平布局容器
                      // 关键属性：高度、内边距、宽度
                      Row() {
                        // Text：文本
                        // 关键属性：字号
                        Text($r('app.string.navigation_navcontent_list', contentidx)).id('navigation_side_bar_text_17')
                          .fontSize(16)
                        // Blank：占位空白
                        Blank().id('navigation_side_bar_blank_18')
                        // Image：图片
                        // 关键属性：objectFit、高度
                        Image($r('app.media.ic_right_arrow')).id('navigation_side_bar_image_19')
                          .objectFit(ImageFit.ScaleDown)
                          .height(22)
                      }.id('navigation_side_bar_row_16')
                      .height(48)
                      .padding({ top: 13, bottom: 13 })
                      .width('100%')
                    }.id('navigation_side_bar_list_item_15')
                  })
                }.id('navigation_side_bar_list_14')
                .borderRadius('24')
                .backgroundColor(Color.White)
                .width('95%')
                .padding(12)
              }.id('navigation_side_bar_nav_destination_9')
              .hideTitleBar(true)
              .backgroundColor($r('app.color.background_shallow_grey'))
              .onShown(() => {
                this.selectnav = navidx;
              })
            }.id('navigation_side_bar_nav_router_5')
          })
        }.id('navigation_side_bar_column_4')
        .backgroundColor(Color.White)
        .borderRadius(24)
        .padding(5)
      }.id('navigation_side_bar_navigation_2')
      .hideTitleBar(true)
      .mode(NavigationMode.Split)
      .navBarWidthRange([100, 800])
      .minContentWidth(100)
      .width('100%')
      .height('90%')
    }.id('navigation_side_bar_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
