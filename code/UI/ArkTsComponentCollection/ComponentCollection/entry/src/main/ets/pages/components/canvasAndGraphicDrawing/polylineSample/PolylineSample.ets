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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/polylineSample/PolylineSample.ets
 * 文件职责：PolylineSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PolylineSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { PolylineControlPanel } from './ChangePanel';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * PolylineSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PolylineSample {
  // @State polylineFirstX：组件内部状态
  @State polylineFirstX: number = 0;

  // @State polylineFirstY：组件内部状态
  @State polylineFirstY: number = 0;

  // @State polylineSecondX：组件内部状态
  @State polylineSecondX: number = 20;

  // @State polylineSecondY：组件内部状态
  @State polylineSecondY: number = 60;

  // @State polylineThirdX：组件内部状态
  @State polylineThirdX: number = 100;

  // @State polylineThirdY：组件内部状态
  @State polylineThirdY: number = 100;

  // @State strokeWidth：组件内部状态
  @State strokeWidth: number = 3;

  // @State stroke：组件内部状态
  @State stroke: Color = Color.Blue;

  // @State strokeDashArray：组件内部状态
  @State strokeDashArray: number = 1;

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
      TitleBar({ title: $r('app.string.polyline_title') }).id('polyline_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距、布局权重
      Column() {
        // Column：垂直布局容器
        // 关键属性：cardStyle、高度、外边距
        Column() {
          // 在 100 * 100 的矩形框中绘制一段折线，起点(0, 0)，经过(20,60)，到达终点(100, 100)
          // Polyline：折线
          // 关键属性：points、fillOpacity、stroke、strokeWidth、strokeDashArray、strokeOpacity
          Polyline({ width: 100, height: 100 }).id('polyline_sample_polyline_5')
            .points([[this.polylineFirstX, this.polylineFirstY], [this.polylineSecondX, this.polylineSecondY], [this.polylineThirdX, this.polylineThirdY]])
            .fillOpacity(0)
            .stroke(this.stroke)
            .strokeWidth(this.strokeWidth)
            .strokeDashArray([this.strokeDashArray])
            .strokeOpacity(this.strokeOpacity/100)
              // 设置折线拐角处为圆弧
            .strokeLineJoin(LineJoinStyle.Round)
              // 设置折线两端为半圆
            .strokeLineCap(LineCapStyle.Round)
        }.id('polyline_sample_column_4').cardStyle()
        .height('35%')
        .margin({ bottom: 10 })

        // Column：垂直布局容器
        // 关键属性：cardStyle、布局权重、外边距、内边距
        Column() {
          // Scroll：滚动容器
          // 关键属性：cardStyle
          Scroll(){
            // PolylineControlPanel：PolylineControlPanel 自定义组件
            PolylineControlPanel({
              polylineFirstX: $polylineFirstX,
              polylineFirstY: $polylineFirstY,
              polylineSecondX: $polylineSecondX,
              polylineSecondY: $polylineSecondY,
              polylineThirdX: $polylineThirdX,
              polylineThirdY: $polylineThirdY,
              stroke: $stroke,
              strokeWidth: $strokeWidth,
              strokeDashArray: $strokeDashArray,
              strokeOpacity: $strokeOpacity
            }).id('polyline_sample_polyline_control_panel_7')
          }.id('polyline_scroll_1')
        }.id('polyline_sample_column_6').cardStyle()
        .layoutWeight(1)
        .margin({bottom:4})
      }.id('polyline_sample_column_3').padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .layoutWeight(1)
    }.id('polyline_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}