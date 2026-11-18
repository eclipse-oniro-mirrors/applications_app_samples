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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationSplit.ets
 * 文件职责：NavigationSplit 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationSplit、Pages。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * NavigationSplit：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationSplit {
  navarray: number[] = [1, 2, 3];
  contentarray: number[] = [1, 2, 3, 4];

  // @State expand：组件内部状态
  @State expand: boolean = false;

  // @State selectnav：组件内部状态
  @State selectnav: number = -1;

  // @Provide pageInfos：向子孙组件提供的状态
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();
  private context: Context = getContext(this);

  @Builder
  // PageMap：PageMap 自定义组件
  /**
   * PageMap：执行 PageMap 相关逻辑。
   */
  PageMap(name: string, listIndex: number) {
    this.pageList({ names: name, values: this.pageInfos, listIndex: listIndex });
  }

  /**
   * pageList：执行 pageList 相关逻辑。
   */
  @Builder
  pageList(info: Pages) {
    // NavDestination：导航目的地
    // 关键属性：title、getStringSync、背景色、onBackPressed、pop
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
              Text($r('app.string.navigation_navcontent_list', contentidx)).id('navigation_split_text_6')
                .fontSize(16)
              // Blank：占位空白
              Blank().id('navigation_split_blank_7')
              // Image：图片
              // 关键属性：objectFit、高度
              Image($r('app.media.ic_right_arrow')).id('navigation_split_image_8')
                .objectFit(ImageFit.ScaleDown)
                .height(22)
            }.id('navigation_split_row_5')
            .height(48)
            .padding({ top: 13, bottom: 13 })
            .width('100%')
          }.id('navigation_split_list_item_4')
        })
      }.id('navigation_split_list_3')
      .borderRadius('24')
      .backgroundColor(Color.White)
      .width('95%')
      .padding(12)
    }.id('navigation_split_nav_destination_2')
    .title(this.context.resourceManager.getStringSync($r('app.string.navigation_navbar_list_nopara')) + info.listIndex)
    .backgroundColor($r('app.color.background_shallow_grey'))
    .onBackPressed(() => {
      (info.values as NavPathStack).pop();
      return true;
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Navigation：导航容器
      // 关键属性：hideTitleBar、navDestination、mode、宽度、高度
      Navigation(this.pageInfos) {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.navigation_split_title') }).id('navigation_split_title_bar_11')
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
              Text($r('app.string.navigation_navbar_list', navidx)).id('navigation_split_text_13')
                .fontSize(16)
              // Blank：占位空白
              Blank().id('navigation_split_blank_14')
              // Image：图片
              // 关键属性：objectFit、高度
              Image($r('app.media.ic_right_arrow')).id('navigation_split_image_15')
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
        }.id('navigation_split_column_12')
        .backgroundColor(Color.White)
        .borderRadius(24)
        .padding(5)
      }.id('navigation_split_navigation_10')
      .hideTitleBar(true)
      .navDestination(this.PageMap)
      .mode(NavigationMode.Split)
      .width('100%')
      .height('90%')
    }.id('navigation_split_column_9')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}

/**
 * Pages：类定义，承载本文件对应的逻辑与数据。
 */
class Pages {
  names: string = "";
  values: NavPathStack | null = null;
  listIndex: number = 0;
}