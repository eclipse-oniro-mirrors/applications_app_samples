/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/pageTransitionSample/PageTransitionSampleTo.ets
 * 文件职责：PageTransitionSampleTo 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PageTransitionSampleTo。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';

const ANIMATION_TIME: number = 1000;

/**
 * PageTransitionSampleTo：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PageTransitionSampleTo {
  // @State zoom：组件内部状态
  @State zoom: number = 0;

  // @State angle：组件内部状态
  @State angle: number = 1;

  // @State progress：组件内部状态
  @State progress: number = 0;

  // @State animationType：组件内部状态
  @State animationType: number = 0;

  // @State transitionType：组件内部状态
  @State transitionType: SlideEffect = SlideEffect.Left;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、透明度、背景色、主轴对齐、交叉轴对齐
    Column() {
      // Text：文本
      // 关键属性：字号、透明度
      Text('PAGE TRANSITIONS').id('page_transition_sample_to_text_2')
        .fontSize(50)
        .opacity(0.4)
      // Text：文本
      // 关键属性：高度、字号、圆角、文本对齐、字重、内边距
      // 交互：可点击交互
      Text($r('app.string.page_transition_back')).id('page_transition_sample_to_text_3')
        .height(70)
        .fontSize(30)
        .borderRadius(24)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .padding({ left: 12, right: 12 })
        .fontColor($r('app.color.font_color_shallow'))
        .backgroundColor($r('app.color.pop_up_background'))
        .onClick(() => {
          router.back();
        })
        .margin({ top: 100 })
    }.id('page_transition_sample_to_column_1')
    .width('100%')
    .height('100%')
    .opacity(this.progress)
    .backgroundColor($r('app.color.background_shallow_grey'))
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .rotate(this.animationType === 3 ? { z: 1, angle: this.progress * this.angle } : { z: 1, angle: 0 })
    .scale(this.animationType === 2 ? {
      x: this.progress * this.zoom / 2,
      y: this.progress * this.zoom / 2,
      centerY: '50%',
      centerX: '50%'
    } : { x: 1, y: 1 })
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    let params = router.getParams() as Record<string, string | number | SlideEffect>;
    this.transitionType = params.type as SlideEffect;
    this.angle = params.angle as number;
    this.zoom = params.zoom as number;
    this.animationType = params.animationType as number;
  }

  /**
   * pageTransition：执行 pageTransition 相关逻辑。
   */
  pageTransition() {
    // Entry animation
    // PageTransitionEnter：PageTransitionEnter 自定义组件
    // 关键属性：slide、onEnter
    PageTransitionEnter({ duration: ANIMATION_TIME, curve: Curve.Linear })
      .slide(this.transitionType)
      .onEnter((type: RouteType, progress: number) => {
        this.progress = progress;
      })

    // Exit animation
    // PageTransitionExit：PageTransitionExit 自定义组件
    // 关键属性：slide、onExit
    PageTransitionExit({ duration: ANIMATION_TIME, curve: Curve.Ease })
      .slide(this.transitionType)
      .onExit((type: RouteType, progress: number) => {
        this.progress = progress;
      })
  }
}
