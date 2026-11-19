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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/shopSample/ShopCardSample.ets
 * 文件职责：ShopCardSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShopCardSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * ShopCardSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ShopCardSample {
  // @State isUnfold：组件内部状态
  @State isUnfold: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：宽度、高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度、高度、背景色
      Column() {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.Shop_card_expansion') }).id('shop_card_sample_title_bar_3')
        // Stack：层叠布局容器
        // 关键属性：宽度、高度、内容对齐
        Stack() {
          // Row：水平布局容器
          // 关键属性：宽度、高度
          Row() {
            // Text：文本
            // 关键属性：外边距、字号、字体颜色、字体
            Text($r('app.string.Today')).id('shop_card_sample_text_6')
              .margin({ left: 24 })
              .fontSize(30)
              .fontColor($r('app.color.sub_title_color'))
              .fontFamily($r('app.string.Font_family_medium'))
            // Blank：占位空白
            Blank().id('shop_card_sample_blank_7')
            // Image：图片
            // 关键属性：宽度、高度、外边距、objectFit
            Image($r('app.media.ic_user')).id('shop_card_sample_image_8')
              .width(40)
              .height(40)
              .margin({ right: 24 })
              .objectFit(ImageFit.Contain)
          }.id('shop_card_sample_row_5')
          .width('100%')
          .height(80)

          if (!this.isUnfold) {
            // Image：图片
            // 关键属性：宽度、高度、圆角、层级、外边距、geometryTransition
            // 交互：可点击交互
            Image($r('app.media.img_test_5'))
              .id('shopCardUnexpanded')
              .width('90%')
              .height('80%')
              .borderRadius(24)
              .zIndex(0)
              .margin({ top: 80 })
              .geometryTransition('sharedImage')
              .transition({ type: TransitionType.Insert })
              .transition({ type: TransitionType.Delete })
              .onClick(e => {
                // 使用TransitionOptions指定transition时，必须配合animateTo才能产生动画
                animateTo({ duration: 350 }, () => {
                  this.isUnfold = true;
                })
              })
          }
          if (this.isUnfold) {
            // Image：图片
            // 关键属性：宽度、高度、层级、geometryTransition、转场动画、点击事件回调
            // 交互：可点击交互
            Image($r('app.media.img_test_5'))
              .id('shopCardExpanded')
              .width('100%')
              .height('100%')
              .zIndex(1)
              .geometryTransition('sharedImage')
              .transition({ type: TransitionType.Insert, translate: { y: 0 } })
              .transition({ type: TransitionType.Delete })
              .onClick(e => {
                // 使用TransitionOptions指定transition时，必须配合animateTo才能产生动画
                animateTo({ duration: 350 }, () => {
                  this.isUnfold = false;
                })
              })
          }
        }.id('shop_card_sample_stack_4')
        .width('100%')
        .height('70%')
        .alignContent(Alignment.Top)
      }.id('shop_card_sample_column_2')
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.background_shallow_grey'))
    }.id('shop_card_sample_row_1')
    .width('100%')
    .height('100%')
  }
}