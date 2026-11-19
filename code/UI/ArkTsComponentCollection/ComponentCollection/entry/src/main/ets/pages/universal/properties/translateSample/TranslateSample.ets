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
 * @file entry/src/main/ets/pages/universal/properties/translateSample/TranslateSample.ets
 * 文件职责：TranslateSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Slider、TranslateSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider } from '../../../../common/AttributeModificationTool';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';

/**
 * Slider：类定义，承载本文件对应的逻辑与数据。
 */
class Slider {
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
  @State imageTranslateX: number = 0;

  // @State imageTranslateY：组件内部状态
  @State imageTranslateY: number = 0;

  // @State containerTranslateX：组件内部状态
  @State containerTranslateX: number = 0;

  // @State containerTranslateY：组件内部状态
  @State containerTranslateY: number = 0;
  private componentSliders: Array<Slider> =
    [
      { isXAxis: true, axisName: $r('app.string.translate_x_axis') },
      { isXAxis: false, axisName: $r('app.string.translate_y_axis') }
    ];
  private imageSliders: Array<Slider> =
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
      TitleBar({ title: $r('app.string.graphic_transformation_translate') }).id('translate_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.translate_image') })
            .id('translate_sample_introduction_title_5')
          // Image translate
          // Column：垂直布局容器
          // 关键属性：高度、内边距、宽度、圆角、背景色、主轴对齐
          Column() {
            // Image：图片
            // 关键属性：宽度、高度、平移
            Image($r('app.media.ic_scenery1')).id('translate_sample_image_7')
              .width(160)
              .height(120)
              .translate({ x: this.imageTranslateX, y: this.imageTranslateY })
          }.id('translate_sample_column_6')
          .height(180)
          .padding(12)
          .width('100%')
          .borderRadius(24)
          .backgroundColor(Color.White)
          .justifyContent(FlexAlign.Center)

          ForEach(this.imageSliders, (item: Slider) => {
            // Row：水平布局容器
            // 关键属性：内边距、外边距、主轴对齐
            Row() {
              if (item.isXAxis) {
                // CommonItemSlider：CommonItemSlider 自定义组件
                CommonItemSlider({ changeValue: $imageTranslateX, min: -20, max: 20, name: item.axisName })
                  .id('translate_sample_common_item_slider_9')
              } else {
                // CommonItemSlider：CommonItemSlider 自定义组件
                CommonItemSlider({ changeValue: $imageTranslateY, min: -20, max: 20, name: item.axisName })
                  .id('translate_sample_common_item_slider_10')
              }
            }.id('translate_sample_row_8')
            .padding(4)
            .margin({ left: 10, right: 10 })
            .justifyContent(FlexAlign.Center)
          })
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.translate_container') })
            .id('translate_sample_introduction_title_11')
          // Container translate
          // Column：垂直布局容器
          // 关键属性：宽度、圆角、背景色、内边距
          Column() {
            // Column：垂直布局容器
            // 关键属性：外边距、背景色、平移、主轴对齐
            Column() {
              this.TextInfo()
              this.TextInfo()
              this.TextInfo()
            }.id('translate_sample_column_13')
            .margin({ top: 20, bottom: 20 })
            .backgroundColor($r('app.color.background_grey'))
            .translate({ x: this.containerTranslateX, y: this.containerTranslateY })
            .justifyContent(FlexAlign.Center)
          }.id('translate_sample_column_12')
          .width('100%')
          .borderRadius(24)
          .backgroundColor(Color.White)
          .padding({ top: 4, bottom: 4 })

          ForEach(this.componentSliders, (item: Slider) => {
            // Row：水平布局容器
            // 关键属性：内边距、外边距、主轴对齐
            Row() {
              if (item.isXAxis) {
                // -20和20为平移的区间
                // CommonItemSlider：CommonItemSlider 自定义组件
                CommonItemSlider({ changeValue: $containerTranslateX, min: -20, max: 20, name: item.axisName })
                  .id('translate_sample_common_item_slider_15')
              } else {
                // CommonItemSlider：CommonItemSlider 自定义组件
                CommonItemSlider({ changeValue: $containerTranslateY, min: -20, max: 20, name: item.axisName })
                  .id('translate_sample_common_item_slider_16')
              }
            }.id('translate_sample_row_14')
            .padding(4)
            .margin({ left: 10, right: 10 })
            .justifyContent(FlexAlign.Center)
          })
        }.id('translate_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('translate_sample_scroll_3')
    }.id('translate_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder TextInfo() {
    // Text：文本
    // 关键属性：外边距、字号
    Text('ArkUI').id('translate_sample_text_17')
      .margin(8)
      .fontSize(18)
  }
}