/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file casesfeature/immersive/src/main/ets/view/NavImmersive.ets
 * 文件职责：NavImmersive 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavImmersive。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { promptAction } from '@kit.ArkUI';
import { WebImmersive } from '../../../../Index';
import { GoodsList } from '../components/GoodsList';
import { GoodsDetails } from './GoodsDetails';

/**
 * 功能描述：开发应用沉浸式效果主要指通过调整状态栏、应用界面和导航条的显示效果来减少状态栏导航条等系统界面的突兀感，从而使用户获得最佳的UI体验。
 *         本模块分别针对Navigation、滚动、Web页、底部弹框等场景实现了沉浸式适配。
 *
 * 核心组件:
 * 1. NavImmersive: Navigation场景沉浸式适配和滚动场景沉浸式适配
 * 2. WebImmersive: Web场景沉浸式适配
 * 3. ImmersiveDialog: 底部弹框沉浸式适配
 *
 * 实现步骤:
 * 1. 通过组件属性expandSafeArea设置需要沉浸式的组件绘制延伸至状态栏和导航条
 * 2. 使用NavImmersive组件展示Navigation场景沉浸式和滚动场景沉浸式
 * 3. 使用WebImmersive组件展示Web场景沉浸式
 * 4. 使用ImmersiveDialog展示底部弹框场景沉浸式
 */
const COLUM_SPACE: number = 10; // 各组件间的间隔

const IMAGE_ASPECT_RATIO: number = 1; // 图片的宽高比

const LAYOUT_WEIGHT: number = 1; // 自适应占满父容器Column剩余空间

const OPACITY: number = 0.6; // 字体设置透明度

