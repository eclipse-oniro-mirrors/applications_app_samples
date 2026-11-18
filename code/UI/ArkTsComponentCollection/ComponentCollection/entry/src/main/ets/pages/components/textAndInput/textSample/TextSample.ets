/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/components/textAndInput/textSample/TextSample.ets
 * 文件职责：TextSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：backgroundStyle、TextSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import measure from '@ohos.measure';
import { ChangeTextCase, ChangeTextAttribute } from './ChangePanel';
import { TitleBar } from '../../../../common/TitleBar';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import Logger from '../../../../util/Logger';

/**
 * backgroundStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function backgroundStyle() {
  .size({ width: '100%' })
  .margin({ top: 12 })
  .padding(12)
  .borderRadius(24)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.White)
}

/**
 * TextSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextSample {
  // @State lineHeight：组件内部状态
  @State lineHeight: number = 23;

  // @State textMaxLines：组件内部状态
  @State textMaxLines: number = -1;

  // @State letterSpacing：组件内部状态
  @State letterSpacing: number = 2;

  // @State fontColor：组件内部状态
  @State fontColor: string = '#FF000000';

  // @State textCase：组件内部状态
  @State textCase: TextCase = TextCase.Normal;

  // @State textAlign：组件内部状态
  @State textAlign: TextAlign = TextAlign.Start;

  // @State textOverFlow：组件内部状态
  @State textOverFlow: TextOverflow = TextOverflow.None;

  // @State styleForDecorative：组件内部状态
  @State styleForDecorative: TextDecorationType = TextDecorationType.None;

  // @State textContent：组件内部状态
  @State textContent: Resource = $r('app.string.text_content');

  // @State customTextStr：组件内部状态
  @State customTextStr: string = 'Text Custom Menu';
  textSize: SizeOptions = measure.measureTextSize({
    textContent: $r('app.string.text_content'),
  });

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
    // 关键属性：尺寸、主轴对齐、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_title') }).id('text_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：外边距、尺寸、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column({ space: 12 }) {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Text：文本
            // 关键属性：高度、minFontSize、maxFontSize、baselineOffset、字体颜色、文本对齐
            Text(this.textContent).id('text_sample_text_5')
              .height(160)
              .minFontSize(16)
              .maxFontSize(20)
              .baselineOffset(0)
              .fontColor(this.fontColor)
              .textAlign(this.textAlign)
              .lineHeight(this.lineHeight)
              .maxLines(this.textMaxLines)
              .letterSpacing(this.letterSpacing)
              .textOverflow({ overflow: this.textOverFlow })
              .decoration({ type: this.styleForDecorative })

            // ChangeTextAttribute：ChangeTextAttribute 自定义组件
            ChangeTextAttribute({
              fontColor: $fontColor,
              textAlign: $textAlign,
              lineHeight: $lineHeight,
              textMaxLines: $textMaxLines,
              letterSpacing: $letterSpacing,
              textOverFlow: $textOverFlow,
              styleForDecorative: $styleForDecorative,
            }).id('text_sample_change_text_attribute_6')

            // Row：水平布局容器
            // 关键属性：尺寸、内边距、圆角、背景色
            Row() {
              // Text：文本
              Text($r('app.string.text_width')).id('text_sample_text_8')
              // Blank：占位空白
              // 关键属性：function toString() { [native code] }
              Blank().id('text_sample_blank_9')
              // Text：文本
              // 关键属性：宽度、字号、文本对齐
              Text(this.textSize.width!.toString() + ' px').id('text_sample_text_10')
                .width(150)
                .fontSize(20)
                .textAlign(TextAlign.Center)

            }.id('text_sample_row_7')
            .size({ width: '100%', height: 42 })
            .padding({ left: 0, right: 0 })
            .borderRadius(0)
            .backgroundColor(Color.Transparent)

            // Row：水平布局容器
            // 关键属性：尺寸、内边距、圆角、背景色
            Row() {
              // Text：文本
              Text($r('app.string.text_height')).id('text_sample_text_12')
              // Blank：占位空白
              // 关键属性：function toString() { [native code] }
              Blank().id('text_sample_blank_13')
              // Text：文本
              // 关键属性：宽度、字号、文本对齐
              Text(this.textSize.height!.toString() + ' px').id('text_sample_text_14')
                .width(150)
                .fontSize(20)
                .textAlign(TextAlign.Center)
            }.id('text_sample_row_11')
            .size({ width: '100%', height: 42 })
            .padding({ left: 0, right: 0 })
            .borderRadius(0)
            .backgroundColor(Color.Transparent)
          }.id('text_sample_column_4')
          .backgroundStyle()

          // Lowercase or uppercase
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Text：文本
            // 关键属性：textCase、最大行数
            Text($r('app.string.text_content_en')).id('text_sample_text_16')
              .textCase(this.textCase)
              .maxLines(5)

            // ChangeTextCase：ChangeTextCase 自定义组件
            ChangeTextCase({
              textCase: $textCase
            }).id('text_sample_change_text_case_17')
          }.id('text_sample_column_15')
          .backgroundStyle()

          // 文本自定义菜单
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_custom_menu') }).id('text_sample_introduction_title_18')
          // Column：垂直布局容器
          // 关键属性：背景色、内边距、外边距、圆角
          Column(){
            // Text：文本
            // 关键属性：copyOption、宽度、高度、editMenuOptions
            Text(this.customTextStr)
              .id('text_custom_menu')
              .copyOption(CopyOptions.LocalDevice)
              .width('95%')
              .height(40)
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
          }.id('text_sample_column_19')
          .backgroundColor(Color.White)
          .padding(12)
          .margin({ bottom: 12 })
          .borderRadius(24)
        }.id('text_sample_column_3')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen
      }
      .id('text_scroll')
      .margin({ bottom: 100 })
      .size({ width: '100%', height: '100%' })
      .padding({ left: 12, right: 12 })
    }.id('text_sample_column_1')
    .size({ width: '100%', height: '100%' })
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}