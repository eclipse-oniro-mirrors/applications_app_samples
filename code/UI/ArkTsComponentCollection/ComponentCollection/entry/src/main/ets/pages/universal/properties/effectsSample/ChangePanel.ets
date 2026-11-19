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
 * @file entry/src/main/ets/pages/universal/properties/effectsSample/ChangePanel.ets
 * 文件职责：ChangePanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BackgroundBlurChangePanel、ShadowChangePanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect } from '../../../../common/AttributeModificationTool'
import { selectBlurStyleColorModeData,  selectBlurStyleAdaptiveColorData, selectShadowTypeData} from '../../UniversialData'
import { getStringArrayData,getStringData } from '../../../../data/ResourceDataHandle'

/**
 * BackgroundBlurChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct BackgroundBlurChangePanel {
  // @Link mColorMode：与父组件双向绑定的状态
  @Link mColorMode: ThemeColorMode
  // @Link mAdaptiveColor：与父组件双向绑定的状态
  @Link mAdaptiveColor: AdaptiveColor

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: "test_select1",
        name: $r('app.string.set_background_blur_style_color_mode'),
        selects: getStringArrayData(selectBlurStyleColorModeData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.mColorMode = ThemeColorMode.SYSTEM
              break
            case 1:
              this.mColorMode = ThemeColorMode.LIGHT
              break
            default:
              this.mColorMode = ThemeColorMode.DARK
          }
        }
      }).id('change_panel_common_item_select_2')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: "test_select2",
        name: $r('app.string.set_background_blur_style_adaptive_color'),
        selects: getStringArrayData(selectBlurStyleAdaptiveColorData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.mAdaptiveColor = AdaptiveColor.DEFAULT
              break
            default:
              this.mAdaptiveColor = AdaptiveColor.AVERAGE
          }
        }
      }).id('change_panel_common_item_select_3')
    }.id('change_panel_column_1')
  }
}

/**
 * ShadowChangePanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ShadowChangePanel {
  // @Link mShadowType：与父组件双向绑定的状态
  @Link mShadowType: ShadowType

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        testId: "test_select1",
        name: $r('app.string.set_shadow_type'),
        selects: getStringArrayData(selectShadowTypeData),
        callback: (index) => {
          switch (index) {
            case 0:
              this.mShadowType = ShadowType.COLOR
              break
            default:
              this.mShadowType = ShadowType.BLUR
          }
        }
      }).id('change_panel_common_item_select_5')
    }.id('change_panel_column_4')
  }
}