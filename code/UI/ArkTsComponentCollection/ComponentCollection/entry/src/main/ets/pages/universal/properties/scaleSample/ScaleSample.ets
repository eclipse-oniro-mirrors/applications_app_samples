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
 * @file entry/src/main/ets/pages/universal/properties/scaleSample/ScaleSample.ets
 * 文件职责：ScaleSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageSlider、TranslateSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ImageItemSlider } from '../../../../common/AttributeModificationTool';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';

/**
 * ImageSlider：类定义，承载本文件对应的逻辑与数据。
 */
class ImageSlider {
  isXAxis: boolean = false;
  axisName!: Resource;
}

/**
 * TranslateSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TranslateSample {
  // @State imageTranslateX：组件内部状态
  @State imageTranslateX: number = 1;

  // @State imageTranslateY：组件内部状态
  @State imageTranslateY: number = 1;

  // @State containerTranslateX：组件内部状态
  @State containerTranslateX: number = 0;

  // @State containerTranslateY：组件内部状态
  @State containerTranslateY: number = 0;
  private imageSliders: Array<ImageSlider> =
    [
      { isXAxis: true, axisName: $r('app.string.translate_x_axis') },
      { isXAxis: false, axisName: $r('app.string.translate_y_axis') }
    ];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.scale') }).id('scale_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.scale_image') }).id('scale_sample_introduction_title_5')
          // Image translate
          // Column：垂直布局容器
          // 关键属性：高度、外边距、宽度、圆角、背景色、主轴对齐
          Column() {
            // Image：图片
            // 关键属性：宽度、高度、缩放
            Image($r('app.media.ic_scenery1')).id('scale_sample_image_7')
              .width(100)
              .height(100)
              .scale({ x: this.imageTranslateX, y: this.imageTranslateY })
          }.id('scale_sample_column_6')
          .height(300)
          .margin({ left: 12, right: 12 })
          .width('100%')
          .borderRadius(24)
          .backgroundColor(Color.White)
          .justifyContent(FlexAlign.Center)

          ForEach(this.imageSliders, (item: ImageSlider) => {
            // Row：水平布局容器
            // 关键属性：内边距、外边距、主轴对齐
            Row() {
              if (item.isXAxis) {
                // ImageItemSlider：ImageItemSlider 自定义组件
                ImageItemSlider({ changeValue: $imageTranslateX, min: 0, max: 4, name: item.axisName })
                  .id('scale_x')
              } else {
                // ImageItemSlider：ImageItemSlider 自定义组件
                ImageItemSlider({ changeValue: $imageTranslateY, min: 0, max: 2, name: item.axisName })
                  .id('scale_y')
              }
            }.id('scale_sample_row_8')
            .padding(4)
            .margin({ left: 20, right: 20 })
            .justifyContent(FlexAlign.Center)
          })
        }.id('scale_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('scale_sample_scroll_3')
    }.id('scale_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}