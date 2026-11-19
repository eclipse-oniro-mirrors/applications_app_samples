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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/pageTransitionSample/PageTransitionSample.ets
 * 文件职责：PageTransitionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：textStyle、PageTransitionSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { TitleBar } from '../../../../common/TitleBar';

const ANIMATION_TIME: number = 1000;

const ANIMATION_URL: string = 'pages/animations/TransitionAnimations/pageTransitionSample/PageTransitionSampleTo';

/**
 * textStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function textStyle() {
  .height(60)
  .fontSize(20)
  .width('100%')
  .borderRadius(24)
  .margin({ top: 12 })
  .fontWeight(FontWeight.Bold)
  .textAlign(TextAlign.Center)
  .fontColor($r('app.color.font_color_shallow'))
  .backgroundColor($r('app.color.pop_up_background'))
}

/**
 * PageTransitionSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PageTransitionSample {
  // @State zoom：组件内部状态
  @State zoom: number = 2;

  // @State angle：组件内部状态
  @State angle: number = 360;

  // @State progress：组件内部状态
  @State progress: number = 0;

  // @State transitionType：组件内部状态
  @State transitionType: SlideEffect = SlideEffect.Left;

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

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.page_transition') }).id('page_transition_sample_title_bar_4')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // Text：文本
          // 关键属性：textStyle、外边距、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_top')).id('page_transition_sample_text_7')
            .textStyle()
            .margin({ top: 50 })
            .onClick(() => {
              this.transitionType = SlideEffect.Bottom;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Top, animationType: 1 }
              });
            })
          // Text：文本
          // 关键属性：textStyle、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_bottom')).id('page_transition_sample_text_8')
            .textStyle()
            .onClick(() => {
              this.transitionType = SlideEffect.Top;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Bottom, animationType: 1 }
              });
            })
          // Text：文本
          // 关键属性：textStyle、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_left')).id('page_transition_sample_text_9')
            .textStyle()
            .onClick(() => {
              this.transitionType = SlideEffect.Right;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Left, animationType: 1 }
              });
            })
          // Text：文本
          // 关键属性：textStyle、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_right')).id('page_transition_sample_text_10')
            .textStyle()
            .onClick(() => {
              this.transitionType = SlideEffect.Left;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Right, animationType: 1 }
              });
            })
          // Text：文本
          // 关键属性：textStyle、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_scale')).id('page_transition_sample_text_11')
            .textStyle()
            .onClick(() => {
              this.transitionType = SlideEffect.Top;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Bottom, zoom: this.zoom, animationType: 2 }
              });
            })
          // Text：文本
          // 关键属性：textStyle、点击事件回调
          // 交互：可点击交互
          Text($r('app.string.page_transition_rotate')).id('page_transition_sample_text_12')
            .textStyle()
            .onClick(() => {
              this.transitionType = SlideEffect.Top;
              router.push({
                url: ANIMATION_URL,
                params: { type: SlideEffect.Bottom, angle: this.angle, animationType: 3 }
              });
            })
        }.id('page_transition_sample_column_6')
        .constraintSize({ minHeight: '100%' })
      }.id('page_transition_sample_scroll_5')
    }.id('page_transition_sample_column_3')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}