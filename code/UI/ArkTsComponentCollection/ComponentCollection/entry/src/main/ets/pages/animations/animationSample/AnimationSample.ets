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
 * @file entry/src/main/ets/pages/animations/animationSample/AnimationSample.ets
 * 文件职责：AnimationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AnimationSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../common/TitleBar';
import ShowToast from '../../../util/ShowToast';

/**
 * AnimationSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct AnimationSample {
  // @State widthSize：组件内部状态
  @State widthSize: number = 160;

  // @State heightSize：组件内部状态
  @State heightSize: number = 80;

  // @State rotateAngle：组件内部状态
  @State rotateAngle: number = 0;

  // @State rotateAngleCurve：组件内部状态
  @State rotateAngleCurve: number = 0;

  // @State rotateAngleDelay：组件内部状态
  @State rotateAngleDelay: number = 0;

  // @State rotateAngleCount：组件内部状态
  @State rotateAngleCount: number = 0;

  // @State rotateAngleSpeed：组件内部状态
  @State rotateAngleSpeed: number = 0;

  // @State rotateAnglePlayback：组件内部状态
  @State rotateAnglePlayback: number = 0;

  // @State rotateAngleComplete：组件内部状态
  @State rotateAngleComplete: number = 0;

  // @State flag：组件内部状态
  @State flag: boolean = true;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.attribute_animation') }).id('animation_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：圆角、背景色、高度、宽度、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束、外边距
        Column() {
          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_change_size')).id('animation_sample_button_5')
            // onClick：绑定点击事件回调
            .onClick(() => {
              // 分支：if (this.flag) {
              if (this.flag) {
                // 处理：this.heightSize = 60;
                this.heightSize = 60;
              // 结束当前组件块
              } else {
                // 处理：this.heightSize = 80;
                this.heightSize = 80;
              // 结束当前组件块
              }
              // 处理：this.flag = !this.flag;
              this.flag = !this.flag;
            // 结束当前组件块
            })
            // margin：设置外边距
            .margin(35)
            // width：设置宽度
            .width(this.widthSize)
            // height：设置高度
            .height(this.heightSize)
            // animation：设置属性动画参数
            .animation({
              duration: 2000,
              curve: Curve.EaseOut,
              iterations: 1,
              playMode: PlayMode.Normal
            // 结束当前组件块
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_change_rotation')).id('animation_sample_button_6')
            // onClick：绑定点击事件回调
            .onClick(() => {
              // 处理：this.rotateAngle = 90;
              this.rotateAngle = 90;
            // 结束当前组件块
            })
            // width：设置宽度
            .width(160)
            // margin：设置外边距
            .margin(35)
            // rotate：设置旋转
            .rotate({ angle: this.rotateAngle })
            // animation：设置属性动画参数
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 500,
              iterations: 2,
              playMode: PlayMode.Alternate,
              onFinish: () => {
                // 处理：this.rotateAngle = 0;
                this.rotateAngle = 0;
              // 结束当前组件块
              }
            // 结束当前组件块
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_set_curve')).id('animation_sample_button_7')
            // onClick：绑定点击事件回调
            .onClick(() => {
              // 处理：this.rotateAngleCurve = 90;
              this.rotateAngleCurve = 90;
            // 结束当前组件块
            })
            .width(160)
            .rotate({ angle: this.rotateAngleCurve })
            .margin(35)
            .animation({
              duration: 1200,
              curve: Curve.Sharp,
              delay: 500,
              iterations: 2,
              playMode: PlayMode.Alternate,
              onFinish: () => {
                this.rotateAngleCurve = 0;
              }
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_delay'))
            .onClick(() => {
              this.rotateAngleDelay = 90;
            })
            .width(160)
            .rotate({ angle: this.rotateAngleDelay })
            .margin(35)
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 3000,
              iterations: 2,
              playMode: PlayMode.Alternate,
              onFinish: () => {
                this.rotateAngleDelay = 0;
              }
            })
            .id('animation_btn_delay')

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_play_count')).id('animation_sample_button_8')
            .onClick(() => {
              this.rotateAngleCount = 90;
            })
            .width(160)
            .rotate({ angle: this.rotateAngleCount })
            .margin(35)
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 500,
              iterations: 4,
              playMode: PlayMode.Alternate,
              onFinish: () => {
                this.rotateAngleCount = 0;
              }
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_play_speed')).id('animation_sample_button_9')
            .onClick(() => {
              this.rotateAngleSpeed = 90;
            })
            .width(160)
            .rotate({ angle: this.rotateAngleSpeed })
            .margin(35)
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 500,
              iterations: 2,
              playMode: PlayMode.Alternate,
              tempo: 10,
              onFinish: () => {
                this.rotateAngleSpeed = 0;
              }
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_unlimited_playback')).id('animation_sample_button_10')
            .onClick(() => {
              this.rotateAnglePlayback = 90;
            })
            .width(160)
            .rotate({ angle: this.rotateAnglePlayback })
            .margin(35)
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 500,
              iterations: -1, // -1为无限播放
              playMode: PlayMode.Alternate,
              tempo: 10
            })

          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.attribute_animation_play_complete')).id('animation_sample_button_11')
            .onClick(() => {
              this.rotateAngleComplete = 90;
            })
            .width(160)
            .rotate({ angle: this.rotateAngleComplete })
            .margin(50)
            .animation({
              duration: 1200,
              curve: Curve.Friction,
              delay: 500,
              iterations: 2,
              playMode: PlayMode.Alternate,
              tempo: 10,
              onFinish: () => {
                this.rotateAngleComplete = 0;
                ShowToast.shortToast($r('app.string.animate_over'));
              }
            })
        }.id('animation_sample_column_4')
        .constraintSize({ minHeight: '100%' })
        .margin({ bottom: 20 })
      }.id('animation_sample_scroll_3')
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height('90%')
      .width('100%')
      .margin({ left: 12, right: 12 })
    }.id('animation_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
