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
 * @file entry/src/main/ets/pages/universal/properties/shapeCropSample/ShapeCropSample.ets
 * 文件职责：ShapeCropSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShapeCropSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .height(230)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * ShapeCropSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ShapeCropSample {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.shape_crop') }).id('shape_crop_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.shape_crop_clip') }).id('shape_crop_sample_introduction_title_3')
      // Row：水平布局容器
      // 关键属性：rowStyle
      Row() {
        // 用一个200px直径的圆对图片进行裁剪
        // Image：图片
        // 关键属性：裁剪、宽度、高度
        Image($r('app.media.ic_scenery1')).id('shape_crop_sample_image_5')
          .clip(new Circle({ width: 200, height: 200 }))
          .width(350)
          .height(200)
      }.id('shape_crop_sample_row_4')
      .rowStyle()

      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.shape_crop_mask') }).id('shape_crop_sample_introduction_title_6')
      // Row：水平布局容器
      // 关键属性：rowStyle
      Row() {
        // 给图片添加了一个200px*200px的圆形遮罩
        // Image：图片
        // 关键属性：遮罩、fill、宽度、高度
        Image($r('app.media.ic_scenery1')).id('shape_crop_sample_image_8')
          .mask(new Circle({ width: 200, height: 200 }).fill(Color.Gray))
          .width(350)
          .height(200)
      }.id('shape_crop_sample_row_7')
      .rowStyle()
    }.id('shape_crop_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}