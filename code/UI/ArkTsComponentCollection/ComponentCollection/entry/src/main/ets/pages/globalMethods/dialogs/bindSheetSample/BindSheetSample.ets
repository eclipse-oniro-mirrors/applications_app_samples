/*
* Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/**
 * @file entry/src/main/ets/pages/globalMethods/dialogs/bindSheetSample/BindSheetSample.ets
 * 文件职责：BindSheetSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SheetSizes、BindSheetSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';
import Logger from '../../../../util/Logger';

// 自定义半模态页面高度
const SIZE: number = 200;

@Extend(Text) function textStyle() {
  .fontFamily('HarmonyHeiTi-Medium')
  .fontSize(16)
  .fontColor('#182431')
  .textAlign(TextAlign.Start)
  .lineHeight(22)
  .fontWeight(500)
}

/**
 * SheetSizes：接口定义，承载本文件对应的逻辑与数据。
 */
interface SheetSizes {
  medium: boolean;
  large: boolean;
  size200: boolean;
}

/**
 * BindSheetSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct BindSheetSample {
  // @State isShow：组件内部状态
  @State isShow: boolean = false
  // @State showDragBar：组件内部状态
  @State showDragBar: boolean = true;

  // @State enableOutsideInteractive：组件内部状态
  @State enableOutsideInteractive: boolean = true;

  // @State popStyle：组件内部状态
  @State popStyle: SheetType.CENTER | SheetType.POPUP = SheetType.CENTER;

  // @State showClose：组件内部状态
  @State showClose: boolean = true;

  // @State blurStyle：组件内部状态
  @State blurStyle: BlurStyle = BlurStyle.NONE;

  // @State detentsArray：组件内部状态
  @State detentsArray: number[] = [];

  // @State detents：组件内部状态
  @State detents: [(SheetSize | Length), (SheetSize | Length)?, (SheetSize | Length)?] = [SheetSize.MEDIUM, SIZE];

  // @State mediumSelected：组件内部状态
  @State mediumSelected: boolean = true;

  // @State largeSelected：组件内部状态
  @State largeSelected: boolean = false;

  // @State size200Selected：组件内部状态
  @State size200Selected: boolean = true;

  // @State mediumText：组件内部状态
  @State mediumText: string = 'Medium';

  // @State largeText：组件内部状态
  @State largeText: string = 'Large';

  // @State size200Text：组件内部状态
  @State size200Text: string = '200';
  private sheetSizes: SheetSizes = { medium: true, large: false, size200: true };

  @Builder myBuilder() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
    }.id('bind_sheet_sample_column_1')
    .width('100%')
    .height('100%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：背景色
      TitleBar({ title: $r('app.string.global_bindSheet_menu') }).id('bind_sheet_sample_title_bar_3')
        // backgroundColor：设置背景色
        .backgroundColor('#F1F3F5')
      // Scroll：滚动容器
      // 关键属性：背景色、高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：背景色、尺寸约束、高度
        Column() {
          // Row：水平布局容器
          // 关键属性：背景色、圆角、宽度
          Row() {
            // Column：垂直布局容器
            // 关键属性：外边距、align
            Column() {
              // Text：文本
              // 关键属性：字号、字体颜色、字重、字体、文本对齐、宽度
              Text($r('app.string.global_bindSheet_text_allow_interaction')).id('bind_sheet_sample_text_8')
                // fontSize：设置字号
                .fontSize(16)
                // fontColor：设置字体颜色
                .fontColor('#000000')
                // fontWeight：设置字重
                .fontWeight(500)
                // fontFamily：设置字体族
                .fontFamily('HarmonyHeiTi-Medium')
                // textAlign：设置文本对齐方式
                .textAlign(TextAlign.Start)
                // width：设置宽度
                .width('70%')
              // Text：文本
              // 关键属性：字号、字体颜色、字重、字体、文本对齐、宽度
              Text($r('app.string.global_bindSheet_text_desc')).id('bind_sheet_sample_text_9')
                // fontSize：设置字号
                .fontSize(14)
                // fontColor：设置字体颜色
                .fontColor('#000000')
                // fontWeight：设置字重
                .fontWeight(400)
                // fontFamily：设置字体族
                .fontFamily('HarmonyHeiTi')
                // textAlign：设置文本对齐方式
                .textAlign(TextAlign.Start)
                // width：设置宽度
                .width('70%')
            // 结束当前组件块
            }.id('bind_sheet_sample_column_7')
            // margin：设置外边距
            .margin({ left: 12, top: 6, bottom: 6 })
            // align：设置对齐方式
            .align(Alignment.Start)

            // Blank：占位空白
            Blank().id('bind_sheet_sample_blank_10')

            // Toggle：开关
            // 关键属性：外边距、内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: this.enableOutsideInteractive })
              .id('enable_interactive')
              // margin：设置外边距
              .margin({ right: 12, top: 8, bottom: 8 })
              // onChange：绑定内容变更回调
              .onChange((isOn: boolean) => {
                // 处理：this.enableOutsideInteractive = isOn;
                this.enableOutsideInteractive = isOn;
              // 结束当前组件块
              })
          // 结束当前组件块
          }.id('bind_sheet_sample_row_6')
          // backgroundColor：设置背景色
          .backgroundColor('#ffffff')
          // borderRadius：设置圆角
          .borderRadius(24)
          // width：设置宽度
          .width('100%')

          // Text：文本
          // 关键属性：行高、字重、字体、字号、宽度、方向
          Text($r('app.string.pop_height')).id('bind_sheet_sample_text_11')
            // lineHeight：设置行高
            .lineHeight(19)
            // fontWeight：设置字重
            .fontWeight(500)
            // fontFamily：设置字体族
            .fontFamily('HarmonyHeiTi-Medium')
            // fontSize：设置字号
            .fontSize(14)
            // width：设置宽度
            .width('100%')
            .direction(Direction.Ltr)
            // margin：设置外边距
            .margin({ left: 26, top: 19.5, bottom: 9.5 })
            // fontColor：设置字体颜色
            .fontColor($r('app.color.font_color_shallow'))

          // Column：垂直布局容器
          // 关键属性：背景色、圆角、外边距、宽度
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Text：文本
              // 关键属性：textStyle、外边距
              Text(this.mediumText).id('bind_sheet_sample_text_14')
                // textStyle：套用文本样式
                .textStyle()
                // margin：设置外边距
                .margin({ left: 12, top: 8, bottom: 8 })
              // Blank：占位空白
              Blank().id('bind_sheet_sample_blank_15')
              // Checkbox：复选框
              // 关键属性：select、圆角、外边距、内容变更回调
              // 交互：输入/提交回调
              Checkbox().id('bind_sheet_sample_checkbox_16')
                .select(this.mediumSelected)
                // borderRadius：设置圆角
                .borderRadius(4)
                // margin：设置外边距
                .margin({ right: 12, top: 8, bottom: 8 })
                // onChange：绑定内容变更回调
                .onChange((value: boolean) => {
                  // 分支：if (value) {
                  if (value) {
                    this.sheetSizes.medium = true;
                  } else {
                    this.sheetSizes.medium = false;
                  }
                })
            }.id('bind_sheet_sample_row_13')
            .width('100%')
            .margin({ top: 4 })

            // Divider：分割线
            // 关键属性：strokeWidth、外边距、color、透明度
            Divider().id('bind_sheet_sample_divider_17')
              .strokeWidth(1)
              .margin(8)
              .color('#182431')
              .opacity(0.05)

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Text：文本
              // 关键属性：textStyle、外边距
              Text(this.largeText).id('bind_sheet_sample_text_19')
                .textStyle()
                .margin({ left: 12, top: 8, bottom: 8 })
              // Blank：占位空白
              Blank().id('bind_sheet_sample_blank_20')
              // Checkbox：复选框
              // 关键属性：select、圆角、外边距、内容变更回调
              // 交互：输入/提交回调
              Checkbox().id('bind_sheet_sample_checkbox_21')
                .select(this.largeSelected)
                .borderRadius(4)
                .margin({ right: 12, top: 8, bottom: 8 })
                .onChange((value: boolean) => {
                  if (value) {
                    this.sheetSizes.large = true;
                  } else {
                    this.sheetSizes.large = false;
                  }
                })
            }.id('bind_sheet_sample_row_18')
            .width('100%')
            .margin({ top: 4 })

            // Divider：分割线
            // 关键属性：strokeWidth、外边距、color、透明度
            Divider().id('bind_sheet_sample_divider_22')
              .strokeWidth(1)
              .margin(8)
              .color('#182431')
              .opacity(0.05)

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Text：文本
              // 关键属性：textStyle、外边距
              Text(this.size200Text).id('bind_sheet_sample_text_24')
                .textStyle()
                .margin({ left: 12, top: 8, bottom: 8 })
              // Blank：占位空白
              Blank().id('bind_sheet_sample_blank_25')
              // Checkbox：复选框
              // 关键属性：select、圆角、外边距、内容变更回调
              // 交互：输入/提交回调
              Checkbox().id('bind_sheet_sample_checkbox_26')
                .select(this.size200Selected)
                .borderRadius(4)
                .margin({ right: 12, top: 8, bottom: 8 })
                .onChange((value: boolean) => {
                  if (value) {
                    this.sheetSizes.size200 = true;
                  } else {
                    this.sheetSizes.size200 = false;
                  }
                })
            }.id('bind_sheet_sample_row_23')
            .width('100%')
            .margin({ top: 4, bottom: 4 })
          }.id('bind_sheet_sample_column_12')
          .backgroundColor('#ffffff')
          .borderRadius(24)
          .margin({ top: 12 })
          .width('100%')

          // Row：水平布局容器
          // 关键属性：背景色、圆角、外边距、宽度
          Row() {
            // Text：文本
            // 关键属性：textStyle、外边距
            Text($r('app.string.bindSheet_popup_style')).id('bind_sheet_sample_text_28')
              .textStyle()
              .margin({ left: 12, top: 8, bottom: 8 })
            // Blank：占位空白
            Blank().id('bind_sheet_sample_blank_29')
            // Select：下拉选择器
            // 关键属性：选中状态、当前值、外边距、字体颜色、onSelect
            Select([{ value: $r('app.string.bindSheet_default_popup') },
              { value: $r('app.string.bindSheet_centered_popup') },
              { value: $r('app.string.bindSheet_popup_appears') }])
              .id('popup_style')
              .selected(0)
              .value($r('app.string.bindSheet_default_popup'))
              .margin({ right: 12, top: 8, bottom: 8 })
              .fontColor('#182431')
              .onSelect((index: number) => {
                if (index === 0) {
                  this.popStyle = SheetType.CENTER;
                } else if (index === 1) {
                  this.popStyle = SheetType.CENTER;
                } else {
                  this.popStyle = SheetType.POPUP;
                }
              })
          }.id('bind_sheet_sample_row_27')
          .backgroundColor('#ffffff')
          .borderRadius(24)
          .margin({ top: 20 })
          .width('100%')

          // Row：水平布局容器
          // 关键属性：背景色、圆角、外边距、宽度
          Row() {
            // Text：文本
            // 关键属性：textStyle、外边距
            Text($r('app.string.bindSheet_icon')).id('bind_sheet_sample_text_31')
              .textStyle()
              .margin({ left: 12, top: 17, bottom: 17 })
            // Blank：占位空白
            Blank().id('bind_sheet_sample_blank_32')
            // Toggle：开关
            // 关键属性：外边距、内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: this.showClose }).id('bind_sheet_sample_toggle_33')
              .margin({ right: 12, top: 17, bottom: 17 })
              .onChange((isOn: boolean) => {
                if (isOn) {
                  this.showClose = true;
                } else {
                  this.showClose = false;
                }
              })
          }.id('bind_sheet_sample_row_30')
          .backgroundColor('#ffffff')
          .borderRadius(24)
          .margin({ top: 20 })
          .width('100%')

          // Row：水平布局容器
          // 关键属性：背景色、圆角、外边距、宽度
          Row() {
            // Text：文本
            // 关键属性：textStyle、外边距
            Text($r('app.string.bindSheet_blurred_background_texture')).id('bind_sheet_sample_text_35')
              .textStyle()
              .margin({ left: 12, top: 17, bottom: 17 })
            // Blank：占位空白
            Blank().id('bind_sheet_sample_blank_36')
            // Toggle：开关
            // 关键属性：外边距、内容变更回调
            // 交互：输入/提交回调
            Toggle({ type: ToggleType.Switch, isOn: false })
              .id('bindSheet_blur')
              .margin({ right: 12, top: 17, bottom: 17 })
              .onChange((isOn: boolean) => {
                if (isOn) {
                  this.blurStyle = BlurStyle.Thick;
                } else {
                  this.blurStyle = BlurStyle.NONE;
                }
              })
          }.id('bind_sheet_sample_row_34')
          .backgroundColor('#ffffff')
          .borderRadius(24)
          .margin({ top: 20 })
          .width('100%')

          // Blank：占位空白
          Blank().id('bind_sheet_sample_blank_37')
          // Button：按钮
          // 关键属性：圆角、宽度、高度、外边距、bindSheet、myBuilder
          Button($r('app.string.bindSheet_popup_modal_interface'),
            { type: ButtonType.Normal, stateEffect: true })
            .id('bindSheet_button')
            .borderRadius(24)
            .width('86.7%')
            .height('5.1%')
            .margin({ left: 24, right: 24, bottom: 72 })
            .bindSheet($$this.isShow, this.myBuilder(),
              {
                enableOutsideInteractive: this.enableOutsideInteractive,
                dragBar: this.showDragBar,
                backgroundColor: Color.Gray,
                detents: this.detents,
                blurStyle: this.blurStyle,
                showClose: this.showClose,
                title: { title: "Title" },
                preferType: this.popStyle,
                shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                  // 弹出弹窗
                  try {
                    promptAction.showDialog({
                      message: $r('app.string.bindSheet_close_modal'),
                      buttons: [
                        {
                          text: $r('app.string.bindSheet_close_cancel'),
                          color: '#0A59F7'
                        },
                        {
                          text: $r('app.string.bindSheet_close_confirm'),
                          color: '#0A59F7'
                        }
                      ]
                    }, (err, data) => {
                      if (err) {
                        Logger.error('showDialog err: ' + err);
                        return;
                      }
                      if (data.index === 1) {
                        this.detentsArray.length = 0;
                        this.detents = [SheetSize.MEDIUM, SIZE];
                        sheetDismiss.dismiss();
                      }
                    });
                  } catch (error) {
                    let message = (error as BusinessError).message;
                    let code = (error as BusinessError).code;
                    Logger.error('showDialog args error code is' + code, 'message is' + message);
                  };
                })
              })
            .onClick(() => {
              this.isShow = true
              if (this.sheetSizes.medium) {
                this.detentsArray.push(SheetSize.MEDIUM);
              }
              if (this.sheetSizes.large) {
                this.detentsArray.push(SheetSize.LARGE);
              }
              if (this.sheetSizes.size200) {
                this.detentsArray.push(SIZE);
              }
              for (let i = 0; i < this.detentsArray.length; i++) {
                this.detents[i] = this.detentsArray[i];
              }
            })
        }.id('bind_sheet_sample_column_5')
        .backgroundColor('#f1f3f5')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
        .height('100%')
      }.id('bind_sheet_sample_scroll_4')
      .backgroundColor('#f1f3f5')
      .height('100%')
      .padding({ left: 12, right: 12, bottom: 12, top: 12 })
    }.id('bind_sheet_sample_column_2')
  }
}