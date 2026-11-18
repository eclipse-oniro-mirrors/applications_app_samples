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
 * @file entry/src/main/ets/pages/universal/gesture/rotationSample/RotationSample.ets
 * 文件职责：RotationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RotationExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import ShowToast from '../../../../util/ShowToast';

/**
 * RotationExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RotationExample {
  // @State angle：组件内部状态
  @State angle: number = 0;

  // @State rotateValue：组件内部状态
  @State rotateValue: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.rotation_gesture') }).id('rotation_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.rotation_description') })
        .id('rotation_sample_introduction_title_3')
      // Row：水平布局容器
      // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
      Row() {
        // Column：垂直布局容器
        // 关键属性：高度、宽度、内边距、边框、旋转
        Column() {
          // Text：文本
          Text(getStringData($r('app.string.rotation_text')) + this.angle).id('rotation_sample_text_6')
        }.id('rotation_sample_column_5')
        .height(150)
        .width(300)
        .padding(20)
        .border({ width: 3 })
        .rotate({ angle: this.angle })
        // 双指旋转触发该手势事件
        .gesture(
          // RotationGesture：RotationGesture 自定义组件
          // 关键属性：onActionStart、shortToast
          RotationGesture({ fingers: 2 })
            .onActionStart((event: GestureEvent) => {
              ShowToast.shortToast($r('app.string.pan_start'));
            })
            .onActionUpdate((event: GestureEvent) => {
              this.angle = this.rotateValue + event.angle;
            })
            .onActionEnd(() => {
              ShowToast.shortToast($r('app.string.pan_end'));
            })
            .onActionCancel(() => {
              ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'));
            })
        )
      }.id('rotation_sample_row_4')
      .justifyContent(FlexAlign.Center)
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height(350)
      .margin({ left: 12, right: 12 })
      .width('100%')
    }.id('rotation_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}