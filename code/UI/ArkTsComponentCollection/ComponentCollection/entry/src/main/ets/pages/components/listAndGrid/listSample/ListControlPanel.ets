/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/listAndGrid/listSample/ListControlPanel.ets
 * 文件职责：ListControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ArgumentsSpaceControlPanel、ArgumentsInitIndexControlPanel、PropertiesListDirectionControlPanel、
 *   PropertiesStrokeWidthControlPanel、PropertiesLineColorControlPanel、PropertiesBarStateControlPanel、
 *   PropertiesScrollBarColorControlPanel、PropertiesScrollBarWidthControlPanel、PropertiesEdgeEffectControlPanel、
 *   PropertiesChainAnimationControlPanel、PropertiesMultiControlPanel、PropertiesLanesControlPanel、
 *   PropertiesAlignListItemControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonItemColorSelect, CommonSwitcher, CommonItemColorSelectDef } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { LIST_DIRECTION_SELECT_DATA, LIST_SCROLLBAR_SELECT_DATA,LIST_EDGE_EFFECT_SELECT_DATA, LIST_ALIGN_LIST_ITEM_SELECT_DATA } from '../../ComponentData';

/**
 * ArgumentsSpaceControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsSpaceControlPanel {
  // @Link space：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link space : number;
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $space,
        min: 0,
        max: 30,
        name: $r('app.string.list_argument_space'),
        testId: `list_001`
      }).id('list_control_panel_common_item_two_row_slider_2')
    }.id('list_control_panel_column_1')
  }
}

/**
 * ArgumentsInitIndexControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsInitIndexControlPanel {
  // @Link initIndex：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link initIndex : number;
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_initial_index'),
        selects : ['0','1','2','3','4','5','6','7','8','9'],
        callback : (index,value)=>{
          this.initIndex = Number.parseInt(value);
          AppStorage.setOrCreate('listSampleInitIndex', Number.parseInt(value));
        },
        testId: `list_002`
      }).id('list_control_panel_common_item_select_4')
    }.id('list_control_panel_column_3')
  }
}

/**
 * PropertiesListDirectionControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesListDirectionControlPanel {
  // @Link listDirection：与父组件双向绑定的状态
  @Link listDirection : Axis;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_direction'),
        selects : getStringArrayData(LIST_DIRECTION_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 1:
              this.listDirection = Axis.Horizontal;
              break;
            default:
              this.listDirection = Axis.Vertical;
              break;
          }
        },
        testId: `list_003`
      }).id('list_control_panel_common_item_select_6')
    }.id('list_control_panel_column_5')
  }
}

/**
 * PropertiesStrokeWidthControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesStrokeWidthControlPanel {
  // @Link strokeWidth：与父组件双向绑定的状态
  @Link strokeWidth : number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $strokeWidth,
        min: 0,
        max: 15,
        name: $r('app.string.list_properties_divider_stroke_width'),
        testId: `list_004`
      }).id('list_control_panel_common_item_two_row_slider_8')
    }.id('list_control_panel_column_7')
  }
}

/**
 * PropertiesLineColorControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesLineColorControlPanel {
  // @Link lineColor：与父组件双向绑定的状态
  @Link lineColor : Resource;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.list_properties_divider_color'),
        selectColor: $lineColor,
        testId: 'list_005',
      }).id('list_control_panel_common_item_color_select_10')
    }.id('list_control_panel_column_9')
  }
}

/**
 * PropertiesBarStateControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesBarStateControlPanel {
  // @Link barState：与父组件双向绑定的状态
  @Link barState : BarState;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_scroll_bar'),
        selects : getStringArrayData(LIST_SCROLLBAR_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 1:
              this.barState = BarState.On
              break;
            case 2:
              this.barState = BarState.Auto
              break;
            default:
              this.barState = BarState.Off
              break;
          }
        },
        testId: `list_006`
      }).id('list_control_panel_common_item_select_12')

    }.id('list_control_panel_column_11')
  }
}

/**
 * PropertiesScrollBarColorControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesScrollBarColorControlPanel {
  // @Link scrollBarColor：与父组件双向绑定的状态
  @Link scrollBarColor: Color;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemColorSelectDef：CommonItemColorSelectDef 自定义组件
      CommonItemColorSelectDef({
        name: $r('app.string.list_properties_scroll_bar_color'),
        selectColor: $scrollBarColor,
        testId: 'list_013',
      }).id('list_control_panel_common_item_color_select_def_14')
    }.id('list_control_panel_column_13')
  }
}

/**
 * PropertiesScrollBarWidthControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesScrollBarWidthControlPanel {
  // @Link scrollBarWidth：与父组件双向绑定的状态
  @Link scrollBarWidth: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $scrollBarWidth,
        min: 0,
        max: 15,
        name: $r('app.string.list_properties_scroll_bar_width'),
        testId: `list_012`
      }).id('list_control_panel_common_item_two_row_slider_16')
    }.id('list_control_panel_column_15')
  }
}

/**
 * PropertiesEdgeEffectControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesEdgeEffectControlPanel {
  // @Link edgeEffect：与父组件双向绑定的状态
  @Link edgeEffect : EdgeEffect;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_edge_effect'),
        selects : getStringArrayData(LIST_EDGE_EFFECT_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 0:
              this.edgeEffect = EdgeEffect.Spring;
              break;
            case 1:
              this.edgeEffect = EdgeEffect.Fade;
              break;
            default:
              this.edgeEffect = EdgeEffect.None;
              break;
          }
        },
        testId: `list_007`
      }).id('list_control_panel_common_item_select_18')
    }.id('list_control_panel_column_17')
  }
}

/**
 * PropertiesChainAnimationControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesChainAnimationControlPanel {
  // @Link isChainAnimation：与父组件双向绑定的状态
  @Link isChainAnimation : boolean;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.list_properties_chain_animation'),
        bool : $isChainAnimation,
        testID: `list_008`
      }).id('list_control_panel_common_switcher_20')
    }.id('list_control_panel_column_19')
  }
}

/**
 * PropertiesMultiControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesMultiControlPanel {
  // @Link multiSelectable：与父组件双向绑定的状态
  @Link multiSelectable : boolean;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.list_properties_multi_selectable'),
        bool : $multiSelectable,
        testID: `list_009`
      }).id('list_control_panel_common_switcher_22')
    }.id('list_control_panel_column_21')
  }
}

/**
 * PropertiesLanesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesLanesControlPanel {
  // @Link lanes：与父组件双向绑定的状态
  @Link lanes : number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_lanes'),
        selects : ['0','1','2','3','4','5','6','7','8','9'],
        callback : (index,value)=>{
          this.lanes = Number.parseInt(value);
        },
        testId: `list_010`
      }).id('list_control_panel_common_item_select_24')
    }.id('list_control_panel_column_23')
  }
}

/**
 * PropertiesAlignListItemControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesAlignListItemControlPanel {
  // @Link alignListItem：与父组件双向绑定的状态
  @Link alignListItem : ListItemAlign;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.list_properties_align_list_item'),
        selects : getStringArrayData(LIST_ALIGN_LIST_ITEM_SELECT_DATA),
        callback : (index,value)=>{
          switch (index) {
            case 1:
              this.alignListItem = ListItemAlign.Center;
              break;
            case 2:
              this.alignListItem = ListItemAlign.End;
              break;
            default:
              this.alignListItem = ListItemAlign.Start;
              break;
          }
        },
        testId: `list_011`
      }).id('list_control_panel_common_item_select_26')

    }.id('list_control_panel_column_25')
  }
}