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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/gridContainerSample/GridContainerControlPanel.ets
 * 文件职责：GridContainerControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import {  GRIDCONTAIER_SIZE_TYPE_SELECT_DATA  } from '../../ComponentData';

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link sizeType：与父组件双向绑定的状态
  @Link sizeType : SizeType;

  // @Link gutter：与父组件双向绑定的状态
  @Link gutter : number;

  // @Link gridMargin：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link gridMargin: number;
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name : $r('app.string.gridcontainer_sizetype'),
        selects : getStringArrayData(GRIDCONTAIER_SIZE_TYPE_SELECT_DATA),
        callback : (index) => {
          switch (index) {
            case 1:
              this.sizeType = SizeType.SM;
              break;
            case 2:
              this.sizeType = SizeType.MD;
              break;
            case 3:
              this.sizeType = SizeType.LG;
              break;
            case 4:
              this.sizeType = SizeType.Auto;
              break;
            default:
              this.sizeType = SizeType.XS;
              break;
          }
        },
        testId: `gridcontainer_001`
      }).id('grid_container_control_panel_common_item_select_2')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $gutter,
        min:0,
        max:20,
        name: $r('app.string.gridcontainer_gutter'),
        testId: `gridcontainer_002`
      }).id('grid_container_control_panel_common_item_two_row_slider_3')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $gridMargin,
        min:0,
        max:12,
        name: $r('app.string.gridcontainer_margin'),
        testId: `gridcontainer_003`
      }).id('grid_container_control_panel_common_item_two_row_slider_4')
    }.id('grid_container_control_panel_column_1')
  }
}
