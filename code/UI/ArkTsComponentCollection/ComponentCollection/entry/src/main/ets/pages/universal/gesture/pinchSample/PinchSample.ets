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
 * @file entry/src/main/ets/pages/universal/gesture/pinchSample/PinchSample.ets
 * 文件职责：PinchSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PanExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import ShowToast from '../../../../util/ShowToast';

const BIG_SCALE = 1.34;

const SMALL_SCALE = 0.75;

/**
 * PanExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PanExample {
  // @State scaleValue：组件内部状态
  @State scaleValue: number = 1;

  // @State pinchValue：组件内部状态
  @State pinchValue: number = 1;

  // @State pinchX：组件内部状态
  @State pinchX: number = 0;

  // @State pinchY：组件内部状态
  @State pinchY: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.pinch_gesture') }).id('pinch_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.pinch_description') }).id('pinch_sample_introduction_title_3')
      // Row：水平布局容器
      // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
      Row() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度、内边距、边框、缩放
        Column() {
          // Text：文本
          Text(getStringData($r('app.string.pinch_scale')) + this.scaleValue).id('pinch_sample_text_6');
          // Text：文本
          Text(getStringData($r('app.string.pinch_center')) + this.pinchX
          + getStringData($r('app.string.pan_offset_y')) + this.pinchY).id('pinch_sample_text_7');
        }.id('pinch_sample_column_5')
        .height(200)
        .width(300)
        .padding(20)
        .border({ width: 3 })
        .scale({ x: this.scaleValue, y: this.scaleValue, z: 1 })
        // 三指捏合触发该手势事件
        .gesture(
          // PinchGesture：PinchGesture 自定义组件
          // 关键属性：onActionStart、shortToast
          PinchGesture({ fingers: 3, distance: 5 })
            .onActionStart((event: GestureEvent) => {
              ShowToast.shortToast($r('app.string.pan_start'));
            })
            .onActionUpdate((event: GestureEvent) => {
              this.scaleValue = this.pinchValue * event.scale;
              if (this.scaleValue >= BIG_SCALE) {
                this.scaleValue = BIG_SCALE;
              }
              if (this.scaleValue <= SMALL_SCALE) {
                this.scaleValue = SMALL_SCALE;
              }
              this.pinchX = event.pinchCenterX;
              this.pinchY = event.pinchCenterY;
            })
            .onActionEnd(() => {
              this.pinchValue = this.scaleValue;
              ShowToast.shortToast($r('app.string.pan_end'));
            })
            .onActionCancel(() => {
              ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'));
            })
        )
      }.id('pinch_sample_row_4')
      .justifyContent(FlexAlign.Center)
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height('60%')
      .margin({ left: 12, right: 12 })
      .width('100%')
    }.id('pinch_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}