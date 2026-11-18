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
 * @file entry/src/main/ets/pages/components/textAndInput/searchSample/SearchSample.ets
 * 文件职责：SearchSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SearchSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import {searchControlPanel} from './ChangePanel';
import Logger from '../../../../util/Logger';

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .padding(12)
  .borderRadius(16)
  .width('100%')
}

/**
 * SearchSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SearchSample {
  // @State changeValue：组件内部状态
  @State changeValue: string = '';

  // @State submitValue：组件内部状态
  @State submitValue: string = '';

  // @State copyValue：组件内部状态
  @State copyValue: string = '';

  // @State cutValue：组件内部状态
  @State cutValue: string = '';

  // @State pasteValue：组件内部状态
  @State pasteValue: string = '';

  // @State placeholderColor：组件内部状态
  @State placeholderColor: Color = Color.Blue;

  // @State textAlign：组件内部状态
  @State textAlign: TextAlign = TextAlign.Start;

  // @State copyOptions：组件内部状态
  @State copyOptions: CopyOptions = CopyOptions.None;

  // @State customTextStr：组件内部状态
  @State customTextStr: string = 'Search Custom Menu Search Custom Menu';
  controller: SearchController = new SearchController();

  /**
   * onCreateMenu：执行 onCreateMenu 相关逻辑。
   */
  onCreateMenu(menuItems: Array<TextMenuItem>) {
    menuItems.forEach((value, index) => {
      value.icon = $r('app.media.icon');
      if (value.id.equals(TextMenuItemId.COPY)) {
        value.content = 'copy change';
      }
      if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
        value.content = 'select_all change';
      }
    });
    let item1: TextMenuItem = {
      content: 'custom1',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
    };
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
    };
    menuItems.push(item1);
    menuItems.unshift(item2);
    return menuItems;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.search_title') }).id('search_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Text：文本
        // 关键属性：字号、外边距
        Text('onSubmit:' + this.submitValue).id('search_sample_text_4').fontSize(18).margin(15)
        // Text：文本
        // 关键属性：字号、外边距
        Text('onChange:' + this.changeValue).id('search_sample_text_5').fontSize(18).margin(15)
        // Text：文本
        // 关键属性：字号、外边距
        Text('onCopy:' + this.copyValue).id('search_sample_text_6').fontSize(18).margin(15)
        // Text：文本
        // 关键属性：字号、外边距
        Text('onCut:' + this.cutValue).id('search_sample_text_7').fontSize(18).margin(15)
        // Text：文本
        // 关键属性：字号、外边距
        Text('onPaste:' + this.pasteValue).id('search_sample_text_8').fontSize(18).margin(15)
        // Search：搜索框
        // 关键属性：searchButton、宽度、高度、背景色、占位提示颜色、文本对齐
        // 交互：输入/提交回调
        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
          .searchButton('SEARCH')
          .id('search_001')
          .width('95%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(this.placeholderColor)
          .textAlign(this.textAlign)
          .copyOption(this.copyOptions)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .enableKeyboardOnFocus(false)
          .onSubmit((value: string) => {
            this.submitValue = value;
          })
          .onChange((value: string) => {
            this.changeValue = value;
          })
          .onCopy((value)=>{
            this.copyValue = value;
          })
          .onCut((value)=>{
            this.cutValue = value;
          })
          .onPaste((value)=>{
            this.pasteValue = value;
          })
          .margin(20)
      }.id('search_sample_column_3').cardStyle()
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({introduction:$r('app.string.search_change')}).id('search_sample_introduction_title_9')
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        searchControlPanel({placeholderColor:$placeholderColor,textAlign:$textAlign,copyOption:$copyOptions})
      }.id('search_sample_column_10').cardStyle()

      // 文本自定义菜单
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.text_custom_menu') }).id('search_sample_introduction_title_11')
      // Search：搜索框
      // 关键属性：copyOption、宽度、高度、背景色、editMenuOptions
      Search({ value: this.customTextStr, controller: this.controller })
        .id('search_custom_menu')
        .copyOption(CopyOptions.LocalDevice)
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              Logger.info(`intercept id: custom2 start: ${textRange.start}, end: ${textRange.end}`);
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              Logger.info(`intercept COPY start: ${textRange.start}, end: ${textRange.end}`);
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              Logger.info(`non-intercept SELECT_ALL start: ${textRange.start}, end: ${textRange.end}`);
              return false;
            }
            return false;
          }
        })
    }.id('search_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
  }
}