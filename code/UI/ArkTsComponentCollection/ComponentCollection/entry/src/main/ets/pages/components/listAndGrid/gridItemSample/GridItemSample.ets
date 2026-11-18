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
 * @file entry/src/main/ets/pages/components/listAndGrid/gridItemSample/GridItemSample.ets
 * 文件职责：GridItemSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GridItemSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { PropertiesControlPanel } from './GridItemControlPanel';

@Extend(Column) function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.Start)
}

@Extend(Text) function itemStyle() {
  .width('100%')
  .height('100%')
  .textAlign(TextAlign.Center)
}

/**
 * GridItemSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct GridItemSample {
  // @State rowStart：组件内部状态
  @State rowStart: number = 0;

  // @State rowEnd：组件内部状态
  @State rowEnd: number = 0;

  // @State columnStart：组件内部状态
  @State columnStart: number = 0;

  // @State columnEnd：组件内部状态
  @State columnEnd: number = 0;

  // @State gridItemStyle：组件内部状态
  @State gridItemStyle: number = 0;
  private itemsText: string[] = [];

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    for (let i = 1; i < 26; i++) {
      this.itemsText.push(i.toString());
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.grid_item_title') }).id('grid_item_sample_title_bar_2')
        .flexGrow(0)
      // component
      // Column：垂直布局容器
      // 关键属性：内边距、外边距、backgroundStyle、高度、宽度、剩余空间放大
      Column() {
        // Grid：网格容器
        // 关键属性：rowsTemplate、columnsTemplate、列间距、行间距
        Grid() {
          ForEach(this.itemsText, (item: string, index: number) => {
            if (index === 0) {
              if (this.gridItemStyle === 0) {
                // GridItem：网格项
                // 关键属性：rowStart、rowEnd、columnStart、columnEnd、背景色
                GridItem({ style: GridItemStyle.NONE }) {
                  // Text：文本
                  // 关键属性：itemStyle
                  Text(item).id('grid_item_sample_text_6')
                    .itemStyle()
                }.id('grid_item_sample_grid_item_5')
                .rowStart(this.rowStart)
                .rowEnd(this.rowEnd)
                .columnStart(this.columnStart)
                .columnEnd(this.columnEnd)
                .backgroundColor($r('app.color.background_blue'))
              } else {
                // GridItem：网格项
                // 关键属性：rowStart、rowEnd、columnStart、columnEnd、背景色
                GridItem({ style: GridItemStyle.PLAIN }) {
                  // Text：文本
                  // 关键属性：itemStyle
                  Text(item).id('grid_item_sample_text_8')
                    .itemStyle()
                }.id('grid_item_sample_grid_item_7')
                .rowStart(this.rowStart)
                .rowEnd(this.rowEnd)
                .columnStart(this.columnStart)
                .columnEnd(this.columnEnd)
                .backgroundColor($r('app.color.background_blue'))
              }
            } else {
              // GridItem：网格项
              // 关键属性：背景色
              GridItem({ style: GridItemStyle.NONE }) {
                // Text：文本
                // 关键属性：itemStyle
                Text(item).id('grid_item_sample_text_10')
                  .itemStyle()
              }.id('grid_item_sample_grid_item_9')
              .backgroundColor($r('app.color.background_blue'))
            }
          })
        }.id('grid_item_sample_grid_4')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
      }.id('grid_item_sample_column_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 20 })
      .backgroundStyle()
      .height(200)
      .width('100%')
      .flexGrow(0)

      // Scroll：滚动容器
      // 关键属性：剩余空间放大、高度、外边距
      Scroll() {
        // 控制面板
        // Column：垂直布局容器
        // 关键属性：主轴对齐、宽度、高度
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.grid_item_introduction') })
            .id('grid_item_sample_introduction_title_13')
          // Column：垂直布局容器
          // 关键属性：backgroundStyle
          Column() {
            // PropertiesControlPanel：PropertiesControlPanel 自定义组件
            PropertiesControlPanel({
              rowStart: $rowStart,
              rowEnd: $rowEnd,
              columnStart: $columnStart,
              columnEnd: $columnEnd,
              gridItemStyle: $gridItemStyle
            }).id('grid_item_sample_properties_control_panel_15')
          }.id('grid_item_sample_column_14')
          .backgroundStyle()
        }.id('grid_item_sample_column_12')
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .height('100%')
      }.id('grid_item_sample_scroll_11')
      .flexGrow(1)
      .height(100)
      .margin({ bottom: 10 })
    }.id('grid_item_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}