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
 * @file entry/src/main/ets/pages/universal/properties/backgroundSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool'
import { selectImageSizeData,selectImageAlignmentData } from '../../UniversialData'
import { getStringArrayData,getStringData } from '../../../../data/ResourceDataHandle'

/**
 * ChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ChangePanel {
  // @Link imageSize：与父组件双向绑定的状态
  @Link imageSize: ImageSize
  // @Link alignment：与父组件双向绑定的状态
  @Link alignment: Alignment

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: "test_select1",
        name: $r('app.string.set_background_image_size'),
        selects: getStringArrayData(selectImageSizeData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.imageSize = ImageSize.Cover
              break
            default:
              this.imageSize = ImageSize.Contain
          }
        }
      }).id('change_panel_common_item_select_2')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: "test_select2",
        name: $r('app.string.set_background_image_position'),
        selects: getStringArrayData(selectImageAlignmentData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.alignment = Alignment.TopStart
              break
            case 1:
              this.alignment = Alignment.Top
              break
            case 2:
              this.alignment = Alignment.TopEnd
              break
            case 3:
              this.alignment = Alignment.Start
              break
            case 4:
              this.alignment = Alignment.Center
              break
            case 5:
              this.alignment = Alignment.End
              break
            case 6:
              this.alignment = Alignment.BottomStart
              break
            case 7:
              this.alignment = Alignment.Bottom
              break
            default:
              this.alignment = Alignment.BottomEnd
          }
        }
      }).id('change_panel_common_item_select_3')
    }.id('change_panel_column_1')
  }
}