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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/flexSample/FlexControlPanel.ets
 * 文件职责：FlexControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DirectionControlPanel、WrapControlPanel、JustifyContentControlPanel、AlignItemsControlPanel、
 *   AlignContentControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import {
  FLEX_DIRECTION_SELECT_DATA,
  FLEX_WRAP_SELECT_DATA,
  FLEX_JUSTIFY_CONTENT_SELECT_DATA,
  FLEX_ALIGN_ITEMS_SELECT_DATA
} from '../../ComponentData';

/**
 * DirectionControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct DirectionControlPanel {
  // @Link flexDirection：与父组件双向绑定的状态
  @Link flexDirection: FlexDirection;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // CommonItemSelect：CommonItemSelect 自定义组件
    CommonItemSelect({
      name: $r('app.string.flex_introduction_direction'),
      selects: getStringArrayData(FLEX_DIRECTION_SELECT_DATA),
      callback: (index) => {
        // 分支：switch (index) {
        switch (index) {
          // 分支：case 1:
          case 1:
            // 处理：this.flexDirection = FlexDirection.RowReverse;
            this.flexDirection = FlexDirection.RowReverse;
            break;
          // 分支：case 2:
          case 2:
            // 处理：this.flexDirection = FlexDirection.Column;
            this.flexDirection = FlexDirection.Column;
            break;
          // 分支：case 3:
          case 3:
            // 处理：this.flexDirection = FlexDirection.ColumnReverse
            this.flexDirection = FlexDirection.ColumnReverse;
            break;
          default:
            // 处理：this.flexDirection = FlexDirection.Row;
            this.flexDirection = FlexDirection.Row;
            break;
        // 结束当前组件块
        }
      // 结束当前组件块
      },
      testId: `flex_001`
    }).id('flex_control_panel_common_item_select_1')
  }
}

/**
 * WrapControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WrapControlPanel {
  // @Link wrap：与父组件双向绑定的状态
  @Link wrap: FlexWrap

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect(
        {
          name: $r('app.string.flex_argument_wrap'),
          selects: getStringArrayData(FLEX_WRAP_SELECT_DATA),
          callback: (index) => {
            // 分支：switch (index) {
            switch (index) {
              // 分支：case 1:
              case 1:
                // 处理：this.wrap = FlexWrap.Wrap;
                this.wrap = FlexWrap.Wrap;
                break;
              // 分支：case 2:
              case 2:
                // 处理：this.wrap = FlexWrap.WrapReverse;
                this.wrap = FlexWrap.WrapReverse;
                break;
              default:
                // 处理：this.wrap = FlexWrap.NoWrap;
                this.wrap = FlexWrap.NoWrap;
                break;
            // 结束当前组件块
            }
          // 结束当前组件块
          },
          testId: `flex_002`
        // 结束当前组件块
        }
      // 结束当前组件块
      ).id('flex_control_panel_common_item_select_3')
    }.id('flex_control_panel_column_2')
  }
}

/**
 * JustifyContentControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct JustifyContentControlPanel {
  // @Link JustifyContent：与父组件双向绑定的状态
  @Link JustifyContent: FlexAlign

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.flex_argument_justifycontent'),
        selects: getStringArrayData(FLEX_JUSTIFY_CONTENT_SELECT_DATA),
        callback: (index) => {
          // 分支：switch (index) {
          switch (index) {
            // 分支：case 1:
            case 1:
              // 处理：this.JustifyContent = FlexAlign.Center;
              this.JustifyContent = FlexAlign.Center;
              break;
            // 分支：case 2:
            case 2:
              // 处理：this.JustifyContent = FlexAlign.End;
              this.JustifyContent = FlexAlign.End;
              break;
            // 分支：case 3:
            case 3:
              this.JustifyContent = FlexAlign.SpaceBetween;
              break;
            case 4:
              this.JustifyContent = FlexAlign.SpaceAround;
              break;
            case 5:
              this.JustifyContent = FlexAlign.SpaceEvenly;
              break;
            default:
              this.JustifyContent = FlexAlign.Start;
              break;
          }
        },
        testId: `flex_003`
      }).id('flex_control_panel_common_item_select_5')
    }.id('flex_control_panel_column_4')
  }
}

/**
 * AlignItemsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct AlignItemsControlPanel {
  // @Link alignItems：与父组件双向绑定的状态
  @Link alignItems: ItemAlign

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // CommonItemSelect：CommonItemSelect 自定义组件
    CommonItemSelect({
      name: $r('app.string.flex_argument_alignItems'),
      selects: getStringArrayData(FLEX_ALIGN_ITEMS_SELECT_DATA),
      callback: (index) => {
        switch (index) {
          case 1:
            this.alignItems = ItemAlign.Start;
            break;
          case 2:
            this.alignItems = ItemAlign.Center;
            break;
          case 3:
            this.alignItems = ItemAlign.End;
            break;
          case 4:
            this.alignItems = ItemAlign.Stretch;
            break;
          case 5:
            this.alignItems = ItemAlign.Baseline;
            break;
          default:
            this.alignItems = ItemAlign.Auto;
            break;
        }
      },
      testId: `flex_004`
    }).id('flex_control_panel_common_item_select_6')
  }
}

/**
 * AlignContentControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct AlignContentControlPanel {
  // @Link alignContent：与父组件双向绑定的状态
  @Link alignContent: FlexAlign

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // CommonItemSelect：CommonItemSelect 自定义组件
    CommonItemSelect({
      name: $r('app.string.flex_argument_alignContent'),
      selects: getStringArrayData(FLEX_JUSTIFY_CONTENT_SELECT_DATA),
      callback: (index) => {
        switch (index) {
          case 1:
            this.alignContent = FlexAlign.Center;
            break;
          case 2:
            this.alignContent = FlexAlign.End;
            break;
          case 3:
            this.alignContent = FlexAlign.SpaceBetween;
            break;
          case 4:
            this.alignContent = FlexAlign.SpaceAround;
            break;
          case 5:
            this.alignContent = FlexAlign.SpaceEvenly;
            break;
          default:
            this.alignContent = FlexAlign.Start;
            break;
        }
      },
      testId:`flex_005`
    }).id('flex_control_panel_common_item_select_7')
  }
}