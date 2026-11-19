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
 * @file entry/src/main/ets/pages/animations/motionPathSample/MotionPathSample.ets
 * 文件职责：MotionPathSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MotionPathSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../common/TitleBar';

/**
 * MotionPathSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MotionPathSample {
  // @State toggle：组件内部状态
  @State toggle: boolean = true;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.motion_path') }).id('motion_path_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：主轴对齐、圆角、背景色、高度、宽度、外边距
        Column() {
          // Button：按钮
          // 关键属性：外边距、motionPath
          Button($r('app.string.motion_path_click_me'))
            .margin(50)
            .motionPath({
              path: 'Mstart.x start.y L300 200 L300 500 Lend.x end.y',
              from: 0.0,
              to: 1.0,
              rotatable: true
            })
            .onClick(() => {
              animateTo({ duration: 4000, curve: Curve.Linear }, () => {
                this.toggle = !this.toggle; // 通过this.toggle变化组件的位置
              })
            })
            .id('motion_click')
        }.id('motion_path_sample_column_4')
        .justifyContent(FlexAlign.Center)
        .borderRadius(24)
        .backgroundColor(Color.White)
        .height(400)
        .width('100%')
        .margin({ left: 12, right: 12 })
        .alignItems(this.toggle ? HorizontalAlign.Start : HorizontalAlign.Center)
      }.id('motion_path_sample_scroll_3')
    }.id('motion_path_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}