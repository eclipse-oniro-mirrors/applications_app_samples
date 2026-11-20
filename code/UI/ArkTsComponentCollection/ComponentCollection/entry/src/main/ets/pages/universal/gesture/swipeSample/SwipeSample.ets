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
 * @file entry/src/main/ets/pages/universal/gesture/swipeSample/SwipeSample.ets
 * 文件职责：SwipeSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SwipeExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

/**
 * SwipeExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SwipeExample {
  // @State rotateAngle：组件内部状态
  @State rotateAngle: number = 0;

  // @State speed：组件内部状态
  @State speed: number = 1;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.swipe_gesture') }).id('swipe_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.swipe_description') }).id('swipe_sample_introduction_title_3')
      // Row：水平布局容器
      // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
      Row(){
        // Column：垂直布局容器
        // 关键属性：内边距、边框、宽度、高度、旋转
        Column() {
          // Text：文本
          Text(getStringData($r('app.string.swipe_text_speed')) + this.speed).id('swipe_sample_text_5')
          // Text：文本
          Text(getStringData($r('app.string.swipe_text_angle')) + this.rotateAngle).id('swipe_sample_text_6')
        }
        .padding(20)
        .id('swipe_column')
        .border({ width: 3 })
        .width(300)
        .height(150)
        .rotate({ angle: this.rotateAngle })
        // 单指竖直方向滑动时触发该事件
        .gesture(
          // SwipeGesture：SwipeGesture 自定义组件
          // 关键属性：onAction
          SwipeGesture({ direction: SwipeDirection.All, fingers: 1, speed: 100 })
            .onAction((event: GestureEvent) => {
              this.speed = event.speed;
              this.rotateAngle = event.angle;
            })
        )
      }.id('swipe_sample_row_4')
      .justifyContent(FlexAlign.Center)
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height(350)
      .margin({ left: 12, right: 12 })
      .width('100%')
    }.id('swipe_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}