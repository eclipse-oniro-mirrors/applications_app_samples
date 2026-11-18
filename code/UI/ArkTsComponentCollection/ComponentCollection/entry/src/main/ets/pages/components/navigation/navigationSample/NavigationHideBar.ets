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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationHideBar.ets
 * 文件职责：NavigationHideBar 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Pages、NavigationHideBar。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * Pages：类定义，承载本文件对应的逻辑与数据。
 */
class Pages {
  names: string = "";
  values: NavPathStack | null = null;
  listIndex: number = 0;
}

/**
 * NavigationHideBar：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationHideBar {
  navarray: number[] = [1, 2, 3];
  contentarray: number[] = [1, 2, 3, 4];

  // @State expand：组件内部状态
  @State expand: boolean = false;

  // @State selectnav：组件内部状态
  @State selectnav: number = -1;

  // @Provide pageInfos：向子孙组件提供的状态
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();
  private context: Context = getContext(this);

  // @State hide：组件内部状态
  @State hide: boolean = false;

  @Builder
  // PageMap：PageMap 自定义组件
  /**
   * PageMap：执行 PageMap 相关逻辑。
   */
  PageMap(name: string, param: number) {
    this.pageList({ names: name, values: this.pageInfos, listIndex: param });
  }

  /**
   * pageList：执行 pageList 相关逻辑。
   */
  @Builder
  pageList(info: Pages) {
    // NavDestination：导航目的地
    // 关键属性：title、getStringSync、背景色、onBackPressed
    NavDestination() {
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
              Text($r('app.string.navigation_navcontent_list', contentidx)).id('navigation_hide_bar_text_6')
                .fontSize(16)
              // Blank：占位空白
              Blank().id('navigation_hide_bar_blank_7')
              // Image：图片
              // 关键属性：objectFit、高度
              Image($r('app.media.ic_right_arrow')).id('navigation_hide_bar_image_8')
                .objectFit(ImageFit.ScaleDown)
                .height(22)
            }.id('navigation_hide_bar_row_5')
            .height(48)
            .padding({ top: 13, bottom: 13 })
            .width('100%')
          }.id('navigation_hide_bar_list_item_4')
        })
      }.id('navigation_hide_bar_list_3')
      .borderRadius('24')
      .backgroundColor(Color.White)
      .width('95%')
      .padding(12)
    }.id('navigation_hide_bar_nav_destination_2')
    .title(this.context.resourceManager.getStringSync($r('app.string.navigation_navbar_list_nopara')) + info.listIndex)
    .backgroundColor($r('app.color.background_shallow_grey'))
    .onBackPressed(() => {
      let stack: NavPathStack = info.values as NavPathStack;
      stack.pop();
      this.selectnav = stack.getParamByIndex(stack.size() - 1) as number;
      return true;
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    // 关键属性：高度、宽度、背景色
    Stack({ alignContent: Alignment.TopEnd }) {
      // Navigation：导航容器
      // 关键属性：hideTitleBar、navDestination、mode、宽度、高度、hideNavBar
      Navigation(this.pageInfos) {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.navigation_split_title') }).id('navigation_hide_bar_title_bar_11')
        // Column：垂直布局容器
        // 关键属性：背景色、圆角、内边距
        Column() {
          ForEach(this.navarray, (navidx: number) => {
            // Row：水平布局容器
            // 关键属性：高度、内边距、宽度、圆角、背景色、点击事件回调
            // 交互：可点击交互
            Row() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.navigation_navbar_list', navidx)).id('navigation_hide_bar_text_12')
                .fontSize(16)
              // Blank：占位空白
              Blank().id('navigation_hide_bar_blank_13')
              // Image：图片
              // 关键属性：objectFit、高度
              Image($r('app.media.ic_right_arrow')).id('navigation_hide_bar_image_14')
                .objectFit(ImageFit.ScaleDown)
                .height(22)
            }
            .height(48)
            .padding(13)
            .width('90%')
            .borderRadius(24)
            .backgroundColor(this.selectnav === navidx ? 0x007DFF : Color.Transparent)
            .onClick(() => {
              this.selectnav = navidx;
              this.pageInfos.pushPath({ name: `List${navidx}`, param: navidx });
            })
            .id(`nav${navidx}`)
          })
        }
        .backgroundColor(Color.White)
        .borderRadius(24)
        .padding(5)
        .id('navbar')
      }.id('navigation_hide_bar_navigation_10')
      .hideTitleBar(true)
      .navDestination(this.PageMap)
      .mode(NavigationMode.Split)
      .width('100%')
      .height('90%')
      .hideNavBar(this.hide)

      // Row：水平布局容器
      // 关键属性：高度、内边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、objectFit、点击事件回调
        // 交互：可点击交互
        Image($r('app.media.ic_navigation_hidebar'))
          .width(24)
          .height(24)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            this.hide = !this.hide;
          })
          .id('hide')
      }.id('navigation_hide_bar_row_15')
      .height(56)
      .padding({ right: 26 })
    }.id('navigation_hide_bar_stack_9')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}