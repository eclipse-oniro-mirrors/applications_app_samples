/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/systemIcon/SystemIcon.ets
 * 文件职责：SystemIcon 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SystemIcon。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

@AnimatableExtend(Text) function animatableWidthAndHeight(size: number) {
  .width(size)
  .height(size)
}

@AnimatableExtend(Text) function animatableWidth(size: number) {
  .width(size)
}

/**
 * SystemIcon：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SystemIcon {
  // @State sliderValue：组件内部状态
  @State sliderValue: number = 100;

  // @State centralDiameter：组件内部状态
  @State centralDiameter: number = 12; // 中心圆直径
  // @State lineWidth：组件内部状态
  @State lineWidth: number = 6; // 线条宽度

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、交叉轴对齐、主轴对齐、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.System_icon') }).id('system_icon_title_bar_2')
      // Stack：层叠布局容器
      // 关键属性：宽度、高度
      Stack() {
        // 亮度条件组件
        // Stack：层叠布局容器
        // 关键属性：偏移、内容对齐
        Stack() {
          // Slider：滑块
          // 关键属性：宽度、高度、trackThickness、showTips、trackColor、blockColor
          // 交互：输入/提交回调
          Slider({
            value: this.sliderValue,
            style: SliderStyle.NONE,
            direction: Axis.Vertical,
            reverse: true
          })
            .id('systemIcons_slider')
            .width('100%')
            .height(260)
            .trackThickness(54)
            .showTips(false)
            .trackColor($r('app.color.COLOR_80000000'))
            .blockColor($r('app.color.COLOR_FFFFFF'))
            .selectedColor($r('app.color.COLOR_FFFFFF'))
            .trackBorderRadius(20)
            .onChange((value: number, mode: SliderChangeMode) => {
              this.sliderValue = value;
              if (this.sliderValue <= 50) {
                this.centralDiameter = 8;
                this.lineWidth = 1;
              } else {
                this.centralDiameter = 12;
                this.lineWidth = 6;
              }
            })

          // 亮度图标
          // Stack：层叠布局容器
          // 关键属性：宽度、高度、外边距、内容对齐
          Stack() {
            // 中心圆
            // Text：文本
            // 关键属性：animatableWidthAndHeight、动画配置、圆角、背景色、外边距
            Text().id('system_icon_text_6')
              .animatableWidthAndHeight(this.centralDiameter)
              .animation({ duration: 500, curve: "ease" })
              .borderRadius(8)
              .backgroundColor($r('app.color.COLOR_8C9BA2'))
              .margin({ bottom: 14 })

            this.lineComponent(0)
            this.lineComponent(45)
            this.lineComponent(90)
            this.lineComponent(-45)
          }.id('system_icon_stack_5')
          .width(48)
          .height(48)
          .margin({ bottom: 8 })
          .alignContent(Alignment.Center)
        }.id('system_icon_stack_4')
        .offset({ x: 34, y: 0 })
        .alignContent(Alignment.Bottom)

      }.id('system_icon_stack_3')
      .width(340)
      .height(640)
    }.id('system_icon_column_1')
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  // 线条组件
  /**
   * lineComponent：执行 lineComponent 相关逻辑。
   */
  @Builder
  lineComponent(angle: number) {
    // Row：水平布局容器
    // 关键属性：宽度、高度、旋转、主轴对齐、外边距
    Row({ space: 20 }) {
      // Text：文本
      // 关键属性：animatableWidth、动画配置、高度、背景色
      Text().id('system_icon_text_8')
        .animatableWidth(this.lineWidth)
        .animation({ duration: 500, curve: "ease" })
        .height(1)
        .backgroundColor($r('app.color.COLOR_8C9BA2'))
      // Text：文本
      // 关键属性：animatableWidth、动画配置、高度、背景色
      Text().id('system_icon_text_9')
        .animatableWidth(this.lineWidth)
        .animation({ duration: 500, curve: "ease" })
        .height(1)
        .backgroundColor($r('app.color.COLOR_8C9BA2'))
    }.id('system_icon_row_7')
    .width(36)
    .height(2)
    .rotate({ angle: angle })
    .justifyContent(FlexAlign.Center)
    .margin({ bottom: 14 })
  }
}