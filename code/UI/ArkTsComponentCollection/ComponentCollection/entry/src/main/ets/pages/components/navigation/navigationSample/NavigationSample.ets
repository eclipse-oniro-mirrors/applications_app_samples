/*
 * Copyright (c) 2023-2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationSample.ets
 * 文件职责：NavigationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationSample、PageInfo。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import router from '@ohos.router';

/**
 * NavigationSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationSample {
  private pages: PageInfo[] = [
    { name: 'navigation_basic_title', url: 'pages/components/navigation/navigationSample/NavigationBasic' },
    { name: 'navigation_list_expand_title', url: 'pages/components/navigation/navigationSample/ListExpandSafeArea' },
    { name: 'navigation_router_title', url: 'pages/components/navigation/navigationSample/NavigationRouter' },
    { name: 'navigation_split_title', url: 'pages/components/navigation/navigationSample/NavigationSplit' },
    { name: 'navigation_bindsheet_title', url: 'pages/components/navigation/navigationSample/BindSheetSafeArea' },
    { name: 'navigation_sidebar_title', url: 'pages/components/navigation/navigationSample/NavigationSideBar' },
    { name: 'navigation_replace_title', url: 'pages/components/navigation/navigationSample/NavigationReplace' },
    { name: 'navigation_hidebar_title', url: 'pages/components/navigation/navigationSample/NavigationHideBar' },
    { name: 'navigation_safearea_title', url: 'pages/components/navigation/navigationSample/NavigationFullSafeArea' },
    { name: 'navigation_expand_title', url: 'pages/components/navigation/navigationSample/NavigationExpandSafeArea' }
  ];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_title') }).id('navigation_sample_title_bar_2');
      // Column：垂直布局容器
      // 关键属性：高度
      Column() {
        ForEach(this.pages, (item: PageInfo) => {
          // Button：按钮
          // 关键属性：宽度、高度、背景色、圆角、字号、字重
          // 交互：可点击交互
          Button($r(`app.string.${item.name}`)).id('navigation_sample_button_4')
            .width('90%')
            .height(40)
            .backgroundColor('#007DFF')
            .borderRadius(20)
            .fontSize(16)
            .fontWeight(500)
            .fontColor($r('app.color.white'))
            .margin({ top: 12 })
            .onClick(() => {
              router.pushUrl({ url: item.url })
            })
        });
      }.id('navigation_sample_column_3')
    }.id('navigation_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}

/**
 * PageInfo：类定义，承载本文件对应的逻辑与数据。
 */
class PageInfo {
  name: string = '';
  url: string = '';
}