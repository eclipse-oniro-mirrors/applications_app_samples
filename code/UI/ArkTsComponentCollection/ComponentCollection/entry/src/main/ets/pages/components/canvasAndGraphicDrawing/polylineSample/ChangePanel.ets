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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/polylineSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PolylineControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemColorSelect} from '../../../../common/AttributeModificationTool';

/**
 * PolylineControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PolylineControlPanel {
  // @Link polylineFirstX：与父组件双向绑定的状态
  @Link polylineFirstX: number;

  // @Link polylineFirstY：与父组件双向绑定的状态
  @Link polylineFirstY: number;

  // @Link polylineSecondX：与父组件双向绑定的状态
  @Link polylineSecondX: number;

  // @Link polylineSecondY：与父组件双向绑定的状态
  @Link polylineSecondY: number;

  // @Link polylineThirdX：与父组件双向绑定的状态
  @Link polylineThirdX: number;

  // @Link polylineThirdY：与父组件双向绑定的状态
  @Link polylineThirdY: number;

  // @Link strokeWidth：与父组件双向绑定的状态
  @Link strokeWidth: number;

  // @Link stroke：与父组件双向绑定的状态
  @Link stroke: Color;

  // @Link strokeDashArray：与父组件双向绑定的状态
  @Link strokeDashArray: number;

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
        name: $r('app.string.polyline_stroke_color'),
        isItemStyle: true,
        selectColor: $stroke,
        testId: 'polyline_color_001'
      }).id('change_panel_common_item_color_select_2')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineFirstX,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_first_x'),
        testId: 'polyline_slider_001'
      }).id('change_panel_common_item_two_row_slider_3')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineFirstY,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_first_y'),
        testId: 'polyline_slider_002'
      }).id('change_panel_common_item_two_row_slider_4')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineSecondX,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_second_x'),
        testId: 'polyline_slider_003'
      }).id('change_panel_common_item_two_row_slider_5')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineSecondY,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_second_y'),
        testId: 'polyline_slider_004'
      }).id('change_panel_common_item_two_row_slider_6')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineThirdX,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_third_x'),
        testId: 'polyline_slider_005'
      }).id('change_panel_common_item_two_row_slider_7')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $polylineThirdY,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_third_y'),
        testId: 'polyline_slider_006'
      }).id('change_panel_common_item_two_row_slider_8')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeOpacity,
        max: 100,
        min: 0,
        name: $r('app.string.polyline_stroke_opacity'),
        vpTest: '%',
        testId: 'polyline_slider_007'
      }).id('change_panel_common_item_two_row_slider_9')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeWidth,
        max: 10,
        min: 3,
        name: $r('app.string.polyline_stroke_width'),
        testId: 'polyline_slider_008'
      }).id('change_panel_common_item_two_row_slider_10')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeDashArray,
        max: 40,
        min: 1,
        name: $r('app.string.polyline_stroke_dash'),
        testId: 'polyline_slider_009'
      }).id('change_panel_common_item_two_row_slider_11')
    }.id('change_panel_column_1')
  }
}