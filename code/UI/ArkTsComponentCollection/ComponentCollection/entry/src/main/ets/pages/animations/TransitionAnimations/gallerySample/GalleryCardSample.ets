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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/gallerySample/GalleryCardSample.ets
 * 文件职责：GalleryCardSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GalleryCardSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * GalleryCardSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GalleryCardSample {
  // @StorageProp windowHeight：与 AppStorage 单向绑定
  @StorageProp('windowHeight') windowHeight: number = 720;

  // @State active：组件内部状态
  @State active: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.Gallery_card_expansion') }).id('gallery_card_sample_title_bar_2')
      // Stack：层叠布局容器
      // 关键属性：内容对齐、宽度、高度
      Stack() {
        if (!this.active) {
          // Image：图片
          // 关键属性：宽度、高度、外边距、圆角、点击事件回调
          // 交互：可点击交互
          Image($r('app.media.img_test_4'))
            .id('galleryUnexpanded')
            .width('80%')
            .height(150)
            .margin({ top: 10 })
            .borderRadius(20)
            .onClick(() => {
              animateTo({ duration: 800 }, () => {
                this.active = true;
              })
            })
            .geometryTransition('sharedImage')
            .transition({ type: TransitionType.All })
        }

        if (this.active) {
          // Stack：层叠布局容器
          // 关键属性：外边距、geometryTransition、转场动画
          Stack() {
            // Image：图片
            // 关键属性：宽度、align、点击事件回调
            // 交互：可点击交互
            Image($r('app.media.img_test_4'))
              .id('galleryExpanded')
              .width('100%')
              .align(Alignment.Center)
              .onClick(() => {
                animateTo({ duration: 800 }, () => {
                  this.active = false;
                })
              })
          }.id('gallery_card_sample_stack_4')
          .margin({ top: this.windowHeight * 0.2 })
          .geometryTransition('sharedImage')
          .transition({ type: TransitionType.All })
        }
      }.id('gallery_card_sample_stack_3')
      .alignContent(Alignment.Top)
      .width('100%')
      .height('100%')
    }.id('gallery_card_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}