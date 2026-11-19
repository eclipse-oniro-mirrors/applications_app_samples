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
 * @file entry/src/main/ets/pages/components/textAndInput/textInputSample/TextInputSample.ets
 * 文件职责：TextInputSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextInputSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import Logger from '../../../../util/Logger';
import { TitleBar } from '../../../../common/TitleBar';
import pasteboard from '@ohos.pasteboard';
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';
import InputUtil from '../InputUtil';

const DURATION: number = 200000;

const NUM_TEXT_MAXSIZE_LENGTH: number = 14;

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * TextInputSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextInputSample {
  // @State caretIndex：组件内部状态
  @State caretIndex: number = 0;

  // @State inputLength：组件内部状态
  @State inputLength: number = 0;

  // @State hasFilterError：组件内部状态
  @State hasFilterError: boolean = false;

  // @State showPasswordIcon：组件内部状态
  @State showPasswordIcon: boolean = true;

  // @State inputType：组件内部状态
  @State inputType: InputType = InputType.Normal;

  // @State inputContent：组件内部状态
  @State inputContent: string = '';

  // @State typePlaceholder：组件内部状态
  @State typePlaceholder: Resource = $r('app.string.text_input_normal_type');

  // @State inputSelectContent：组件内部状态
  @State inputSelectContent: string = '';

  // @State startSelect：组件内部状态
  @State startSelect: number = 0;

  // @State endSelect：组件内部状态
  @State endSelect: number = 0;

  // @State maxSelect：组件内部状态
  @State maxSelect: number = 0;

  // @State selects：组件内部状态
  @State selects: string[] = ['0'];

  // @State message：组件内部状态
  @State message: string = 'Hint';

  // @State customTextStr：组件内部状态
  @State customTextStr: string = 'TextInput Custom Menu TextInput Custom Menu';

  // @State chooseContents：组件内部状态
  @State chooseContents: string = '';

  // @State selectedStart：组件内部状态
  @State selectedStart: number = 0;

  // @State selectedEnd：组件内部状态
  @State selectedEnd: number = 0;

  // @State textStr：组件内部状态
  @State textStr: string = '';

  // @State lineBreakStrategy：组件内部状态
  @State lineBreakStrategy: LineBreakStrategy = LineBreakStrategy.GREEDY;

  // @State lineBreakStrategyStr：组件内部状态
  @State lineBreakStrategyStr: Resource = $r('app.string.text_input_line_break_strategy_content');

  // @State wordBreak：组件内部状态
  @State wordBreak: WordBreak = WordBreak.NORMAL;

  // @State wordBreakTextStr：组件内部状态
  @State wordBreakTextStr: Resource = $r('app.string.text_input_word_break_content');
  private select: number = 0;
  private maxLength: number = 12;
  private submitContent: string = '';
  private context: Context = getContext(this);
  private inputController: TextInputController = new TextInputController();
  private inputSelectController: TextInputController = new TextInputController();
  textInputController: TextInputController = new TextInputController();
  textController: TextController = new TextController();
  options: TextOptions = { controller: this.textController };

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

  @Builder LongPressImageCustomMenu() {
    // Row：水平布局容器
    // 关键属性：背景色、圆角
    Row() {
      // Text：文本
      // 关键属性：字号、外边距
      Text($r('app.string.text_input_text_copy')).id('text_input_sample_text_2')
        // fontSize：设置字号
        .fontSize(16)
        // margin：设置外边距
        .margin({
          left: 18,
          right: 24,
          top: 10,
          bottom: 11
        // 结束当前组件块
        })
        // onClick：绑定点击事件回调
        .onClick(() => {
          // 处理：let pasteData: pasteboard.PasteData =
          let pasteData: pasteboard.PasteData =
            // 处理：pasteboard.createData(pasteboard.MIMETYPE_TEXT_P
            pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.chooseContents);
          // 处理：let systemPasteboard: pasteboard.SystemPasteboar
          let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          try {
            // 处理：systemPasteboard.setDataSync(pasteData);
            systemPasteboard.setDataSync(pasteData);
          // 结束当前组件块
          } catch (err) {
            // 处理：Logger.error('Failed to set PasteData. Cause:' +
            Logger.error('Failed to set PasteData. Cause:' + err.message);
          // 结束当前组件块
          };

          try {
            // 处理：promptAction.showToast({
            promptAction.showToast({
              message: $r('app.string.text_input_text_copy_success'),
              duration: DURATION
            // 结束当前组件块
            });
          // 结束当前组件块
          } catch (error) {
            // 处理：let message = (error as BusinessError).message;
            let message = (error as BusinessError).message;
            // 处理：let code = (error as BusinessError).code;
            let code = (error as BusinessError).code;
            // 处理：Logger.error('showToast args error code is ' + c
            Logger.error('showToast args error code is ' + code + 'message is' + message);
          // 结束当前组件块
          };
          // 处理：this.textController.closeSelectionMenu();
          this.textController.closeSelectionMenu();
        // 结束当前组件块
        })
      // Text：文本
      // 关键属性：字号、外边距、点击事件回调、getSystemPasteboard
      // 交互：可点击交互
      Text($r('app.string.text_input_text_paste')).id('text_input_sample_text_3')
        // fontSize：设置字号
        .fontSize(16)
        // margin：设置外边距
        .margin({ top: 10, bottom: 11 })
        // onClick：绑定点击事件回调
        .onClick(() => {
          // 处理：let systemPasteboard: pasteboard.SystemPasteboar
          let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
          try {
            // 处理：let result: pasteboard.PasteData = systemPastebo
            let result: pasteboard.PasteData = systemPasteboard.getDataSync();
            // 处理：let plainText: string = result.getPrimaryText();
            let plainText: string = result.getPrimaryText();

            // 处理：this.message = this.message.substring(0, this.se
            this.message = this.message.substring(0, this.selectedStart) + plainText +
            // 处理：this.message.substring(this.selectedEnd, this.me
            this.message.substring(this.selectedEnd, this.message.length);

          // 结束当前组件块
          } catch (err) {
            // 处理：Logger.error('Failed to get PasteData. Cause:' +
            Logger.error('Failed to get PasteData. Cause:' + err.message);
          // 结束当前组件块
          };

          try {
            // 处理：promptAction.showToast({
            promptAction.showToast({
              message: $r('app.string.text_input_text_paste_success'),
              duration: DURATION
            // 结束当前组件块
            });
          // 结束当前组件块
          } catch (error) {
            // 处理：let message = (error as BusinessError).message;
            let message = (error as BusinessError).message;
            // 处理：let code = (error as BusinessError).code;
            let code = (error as BusinessError).code;
            // 处理：Logger.error('showToast args error code is ' + c
            Logger.error('showToast args error code is ' + code + 'message is' + message);
          // 结束当前组件块
          };
          // 处理：this.textController.closeSelectionMenu();
          this.textController.closeSelectionMenu();
        // 结束当前组件块
        })

      // Text：文本
      // 关键属性：字号、外边距
      Text($r('app.string.text_input_text_get')).id('text_input_sample_text_4')
        // fontSize：设置字号
        .fontSize(16)
        // margin：设置外边距
        .margin({
          left: 24,
          right: 18,
          top: 10,
          bottom: 11
        // 结束当前组件块
        })
        // onClick：绑定点击事件回调
        .onClick(() => {
          try {
            // 处理：promptAction.showToast({
            promptAction.showToast({
              message: this.chooseContents,
              duration: DURATION
            // 结束当前组件块
            });
          // 结束当前组件块
          } catch (error) {
            // 处理：let message = (error as BusinessError).message;
            let message = (error as BusinessError).message;
            // 处理：let code = (error as BusinessError).code;
            let code = (error as BusinessError).code;
            // 处理：Logger.error('showToast args error code is ' + c
            Logger.error('showToast args error code is ' + code + 'message is' + message);
          // 结束当前组件块
          };
          // 处理：this.textController.closeSelectionMenu();
          this.textController.closeSelectionMenu();
        // 结束当前组件块
        })
    }.id('text_input_sample_row_1')
    .backgroundColor('#FFFFFF')
    .borderRadius(24)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_input_title') }).id('text_input_sample_title_bar_6')
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_input_type') })
            .id('text_input_sample_introduction_title_8')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // TextInput：单行输入框
            // 关键属性：输入类型、showPasswordIcon、enableKeyboardOnFocus、内容变更回调
            // 交互：输入/提交回调
            TextInput({ text: `${this.textStr}`, placeholder: this.typePlaceholder })
              // type：设置类型
              .type(this.inputType)
              .id('test_input')
              .showPasswordIcon(this.showPasswordIcon)
              // enableKeyboardOnFocus：设置获焦时是否弹出键盘
              .enableKeyboardOnFocus(false)
              // onChange：绑定内容变更回调
              .onChange((number: string) => {
                // 分支：if (this.inputType == InputType.PhoneNumber) {
                if (this.inputType == InputType.PhoneNumber) {
                  // 处理：let telNumberNoSpace: string = InputUtil.removeS
                  let telNumberNoSpace: string = InputUtil.removeSpace(number);
                  // 分支：if (telNumberNoSpace.length > NUM_TEXT_MAXSIZE_LENGTH - 2) {
                  if (telNumberNoSpace.length > NUM_TEXT_MAXSIZE_LENGTH - 2) {
                    // 处理：this.textStr = telNumberNoSpace;
                    this.textStr = telNumberNoSpace;
                  // 结束当前组件块
                  } else if (InputUtil.checkNeedNumberSpace(number)) {
                    // 分支：if (telNumberNoSpace.length <= 3) {
                    if (telNumberNoSpace.length <= 3) {
                      // 处理：this.textStr = telNumberNoSpace;
                      this.textStr = telNumberNoSpace;
                    // 结束当前组件块
                    } else {
                      // 处理：let split1: string = telNumberNoSpace.substring(
                      let split1: string = telNumberNoSpace.substring(0, 3);
                      // 处理：let split2: string = telNumberNoSpace.substring(
                      let split2: string = telNumberNoSpace.substring(3);
                      // 处理：this.textStr = split1 + ' ' + split2;
                      this.textStr = split1 + ' ' + split2;
                      // 分支：if (telNumberNoSpace.length > 7) {
                      if (telNumberNoSpace.length > 7) {
                        // 处理：split2 = telNumberNoSpace.substring(3, 7);
                        split2 = telNumberNoSpace.substring(3, 7);
                        // 处理：let split3: string = telNumberNoSpace.substring(
                        let split3: string = telNumberNoSpace.substring(7);
                        // 处理：this.textStr = split1 + ' ' + split2 + ' ' + spl
                        this.textStr = split1 + ' ' + split2 + ' ' + split3;
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  } else if (telNumberNoSpace.length > 8) {
                    // 处理：let split4 = telNumberNoSpace.substring(0, 8);
                    let split4 = telNumberNoSpace.substring(0, 8);
                    // 处理：let split5 = telNumberNoSpace.substring(8);
                    let split5 = telNumberNoSpace.substring(8);
                    // 处理：this.textStr = split4 + ' ' + split5;
                    this.textStr = split4 + ' ' + split5;
                  // 结束当前组件块
                  } else {
                    // 处理：this.textStr = number;
                    this.textStr = number;
                  // 结束当前组件块
                  }
                // 结束当前组件块
                }
              // 结束当前组件块
              })

            // CommonItemSelect：CommonItemSelect 自定义组件
            // 关键属性：外边距
            CommonItemSelect({
              selects: ['Normal', 'Password', 'Email', 'Number', 'PhoneNumber'],
              name: $r('app.string.text_input_current_type'),
              callback: (index) => {
                // 分支：switch (index) {
                switch (index) {
                  // 分支：case 1:
                  case 1:
                    // 处理：this.inputType = InputType.Password;
                    this.inputType = InputType.Password;
                    // 处理：this.typePlaceholder = $r('app.string.text_input
                    this.typePlaceholder = $r('app.string.text_input_password_type');
                    break
                  // 分支：case 2:
                  case 2:
                    // 处理：this.inputType = InputType.Email;
                    this.inputType = InputType.Email;
                    // 处理：this.typePlaceholder = $r('app.string.text_input
                    this.typePlaceholder = $r('app.string.text_input_email_type');
                    break
                  // 分支：case 3:
                  case 3:
                    // 处理：this.inputType = InputType.Number;
                    this.inputType = InputType.Number;
                    // 处理：this.typePlaceholder = $r('app.string.text_input
                    this.typePlaceholder = $r('app.string.text_input_number_type');
                    break
                  // 分支：case 4:
                  case 4:
                    // 处理：this.inputType = InputType.PhoneNumber;
                    this.inputType = InputType.PhoneNumber;
                    // 处理：this.typePlaceholder = $r('app.string.text_input
                    this.typePlaceholder = $r('app.string.text_input_phone_type');
                    break
                  default:
                    // 处理：this.inputType = InputType.Normal;
                    this.inputType = InputType.Normal;
                    // 处理：this.typePlaceholder = $r('app.string.text_input
                    this.typePlaceholder = $r('app.string.text_input_normal_type');
                }
              }
            }).id('text_input_sample_common_item_select_10')
              .margin({ top: 12 })

            if (this.inputType === InputType.Password) {
              // CommonItemSelect：CommonItemSelect 自定义组件
              CommonItemSelect({
                selects: [$r('app.string.text_input_icon_show'), $r('app.string.text_input_icon_hide')],
                name: $r('app.string.text_input_show_password_icon'),
                callback: (index) => {
                  switch (index) {
                    case 1:
                      this.showPasswordIcon = false;
                      break
                    default:
                      this.showPasswordIcon = true;
                  }
                }
              }).id('text_input_sample_common_item_select_11')
            }
          }.id('text_input_sample_column_9')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_event') })
            .id('text_input_sample_introduction_title_12')
          // TextInput：单行输入框
          // 关键属性：输入类型、软键盘回车键类型、内容变更回调
          // 交互：输入/提交回调
          TextInput({ placeholder: $r('app.string.text_input_event_placeholder') })
            .id('text_input_sample_text_input_13')
            .type(InputType.Email)
            .enterKeyType(EnterKeyType.Search)
            .onChange((value: string) => {
              this.submitContent = value;
            })
            .onPaste(value => {
              ShowToast.longToast(
                `${this.context.resourceManager.getStringSync($r('app.string.text_input_toast_paste').id)}${value}`)
            })
            .onCut(value => {
              ShowToast.longToast(
                `${this.context.resourceManager.getStringSync($r('app.string.text_input_toast_cut').id)}${value}`)
            })
            .onCopy(value => {
              ShowToast.longToast(
                `${this.context.resourceManager.getStringSync($r('app.string.text_input_toast_copy').id)}${value}`)
            })
            .onSubmit(keyType => {
              ShowToast.longToast(
                `${this.context.resourceManager.getStringSync($r('app.string.text_input_toast_submit').id)}${this.submitContent}`)
            })
            .onEditChange(isEditing => {
              // You can get edit status by isEditing
            })

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_placeholder_style') })
            .id('text_input_sample_introduction_title_14')
          // TextInput：单行输入框
          // 关键属性：输入类型、占位提示字体、占位提示颜色
          TextInput({ placeholder: $r('app.string.text_input_placeholder') }).id('text_input_sample_text_input_15')
            .type(InputType.Normal)
            .placeholderFont({ size: '16fp', weight: FontWeight.Normal })
            .placeholderColor(Color.Red)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_filter') })
            .id('text_input_sample_introduction_title_16')
          // TextInput：单行输入框
          // 关键属性：输入类型、copyOption、边框、inputFilter
          TextInput({ placeholder: $r('app.string.text_input_only_input_english') })
            .id('text_input_sample_text_input_17')
            .type(InputType.Normal)
            .copyOption(CopyOptions.None)
            .border({ width: this.hasFilterError ? 1 : 0, color: Color.Red })
            .inputFilter('[a-zA-Z]', (value: string) => {
              this.hasFilterError = true;
            })
            .onChange((value: string) => {
              this.hasFilterError = false;
            })
          // Text：文本
          // 关键属性：宽度、高度、字号、外边距、内边距、文本对齐
          Text(this.hasFilterError ? $r('app.string.text_input_only_input_english') : '')
            .id('text_input_sample_text_18')
            .width('100%')
            .height(this.hasFilterError ? 15 : 0)
            .fontSize(12)
            .margin({ top: 6 })
            .padding({ left: 16, right: 16 })
            .textAlign(TextAlign.Start)
            .fontColor(Color.Red)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_max_length') })
            .id('text_input_sample_introduction_title_19')
          // Stack：层叠布局容器
          Stack() {
            // TextInput：单行输入框
            // 关键属性：最大输入长度、内容变更回调
            // 交互：输入/提交回调
            TextInput({ placeholder: $r('app.string.text_input_placeholder_max_length') })
              .id('text_input_sample_text_input_21')
              .maxLength(this.maxLength)
              .onChange((value: string) => {
                this.inputLength = value.length;
              })
            // Text：文本
            // 关键属性：宽度、字号、外边距、内边距、文本对齐、字体颜色
            Text(`${this.inputLength}/${this.maxLength}`).id('text_input_sample_text_22')
              .width('100%')
              .fontSize(16)
              .margin({ top: 6 })
              .padding({ left: 16, right: 16 })
              .textAlign(TextAlign.End)
              .fontColor(Color.Gray)
          }.id('text_input_sample_stack_20')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_caret_position') })
            .id('text_input_sample_introduction_title_23')
          // Row：水平布局容器
          Row() {
            // TextInput：单行输入框
            // 关键属性：布局权重、内容变更回调
            // 交互：输入/提交回调
            TextInput({ controller: this.inputController }).id('text_input_sample_text_input_25')
              .layoutWeight(1)
              .onChange((value: string) => {
                this.caretIndex = value.length;
                this.inputContent = value;
                this.inputController.caretPosition(this.caretIndex);
              })
            // Counter：计数器
            // 关键属性：外边距、onInc
            Counter() {
              // Text：文本
              Text(this.caretIndex.toString()).id('text_input_sample_text_27')
            }.id('text_input_sample_counter_26')
            .margin({ left: 12 })
            .onInc(() => {
              if (this.caretIndex >= 0 && this.caretIndex < this.inputContent.length) {
                this.inputController.caretPosition(++this.caretIndex);
              }
            })
            .onDec(() => {
              if (this.caretIndex > 0) {
                this.inputController.caretPosition(--this.caretIndex);
              }
            })
          }.id('text_input_sample_row_24')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_set_text_selection') })
            .id('text_input_sample_introduction_title_28')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：主轴对齐、宽度
            Row() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.text_input_set_text_selection_start_select')).id('text_input_sample_text_31')
                .fontSize(14)
              // Column：垂直布局容器
              // 关键属性：高度、宽度
              Column() {
                // TextPicker：文本选择器
                // 关键属性：内容变更回调、isArray
                // 交互：输入/提交回调
                TextPicker({ range: this.selects, selected: this.select }).id('text_input_sample_text_picker_33')
                  .onChange((value: string | string[], index: number | number[]) => {
                    if (!Array.isArray(value)) {
                      this.startSelect = Number.parseInt(value);
                      Logger.info(`Picker item changed, value: ${value}, index: ${index}`);
                    }
                  })
              }.id('text_input_sample_column_32')
              .height(90)
              .width(60)

              // Text：文本
              // 关键属性：字号
              Text($r('app.string.text_input_set_text_selection_end_select')).id('text_input_sample_text_34')
                .fontSize(14)
              // Column：垂直布局容器
              // 关键属性：高度、宽度
              Column() {
                // TextPicker：文本选择器
                // 关键属性：内容变更回调、isArray
                // 交互：输入/提交回调
                TextPicker({ range: this.selects, selected: this.select })
                  .onChange((value: string | string[], index: number | number[]) => {
                    if (!Array.isArray(value)) {
                      this.endSelect = Number.parseInt(value);
                      Logger.info(`Picker item changed, value: ${value}, index: ${index}`);
                    }
                  })
                  .id('end_select')
              }.id('text_input_sample_column_35')
              .height(90)
              .width(60)

              // Button：按钮
              // 关键属性：点击事件回调、setTextSelection
              // 交互：可点击交互
              Button($r('app.string.text_area_set_text_selection'))
                .id('button_to_select')
                .onClick(() => {
                  this.inputSelectController.setTextSelection(this.startSelect, this.endSelect);
                  Logger.info(`startSelect: ${this.startSelect}, endSelect: ${this.endSelect}`);
                })
            }.id('text_input_sample_row_30')
            .justifyContent(FlexAlign.SpaceAround)
            .width('100%')

            // TextInput：单行输入框
            // 关键属性：defaultFocus、enableKeyboardOnFocus、内容变更回调
            // 交互：输入/提交回调
            TextInput({ controller: this.inputSelectController })
              .defaultFocus(true)
              .enableKeyboardOnFocus(false)
              .id('test_input_to_select')
              .onChange((value: string) => {
                this.inputSelectContent = value;
                this.maxSelect = value.length;
                for (let i = 0; i <= this.maxSelect; i++) {
                  this.selects[i] = i.toString();
                }
              })
          }.id('text_input_sample_column_29')
          .backgroundStyle()

          // 文本选择菜单
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_text_selection_menu') })
            .id('text_input_sample_introduction_title_36')

          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度、高度、背景色、圆角
            Row() {
              // Text：文本
              // 关键属性：copyOption、bindSelectionMenu、onTextSelectionChange
              Text(undefined, this.options) {
                // Span：行内文本片段
                Span(this.message).id('text_input_sample_span_39')
              }
              .id('text_hint')
              .copyOption(CopyOptions.LocalDevice)
              .bindSelectionMenu(TextSpanType.TEXT, this.LongPressImageCustomMenu, TextResponseType.LONG_PRESS)
              .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
                this.selectedStart = selectionStart;
                this.selectedEnd = selectionEnd;
                this.chooseContents = this.message.substring(selectionStart, selectionEnd);
              })
              .margin({ left: 12 })
            }.id('text_input_sample_row_38')
            .width('100%')
            .height(40)
            .backgroundColor($r('app.color.background_shallow_grey'))
            .borderRadius(20)
          }.id('text_input_sample_column_37')
          .backgroundStyle()

          // 文本自定义菜单
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_custom_menu') })
            .id('text_input_sample_introduction_title_40')

          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度、高度、背景色、圆角
            Row() {
              // TextInput：单行输入框
              // 关键属性：copyOption、editMenuOptions
              TextInput({ text: this.customTextStr, controller: this.textInputController })
                .id('text_input_custom_menu')
                .copyOption(CopyOptions.LocalDevice)
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
            }.id('text_input_sample_row_42')
            .width('100%')
            .height(40)
            .backgroundColor($r('app.color.background_shallow_grey'))
            .borderRadius(20)
          }.id('text_input_sample_column_41')
          .backgroundStyle()

          // 文本删除
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_text_delete') })
            .id('text_input_sample_introduction_title_43')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // TextInput：单行输入框
            // 关键属性：圆角、cancelButton
            TextInput({ placeholder: 'input ...', controller: this.textInputController })
              .id('text_delete')
              .borderRadius(20)
              .cancelButton({
                style: CancelButtonStyle.CONSTANT
              })
          }.id('text_input_sample_column_44')
          .backgroundStyle()

          // 设置折行规则
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_line_break_strategy') })
            .id('text_input_sample_introduction_title_45')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // CommonItemSelect：CommonItemSelect 自定义组件
            CommonItemSelect({
              selects: ['GREEDY', 'HIGH_QUALITY', 'BALANCED'],
              name: $r('app.string.text_input_current_type'),
              callback: (index) => {
                switch (index) {
                  case 1:
                    this.lineBreakStrategy = LineBreakStrategy.HIGH_QUALITY;
                    break
                  case 2:
                    this.lineBreakStrategy = LineBreakStrategy.BALANCED;
                    break
                  default:
                    this.lineBreakStrategy = LineBreakStrategy.GREEDY;
                }
              }
            }).id('text_input_sample_common_item_select_47')

            // TextInput：单行输入框
            // 关键属性：字号、边框、内边距、宽度、最大行数、样式
            TextInput({ text: this.lineBreakStrategyStr })
              .id('text_line_break_strategy')
              .fontSize(12)
              .border({ width: 1 })
              .padding(10)
              .width('100%')
              .maxLines(5)
              .style(TextInputStyle.Inline)
              .lineBreakStrategy(this.lineBreakStrategy)
          }.id('text_input_sample_column_46')
          .backgroundStyle()

          // 设置断行规则
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.text_input_word_break') })
            .id('text_input_sample_introduction_title_48')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、外边距
          Column() {
            // CommonItemSelect：CommonItemSelect 自定义组件
            CommonItemSelect({
              selects: ['NORMAL', 'BREAK_ALL', 'BREAK_WORD'],
              name: $r('app.string.text_input_current_type'),
              callback: (index) => {
                switch (index) {
                  case 1:
                    this.wordBreak = WordBreak.BREAK_ALL;
                    break
                  case 2:
                    this.wordBreak = WordBreak.BREAK_WORD;
                    break
                  default:
                    this.wordBreak = WordBreak.NORMAL;
                }
              }
            }).id('text_input_sample_common_item_select_50')

            // TextInput：单行输入框
            // 关键属性：字号、边框、内边距、宽度、最大行数、样式
            TextInput({ text: this.wordBreakTextStr })
              .id('text_word_break')
              .fontSize(12)
              .border({ width: 1 })
              .padding(10)
              .width('100%')
              .maxLines(5)
              .style(TextInputStyle.Inline)// Inline模式
              .wordBreak(this.wordBreak) // 非Inline模式该属性无效
          }.id('text_input_sample_column_49')
          .backgroundStyle()
          .margin({ bottom: 70 })
        }.id('text_input_sample_column_7')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
      }
      .id('input_scroll')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('text_input_sample_column_5')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}