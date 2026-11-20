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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/shapeSample/ShapeSample.ets
 * 文件职责：ShapeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShapeSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ShapeControlPanel } from './ChangePanel';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * ShapeSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ShapeSample {
  // @State viewPortX：组件内部状态
  @State viewPortX: number = 0;

  // @State viewPortY：组件内部状态
  @State viewPortY: number = 0;

  // @State viewPortWidth：组件内部状态
  @State viewPortWidth: number = 450;

  // @State viewPortHeight：组件内部状态
  @State viewPortHeight: number = 450;

  // @State fillOpacity：组件内部状态
  @State fillOpacity: number = 50;

  // @State strokeWidth：组件内部状态
  @State strokeWidth: number = 3;

  // @State stroke：组件内部状态
  @State stroke: Color = Color.Blue;

  // @State strokeDashArray：组件内部状态
  @State strokeDashArray: number = 1;

  // @State fill：组件内部状态
  @State fill: Color = Color.Blue;

  // @State strokeOpacity：组件内部状态
  @State strokeOpacity: number = 50;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.shape_title') }).id('shape_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距、布局权重
      Column() {
        // Column：垂直布局容器
        // 关键属性：cardStyle、高度、外边距
        Column() {
          // Shape：图形容器
          // 关键属性：viewPort、宽度、高度、背景色、fill、fillOpacity
          Shape() {
            // Rect：矩形
            // 关键属性：宽度、高度
            Rect().id('shape_sample_rect_6').width('100%').height('100%')
            // Circle：圆形
            Circle({ width: 75, height: 75 }).id('shape_sample_circle_7')
          }.id('shape_sample_shape_5')
          .viewPort({ x: this.viewPortX, y: this.viewPortY, width: this.viewPortWidth, height: this.viewPortHeight })
          .width(300)
          .height(200)
          .backgroundColor('#F5DC62')
          .fill(this.fill)
          .fillOpacity(this.fillOpacity / 100)
          .stroke(this.stroke)
          .strokeWidth(this.strokeWidth)
          .strokeOpacity(this.strokeOpacity / 100)
          .strokeDashArray([this.strokeDashArray])
        }.id('shape_sample_column_4').cardStyle()
        .height('35%')
        .margin({ bottom: 10 })

        // Column：垂直布局容器
        // 关键属性：cardStyle、布局权重、外边距、内边距
        Column() {
          // Scroll：滚动容器
          // 关键属性：cardStyle
          Scroll() {
            // ShapeControlPanel：ShapeControlPanel 自定义组件
            ShapeControlPanel({
              fill: $fill,
              fillOpacity: $fillOpacity,
              stroke: $stroke,
              strokeWidth: $strokeWidth,
              strokeDashArray: $strokeDashArray,
              strokeOpacity: $strokeOpacity
            }).id('shape_sample_shape_control_panel_10')
          }.id('shape_sample_scroll_9')
        }.id('shape_sample_column_8').cardStyle()
        .layoutWeight(1)
        .margin({ bottom: 4 })
      }.id('shape_sample_column_3').padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .layoutWeight(1)
    }.id('shape_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}
