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
 * @file entry/src/main/ets/pages/components/scrollAndSwipe/swiperSample/SwiperControlPanel.ets
 * 文件职责：SwiperControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PropertiesControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonSwitcher } from '../../../../common/AttributeModificationTool';

/**
 * PropertiesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PropertiesControlPanel {
  // @Link isDisableSwipe：与父组件双向绑定的状态
  @Link isDisableSwipe: boolean;

  // @Link itemSpace：与父组件双向绑定的状态
  @Link itemSpace: number;

  // @Link isVertical：与父组件双向绑定的状态
  @Link isVertical: boolean;

  // @Link duration：与父组件双向绑定的状态
  @Link duration: number;

  // @Link loop：与父组件双向绑定的状态
  @Link loop: boolean;

  // @Link autoPlay：与父组件双向绑定的状态
  @Link autoPlay: boolean;

  // @Link interval：与父组件双向绑定的状态
  @Link interval: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $isDisableSwipe,
        name: $r('app.string.swiper_properties_disable_swipe'),
        testID: `swiper_001`
      }).id('swiper_control_panel_common_switcher_2')

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_3')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        bool: $isVertical,
        name: $r('app.string.swiper_properties_vertical'),
        testID: `swiper_002`
      }).id('swiper_control_panel_common_switcher_4')

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_5')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.swiper_properties_loop'),
        bool: $loop,
        testID: `swiper_003`
      }).id('swiper_control_panel_common_switcher_6')

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_7')

      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({
        name: $r('app.string.swiper_property_auto_play'),
        bool: $autoPlay,
        testID: `swiper_004`
      }).id('swiper_control_panel_common_switcher_8')

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_9')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $itemSpace,
        name: $r('app.string.swiper_properties_item_space'),
        min: 100,
        max: 300,
        step: 100,
        testId:"swiper_005"
      }).margin({ top: 12 })

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_11')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.swiper_properties_duration'),
        selects: ['400', '1000', '2000'],
        menuAlignType: MenuAlignType.END,
        callback: (index, str) => {
          this.duration = Number.parseInt(str);
        },
        testId:`swiper_006`
      }).id('swiper_control_panel_common_item_select_12')

      // Divider：分割线
      Divider().id('swiper_control_panel_divider_13')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.swiper_properties_interval'),
        selects: ['1000', '2000', '3000'],
        menuAlignType: MenuAlignType.END,
        callback: (index, str) => {
          this.interval = Number.parseInt(str);
        },
        testId:`swiper_007`
      }).id('swiper_control_panel_common_item_select_14')
    }.id('swiper_control_panel_column_1')
  }
}