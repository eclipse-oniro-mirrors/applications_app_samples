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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/stackSample/StackSample.ets
 * 文件职责：StackSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：StackSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel, ZIndexControlPanel } from './StackControlPanel'

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Text) function textStyle(width: number, height: number, backgroundColor: ResourceColor) {
  .height(height)
  .width(width)
  .backgroundColor(backgroundColor)
  .textAlign(TextAlign.End)
  .align(Alignment.BottomEnd)
}

/**
 * StackSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct StackSample {
  // @State alignContent：组件内部状态
  @State alignContent: Alignment = Alignment.TopStart;

  // @State zindex：组件内部状态
  @State zindex: number = 1

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.stack_title') }).id('stack_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距
      Scroll() {
        // Column：垂直布局容器
        Column() {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle、高度
          Column() {
            // Stack：层叠布局容器
            // 关键属性：高度、宽度、内容对齐
            Stack() {
              // Text：文本
              // 关键属性：textStyle、层级
              Text('Sub three').id('stack_sample_text_7')
                .textStyle(150, 150, $r('app.color.background_orange'))
                .zIndex(this.zindex)
              // Text：文本
              // 关键属性：textStyle、层级
              Text('Sub two').id('stack_sample_text_8')
                .textStyle(100, 100, $r('app.color.background_light_gray'))
                .zIndex(2)
              // Text：文本
              // 关键属性：textStyle、层级
              Text('Sub one').id('stack_sample_text_9')
                .textStyle(50, 50, $r('app.color.background_pink'))
                .zIndex(3)
            }.id('stack_sample_stack_6')
            .height('100%')
            .width('100%')
            .alignContent(this.alignContent)
          }.id('stack_sample_column_5')
          .backgroundStyle()
          .height(400)

          // Column：垂直布局容器
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.stack_introduction') })
              .id('stack_sample_introduction_title_11')
            // Column：垂直布局容器
            // 关键属性：backgroundStyle
            Column() {
              // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
              ArgumentsControlPanel({ alignContent: $alignContent }).id('stack_sample_arguments_control_panel_13')
            }.id('stack_sample_column_12')
            .backgroundStyle()
          }.id('stack_sample_column_10')

          // Column：垂直布局容器
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.stack_introduction_zindex') })
              .id('stack_sample_introduction_title_15')
            // Column：垂直布局容器
            // 关键属性：backgroundStyle
            Column() {
              // ZIndexControlPanel：ZIndexControlPanel 自定义组件
              ZIndexControlPanel({
                zindex: $zindex
              }).id('stack_sample_zindex_control_panel_17')
            }.id('stack_sample_column_16')
            .backgroundStyle()
          }.id('stack_sample_column_14')
        }.id('stack_sample_column_4')
      }.id('stack_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    }.id('stack_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}