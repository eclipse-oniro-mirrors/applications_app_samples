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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/qrCodeSample/QRCodeSample.ets
 * 文件职责：QRCodeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：QRCodeSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemInput, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Column) function backgroundStyle() {
  .padding(12)
  .borderRadius(24)
  .margin({ top: 12 })
  .layoutWeight(4)
  .backgroundColor(Color.White)
}

/**
 * QRCodeSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct QRCodeSample {
  // @State qrCodeContent：组件内部状态
  @State qrCodeContent: string = ''
  // @State qrCodeColor：组件内部状态
  @State qrCodeColor: Color = Color.Black

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：主轴对齐、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.qrcode_title') }).id('qrcode_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：backgroundStyle、主轴对齐
      Column() {
        // QRCode：二维码
        // 关键属性：color
        QRCode(this.qrCodeContent).id('qrcode_sample_qrcode_4') // QR code content
          .color(this.qrCodeColor) // QR code color
          .id('test_qrcode')
      }.id('qrcode_sample_column_3')
      .backgroundStyle()
      .justifyContent(FlexAlign.Center)

      // Scroll：滚动容器
      // 关键属性：外边距、布局权重
      Scroll() {
        // Column：垂直布局容器
        Column() {
          // CommonItemInput：CommonItemInput 自定义组件
          CommonItemInput({
            inputValue: $qrCodeContent,
            name: $r('app.string.qrcode_content'),
            placeholder: $r('app.string.qrcode_enter_content')
          }).id('qrcode_sample_common_item_input_7')

          // QR code color
          // CommonItemColorSelect：CommonItemColorSelect 自定义组件
          CommonItemColorSelect({
            name: $r('app.string.qrcode_color'),
            isItemStyle: false,
            selectColor: $qrCodeColor
          }).id('qrcode_sample_common_item_color_select_8')
        }.id('qrcode_sample_column_6')
      }.id('qrcode_sample_scroll_5')
      .margin({ top: 12, left: 12, right: 12 })
      .layoutWeight(6)
    }.id('qrcode_sample_column_1')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}