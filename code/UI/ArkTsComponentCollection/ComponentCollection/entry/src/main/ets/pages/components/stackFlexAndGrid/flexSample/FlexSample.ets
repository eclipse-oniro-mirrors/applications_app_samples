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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/flexSample/FlexSample.ets
 * 文件职责：FlexSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FlexSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { DirectionControlPanel, WrapControlPanel, JustifyContentControlPanel, AlignItemsControlPanel, AlignContentControlPanel } from './FlexControlPanel'

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Text) function elementStyle(color: Resource) {
  .backgroundColor(color)
  .textAlign(TextAlign.Center)
}

/**
 * FlexSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct FlexSample {
  // @State flexDirection：组件内部状态
  @State flexDirection : FlexDirection = FlexDirection.Column;

  // @State wrap：组件内部状态
  @State wrap : FlexWrap = FlexWrap.NoWrap;

  // @State justifyContent：组件内部状态
  @State justifyContent : FlexAlign = FlexAlign.Start;

  // @State alignItems：组件内部状态
  @State alignItems : ItemAlign = ItemAlign.Start;

  // @State alignContent：组件内部状态
  @State alignContent : FlexAlign = FlexAlign.Start;

  @Styles fixedSize(){
    .width('20%')
    .height('20%')
  }

  @Styles dynamicSize(){
    .width(this.flexDirection === FlexDirection.Row || this.flexDirection === FlexDirection.RowReverse ? '50%': 100)
    .height(this.flexDirection === FlexDirection.Column || this.flexDirection === FlexDirection.ColumnReverse ? '50%' : 50  )
  }

  @Styles alignContentDynamicSize(){
    .width(this.flexDirection === FlexDirection.Column || this.flexDirection === FlexDirection.ColumnReverse ? 20:'50%')
    .height(this.flexDirection === FlexDirection.Row || this.flexDirection === FlexDirection.RowReverse ? 20 : '50%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.flex_title') }).id('flex_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column({space : 10}) {
          // direction
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column(){
            // DirectionControlPanel：DirectionControlPanel 自定义组件
            DirectionControlPanel({
              flexDirection : $flexDirection
            }).id('flex_sample_direction_control_panel_6')
          }.id('flex_sample_column_5')
          .backgroundStyle()
          // wrap
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // Column：垂直布局容器
            // 关键属性：主轴对齐、高度
            Column(){
              // Flex：弹性布局容器
              Flex({direction:this.flexDirection,wrap: this.wrap}) {
                // Text：文本
                // 关键属性：elementStyle、dynamicSize
                Text('1').id('flex_sample_text_10')
                  .elementStyle($r('app.color.background_orange'))
                  .dynamicSize()
                // Text：文本
                // 关键属性：elementStyle、dynamicSize
                Text('2').id('flex_sample_text_11')
                  .elementStyle($r('app.color.background_pink'))
                  .dynamicSize()
                // Text：文本
                // 关键属性：elementStyle、dynamicSize
                Text('3').id('flex_sample_text_12')
                  .elementStyle($r('app.color.background_orange'))
                  .dynamicSize()
                // Text：文本
                // 关键属性：elementStyle、dynamicSize
                Text('4').id('flex_sample_text_13')
                  .elementStyle($r('app.color.background_pink'))
                  .dynamicSize()
              }.id('flex_sample_flex_9')
            }.id('flex_sample_column_8')
            .justifyContent(FlexAlign.Center)
            .height(200)
            // WrapControlPanel：WrapControlPanel 自定义组件
            WrapControlPanel({
              wrap: $wrap
            }).id('flex_sample_wrap_control_panel_14')
          }.id('flex_sample_column_7')
          .backgroundStyle()

          // justifyContent
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column(){
            // Column：垂直布局容器
            // 关键属性：主轴对齐、高度
            Column(){
              // Flex：弹性布局容器
              Flex({direction:this.flexDirection,justifyContent:this.justifyContent, alignItems : ItemAlign.Center}) {
                // Text：文本
                // 关键属性：elementStyle、fixedSize
                Text('1').id('flex_sample_text_18')
                  .elementStyle($r('app.color.background_orange'))
                  .fixedSize()
                // Text：文本
                // 关键属性：elementStyle、fixedSize
                Text('2').id('flex_sample_text_19')
                  .elementStyle($r('app.color.background_pink'))
                  .fixedSize()
                // Text：文本
                // 关键属性：elementStyle、fixedSize
                Text('3').id('flex_sample_text_20')
                  .elementStyle($r('app.color.background_orange'))
                  .fixedSize()
              }.id('flex_sample_flex_17')
            }.id('flex_sample_column_16')
            .justifyContent(FlexAlign.Center)
            .height(200)
            // JustifyContentControlPanel：JustifyContentControlPanel 自定义组件
            JustifyContentControlPanel({JustifyContent: $justifyContent})
              .id('flex_sample_justify_content_control_panel_21')
          }.id('flex_sample_column_15')
          .backgroundStyle()

          // alignItems
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column(){
            // Column：垂直布局容器
            // 关键属性：主轴对齐、高度
            Column(){
              // Flex：弹性布局容器
              // 关键属性：高度、宽度
              Flex({direction:this.flexDirection,alignItems:this.alignItems,justifyContent : FlexAlign.Center}) {
                // Text：文本
                // 关键属性：宽度、高度、elementStyle
                Text('1').id('flex_sample_text_25')
                  .width(this.flexDirection != FlexDirection.Row && this.flexDirection!= FlexDirection.RowReverse ? 30:'33%')
                  .height(30)
                  .elementStyle($r('app.color.background_orange'))
                // Text：文本
                // 关键属性：elementStyle、宽度、高度
                Text('2').id('flex_sample_text_26')
                  .elementStyle($r('app.color.background_pink'))
                  .width(this.flexDirection != FlexDirection.Row && this.flexDirection!= FlexDirection.RowReverse ? 40:'33%')
                  .height(this.flexDirection != FlexDirection.Row && this.flexDirection!= FlexDirection.RowReverse? 30: 40)
                // Text：文本
                // 关键属性：elementStyle、宽度、高度
                Text('3').id('flex_sample_text_27')
                  .elementStyle($r('app.color.background_orange'))
                  .width(this.flexDirection != FlexDirection.Row && this.flexDirection!= FlexDirection.RowReverse ? 50:'33%')
                  .height(this.flexDirection != FlexDirection.Row && this.flexDirection!= FlexDirection.RowReverse? 30: 50)
              }.id('flex_sample_flex_24')
              .height('100%')
              .width('100%')
            }.id('flex_sample_column_23')
            .justifyContent(FlexAlign.Center)
            .height(200)
            // AlignItemsControlPanel：AlignItemsControlPanel 自定义组件
            AlignItemsControlPanel({alignItems: $alignItems}).id('flex_sample_align_items_control_panel_28')
          }.id('flex_sample_column_22')
          .backgroundStyle()

          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column(){
            // Column：垂直布局容器
            // 关键属性：主轴对齐、高度
            Column(){
              // Flex：弹性布局容器
              // 关键属性：高度、宽度
              Flex({direction:this.flexDirection,justifyContent:FlexAlign.Start, alignItems : ItemAlign.Center,alignContent: this.alignContent,wrap:FlexWrap.Wrap}) {
                // Text：文本
                // 关键属性：elementStyle、alignContentDynamicSize
                Text('1').id('flex_sample_text_32')
                  .elementStyle($r('app.color.background_orange'))
                  .alignContentDynamicSize()
                // Text：文本
                // 关键属性：elementStyle、alignContentDynamicSize
                Text('2').id('flex_sample_text_33')
                  .elementStyle($r('app.color.background_pink'))
                  .alignContentDynamicSize()
                // Text：文本
                // 关键属性：elementStyle、alignContentDynamicSize
                Text('3').id('flex_sample_text_34')
                  .elementStyle($r('app.color.background_orange'))
                  .alignContentDynamicSize()
              }.id('flex_sample_flex_31')
              .height('100%')
              .width('100%')
            }.id('flex_sample_column_30')
            .justifyContent(FlexAlign.Center)
            .height(200)
            // AlignContentControlPanel：AlignContentControlPanel 自定义组件
            AlignContentControlPanel(
              {alignContent:$alignContent}
            ).id('flex_sample_align_content_control_panel_35')
          }.id('flex_sample_column_29')
          .backgroundStyle()
        }.id('flex_sample_column_4')
        .width('100%')
      }.id('flex_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 80 })
    }.id('flex_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}