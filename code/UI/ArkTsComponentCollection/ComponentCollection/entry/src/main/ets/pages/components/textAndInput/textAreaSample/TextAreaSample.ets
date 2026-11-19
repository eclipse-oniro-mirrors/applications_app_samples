/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/textAndInput/textAreaSample/TextAreaSample.ets
 * 文件职责：TextAreaSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextAreaSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { textAreaControlPanel } from './ChangePanel';
import Logger from '../../../../util/Logger';

@Extend(Column) function cardStyle() {
  .borderRadius(16)
  .backgroundColor($r('app.color.white'))
  .width('100%')
  .padding(12)
}

/**
 * TextAreaSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextAreaSample {
  // @State textAreaSet：组件内部状态
  @State textAreaSet: string = '';

  // @State placeholderColor：组件内部状态
  @State placeholderColor: Color = Color.Blue;

  // @State textAlign：组件内部状态
  @State textAlign: TextAlign = TextAlign.Start;

  // @State caretColor：组件内部状态
  @State caretColor: Color = Color.Blue;

  // @State copyOptions：组件内部状态
  @State copyOptions: CopyOptions = CopyOptions.None;

  // @State isLimit：组件内部状态
  @State isLimit: boolean = false;

  // @State customTextStr：组件内部状态
  @State customTextStr: string = 'TextArea Custom Menu TextArea Custom Menu TextArea Custom Menu';
  controller: TextAreaController = new TextAreaController();

  /**
   * onCreateMenu：执行 onCreateMenu 相关逻辑。
   */
  onCreateMenu(menuItems: Array<TextMenuItem>) {
    menuItems.forEach((value, index) => {
      // 处理：value.icon = $r('app.media.icon');
      value.icon = $r('app.media.icon');
      // 分支：if (value.id.equals(TextMenuItemId.COPY)) {
      if (value.id.equals(TextMenuItemId.COPY)) {
        // 处理：value.content = 'copy change';
        value.content = 'copy change';
      // 结束当前组件块
      }
      // 分支：if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
      if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
        // 处理：value.content = 'select_all change';
        value.content = 'select_all change';
      // 结束当前组件块
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
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.textarea_title') }).id('text_area_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.textarea_show') })
            .id('text_area_sample_introduction_title_5')
          // TextArea：多行输入框
          // 关键属性：占位提示颜色、占位提示字体、背景色、文本对齐、光标颜色、copyOption
          // 交互：输入/提交回调
          TextArea({
            text: this.textAreaSet,
            placeholder: 'This textArea can contain more than one line, please input your word.',
            controller: this.controller
          // 结束当前组件块
          })
            .id(`textarea_001`)
            // placeholderColor：设置占位提示颜色
            .placeholderColor(this.placeholderColor)
            .placeholderFont({ size: 20, weight: 400 })
            // backgroundColor：设置背景色
            .backgroundColor($r('app.color.white'))
            // textAlign：设置文本对齐方式
            .textAlign(this.textAlign)
            // caretColor：设置光标颜色
            .caretColor(this.caretColor)
            // copyOption：设置文本可选复制策略
            .copyOption(this.copyOptions)
            // borderRadius：设置圆角
            .borderRadius(16)
            // width：设置宽度
            .width('100%')
            .height(80)
            .fontSize(20)
            .enableKeyboardOnFocus(false)
            .maxLength(this.isLimit ? 100 : undefined)
            .showCounter(this.isLimit, { thresholdPercentage: 1, highlightBorder: true })
            .onChange(() => {
              ShowToast.shortToast('The input have changed.');
            })
            .onCopy(() => {
              ShowToast.shortToast('copy');
            })
            .onCut(() => {
              ShowToast.shortToast('cut');
            })
            .onPaste(() => {
              ShowToast.shortToast('paste');
            })
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.textarea_control') })
            .id('text_area_sample_introduction_title_6')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            textAreaControlPanel({
              placeholderColor: $placeholderColor,
              textAlign: $textAlign,
              caretColor: $caretColor,
              copyOption: $copyOptions,
            })
          }.id('text_area_sample_column_7').cardStyle()

          // Row：水平布局容器
          // 关键属性：宽度、圆角、高度、背景色、内边距、外边距
          Row() {
            // Text：文本
            Text($r('app.string.textarea_character_limit')).id('text_area_sample_text_9')
            // Blank：占位空白
            Blank().id('text_area_sample_blank_10')
            // Toggle：开关
            // 关键属性：内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: this.isLimit })
              .onChange((isOn) => {
                this.isLimit = isOn;
              })
              .id('textarea_character_limit')
          }.id('text_area_sample_row_8')
          .width('100%')
          .borderRadius(24)
          .height(56)
          .backgroundColor(Color.White)
          .padding({ left: 12, right: 18 })
          .margin({ left: 12, right: 12, top: 12 })

          // 文本自定义菜单
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_custom_menu') })
            .id('text_area_sample_introduction_title_11')
          // TextArea：多行输入框
          // 关键属性：copyOption、圆角、宽度、高度、字号、背景色
          TextArea({ text: this.customTextStr, controller: this.controller })
            .id('text_area_custom_menu')
            .copyOption(CopyOptions.LocalDevice)
            .borderRadius(16)
            .width('100%')
            .height(80)
            .fontSize(20)
            .backgroundColor($r('app.color.white'))
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
        }.id('text_area_sample_column_4')
        .width('100%')
      }.id('text_area_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 100 })
    }.id('text_area_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}