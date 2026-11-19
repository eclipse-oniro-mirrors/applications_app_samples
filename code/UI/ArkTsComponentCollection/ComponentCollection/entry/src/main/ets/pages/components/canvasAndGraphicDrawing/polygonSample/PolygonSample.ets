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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/polygonSample/PolygonSample.ets
 * 文件职责：PolygonSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PolygonSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { PolygonControlPanel } from './ChangePanel';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * PolygonSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PolygonSample {
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
      TitleBar({ title: $r('app.string.polygon_title') }).id('polygon_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距、布局权重
      Column() {
        // Column：垂直布局容器
        // 关键属性：cardStyle、高度、外边距
        Column() {
          // Scroll：滚动容器
          // 关键属性：高度、宽度
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：高度
            Column() {
              // Polygon：多边形
              // 关键属性：points、fill、fillOpacity、stroke、strokeWidth、strokeDashArray
              Polygon({ width: 100, height: 100 }).id('polygon_sample_polygon_7')
                .points([[0, 0], [50, 100], [100, 0]])
                .fill(this.fill)
                .fillOpacity(this.fillOpacity / 100)
                .stroke(this.stroke)
                .strokeWidth(this.strokeWidth)
                .strokeDashArray([this.strokeDashArray])
                .strokeOpacity(this.strokeOpacity / 100)
                .margin({ bottom: 20 })
              // Polygon：多边形
              // 关键属性：宽度、高度、points、fill、fillOpacity、stroke
              Polygon().id('polygon_sample_polygon_8')
                .width(100)
                .height(100)
                .points([[0, 0], [0, 100], [100, 100], [100, 0]])
                .fill(this.fill)
                .fillOpacity(this.fillOpacity / 100)
                .stroke(this.stroke)
                .strokeWidth(this.strokeWidth)
                .strokeDashArray([this.strokeDashArray])
                .strokeOpacity(this.strokeOpacity / 100)
                .margin({ bottom: 20 })
              // Polygon：多边形
              // 关键属性：宽度、高度、points、fill、fillOpacity、stroke
              Polygon().id('polygon_sample_polygon_9')
                .width(100)
                .height(100)
                .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
                .fill(this.fill)
                .fillOpacity(this.fillOpacity / 100)
                .stroke(this.stroke)
                .strokeWidth(this.strokeWidth)
                .strokeDashArray([this.strokeDashArray])
                .strokeOpacity(this.strokeOpacity / 100)
            }.id('polygon_sample_column_6')
          }.id('polygon_sample_scroll_5').height('100%')
          .width('100%')
        }.id('polygon_sample_column_4')
        .cardStyle()
        .height('35%')
        .margin({ bottom: 10 })

        // Column：垂直布局容器
        // 关键属性：cardStyle、布局权重、外边距、内边距
        Column() {
          // Scroll：滚动容器
          // 关键属性：cardStyle
          Scroll() {
            // PolygonControlPanel：PolygonControlPanel 自定义组件
            PolygonControlPanel({
              fill: $fill,
              fillOpacity: $fillOpacity,
              stroke: $stroke,
              strokeWidth: $strokeWidth,
              strokeDashArray: $strokeDashArray,
              strokeOpacity: $strokeOpacity
            }).id('polygon_sample_polygon_control_panel_12')
          }.id('polygon_sample_scroll_11')
        }.id('polygon_sample_column_10').cardStyle()
        .layoutWeight(1)
        .margin({ bottom: 4 })
      }.id('polygon_sample_column_3').padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .layoutWeight(1)
    }.id('polygon_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}