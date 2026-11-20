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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/sizeTransitionSample/SizeTransitionSample.ets
 * 文件职责：SizeTransitionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SizeTransitionSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { getStringData } from '../../../../data/ResourceDataHandle'
import { TitleBar } from '../../../../common/TitleBar'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'

@Extend(Column) function columnStyle() {
  .height(150)
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ bottom: 12 })
}

@AnimatableExtend(Text) function animatableFontSize(size: number) {
  .fontSize(size)
}

/**
 * SizeTransitionSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SizeTransitionSample {
  // @State mWidth：组件内部状态
  @State mWidth: number = 400
  // @State mTabIndex：组件内部状态
  @State mTabIndex: number = 0
  // @State mVisible：组件内部状态
  @State mVisible: Visibility = Visibility.Visible
  // @State mFontSize：组件内部状态
  @State mFontSize: number = 20
  private intervalID = 0

  @Builder tabbarTitle(name: Resource, index: number) {
    // Stack：层叠布局容器
    // 关键属性：宽度、高度
    Stack() {
      // Text：文本
      // 关键属性：字号、字体颜色
      Text(name).id('size_transition_sample_text_2')
        .fontSize(22)
        .fontColor(this.mTabIndex === index ? $r('app.color.title_colorone') : $r('app.color.title_colortwo'))

      if (this.mTabIndex === index) {
        // Row：水平布局容器
        // 关键属性：背景色、宽度、高度、绝对定位
        Row().id('size_transition_sample_row_3')
          .backgroundColor($r('app.color.title_colorone'))
          .width(200)
          .height(2)
          .position({ y: 48 })
      }
    }.id('size_transition_sample_stack_1').width(200)
    .height(56)
  }

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.intervalID = setInterval(() => {
      animateTo({ duration: 2000 }, () => {
        this.mWidth = (this.mWidth == 400 || this.mVisible == Visibility.Hidden) ? 200 : 400
        if (this.mVisible == Visibility.Visible) {
          this.mFontSize = this.mFontSize == 20 ? 40 : 20
        }
      })
      setTimeout(() => {
        animateTo({ duration: 2000 }, () => {
          if (this.mWidth == 200 && this.mVisible == Visibility.Visible) {
            this.mVisible = Visibility.Hidden
          }
          else if (this.mVisible == Visibility.Hidden) {
            this.mVisible = Visibility.Visible
          }
        })
      }, 2000);
    }, 4000);
  }

  /**
   * onPageHide：页面退到后台时回调。
   */
  onPageHide() {
    clearInterval(this.intervalID)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.size_transition_expansion') }).id('size_transition_sample_title_bar_5')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_transition_flex') })
            .id('size_transition_sample_introduction_title_8')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Flex：弹性布局容器
            // 关键属性：可见性、宽度、背景色、高度
            Flex() {
              // Text：文本
              Text($r('app.string.size_transition_flex')).id('size_transition_sample_text_11')
            }.id('size_transition_sample_flex_10')
            .visibility(this.mVisible)
            .width(this.mWidth)
            .backgroundColor($r('app.color.radio_response_region_color'))
            .height(100)
          }.id('size_transition_sample_column_9')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_transition_grid_item') })
            .id('size_transition_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Grid：网格容器
            // 关键属性：可见性、外边距、宽度、背景色、高度
            Grid() {
              ForEach([1, 2, 3], (item: number) => {
                // GridItem：网格项
                // 关键属性：外边距、宽度
                GridItem() {
                  // Text：文本
                  // 关键属性：外边距、宽度
                  Text(getStringData($r('app.string.size_transition_grid_item')) + item)
                    .id('size_transition_sample_text_16')
                }.id('size_transition_sample_grid_item_15').margin(5).width(100)
              })
            }.id('size_transition_sample_grid_14')
            .visibility(this.mVisible)
            .margin(5)
            .width(this.mWidth)
            .backgroundColor($r('app.color.radio_response_region_color'))
            .height(100)
          }.id('size_transition_sample_column_13')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_transition_list_item') })
            .id('size_transition_sample_introduction_title_17')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // List：列表容器
            // 关键属性：可见性、列表方向、外边距、宽度、背景色、高度
            List() {
              ForEach([1, 2, 3, 4], (item: number) => {
                // ListItem：列表项
                // 关键属性：外边距、宽度
                ListItem() {
                  // Text：文本
                  // 关键属性：外边距、宽度
                  Text(getStringData($r('app.string.size_transition_list_item')) + item)
                    .id('size_transition_sample_text_21')
                }.id('size_transition_sample_list_item_20').margin(5).width(100)
              })
            }.id('size_transition_sample_list_19')
            .visibility(this.mVisible)
            .listDirection(Axis.Horizontal)
            .margin(5)
            .width(this.mWidth)
            .backgroundColor($r('app.color.radio_response_region_color'))
            .height(100)
          }.id('size_transition_sample_column_18')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_transition_swiper_item') })
            .id('size_transition_sample_introduction_title_22')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Swiper：轮播容器
            // 关键属性：可见性、外边距、宽度、背景色、高度
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                // Text：文本
                Text(getStringData($r('app.string.size_transition_swiper_item')) + item)
                  .id('size_transition_sample_text_25')
              })
            }.id('size_transition_sample_swiper_24')
            .visibility(this.mVisible)
            .margin(5)
            .width(this.mWidth)
            .backgroundColor($r('app.color.radio_response_region_color'))
            .height(100)
          }.id('size_transition_sample_column_23')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: ($r('app.string.size_transition_expansion_tabContent')) })
            .id('size_transition_sample_introduction_title_26')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Tabs：页签容器
            // 关键属性：可见性、外边距、宽度、背景色、高度、内容变更回调
            // 交互：输入/提交回调
            Tabs() {
              ForEach([0, 1, 2], (item: number) => {
                // TabContent：页签内容
                // 关键属性：背景色、tabBar、tabbarTitle
                TabContent() {
                  // Text：文本
                  Text(getStringData($r('app.string.size_transition_expansion_tabContent')) + item)
                    .id('size_transition_sample_text_30')
                }.id('size_transition_sample_tab_content_29')
                .backgroundColor($r('app.color.select_option_bg_color'))
                .tabBar(this.tabbarTitle($r('app.string.size_transition_expansion_tabContent'), item))
              })
            }.id('size_transition_sample_tabs_28')
            .visibility(this.mVisible)
            .margin(5)
            .width(this.mWidth)
            .backgroundColor($r('app.color.radio_response_region_color'))
            .height(100)
            .onChange((index) => {
              this.mTabIndex = index
            })
          }.id('size_transition_sample_column_27')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.size_transition_font_size') })
            .id('size_transition_sample_introduction_title_31')
          // Column：垂直布局容器
          // 关键属性：columnStyle、外边距
          Column() {
            // Text：文本
            // 关键属性：外边距、可见性、animatableFontSize、背景色、高度、宽度
            Text(getStringData($r('app.string.size_transition_font_size')) + ': ' + this.mFontSize)
              .id('size_transition_sample_text_33')
              .margin(5)
              .visibility(this.mVisible)
              .animatableFontSize(this.mFontSize)
              .backgroundColor($r('app.color.radio_response_region_color'))
              .height(100)
              .width(200)
          }.id('size_transition_sample_column_32')
          .columnStyle()
          .margin({ bottom: 80 })
        }.id('size_transition_sample_column_7')
        .constraintSize({ minWidth: '100%' })
      }.id('size_transition_sample_scroll_6')
    }.id('size_transition_sample_column_4')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}