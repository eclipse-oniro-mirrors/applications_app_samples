/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/sideBarTransitionSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool'
import { getStringArrayData } from '../../../../data/ResourceDataHandle'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link mSideBarContainerType：与父组件双向绑定的状态
  @Link mSideBarContainerType: SideBarContainerType
  private selectData: Resource[] = [$r('app.string.side_bar_type_embed'), $r('app.string.side_bar_type_overlay'), $r('app.string.side_bar_type_auto')]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.set_side_bar_type'),
        selects: getStringArrayData(this.selectData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.mSideBarContainerType = SideBarContainerType.Embed
              break
            case 1:
              this.mSideBarContainerType = SideBarContainerType.Overlay
              break
            default:
              this.mSideBarContainerType = SideBarContainerType.AUTO
          }
        }
      }).id('change_panel_common_item_select_2')
    }.id('change_panel_column_1')
  }
}