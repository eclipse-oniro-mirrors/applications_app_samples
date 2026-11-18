/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/components/textAndInput/imageSpanSample/ImageSpanSample.ets
 * 文件职责：ImageSpanSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageSpanSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangeVerticalAlign, ChangeObjectFit } from './ChangePanel'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Column) function backgroundStyle() {
  .size({ width: '100%' })
  .margin({ top: 12 })
  .padding(12)
  .borderRadius(24)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.White)
}

/**
 * ImageSpanSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ImageSpanSample {
  // @State imageSpanAlignment：组件内部状态
  @State imageSpanAlignment: ImageSpanAlignment = ImageSpanAlignment.BOTTOM
  // @State imageFit：组件内部状态
  @State imageFit: ImageFit = ImageFit.Cover

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.image_span_title') }).id('image_span_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.image_span_and_span') })
            .id('image_span_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Text：文本
            Text(){
              // Span：行内文本片段
              Span($r('app.string.text_content_en_first')).id('image_span_sample_span_8')
              // ImageSpan：行内图片
              // 关键属性：verticalAlign、objectFit、宽度、高度、边框
              ImageSpan($r('app.media.banner')).id('image_span_sample_image_span_9')
                .verticalAlign(this.imageSpanAlignment)
                .objectFit(this.imageFit)
                .width(300)
                .height(350)
                .border({ width: 1 })
              // Span：行内文本片段
              Span($r('app.string.text_content_en_last')).id('image_span_sample_span_10')
            }.id('image_span_sample_text_7')
          }.id('image_span_sample_column_6')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.image_span_vertical_align_and_object_fit') })
            .id('image_span_sample_introduction_title_11')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、外边距
          Column() {
            // ChangeVerticalAlign：ChangeVerticalAlign 自定义组件
            ChangeVerticalAlign({
              imageSpanAlignment: $imageSpanAlignment
            }).id('image_span_sample_change_vertical_align_13')
            // ChangeObjectFit：ChangeObjectFit 自定义组件
            ChangeObjectFit({
              imageFit: $imageFit
            }).id('image_span_sample_change_object_fit_14')
          }.id('image_span_sample_column_12')
          .backgroundStyle()
          .margin({ bottom: 80 })
        }.id('image_span_sample_column_4')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
      }.id('image_span_sample_scroll_3')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('image_span_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}