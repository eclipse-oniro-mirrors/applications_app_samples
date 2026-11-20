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
 * @file entry/src/main/ets/pages/components/navigation/tabSample/TabControlPanel.ets
 * 文件职责：TabControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsControlPanel、PropertiesControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect, CommonSwitcher } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { TABS_BAR_POSITION_SELECT, TABS_BAR_MODE_SELECT } from '../../ComponentData';

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link barPosition：与父组件双向绑定的状态
  @Link barPosition: BarPosition;
  private changeIndex !: (index: number) => void;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.tabs_arguments_bar_position'),
        selects: getStringArrayData(TABS_BAR_POSITION_SELECT),
        callback: (index) => {
          switch (index) {
            case 1:
              this.barPosition = BarPosition.End;
              break;
            default:
              this.barPosition = BarPosition.Start;
              break;
          }
        },
        testId: `tab_001`
      }).id('tab_control_panel_common_item_select_2')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.tabs_arguments_controller'),
        selects: ['0', '1', '2', '3'],
        callback: (index) => {
          this.changeIndex(index)
        },
        testId: `tab_002`
      }).id('tab_control_panel_common_item_select_3')
    }.id('tab_control_panel_column_1')
  }
}

/**
 * PropertiesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesControlPanel {
  // @Link vertical：与父组件双向绑定的状态
  @Link vertical: boolean;

  // @Link barMode：与父组件双向绑定的状态
  @Link barMode: BarMode;

  // @Link isScrollable：与父组件双向绑定的状态
  @Link isScrollable: boolean;

  // @Link animationDuration：与父组件双向绑定的状态
  @Link animationDuration: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $vertical,
        name: $r('app.string.tabs_properties_vertical'),
        testID: `tab_003`
      }).id('tab_control_panel_common_switcher_5')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $isScrollable,
        name: $r('app.string.tabs_properties_is_scrollable'),
        testID: `tab_004`
      }).id('tab_control_panel_common_switcher_6')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.tabs_properties_bar_mode'),
        selects: getStringArrayData(TABS_BAR_MODE_SELECT),
        callback: (index) => {
          switch (index) {
            case 1:
              this.barMode = BarMode.Scrollable;
              break;
            default:
              this.barMode = BarMode.Fixed;
              break;
          }
        },
        testId: `tab_005`
      }).id('tab_control_panel_common_item_select_7')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.tabs_properties_animation_duration'),
        selects: ['400', '1000', '2000', '3000'],
        callback: (index, duration) => {
          this.animationDuration = Number.parseInt(duration);
        },
        testId: `tab_006`
      }).id('tab_control_panel_common_item_select_8')
    }.id('tab_control_panel_column_4')
  }
}