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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/imageSample/ImageSample.ets
 * 文件职责：ImageSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { SourceSizeControlPanel } from '../../../../pages/components/imageVideoAndMedia/imageSample/ImageControlPanel';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * ImageSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ImageSample {
  // @State srcType：组件内部状态
  @State srcType: Resource = $r('app.media.test_image');

  // @State imageFitType：组件内部状态
  @State imageFitType: string = 'None';

  // @State imageHeight：组件内部状态
  @State imageHeight: number = 110;

  // @State imageWidth：组件内部状态
  @State imageWidth: number = 110;

  // @State objectFit：组件内部状态
  @State objectFit: ImageFit = ImageFit.None;

  // @State RenderMode：组件内部状态
  @State RenderMode: ImageRenderMode = ImageRenderMode.Original;

  // @State RepeatMode：组件内部状态
  @State RepeatMode: ImageRepeat = ImageRepeat.NoRepeat;

  // @State fillColor：组件内部状态
  @State fillColor: Color = Color.Blue;

  // @State colorFilter：组件内部状态
  @State colorFilter: ColorFilter = new ColorFilter([0.5, 0, 0.5, 0, 0,
    0, 0.5, 0.5, 0, 0,
    0.5, 0, 0.5, 0, 0,
    0, 0, 0.5, 0, 0])

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：剩余空间放大、外边距、内边距、背景色
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大、高度
      TitleBar({ title: $r('app.string.image_title') }).id('image_sample_title_bar_2').flexGrow(0)
      // IntroductionTitle：IntroductionTitle 自定义组件
      // 关键属性：高度
      IntroductionTitle({ introduction: $r('app.string.image_show_test') })
        .id('image_sample_introduction_title_3')
        .height(60)
      // Column：垂直布局容器
      // 关键属性：cardStyle、剩余空间放大、外边距
      Column() {
        // Column：垂直布局容器
        // 关键属性：宽度、cardStyle
        Column() {
          // Row：水平布局容器
          // 关键属性：外边距
          Row() {
            // Image：图片
            // 关键属性：alt、尺寸、边框、objectFit、renderMode、外边距
            Image(this.srcType).id('image_sample_image_7')
              .alt($r('app.media.ic_image_alt'))
              .size({ width: 110, height: 110 })
              .border({ width: 1 })
              .objectFit(this.objectFit)
              .renderMode(this.RenderMode)
              .margin({ right: 10 })
            // Image：图片
            // 关键属性：尺寸、边框、objectFit、objectRepeat
            Image($r('app.media.ic_unselect_universal')).id('image_sample_image_8')
              .size({ width: 110, height: 110 })
              .border({ width: 1 })
              .objectFit(ImageFit.ScaleDown)
              .objectRepeat(this.RepeatMode)
          }.id('image_sample_row_6')
          .margin({ bottom: 5 })

          // Row：水平布局容器
          // 关键属性：宽度
          Row() {
            // Image：图片
            // 关键属性：尺寸、边框、sourceSize、matchTextDirection、外边距
            Image($r('app.media.icon')).id('image_sample_image_10')
              .size({ width: 110, height: 110 })
              .border({ width: 1 })
              .sourceSize({ height: this.imageHeight, width: this.imageWidth })
              .matchTextDirection(true)
              .margin({ right: 10 })
            // Image：图片
            // 关键属性：尺寸、边框、fillColor、colorFilter
            Image($r('app.media.img_love')).id('image_sample_image_11')
              .size({ width: 110, height: 110 })
              .border({ width: 1 })
              .fillColor(this.fillColor)
              .colorFilter(this.colorFilter)
          }.id('image_sample_row_9')
        }.id('image_sample_column_5').width('100%')
      }.id('image_sample_column_4').cardStyle()
      .flexGrow(1)
      .margin({ bottom: 20 })

      // Column：垂直布局容器
      // 关键属性：cardStyle、外边距、剩余空间放大
      Column() {
        // Scroll：滚动容器
        // 关键属性：cardStyle
        Scroll() {
          // SourceSizeControlPanel：SourceSizeControlPanel 自定义组件
          SourceSizeControlPanel({
            ObjectFit: $objectFit,
            sizeHeight: $imageHeight,
            sizeWidth: $imageWidth,
            RenderMode: $RenderMode,
            ObjectRepeat: $RepeatMode,
            fillColor: $fillColor
          }).id('image_sample_source_size_control_panel_14')
        }.id('image_sample_scroll_13')
      }.id('image_sample_column_12').cardStyle()
      .margin({ bottom: 5 })
    }.id('image_sample_flex_1').flexGrow(0).margin({ bottom: 30 })
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .backgroundColor($r('app.color.background_light_gray'))
  }
}