/**
 * NavImmersive：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct NavImmersive {
  // @Provide navPathStack：向子孙组件提供的状态
  @Provide navPathStack: NavPathStack = new NavPathStack();

  // @StorageLink avoidAreaTop：与 AppStorage 双向绑定
  @StorageLink('avoidAreaTopToModule') avoidAreaTop: number = 0;

  /**
   * pageMap：执行 pageMap 相关逻辑。
   */
  @Builder
  pageMap(name: string) {
    // NavDestination：导航目的地
    // 关键属性：hideTitleBar
    // NavDestination：导航目的地
    // 关键属性：hideTitleBar
    NavDestination() {
      if (name === 'goodsDetail') {
        // GoodsDetails：GoodsDetails 自定义组件
        GoodsDetails().id('nav_immersive_goods_details_2')
      } else if (name === 'WebImmersive') {
        // WebImmersive：WebImmersive 自定义组件
        WebImmersive().id('nav_immersive_web_immersive_3')
      }
    }.id('nav_immersive_nav_destination_1')
    .hideTitleBar(true)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // Navigation：导航容器
      // 关键属性：hideTitleBar、navDestination、宽度、高度、mode
      // Navigation：导航容器
      // 关键属性：hideTitleBar、navDestination、宽度、高度、mode
      Navigation(this.navPathStack) {
        // Column：垂直布局容器
        // 关键属性：内边距
        // Column：垂直布局容器
        // 关键属性：内边距
        Column({ space: COLUM_SPACE }) {

          // Flex：弹性布局容器
          // 关键属性：宽度、高度、外边距
          // Flex：弹性布局容器
          // 关键属性：宽度、高度、外边距
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            // Image：图片
            // 关键属性：宽度、aspectRatio
            // Image：图片
            // 关键属性：宽度、aspectRatio
            Image($r('app.media.immersive_logo')).id('nav_immersive_image_8')
              .width($r('app.integer.immersive_image_width'))
              .aspectRatio(IMAGE_ASPECT_RATIO)

            // Image：图片
            // 关键属性：宽度、aspectRatio、点击事件回调、showToast
            // 交互：可点击交互
            // Image：图片
            // 关键属性：宽度、aspectRatio、点击事件回调、showToast
            // 交互：可点击交互
            Image($r('app.media.immersive_scan')).id('nav_immersive_image_9')
              .width($r('app.integer.immersive_image_width'))
              .aspectRatio(IMAGE_ASPECT_RATIO)
              .onClick(() => {
                promptAction.showToast({ message: $r('app.string.immersive_mode_other_function') });
              })
          }.id('nav_immersive_flex_7')
          .width('100%')
          .height($r('app.integer.immersive_flex_height'))
          .margin({ top: $r('app.integer.immersive_flex_margin_top') })

          // Row：水平布局容器
          // 关键属性：宽度、高度、背景色、圆角、点击事件回调、showToast
          // 交互：可点击交互
          // Row：水平布局容器
          // 关键属性：宽度、高度、背景色、圆角、点击事件回调、showToast
          // 交互：可点击交互
          Row() {
            // Image：图片
            // 关键属性：宽度、aspectRatio、外边距
            // Image：图片
            // 关键属性：宽度、aspectRatio、外边距
            Image($r('app.media.immersive_search')).id('nav_immersive_image_10')
              .width($r('app.integer.immersive_search_image_width'))
              .aspectRatio(IMAGE_ASPECT_RATIO)
              .margin({ left: $r('app.integer.immersive_search_image_margin_left') })

            // Text：文本
            // 关键属性：透明度、字体颜色、外边距
            // Text：文本
            // 关键属性：透明度、字体颜色、外边距
            Text($r('app.string.immersive_search_text')).id('nav_immersive_text_11')
              .opacity(OPACITY)
              .fontColor($r('app.color.immersive_black_font_color'))
              .margin({ left: $r('app.integer.immersive_text_margin_left') })
          }
          .width('100%')
          .height($r('app.integer.immersive_row_height'))
          .backgroundColor($r('app.color.immersive_search_bg_color'))
          .borderRadius($r('app.integer.immersive_row_border_radius'))
          .id('immersiveSearchBar')
          .onClick(() => {
            promptAction.showToast({ message: $r('app.string.immersive_mode_other_function') });
          })

        }.id('nav_immersive_column_6')
        .padding({
          top: px2vp(this.avoidAreaTop),
          left: $r('app.integer.immersive_column_padding'),
          right: $r('app.integer.immersive_column_padding'),
          bottom: $r('app.integer.immersive_column_padding')
        })
        .backgroundColor($r('app.color.immersive_column_bg_color'))
        .width('100%')
        // 设置顶部绘制延伸至状态栏
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

        // Scroll：滚动容器
        // 关键属性：背景色、内边距、宽度、布局权重、滚动条、align
        // Scroll：滚动容器
        // 关键属性：背景色、内边距、宽度、布局权重、滚动条、align
        Scroll() {
          // Column：垂直布局容器
          Column() {
            // Column：垂直布局容器
            // 关键属性：背景色、内边距
            // Column：垂直布局容器
            // 关键属性：背景色、内边距
            Column() {
              // Image：图片
              // 关键属性：宽度、高度、圆角、点击事件回调、pushPathByName
              // 交互：可点击交互
              // Image：图片
              // 关键属性：宽度、高度、圆角、点击事件回调、pushPathByName
              // 交互：可点击交互
              Image($r('app.media.immersive_light_mode_banner'))
                .width('100%')
                .height($r('app.integer.immersive_banner_height'))
                .borderRadius($r('app.integer.immersive_banner_border_radius'))
                .id('banner')
                .onClick(() => {
                  this.navPathStack.pushPathByName('WebImmersive', false);
                })

              // Text：文本
              // 关键属性：字体颜色、字号、字重、高度、宽度、文本对齐
              // Text：文本
              // 关键属性：字体颜色、字号、字重、高度、宽度、文本对齐
              Text($r('app.string.immersive_new_product_text')).id('nav_immersive_text_15')
                .fontColor($r('app.color.immersive_white_font_color'))
                .fontSize($r('app.integer.immersive_new_goods_font'))
                .fontWeight(FontWeight.Bold)
                .height($r('app.integer.immersive_new_goods_height'))
                .width('100%')
                .textAlign(TextAlign.Center)
                .padding({ top: $r('app.integer.immersive_ew_goods_padding_top') })
            }.id('nav_immersive_column_14')
            .backgroundColor($r('app.color.immersive_column_bg_color'))
            .padding({
              left: $r('app.integer.immersive_column_padding'),
              right: $r('app.integer.immersive_column_padding')
            })
            .borderRadius({
              bottomLeft: $r('app.integer.immersive_column_border_radius'),
              bottomRight: $r('app.integer.immersive_column_border_radius')
            })

            // 引用产品列表组件
            // GoodsList：GoodsList 自定义组件
            GoodsList().id('nav_immersive_goods_list_16')
          }.id('nav_immersive_column_13')
        }.id('nav_immersive_scroll_12')
        .backgroundColor($r('app.color.immersive_list_bg_color'))
        .padding({ bottom: $r('app.integer.immersive_column_padding_bottom') })
        .width('100%')
        .layoutWeight(LAYOUT_WEIGHT)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)
        // 将底部绘制延伸至导航条
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      }.id('nav_immersive_navigation_5')
      .hideTitleBar(true)
      .navDestination(this.pageMap)
      .width('100%')
      .height('100%')
      .mode(NavigationMode.Stack)
    }.id('nav_immersive_column_4').width('100%')
    .height('100%')
  }
}