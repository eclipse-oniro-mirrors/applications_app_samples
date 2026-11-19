/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/scrollAndSwipe/swiperSample/SwiperCustomAnimationControlPanel.ets
 * 文件职责：SwiperCustomAnimationControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomAnimationPropertiesControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSelect, CommonSwitcher } from '../../../../common/AttributeModificationTool';

/**
 * CustomAnimationPropertiesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CustomAnimationPropertiesControlPanel {
  // @Link changeOpacity：与父组件双向绑定的状态
  @Link changeOpacity: boolean;

  // @Link changeScale：与父组件双向绑定的状态
  @Link changeScale: boolean;

  // @Link closeTwoPagesTogether：与父组件双向绑定的状态
  @Link closeTwoPagesTogether: boolean;

  // @Link cancelDefaultTranslate：与父组件双向绑定的状态
  @Link cancelDefaultTranslate: boolean;

  // @Link customAnimationAutoPlay：与父组件双向绑定的状态
  @Link customAnimationAutoPlay: boolean;

  // @Link customAnimationDuration：与父组件双向绑定的状态
  @Link customAnimationDuration: number;

  // @Link customAnimationCurve：与父组件双向绑定的状态
  @Link customAnimationCurve: string;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $changeOpacity,
        name: $r('app.string.swiper_custom_property_opacity'),
        testID: `custom_swiper_001`
      }).id('swiper_custom_animation_control_panel_common_switcher_2')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_3')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $changeScale,
        name: $r('app.string.swiper_custom_property_scale'),
        testID: `custom_swiper_002`
      }).id('swiper_custom_animation_control_panel_common_switcher_4')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_5')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $closeTwoPagesTogether,
        name: $r('app.string.swiper_close_two_pages_together'),
        testID: `custom_swiper_003`
      }).id('swiper_custom_animation_control_panel_common_switcher_6')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_7')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $cancelDefaultTranslate,
        name: $r('app.string.swiper_cancel_default_translate'),
        testID: `custom_swiper_004`
      }).id('swiper_custom_animation_control_panel_common_switcher_8')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_9')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $customAnimationAutoPlay,
        name: $r('app.string.swiper_property_auto_play'),
        testID: `custom_swiper_005`
      }).id('swiper_custom_animation_control_panel_common_switcher_10')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_11')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.swiper_properties_duration'),
        selects: ['400', '1000', '2000'],
        menuAlignType: MenuAlignType.END,
        callback: (index, str) => {
          this.customAnimationDuration = Number.parseInt(str);
        },
        testId:`custom_swiper_006`
      }).id('swiper_custom_animation_control_panel_common_item_select_12')

      // Divider：分割线
      Divider().id('swiper_custom_animation_control_panel_divider_13')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.swiper_custom_property_curve'),
        selects: ['Linear', 'Ease', 'FastOutSlowIn', 'Sharp', 'Rhythm', 'Smooth', 'Friction'],
        menuAlignType: MenuAlignType.END,
        callback: (index, str) => {
          this.customAnimationCurve = str;
        },
        testId:`custom_swiper_007`
      }).id('swiper_custom_animation_control_panel_common_item_select_14')
    }.id('swiper_custom_animation_control_panel_column_1')
  }
}