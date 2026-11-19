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
 * @file entry/src/main/ets/pages/universal/properties/transformSample/TransformSample.ets
 * 文件职责：TransformSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TransformSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import matrix4 from '@ohos.matrix4';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

// 创建一个四阶矩阵
let matrix:matrix4.Matrix4Transit = matrix4.init([1.0, 0.0, 0.0, 0.0,
  0.0, 1.0, 0.0, 0.0,
  0.0, 0.0, 1.0, 0.0,
  0.0, 0.0, 0.0, 1.0]);

/**
 * TransformSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TransformSample {
  private matrix1: matrix4.Matrix4Transit = matrix4.identity().translate({ x: 100 });
  private matrix2: matrix4.Matrix4Transit = this.matrix1.copy();
  private matrix3: matrix4.Matrix4Transit = matrix4.identity().translate({ x: 20 }).copy();
  private matrix4: matrix4.Matrix4Transit = matrix4.identity().scale({ x: 2 }).copy();
  private matrix5: matrix4.Matrix4Transit = matrix4.identity().scale({ x: 2 });
  private matrix6: matrix4.Matrix4Transit = this.matrix5.invert();
  private matrix7: matrix4.Matrix4Transit = matrix4.identity().translate({ x: 40, y: 40, z: 20 });
  private matrix8: matrix4.Matrix4Transit = matrix4.identity()
    .scale({
      x: 0.5,
      y: 0.5
    });
  private matrix9: matrix4.Matrix4Transit = matrix4.identity().rotate({ x: 1, y: 1, z: 2, angle: 30 });
  private originPoint: [number, number] = [50, 50];
  private matrix_1: matrix4.Matrix4Transit = matrix4.identity().translate({ x: 50, y: -50 });
  private transformPoint: [number, number] = this.matrix_1.transformPoint(this.originPoint);
  private matrix_2: matrix4.Matrix4Transit = matrix4.identity().translate({ x: this.transformPoint[0], y: this.transformPoint[1] });

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.transform') }).id('transform_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：宽度、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_init') })
            .id('transform_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Image：图片
            // 关键属性：宽度、高度、图形变换
            Image($r('app.media.ic_scenery1')).id('transform_sample_image_7')
              .width('40%')
              .height(100)
              .transform(matrix)
          }.id('transform_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_copy') })
            .id('transform_sample_introduction_title_8')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            Column() {
              // Image：图片
              // 关键属性：宽度、高度、图形变换
              Image($r('app.media.ic_scenery1')).id('transform_sample_image_11')
                .width('40%')
                .height(100)
                .transform(this.matrix1)

              // Image：图片
              // 关键属性：宽度、高度、外边距、图形变换
              Image($r('app.media.ic_scenery1')).id('transform_sample_image_12')
                .width('40%')
                .height(100)
                .margin({ top: 20 })
                .transform(this.matrix2)
            }.id('transform_sample_column_10')
          }.id('transform_sample_row_9')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_combine') })
            .id('transform_sample_introduction_title_13')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            Column() {
              // Row：水平布局容器
              Row() {
                // 矩阵变换前
                // Image：图片
                // 关键属性：宽度、高度
                Image($r('app.media.ic_scenery1')).id('transform_sample_image_17')
                  .width('40%')
                  .height(100)

                // Text：文本
                // 关键属性：字号、外边距
                Text($r('app.string.transform_combine_text')).id('transform_sample_text_18')
                  .fontSize(16)
                  .margin({ left: 20 })
              }.id('transform_sample_row_16')

              // 先平移x轴200px，再缩放两倍x轴，得到矩阵变换后的效果图
              // Image：图片
              // 关键属性：图形变换、combine、宽度、高度、外边距
              Image($r('app.media.ic_scenery1')).id('transform_sample_image_19')
                .transform(this.matrix3.combine(this.matrix4))
                .width('40%')
                .height(100)
                .margin({ top: 20 })
            }.id('transform_sample_column_15')
          }.id('transform_sample_row_14')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_invert') })
            .id('transform_sample_introduction_title_20')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            Column() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.transform_translate_invert')).id('transform_sample_text_23')
                .fontSize(16)
              // Image：图片
              // 关键属性：宽度、高度、外边距、图形变换
              Image($r("app.media.ic_scenery1")).id('transform_sample_image_24')
                .width('40%')
                .height(100)
                .margin({ top: 20 })
                .transform(this.matrix6)
            }.id('transform_sample_column_22')
          }.id('transform_sample_row_21')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_translate') })
            .id('transform_sample_introduction_title_25')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Image：图片
            // 关键属性：图形变换、宽度、高度、外边距
            Image($r('app.media.ic_scenery1')).id('transform_sample_image_27').transform(this.matrix7)
              .width("40%")
              .height(100)
              .margin(50)
            // Text：文本
            // 关键属性：字号、外边距
            Text($r('app.string.transform_translate_text')).id('transform_sample_text_28')
              .fontSize(16)
              .margin({ left: 20 })
          }.id('transform_sample_row_26')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_scale') })
            .id('transform_sample_introduction_title_29')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Image：图片
            // 关键属性：图形变换、宽度、高度
            Image($r('app.media.ic_scenery1')).id('transform_sample_image_31').transform(this.matrix8)
              .width('40%')
              .height(100)
            // Text：文本
            // 关键属性：字号
            Text($r('app.string.transform_scale_text')).id('transform_sample_text_32')
              .fontSize(16)
          }.id('transform_sample_row_30')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_rotate') })
            .id('transform_sample_introduction_title_33')
          // Row：水平布局容器
          // 关键属性：高度、rowStyle
          Row() {
            // Image：图片
            // 关键属性：图形变换、宽度、高度、外边距
            Image($r('app.media.ic_scenery1')).id('transform_sample_image_35')
              .transform(this.matrix9)
              .width('40%')
              .height(100)
              .margin({ top: 20 })
            // Text：文本
            // 关键属性：字号、外边距
            Text($r('app.string.transform_rotate_text')).id('transform_sample_text_36')
              .fontSize(16)
              .margin({ left: 40 })
          }.id('transform_sample_row_34')
          .height(200)
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.transform_transformPoint') })
            .id('transform_sample_introduction_title_37')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Column：垂直布局容器
            // 关键属性：宽度、内边距
            Column() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.transform_transformPoint_before')).id('transform_sample_text_40')
                .fontSize(16)
              // Image：图片
              // 关键属性：宽度、高度、外边距
              Image($r('app.media.ic_scenery1')).id('transform_sample_image_41')
                .width('40%')
                .height(100)
                .margin({ top: 20 })
              // Text：文本
              // 关键属性：字号、外边距
              Text($r('app.string.transform_transformPoint_after')).id('transform_sample_text_42')
                .fontSize(16)
                .margin({ top: 20 })
              // Image：图片
              // 关键属性：宽度、高度、外边距、图形变换、内边距
              Image($r('app.media.ic_scenery1')).id('transform_sample_image_43')
                .width('40%')
                .height(100)
                .margin({ top: 50 })
                .transform(this.matrix_2)
            }.id('transform_sample_column_39').width('100%').padding(20)
          }.id('transform_sample_row_38')
          .rowStyle()
        }.id('transform_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('transform_sample_scroll_3')
      .width('100%')
      .margin({ bottom: 70 })
    }.id('transform_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}