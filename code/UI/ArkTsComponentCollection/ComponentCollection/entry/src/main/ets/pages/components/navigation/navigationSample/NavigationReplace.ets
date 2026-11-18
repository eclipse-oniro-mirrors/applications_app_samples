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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationReplace.ets
 * 文件职责：NavigationReplace 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationHideBar。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * NavigationHideBar：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationHideBar {
  // @Provide pageInfos：向子孙组件提供的状态
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  @Builder
  // Pages：Pages 自定义组件
  /**
   * Pages：执行 Pages 相关逻辑。
   */
  Pages(name: string) {
    // NavDestination：导航目的地
    // 关键属性：hideTitleBar、背景色
    NavDestination() {
      // Column：垂直布局容器
      // 关键属性：主轴对齐、高度
      Column() {
        // Button：按钮
        // 关键属性：点击事件回调、info
        // 交互：可点击交互
        Button() {
          // Text：文本
          // 关键属性：字号、字体颜色、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.navigation_replace_page')).id('navigation_replace_text_4')
            .fontSize(16)
            .fontColor(Color.White)
        }.onClick(() => {
          console.info("repalce pages");
          this.pageInfos.replacePath({ name: `after_replace` }, true);
        })
        .backgroundColor('#007DFF')
        .height(40)
        .width('80%')
        .id('replace')
      }.id('navigation_replace_column_3')
      .justifyContent(FlexAlign.Center)
      .height('100%')
    }.id('navigation_replace_nav_destination_2')
    .hideTitleBar(true)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    this.pageInfos.pushPath({ name: `after_replace` });
    this.pageInfos.pushPath({ name: `before_replace` });
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_replace_title') }).id('navigation_replace_title_bar_6')
      // Navigation：导航容器
      // 关键属性：hideTitleBar、navDestination、mode、宽度、高度
      Navigation(this.pageInfos) {

      }.id('navigation_replace_navigation_7')
      .hideTitleBar(true)
      .navDestination(this.Pages)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('90%')
    }.id('navigation_replace_column_5')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}