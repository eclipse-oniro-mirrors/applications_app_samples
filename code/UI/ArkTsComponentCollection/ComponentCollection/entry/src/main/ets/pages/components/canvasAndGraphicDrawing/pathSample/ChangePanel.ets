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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/pathSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PathControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonItemColorSelect
} from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { PATH_SELECT_COMMANDS } from '../../ComponentData';

/**
 * PathControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PathControlPanel {
  // @Link commands：与父组件双向绑定的状态
  @Link commands: string;

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
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        // 字段 name：声明并维护该成员的状态
        name: $r('app.string.path_commands_select'),
        // 字段 selects：声明并维护该成员的状态
        selects: getStringArrayData(PATH_SELECT_COMMANDS),
        // 字段 callback：声明并维护该成员的状态
        callback: (index) => {
          // switch 语句
          switch (index) {
            // 分支：case 1
            case 1:
              this.commands = 'M100 0 L200 240 L0 240 Z';
              break;
            // 分支：case 2
            case 2:
              this.commands = 'M0 0 H200 V200 H0 Z';
              break;
            case 3:
              this.commands = 'M100 0 L0 100 L50 200 L150 200 L200 100 Z';
              break;
            case 4:
              this.commands = 'M0 300 S100 0 240 300 Z';
              break;
            case 5:
              this.commands = 'M0 150 C0 100 140 0 200 150 L100 300 Z';
              break;
            case 6:
              this.commands = 'M0 100 A30 20 20 0 0 200 100 Z';
              break;
            default:
              this.commands = 'M0 0 L600 0';
          }
        }, testId: 'path_select_001'
      }).id('change_panel_common_item_select_2')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.path_fill'),
        isItemStyle: true,
        selectColor: $fill,
        testId: 'path_color_001'
      }).id('change_panel_common_item_color_select_3')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.path_stroke_color'),
        isItemStyle: true,
        selectColor: $stroke,
        testId: 'path_color_002'
      }).id('change_panel_common_item_color_select_4')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $fillOpacity,
        max: 100,
        min: 0,
        name: $r('app.string.path_fill_opacity'),
        vpTest:'%',
        testId: 'path_slider_001'
      }).id('change_panel_common_item_two_row_slider_5')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeOpacity,
        max: 100,
        min: 0,
        name: $r('app.string.path_stroke_opacity'),
        vpTest:'%',
        testId: 'path_slider_002'
      }).id('change_panel_common_item_two_row_slider_6')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeWidth,
        max: 10,
        min: 3,
        name: $r('app.string.path_stroke_width'),
        testId: 'path_slider_003'
      }).id('change_panel_common_item_two_row_slider_7')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeDashArray,
        max: 40,
        min: 1,
        name: $r('app.string.path_stroke_dash'),
        testId: 'path_slider_004'
      }).id('change_panel_common_item_two_row_slider_8')
    }.id('change_panel_column_1')
  }
}