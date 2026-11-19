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
 * @file entry/src/main/ets/pages/components/textAndInput/textSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangeTextCase、ChangeTextAttribute。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'

/**
 * ChangeTextCase：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangeTextCase {
  // @Link textCase：与父组件双向绑定的状态
  @Link textCase: TextCase

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      // 关键属性：外边距
      CommonItemSelect({
        testId: 'select5',
        name: $r('app.string.text_text_case'),
        selects: [$r('app.string.text_text_case_normal'),
                  $r('app.string.text_text_case_uppercase'),
                  $r('app.string.text_text_case_lowercase')],
        callback: (index) => {
          // 分支：switch (index) {
          switch (index) {
            // 分支：case 1:
            case 1:
              // 处理：this.textCase = TextCase.UpperCase
              this.textCase = TextCase.UpperCase
              break
            // 分支：case 2:
            case 2:
              // 处理：this.textCase = TextCase.LowerCase
              this.textCase = TextCase.LowerCase
              break
            default:
              // 处理：this.textCase = TextCase.Normal
              this.textCase = TextCase.Normal
          // 结束当前组件块
          }
        // 结束当前组件块
        }
      // 结束当前组件块
      }).id('change_panel_common_item_select_2')
        // margin：设置外边距
        .margin({ top: 12 })
    }.id('change_panel_column_1')
  }
}

/**
 * ChangeTextAttribute：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangeTextAttribute {
  // @Link letterSpacing：与父组件双向绑定的状态
  @Link letterSpacing: number
  // @Link textOverFlow：与父组件双向绑定的状态
  @Link textOverFlow: TextOverflow
  // @Link textMaxLines：与父组件双向绑定的状态
  @Link textMaxLines: number
  // @Link lineHeight：与父组件双向绑定的状态
  @Link lineHeight: number
  // @Link fontColor：与父组件双向绑定的状态
  @Link fontColor: string
  // @Link styleForDecorative：与父组件双向绑定的状态
  @Link styleForDecorative: TextDecorationType
  // @Link textAlign：与父组件双向绑定的状态
  @Link textAlign: TextAlign

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSlider：CommonItemSlider 自定义组件
      CommonItemSlider({
        changeValue: $letterSpacing,
        min: 0,
        max: 10,
        name: $r('app.string.text_letter_spacing')
      // 结束当前组件块
      }).id('change_panel_common_item_slider_4')

      // CommonItemSlider：CommonItemSlider 自定义组件
      CommonItemSlider({
        changeValue: $lineHeight,
        min: 20,
        max: 32,
        name: $r('app.string.text_line_height')
      // 结束当前组件块
      }).id('change_panel_common_item_slider_5')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: 'select1',
        name: $r('app.string.text_text_align_type'),
        selects: [$r('app.string.text_text_align_start'),
                  $r('app.string.text_text_align_center'),
                  $r('app.string.text_text_align_end')],
        callback: (index) => {
          // 分支：switch (index) {
          switch (index) {
            // 分支：case 1:
            case 1:
              // 处理：this.textAlign = TextAlign.Center
              this.textAlign = TextAlign.Center
              break
            // 分支：case 2:
            case 2:
              this.textAlign = TextAlign.End
              break
            default:
              this.textAlign = TextAlign.Start
          }
        }
      }).id('change_panel_common_item_select_6')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: 'select2',
        name: $r('app.string.text_overflow'),
        selects: [$r('app.string.text_none'),
                  $r('app.string.text_text_over_flow_clip'),
                  $r('app.string.text_text_over_flow_ellipsis')],
        callback: (index) => {
          switch (index) {
            case 1:
              this.textMaxLines = 3
            // Clip is default type
              this.textOverFlow = TextOverflow.Clip
              break
            case 2:
              this.textMaxLines = 3
              this.textOverFlow = TextOverflow.Ellipsis
              break
            default:
              this.textMaxLines = -1
              this.textOverFlow = TextOverflow.None
          }
        }
      }).id('change_panel_common_item_select_7')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: 'select3',
        name: $r('app.string.text_decoration_type'),
        selects: [$r('app.string.text_none'),
                  $r('app.string.text_decoration_type_line_through'),
                  $r('app.string.text_decoration_type_over_line'),
                  $r('app.string.text_decoration_type_under_line')],
        callback: (index) => {
          switch (index) {
            case 1:
              this.styleForDecorative = TextDecorationType.LineThrough
              break
            case 2:
              this.styleForDecorative = TextDecorationType.Overline
              break
            case 3:
              this.styleForDecorative = TextDecorationType.Underline
              break
            default:
              this.styleForDecorative = TextDecorationType.None
          }
        }
      }).id('change_panel_common_item_select_8')

      // CommonItemColorInput will parse color 'FF000000' -> '#FF000000'
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        testId: 'select4',
        name: $r('app.string.text_font_color'),
        selectColor: $fontColor
      }).id('change_panel_common_item_color_select_9')
    }.id('change_panel_column_3')
  }
}