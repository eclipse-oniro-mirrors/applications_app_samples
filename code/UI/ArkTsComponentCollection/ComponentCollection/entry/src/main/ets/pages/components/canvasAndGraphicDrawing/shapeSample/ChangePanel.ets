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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/shapeSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShapeControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemColorSelect } from '../../../../common/AttributeModificationTool';

/**
 * ShapeControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ShapeControlPanel {
  // @Link fillOpacity：与父组件双向绑定的状态
  @Link fillOpacity: number;

  // @Link strokeWidth：与父组件双向绑定的状态
  @Link strokeWidth: number;

  // @Link stroke：与父组件双向绑定的状态
  @Link stroke: Color;

  // @Link strokeDashArray：与父组件双向绑定的状态
  @Link strokeDashArray: number;

  // @Link fill：与父组件双向绑定的状态
  @Link fill: Color;

  // @Link strokeOpacity：与父组件双向绑定的状态
  @Link strokeOpacity: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.shape_fill'),
        isItemStyle: true,
        selectColor: $fill,
        testId: 'shape_color_001'
      }).id('change_panel_common_item_color_select_2')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.shape_stroke_color'),
        isItemStyle: true,
        selectColor: $stroke,
        testId: 'shape_color_002'
      }).id('change_panel_common_item_color_select_3')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeOpacity,
        max: 100,
        min: 0,
        name: $r('app.string.shape_stroke_opacity'),
        vpTest: '%',
        testId: 'shape_slider_001'
      }).id('change_panel_common_item_two_row_slider_4')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $fillOpacity,
        max: 100,
        min: 0,
        name: $r('app.string.shape_fill_opacity'),
        vpTest: '%',
        testId: 'shape_slider_002'
      }).id('change_panel_common_item_two_row_slider_5')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeWidth,
        max: 10,
        min: 3,
        name: $r('app.string.shape_stroke_width'),
        testId: 'shape_slider_003'
      }).id('change_panel_common_item_two_row_slider_6')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeDashArray,
        max: 40,
        min: 1,
        name: $r('app.string.shape_stroke_dash'),
        testId: 'shape_slider_004'
      }).id('change_panel_common_item_two_row_slider_7')
    }.id('change_panel_column_1')
  }
}