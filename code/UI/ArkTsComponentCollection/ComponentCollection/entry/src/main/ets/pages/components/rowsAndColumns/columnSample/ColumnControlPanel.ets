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
 * @file entry/src/main/ets/pages/components/rowsAndColumns/columnSample/ColumnControlPanel.ets
 * 文件职责：ColumnControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsControlPanel、PropertyControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { COLUMN_ALIGNITEMS_DATA, COLUMN_JUSTIFYCONTENT_DATA } from '../../ComponentData';

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link elementSpacing：与父组件双向绑定的状态
  @Link elementSpacing: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider(
        {
          changeValue: $elementSpacing,
          min: 0,
          max: 110,
          name: $r('app.string.column_element_spacing'),
          testId: `column_001`
        }
      ).id('column_control_panel_common_item_two_row_slider_2')
    }.id('column_control_panel_column_1')
  }
}

/**
 * PropertyControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertyControlPanel {
  // @Link alignItems：与父组件双向绑定的状态
  @Link alignItems: HorizontalAlign;

  // @Link justifyContent：与父组件双向绑定的状态
  @Link justifyContent: FlexAlign;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.column_alignitems_description'),
        selects: getStringArrayData(COLUMN_ALIGNITEMS_DATA),
        callback: (index) => {
          switch (index) {
            case 1:
              this.alignItems = HorizontalAlign.Center;
              break;
            case 2:
              this.alignItems = HorizontalAlign.End;
              break;
            default:
              this.alignItems = HorizontalAlign.Start;
          }
        },
        testId: `column_002`
      }).id('column_control_panel_common_item_select_4')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.column_justifycontent_description'),
        selects: getStringArrayData(COLUMN_JUSTIFYCONTENT_DATA),
        callback: (index) => {
          switch (index) {
            case 1:
              this.justifyContent = FlexAlign.Center;
              break;
            case 2:
              this.justifyContent = FlexAlign.End;
              break;
            case 3:
              this.justifyContent = FlexAlign.SpaceBetween;
              break;
            case 4:
              this.justifyContent = FlexAlign.SpaceAround;
              break;
            case 5:
              this.justifyContent = FlexAlign.SpaceEvenly;
              break;
            default:
              this.justifyContent = FlexAlign.Start;
          }
        },
        testId: `column_003`
      }).id('column_control_panel_common_item_select_5')
    }.id('column_control_panel_column_3')
  }
}
