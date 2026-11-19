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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/sliderSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link blockColor：与父组件双向绑定的状态
  @Link blockColor: Color
  // @Link selectColor：与父组件双向绑定的状态
  @Link selectColor: Color
  // @Link trackColor：与父组件双向绑定的状态
  @Link trackColor: Color
  // @Link trackThickness：与父组件双向绑定的状态
  @Link trackThickness: number

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSlider：CommonItemSlider 自定义组件
      CommonItemSlider({
        name: $r('app.string.slider_track_thickness'),
        changeValue: $trackThickness,
        min: 4,
        max: 9
      }).id('change_panel_common_item_slider_2')

      // CommonItemColorInput will parse color 'FFFFFFFF' -> '#FFFFFFFF'
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.slider_block_color'),
        selectColor: $blockColor,
        testId: "test_select1"
      }).id('change_panel_common_item_color_select_3')

      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.slider_select_color'),
        selectColor: $selectColor,
        testId: "test_select2"
      }).id('change_panel_common_item_color_select_4')

      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.slider_track_color'),
        selectColor: $trackColor,
        testId: "test_select3"
      }).id('change_panel_common_item_color_select_5')
    }.id('change_panel_column_1')
  }
}