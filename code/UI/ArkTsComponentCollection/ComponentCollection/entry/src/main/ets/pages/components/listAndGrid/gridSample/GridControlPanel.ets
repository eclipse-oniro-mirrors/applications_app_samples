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
 * @file entry/src/main/ets/pages/components/listAndGrid/gridSample/GridControlPanel.ets
 * 文件职责：GridControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect } from '../../../../common/AttributeModificationTool';

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link columnTemplate：与父组件双向绑定的状态
  @Link columnTemplate: string;

  // @Link rowsTemplate：与父组件双向绑定的状态
  @Link rowsTemplate: string;

  // @Link columnsGap：与父组件双向绑定的状态
  @Link columnsGap: number;

  // @Link rowGap：与父组件双向绑定的状态
  @Link rowGap: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_properties_columns_template'),
        selects: ['1', '2', '3'],
        callback: (index) => {
          switch (index) {
            case 1:
              this.columnTemplate = '1fr 1fr 2fr 1fr';
              break;
            case 2:
              this.columnTemplate = '1fr 1fr 3fr 1fr';
              break;
            default:
              this.columnTemplate = '1fr 1fr 1fr 1fr';
              break;
          }
        },
        testId : `grid_001`
      }).id('grid_control_panel_common_item_select_2')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.grid_properties_rows_template'),
        selects: ['1', '2', '3'],
        callback: (index) => {
          switch (index) {
            case 1:
              this.rowsTemplate= '1fr 1fr 2fr 1fr';
              break;
            case 2:
              this.rowsTemplate= '1fr 1fr 3fr 1fr';
              break;
            default:
              this.rowsTemplate= '1fr 1fr 1fr 1fr';
              break;
          }
        },
        testId : `grid_002`
      }).id('grid_control_panel_common_item_select_3')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        name: $r('app.string.grid_properties_columns_gap'),
        min: 0,
        max: 15,
        changeValue: $columnsGap,
        testId : `grid_003`
      }).id('grid_control_panel_common_item_two_row_slider_4')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        name: $r('app.string.grid_properties_columns_gap'),
        min: 0,
        max: 15,
        changeValue: $rowGap,
        testId : `grid_004`
      }).id('grid_control_panel_common_item_two_row_slider_5')
    }.id('grid_control_panel_column_1')
  }
}