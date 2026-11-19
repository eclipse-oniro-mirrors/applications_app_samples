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
 * @file entry/src/main/ets/pages/components/stackFlexAndGrid/gridContainerSample/GridContainerSample.ets
 * 文件职责：GridContainerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridContainerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsControlPanel } from './GridContainerControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Text) function elementStyle(color: Resource) {
  .height(50)
  .backgroundColor(color)
  .textAlign(TextAlign.Center)
}

/**
 * GridContainerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GridContainerSample {
  // @State sizeType：组件内部状态
  @State sizeType: SizeType = SizeType.Auto;

  // @State gutter：组件内部状态
  @State gutter: number = 10;

  // @State gridMargin：组件内部状态
  @State gridMargin: number = 10;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.gridcontainer_title') }).id('grid_container_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：内边距、外边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // GridContainer：GridContainer 自定义组件
            // 关键属性：宽度
            GridContainer({ columns: 12, sizeType: this.sizeType, gutter: this.gutter, margin: this.gridMargin }) {
              // Row：水平布局容器
              Row() {
                // Text：文本
                // 关键属性：useSizeType
                Text('1').id('grid_container_sample_text_8')
                  .useSizeType({
                    xs: { span: 6, offset: 0 },
                    sm: { span: 2, offset: 0 },
                    md: { span: 2, offset: 0 },
                    lg: { span: 2, offset: 0 }
                  })
                  .elementStyle($r('app.color.background_pink'))
                // Text：文本
                // 关键属性：useSizeType
                Text('2').id('grid_container_sample_text_9')
                  .useSizeType({
                    xs: { span: 2, offset: 6 },
                    sm: { span: 6, offset: 2 },
                    md: { span: 2, offset: 2 },
                    lg: { span: 2, offset: 2 }
                  })
                  .elementStyle($r('app.color.background_orange'))
                // Text：文本
                // 关键属性：useSizeType
                Text('3').id('grid_container_sample_text_10')
                  .useSizeType({
                    xs: { span: 2, offset: 8 },
                    sm: { span: 2, offset: 8 },
                    md: { span: 6, offset: 4 },
                    lg: { span: 2, offset: 4 }
                  })
                  .elementStyle($r('app.color.background_pink'))
                // Text：文本
                // 关键属性：useSizeType
                Text('4').id('grid_container_sample_text_11')
                  .useSizeType({
                    xs: { span: 2, offset: 10 },
                    sm: { span: 2, offset: 10 },
                    md: { span: 2, offset: 10 },
                    lg: { span: 6, offset: 6 }
                  })
                  .elementStyle($r('app.color.background_orange'))
              }.id('grid_container_sample_row_7')
            }.id('grid_container_sample_grid_container_6')
            .width('90%')
          }.id('grid_container_sample_column_5')
          .backgroundStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.gridcontainer_introdional_arguments') })
            .id('grid_container_sample_introduction_title_12')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // ArgumentsControlPanel：ArgumentsControlPanel 自定义组件
            ArgumentsControlPanel(
              {
                sizeType: $sizeType,
                gutter: $gutter,
                gridMargin: $gridMargin
              }
            ).id('grid_container_sample_arguments_control_panel_14')
          }.id('grid_container_sample_column_13')
          .backgroundStyle()
        }.id('grid_container_sample_column_4')
        .width('100%')
      }.id('grid_container_sample_scroll_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 80 })
    }.id('grid_container_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}