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
 * @file entry/src/main/ets/pages/components/listAndGrid/gridItemSample/GridItemControlPanel.ets
 * 文件职责：GridItemControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PropertiesControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect } from '../../../../common/AttributeModificationTool';

/**
 * PropertiesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesControlPanel {
  // @Link rowStart：与父组件双向绑定的状态
  @Link rowStart: number;

  // @Link rowEnd：与父组件双向绑定的状态
  @Link rowEnd: number;

  // @Link columnStart：与父组件双向绑定的状态
  @Link columnStart: number;

  // @Link columnEnd：与父组件双向绑定的状态
  @Link columnEnd: number;

  // @Link gridItemStyle：与父组件双向绑定的状态
  @Link gridItemStyle: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_item_row_start'),
        selects: ['0', '1', '2', '3', '4'],
        callback: (index, value) => {
          this.rowStart = Number.parseInt(value);
        },
        testId: `griditem_001`
      }).id('grid_item_control_panel_common_item_select_2')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_item_row_end'),
        selects: ['0', '1', '2', '3', '4'],
        callback: (index, value) => {
          this.rowEnd = Number.parseInt(value);
        },
        testId: `griditem_002`
      }).id('grid_item_control_panel_common_item_select_3')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_item_column_start'),
        selects: ['0', '1', '2', '3', '4'],
        callback: (index, value) => {
          this.columnStart = Number.parseInt(value);
        },
        testId: `griditem_003`
      }).id('grid_item_control_panel_common_item_select_4')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_item_column_end'),
        selects: ['0', '1', '2', '3', '4'],
        callback: (index, value) => {
          this.columnEnd = Number.parseInt(value);
        },
        testId: `griditem_004`
      }).id('grid_item_control_panel_common_item_select_5')

      // polymorphic styles
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_item_polymorphic_styles'),
        selects: ['plain', 'none'],
        callback: (index, value) => {
          if (value === 'plain') {
            this.gridItemStyle = 1;
          } else if (value == 'none') {
            this.gridItemStyle = 0;
          }
        },
        testId: 'gridItem_style'
      }).id('grid_item_control_panel_common_item_select_6')
    }.id('grid_item_control_panel_column_1')
  }
}