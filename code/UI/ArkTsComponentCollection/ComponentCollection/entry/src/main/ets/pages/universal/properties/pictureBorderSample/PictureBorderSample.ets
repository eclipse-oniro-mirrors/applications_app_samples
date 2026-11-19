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
 * @file entry/src/main/ets/pages/universal/properties/pictureBorderSample/PictureBorderSample.ets
 * 文件职责：PictureBorderSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PictureBorderSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * PictureBorderSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PictureBorderSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.picture_border') }).id('picture_border_sample_title_bar_2')
      // Row：水平布局容器
      // 关键属性：主轴对齐、高度、内边距、圆角、宽度、背景色
      Row({ space: 16 }) {
        // Image：图片
        // 关键属性：高度、宽度、borderImage
        Image($r('app.media.img_love')).id('picture_border_sample_image_4')
          .height(200).width(200)
          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: { top: 10, bottom: 10, left: 10, right: 10 },
            width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
            repeat: RepeatMode.Stretch,
            fill: false
          })
      }.id('picture_border_sample_row_3')
      .justifyContent(FlexAlign.Center)
      .height(300)
      .padding(8)
      .borderRadius(24)
      .width('100%')
      .backgroundColor(Color.White)
      .margin({ left: 12, right: 12 })
    }.id('picture_border_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}