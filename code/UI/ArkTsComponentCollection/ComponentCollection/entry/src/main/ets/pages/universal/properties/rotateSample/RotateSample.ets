/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/properties/rotateSample/RotateSample.ets
 * 文件职责：RotateSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Angele、RotateSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * Angele：类定义，承载本文件对应的逻辑与数据。
 */
class Angele {
  angle: number = 0;
  rotateInfo!: Resource;
}

@Extend(Row) function rowStyle() {
  .padding(12)
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * RotateSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RotateSample {
  private rotateAngele: Array<Angele> =
    [
      { angle: 0, rotateInfo: $r('app.string.rotate_before_image') },
      { angle: 15, rotateInfo: $r('app.string.rotate_image_angle') }
    ];
  private componentAngele: Array<Angele> =
    [
      { angle: 0, rotateInfo: $r('app.string.rotate_before_component') },
      { angle: 15, rotateInfo: $r('app.string.rotate_image_angle') }
    ];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.graphic_transformation_rotate') }).id('rotate_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.rotate_photo') }).id('rotate_sample_introduction_title_5')
          // Image rotation
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            ForEach(this.rotateAngele, (item: Angele) => {
              // Column：垂直布局容器
              // 关键属性：外边距
              Column() {
                // Image：图片
                // 关键属性：宽度、高度、objectFit、外边距、旋转
                Image($r('app.media.ic_scenery1')).id('rotate_sample_image_8')
                  .width(150)
                  .height(100)
                  .objectFit(ImageFit.Fill)
                  .margin({ bottom: 24 })
                  .rotate({
                    x: 0,
                    y: 0,
                    z: 1,
                    centerX: '50%',
                    centerY: '50%',
                    angle: item.angle
                  })
                // Text：文本
                // 关键属性：字号
                Text(item.rotateInfo).id('rotate_sample_text_9')
                  .fontSize(18)
              }.id('rotate_sample_column_7')
              .margin({ left: 20, right: 20, top: 12, bottom: 12 })
            })
          }.id('rotate_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.rotate_container') })
            .id('rotate_sample_introduction_title_10')
          // Container rotation
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            ForEach(this.componentAngele, (item: Angele) => {
              // Column：垂直布局容器
              // 关键属性：外边距
              Column() {
                // Column：垂直布局容器
                // 关键属性：外边距、背景色、旋转
                Column() {
                  this.TextInfo()
                  this.TextInfo()
                  this.TextInfo()
                }.id('rotate_sample_column_13')
                .margin({ bottom: 24 })
                .backgroundColor($r('app.color.background_grey'))
                .rotate({
                  x: 0,
                  y: 0,
                  z: 1,
                  centerX: '50%',
                  centerY: '50%',
                  angle: item.angle
                })

                // Text：文本
                // 关键属性：字号
                Text(item.rotateInfo).id('rotate_sample_text_14')
                  .fontSize(18)
              }.id('rotate_sample_column_12')
              .margin({ left: 20, right: 20, top: 12, bottom: 12 })
            })
          }.id('rotate_sample_row_11')
          .rowStyle()
        }.id('rotate_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('rotate_sample_scroll_3')
    }.id('rotate_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder TextInfo() {
    // Text：文本
    // 关键属性：外边距、字号
    Text('ArkUI').id('rotate_sample_text_15')
      .margin(8)
      .fontSize(18)
  }
}