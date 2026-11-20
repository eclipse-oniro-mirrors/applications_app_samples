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
 * @file entry/src/main/ets/pages/components/scrollAndSwipe/swiperSample/SwiperSample.ets
 * 文件职责：SwiperSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SwiperSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { PropertiesControlPanel } from './SwiperControlPanel';
import { CustomAnimationPropertiesControlPanel } from './SwiperCustomAnimationControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding({ left: 12, right: 12, top: 4, bottom: 4 })
  .borderRadius(20)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.Start)
}

@Extend(Text) function swiperItemStyle(bgColor: Resource) {
  .width('100%')
  .height('100%')
  .fontSize(30)
  .textAlign(TextAlign.Center)
  .backgroundColor(bgColor)
}

// const 语句
const DISPLAY_COUNT: number = 2;

// const 语句
const MIN_SCALE: number = 0.75;

/**
 * SwiperSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SwiperSample {
  // Common interfaces and properties
  // @State isDisableSwipe：组件内部状态
  @State isDisableSwipe: boolean = false;

  // @State itemSpace：组件内部状态
  @State itemSpace: number = 0;

  // @State isVertical：组件内部状态
  @State isVertical: boolean = false;

  // @State duration：组件内部状态
  @State duration: number = 400;

  // @State loop：组件内部状态
  @State loop: boolean = false;

  // @State autoPlay：组件内部状态
  @State autoPlay: boolean = false;

  // @State interval：组件内部状态
  @State interval: number = 1000;

  // properties of custom transition animation
  // @State changeOpacity：组件内部状态
  @State changeOpacity: boolean = false;

  // @State changeScale：组件内部状态
  @State changeScale: boolean = false;

  // @State closeTwoPagesTogether：组件内部状态
  @State closeTwoPagesTogether: boolean = false;

  // @State cancelDefaultTranslate：组件内部状态
  @State cancelDefaultTranslate: boolean = false;

  // @State customAnimationAutoPlay：组件内部状态
  @State customAnimationAutoPlay: boolean = false;

  // @State customAnimationDuration：组件内部状态
  @State customAnimationDuration: number = 400;

  // @State customAnimationCurve：组件内部状态
  @State customAnimationCurve: string = 'Linear';

  // @State backgroundColorList：组件内部状态
  @State backgroundColorList: Resource[] = [
  $r('app.color.background_blue'),
  $r('app.color.background_orange'),
  $r('app.color.background_green'),
  $r('app.color.background_pink')
  ];

  // @State opacityList：组件内部状态
  @State opacityList: number[] = [];

  // @State scaleList：组件内部状态
  @State scaleList: number[] = [];

  // @State translateList：组件内部状态
  @State translateList: number[] = [];

  // @State zIndexList：组件内部状态
  @State zIndexList: number[] = [];
  // 字段 controller：声明并维护该成员的状态
  private controller: SwiperController = new SwiperController();
  // 字段 data：声明并维护该成员的状态
  private data: number[] = [];
  // 字段 swiperHeight：声明并维护该成员的状态
  private swiperHeight: number = 216;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    // for 语句
    for (let i = 1; i < 11; i++) {
      // 更新 data
      this.data.push(i)
    }
    // for 语句
    for (let i = 1; i < this.backgroundColorList.length; i++) {
      // 更新 opacityList
      this.opacityList.push(1.0)
      this.scaleList.push(1.0)
      this.translateList.push(0.0)
      this.zIndexList.push(0)
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.swiper_name') }).id('swiper_sample_title_bar_2')

      // Tabs：页签容器
      // 关键属性：内边距、barMode、barBackgroundColor
      Tabs() {
        // TabContent：页签内容
        // 关键属性：tabBar、of
        TabContent() {
          // 更新 CommonPropertiesPage
          this.CommonPropertiesPage()
        }.id('swiper_sample_tab_content_4')
        .tabBar(SubTabBarStyle.of($r('app.string.swiper_common_interfaces_and_properties')))

        // TabContent：页签内容
        // 关键属性：tabBar、of
        TabContent() {
          // 更新 CustomPropertiesPage
          this.CustomPropertiesPage()
        }.id('swiper_sample_tab_content_5').tabBar(SubTabBarStyle.of($r('app.string.swiper_custom_properties')))
      }.id('swiper_sample_tabs_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING, bottom: 56 })
      .barMode(BarMode.Scrollable)
      .barBackgroundColor($r('app.color.background_shallow_grey'))
    }.id('swiper_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }

  @Builder CommonPropertiesPage() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      // component
      // Swiper：轮播容器
      // 关键属性：disableSwipe、itemSpace、是否纵向、duration、是否循环、切换间隔
      Swiper(this.controller) {
        ForEach(this.data, (item: number, index) => {
          // if 语句
          if (index % 2 === 0) {
            // Text：文本
            // 关键属性：swiperItemStyle
            Text(item.toString()).id('swiper_sample_text_8')
              .swiperItemStyle($r('app.color.background_orange'))
          } else {
            // Text：文本
            // 关键属性：swiperItemStyle
            Text(item.toString()).id('swiper_sample_text_9')
              .swiperItemStyle($r('app.color.background_green'))
          }
        })
      }.id('swiper_sample_swiper_7')
      .disableSwipe(this.isDisableSwipe)
      .itemSpace(this.itemSpace === 300 && this.isVertical === true ? this.swiperHeight : this.itemSpace)
      .vertical(this.isVertical)
      .duration(this.duration)
      .loop(this.loop)
      .interval(this.interval)
      .autoPlay(this.autoPlay)
      .borderRadius(16)
      .backgroundColor(Color.White)
      .height(this.swiperHeight)
      .curve('linear')

      // Scroll：滚动容器
      // 关键属性：高度
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.swiper_introduction_arguments') })
            .id('swiper_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：高度、交叉轴对齐
            Row() {
              // Text：文本
              // 关键属性：字体颜色、内边距、点击事件回调、showNext
              // 交互：可点击交互
              Text($r('app.string.swiper_controller_next')).id('swiper_sample_text_15')
                .fontColor($r('app.color.background_blue'))
                .padding(20)
                .onClick(() => {
                  // 更新 controller
                  this.controller.showNext()
                })

              // Text：文本
              // 关键属性：字体颜色、内边距、点击事件回调、showPrevious
              // 交互：可点击交互
              Text($r('app.string.swiper_controller_previous')).id('swiper_sample_text_16')
                .fontColor($r('app.color.background_blue'))
                .padding(20)
                .onClick(() => {
                  // 更新 controller
                  this.controller.showPrevious()
                })
            }.id('swiper_sample_row_14')
            .height(56)
            .alignItems(VerticalAlign.Center)
          }.id('swiper_sample_column_13')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.swiper_introduction_properties') })
            .id('swiper_sample_introduction_title_17')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // PropertiesControlPanel：PropertiesControlPanel 自定义组件
            PropertiesControlPanel({
              // 字段 isDisableSwipe：声明并维护该成员的状态
              isDisableSwipe: $isDisableSwipe,
              // 字段 itemSpace：声明并维护该成员的状态
              itemSpace: $itemSpace,
              // 字段 isVertical：声明并维护该成员的状态
              isVertical: $isVertical,
              duration: $duration,
              loop: $loop,
              autoPlay: $autoPlay,
              interval: $interval
            }).id('swiper_sample_properties_control_panel_19')
          }.id('swiper_sample_column_18')
          .backgroundStyle()
        }.id('swiper_sample_column_11')
      }.id('swiper_sample_scroll_10')
      .height('calc(100% - 216vp)')
    }.id('swiper_sample_column_6')
    .height('100%')
    .width('100%')
  }

  @Builder CustomPropertiesPage() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      // Swiper：轮播容器
      // 关键属性：displayCount、是否自动播放、duration、curve、toLowerCase、customContentTransition
      Swiper() {
        ForEach(this.backgroundColorList, (backgroundColor: Resource, index: number) => {
          // Column：垂直布局容器
          // 关键属性：宽度、高度、背景色、透明度、缩放、平移
          Column().id('swiper_sample_column_22')
            .width('100%')
            .height('100%')
            .backgroundColor(backgroundColor)
            .opacity(this.changeOpacity ? this.opacityList[index] : 1.0)
            .scale(this.changeScale ? { x: this.scaleList[index], y: this.scaleList[index] } : {})
            .translate((this.closeTwoPagesTogether || this.cancelDefaultTranslate) ?
              { x: this.translateList[index] } : {})
            .zIndex(this.zIndexList[index])
        })
      }.id('swiper_sample_swiper_21')
      .displayCount(DISPLAY_COUNT, true)
      .autoPlay(this.customAnimationAutoPlay)
      .duration(this.customAnimationDuration)
      .curve(this.customAnimationCurve.toLowerCase())
      .customContentTransition({
        transition: (proxy: SwiperContentTransitionProxy) => {
          if (proxy.position <= proxy.index % DISPLAY_COUNT ||
          proxy.position >= DISPLAY_COUNT + proxy.index % DISPLAY_COUNT) {
            // 同组页面往左滑或往右完全滑出视窗外时，重置属性值
            this.opacityList[proxy.index] = 1.0;
            this.scaleList[proxy.index] = 1.0;
            this.translateList[proxy.index] = 0.0;
            this.zIndexList[proxy.index] = 0;
          } else {
            // 同组页面往右滑且未滑出视窗外时，对同组中左右两个页面，逐帧根据position、mainAxisLength修改属性值
            let relativePosition = proxy.position - proxy.index % DISPLAY_COUNT;
            this.opacityList[proxy.index] = 1 - relativePosition / DISPLAY_COUNT;
            this.scaleList[proxy.index] = MIN_SCALE + (1 - MIN_SCALE) * (1 - relativePosition / DISPLAY_COUNT);
            let translate = 0.0;
            if (this.changeScale && this.closeTwoPagesTogether) {
              let itemSpace = (1 - this.scaleList[proxy.index]) * proxy.mainAxisLength;
              if (proxy.index % DISPLAY_COUNT === 0) {
                translate += itemSpace / 2.0;
              } else {
                translate -= itemSpace / 2.0;
              }
            }
            if (this.cancelDefaultTranslate) {
              translate -= relativePosition * proxy.mainAxisLength;
            }
            this.translateList[proxy.index] = translate;
            this.zIndexList[proxy.index] = -1;
          }
        }
      })
      .borderRadius(16)
      .height(216)

      // Scroll：滚动容器
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        // 关键属性：高度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.swiper_modify_custom_properties') })
            .id('swiper_sample_introduction_title_25')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // CustomAnimationPropertiesControlPanel：CustomAnimationPropertiesControlPanel 自定义组件
            CustomAnimationPropertiesControlPanel({
              changeOpacity: $changeOpacity,
              changeScale: $changeScale,
              closeTwoPagesTogether: $closeTwoPagesTogether,
              cancelDefaultTranslate: $cancelDefaultTranslate,
              customAnimationAutoPlay: $customAnimationAutoPlay,
              customAnimationDuration: $customAnimationDuration,
              customAnimationCurve: $customAnimationCurve
            }).id('swiper_sample_custom_animation_properties_control_panel_27')
          }.id('swiper_sample_column_26')
          .backgroundStyle()
        }.id('swiper_sample_column_24')
        .height('calc(100% - 216vp)')
      }.id('swiper_sample_scroll_23')
    }.id('swiper_sample_column_20')
    .height('100%')
    .width('100%')
  }
}