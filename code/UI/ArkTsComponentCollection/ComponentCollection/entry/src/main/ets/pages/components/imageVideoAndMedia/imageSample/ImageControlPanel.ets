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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/imageSample/ImageControlPanel.ets
 * 文件职责：ImageControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SourceSizeControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonItemColorSelect } from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import { OBJECT_FIT_SELECT, RENDER_MODE_SELECT, REPEAT_SELECT } from '../../../components/ComponentData';

/**
 * SourceSizeControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct SourceSizeControlPanel {
  // @Link sizeHeight：与父组件双向绑定的状态
  @Link sizeHeight: number;

  // @Link sizeWidth：与父组件双向绑定的状态
  @Link sizeWidth: number;

  // @Link ObjectFit：与父组件双向绑定的状态
  @Link ObjectFit: ImageFit;

  // @Link RenderMode：与父组件双向绑定的状态
  @Link RenderMode: ImageRenderMode;

  // @Link ObjectRepeat：与父组件双向绑定的状态
  @Link ObjectRepeat: ImageRepeat;

  // @Link fillColor：与父组件双向绑定的状态
  @Link fillColor: Color;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.object_fit_change'),
        selects: getStringArrayData(OBJECT_FIT_SELECT),
        callback: (index) => {
          // 分支：switch (index) {
          switch (index) {
            // 分支：case 1:
            case 1:
              // 处理：this.ObjectFit = ImageFit.None;
              this.ObjectFit = ImageFit.None;
              break;
            // 分支：case 2:
            case 2:
              // 处理：this.ObjectFit = ImageFit.Cover;
              this.ObjectFit = ImageFit.Cover;
              break;
            // 分支：case 3:
            case 3:
              // 处理：this.ObjectFit = ImageFit.Contain;
              this.ObjectFit = ImageFit.Contain;
              break;
            // 分支：case 4:
            case 4:
              // 处理：this.ObjectFit = ImageFit.Fill;
              this.ObjectFit = ImageFit.Fill;
              break;
            // 分支：case 5:
            case 5:
              // 处理：this.ObjectFit = ImageFit.ScaleDown;
              this.ObjectFit = ImageFit.ScaleDown;
              break;
            default:
              // 处理：this.ObjectFit = ImageFit.Auto;
              this.ObjectFit = ImageFit.Auto;
          }
        },testId:'image_001'
      }).id('image_control_panel_common_item_select_2')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider(
        {
          changeValue: $sizeHeight,
          min: 0,
          max: 110,
          name: $r('app.string.image_sourcesize_height'),
          testId:'image_slider_001'
        }
      ).id('image_control_panel_common_item_two_row_slider_3')
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider(
        {
          changeValue: $sizeWidth,
          min: 0,
          max: 110,
          name: $r('app.string.image_sourcesize_width'),
          testId:'image_slider_002'
        }
      ).id('image_control_panel_common_item_two_row_slider_4')
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.image_renderMode_change'),
        selects: getStringArrayData(RENDER_MODE_SELECT),
        callback: (index) => {
          switch (index) {
            case 1:
              this.RenderMode = ImageRenderMode.Template;
              break;
            default:
              this.RenderMode = ImageRenderMode.Original;
          }
        },testId:'image_select_002'
      }).id('image_control_panel_common_item_select_5')
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.image_repeat_change'),
        selects: getStringArrayData(REPEAT_SELECT),
        callback: (index) => {
          switch (index) {
            case 1:
              this.ObjectRepeat = ImageRepeat.X;
              break;
            case 2:
              this.ObjectRepeat = ImageRepeat.Y;
              break;
            case 3:
              this.ObjectRepeat = ImageRepeat.XY;
              break;
            default:
              this.ObjectRepeat = ImageRepeat.NoRepeat;
          }
        },testId:'image_select_003'
      }).id('image_control_panel_common_item_select_6')
      // CommonItemColorSelect：CommonItemColorSelect 自定义组件
      CommonItemColorSelect({
        name: $r('app.string.qrcode_color'),
        isItemStyle: true,
        selectColor: $fillColor,
        testId:'image_color_001'
      }).id('image_control_panel_common_item_color_select_7')
    }.id('image_control_panel_column_1')
  }
}