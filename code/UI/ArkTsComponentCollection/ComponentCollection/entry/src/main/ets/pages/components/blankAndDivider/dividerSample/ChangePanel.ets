/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/blankAndDivider/dividerSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link lineColor：与父组件双向绑定的状态
  @Link lineColor: Resource
  // @Link strokeWidth：与父组件双向绑定的状态
  @Link strokeWidth: number
  // @Link lineCapStyle：与父组件双向绑定的状态
  @Link lineCapStyle: LineCapStyle

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Slid to change stroke width
      // CommonItemSlider：CommonItemSlider 自定义组件
      CommonItemSlider({ changeValue: $strokeWidth, min: 1, max: 25, name: $r('app.string.divider_stroke_width') })
        .id('change_panel_common_item_slider_2')

      // Select line color
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.divider_line_color'),
        selectColor: $lineColor,
        testId: 'colorSelect'
      }).id('change_panel_common_item_color_select_3')

      // Select lineCapStyle
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: 'capSelect',
        name: $r('app.string.divider_line_cap'),
        selects: [$r('app.string.divider_line_type_butt'), $r('app.string.divider_line_type_round'),
        $r('app.string.divider_line_type_square')],
        callback: (index) => {
          switch (index) {
            case 1:
              this.lineCapStyle = LineCapStyle.Round
              break
            case 2:
              this.lineCapStyle = LineCapStyle.Square
              break
            default:
              this.lineCapStyle = LineCapStyle.Butt
          }
        }
      }).id('change_panel_common_item_select_4')
    }.id('change_panel_column_1')
  }
}