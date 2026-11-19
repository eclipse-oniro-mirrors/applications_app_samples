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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/imageAnimatorSample/ImageAnimatorSample.ets
 * 文件职责：ImageAnimatorSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageAnimatorSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

@Extend(Button) function normalButton() {
  .width(100)
  .margin(5)
  .type(ButtonType.Normal)
  .borderRadius(20)
}

/**
 * ImageAnimatorSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ImageAnimatorSample {
  // @State message：组件内部状态
  @State message: string = 'Hello World';

  // @State animatorState：组件内部状态
  @State animatorState: AnimationStatus = AnimationStatus.Initial;

  // @State animatorReserve：组件内部状态
  @State animatorReserve: boolean = false;

  // @State animatorInterations：组件内部状态
  @State animatorInterations: number = 1;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.image_animator_title') }).id('image_animator_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.image_animator_show') })
            .id('image_animator_sample_introduction_title_5')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // ImageAnimator：ImageAnimator 自定义组件
            // 关键属性：images
            ImageAnimator().id('image_animator_sample_image_animator_7')
              .images([
                {
                  src: $r('app.media.image_animator_1')
                },
                {
                  src: $r('app.media.image_animator_2')
                },
                {
                  src: $r('app.media.image_animator_3')
                },
                {
                  src: $r('app.media.image_animator_4')
                },
                {
                  src: $r('app.media.image_animator_5')
                },
                {
                  src: $r('app.media.image_animator_6')
                },
                {
                  src: $r('app.media.image_animator_7')
                },
                {
                  src: $r('app.media.image_animator_8')
                },
                {
                  src: $r('app.media.image_animator_9')
                },
                {
                  src: $r('app.media.image_animator_10')
                }
              ])
              .duration(2000)
              .fillMode(FillMode.None)
              .width(340)
              .height(240)
              .iterations(this.animatorInterations)
              .state(this.animatorState)
              .reverse(this.animatorReserve)
              .onStart(() => {
                ShowToast.shortToast('start')
                console.info('Start')
              })
              .onPause(() => {
                ShowToast.shortToast('Pause')
                console.info('Pause')
              })
              .onRepeat(() => {
                ShowToast.shortToast('Repeat')
                console.info('Repeat')
              })
              .onCancel(() => {
                ShowToast.shortToast('Cancel')
                console.info('Cancel')
              })
              .onFinish(() => {
                ShowToast.shortToast('Finish')
                console.info('Finish')
                this.animatorState = AnimationStatus.Stopped
              })
          }.id('image_animator_sample_column_6')
          .cardStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.image_animator_control') })
            .id('image_animator_sample_introduction_title_8')
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Row：水平布局容器
            Row() {
              // Button：按钮
              // 关键属性：点击事件回调
              // 交互：可点击交互
              Button('start')
                .onClick(() => {
                  this.animatorState = AnimationStatus.Running
                }).normalButton().id('start')
              // Button：按钮
              // 关键属性：内边距、点击事件回调
              // 交互：可点击交互
              Button('pause')
                .padding(5)
                .onClick(() => {
                  this.animatorState = AnimationStatus.Paused
                }).normalButton().id('pause')
              // Button：按钮
              // 关键属性：内边距、点击事件回调
              // 交互：可点击交互
              Button('end')
                .padding(5)
                .onClick(() => {
                  this.animatorState = AnimationStatus.Stopped
                }).normalButton().id('end')
            }.id('image_animator_sample_row_10')

            // Row：水平布局容器
            // 关键属性：cardStyle
            Row() {
              // Button：按钮
              // 关键属性：点击事件回调
              // 交互：可点击交互
              Button('reserve')
                .onClick(() => {
                  this.animatorReserve = !this.animatorReserve
                }).normalButton().id('reserve')
              // Button：按钮
              // 关键属性：内边距、点击事件回调
              // 交互：可点击交互
              Button('single')
                .padding(5)
                .onClick(() => {
                  this.animatorInterations = 1
                }).normalButton().id('single')
              // Button：按钮
              // 关键属性：内边距、点击事件回调
              // 交互：可点击交互
              Button('circulate')
                .padding(5)
                .onClick(() => {
                  this.animatorInterations = -1
                }).normalButton().id('circulate')
            }.id('image_animator_sample_row_11')
          }.id('image_animator_sample_column_9').cardStyle()
        }.id('image_animator_sample_column_4')
      }.id('image_animator_sample_scroll_3').padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 100 })
    }.id('image_animator_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}