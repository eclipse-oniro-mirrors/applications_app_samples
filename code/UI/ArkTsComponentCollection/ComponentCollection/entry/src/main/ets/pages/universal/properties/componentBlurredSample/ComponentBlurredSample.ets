/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/properties/componentBlurredSample/ComponentBlurredSample.ets
 * 文件职责：ComponentBlurredSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ComponentBlurredSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * ComponentBlurredSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ComponentBlurredSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.component_blurred') }).id('component_blurred_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：主轴对齐、高度、宽度、背景图、backgroundImageSize
      Column() {
        // Row：水平布局容器
        // 关键属性：主轴对齐、宽度、高度、背景模糊
        Row() {
          // Text：文本
          Text($r('app.string.component_blurred_thin')).id('component_blurred_sample_text_5')
        }.id('component_blurred_sample_row_4')
        .justifyContent(FlexAlign.Center)
        .width('50%')
        .height('50%')
        .backgroundBlurStyle(BlurStyle.Thin)
      }.id('component_blurred_sample_column_3')
      .justifyContent(FlexAlign.Center)
      .height('90%')
      .width('90%')
      .backgroundImage($r('app.media.ic_scenery1'))
      .backgroundImageSize(ImageSize.Cover)
    }.id('component_blurred_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}