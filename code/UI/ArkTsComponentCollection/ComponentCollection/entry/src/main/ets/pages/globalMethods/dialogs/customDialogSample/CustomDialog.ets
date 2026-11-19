/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/customDialogSample/CustomDialog.ets
 * 文件职责：CustomDialog 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UpgradeDialog。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * UpgradeDialog：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@CustomDialog
export struct UpgradeDialog {
  private controller: CustomDialogController

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：外边距、高度、圆角、内边距、背景色
    Column() {
      // Text：文本
      // 关键属性：内边距、字号、PermissionIntroduction
      Text($r('app.string.custom_dialog_title')).id('custom_dialog_text_2')
        .padding(8)
        .fontSize(24)
      this.PermissionIntroduction($r('app.media.ic_custom_dialog_voice'), $r('app.string.custom_dialog_permission_microphone'), $r('app.string.custom_dialog_permission_microphone_info'))
      this.PermissionIntroduction($r('app.media.ic_custom_dialog_location'), $r('app.string.custom_dialog_permission_location'), $r('app.string.custom_dialog_permission_location_info'))
      // Blank：占位空白
      Blank().id('custom_dialog_blank_3')
      // Button：按钮
      // 关键属性：高度、字号、字体颜色、外边距、点击事件回调、close
      // 交互：可点击交互
      Button($r('app.string.custom_dialog_start')).id('custom_dialog_button_4')
        .height(40)
        .fontSize(24)
        .fontColor(Color.White)
        .margin({ left: 4, right: 4, top: 12 })
        .onClick(() => {
          this.controller.close()
        })
    }.id('custom_dialog_column_1')
    .margin(20)
    .height(380)
    .borderRadius(24)
    .padding({ top: 20, bottom: 32 })
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder PermissionIntroduction(image: Resource, permissionName: Resource, introduction: Resource) {
    // Row：水平布局容器
    // 关键属性：宽度、外边距
    Row() {
      // Image：图片
      // 关键属性：宽度、高度、外边距
      Image(image).id('custom_dialog_image_6')
        .width(50)
        .height(50)
        .margin({ left: 30, right: 30 })
      // Column：垂直布局容器
      // 关键属性：交叉轴对齐
      Column({ space: 4 }) {
        // Text：文本
        // 关键属性：字号
        Text(permissionName).id('custom_dialog_text_8')
          .fontSize(20)
        // Text：文本
        // 关键属性：字号、字体颜色、尺寸约束
        Text(introduction).id('custom_dialog_text_9')
          .fontSize(18)
          .fontColor($r('app.color.font_color_shallow'))
          .constraintSize({ maxWidth: 280 })
      }.id('custom_dialog_column_7')
      .alignItems(HorizontalAlign.Start)
    }.id('custom_dialog_row_5')
    .width('100%')
    .margin({ top: 20 })
  }
}