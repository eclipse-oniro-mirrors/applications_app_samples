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
 * @file entry/src/main/ets/pages/components/textAndInput/patternLockSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PatternLockControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemColorSelect } from '../../../../common/AttributeModificationTool';

/**
 * PatternLockControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PatternLockControlPanel{
  // @Link sideLength：与父组件双向绑定的状态
  @Link sideLength: number;

  // @Link circleRadius：与父组件双向绑定的状态
  @Link circleRadius: number;

  // @Link pathStrokeWidth：与父组件双向绑定的状态
  @Link pathStrokeWidth: number;

  // @Link activeColor：与父组件双向绑定的状态
  @Link activeColor: Color;

  // @Link selectedColor：与父组件双向绑定的状态
  @Link selectedColor: Color;

  // @Link pathColor：与父组件双向绑定的状态
  @Link pathColor: Color;

  // @Link regularColor：与父组件双向绑定的状态
  @Link regularColor: Color;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue:$sideLength,
        name:$r('app.string.patternlock_side_length'),
        max:200,
        min:100,
        testId:'patternLock_slider_001'
      }).id('change_panel_common_item_two_row_slider_2')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue:$circleRadius,
        name:$r('app.string.patternlock_circle_radius'),
        max:12,
        min:3,
        testId:'patternLock_slider_002'
      }).id('change_panel_common_item_two_row_slider_3')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue:$pathStrokeWidth,
        name:$r('app.string.patternlock_pathstroke_width'),
        max:20,
        min:10,
        testId:'patternLock_slider_003'
      }).id('change_panel_common_item_two_row_slider_4')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.patternlock_regular_color'),
        isItemStyle: true,
        selectColor: $regularColor,
        testId:'patternLock_color_001'
      }).id('change_panel_common_item_color_select_5')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.patternlock_active_color'),
        isItemStyle: true,
        selectColor: $activeColor,
        testId:'patternLock_color_002'
      }).id('change_panel_common_item_color_select_6')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.patternlock_select_color'),
        isItemStyle: true,
        selectColor: $selectedColor,
        testId:'patternLock_color_003'
      }).id('change_panel_common_item_color_select_7')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.patternlock_path_color'),
        isItemStyle: true,
        selectColor: $pathColor,
        testId:'patternLock_color_004'
      }).id('change_panel_common_item_color_select_8')
    }.id('change_panel_column_1')
  }
}