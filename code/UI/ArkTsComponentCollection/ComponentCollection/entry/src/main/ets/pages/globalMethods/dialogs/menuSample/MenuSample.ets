/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/globalMethods/dialogs/menuSample/MenuSample.ets
 * 文件职责：MenuSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MenuSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';

// 最小宽度
const MINWIDTH: number = 64;
// 最大宽度
const MAXWIDTH: number = 100;

@Extend(Row) function rowStyle() {
  .height(50)
  .padding(12)
  .width('100%')
  .borderRadius(24)
  .margin({ top: 12, bottom: 12 })
}

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .layoutWeight(1)
  .height(40)
  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
}

@Extend(Text) function textStyle() {
  .fontSize(16)
  .fontFamily('HarmonyHeiTi')
  .fontColor('#182431')
  .fontWeight(400)
  .width('90%')
  .margin({ top: 13, bottom: 14 })
}

/**
 * MenuSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MenuSample {
  // @State menuWidth：组件内部状态
  @State menuWidth: number = MINWIDTH;

  // @State realMenuWidth：组件内部状态
  @State realMenuWidth: number = 0;

  // @State menuDirection：组件内部状态
  @State menuDirection: number = Placement.Bottom;

  // @State vpText：组件内部状态
  @State vpText: string = 'vp';

  @Builder MenuBuilder() {
    // Flex：弹性布局容器
    // 关键属性：宽度
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      // Text：文本
      // 关键属性：字号、宽度、strokeWidth、外边距、color
      Text($r('app.string.text_picker_text_banana')).id('menu_sample_text_2')
        .fontSize(16)
        .width('90%')
      // Divider：分割线
      // 关键属性：strokeWidth、外边距、color
      Divider().id('menu_sample_divider_3').strokeWidth(1).margin(8).color(Color.Brown)
      // Text：文本
      // 关键属性：字号、宽度、strokeWidth、外边距、color
      Text($r('app.string.text_picker_text_orange')).id('menu_sample_text_4')
        .fontSize(16)
        .width('90%')
      // Divider：分割线
      // 关键属性：strokeWidth、外边距、color
      Divider().id('menu_sample_divider_5').strokeWidth(1).margin(8).color(Color.Brown)
      // Text：文本
      // 关键属性：字号、宽度、外边距
      Text($r('app.string.text_picker_text_grape')).id('menu_sample_text_6')
        .fontSize(16)
        .width('90%')
        .margin({ bottom: 10 })
    }.id('menu_sample_flex_1')
    .width(200)
  }

  @Builder MenuBuilder2() {
    // Flex：弹性布局容器
    // 关键属性：宽度
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      // Text：文本
      // 关键属性：textStyle
      Text($r('app.string.menu_option')).id('menu_sample_text_8')
        .textStyle()
      // Text：文本
      // 关键属性：textStyle
      Text($r('app.string.menu_option')).id('menu_sample_text_9')
        .textStyle()
      // Text：文本
      // 关键属性：textStyle
      Text($r('app.string.menu_option')).id('menu_sample_text_10')
        .textStyle()
      // Text：文本
      // 关键属性：textStyle
      Text($r('app.string.menu_option')).id('menu_sample_text_11')
        .textStyle()
    }.id('menu_sample_flex_7')
    .width(this.menuWidth)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.global_menu') }).id('menu_sample_title_bar_13')
      // Scroll：滚动容器
      // 关键属性：点击事件回调
      // 交互：可点击交互
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束、内边距
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.global_menu_create_way') })
            .id('menu_sample_introduction_title_15')
          // Row：水平布局容器
          // 关键属性：主轴对齐、rowStyle
          Row({ space: 16 }) {
            // Button：按钮
            // 关键属性：commonButtonStyle、bindContextMenu、MenuBuilder
            Button($r('app.string.global_menu_click_right'))
              .commonButtonStyle()
              .bindContextMenu(this.MenuBuilder(), ResponseType.RightClick)
              .id('right_clickButton')

            // Button：按钮
            // 关键属性：commonButtonStyle、bindContextMenu、MenuBuilder
            Button($r('app.string.global_menu_long_press'))
              .commonButtonStyle()
              .bindContextMenu(this.MenuBuilder(), ResponseType.LongPress)
              .id('long_pressButton')
          }.id('menu_sample_row_16')
          .justifyContent(FlexAlign.Center)
          .rowStyle()
          // 新增 菜单避让规则
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.global_menu_avoid_rule') })
            .id('menu_sample_introduction_title_17')
          // Column：垂直布局容器
          // 关键属性：宽度
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Image：图片
              // 关键属性：draggable、宽度、高度、外边距、bindContextMenu、MenuBuilder2
              Image($r('app.media.ic_pic1'))
                .draggable(true)
                .id('menu_image1')
                .width(162)
                .height(162)
                .margin({ left: 12, top: 9.5, bottom: 12 })
                .bindContextMenu(this.MenuBuilder2(), ResponseType.LongPress,
                  {
                    placement: this.menuDirection,
                  })
              // Blank：占位空白
              Blank().id('menu_sample_blank_20')
            }.id('menu_sample_row_19')
            .width('100%')

            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Image：图片
              // 关键属性：draggable、宽度、高度、外边距、bindContextMenu、MenuBuilder2
              Image($r('app.media.ic_pic2'))
                .draggable(true)
                .id('menu_image2')
                .width(162)
                .height(162)
                .margin({ left: 12, bottom: 12 })
                .bindContextMenu(this.MenuBuilder2(), ResponseType.LongPress,
                  {
                    placement: this.menuDirection,
                  })
              // Blank：占位空白
              Blank().id('menu_sample_blank_22')
            }.id('menu_sample_row_21')
            .width('100%')
          }.id('menu_sample_column_18')
          .width('100%')

          // 菜单布局
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.global_menu_layout') })
            .id('menu_sample_introduction_title_23')
          // Column：垂直布局容器
          // 关键属性：宽度、背景色、圆角、外边距
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Text：文本
              // 关键属性：外边距
              Text($r('app.string.vertical_layout')).id('menu_sample_text_26')
                .margin({ left: 12, top: 17, bottom: 13 })
              // Blank：占位空白
              Blank().id('menu_sample_blank_27')
              // radio单选按钮
              // Radio：单选框
              // 关键属性：外边距、内容变更回调
              // 交互：输入/提交回调
              Radio({ value: 'vertical', group: 'radioGroup' })
                .id('menu_vertical')
                .margin({ right: 12, top: 17, bottom: 13 })
                .onChange((isChecked: boolean) => {
                  if (isChecked) {
                    //设置纵向布局属性
                    this.menuDirection = Placement.Bottom;
                  }
                })

            }.id('menu_sample_row_25')
            .width('100%')

            // Divider：分割线
            // 关键属性：strokeWidth、外边距、color、透明度
            Divider().id('menu_sample_divider_28')
              .strokeWidth(1)
              .margin(8)
              .color('#182431')
              .opacity(0.05)
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Text：文本
              // 关键属性：外边距
              Text($r('app.string.horizontal_layout')).id('menu_sample_text_30')
                .margin({ left: 12, bottom: 17 })
              // Blank：占位空白
              Blank().id('menu_sample_blank_31')
              // Radio：单选框
              // 关键属性：外边距、内容变更回调
              // 交互：输入/提交回调
              Radio({ value: 'horizontal', group: 'radioGroup' })
                .id('menu_horizontal')
                .margin({ right: 12, bottom: 17 })
                .onChange((isChecked: boolean) => {
                  if (isChecked) {
                    //设置横向布局属性
                    this.menuDirection = Placement.RightTop;
                  }
                })
            }.id('menu_sample_row_29')
            .width('100%')
          }.id('menu_sample_column_24')
          .width('100%')
          .backgroundColor('#FFFFFF')
          .borderRadius(24)
          .margin({ top: 9.5, bottom: 19.5 })

          // 菜单宽度设置
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.global_menu_width') })
            .id('menu_sample_introduction_title_32')
          // Column：垂直布局容器
          // 关键属性：宽度、背景色、圆角、外边距
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Text：文本
              // 关键属性：外边距
              Text($r('app.string.menu_width')).id('menu_sample_text_35')
                .margin({ left: 12, top: 18, bottom: 8.5 })
              // Blank：占位空白
              // 关键属性：trunc
              Blank().id('menu_sample_blank_36')
              // Text：文本
              // 关键属性：外边距
              Text(Math.trunc(this.menuWidth) + this.vpText).id('menu_sample_text_37')
                .margin({ right: 12, top: 18, bottom: 8.5 })
            }.id('menu_sample_row_34')
            .width('100%')

            // Slider：滑块
            // 关键属性：showTips、toFixed、外边距、内容变更回调
            // 交互：输入/提交回调
            Slider({
              style: SliderStyle.OutSet,
              value: this.menuWidth,
              step: 1,
              min: 0,
              max: MAXWIDTH
            })
              .id('menu_setWidth')
              .showTips(true, this.realMenuWidth.toFixed())
              .margin({ left: 6, right: 6, bottom: 12 })
              .onChange(value => {
                this.realMenuWidth = value;
                if (value < MINWIDTH) {
                  this.menuWidth = MINWIDTH;
                } else {
                  this.menuWidth = value;
                }
              })
          }.id('menu_sample_column_33')
          .width('100%')
          .backgroundColor('#FFFFFF')
          .borderRadius(24)
          .margin({ top: 9.5, bottom: 70 })
        }.id('menu_sample_column_14')
        .constraintSize({ minHeight: '100%' })
        .padding({ left: 12, right: 12 })
      }
      .id('menu_scroll')
      .onClick(() => {
        // 点击时关闭菜单
        ShowToast.shortToast($r('app.string.global_menu_close'));
        ContextMenu.close();
      })
    }.id('menu_sample_column_12')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}