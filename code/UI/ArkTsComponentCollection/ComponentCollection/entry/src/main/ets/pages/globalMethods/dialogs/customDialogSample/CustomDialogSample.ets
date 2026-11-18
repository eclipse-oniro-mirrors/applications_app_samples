/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/customDialogSample/CustomDialogSample.ets
 * 文件职责：CustomDialogSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomDialogSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'
import { UpgradeDialog } from './CustomDialog'

@Extend(Row) function rowStyle() {
  .width('100%')
  .borderRadius(24)
  .margin({ top: 8, bottom: 8 })
  .justifyContent(FlexAlign.SpaceBetween)
}

/**
 * CustomDialogSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CustomDialogSample {
  private autoCloseDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    autoCancel: true
  })
  private manualCloseDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    autoCancel: false
  })
  private topDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    alignment: DialogAlignment.Top
  })
  private centerDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    alignment: DialogAlignment.Center
  })
  private bottomDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    alignment: DialogAlignment.Bottom
  })
  private leftDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    offset: { dx: -20, dy: -150 }
  })
  private rightDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    offset: { dx: 20, dy: 30 }
  })
  private customDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    customStyle: true,
    alignment: DialogAlignment.Bottom,
  })
  private unCustomDialog: CustomDialogController = new CustomDialogController({
    builder: UpgradeDialog(),
    customStyle: false,
    alignment: DialogAlignment.Bottom,
  })

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.custom_dialog') }).id('custom_dialog_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_auto_cancel') })
            .id('custom_dialog_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            this.DialogButton($r('app.string.alert_dialog_true'), this.autoCloseDialog)
            this.DialogButton($r('app.string.alert_dialog_false'), this.manualCloseDialog)
          }.id('custom_dialog_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_location') })
            .id('custom_dialog_sample_introduction_title_7')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            this.DialogButton($r('app.string.alert_dialog_top'), this.topDialog)
            this.DialogButton($r('app.string.alert_dialog_center'), this.centerDialog)
            this.DialogButton($r('app.string.alert_dialog_bottom'), this.bottomDialog)
          }.id('custom_dialog_sample_row_8')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_offset') })
            .id('custom_dialog_sample_introduction_title_9')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            this.DialogButton($r('app.string.alert_dialog_left'), this.leftDialog)
            this.DialogButton($r('app.string.alert_dialog_right'), this.rightDialog)
          }.id('custom_dialog_sample_row_10')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.custom_dialog_style_custom') })
            .id('custom_dialog_sample_introduction_title_11')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            this.DialogButton($r('app.string.custom_dialog_style_custom_true'), this.customDialog)
            this.DialogButton($r('app.string.custom_dialog_style_custom_false'), this.unCustomDialog)
          }.id('custom_dialog_sample_row_12')
          .rowStyle()
        }.id('custom_dialog_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('custom_dialog_sample_scroll_3')
    }.id('custom_dialog_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder DialogButton(dialogName: Resource, dialog: CustomDialogController) {
    // Button：按钮
    // 关键属性：外边距、字号、布局权重、字体颜色、背景色、内边距
    // 交互：可点击交互
    Button(dialogName)
      .margin(8)
      .fontSize(16)
      .layoutWeight(1)
      .fontColor($r('app.color.background_blue'))
      .backgroundColor($r('app.color.background_grey'))
      .padding({ left: 12, right: 12, top: 8, bottom: 8 })
      .onClick(() => {
        dialog.open()
      }).id('test_dialogButton')
  }
}