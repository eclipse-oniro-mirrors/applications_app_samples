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
 * @file entry/src/main/ets/pages/universal/properties/displaySample/DisplaySample.ets
 * 文件职责：DisplaySample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Page。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';
import { locationTypes, visibileTypes, ResourceObjectType } from '../../UniversialData';

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .margin({ bottom: 12 })
}

@Extend(Text) function subTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
}

@Extend(Text) function leftTitleStyle() {
  .fontSize(18)
  .width('100%')
  .direction(Direction.Ltr)
  .margin({ left: 24, top: 8, bottom: 8 })
  .fontColor($r('app.color.font_color_shallow'))
}

/**
 * Page：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Page {
  // @State firstZindex：组件内部状态
  @State firstZindex: number = 0;

  // @State secondZindex：组件内部状态
  @State secondZindex: number = 0;

  // @State thirdZindex：组件内部状态
  @State thirdZindex: number = 0;

  // @State alignmentLocation：组件内部状态
  @State alignmentLocation: Alignment = Alignment.Center;

  // @State offsetX：组件内部状态
  @State offsetX: number = 0;

  // @State offsetY：组件内部状态
  @State offsetY: number = 0;

  // @State selectIndex：组件内部状态
  @State selectIndex: number = 0;

  // @State currentVisibility：组件内部状态
  @State currentVisibility: Visibility = Visibility.Visible;

  // @State visibleIndex：组件内部状态
  @State visibleIndex: number = 0;

  // @State contentOpacity：组件内部状态
  @State contentOpacity: number = 0.5;

  // @State currentTabIndex：组件内部状态
  @State currentTabIndex: number = 0;
  private visibilityArray: Visibility[] = [Visibility.Visible, Visibility.Hidden, Visibility.None];
  private alignments: Alignment[] = [Alignment.Center, Alignment.TopStart,
    Alignment.TopEnd, Alignment.Top, Alignment.Start,
    Alignment.End, Alignment.BottomStart,
    Alignment.Bottom, Alignment.BottomEnd];
  private selectArray: ResourceObjectType[] = locationTypes;
  private visibleArray: ResourceObjectType[] = visibileTypes;

  /**
   * tabbarTitle：执行 tabbarTitle 相关逻辑。
   */
  @Builder
  tabbarTitle(name: string | Resource, index: number) {
    // Stack：层叠布局容器
    // 关键属性：宽度、高度
    Stack() {
      // Text：文本
      // 关键属性：字号、字体颜色
      Text(name).id('display_sample_text_2')
        .fontSize(22)
        .fontColor(this.currentTabIndex === index ? $r('app.color.title_colorone') : $r('app.color.title_colortwo'))

      if (this.currentTabIndex === index) {
        // Row：水平布局容器
        // 关键属性：背景色、宽度、高度、绝对定位
        Row().id('display_sample_row_3')
          .backgroundColor($r('app.color.title_colorone'))
          .width('100%')
          .height(2)
          .position({ y: 48 })
      }
    }.id('display_sample_stack_1').width(48)
    .height(56)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.components_display') }).id('display_sample_title_bar_5')
      // Tabs：页签容器
      // 关键属性：布局权重、内容变更回调
      // 交互：输入/提交回调
      Tabs() {
        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：内边距、tabBar、tabbarTitle
          Column() {
            // Stack：层叠布局容器
            // 关键属性：高度、宽度、背景色、圆角
            Stack() {
              // Row：水平布局容器
              // 关键属性：偏移、宽度、高度、背景色、层级
              Row().id('display_sample_row_10')
                .offset({ x: -30, y: -30 })
                .width(150)
                .height(150)
                .backgroundColor(Color.Red)
                .zIndex(this.firstZindex)
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、层级
              Row().id('display_sample_row_11')
                .width(150)
                .height(150)
                .backgroundColor(Color.Blue)
                .zIndex(this.secondZindex)
              // Row：水平布局容器
              // 关键属性：宽度、高度、偏移、背景色、层级
              Row().id('display_sample_row_12')
                .width(150)
                .height(150)
                .offset({ x: 30, y: 30 })
                .backgroundColor(Color.Yellow)
                .zIndex(this.thirdZindex)
            }.id('display_sample_stack_9')
            .height(300)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(24)

            // Text：文本
            // 关键属性：subTitleStyle
            Text($r('app.string.z_index_display')).id('display_sample_text_13')
              .subTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle、外边距
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、cardStyle
              Row() {
                // Blank：占位空白
                Blank().id('display_sample_blank_16')
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.Red')).id('display_sample_text_18')
                    .fontSize(12)
                  // Select：下拉选择器
                  // 关键属性：当前值、onSelect
                  Select([{ value: '1' }, { value: '2' }, { value: '3' }])
                    .value(this.firstZindex + "")
                    .onSelect((index: number) => {
                      this.firstZindex = index + 1
                    }).id('test_select1')
                }.id('display_sample_column_17')

                // Blank：占位空白
                Blank().id('display_sample_blank_19')
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.Blue')).id('display_sample_text_21')
                    .fontSize(12)
                  // Select：下拉选择器
                  // 关键属性：当前值、onSelect
                  Select([{ value: '1' }, { value: '2' }, { value: '3' }])
                    .value(this.secondZindex + "")
                    .onSelect((index: number) => {
                      this.secondZindex = index + 1
                    }).id('test_select2')
                }.id('display_sample_column_20')

                // Blank：占位空白
                Blank().id('display_sample_blank_22')
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.Yellow')).id('display_sample_text_24')
                    .fontSize(12)
                  // Select：下拉选择器
                  // 关键属性：当前值、onSelect
                  Select([{ value: '1' }, { value: '2' }, { value: '3' }])
                    .value(this.thirdZindex + "")
                    .onSelect((index: number) => {
                      this.thirdZindex = index + 1
                    }).id('test_select3')
                }.id('display_sample_column_23')

                // Blank：占位空白
                Blank().id('display_sample_blank_25')
              }.id('display_sample_row_15')
              .width('100%')
            }.id('display_sample_column_14').cardStyle()
            .margin({ top: 20 })
          }.id('display_sample_column_8')
          .padding(12)
        }.id('display_sample_tab_content_7').tabBar(this.tabbarTitle($r('app.string.z_index'), 0))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：tabBar、tabbarTitle
          Column() {
            // Column：垂直布局容器
            // 关键属性：内边距
            Column() {
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Row：水平布局容器
                // 关键属性：宽度、高度、背景色、overlay
                Row().id('display_sample_row_30')
                  .width(420)
                  .height(200)
                  .backgroundColor($r('app.color.white'))
                  .overlay(getStringData($r('app.string.components_display_content')), {
                    align: this.alignmentLocation,
                    offset: {
                      x: this.offsetX,
                      y: this.offsetY
                    }
                  })
              }.id('display_sample_column_29').cardStyle()

              // Text：文本
              // 关键属性：subTitleStyle
              Text($r('app.string.effects_display')).id('display_sample_text_31')
                .subTitleStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.positon_modify')).id('display_sample_text_32')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Select：下拉选择器
                // 关键属性：当前值、cardStyle
                Select(this.selectArray).onSelect((index: number) => {
                  this.alignmentLocation = this.alignments[index]
                  this.selectIndex = index;
                }).id('test_selectPosition')
                  .value(getStringData(this.selectArray[this.selectIndex].value))
              }.id('display_sample_column_33').cardStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.offset_modify')).id('display_sample_text_35')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle、内边距
              Column() {
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 20 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.x_offset')).id('display_sample_text_38')
                    .fontSize(15)
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ min: -20, max: 20, step: 1 }).id('display_sample_slider_39')
                    .onChange((value: number) => {
                      this.offsetX = value;
                    })
                    .layoutWeight(1)
                }.id('display_sample_row_37').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度、cardStyle
                Row({ space: 20 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.y_offset')).id('display_sample_text_41')
                    .fontSize(15)
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ min: -20, max: 20, step: 1 }).id('display_sample_slider_42')
                    .onChange((value: number) => {
                      this.offsetY = value;
                    })
                    .layoutWeight(1)
                }.id('display_sample_row_40').width('100%')
              }.id('display_sample_column_36').cardStyle()
            }.id('display_sample_column_28').padding(12)
          }.id('display_sample_column_27')
        }.id('display_sample_tab_content_26').tabBar(this.tabbarTitle($r('app.string.overlay'), 1))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column({ space: 10 }) {
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色
              Row().id('display_sample_row_46')
                .width(100)
                .height(100)
                .backgroundColor(Color.Red)
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、可见性、动画配置
              Row().id('display_sample_row_47')
                .width(100)
                .height(100)
                .backgroundColor(Color.Blue)
                .visibility(this.currentVisibility)
                .animation({
                  duration: 2000
                })
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、cardStyle
              Row().id('display_sample_row_48')
                .width(100)
                .height(100)
                .backgroundColor(Color.Yellow)
            }.id('display_sample_column_45').cardStyle()

            // Text：文本
            // 关键属性：subTitleStyle
            Text($r('app.string.effects_display')).id('display_sample_text_49')
              .subTitleStyle()
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.visibility_change')).id('display_sample_text_50')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle、宽度
            Column() {
              // Select：下拉选择器
              // 关键属性：当前值、onSelect
              Select(this.visibleArray)
                .value(getStringData(this.visibleArray[this.visibleIndex].value))
                .onSelect((index: number) => {
                  this.currentVisibility = this.visibilityArray[index]
                  this.visibleIndex = index
                }).id('test_selectVisible')
                .selected(this.visibleIndex)
            }.id('display_sample_column_51').cardStyle()
          }.id('display_sample_column_44').width('100%')
          .padding(12)
        }.id('display_sample_tab_content_43').tabBar(this.tabbarTitle($r('app.string.visibility'), 2))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle、布局权重
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、透明度、cardStyle
              Row().id('display_sample_row_55')
                .width(200)
                .height(200)
                .backgroundColor(Color.Green)
                .opacity(this.contentOpacity)
            }.id('display_sample_column_54').cardStyle()

            // Text：文本
            // 关键属性：subTitleStyle
            Text($r('app.string.opacity_display')).id('display_sample_text_56')
              .subTitleStyle()

            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.opacity_change')).id('display_sample_text_57')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle、宽度
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、内边距、cardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text('0').id('display_sample_text_60')
                  .fontSize(15)
                // Slider：滑块
                // 关键属性：内容变更回调
                // 交互：输入/提交回调
                Slider({ value: this.contentOpacity, min: 0, max: 1.0, step: 0.05 }).id('display_sample_slider_61')
                  .onChange((value: number) => {
                    this.contentOpacity = value
                  })
                // Text：文本
                // 关键属性：字号、宽度
                Text('1').id('display_sample_text_62')
                  .fontSize(15)
              }.id('display_sample_row_59').width('100%')
              .padding({ left: 5, right: 15 })
            }.id('display_sample_column_58').cardStyle()
          }.id('display_sample_column_53').width('100%')
          .padding(12)
        }.id('display_sample_tab_content_52').tabBar(this.tabbarTitle($r('app.string.opacity'), 3))
      }.id('display_sample_tabs_6').layoutWeight(1)
      .onChange((index) => {
        this.currentTabIndex = index
      })
      .barMode(BarMode.Scrollable)
    }.id('display_sample_column_4')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
  }
}