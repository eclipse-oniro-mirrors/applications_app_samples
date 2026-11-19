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
 * @file entry/src/main/ets/pages/components/navigation/navigatorSample/NavigatorThirdPage.ets
 * 文件职责：NavigatorThirdPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BackExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { TitleBar } from '../../../../common/TitleBar';

/**
 * BackExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct BackExample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({title : $r('app.string.navigator_third_page')}).id('navigator_third_page_title_bar_2')
      // Navigator：Navigator 自定义组件
      Navigator({ target: 'pages/components/navigation/navigatorSample/NavigatorSample', type: NavigationType.Back }) {
        // Text：文本
        // 关键属性：宽度、文本对齐
        Text($r('app.string.navigator_third_page_back'))
          .width('100%')
          .textAlign(TextAlign.Center)
          .id(`navigator_003`)
      }.id('navigator_third_page_navigator_3')
    }.id('navigator_third_page_column_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}