/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/textAndInput/textStyledStringSample/TextStyledStringSample.ets
 * 文件职责：TextStyledStringSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextStyledStringSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { IntroductionTitle } from './IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * TextStyledStringSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextStyledStringSample {
  // @State inputSelectContent：组件内部状态
  @State inputSelectContent: string = '';

  // @State fontColor：组件内部状态
  @State fontColor: ResourceColor | undefined = undefined;
  private startSelect: number = 0;
  private startSelects: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  private selectedLength: number = 1;
  private lengthSelects: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  private context: Context = getContext(this);

  controller: TextController = new TextController();
  fontStyleAttr: StyledStringValue = new TextStyle({ fontColor: Color.Red, fontWeight: FontWeight.Bold });
  mutableStyledString: MutableStyledString =
    new MutableStyledString((this.context.resourceManager.getStringSync($r('app.string.text_content').id)), [{
      start: this.startSelect,
      length: this.selectedLength,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyleAttr
    }]);
  otherStyledString:StyledString = new StyledString('new style', [{
    start: 0,
    length: 9,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue, fontWeight: FontWeight.Bold })
  }]);

  // GestureStyle
  gestureStyleAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      // 处理：ShowToast.longToast('trigger click event, change
      ShowToast.longToast('trigger click event, change fontColor to green');
      // 处理：this.fontColor = Color.Green;
      this.fontColor = Color.Green;
    },
    onLongPress: () => {
      // 处理：ShowToast.longToast('trigger long press event, c
      ShowToast.longToast('trigger long press event, change fontColor to orange');
      // 处理：this.fontColor = Color.Orange;
      this.fontColor = Color.Orange;
    }
  });

  // 创建事件的对象gestureMutableStyledString
  gestureMutableStyledString: MutableStyledString = new MutableStyledString('Trigger gesture style: ' +
    (this.context.resourceManager.getStringSync($r('app.string.text_content').id)), [{
    start: 0,
    length: 21,
    styledKey: StyledStringKey.GESTURE,
    styledValue: this.gestureStyleAttr
  }]);
  gestureController: TextController = new TextController();

  /**
   * onPageShow：页面进入前台时回调。
   */
  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
    this.gestureController.setStyledString(this.gestureMutableStyledString);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：尺寸、主轴对齐、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_styled_string_title') }).id('text_styled_string_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：尺寸、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column({ space: 12 }) {
          // Scroll：滚动容器
          // 关键属性：高度、scrollable
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：backgroundStyle
            Column() {
                // Text：文本
                // 关键属性：key、minFontSize、maxFontSize、baselineOffset
                Text('', { controller: this.controller }).id('text_styled_string_sample_text_7')
                  .key('mutableStyledString')
                  .minFontSize(16)
                  .maxFontSize(20)
                  .baselineOffset(0)
              // 结束当前组件块
              }.id('text_styled_string_sample_column_6')
              // backgroundStyle：套用卡片背景样式
              .backgroundStyle()
            // 结束当前组件块
            }.id('text_styled_string_sample_scroll_5')
            // height：设置高度
            .height('20%')
            // scrollable：设置可滚动方向
            .scrollable(ScrollDirection.Vertical)

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.text_mutable_styled_string') })
              .id('text_styled_string_sample_introduction_title_8')
            // Column：垂直布局容器
            // 关键属性：backgroundStyle
            Column() {
              // Row：水平布局容器
              // 关键属性：主轴对齐、宽度
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.text_mutable_styled_string_start')).id('text_styled_string_sample_text_11')
                  // fontSize：设置字号
                  .fontSize(14)
                // Column：垂直布局容器
                // 关键属性：高度、宽度
                Column() {
                  // TextPicker：文本选择器
                  // 关键属性：内容变更回调、isArray
                  // 交互：输入/提交回调
                  TextPicker({ range: this.startSelects, selected: this.startSelect }).id('styled_startSelectPicker')
                    // onChange：绑定内容变更回调
                    .onChange((value: string | string[], index: number | number[]) => {
                      // 分支：if (!Array.isArray(value)) {
                      if (!Array.isArray(value)) {
                        // 处理：this.startSelect = Number.parseInt(value);
                        this.startSelect = Number.parseInt(value);
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    })
                    .id('start_select')
                // 结束当前组件块
                }.id('text_styled_string_sample_column_12')
                // height：设置高度
                .height(90)
                // width：设置宽度
                .width(40)

                // Text：文本
                // 关键属性：字号
                Text($r('app.string.text_mutable_styled_string_length')).id('text_styled_string_sample_text_13')
                  // fontSize：设置字号
                  .fontSize(14)
                // Column：垂直布局容器
                // 关键属性：高度、宽度
                Column() {
                  // TextPicker：文本选择器
                  // 关键属性：内容变更回调、isArray
                  // 交互：输入/提交回调
                  TextPicker({ range: this.lengthSelects}).id('styled_lengthSelectPicker')
                    // onChange：绑定内容变更回调
                    .onChange((value: string | string[], index: number | number[]) => {
                      // 分支：if (!Array.isArray(value)) {
                      if (!Array.isArray(value)) {
                        // 处理：this.selectedLength = Number.parseInt(value);
                        this.selectedLength = Number.parseInt(value);
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    })
                    .id('length_select')
                // 结束当前组件块
                }.id('text_styled_string_sample_column_14')
                // height：设置高度
                .height(90)
                .width(50)

                // Column：垂直布局容器
                // 关键属性：宽度
                Column() {
                  // CommonItemSelect：CommonItemSelect 自定义组件
                  CommonItemSelect({
                    selects: ['replaceString', 'replaceStyle', 'replaceStyledString', 'insertString', 'insertStyledString',
                      'appendStyledString', 'removeString', 'removeStyle', 'removeStyles', 'clearStyles'],
                    isItemStyle: true,
                    callback: (index) => {
                      if (this.inputSelectContent.length == 0) {
                        ShowToast.longToast(
                          `${this.context.resourceManager.getStringSync($r('app.string.text_mutable_styled_error').id)}`);
                        return;
                      }
                      switch (index) {
                        case 1:
                          this.mutableStyledString.replaceStyle({
                            start: this.startSelect,
                            length: this.selectedLength,
                            styledKey: StyledStringKey.DECORATION,
                            styledValue: new DecorationStyle({type: TextDecorationType.LineThrough, color: Color.Blue})
                          });
                          break
                        case 2:
                          this.mutableStyledString.replaceStyledString(this.startSelect, this.selectedLength,
                            this.otherStyledString);
                          break
                        case 3:
                          this.mutableStyledString.insertString(this.startSelect, this.inputSelectContent);
                          break
                        case 4:
                          this.mutableStyledString.insertStyledString(this.startSelect, this.otherStyledString);
                          break
                        case 5:
                          this.mutableStyledString.appendStyledString(this.otherStyledString);
                          break
                        case 6:
                          this.mutableStyledString.removeString(this.startSelect, this.selectedLength);
                          break
                        case 7:
                          this.mutableStyledString.removeStyle(this.startSelect, this.selectedLength,
                            StyledStringKey.FONT);
                          break
                        case 8:
                          this.mutableStyledString.removeStyles(this.startSelect, this.selectedLength);
                          break
                        case 9:
                          this.mutableStyledString.clearStyles();
                          break
                        default:
                          this.mutableStyledString.replaceString(this.startSelect, this.selectedLength,
                            this.inputSelectContent);
                      }
                      this.controller.setStyledString(this.mutableStyledString);
                    }
                  }).id('text_styled_string_sample_common_item_select_16')
                }.id('text_styled_string_sample_column_15')
                .width('40%')
              }.id('text_styled_string_sample_row_10')
              .justifyContent(FlexAlign.SpaceAround)
              .width('100%')
              // TextInput：单行输入框
              // 关键属性：defaultFocus、enableKeyboardOnFocus、内容变更回调
              // 交互：输入/提交回调
              TextInput()
                .defaultFocus(true)
                .enableKeyboardOnFocus(false)
                .id('test_input_to_select_string')
                .onChange((value: string) => {
                  this.inputSelectContent = value;
                })
            }.id('text_styled_string_sample_column_9')
            .backgroundStyle()

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.text_styled_string_gesture_style') })
              .id('text_styled_string_sample_introduction_title_17')
            // Column：垂直布局容器
            // 关键属性：backgroundStyle
            Column() {
              // Text：文本
              // 关键属性：key、高度、minFontSize、maxFontSize、baselineOffset、字体颜色
              Text('', { controller: this.gestureController }).id('text_styled_string_sample_text_19')
                .key('gestureMutableStyledString')
                .height(80)
                .minFontSize(16)
                .maxFontSize(20)
                .baselineOffset(0)
                .fontColor(this.fontColor)
            }.id('text_styled_string_sample_column_18')
            .backgroundStyle()
        }.id('text_styled_string_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('text_styled_string_sample_scroll_3')
      .size({ width: '100%', height: '100%' })
      .padding({ left: 12, right: 12 })
    }.id('text_styled_string_sample_column_1')
    .size({ width: '100%', height: '100%' })
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}