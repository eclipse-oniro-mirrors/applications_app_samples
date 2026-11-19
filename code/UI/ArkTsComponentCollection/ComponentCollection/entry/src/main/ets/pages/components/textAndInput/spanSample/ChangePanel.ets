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
 * @file entry/src/main/ets/pages/components/textAndInput/spanSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'
import { selectData } from '../../ComponentData'
import { getStringArrayData } from '../../../../data/ResourceDataHandle'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link letterSpacing：与父组件双向绑定的状态
  @Link letterSpacing: number
  // @Link decoration：与父组件双向绑定的状态
  @Link decoration: TextDecorationType
  // @Link decorationColor：与父组件双向绑定的状态
  @Link decorationColor: Color
  // @Link lineHeight：与父组件双向绑定的状态
  @Link lineHeight: number

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
        max: 12,
        name: $r('app.string.span_letter_spacing'),
        testId:'Slider1'
      }).id('change_panel_common_item_slider_2')

      // CommonItemSlider：CommonItemSlider 自定义组件
      CommonItemSlider({
        changeValue: $lineHeight,
        min: 0,
        max: 100,
        name: $r('app.string.span_line_height'),
        testId:'Slider2'
      }).id('change_panel_common_item_slider_3')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.span_decoration_type'),
        selects: getStringArrayData(selectData),
        callback: (index) => {
          switch (index) {
            case 1:
              this.decoration = TextDecorationType.LineThrough
              break
            case 2:
              this.decoration = TextDecorationType.Underline
              break
            case 3:
              this.decoration = TextDecorationType.Overline
              break
            default:
              this.decoration = TextDecorationType.None
          }
        }
      }).id('change_panel_common_item_select_4')

      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.span_decoration_color'),
        selectColor: $decorationColor
      }).id('change_panel_common_item_color_select_5')
    }.id('change_panel_column_1')
  }
}