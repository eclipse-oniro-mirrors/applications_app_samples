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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/stackSample/StackControlPanel.ets
 * 文件职责：StackControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ZIndexControlPanel、ArgumentsControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { STACK_ARGUMENTS_SELECT_DATA, STACK_ZIND_SELECT_DATA } from '../../ComponentData';

/**
 * ZIndexControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ZIndexControlPanel{
  // @Link zindex：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link  zindex: number;
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name:$r('app.string.stack_zindex'),
        selects : getStringArrayData(STACK_ZIND_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 1:
              this.zindex = 1;
              break;
            default:
              this.zindex = 4
              break;
          }
        },
        testId:`stack_002`
      }).id('stack_control_panel_common_item_select_2')
    }.id('stack_control_panel_column_1')
  }
}

/**
 * ArgumentsControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ArgumentsControlPanel {
  // @Link alignContent：与父组件双向绑定的状态
  @Link alignContent : Alignment;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name:$r('app.string.stack_alignment'),
        selects:getStringArrayData(STACK_ARGUMENTS_SELECT_DATA),
        callback: (index)=>{
          switch (index) {
            case 1:
              this.alignContent = Alignment.Top;
              break;
            case 2:
              this.alignContent = Alignment.TopEnd;
              break;
            case 3:
              this.alignContent = Alignment.Start;
              break;
            case 4:
              this.alignContent = Alignment.Center;
              break;
            case 5:
              this.alignContent = Alignment.End;
              break;
            case 6:
              this.alignContent = Alignment.BottomStart;
              break;
            case 7:
              this.alignContent = Alignment.Bottom;
              break;
            case 8:
              this.alignContent = Alignment.BottomEnd;
              break;
            default:
              this.alignContent = Alignment.TopStart;
              break;
          }
        },
        testId:`stack_001`
      }).id('stack_control_panel_common_item_select_4')
    }.id('stack_control_panel_column_3')
  }
}
