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
 * @file entry/src/main/ets/pages/universal/gesture/panSample/PanSample.ets
 * 文件职责：PanSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PanExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import ShowToast from '../../../../util/ShowToast';

// const 语句
const LEFT_UP_X = -110; // 限定距离

// const 语句
const RIGHT_UP_X = 110;

// const 语句
const LEFT_UP_Y = -118;

// const 语句
const RIGHT_UP_Y = 118;

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('90%')
  .margin({ top: 20 })
  .padding({ left: 24, right: 24, top: 8, bottom: 8 })
}

/**
 * PanExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PanExample {
  // @State offsetX：组件内部状态
  @State offsetX: number = 0;

  // @State offsetY：组件内部状态
  @State offsetY: number = 0;

  // @State positionX：组件内部状态
  @State positionX: number = 0;

  // @State positionY：组件内部状态
  @State positionY: number = 0;

  // @State flag：组件内部状态
  @State flag: boolean = false;
  // 字段 panOption：声明并维护该成员的状态
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right });

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.pan_gesture') }).id('pan_sample_title_bar_2')
      if (!this.flag) {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.pan_text_one') }).id('pan_sample_introduction_title_3')
      } else {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.pan_text') }).id('pan_sample_introduction_title_4')
      }
      // Column：垂直布局容器
      // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
      Column() {
        // Text：文本
        // 关键属性：字号、高度、宽度、内边距、外边距、边框
        Text(getStringData($r('app.string.pan_offset'))
        + this.offsetX + getStringData($r('app.string.pan_offset_y')) + this.offsetY)
          .id('pan_column')
          .fontSize(16)
          .height(200)
          .width(200)
          .padding(20)
          .margin(50)
          .border({ width: 3 })
          .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
            // 左右拖动触发该手势事件
          .gesture(
            // PanGesture：PanGesture 自定义组件
            // 关键属性：onActionStart、shortToast
            PanGesture(this.panOption)
              .onActionStart((event: GestureEvent) => {
                ShowToast.shortToast($r('app.string.pan_start'));
              })
              .onActionUpdate((event: GestureEvent) => {
                // 更新 offsetX
                this.offsetX = this.positionX + event.offsetX;
                // 更新 offsetY
                this.offsetY = this.positionY + event.offsetY;
                if (this.offsetX >= RIGHT_UP_X) {
                  this.offsetX = RIGHT_UP_X;
                }
                if (this.offsetX <= LEFT_UP_X) {
                  this.offsetX = LEFT_UP_X;
                }

                if (this.offsetY >= RIGHT_UP_Y) {
                  this.offsetY = RIGHT_UP_Y;
                }
                if (this.offsetY <= LEFT_UP_Y) {
                  this.offsetY = LEFT_UP_Y;
                }
              })
              .onActionEnd(() => {
                this.positionX = this.offsetX;
                this.positionY = this.offsetY;
                ShowToast.shortToast($r('app.string.pan_end'));
              })
              .onActionCancel(() => {
                ShowToast.shortToast($r('app.string.time_picker_dialog_cancel'));
              })
          )
      }.id('pan_sample_column_5')
      .justifyContent(FlexAlign.Center)
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height('60%')
      .margin({ left: 12, right: 12 })
      .width('100%')

      // Button：按钮
      // 关键属性：commonButtonStyle、点击事件回调
      // 交互：可点击交互
      Button($r('app.string.pan_button'))
        .id('pan_change')
        .commonButtonStyle()
        .onClick(() => {
          this.flag = !this.flag;
          // 将PanGesture手势事件触发条件改为双指以任意方向拖动
          this.panOption.setDirection(PanDirection.All);
          this.panOption.setFingers(2);
          if (this.flag === false) {
            this.panOption.setDirection(PanDirection.Horizontal);
            this.panOption.setFingers(1);
          }
        })
    }.id('pan_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}