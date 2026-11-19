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
 * @file entry/src/main/ets/pages/components/rowsAndColumns/sideBarContainerSample/SideBarContainerControlPanel.ets
 * 文件职责：SideBarContainerControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsControlPanel、PropertyControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonSwitcher } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { SBC_POSITION_DATA, SBC_TYPE_DATA } from '../../ComponentData';

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link type：与父组件双向绑定的状态
  @Link type: SideBarContainerType;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        // 字段 name：声明并维护该成员的状态
        name: $r('app.string.sidebarcontainer_argument_type'),
        // 字段 selects：声明并维护该成员的状态
        selects: getStringArrayData(SBC_TYPE_DATA),
        // 字段 callback：声明并维护该成员的状态
        callback: (index) => {
          // switch 语句
          switch (index) {
            // 分支：case 1
            case 1:
              this.type = SideBarContainerType.Overlay;
              break;
            // 分支：default
            default:
              this.type = SideBarContainerType.Embed;
          }
        },
        // 字段 testId：声明并维护该成员的状态
        testId : `sidebarContainer_001`
      }).id('side_bar_container_control_panel_common_item_select_2')
    }.id('side_bar_container_control_panel_column_1')
    .width('100%')
  }
}

/**
 * PropertyControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertyControlPanel {
  // @Link isShowSidebar：与父组件双向绑定的状态
  @Link isShowSidebar: boolean;

  // @Link leftMargin：与父组件双向绑定的状态
  @Link leftMargin: number;

  // @Link topMargin：与父组件双向绑定的状态
  @Link topMargin: number;

  // @Link isShowButton：与父组件双向绑定的状态
  @Link isShowButton: boolean;

  // @Link sidebarPosition：与父组件双向绑定的状态
  @Link sidebarPosition: SideBarPosition;

  // @Link minWidth：与父组件双向绑定的状态
  @Link minWidth: number;

  // @Link maxWidth：与父组件双向绑定的状态
  @Link maxWidth: number;

  // @Link isAutoHidden：与父组件双向绑定的状态
  @Link isAutoHidden: boolean;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column({space:5}) {
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.sidebarcontainer_show_switch'),
        bool: $isShowSidebar,
        testID: `sidebarContainer_002`
      }).id('side_bar_container_control_panel_common_switcher_4')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $leftMargin,
        min: 0,
        max: 100,
        name: $r('app.string.sidebarcontainer_left_margin'),
        testId: `sidebarContainer_003`
      }).id('side_bar_container_control_panel_common_item_two_row_slider_5')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $topMargin,
        min: 0,
        max: 100,
        name: $r('app.string.sidebarcontainer_top_margin'),
        testId: `sidebarContainer_004`
      }).id('side_bar_container_control_panel_common_item_two_row_slider_6')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.sidebarcontainer_show_button_switch'),
        bool: $isShowButton,
        testID: `sidebarContainer_005`
      }).id('side_bar_container_control_panel_common_switcher_7')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.sidebarcontainer_position_title'),
        selects: getStringArrayData(SBC_POSITION_DATA),
        callback: (index) => {
          switch (index) {
            case 1:
              this.sidebarPosition = SideBarPosition.End;
              break;
            default:
              this.sidebarPosition = SideBarPosition.Start;
          }
        },
        testId: `sidebarContainer_006`
      }).id('side_bar_container_control_panel_common_item_select_8')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $minWidth,
        min: 10,
        max: 190,
        name: $r('app.string.sidebarcontainer_min_width'),
        testId: `sidebarContainer_007`
      }).id('side_bar_container_control_panel_common_item_two_row_slider_9')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $maxWidth,
        min: 210,
        max: 300,
        name: $r('app.string.sidebarcontainer_max_width'),
        testId: `sidebarContainer_008`
      }).id('side_bar_container_control_panel_common_item_two_row_slider_10')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.sidebarcontainer_auto_hide'),
        bool: $isAutoHidden,
        testID: `sidebarContainer_009`
      }).id('side_bar_container_control_panel_common_switcher_11')
    }.id('side_bar_container_control_panel_column_3')
  }
}