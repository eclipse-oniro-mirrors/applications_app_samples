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
 * @file entry/src/main/ets/pages/components/textAndInput/searchSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：searchControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect,CommonItemColorSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';

/**
 * searchControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct searchControlPanel {
  // @Link placeholderColor：与父组件双向绑定的状态
  @Link placeholderColor: Color;

  // @Link textAlign：与父组件双向绑定的状态
  @Link textAlign: TextAlign;

  // @Link copyOption：与父组件双向绑定的状态
  @Link copyOption: CopyOptions;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.search_textalign_change'),
        selects: [$r('app.string.textarea_textalign_start'),$r('app.string.textarea_textalign_center'),$r('app.string.textarea_textalign_end')],
        callback: (index) => {
          switch (index) {
            case 1:
              this.textAlign = TextAlign.Center;
              break;
            case 2:
              this.textAlign = TextAlign.End;
              break;
            default:
              this.textAlign = TextAlign.Start;
          }
        },testId:'search_select_001'
      }).id('change_panel_common_item_select_2')
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.search_copyOption_change'),
        selects: [$r('app.string.textarea_copyoptions_none'),$r('app.string.textarea_copyoptions_inapp'),$r('app.string.textarea_copyoptions_localdevice')],
        callback: (index) => {
          switch (index) {
            case 1:
              this.copyOption = CopyOptions.InApp;
              break;
            case 2:
              this.copyOption = CopyOptions.LocalDevice;
              break;
            default :
              this.copyOption = CopyOptions.None;
          }
        },testId:'search_select_002'
      }).id('change_panel_common_item_select_3')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.search_placeholder_change'),
        isItemStyle:true,
        selectColor:$placeholderColor,
        testId:'search_color_001'
      }).id('change_panel_common_item_color_select_4')
    }.id('change_panel_column_1')
  }
}
