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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationBasic.ets
 * 文件职责：NavigationBasic 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationBasic、BuildType。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

/**
 * NavigationBasic：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationBasic {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0;

  // @State Build：组件内部状态
  @State Build: Array<BuildType> = [
    {
      text: 'add',
      num: 0
    },
    {
      text: 'app',
      num: 1
    },
    {
      text: 'collect',
      num: 2
    }
  ];

  @Builder NavigationTitle() {
    // Column：垂直布局容器
    // 关键属性：交叉轴对齐
    Column() {
      // Text：文本
      // 关键属性：字体颜色、字号、行高、字重
      Text('Title').id('navigation_basic_text_2')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      // Text：文本
      // 关键属性：字体颜色、字号、行高、透明度、外边距、交叉轴对齐
      Text('subtitle').id('navigation_basic_text_3')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 })
    }.id('navigation_basic_column_1').alignItems(HorizontalAlign.Start)
  }

  @Builder NavigationMenus() {
    // Row：水平布局容器
    Row() {
      // Image：图片
      // 关键属性：宽度、高度
      Image($r('app.media.icon')).id('navigation_basic_image_5')
        .width(24)
        .height(24)
      // Image：图片
      // 关键属性：宽度、高度、外边距
      Image($r('app.media.icon')).id('navigation_basic_image_6')
        .width(24)
        .height(24)
        .margin({ left: 24 })
      // Image：图片
      // 关键属性：宽度、高度、外边距
      Image($r('app.media.icon')).id('navigation_basic_image_7')
        .width(24)
        .height(24)
        .margin({ left: 24 })
    }.id('navigation_basic_row_4')
  }

  @Builder NavigationToolbar() {
    // Row：水平布局容器
    // 关键属性：宽度、主轴对齐
    Row() {
      ForEach(this.Build, (item: BuildType) => {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、点击事件回调
        // 交互：可点击交互
        Column() {
          // Image：图片
          // 关键属性：宽度、高度
          Image(this.currentIndex === item.num ? $r('app.media.icon') : $r('app.media.ic_pen'))
            .id('navigation_basic_image_10')
            .width(24)
            .height(24)
          // Text：文本
          // 关键属性：字体颜色、字号、行高、字重、外边距、宽度
          Text(item.text).id('navigation_basic_text_11')
            .fontColor(this.currentIndex === item.num ? '#007DFF' : '#182431')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })
        }.id('navigation_basic_column_9').width(104).height(56)
        .onClick(() => {
          this.currentIndex = item.num
        })
      })
    }.id('navigation_basic_row_8').width('100%').justifyContent(FlexAlign.SpaceEvenly)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_basic_title') }).id('navigation_basic_title_bar_13')
      // Column：垂直布局容器
      // 关键属性：内边距、高度
      Column() {
        // Navigation：导航容器
        // 关键属性：title、menus、titleMode、toolbarConfiguration、hideTitleBar、hideToolBar
        Navigation() {
          // TextInput：单行输入框
          // 关键属性：宽度、高度、背景色、外边距、enableKeyboardOnFocus
          TextInput({ placeholder: 'search...' }).id('navigation_basic_text_input_16')
            .width('90%')
            .height(40)
            .backgroundColor('#FFFFFF')
            .margin({ top: 8 })
            .enableKeyboardOnFocus(false)

          // List：列表容器
          // 关键属性：高度、宽度、外边距
          List({ space: 12, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              // ListItem：列表项
              // 关键属性：editable、function toString() { [native code] }
              ListItem() {
                // Text：文本
                // 关键属性：宽度、高度、背景色、圆角、字号、字重
                Text('' + item).id('navigation_basic_text_19')
                  .width('90%')
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
              }.id('navigation_basic_list_item_18').editable(true)
            }, (item: number) => item.toString())
          }.id('navigation_basic_list_17')
          .height(324)
          .width('100%')
          .margin({ top: 12, left: '10%' })
        }.id('navigation_basic_navigation_15')
        .title(this.NavigationTitle)
        .menus(this.NavigationMenus)
        .titleMode(NavigationTitleMode.Full)
        .toolbarConfiguration(this.NavigationToolbar)
        .hideTitleBar(false)
        .hideToolBar(false)
        .mode(NavigationMode.Stack)
        .onTitleModeChange((titleModel: NavigationTitleMode) => {
          console.info('titleMode' + titleModel)
        })
        .width('100%')
        .height('90%')
      }.id('navigation_basic_column_14')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    }.id('navigation_basic_column_12').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}

/**
 * BuildType：类定义，承载本文件对应的逻辑与数据。
 */
class BuildType {
  text: string = '';
  num: number = 0;
}