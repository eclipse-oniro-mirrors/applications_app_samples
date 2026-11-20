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
 * @file entry/src/main/ets/pages/components/navigation/navigatorSample/NavigatorSample.ets
 * 文件职责：NavigatorSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavigationSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

/**
 * NavigationSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavigationSample {
  // @State active：组件内部状态
  @State active: boolean = false
  private Text: Record<string, Resource> = { 'message': $r('app.string.navigator_return_message') };

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：外边距
      TitleBar({ title: $r('app.string.navigator_title') }).id('navigator_sample_title_bar_2')
        .margin({ bottom: 12 })
      // Navigator：Navigator 自定义组件
      // 关键属性：params、外边距
      Navigator({
        target: 'pages/components/navigation/navigatorSample/NavigatorSecondPage',
        type: NavigationType.Push
      }) {
        // Text：文本
        // 关键属性：宽度、文本对齐、params
        Text($r('app.string.navigation_first_page_push'))
          .width('100%')
          .textAlign(TextAlign.Center)
          .id(`navigator_001`)
      }.id('navigator_sample_navigator_3').params({ text: this.Text }) // 传参数到Detail页面
      .margin({ bottom: 12 })
    }.id('navigator_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}