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
 * @file entry/src/main/ets/pages/components/textAndInput/imageSpanSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangeVerticalAlign、ChangeObjectFit。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect, CommonItemColorSelect } from '../../../../common/AttributeModificationTool'
import { selectData } from '../../ComponentData'
import { getStringArrayData } from '../../../../data/ResourceDataHandle'

/**
 * ChangeVerticalAlign：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangeVerticalAlign {
  // @Link imageSpanAlignment：与父组件双向绑定的状态
  @Link imageSpanAlignment: ImageSpanAlignment

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      // 关键属性：外边距
      CommonItemSelect({
        testId: 'alignment',
	name: $r('app.string.image_span_vertical_align'),
        selects: [$r('app.string.image_span_alignment_baseline'),
        $r('app.string.image_span_alignment_center'),
        $r('app.string.image_span_alignment_top'),
        $r('app.string.image_span_alignment_bottom')],
        callback: (index) => {
          switch (index) {
            case 0:
              this.imageSpanAlignment = ImageSpanAlignment.BASELINE
              break
            case 1:
              this.imageSpanAlignment = ImageSpanAlignment.CENTER
              break
            case 2:
              this.imageSpanAlignment = ImageSpanAlignment.TOP
              break
            default:
              this.imageSpanAlignment = ImageSpanAlignment.BOTTOM
          }
        }
      }).id('change_panel_common_item_select_2')
        .margin({ top: 12 })
    }.id('change_panel_column_1')
  }
}

/**
 * ChangeObjectFit：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangeObjectFit {
  // @Link imageFit：与父组件双向绑定的状态
  @Link imageFit : ImageFit

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      // 关键属性：外边距
      CommonItemSelect({
        testId: 'fit',
	name: $r('app.string.image_span_object_fit'),
        selects: [$r('app.string.image_fit_contain'),
        $r('app.string.image_fit_auto'),
        $r('app.string.image_fit_fill'),
        $r('app.string.image_fit_none'),
        $r('app.string.image_fit_cover')],
        callback: (index) => {
          switch (index) {
            case 0:
              this.imageFit = ImageFit.Contain
              break
            case 1:
              this.imageFit = ImageFit.Auto
              break
            case 2:
              this.imageFit = ImageFit.Fill
              break
            case 3:
              this.imageFit = ImageFit.ScaleDown
              break
            case 4:
              this.imageFit = ImageFit.None
              break
            default:
              this.imageFit = ImageFit.Cover
          }
        }
      }).id('change_panel_common_item_select_4')
        .margin({ top: 12 })
    }.id('change_panel_column_3')
  }
}
